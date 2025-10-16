Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0D77CCD183
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 06:46:29 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.2317.1760597184191840195
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 23:46:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=co4jezgP;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-421851bcb25so171983f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 23:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1760597182; x=1761201982; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Cjcru8X0ieRBelJgWj3+heBK5UtmZc2Lh3RCjW8WhKo=;
        b=co4jezgPC7GMfJUphz5HlHwHJe5qs/WFog7ysEH3Q3U+iyfL/gOnwj3pYjtFgA9sYy
         GZWxZ1M79JQa0Tyd119Tkb2pU689yxsGQPRn7f0FH4gCOsqlhvY3Up02lxkrigHwvf/3
         yL3GbBpZ0XZMR+obanEPJ2bSTseFt/MlW40Cg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760597182; x=1761201982;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cjcru8X0ieRBelJgWj3+heBK5UtmZc2Lh3RCjW8WhKo=;
        b=sRVZznt/R0Z93NhBVTH1xHtuq402NTPK/wYRZDMzxR9e/wSIudKI5idD4nw+p8xQib
         h9P+qUclrWI/Mypc3nn7NH6IrbBxdDOvh5TtSXoAfQHYzjMEM7xGGkdOULNuxP7RYKZf
         wUXhwG4DRwxkP+MvP0OmNMQ4GAiStxqzNDdeEDXqMEe/ZuQX6USwYJhIKAzlmhOe64z0
         ekP2eYPbkBfr/BMXEDuoDNztz04WfKL04ePafCgrkWku92QF3l7dRtrAx3hPoEt62LuT
         6H690q9iqVqa6X3+1jGqw/86I9W8BVpckgxiwUUbE13G3kzswiXjRF0yb7pcbZE/h/zy
         OHOQ==
X-Gm-Message-State: AOJu0YwPxSffS/lGKlRbEjHJEbFJvfaDedKdAIDZWrx3Z11CXCKErY+V
	A68RA6NMFnT28TAWARpBydNVOLbsCy2XT3yVImogRMtM5S27fCCE0pc1L+AZgICasOxZYF8ZdzD
	yjGbyw+Xo/PY7s17stMG/ZMthARED0ljkILPVrKH5eLS4tmIp1rD+yUg=
X-Gm-Gg: ASbGncvZ68zQi23a0/ccNzuujU8fwgD3x8W/at7AbhUIn8jMTKuGOZ50XTtewLpjMAc
	poC2btvfKNrLWm1B/MKwjjZTvPDqmG4Ch9junpYgbDZHiw2DwOeG8Zgb4dR8cfE6dpPlq/x41pE
	PGWASVcfzhMYsQmFy0dM31RmGgsA2uJVWWAsDNGnarMmnwS5UXeF9avY+VzbYmoM0iw9IP8ZCRL
	khpeW5nGQ7XPQfw3GTIb9l+/dgwKxiOZzofGP2p37kEIOGaHKbONZaWGAZTGQtQMSJnU9WN202M
	/ikcJmoFUEZg1O0AXlM=
X-Google-Smtp-Source: AGHT+IHkCjkz+twizMffbcR2R8j3S08Uh7SDdYNHgDqp++AkmhhnqDJLbuvFubaVAAzQWLjDvU+ItaUJt6ZuShtI/Ws=
X-Received: by 2002:a05:6000:18a3:b0:426:fb28:7964 with SMTP id
 ffacd0b85a97d-426fb287d97mr1988797f8f.61.1760597182197; Wed, 15 Oct 2025
 23:46:22 -0700 (PDT)
MIME-Version: 1.0
References: <20251016011104.145401-1-Qi.Chen@windriver.com> <20251016011104.145401-2-Qi.Chen@windriver.com>
In-Reply-To: <20251016011104.145401-2-Qi.Chen@windriver.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 16 Oct 2025 08:45:54 +0200
X-Gm-Features: AS18NWA6lDtNiMimPKkxGMEqnED2AUqUUZ0YpABjHLM20XEJTVlVHneQnYKK0yU
Message-ID: <CAMSfU+6nK=hoBQYePL5iJSnSPBcTxc1Ng9AC26F2nPeOFgV9Sg@mail.gmail.com>
Subject: Re: [OE-core][PATCH V2 2/3] base-passwd: add clock group
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a346b3064140f91b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 06:46:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224948

--000000000000a346b3064140f91b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 16 oct. 2025 =C3=A0 03:11, Chen Qi via lists.openembedded.org <Qi.C=
hen=3D
windriver.com@lists.openembedded.org> a =C3=A9crit :

