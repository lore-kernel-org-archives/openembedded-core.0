Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DF43C021A0
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 16:19:08 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.20048.1739377143565610432
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 08:19:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iBllG5ca;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c0155af484so912453785a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 08:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739377142; x=1739981942; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sYJbs6gh308NO5usxbvX6gYYuqeoEdcDHhxgRzfSMxA=;
        b=iBllG5caS1PsbwbCe2XTnd2fwQ2yrggd/Hi3Nfp+nnZP5/P8ODkU2j6ZBmnYkXVLIa
         Fjzo7+xVJP3ekhWQGN3Y1sybAEwJiYZl28KA0ZR82ysscSeIu+52S39DUQFpcJ2moE13
         QDk22TJsCK7kxMCpvGUjlLvCxDn5KUt37liS7GJ9Q48JBfygJAUW7vMN6wWKwXayJvuy
         pT9aGO6GgkBr1x9a/jO2A2unOa3LZcMaV6EGo89Dwjwq618BYYVaFN9Pv2qs3pUjk3hK
         CBC11S6uT/8Bf7xdLuLfYctc3PIRTG2f5Sh1Icx6rKbaeRZk4IfZyaoEtfq3LXTV3I4g
         HINw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739377142; x=1739981942;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sYJbs6gh308NO5usxbvX6gYYuqeoEdcDHhxgRzfSMxA=;
        b=jHoGFwrRinfHcjlpAVEodtZi4jBYSrYgKOKGcqWCHzaIFuPaeDzACo+zvrlmc/7iYh
         t8x1U0fsrrdrCD5Va4jtGUH/hdlZLXGQK/B2sOiZ0Ekiv1cusi0F++kj5jAm/J1TNo6V
         6sty0ZAEA0mtxG/OQE8Mww8kfHNOph6ONSXN7LuEShCkkfEdI1SfbgNEzKfsLlLpm3WK
         LKcPI5OdxXcO50tQc0YRF/Bg4oTIwpEJvSIhcue3R8nrUklXqh0dA/Mh1jla2daBguw8
         vKAL1J/1sm1F89/d5UHlyisTrKsWnY0llujed0fHJltQVM0KGID96qBFJ8ycZgLESLHz
         Y0Aw==
X-Gm-Message-State: AOJu0YwY9j+TfsdvkynjAT+IVndOqJLlmz0lc6vQcMVCX56lju75ZKVK
	XCwsIuXZesXjwPBMITtOEj46lc72/pFcp3eW9ZxIkRWUYfr8Att1b149IBx30YGk5mmZh2PkDOz
	M8pmUe0WshKLKq4TrO1Pa7tsUXPk=
X-Gm-Gg: ASbGnctpiZU4Wp6lHNgLGWwBs3lE13WKk2BWOwdNelbTtroq35Aoqo6TgyeNFJ707k1
	fiPxyaPlKLl44WnXSWbpCIokB2HajtTaxmaJ31NWI/tYJkKA+aEXRrLSUqox/p3ZVJO8hDOWigp
	ZXKc/3itkOp61K90myRCTEecdh0Gc=
X-Google-Smtp-Source: AGHT+IEk89rUurs4dtNTR/t9ZIilP3CJIrLhQ6bH6GYdxjZiE4OBMFfIGytWMX+p7QSXWBPxSTOW/eIAujuN1bCZsd8=
X-Received: by 2002:a05:6214:529e:b0:6e2:4e1a:bc82 with SMTP id
 6a1803df08f44-6e65c18575bmr743566d6.35.1739377142366; Wed, 12 Feb 2025
 08:19:02 -0800 (PST)
MIME-Version: 1.0
References: <20250212161128.1933320-1-danismostlikely@gmail.com>
In-Reply-To: <20250212161128.1933320-1-danismostlikely@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 12 Feb 2025 17:18:49 +0100
X-Gm-Features: AWEUYZmhdI2dHnaOjnNRxPDO8Ge5JVGY5UfJ8TgceSMvWIj5KZJgjMFDnfqB1AU
Message-ID: <CANNYZj_5vqaMb283jQALj20mPwAbcec61qVOWXbB3gwhMm9jrA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] busybox: fix menuconfig on newer hosts
To: danismostlikely@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Dan McGregor <dan.mcgregor@usask.ca>
Content-Type: multipart/alternative; boundary="000000000000b38836062df44c96"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 16:19:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211259

--000000000000b38836062df44c96
Content-Type: text/plain; charset="UTF-8"

No new pending patches please, especially without a reason for it. Submit
upstream first.


Alex

