Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4104C56205
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 17:28:20 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25287.1786037292439230533
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 10:28:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PIpBEdUR;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7ff05e5d009so29453377b3.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 10:28:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786037291; cv=none;
        d=google.com; s=arc-20260327;
        b=gxJXv2SEUkHe+EnYcjNakqqmTGN1ERw07E6LNb+vpcDR91MM8Py77/FwpgDIC+YcxQ
         NhJUbVyBnfJkqfVwpIUxkBmBlX2RKR43G7uEJD/svlXmgWdU7Bvua2uKxT4WoCobkIRb
         Okl/oTrLNu/t9HbcCYMiC3p2esTu2K6Im2IPCwVgGcGj24NmVWs9R+LrcKBcdQHzCUIj
         LMlC6TV+nrf59o+/PLU0/MPrxtoyv4bQZogGh8aLUQmfvtK+RcBXqhjX5iZpqlmTCxB5
         TIMyX2RUJc+d3Z4iwEseG+oz4KKkueKWBVR4SAeTKqDq8Isth2MLeHbDff9RySV+iK9u
         3/Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WfMMLL1jNpsFiqHyAR296YPoI/9qLbo28WtdiDsARCA=;
        fh=iLKbi4EtRTLXj0PDlEuSSUEfvrkxWxR6BFalA3Tc2xg=;
        b=rt/qM01wN49LnvuO0ymI3fd81lYkClkYcDTHfrXPBhsW7DfWNhoZvdrLujzsELfH8z
         P8VjULRoaFQjsQlzq/YmrWrz2BTDUqn9C86wajXUmRq11MOaxnFqLvLfzQSjz770Fm7o
         NZtG7xK1AUpFtEJm/F0NlkQxP7EOlEf1lU8bWQLV0Q/e3HvWrU2D8cObYd3AjvZqLhoQ
         u+0BhrMS7LfdXwiTTHd9hBZTIMZL3LhID6Q3kfDYfiovbIFTU5zBLGyEUrzmu5Ss29Q3
         c/sO680hKq4jDnOqhuar3Oh7t/84xb1qkLKhBBYEq2RKeH41cSn/aNVx7a4QN7ZYhr6s
         lxGw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786037291; x=1786642091; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WfMMLL1jNpsFiqHyAR296YPoI/9qLbo28WtdiDsARCA=;
        b=PIpBEdURddbXJTneubB+VKA3ibGaHpcYZNmiBy7wNji35f0ZLVCV2J1dd9mSUQykX6
         de/I+5THlXrnlrSi3NnsWvWlYmK+0Aa1philptBUJ7wx8WREd9bHgjrETtXNMFRkvv1G
         6sWf8cZq/lS5PELs28kGTKBgVI/CaVPWVoZ7l0Xk9OaBOHXx4Mzpn+I6RWQlSnttw1tD
         S3kvhxg/GL1/NMDwnk/tf50Fq4dpEjK/IP5u1siOBQImkQ3/Tc82dGixUna9lm7Tuh5a
         nteD1C1M2B2F69SCvRjmwptN8EiU6oNkawHUplH1gu1C3R7uMyh05Inx8lk4o4jp0O44
         4cNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786037291; x=1786642091;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WfMMLL1jNpsFiqHyAR296YPoI/9qLbo28WtdiDsARCA=;
        b=F2HOUTXLbmjEbJUwM2XbhGNpWuavhQK9Ag7MDBRwMSJFaBzAL0gomSHxv/AbcvL17u
         jI4677zVBAZ35KdvaIw7DA258StqwAcrIPeh7q4oDzj8wRXgjQqjUWroMUFRqhktH2o+
         V+ezLI933Xpxox8TfOXuWNXRKML+ZCKG9c5azBPnwNoD0wKmiZ6rm8QBT6dMe+njE9Jt
         yCBK+IN5fNWWODbntWjxVgSq342flpa+yHIvRUFTRIRFF5g9mvBELxHQbLxedl+usndn
         hx+ahaelEPwMtwm6w0k8MtkGUXpFIjNW47y5nJ/fh+hK3s3RYk+D7Y4T4cB7WZvDXwij
         dqPA==
X-Gm-Message-State: AOJu0YzucRNRMFrZH2PzJFBLYsvXJIdD/Mi6SxIEgCiK0fUpnw9WkeM1
	rsDS3PpXWJFN8Gbb+L0dcipCqSdEs2w1IbBX+RdyFuHGsqzlPs23FXQdis5/p92qxGQWEDf3SKG
	p1DRU9ZS6NuheMoSK+Ak0praH7TojUbeE+OY4