> From: Chen Qi <Qi.Chen@windriver.com>
>
> New systemd version (v258) introduces a new group, clock, to
> "enable applications like linuxptp to open clocks without root
> privileges".[1]
>
> This results in warning at do_rootfs time:
> WARNING: Group clock has never been defined
>
> Add group clock with gid 81 to fix this issue. The wheel group's
> gid is 80, so 81 is chosen. And as the patch to add wheel group
> was not accepted by upstream, directly mark this one's upstream
> status to be 'Inappropriate'.
>
> [1]
> https://github.com/systemd/systemd/commit/af96ccfc24bc4803078a46b4ef2cdeb=
5decdfbcd
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../base-passwd/0001-Add-clock-group.patch    | 34 +++++++++++++++++++
>  .../base-passwd/base-passwd_3.6.7.bb          |  1 +
>  2 files changed, 35 insertions(+)
>  create mode 100644
> meta/recipes-core/base-passwd/base-passwd/0001-Add-clock-group.patch
>
> diff --git
> a/meta/recipes-core/base-passwd/base-passwd/0001-Add-clock-group.patch
> b/meta/recipes-core/base-passwd/base-passwd/0001-Add-clock-group.patch
> new file mode 100644
> index 0000000000..fe5a4bb210
> --- /dev/null
> +++ b/meta/recipes-core/base-passwd/base-passwd/0001-Add-clock-group.patc=
h
> @@ -0,0 +1,34 @@
> +From 4b3a8f347179d7e2a1062eeed13a6474deb28728 Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Thu, 16 Oct 2025 08:48:49 +0800
> +Subject: [PATCH] Add clock group
> +
> +The clock group is needed to "to enable applications like linuxptp
> +to open clocks without root privileges". See the link below:
> +
> https://github.com/systemd/systemd/commit/af96ccfc24bc4803078a46b4ef2cdeb=
5decdfbcd
> +
> +Note that this group is needed as long as people use udev from
> +systemd because 50-udev-default.rules needs it. See the above
> +commit.
> +
> +Upstream-Status: Inappropriate [enable feature]
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + group.master | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/group.master b/group.master
> +index e54fd1d..6f84539 100644
> +--- a/group.master
> ++++ b/group.master
> +@@ -39,5 +39,6 @@ staff:*:50:
> + games:*:60:
> + shutdown:*:70:
> + wheel:*:80:
> ++clock:*:80:
>
There is an error in the GID here, from the commit message, it should say
81.

Cheers,


> + users:*:100:
> + nogroup:*:65534:
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb
> b/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb
> index 177927d674..e4e0890293 100644
> --- a/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb
> +++ b/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb
> @@ -13,6 +13,7 @@ SRC_URI =3D "
> https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar
> <https://launchpad.net/debian/+archive/primary/+files/$%7BBPN%7D_$%7BPV%7=
D.tar>
>             file://0005-Add-kvm-group.patch \
>             file://0007-Add-wheel-group.patch \
>             file://0001-base-passwd-Add-the-sgx-group.patch \
> +           file://0001-Add-clock-group.patch \
>             "
>
>  SRC_URI[sha256sum] =3D
> "cf869870fed7862b57bfa9e99cd5cd6f365e2349705a1b65af7fc182629bd1ab"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224910):
> https://lists.openembedded.org/g/openembedded-core/message/224910
> Mute This Topic: https://lists.openembedded.org/mt/115782555/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--000000000000a346b3064140f91b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 16=
 oct. 2025 =C3=A0=C2=A003:11, Chen Qi via <a href=3D"http://lists.openembed=
ded.org">lists.openembedded.org</a> &lt;Qi.Chen=3D<a href=3D"mailto:windriv=
er.com@lists.openembedded.org">windriver.com@lists.openembedded.org</a>&gt;=
 a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_=
