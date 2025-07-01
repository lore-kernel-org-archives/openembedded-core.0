Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 847FBC83038
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 12:45:03 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.9839.1751373897821261309
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 05:44:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e0Zjz8/h;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6fadd3ad18eso55679096d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 05:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751373897; x=1751978697; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eChUWuBcfLzuWzpt7N2Xy0XwfVsV977MDlkl5idfQq0=;
        b=e0Zjz8/hOJ0kkgQnjZFi0EErGACDnVH35+OMJq+qNOSvDx3DsAa9L3esEf2TtznlY8
         4trmH0cJ90sBy+M9f7itgpJee59S5BrwvjAdDVYgT5axAi4exEGNnS2lF+5WQqE+HX2j
         L+o+AbNgNfCOz7ZK5bFCzzY2JCjVREUvulXw/lnn47RRyMGQz3oUZChdafbklAXpUtyY
         VDaDQKp3sUUgROIaxJrvqs1Fm55Bxc+zt6HqlQ6UjD/vCFHWn1MrNFGzE1NpiVwV2lev
         Yp57CK80Ukzq/OYd5fnT+gRtg4UJDkyS3ZhFf7aODAWugAUbT5nERM7KGW0kDIGYE2/O
         8m0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751373897; x=1751978697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eChUWuBcfLzuWzpt7N2Xy0XwfVsV977MDlkl5idfQq0=;
        b=kThROP4GOpuiNQbK3ne5GZMlsh7ljmnGv7XGpGurxYGEOxNFADsCWzkjFFY7r6UNGg
         9TcrHz+7mG+3ImPDYshNrUpubgG9QFSSH9GqCsP/+mudLrmWUdwMLnyevI5CLGum7GJy
         VjW7+k9wNVI3CWgG9iwZCGy21nrvvLkvs2MTL1RqlAb2EhCpI/vvHWHzBHibmOIxGhGp
         lP+XuBkbIEszc2WyUVQQ7+m7AMSfGLjq34fg289w23Cn7elSfZZMARw229rLN05Q24DQ
         jLCAetGiroVdouJOIcXIXc8Qyk0Uom+VUVMZpfv2XD4NAsPmyLuMAholOG59tXFQwcvP
         S0aQ==
X-Gm-Message-State: AOJu0YzYyf3iHC26Gq19JOq56aplUe6gxQbOB6DXYWy2AGOhngX6xPg0
	Z6tBIRVd8NVvq7Pyh3Gm9iXjp1vnqM+cIbR4QQMpqATGlhmlwg1x/xpn47h+RW2MbkSRlHpKILd
	D5CBSuZ8WmJRTOeB1DFFr2V7KIQ34W7bZf1ol
X-Gm-Gg: ASbGncuNdaqbITV7gBasfIQpFJTVukzOblYNdgfwYTF4bQI1NR/5UryZEIWr9Xiyf9q
	sxoUxcbTG9t/j36KPo0wOSbqCNjhFiHALC8p5WzBirBbQgBuaStKIW9EXspf2EmhR/R/rzJWVL1
	/7kTa1RP1tjhWU+EkfIBApp+ccsMidxynC6B6aoqSIqBcIvnAcRtzyUvWHaPVE5RuINZtIPYBSm
	AaqYw==
X-Google-Smtp-Source: AGHT+IGTctroYLJcRpUH1GDJo0hIiNd1nZE9mKY+PjBp+sp3RMEdzCfKUJL9a3uSMDf6kYIUinltF9Cd+Sa151Gmj3k=
X-Received: by 2002:a05:6214:1d2b:b0:6fd:ace:4cf3 with SMTP id
 6a1803df08f44-700037a88e9mr261754536d6.35.1751373896536; Tue, 01 Jul 2025
 05:44:56 -0700 (PDT)
MIME-Version: 1.0
References: <184E1CE45E458024.6792@lists.openembedded.org> <184E1D11132770D1.6792@lists.openembedded.org>
 <Z00QYS.ZUYPSA3HVF4P3@t-online.de>
In-Reply-To: <Z00QYS.ZUYPSA3HVF4P3@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 1 Jul 2025 14:44:45 +0200
X-Gm-Features: Ac12FXzS14AiaDGBpDUCHv7TELmLnxu50-WMhVmIwarBnebigjOQ8Cqb74St2BE
Message-ID: <CANNYZj-emZYc0iBL=67gh4g8B55d1hCYrhQnRcKftsGGucPU9Q@mail.gmail.com>
Subject: Re: [oe-core][PATCHv2] tcl: fix tclConfig.sh after UNPACKDIR change
To: f_l_k@t-online.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 12:45:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219568