On Wed 12. Feb 2025 at 17.11, Dan McGregor via lists.openembedded.org
<danismostlikely=gmail.com@lists.openembedded.org> wrote:

> From: Dan McGregor <dan.mcgregor@usask.ca>
>
> The lxdialog.sh script compiles a short program as a link test. That
> test program relied on an implicit return type of the main function,
> but gcc >= 14 now warns on that by default. This caused the test
> to fail and prevented menuconfig from starting.
>
> Use a full function declaration to fix this, allowing menuconfig to
> once again run on a newer host.
>
> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> ---
>  ...-menuconfig-fix-lxdialog-gcc-warning.patch | 29 +++++++++++++++++++
>  meta/recipes-core/busybox/busybox_1.37.0.bb   |  1 +
>  2 files changed, 30 insertions(+)
>  create mode 100644
> meta/recipes-core/busybox/busybox/busybox-menuconfig-fix-lxdialog-gcc-warning.patch
>
> diff --git
> a/meta/recipes-core/busybox/busybox/busybox-menuconfig-fix-lxdialog-gcc-warning.patch
> b/meta/recipes-core/busybox/busybox/busybox-menuconfig-fix-lxdialog-gcc-warning.patch
> new file mode 100644
> index 00000000000..42be243af86
> --- /dev/null
> +++
> b/meta/recipes-core/busybox/busybox/busybox-menuconfig-fix-lxdialog-gcc-warning.patch
> @@ -0,0 +1,29 @@
> +From 3386123c87a3398c1f1426bf72dd3707e74167c9 Mon Sep 17 00:00:00 2001
> +From: Dan McGregor <dan.mcgregor@usask.ca>
> +Date: Wed, 12 Feb 2025 09:47:22 -0600
> +Subject: [PATCH] menuconfig,check-lxdiaglog.sh: Fix gcc warning
> +
> +New gcc warns by default if a function is declared without a return
> +type. Use a full c99 function declaration for main in the test.
> +
> +Upstream-Status: Pending
> +---
> + scripts/kconfig/lxdialog/check-lxdialog.sh | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/scripts/kconfig/lxdialog/check-lxdialog.sh
> b/scripts/kconfig/lxdialog/check-lxdialog.sh
> +index 7003e02..4808b21 100755
> +--- a/scripts/kconfig/lxdialog/check-lxdialog.sh
> ++++ b/scripts/kconfig/lxdialog/check-lxdialog.sh
> +@@ -55,7 +55,7 @@ trap "rm -f $tmp" 0 1 2 3 15
> + check() {
> +         $cc -x c - -o $tmp 2>/dev/null <<'EOF'
> + #include CURSES_LOC
> +-main() {}
> ++int main(void) {}
> + EOF
> +       if [ $? != 0 ]; then
> +           echo " *** Unable to find the ncurses libraries or the"
>  1>&2
> +--
> +2.47.0
> +
> diff --git a/meta/recipes-core/busybox/busybox_1.37.0.bb
> b/meta/recipes-core/busybox/busybox_1.37.0.bb
> index c3131eb4531..83efe991033 100644
> --- a/meta/recipes-core/busybox/busybox_1.37.0.bb
> +++ b/meta/recipes-core/busybox/busybox_1.37.0.bb
> @@ -26,6 +26,7 @@ SRC_URI = "
> https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>             file://login-utilities.cfg \
>             file://recognize_connmand.patch \
>             file://busybox-cross-menuconfig.patch \
> +           file://busybox-menuconfig-fix-lxdialog-gcc-warning.patch \
>             file://mount-via-label.cfg \
>             file://sha1sum.cfg \
>             file://sha256sum.cfg \
> --
> 2.47.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211256):
> https://lists.openembedded.org/g/openembedded-core/message/211256
> Mute This Topic: https://lists.openembedded.org/mt/111145318/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000b38836062df44c96
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">No new pending patches please, especially without a reaso=
n for it. Submit upstream first.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmai=
l_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed=
 12. Feb 2025 at 17.11, Dan McGregor via <a href=3D"http://lists.openembedd=
