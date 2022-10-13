Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D074CC433FE
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 00:48:38 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web09.2283.1665622117490488728
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Oct 2022 17:48:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Bo2Gbs50;
 spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id r15-20020a4abf0f000000b004761c7e6be1so325993oop.9
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 17:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iid4aLe+I8yqv1K+KVO1nCnSHpyYkJhDD/wUq+Nlcps=;
        b=Bo2Gbs50+65VnSFEZBNdECQO925He9cykkwUpx/pDB5A2nptunKpXMH86F20fyHhz4
         D9vwVosAD2TcluhdRuXsRL0WtiI3eNPuFSEdHnUntl/KWxZEj1u3hqDUgkwY59ehPtVu
         eFBJbIZlyeYaQankwJFzBYfXXGhVMgQUtuDaSOKYOEWJl8TBMI0zqoOucJANw43ac25U
         QHVCObHQYJKfYw/bZSmVpLWsLSeAlCKdxSsEAAW55ziFh/SQT1FkLjk52tm3UKYxwhip
         u3wFsB2fVR+LENbsj1GB2MLdZuUSZrXxnrpKx/Yzzua2xfpG1T3duIrC4WigiJ555+ME
         SSdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iid4aLe+I8yqv1K+KVO1nCnSHpyYkJhDD/wUq+Nlcps=;
        b=Ysk0Nh1m5oJzdoiLvUfvieHfzqu3X655mlhGkCqKNmC3BsH0WKbmbBXTUOcPLssome
         CEdqgbCj5X1bqPgW2LKRGhE+4hMBxXYb0gynscC4tiw+D7N2n3oqBA6y41Devjx7mbXX
         AGGtEaIuQeJOJNtfR+7zVsJZwPWV+KfLmmH5/00FVs8UQLzrw58UUpTgKu1yXCpZwsCf
         Psn3WbXPYRtC0oCdVW4V3uGpRwxRz4ypg+gQxIrumqOOWVK4Nz/wuxLc9RY1nitE6jdD
         P07OzZ3LFlnqnh6Id5KhLJl8UaPzEMDnMhYM5pF570FnzTgL/9R6dTZyXt8h1c4I1Q97
         JKZQ==
X-Gm-Message-State: ACrzQf03LvBFNW0fjWd+S9jLPxokg3yqoOODsKoKfA3555tamkxmi+FG
	JrIFCcGBrskEE74r7U61m8AQgho9xT7qZCsjcJ4=
X-Google-Smtp-Source: AMsMyM7Tk35+tAPQDUtNH8wm7swHsXrRm05UcStX5MGyCLri3EKPXUzAp+o7ePOSjz7cD9qJ8RZLygnlvloNO4l/o44=
X-Received: by 2002:a9d:61d6:0:b0:661:c1ad:848f with SMTP id
 h22-20020a9d61d6000000b00661c1ad848fmr1727902otk.111.1665622116385; Wed, 12
 Oct 2022 17:48:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220930084823.2772546-1-changqing.li@windriver.com>
 <16B6F015-6AEB-4374-B680-21AA22A1131C@arm.com> <171C0695F339EA05.22215@lists.openembedded.org>
 <a7974d2c-b6b9-64bb-6b97-2e5de6577ce7@windriver.com>
In-Reply-To: <a7974d2c-b6b9-64bb-6b97-2e5de6577ce7@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Oct 2022 17:48:25 -0700
Message-ID: <CAMKF1sqTRoiC+EYoksBqYM5O62TnDDmBpkxNuR9pN35DGHn4bA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] fix close_range fails unexpectedly in
 unprivileged process
To: Changqing Li <changqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Ross Burton <Ross.Burton@arm.com>
Content-Type: multipart/alternative; boundary="00000000000093c68b05eadfde31"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 00:48:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171679

--00000000000093c68b05eadfde31
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 12, 2022 at 5:41 PM Changqing Li <changqing.li@windriver.com>
wrote:

>
> On 10/8/22 15:13, Changqing Li wrote:
>
> On 9/30/22 17:50, Ross Burton wrote:
>
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Yeah, this is a Docker issue. Fix your docker.
>
> Ross
>
> Hi,
>
> I know this is an docker issue, but this will block yocto build in old
> docker. I noticed we already
>
> have an local patch for glibc to fix similar issue. So, maybe this patch
> is also need.
>
>
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/gli=
bc/glibc/0023-fix-create-thread-failed-in-unprivileged-process-BZ-.patch
> <https://urldefense.com/v3/__https://git.openembedded.org/openembedded-co=
re/tree/meta/recipes-core/glibc/glibc/0023-fix-create-thread-failed-in-unpr=
ivileged-process-BZ-.patch__;!!AjveYdw8EvQ!eYLVLZ08i44b_x9_dIbN2TSPyxAcGhsm=
fzSKGDqz016oV_Ho6qPIx5-JFpq4dQFyePJxNDxvfYRzGfProOLpzc_lrbDVeMs$>
>
> BRs
>
>
These patches are addressing a corner case for supported systems and the
patches are not backports and it=E2=80=99s perhaps better to keep them loca=
l
Infact  I would suggest to send a patch to remove the above patch from core
glibc recipe instead

> Changqing
>
> ping
>
> On 30 Sep 2022, at 09:48, Changqing Li via lists.openembedded.org <https:=
//urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!eYLVLZ0=
8i44b_x9_dIbN2TSPyxAcGhsmfzSKGDqz016oV_Ho6qPIx5-JFpq4dQFyePJxNDxvfYRzGfProO=
Lpzc_lHw1qYsY$> <changqing.li=3Dwindriver.com@lists.openembedded.org> <chan=
gqing.li=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Changqing Li <changqing.li@windriver.com> <changqing.li@windriver.c=
om>
>
> After commit [1], start a unprivileged container (docker run without --pr=
ivileged),
> close file will fail.
>
> This is actually an docker issue, see [2]. But this issue will
> block yocto build in docker with glibc2.35+. so add this local patch.
>
> [1] https://gitlab.gnome.org/GNOME/glib/-/commit/ce04a124040be091407e0702=
80d86ca810bacb8c <https://urldefense.com/v3/__https://gitlab.gnome.org/GNOM=
E/glib/-/commit/ce04a124040be091407e070280d86ca810bacb8c__;!!AjveYdw8EvQ!eY=
LVLZ08i44b_x9_dIbN2TSPyxAcGhsmfzSKGDqz016oV_Ho6qPIx5-JFpq4dQFyePJxNDxvfYRzG=
fProOLpzc_lUw7m6AI$>
> [2] https://github.com/moby/moby/issues/43595 <https://urldefense.com/v3/=
__https://github.com/moby/moby/issues/43595__;!!AjveYdw8EvQ!eYLVLZ08i44b_x9=
_dIbN2TSPyxAcGhsmfzSKGDqz016oV_Ho6qPIx5-JFpq4dQFyePJxNDxvfYRzGfProOLpzc_lfE=
8TzmQ$>
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com> <changqing.li@wi=
ndriver.com>
> ---
> ...fails-unexpectedly-in-unprivileged-p.patch | 46 +++++++++++++++++++
> meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb <https://urldefense.com/v3/=
__http://glib-2.0_2.72.3.bb__;!!AjveYdw8EvQ!eYLVLZ08i44b_x9_dIbN2TSPyxAcGhs=
mfzSKGDqz016oV_Ho6qPIx5-JFpq4dQFyePJxNDxvfYRzGfProOLpzc_lPpFuHiw$> |  1 +
> 2 files changed, 47 insertions(+)
> create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-fix-close_ran=
ge-fails-unexpectedly-in-unprivileged-p.patch
>
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-fix-close_range-fai=
ls-unexpectedly-in-unprivileged-p.patch b/meta/recipes-core/glib-2.0/glib-2=
.0/0001-fix-close_range-fails-unexpectedly-in-unprivileged-p.patch
> new file mode 100644
> index 0000000000..213ee7b11f
> --- /dev/null
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-fix-close_range-fails-unex=
pectedly-in-unprivileged-p.patch
> @@ -0,0 +1,46 @@
> +From 0fb283b3b1e3b4958b985804cbc40b7bff8b0e65 Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com> <changqing.li@windriver.=
com>
> +Date: Fri, 30 Sep 2022 08:29:41 +0000
> +Subject: [PATCH] fix close_range fails unexpectedly in unprivileged proc=
ess
> +
> +After change [1], start a unprivileged container (docker run without --p=
rivileged),
> +close file may fail.
> +
> +This is actually an docker issue, see [2]. But this issue will
> +block yocto build in docker with glibc2.35+. so add this local patch.
> +
> +[1] https://gitlab.gnome.org/GNOME/glib/-/commit/ce04a124040be091407e070=
280d86ca810bacb8c <https://urldefense.com/v3/__https://gitlab.gnome.org/GNO=
ME/glib/-/commit/ce04a124040be091407e070280d86ca810bacb8c__;!!AjveYdw8EvQ!e=
YLVLZ08i44b_x9_dIbN2TSPyxAcGhsmfzSKGDqz016oV_Ho6qPIx5-JFpq4dQFyePJxNDxvfYRz=
GfProOLpzc_lUw7m6AI$>
> +[2] https://github.com/moby/moby/issues/43595 <https://urldefense.com/v3=
/__https://github.com/moby/moby/issues/43595__;!!AjveYdw8EvQ!eYLVLZ08i44b_x=
9_dIbN2TSPyxAcGhsmfzSKGDqz016oV_Ho6qPIx5-JFpq4dQFyePJxNDxvfYRzGfProOLpzc_lf=
E8TzmQ$>
> +
> +Upstream-Status: Inappropriate [Rejected by upstream]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com> <changqing.li@w=
indriver.com>
> +---
> + glib/gspawn.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/glib/gspawn.c b/glib/gspawn.c
> +index 0a2cbe5..83553a1 100644
> +--- a/glib/gspawn.c
> ++++ b/glib/gspawn.c
> +@@ -1544,7 +1544,7 @@ safe_fdwalk_set_cloexec (int lowfd)
> +    * fall back to safe_fdwalk(). Handle EINVAL in case `CLOSE_RANGE_CLO=
EXEC`
> +    * is not supported. */
> +   int ret =3D close_range (lowfd, G_MAXUINT, CLOSE_RANGE_CLOEXEC);
> +-  if (ret =3D=3D 0 || !(errno =3D=3D ENOSYS || errno =3D=3D EINVAL))
> ++  if (ret =3D=3D 0 || !(errno =3D=3D ENOSYS || errno =3D=3D EINVAL || e=
rrno =3D=3D EPERM))
> +     return ret;
> + #endif  /* HAVE_CLOSE_RANGE */
> +   return safe_fdwalk (set_cloexec, GINT_TO_POINTER (lowfd));
> +@@ -1597,7 +1597,7 @@ safe_closefrom (int lowfd)
> +    * Handle ENOSYS in case it=E2=80=99s supported in libc but not the k=
ernel; if so,
> +    * fall back to safe_fdwalk(). */
> +   int ret =3D close_range (lowfd, G_MAXUINT, 0);
> +-  if (ret =3D=3D 0 || errno !=3D ENOSYS)
> ++  if (ret =3D=3D 0 || !(errno =3D=3D ENOSYS || errno =3D=3D EPERM))
> +     return ret;
> + #endif  /* HAVE_CLOSE_RANGE */
> +   return safe_fdwalk (close_func, GINT_TO_POINTER (lowfd));
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb <https://urlde=
fense.com/v3/__http://glib-2.0_2.72.3.bb__;!!AjveYdw8EvQ!eYLVLZ08i44b_x9_dI=
bN2TSPyxAcGhsmfzSKGDqz016oV_Ho6qPIx5-JFpq4dQFyePJxNDxvfYRzGfProOLpzc_lPpFuH=
iw$> b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb <https://urldefense.co=
m/v3/__http://glib-2.0_2.72.3.bb__;!!AjveYdw8EvQ!eYLVLZ08i44b_x9_dIbN2TSPyx=
AcGhsmfzSKGDqz016oV_Ho6qPIx5-JFpq4dQFyePJxNDxvfYRzGfProOLpzc_lPpFuHiw$>
> index dd1ea508d2..bbaacc64a4 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb <https://urldefense.c=
om/v3/__http://glib-2.0_2.72.3.bb__;!!AjveYdw8EvQ!eYLVLZ08i44b_x9_dIbN2TSPy=
xAcGhsmfzSKGDqz016oV_Ho6qPIx5-JFpq4dQFyePJxNDxvfYRzGfProOLpzc_lPpFuHiw$>
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb <https://urldefense.c=
om/v3/__http://glib-2.0_2.72.3.bb__;!!AjveYdw8EvQ!eYLVLZ08i44b_x9_dIbN2TSPy=
xAcGhsmfzSKGDqz016oV_Ho6qPIx5-JFpq4dQFyePJxNDxvfYRzGfProOLpzc_lPpFuHiw$>
> @@ -16,6 +16,7 @@ SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV=
}.tar.xz \
>            file://0001-Do-not-write-bindir-into-pkg-config-files.patch \
>            file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
>            file://0001-gio-tests-resources.c-comment-out-a-build-host-onl=
y-.patch \
> +           file://0001-fix-close_range-fails-unexpectedly-in-unprivilege=
d-p.patch \
>            "
> SRC_URI:append:class-native =3D " file://relocate-modules.patch"
>
> --
> 2.34.1
>
>
>
>
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171678):
> https://lists.openembedded.org/g/openembedded-core/message/171678
> Mute This Topic: https://lists.openembedded.org/mt/94012543/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000093c68b05eadfde31
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Oct 12, 2022 at 5:41 PM Changqing Li &lt;<a href=3D=
"mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">

 =20
  <div>
    <p><br>
    </p>
    <div>On 10/8/22 15:13, Changqing Li wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <p>
      </p>
      <div>On 9/30/22 17:50, Ross Burton wrote:<br>
      </div>
      <blockquote type=3D"cite">
        <pre>[Please note: This e-mail is from an EXTERNAL e-mail address]

