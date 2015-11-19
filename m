Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E877C60110
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 11:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tAJBO2F9017652; Thu, 19 Nov 2015 11:24:02 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id uqqHzKorTOOo; Thu, 19 Nov 2015 11:24:02 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tAJBNl2U017618
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 19 Nov 2015 11:23:58 GMT
Message-ID: <1447932227.12500.121.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Crowe <mac@mcrowe.com>
Date: Thu, 19 Nov 2015 11:23:47 +0000
In-Reply-To: <1447932037-29676-1-git-send-email-mac@mcrowe.com>
References: <1447932037-29676-1-git-send-email-mac@mcrowe.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] image.py: avoid mkdir race when building multiple images
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
X-List-Received-Date: Thu, 19 Nov 2015 11:24:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-11-19 at 11:20 +0000, Mike Crowe wrote:
> If multiple images are being built simultaneously against the same
> sysroot then the call to os.makedirs in Image._write_wic_env can fail
> with:
> 
> File: '.../meta/lib/oe/image.py', lineno: 341, function: _write_wic_env
>      0337:        """
>      0338:        stdir = self.d.getVar('STAGING_DIR_TARGET', True)
>      0339:        outdir = os.path.join(stdir, 'imgdata')
>      0340:        if not os.path.exists(outdir):
>  *** 0341:            os.makedirs(outdir)
>      0342:        basename = self.d.getVar('IMAGE_BASENAME', True)
>      0343:        with open(os.path.join(outdir, basename) + '.env', 'w') as envf:
>      0344:            for var in self.d.getVar('WICVARS', True).split():
>      0345:                value = self.d.getVar(var, True)
> File: '/usr/lib/python2.7/os.py', lineno: 157, function: makedirs
>      0153:            if e.errno != errno.EEXIST:
>      0154:                raise
>      0155:        if tail == curdir:           # xxx/newdir/. exists if xxx/newdir exists
>      0156:            return
>  *** 0157:    mkdir(name, mode)
>      0158:
>      0159:def removedirs(name):
>      0160:    """removedirs(path)
>      0161:
> Exception: OSError: [Errno 17] File exists: '.../tmp-glibc/sysroots/cheetah/imgdata'
> 
> os.makedirs protects against racing on parent directories but not on the
> final part.
> 
> The sysroot directory will already exist so let's just try and make the
> imgdata directory and cope with the exception thrown if it already
> exists. This stops the race being fatal.
> 
> Once the directory has been created, there's no race on the actual file
> since the filename contains IMAGE_BASENAME.
> 
> Signed-off-by: Mike Crowe <mac@mcrowe.com>
> ---
>  meta/lib/oe/image.py | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/lib/oe/image.py b/meta/lib/oe/image.py
> index b9eb3de..8c797ec 100644
> --- a/meta/lib/oe/image.py
> +++ b/meta/lib/oe/image.py
> @@ -1,5 +1,6 @@
>  from oe.utils import execute_pre_post_process
>  import os
> +import errno
>  import subprocess
>  import multiprocessing
>  
> @@ -337,8 +338,16 @@ class Image(ImageDepGraph):
>          """
>          stdir = self.d.getVar('STAGING_DIR_TARGET', True)
>          outdir = os.path.join(stdir, 'imgdata')
> -        if not os.path.exists(outdir):
> -            os.makedirs(outdir)
> +        try:
> +            # This may race against another image being created, so
> +            # let's just try and create the directory and just ignore
> +            # the error if it already exists. The parent directory
> +            # will already exist so there's no benefit to using
> +            # os.makedirs (which is also subject to the race.)
> +            os.mkdir(outdir)
> +        except OSError as e:
> +            if e.errno != errno.EEXIST:
> +                raise
>          basename = self.d.getVar('IMAGE_BASENAME', True)
>          with open(os.path.join(outdir, basename) + '.env', 'w') as envf:
>              for var in self.d.getVar('WICVARS', True).split():

How about using bb.utils.mkdirhier() which already does this?

Cheers,

Richard



