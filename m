Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4CBEC7422C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 11:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7UBP1Es005310; Sun, 30 Aug 2015 12:25:01 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 2IXjWc-Sn3UF; Sun, 30 Aug 2015 12:25:00 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7UBOmM8005285
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 30 Aug 2015 12:24:59 +0100
Message-ID: <1440933888.32588.68.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Date: Sun, 30 Aug 2015 12:24:48 +0100
In-Reply-To: <db48ab408d16d06aa46cbae805d88217f24f64c2.1440071413.git.ed.bartosh@linux.intel.com>
References: <cover.1440071413.git.ed.bartosh@linux.intel.com>
	<db48ab408d16d06aa46cbae805d88217f24f64c2.1440071413.git.ed.bartosh@linux.intel.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/17] image.py: write bitbake variables to .env file
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 30 Aug 2015 11:25:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-08-20 at 14:56 +0300, Ed Bartosh wrote:
> Write set of bitbake variables associated with the image into
> build/tmp/sysroots/<machine>/imagedata/<image>.env
> 
> This is needed for wic to be able to get bitbake variables without
> running 'bitbake -e'.

I've just realised what this code is doing, its writing out nearly the
whole data store :(

Is there no way we can know which variables wic may later need? I'm not
keen at all to see an iteration of d.keys() and the list of things not
to write out looks arbitrary at best :(

We need to find a better way of doing this...

I'd also prefer we only do this if we know we're going to be writing a
wic image.

Cheers,

Richard


> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  meta/lib/oe/image.py | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/meta/lib/oe/image.py b/meta/lib/oe/image.py
> index 699c30f..a7fdefa 100644
> --- a/meta/lib/oe/image.py
> +++ b/meta/lib/oe/image.py
> @@ -321,6 +321,27 @@ class Image(ImageDepGraph):
>  
>          return image_cmd_groups
>  
> +    def _write_env(self):
> +        """
> +        Write environment variables
> +        to tmp/sysroots/<machine>/imgdata/<image>.env
> +        """
> +        stdir = self.d.getVar('STAGING_DIR_TARGET', True)
> +        outdir = os.path.join(stdir, 'imgdata')
> +        if not os.path.exists(outdir):
> +            os.makedirs(outdir)
> +        basename = self.d.getVar('IMAGE_BASENAME', True)
> +        with open(os.path.join(outdir, basename) + '.env', 'w') as envf:
> +            for var in sorted(self.d.keys()):
> +                # filter out as much as we can to reduce file size
> +                if var.startswith('_') or var.startswith('BB_') \
> +                   or not var.isupper() or self.d.getVarFlag(var, "func") \
> +                   or var in ('BBINCLUDED', 'SRCPV', 'MIRRORS'):
> +                    continue
> +                value = self.d.getVar(var, True)
> +                if value:
> +                    envf.write('%s="%s"\n' % (var, value.strip()))
> +
>      def create(self):
>          bb.note("###### Generate images #######")
>          pre_process_cmds = self.d.getVar("IMAGE_PREPROCESS_COMMAND", True)
> @@ -332,6 +353,8 @@ class Image(ImageDepGraph):
>  
>          image_cmd_groups = self._get_imagecmds()
>  
> +        self._write_env()
> +
>          for image_cmds in image_cmd_groups:
>              # create the images in parallel
>              nproc = multiprocessing.cpu_count()
> -- 
> 2.1.4
> 