Yeah, this is a Docker issue. Fix your docker.

Ross</pre>
      </blockquote>
      <p>Hi, </p>
      <p>I know this is an docker issue, but this will block yocto build
        in old docker. I noticed we already</p>
      <p>have an local patch for glibc to fix similar issue. So, maybe
        this patch is also need.
      </p>
      <p><a href=3D"https://urldefense.com/v3/__https://git.openembedded.or=
g/openembedded-core/tree/meta/recipes-core/glibc/glibc/0023-fix-create-thre=
ad-failed-in-unprivileged-process-BZ-.patch__;!!AjveYdw8EvQ!eYLVLZ08i44b_x9=
_dIbN2TSPyxAcGhsmfzSKGDqz016oV_Ho6qPIx5-JFpq4dQFyePJxNDxvfYRzGfProOLpzc_lrb=
DVeMs$" target=3D"_blank"><span>https://git.openembedded.org/openembedded-c=
ore/tree/meta/recipes-core/glibc/glibc/0023-fix-create-thread-failed-in-unp=
rivileged-process-BZ-.patch</span></a></p>
      <p>
      </p>
      <p>BRs</p></blockquote></div></blockquote><div dir=3D"auto"><br></div=
><div dir=3D"auto">These patches are addressing a corner case for supported=
 systems and the patches are not backports and it=E2=80=99s perhaps better =