blank">Qi.Chen@windriver.com</a>&gt;<br>
<br>
New systemd version (v258) introduces a new group, clock, to<br>
&quot;enable applications like linuxptp to open clocks without root<br>
privileges&quot;.[1]<br>
<br>
This results in warning at do_rootfs time:<br>
WARNING: Group clock has never been defined<br>
<br>
Add group clock with gid 81 to fix this issue. The wheel group&#39;s<br>
gid is 80, so 81 is chosen. And as the patch to add wheel group<br>
was not accepted by upstream, directly mark this one&#39;s upstream<br>
status to be &#39;Inappropriate&#39;.<br>
<br>
[1] <a href=3D"https://github.com/systemd/systemd/commit/af96ccfc24bc480307=
8a46b4ef2cdeb5decdfbcd" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/systemd/systemd/commit/af96ccfc24bc4803078a46b4ef2cdeb5decdfbcd</a><br=
>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../base-passwd/0001-Add-clock-group.patch=C2=A0 =C2=A0 | 34 ++++++++=
+++++++++++<br>
=C2=A0.../base-passwd/<a href=3D"http://base-passwd_3.6.7.bb" rel=3D"norefe=
rrer" target=3D"_blank">base-passwd_3.6.7.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 1 +<br>
=C2=A02 files changed, 35 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-core/base-passwd/base-passwd/0001-Add=
-clock-group.patch<br>
<br>
diff --git a/meta/recipes-core/base-passwd/base-passwd/0001-Add-clock-group=
.patch b/meta/recipes-core/base-passwd/base-passwd/0001-Add-clock-group.pat=
ch<br>
new file mode 100644<br>
index 0000000000..fe5a4bb210<br>
--- /dev/null<br>
+++ b/meta/recipes-core/base-passwd/base-passwd/0001-Add-clock-group.patch<=
br>
@@ -0,0 +1,34 @@<br>
+From 4b3a8f347179d7e2a1062eeed13a6474deb28728 Mon Sep 17 00:00:00 2001<br>
+From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_blan=
k">Qi.Chen@windriver.com</a>&gt;<br>
+Date: Thu, 16 Oct 2025 08:48:49 +0800<br>
+Subject: [PATCH] Add clock group<br>
+<br>
+The clock group is needed to &quot;to enable applications like linuxptp<br=
>
+to open clocks without root privileges&quot;. See the link below:<br>
+<a href=3D"https://github.com/systemd/systemd/commit/af96ccfc24bc4803078a4=
6b4ef2cdeb5decdfbcd" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/systemd/systemd/commit/af96ccfc24bc4803078a46b4ef2cdeb5decdfbcd</a><br>
+<br>
+Note that this group is needed as long as people use udev from<br>
+systemd because 50-udev-default.rules needs it. See the above<br>
+commit.<br>
+<br>
+Upstream-Status: Inappropriate [enable feature]<br>
+<br>
+Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
+---<br>
+ group.master | 1 +<br>
+ 1 file changed, 1 insertion(+)<br>
+<br>
+diff --git a/group.master b/group.master<br>
+index e54fd1d..6f84539 100644<br>
+--- a/group.master<br>
++++ b/group.master<br>
+@@ -39,5 +39,6 @@ staff:*:50:<br>
+ games:*:60:<br>
+ shutdown:*:70:<br>
+ wheel:*:80:<br>
++clock:*:80:<br></blockquote><div>There is an error in the GID here, from =
the commit message, it should say 81.</div><div><br></div><div>Cheers,</div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+ users:*:100:<br>
+ nogroup:*:65534:<br>
+-- <br>
+2.34.1<br>
+<br>
diff --git a/meta/recipes-core/base-passwd/<a href=3D"http://base-passwd_3.=
6.7.bb" rel=3D"noreferrer" target=3D"_blank">base-passwd_3.6.7.bb</a> b/met=
a/recipes-core/base-passwd/<a href=3D"http://base-passwd_3.6.7.bb" rel=3D"n=
oreferrer" target=3D"_blank">base-passwd_3.6.7.bb</a><br>
index 177927d674..e4e0890293 100644<br>
--- a/meta/recipes-core/base-passwd/<a href=3D"http://base-passwd_3.6.7.bb"=
 rel=3D"noreferrer" target=3D"_blank">base-passwd_3.6.7.bb</a><br>
+++ b/meta/recipes-core/base-passwd/<a href=3D"http://base-passwd_3.6.7.bb"=
 rel=3D"noreferrer" target=3D"_blank">base-passwd_3.6.7.bb</a><br>
@@ -13,6 +13,7 @@ SRC_URI =3D &quot;<a href=3D"https://launchpad.net/debian=
/+archive/primary/+files/$%7BBPN%7D_$%7BPV%7D.tar" rel=3D"noreferrer" targe=
t=3D"_blank">https://launchpad.net/debian/+archive/primary/+files/${BPN}_${=
PV}.tar</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0005-Add-kvm-group.patch \=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0007-Add-wheel-group.patch=
 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-base-passwd-Add-the-s=
gx-group.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Add-clock-group.patch=
 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;cf869870fed7862b57bfa9e99cd5cd6f365e2349=
705a1b65af7fc182629bd1ab&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#224910): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/224910" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/224910</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115782555/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/115782555/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" tar=
get=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000a346b3064140f91b--

