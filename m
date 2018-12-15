Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id C50557BE38
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Dec 2018 12:12:57 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id y185so1078037wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Dec 2018 04:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=0qx1NIIhGbcyrIFXTTB6LJNIGrDdhF1PT3ilm6wMFAk=;
	b=XOK/9096TLZMPwCSyRemWqwXs3N+wr3+fH3XzxAW4Ata9ZOmIkuGESaRTK7myGpqdk
	WYvO+H2F5DcbBRYWywI2oujn4OUTw8rcHuof4knqt8m8/e9F9a6ZziGJDhhl3qyn8B09
	ltzLW5tJ7yHxTm9yLccUKxtkEvH7gsY2d+js0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=0qx1NIIhGbcyrIFXTTB6LJNIGrDdhF1PT3ilm6wMFAk=;
	b=Q/2THjpA0KIPHcIxmjHy3dYjfjVUsgtcmJvl3/fR2z/mFZ6KqqlJkL4VhI46EZCvvR
	rfL9VzMHcIzMIbUI8N1K3ruXV3QUx/bPbV7kwikS3y5rNDaD6N4Jbr38KTOTuPaKsRWV
	/yRxF7VtoPrdQhLrOdO1qV3YtAFopoiIhp4/JFBVMfszYrKXJH2wKM7wujMXcwxGeNPq
	CeCaWNa+5SQ4f3b2VvAaN3EMd98VJO1BvueAR7DB4aRUa8cRWUXUigK6ZN7243UCu/a5
	U8c0ucNC3XA9q5Dbqe0VgDYefT2efeGVRkFHHKbn/A/29u8ublhEJfDblFJPBMOKnsC8
	7Z4w==
X-Gm-Message-State: AA+aEWZ709/TwmndTr3w4OW4sHUNtqtxER4eV9/A7Cjko0SfSECS9eKx
	/Dn2pEBVOl7gmmccut9ZUwEjtZMJDSTy4w==
X-Google-Smtp-Source: AFSGD/VxqKQ1fqanqKxt8UqhQ2o8lb/JCe7AzR5zFbxcCW06KVC+8usW2N1ioyazv3ACjyQqfqlUUg==
X-Received: by 2002:a1c:cec1:: with SMTP id e184mr6348791wmg.75.1544875978036; 
	Sat, 15 Dec 2018 04:12:58 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a12sm5850164wrm.45.2018.12.15.04.12.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 15 Dec 2018 04:12:57 -0800 (PST)