to keep them local=C2=A0</div><div dir=3D"auto">Infact =C2=A0I would sugges=
t to send a patch to remove the above patch from core glibc recipe instead=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div><blockquote type=3D"cite"><=
p dir=3D"auto"></p>
      <p>Changqing
      </p>
    </blockquote>
    ping</div><div><br>
    <blockquote type=3D"cite">
      <blockquote type=3D"cite">
        <blockquote type=3D"cite">
          <pre>On 30 Sep 2022, at 09:48, Changqing Li via <a href=3D"https:=
//urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!eYLVLZ0=
8i44b_x9_dIbN2TSPyxAcGhsmfzSKGDqz016oV_Ho6qPIx5-JFpq4dQFyePJxNDxvfYRzGfProO=
Lpzc_lHw1qYsY$" target=3D"_blank">lists.openembedded.org</a> <a href=3D"mai=
lto:changqing.li=3Dwindriver.com@lists.openembedded.org" target=3D"_blank">=
&lt;changqing.li=3Dwindriver.com@lists.openembedded.org&gt;</a> wrote:

From: Changqing Li <a href=3D"mailto:changqing.li@windriver.com" target=3D"=
_blank">&lt;changqing.li@windriver.com&gt;</a>

After commit [1], start a unprivileged container (docker run without --priv=
ileged),
close file will fail.

This is actually an docker issue, see [2]. But this issue will
block yocto build in docker with glibc2.35+. so add this local patch.