I think it's possible to have a different header in sysroots and in
target packaging. Look for usage of SYSROOT_PREPROCESS_FUNCS in meta/.

Alex

On Tue, 1 Jul 2025 at 14:29, Markus Volk via lists.openembedded.org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> oops. That doesn't work either. Sorry for the confusion
>
> The problem I'm having:
>
> After applying v1 of this patch, the following command is successful
>
> bitbake -c cleansstate tcl tk && bitbake tk
>
> So I thought the problem was fixed. But after I created an image with thi=
s change, it showed the following
> , which can be fixed by v2 of this patch, but v2 breaks the tk build agai=
n
> ERROR: tcl-9.0. 1-r0 do_package_qa: QA problem: file /usr/lib/tclConfig.s=
h in package tcl-dev contains reference to TMPDIR [buildpaths]
> ERROR: tcl-9.0.1-r0 do_package_qa: Fatal QA errors found, task fails.
> ERROR: Log file of error saved in: /home/flk/poky/build-raspi/tmp/work/co=
rtexa72-poky-linux/tcl/9.0.1/temp/log.do_package_qa.415042
> ERROR: Task (/home/flk/poky/meta/recipes-devtools/tcltk/tcl_9.0.1.bb:do_p=
ackage_qa) failed with exit code '1'
>
> My conclusion is that we can't get things working properly with tclConfig=
.sh (without adding a buildpath error)
> I wonder if it would be better to omit the version in tcl includedir so t=
hat it would no longer change dynamically. e.g:
>
>
> From c2e5e1e4cb9fb1107db4632c4428607931a1b3b9 Mon Sep 17 00:00:00 2001
> From: Markus Volk <f_l_k@t-online.de>
> Date: Mon, 30 Jun 2025 22:03:17 +0200
> Subject: [PATCH] tcl: dont use version in includedir
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../tcltk/tcl/0004-tcl-update-the-header-location.patch | 8 ++++----
>  meta/recipes-devtools/tcltk/tcl_9.0.1.bb | 6 +++---
>  2 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/meta/recipes-devtools/tcltk/tcl/0004-tcl-update-the-header-l=
ocation.patch b/meta/recipes-devtools/tcltk/tcl/0004-tcl-update-the-header-=
location.patch
> index 50a4a27256..1bcdfb3c22 100644
> --- a/meta/recipes-devtools/tcltk/tcl/0004-tcl-update-the-header-location=
.patch
> +++ b/meta/recipes-devtools/tcltk/tcl/0004-tcl-update-the-header-location=
.patch
> @@ -34,7 +34,7 @@ index b5f9ab7..fbc87a2 100644
>
>   # Directory in which to install the include file tcl.h:
>  -INCLUDE_INSTALL_DIR =3D $(INSTALL_ROOT)$(includedir)
> -+INCLUDE_INSTALL_DIR =3D $(INSTALL_ROOT)$(includedir)/tcl$(VERSION)
> ++INCLUDE_INSTALL_DIR =3D $(INSTALL_ROOT)$(includedir)/tcl
>
>   # Path to the private tcl header dir:
>   PRIVATE_INCLUDE_DIR =3D @PRIVATE_INCLUDE_DIR@
> @@ -47,7 +47,7 @@ index 43ec7e4..19524d1 100644
>
>   test -z "$TCL_LIBRARY" && TCL_LIBRARY=3D'$(libdir)/tcl$(VERSION)'
>  -PRIVATE_INCLUDE_DIR=3D'$(includedir)'
> -+PRIVATE_INCLUDE_DIR=3D'$(includedir)/tcl$(VERSION)'
> ++PRIVATE_INCLUDE_DIR=3D'$(includedir)/tcl'
>   HTML_DIR=3D'$(DISTDIR)/html'
>
>   # Note: in the following variable, it's important to use the absolute
> @@ -56,7 +56,7 @@ index 43ec7e4..19524d1 100644
>
>   # Install time header dir can be set via --includedir
>  -eval "TCL_INCLUDE_SPEC=3D\"-I${includedir}\""
> -+eval "TCL_INCLUDE_SPEC=3D\"-I${includedir}/tcl${VERSION}\""
> ++eval "TCL_INCLUDE_SPEC=3D\"-I${includedir}/tcl\""
>
>   #----------------------------------------------------------------------=
--
>   # tclConfig.sh refers to this by a different name
> @@ -69,7 +69,7 @@ index 9c6da82..8aa5ae8 100644
>   exec_prefix=3D@exec_prefix@
>   libdir=3D@libdir@
>  -includedir=3D@includedir@
> -+includedir=3D@includedir@/tcl@PACKAGE_VERSION@
> ++includedir=3D@includedir@/tcl
>   libfile=3D@TCL_LIB_FILE@
>
>   Name: Tool Command Language
> diff --git a/meta/recipes-devtools/tcltk/tcl_9.0.1.bb b/meta/recipes-devt=
ools/tcltk/tcl_9.0.1.bb
> index 70aa9b606c..bafea067ed 100644
> --- a/meta/recipes-devtools/tcltk/tcl_9.0.1.bb
> +++ b/meta/recipes-devtools/tcltk/tcl_9.0.1.bb
> @@ -51,13 +51,13 @@ do_install() {
>   ln -sf ./tclsh${VER} ${D}${bindir}/tclsh
>   ln -sf tclsh9.0 ${D}${bindir}/tclsh${VER}
>   sed -i "s;-L${B};-L${STAGING_LIBDIR};g" tclConfig.sh
> - sed -i "s;'${WORKDIR};'${STAGING_INCDIR};g" tclConfig.sh
> + sed -i "s;'${WORKDIR};'${STAGING_INCDIR}/tcl;g" tclConfig.sh
>   install -d ${D}${bindir_crossscripts}
>   install -m 0755 tclConfig.sh ${D}${bindir_crossscripts}
>   install -m 0755 tclConfig.sh ${D}${libdir}
>   for dir in compat generic unix; do
> - install -d ${D}${includedir}/${BPN}${VER}/$dir
> - install -m 0644 ${S}/$dir/*.h ${D}${includedir}/${BPN}${VER}/$dir/
> + install -d ${D}${includedir}/${BPN}/$dir
> + install -m 0644 ${S}/$dir/*.h ${D}${includedir}/${BPN}/$dir/
>   done
>  }
>
> --
> 2.49.0
>
>
> I have seen that debian also installs headers in /usr/include/tcl and we =
could then set includedir in tk.bb
> like this without having to deal with dynamically changing directory:
>
> EXTRA_OEMAKE +=3D "TCLDIR=3D${STAGING_INCDIR}/tcl"
>
> As this is invasive, I wanted to ask whether there are any objections and=
 whether this would be a possible solution at all?
>
>
>
> On Tue, Jul 1 2025 at 13:27:34 +02:00:00, Markus Volk via lists.openembed=
ded.org <f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> add the sed command as a new line. Editing ${WORKDIR} is still required
>
> On Tue, Jul 1 2025 at 13:24:15 +02:00:00, Markus Volk via lists.openembed=
ded.org <f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> Add a sed command that edits tclConfig.sh. This is needed so that tk in m=
eta-oe is capable of reading the required header file Signed-off-by: Markus=
 Volk <f_l_k@t-online.de> --- meta/recipes-devtools/tcltk/tcl_9.0.1.bb | 1 =
+ 1 file changed, 1 insertion(+) diff --git a/meta/recipes-devtools/tcltk/t=
cl_9.0.1.bb b/meta/recipes-devtools/tcltk/tcl_9.0.1.bb index 70aa9b606c..15=
f03b6c9e 100644 --- a/meta/recipes-devtools/tcltk/tcl_9.0.1.bb +++ b/meta/r=
ecipes-devtools/tcltk/tcl_9.0.1.bb @@ -52,6 +52,7 @@ do_install() { ln -sf =
tclsh9.0 ${D}${bindir}/tclsh${VER} sed -i "s;-L${B};-L${STAGING_LIBDIR};g" =
tclConfig.sh sed -i "s;'${WORKDIR};'${STAGING_INCDIR};g" tclConfig.sh + sed=
 -i "s;'${UNPACKDIR};'${STAGING_INCDIR};g" tclConfig.sh install -d ${D}${bi=
ndir_crossscripts} install -m 0755 tclConfig.sh ${D}${bindir_crossscripts} =
install -m 0755 tclConfig.sh ${D}${libdir}
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#219567): https://lists.openembedded.org/g/openembedde=
d-core/message/219567
> Mute This Topic: https://lists.openembedded.org/mt/113925455/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