X-Gm-Gg: AR+sD12CObFpaLze3xZQmIfArg3RUJLH1ZLTnI9YEugNMrM83V8EqPA2HeMZZfXIv03
	jGeEtaIFPJqFyID26oT5PR14R7kRUErCs0zczH5O/kHGiWNdNyQaEMcQB864AcLsEHeMA8ASUuF
	byim/asvi4gLF4UHCa98shCYWOhzr2yXj8PYFOx0uuOyxpzdk9FM144+Wf8KXYcTzYMIx5s82le
	Q9YQdtp4t26uTAwTJNVgJVM+VF+2evKQnzYfwZDJ9BngbQ5rGSWubAZJwi/smPh5LAVfwrSqHsG
	mya1F/BWHOr6upyEwlhk8YWrAF280RqFBHwTk26lzLkMURB07GlkIIY0hgk9Bsqs23fAyen6p9u
	A8RVkNlILybxjRN082802I8zLVkK8H00zybQpiAxhrsLKVNaff5UdQBHy05bIdPnkJo4blTOMxp
	sGoQsTmHBAmDmAPXUM54vzTcGDun6ooe8W4Q5ugySVoT8XBHljr5U5uq8woCjmb4KnPd1vMcwte
	O0=
X-Received: by 2002:a05:690c:dd0:b0:80b:9f4e:a70 with SMTP id
 00721157ae682-8202250ee6fmr97546077b3.26.1786037291245; Thu, 06 Aug 2026
 10:28:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260806162730.352060-1-ross.burton@arm.com>
In-Reply-To: <20260806162730.352060-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 6 Aug 2026 10:27:58 -0700
X-Gm-Features: AUfX_mytPBTN2x9EAdFVJkqQzaG4XIpJ9DHs_kb97zT2ItrSHL8xqIzAZHdDmlc
Message-ID: <CAMKF1sqKK2ufVA6ugsxbjVmnVHL0Z1g5aLXP=-+AmNoRNG+adA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] cross-localedef-native: prune patch list
To: Ross Burton <ross.burton@arm.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004ce65f0658643686"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 17:28:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242963

--0000000000004ce65f0658643686
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The fixes were needed for build only pieces. It does build fair bit of
glibc infra before building localedef. But its good to review it from time
to time. If there are no build issues we should largely be OK with this
patch

On Thu, Aug 6, 2026, 9:27=E2=80=AFAM Ross Burton via lists.openembedded.org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:

