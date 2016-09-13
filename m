Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 505B2771CF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2016 00:17:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8D0HlP3029640
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 12 Sep 2016 17:17:47 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.232) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 12 Sep 2016 17:17:46 -0700
To: Andre McCurdy <armccurdy@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <1473721254-9610-1-git-send-email-armccurdy@gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <aeae8af5-a8c6-f894-d6e5-c78beb993a7f@windriver.com>
Date: Mon, 12 Sep 2016 19:17:45 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1473721254-9610-1-git-send-email-armccurdy@gmail.com>
Subject: Re: [PATCH] rootfs.py: support absolute paths in IMAGE_DEVICE_TABLES
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
X-List-Received-Date: Tue, 13 Sep 2016 00:17:50 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 9/12/16 6:00 PM, Andre McCurdy wrote:
> Paths relative to BBPATH are fine if device table files are always
> static and contained somewhere within a meta layer. However if device
> tables are created dynamically, they will be located somewhere within
> ${TMPDIR} and most conveniently referenced via an absolute path.
> 
> The legacy IMAGE_DEVICE_TABLE variable supported an absolute path,
> therefore make IMAGE_DEVICE_TABLES support absolute paths too, to
> avoid users who need dynamic device table files being dependent on
> the legacy variable.
> 
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/lib/oe/rootfs.py | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index a348b97..32cce64 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -352,8 +352,8 @@ class Rootfs(object, metaclass=ABCMeta):
>      """
>      Create devfs:
>      * IMAGE_DEVICE_TABLE is the old name to an absolute path to a device table file
> -    * IMAGE_DEVICE_TABLES is a new name for a file, or list of files, seached
> -      for in the BBPATH
> +    * IMAGE_DEVICE_TABLES is the new name for a file, or list of files, which may be
> +      either absolute paths or paths relative to BBPATH.
>      If neither are specified then the default name of files/device_table-minimal.txt
>      is searched for in the BBPATH (same as the old version.)
>      """
> @@ -367,7 +367,10 @@ class Rootfs(object, metaclass=ABCMeta):
>              if devtables is None:
>                  devtables = 'files/device_table-minimal.txt'
>              for devtable in devtables.split():
> -                devtable_list.append("%s" % bb.utils.which(self.d.getVar('BBPATH', True), devtable))
> +                if os.path.isabs(devtable):
> +                    devtable_list.append(devtable)
> +                else:
> +                    devtable_list.append("%s" % bb.utils.which(self.d.getVar('BBPATH', True), devtable))

I'm wondering if maybe this is a bug in "bb.utils.which", I thought it would
return back -- in the case of an absolute path -- if the thing existed or not,
otherwise would search the BBPATH.  (I'm using the command line version of
'which' as my behavioral thinking.)

If it is an issue, then it would need a fix in bitbake, and I believe the
existing code should then work.

(Asking about the behavior on the bitbake list might be worth while in this case.)

>  
>          for devtable in devtable_list:
>              self._exec_shell_cmd(["makedevs", "-r",
> 