Message-ID: <766caeba2dcdfc09616e10e3105e3e0a3f84f194.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 15 Dec 2018 12:12:55 +0000
In-Reply-To: <1544608560-107439-1-git-send-email-hongzhi.song@windriver.com>
References: <1544608560-107439-1-git-send-email-hongzhi.song@windriver.com>
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
Subject: Re: [PATCH] kern-tools: modify grep pattern for tools/kconf_check
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
X-List-Received-Date: Sat, 15 Dec 2018 12:12:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-12-12 at 04:56 -0500, Hongzhi.Song wrote:
> The cmd line, <grep '^[  ]*\(menu\)*config '>, can't
> match all expect config options.
> 
> This is because that it is not always space after 'config'
> in kernel-source/*/.../Kconfig.
> e.g. "config  IP_VS_IPV6" in net/netfilter/ipvs/Kconfig
> 	    ^^
> 	These are not spaces.
> 
> So we should change the cmd to grep '^[  ]*\(menu\)*config\s'.
> 
> License-Update: <Since the S is changed from WORKDIR to WORKDIR/git
> for
> putting the patches to git/, the path of license should be changed
> too.>
> 
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>  ...0001-tool-kconf_check-modify-grep-pattern.patch | 37
> ++++++++++++++++++++++
>  .../kern-tools/kern-tools-native_git.bb            | 13 +++++---
>  2 files changed, 46 insertions(+), 4 deletions(-)
>  create mode 100644 meta/recipes-kernel/kern-tools/files/0001-tool-
> kconf_check-modify-grep-pattern.patch
> 
> diff --git a/meta/recipes-kernel/kern-tools/files/0001-tool-
> kconf_check-modify-grep-pattern.patch b/meta/recipes-kernel/kern-
> tools/files/0001-tool-kconf_check-modify-grep-pattern.patch
> new file mode 100644
> index 0000000..7f9c5a2
> --- /dev/null
> +++ b/meta/recipes-kernel/kern-tools/files/0001-tool-kconf_check-
> modify-grep-pattern.patch
> @@ -0,0 +1,37 @@
> +From 080a0662e235bb359ef06f6ba922f56a6040078f Mon Sep 17 00:00:00
> 2001
> +From: "Hongzhi.Song" <hongzhi.song@windriver.com>
> +Date: Tue, 11 Dec 2018 04:54:59 -0500
> +Subject: [PATCH] tool/kconf_check: modify grep pattern
> +
> +The cmd line, <grep '^[  ]*\(menu\)*config '>, can't
> +match all expect config options.
> +
> +This is because that it is not always space after 'config'
> +in kernel-source/*/.../Kconfig.
> +e.g. "config  IP_VS_IPV6" in net/netfilter/ipvs/Kconfig
> +
> +So we should change the cmd to grep '^[  ]*\(menu\)*config\s'.
> +
> +Upstream-Status: Submitted [
> https://lists.yoctoproject.org/pipermail/yocto/2018-December/043564.html
> ]
> +
> +Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> +---
> + tools/kconf_check | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/tools/kconf_check b/tools/kconf_check
> +index aa86180..20b49cd 100755
> +--- a/tools/kconf_check
> ++++ b/tools/kconf_check
> +@@ -241,7 +241,7 @@ find ${kernel_source} \
> + # known list of all Kconfig* files.  Again, must filter dups.
> + rm -f ${LOGDIR}/all.cfg
> + for i in `cat ${LOGDIR}/all.kcf` ; do
> +-    cat ${kernel_source}/$i | grep '^[ 	]*\(menu\)*config ' | \
> ++    cat ${kernel_source}/$i | grep '^[ 	]*\(menu\)*config\s' |
> \
> + 	awk '{print "CONFIG_"$2}' >> ${LOGDIR}/all.cfg
> + done
> + mv -f ${LOGDIR}/all.cfg ${LOGDIR}/all.cfg~
> +-- 
> +2.8.1
> +
> diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> index b353c21..682c726 100644
> --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> @@ -1,6 +1,6 @@
>  SUMMARY = "Tools for managing Yocto Project style branched kernels"
>  LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM =
> "file://git/tools/kgit;beginline=5;endline=9;md5=a6c2fa8aef1bda400e28
> 28845ba0d06c"
> +LIC_FILES_CHKSUM =
> "file://tools/kgit;beginline=5;endline=9;md5=a6c2fa8aef1bda400e282884
> 5ba0d06c"
>  
>  DEPENDS = "git-native"
>  
> @@ -10,8 +10,11 @@ PV = "0.2+git${SRCPV}"
>  
>  inherit native
>  
> -SRC_URI = "git://git.yoctoproject.org/yocto-kernel-tools.git"
> -S = "${WORKDIR}"
> +SRC_URI = "git://git.yoctoproject.org/yocto-kernel-tools.git \
> +           file://0001-tool-kconf_check-modify-grep-pattern.patch \
> +"
> +
> +S = "${WORKDIR}/git"
>  UPSTREAM_CHECK_COMMITS = "1"
>  
>  do_compile() { 
> @@ -19,6 +22,8 @@ do_compile() {
>  }
>  
>  do_install() {
> -	cd ${S}/git
> +	cd ${S}
>  	make DESTDIR=${D}${bindir} install
>  }
> +
> +FILESEXTRAPATH = "${THISDIR}/files"

I don't think you need to add this last line?

Also, since "we" maintain yocto-kernel-tools, can Bruce not apply this
or fix it upstream?

Cheers,

Richard