ed.org">lists.openembedded.org</a> &lt;danismostlikely=3D<a href=3D"mailto:=
gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bor=
der-left-color:rgb(204,204,204)">From: Dan McGregor &lt;<a href=3D"mailto:d=
an.mcgregor@usask.ca" target=3D"_blank">dan.mcgregor@usask.ca</a>&gt;<br>
<br>
The lxdialog.sh script compiles a short program as a link test. That<br>
test program relied on an implicit return type of the main function,<br>
but gcc &gt;=3D 14 now warns on that by default. This caused the test<br>
to fail and prevented menuconfig from starting.<br>
<br>
Use a full function declaration to fix this, allowing menuconfig to<br>
once again run on a newer host.<br>
<br>
Signed-off-by: Dan McGregor &lt;<a href=3D"mailto:dan.mcgregor@usask.ca" ta=
rget=3D"_blank">dan.mcgregor@usask.ca</a>&gt;<br>
---<br>
=C2=A0...-menuconfig-fix-lxdialog-gcc-warning.patch | 29 ++++++++++++++++++=
+<br>
=C2=A0meta/recipes-core/busybox/<a href=3D"http://busybox_1.37.0.bb" rel=3D=
"noreferrer" target=3D"_blank">busybox_1.37.0.bb</a>=C2=A0 =C2=A0|=C2=A0 1 =
+<br>
=C2=A02 files changed, 30 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-core/busybox/busybox/busybox-menuconf=
ig-fix-lxdialog-gcc-warning.patch<br>
<br>
diff --git a/meta/recipes-core/busybox/busybox/busybox-menuconfig-fix-lxdia=
log-gcc-warning.patch b/meta/recipes-core/busybox/busybox/busybox-menuconfi=
g-fix-lxdialog-gcc-warning.patch<br>
new file mode 100644<br>
index 00000000000..42be243af86<br>
--- /dev/null<br>
+++ b/meta/recipes-core/busybox/busybox/busybox-menuconfig-fix-lxdialog-gcc=
-warning.patch<br>
@@ -0,0 +1,29 @@<br>
+From 3386123c87a3398c1f1426bf72dd3707e74167c9 Mon Sep 17 00:00:00 2001<br>
+From: Dan McGregor &lt;<a href=3D"mailto:dan.mcgregor@usask.ca" target=3D"=
_blank">dan.mcgregor@usask.ca</a>&gt;<br>
+Date: Wed, 12 Feb 2025 09:47:22 -0600<br>
+Subject: [PATCH] menuconfig,check-lxdiaglog.sh: Fix gcc warning<br>
+<br>
+New gcc warns by default if a function is declared without a return<br>
+type. Use a full c99 function declaration for main in the test.<br>
+<br>
+Upstream-Status: Pending<br>
+---<br>
+ scripts/kconfig/lxdialog/check-lxdialog.sh | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/scripts/kconfig/lxdialog/check-lxdialog.sh b/scripts/kconfig/=
lxdialog/check-lxdialog.sh<br>
+index 7003e02..4808b21 100755<br>
+--- a/scripts/kconfig/lxdialog/check-lxdialog.sh<br>
++++ b/scripts/kconfig/lxdialog/check-lxdialog.sh<br>
+@@ -55,7 +55,7 @@ trap &quot;rm -f $tmp&quot; 0 1 2 3 15<br>
+ check() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$cc -x c - -o $tmp 2&gt;/dev/null &lt;&l=
t;&#39;EOF&#39;<br>
+ #include CURSES_LOC<br>
+-main() {}<br>
++int main(void) {}<br>
+ EOF<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $? !=3D 0 ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot; *** Unable to find th=
e ncurses libraries or the&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A01&gt;&amp;2<br>
+-- <br>
+2.47.0<br>
+<br>
diff --git a/meta/recipes-core/busybox/<a href=3D"http://busybox_1.37.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">busybox_1.37.0.bb</a> b/meta/recipes-=
core/busybox/<a href=3D"http://busybox_1.37.0.bb" rel=3D"noreferrer" target=
=3D"_blank">busybox_1.37.0.bb</a><br>
index c3131eb4531..83efe991033 100644<br>
--- a/meta/recipes-core/busybox/<a href=3D"http://busybox_1.37.0.bb" rel=3D=
"noreferrer" target=3D"_blank">busybox_1.37.0.bb</a><br>
+++ b/meta/recipes-core/busybox/<a href=3D"http://busybox_1.37.0.bb" rel=3D=
"noreferrer" target=3D"_blank">busybox_1.37.0.bb</a><br>
@@ -26,6 +26,7 @@ SRC_URI =3D &quot;<a href=3D"https://busybox.net/download=
s/busybox-$%7BPV%7D.tar.bz2;name=3Dtarball" rel=3D"noreferrer" target=3D"_b=
lank">https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=3Dtarball</a=
> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://login-utilities.cfg \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://recognize_connmand.patch \=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://busybox-cross-menuconfig.p=
atch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://busybox-menuconfig-fix-lxd=
ialog-gcc-warning.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://mount-via-label.cfg \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://sha1sum.cfg \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://sha256sum.cfg \<br>
-- <br>
2.47.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#211256): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/211256" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/211256</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/111145318/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/111145318/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000b38836062df44c96--

