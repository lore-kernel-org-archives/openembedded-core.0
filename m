Return-Path: <stefan@agner.ch>
X-Greylist: delayed 432 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 25 Apr 2019 13:16:01 UTC
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 0CABC71BEE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2019 13:16:01 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 54EEB5C0519;
	Thu, 25 Apr 2019 15:08:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1556197729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=ckKWCSgVk+FieidVwAHPDnir1YYOihA1zAZQtcuqLic=;
	b=ncrqlmseRT5pebGEPo1I0DecUaxfTYD4tlGcM9aONGVKs3GIMIIopSvE/07jBiLWfGEb2Y
	SGzojTtE2Map3FxpB8d3JJVe5V7oekKWtBGBIdKsQantyxLkDWOvE+LskarQ+fopMRyhLZ
	Vf2J5F32mthFWFytU1IP9vy67V2HZ80=
MIME-Version: 1.0
Date: Thu, 25 Apr 2019 15:08:49 +0200
From: Stefan Agner <stefan@agner.ch>
To: liu.ming50@gmail.com, akuster808@gmail.com
In-Reply-To: <1554474135-15120-1-git-send-email-liu.ming50@gmail.com>
References: <1554474135-15120-1-git-send-email-liu.ming50@gmail.com>
Message-ID: <21adec79d8488f51178cda200d57b018@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.7
Cc: stefan.agner@toradex.com, openembedded-core@lists.openembedded.org
Subject: Re: [thud][PATCH] opkg-utils: backport a patch to fix a sstate timestamp issue
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
X-List-Received-Date: Thu, 25 Apr 2019 13:16:02 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 05.04.2019 16:22, liu.ming50@gmail.com wrote:
> From: Ming Liu <liu.ming50@gmail.com>
> 
> When using sstate, two parallel builds can produce two packages
> with the same mtime but different checksums. When later one of
> those two builds fetches the others ipk, the package index does
> not get udpated properly (since mtime matches). This ends up with
> messages such as:
>   Downloading file:/../tmp/work/../image/...ipk.
>   Removing corrupt package file /../sysroot/../var/cache/opkg/volatile/...ipk
> 
> However, in that case, ctime is different. Use ctime instead of
> mtime to prevent failures like this.

FWIW,
Acked-by Stefan Agner <stefan.agner@toradex.com>

I fixed this in master, and it actually helps us resolving issues we see
on CI on thud branch.

--
Stefan

> 
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  ...pkg-make-index-use-ctime-instead-of-mtime.patch | 59 ++++++++++++++++++++++
>  .../opkg-utils/opkg-utils_0.3.6.bb                 |  1 +
>  2 files changed, 60 insertions(+)
>  create mode 100644
> meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-make-index-use-ctime-instead-of-mtime.patch
> 
> diff --git
> a/meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-make-index-use-ctime-instead-of-mtime.patch
> b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-make-index-use-ctime-instead-of-mtime.patch
> new file mode 100644
> index 0000000..19778ac
> --- /dev/null
> +++
> b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-make-index-use-ctime-instead-of-mtime.patch
> @@ -0,0 +1,59 @@
> +From 0cd38bb1bdcdbfc091014a1f39d015a1586a33e6 Mon Sep 17 00:00:00 2001
> +From: Stefan Agner <stefan.agner@toradex.com>
> +Date: Fri, 19 Oct 2018 17:38:21 +0200
> +Subject: [PATCH] opkg-make-index: use ctime instead of mtime
> +
> +Upstream-Status: Backport
> +
> +When using sstate, two parallel builds can produce two packages
> +with the same mtime but different checksums. When later one of
> +those two builds fetches the others ipk, the package index does
> +not get udpated properly (since mtime matches). This ends up with
> +messages such as:
> +  Downloading file:/../tmp/work/../image/...ipk.
> +  Removing corrupt package file /../sysroot/../var/cache/opkg/volatile/...ipk
> +
> +However, in that case, ctime is different. Use ctime instead of
> +mtime to prevent failures like this.
> +
> +Suggested-by: Khem Raj <raj.khem@gmail.com>
> +Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> +Acked-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> +Acked-by: Khem Raj <raj.khem@gmail.com>
> +Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
> +Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> +---
> + opkg-make-index | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/opkg-make-index b/opkg-make-index
> +index 3227fc0..db7bf64 100755
> +--- a/opkg-make-index
> ++++ b/opkg-make-index
> +@@ -115,12 +115,12 @@ for abspath in files:
> +      pkg = None
> +      fnameStat = os.stat(abspath)
> +      if filename in old_pkg_hash:
> +-          if filename in pkgsStamps and int(fnameStat.st_mtime) ==
> pkgsStamps[filename]:
> ++          if filename in pkgsStamps and int(fnameStat.st_ctime) ==
> pkgsStamps[filename]:
> +             if (verbose):
> +                sys.stderr.write("Found %s in Packages\n" % (filename,))
> +             pkg = old_pkg_hash[filename]
> +           else:
> +-               sys.stderr.write("Found %s in Packages, but mtime
> differs - re-reading\n" % (filename,))
> ++               sys.stderr.write("Found %s in Packages, but ctime
> differs - re-reading\n" % (filename,))
> + 
> +      if not pkg:
> +           if (verbose):
> +@@ -137,7 +137,7 @@ for abspath in files:
> +      else:
> +           old_filename = ""
> +      s = packages.add_package(pkg, opt_a)
> +-     pkgsStamps[filename] = fnameStat.st_mtime
> ++     pkgsStamps[filename] = fnameStat.st_ctime
> +      if s == 0:
> +           if old_filename:
> +                # old package was displaced by newer
> +-- 
> +2.7.4
> +
> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.6.bb
> b/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.6.bb
> index 4c41774..41cf11c 100644
> --- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.6.bb
> +++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.6.bb
> @@ -14,6 +14,7 @@ SRC_URI =
> "http://git.yoctoproject.org/cgit/cgit.cgi/${BPN}/snapshot/${BPN}-${PV
>             file://threaded-xz.patch \
>             file://pigz.patch \
>             file://0001-update-alternatives-Fix-link-relocation-support.patch \
> +           file://0001-opkg-make-index-use-ctime-instead-of-mtime.patch \
>  "
>  SRC_URI_append_class-native = " file://tar_ignore_error.patch"
>  UPSTREAM_CHECK_URI =
> "http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/refs/"
> -- 
> 2.7.4