> The cross-localedef-native recipe builds on top of glibc and drops in an
> autoconf tree to build just localedef.  For some reason we're applying a
> partial subset of glibc patches that do not impact the localedef build
> at all, for example adding documentation or fixing nscd.
>
> Remove patches and other assignments that don't impact the build of
> localedef.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-core/glibc/cross-localedef-native_2.44.bb | 9 ---------
>  1 file changed, 9 deletions(-)
>
> diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.44.bb
> b/meta/recipes-core/glibc/cross-localedef-native_2.44.bb
> index cf48b9c83bf..47018ff23b4 100644
> --- a/meta/recipes-core/glibc/cross-localedef-native_2.44.bb
> +++ b/meta/recipes-core/glibc/cross-localedef-native_2.44.bb
> @@ -25,13 +25,8 @@ SRC_URI =3D
> "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=3Dglibc \
>
> file://0001-localedef-Add-hardlink-resolver-from-util-linux.patch \
>
> file://0002-localedef-fix-ups-hardlink-to-make-it-compile.patch \
>             \
> -
>  file://0009-eglibc-Cross-building-and-testing-instructions.patch \
> -           file://0010-eglibc-Help-bootstrap-cross-toolchain.patch \
> -           file://0011-eglibc-Resolve-__fpscr_values-on-SH4.patch \
>
> file://0012-eglibc-Forward-port-cross-locale-generation-support.patch \
>
> file://0013-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
> -
>  file://0016-Replace-echo-with-printf-builtin-in-nscd-init-script.patch \
> -
>  file://0018-timezone-Make-shell-interpreter-overridable-in-tzsel.patch \
>             "
>  # Makes for a rather long rev (22 characters), but...
>  #
> @@ -39,10 +34,6 @@ SRCREV_FORMAT =3D "glibc_localedef"
>
>  EXTRA_OECONF =3D "--with-glibc=3D${S}"
>
> -# We do not need bash to run tzselect script, the default is to use
> -# bash but it can be configured by setting KSHELL Makefile variable
> -EXTRA_OEMAKE +=3D "KSHELL=3D/bin/sh"
> -
>  CFLAGS +=3D "-fgnu89-inline -std=3Dgnu99 -DIS_IN\(x\)=3D'0'"
>
>  do_install() {
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#242957):
> https://lists.openembedded.org/g/openembedded-core/message/242957
> Mute This Topic: https://lists.openembedded.org/mt/120629342/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000004ce65f0658643686
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">The fixes were needed for build only pieces. It does buil=
d fair bit of glibc infra before building localedef. But its good to review=
 it from time to time. If there are no build issues we should largely be OK=
 with this patch</div><br><div class=3D"gmail_quote gmail_quote_container">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 6, 2026, 9:27=E2=80=AFAM =
Ross Burton via <a href=3D"http://lists.openembedded.org">lists.openembedde=
d.org</a> &lt;ross.burton=3D<a href=3D"mailto:arm.com@lists.openembedded.or=
g">arm.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">The cross-localedef-native recipe builds o=
n top of glibc and drops in an<br>
autoconf tree to build just localedef.=C2=A0 For some reason we&#39;re appl=
ying a<br>
partial subset of glibc patches that do not impact the localedef build<br>
at all, for example adding documentation or fixing nscd.<br>
<br>
Remove patches and other assignments that don&#39;t impact the build of<br>
localedef.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank" rel=3D"noreferrer">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/glibc/<a href=3D"http://cross-localedef-native_2.44=
.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">cross-localedef-native=
_2.44.bb</a> | 9 ---------<br>
=C2=A01 file changed, 9 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/glibc/<a href=3D"http://cross-localedef-nati=
ve_2.44.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">cross-localedef=
-native_2.44.bb</a> b/meta/recipes-core/glibc/<a href=3D"http://cross-local=
edef-native_2.44.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">cross-=
localedef-native_2.44.bb</a><br>
index cf48b9c83bf..47018ff23b4 100644<br>
--- a/meta/recipes-core/glibc/<a href=3D"http://cross-localedef-native_2.44=
.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">cross-localedef-native=
_2.44.bb</a><br>
+++ b/meta/recipes-core/glibc/<a href=3D"http://cross-localedef-native_2.44=
.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">cross-localedef-native=
_2.44.bb</a><br>
@@ -25,13 +25,8 @@ SRC_URI =3D &quot;${GLIBC_GIT_URI};branch=3D${SRCBRANCH}=
;name=3Dglibc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-localedef-Add-hardlin=
k-resolver-from-util-linux.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-localedef-fix-ups-har=
dlink-to-make-it-compile.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0009-eglibc-Cross-building=
-and-testing-instructions.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0010-eglibc-Help-bootstrap=
-cross-toolchain.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0011-eglibc-Resolve-__fpsc=
r_values-on-SH4.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0012-eglibc-Forward-port-c=
ross-locale-generation-support.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0013-localedef-add-to-arch=
ive-uses-a-hard-coded-locale-pa.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0016-Replace-echo-with-pri=
ntf-builtin-in-nscd-init-script.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0018-timezone-Make-shell-i=
nterpreter-overridable-in-tzsel.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0# Makes for a rather long rev (22 characters), but...<br>
=C2=A0#<br>
@@ -39,10 +34,6 @@ SRCREV_FORMAT =3D &quot;glibc_localedef&quot;<br>
<br>
=C2=A0EXTRA_OECONF =3D &quot;--with-glibc=3D${S}&quot;<br>
<br>
-# We do not need bash to run tzselect script, the default is to use<br>
-# bash but it can be configured by setting KSHELL Makefile variable<br>
-EXTRA_OEMAKE +=3D &quot;KSHELL=3D/bin/sh&quot;<br>
-<br>
=C2=A0CFLAGS +=3D &quot;-fgnu89-inline -std=3Dgnu99 -DIS_IN\(x\)=3D&#39;0&#=
39;&quot;<br>
<br>
=C2=A0do_install() {<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#242957): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/242957" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/242957</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120629342/199=
7914" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/120629342/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.=
com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000004ce65f0658643686--