[1] <a href=3D"https://urldefense.com/v3/__https://gitlab.gnome.org/GNOME/g=
lib/-/commit/ce04a124040be091407e070280d86ca810bacb8c__;!!AjveYdw8EvQ!eYLVL=
Z08i44b_x9_dIbN2TSPyxAcGhsmfzSKGDqz016oV_Ho6qPIx5-JFpq4dQFyePJxNDxvfYRzGfPr=
oOLpzc_lUw7m6AI$" target=3D"_blank">https://gitlab.gnome.org/GNOME/glib/-/c=
ommit/ce04a124040be091407e070280d86ca810bacb8c</a>
[2] <a href=3D"https://urldefense.com/v3/__https://github.com/moby/moby/iss=
ues/43595__;!!AjveYdw8EvQ!eYLVLZ08i44b_x9_dIbN2TSPyxAcGhsmfzSKGDqz016oV_Ho6=
qPIx5-JFpq4dQFyePJxNDxvfYRzGfProOLpzc_lfE8TzmQ$" target=3D"_blank">https://=
github.com/moby/moby/issues/43595</a>

Signed-off-by: Changqing Li <a href=3D"mailto:changqing.li@windriver.com" t=
arget=3D"_blank">&lt;changqing.li@windriver.com&gt;</a>
---
...fails-unexpectedly-in-unprivileged-p.patch | 46 +++++++++++++++++++
meta/recipes-core/glib-2.0/<a href=3D"https://urldefense.com/v3/__http://gl=
ib-2.0_2.72.3.bb__;!!AjveYdw8EvQ!eYLVLZ08i44b_x9_dIbN2TSPyxAcGhsmfzSKGDqz01=
6oV_Ho6qPIx5-JFpq4dQFyePJxNDxvfYRzGfProOLpzc_lPpFuHiw$" target=3D"_blank">g=
lib-2.0_2.72.3.bb</a> |  1 +
2 files changed, 47 insertions(+)
create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-fix-close_range=
-fails-unexpectedly-in-unprivileged-p.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-fix-close_range-fails=
-unexpectedly-in-unprivileged-p.patch b/meta/recipes-core/glib-2.0/glib-2.0=
/0001-fix-close_range-fails-unexpectedly-in-unprivileged-p.patch
new file mode 100644
index 0000000000..213ee7b11f
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-fix-close_range-fails-unexpe=
ctedly-in-unprivileged-p.patch
@@ -0,0 +1,46 @@
+From 0fb283b3b1e3b4958b985804cbc40b7bff8b0e65 Mon Sep 17 00:00:00 2001
+From: Changqing Li <a href=3D"mailto:changqing.li@windriver.com" target=3D=
"_blank">&lt;changqing.li@windriver.com&gt;</a>
+Date: Fri, 30 Sep 2022 08:29:41 +0000
+Subject: [PATCH] fix close_range fails unexpectedly in unprivileged proces=
s
+
+After change [1], start a unprivileged container (docker run without --pri=
vileged),
+close file may fail.
+
+This is actually an docker issue, see [2]. But this issue will
+block yocto build in docker with glibc2.35+. so add this local patch.
+
+[1] <a href=3D"https://urldefense.com/v3/__https://gitlab.gnome.org/GNOME/=
glib/-/commit/ce04a124040be091407e070280d86ca810bacb8c__;!!AjveYdw8EvQ!eYLV=
LZ08i44b_x9_dIbN2TSPyxAcGhsmfzSKGDqz016oV_Ho6qPIx5-JFpq4dQFyePJxNDxvfYRzGfP=
roOLpzc_lUw7m6AI$" target=3D"_blank">https://gitlab.gnome.org/GNOME/glib/-/=
commit/ce04a124040be091407e070280d86ca810bacb8c</a>
+[2] <a href=3D"https://urldefense.com/v3/__https://github.com/moby/moby/is=
sues/43595__;!!AjveYdw8EvQ!eYLVLZ08i44b_x9_dIbN2TSPyxAcGhsmfzSKGDqz016oV_Ho=
6qPIx5-JFpq4dQFyePJxNDxvfYRzGfProOLpzc_lfE8TzmQ$" target=3D"_blank">https:/=
/github.com/moby/moby/issues/43595</a>
+
+Upstream-Status: Inappropriate [Rejected by upstream]
+
+Signed-off-by: Changqing Li <a href=3D"mailto:changqing.li@windriver.com" =
target=3D"_blank">&lt;changqing.li@windriver.com&gt;</a>
+---
+ glib/gspawn.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/glib/gspawn.c b/glib/gspawn.c
+index 0a2cbe5..83553a1 100644
+--- a/glib/gspawn.c
++++ b/glib/gspawn.c
+@@ -1544,7 +1544,7 @@ safe_fdwalk_set_cloexec (int lowfd)
+    * fall back to safe_fdwalk(). Handle EINVAL in case `CLOSE_RANGE_CLOEX=
EC`
+    * is not supported. */
+   int ret =3D close_range (lowfd, G_MAXUINT, CLOSE_RANGE_CLOEXEC);
+-  if (ret =3D=3D 0 || !(errno =3D=3D ENOSYS || errno =3D=3D EINVAL))
++  if (ret =3D=3D 0 || !(errno =3D=3D ENOSYS || errno =3D=3D EINVAL || err=
no =3D=3D EPERM))
+     return ret;
+ #endif  /* HAVE_CLOSE_RANGE */
+   return safe_fdwalk (set_cloexec, GINT_TO_POINTER (lowfd));
+@@ -1597,7 +1597,7 @@ safe_closefrom (int lowfd)
+    * Handle ENOSYS in case it=E2=80=99s supported in libc but not the ker=
nel; if so,
+    * fall back to safe_fdwalk(). */
+   int ret =3D close_range (lowfd, G_MAXUINT, 0);
+-  if (ret =3D=3D 0 || errno !=3D ENOSYS)
++  if (ret =3D=3D 0 || !(errno =3D=3D ENOSYS || errno =3D=3D EPERM))
+     return ret;
+ #endif  /* HAVE_CLOSE_RANGE */
+   return safe_fdwalk (close_func, GINT_TO_POINTER (lowfd));
+--
+2.34.1
+
diff --git a/meta/recipes-core/glib-2.0/<a href=3D"https://urldefense.com/v=
3/__http://glib-2.0_2.72.3.bb__;!!AjveYdw8EvQ!eYLVLZ08i44b_x9_dIbN2TSPyxAcG=
hsmfzSKGDqz016oV_Ho6qPIx5-JFpq4dQFyePJxNDxvfYRzGfProOLpzc_lPpFuHiw$" target=
=3D"_blank">glib-2.0_2.72.3.bb</a> b/meta/recipes-core/glib-2.0/<a href=3D"=
https://urldefense.com/v3/__http://glib-2.0_2.72.3.bb__;!!AjveYdw8EvQ!eYLVL=
Z08i44b_x9_dIbN2TSPyxAcGhsmfzSKGDqz016oV_Ho6qPIx5-JFpq4dQFyePJxNDxvfYRzGfPr=
oOLpzc_lPpFuHiw$" target=3D"_blank">glib-2.0_2.72.3.bb</a>
index dd1ea508d2..bbaacc64a4 100644
--- a/meta/recipes-core/glib-2.0/<a href=3D"https://urldefense.com/v3/__htt=
p://glib-2.0_2.72.3.bb__;!!AjveYdw8EvQ!eYLVLZ08i44b_x9_dIbN2TSPyxAcGhsmfzSK=
GDqz016oV_Ho6qPIx5-JFpq4dQFyePJxNDxvfYRzGfProOLpzc_lPpFuHiw$" target=3D"_bl=
ank">glib-2.0_2.72.3.bb</a>
+++ b/meta/recipes-core/glib-2.0/<a href=3D"https://urldefense.com/v3/__htt=
p://glib-2.0_2.72.3.bb__;!!AjveYdw8EvQ!eYLVLZ08i44b_x9_dIbN2TSPyxAcGhsmfzSK=
GDqz016oV_Ho6qPIx5-JFpq4dQFyePJxNDxvfYRzGfProOLpzc_lPpFuHiw$" target=3D"_bl=
ank">glib-2.0_2.72.3.bb</a>
@@ -16,6 +16,7 @@ SRC_URI =3D &quot;${GNOME_MIRROR}/glib/${SHRT_VER}/glib-$=
{PV}.tar.xz \
           <a>file://0001-Do-not-write-bindir-into-pkg-config-files.patch</=
a> \
           <a>file://0001-meson-Run-atomics-test-on-clang-as-well.patch</a>=
 \
           <a>file://0001-gio-tests-resources.c-comment-out-a-build-host-on=
ly-.patch</a> \
+           <a>file://0001-fix-close_range-fails-unexpectedly-in-unprivileg=
ed-p.patch</a> \
           &quot;
SRC_URI:append:class-native =3D <a>&quot; file://relocate-modules.patch&quo=
t;</a>

--
2.34.1




</pre>
        </blockquote>
      </blockquote>
      <br>
      <fieldset></fieldset>
      <pre>

</pre>
    </blockquote>
  </div><div></div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#171678): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/171678" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/171678</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94012543/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/94012543/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000093c68b05eadfde31--

