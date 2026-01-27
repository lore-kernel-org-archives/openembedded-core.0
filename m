Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96B58D340A1
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 16:25:31 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15703.1769531130127277575
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jan 2026 08:25:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=zctzhQ07;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47ee2715254so30801235e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 08:25:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769531128; cv=none;
        d=google.com; s=arc-20240605;
        b=TQlRSTxpLd866U4PenKXVB4ReJlIT/qZcgFVUQ394zP3iS3DVQDqApFP2KZTHWwzYN
         NoaSiPdtAwqfEj1qkob5rAearOBiX+aj6Zhi3JHhJinIO4n60+kdIdErCbQJoHJKsbKD
         c0xCwCPyFaSQ0oWhlIXaX0dWYmMNArJtK7Nuc17aFwgru4rPbKy/3gq7N65qbfXJYKiV
         sp/nrYg9kVCgDl+w5Bb5AEDS+k47OG63wt2sH0WXnPep7p6DTmRrUKg9LMuJl5l9BNPD
         iS+Rk5sgeWTL3/sVCEVNd/2hbXgx+jZVipyaMrentOYE8l3HCQh90NK0/cvwsPNS19sz
         sEsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=x+K4BU/8z478VjYXj8lVXT8qCIdXrhfFCDO1tXoCchI=;
        fh=hWZuxx5dUamW/oXfhUXdvxUCcvfzgO0pgIbw24g1Eb0=;
        b=cHR3T5XYFMyUYw312zxyOACpoVO/4uo8etZsQ4iDp4Ir5SndnORKf5FEPjMhuzV3aS
         LhdG67T25hXVMxHUjAZG4z+Noj4MUHJNLWv6Ttxp2HouU94gdLeBsoWHW6w0gjIFefxn
         x/cRf6rCJz6LCQU0xjxTldYZqiTC73Il/yg5rokJzuLZ9ESfm8rlTH4J4+LB1jyfmIlO
         FdMZD+NdxE1hd6TQ/CGCPGic6HMsOu/TlnZR4mjVoMAHHB03cUQbQoUGjHX2hg5nE7Lj
         dwWh3yzM8vkFe/094Q1akgOF/2krPNvPsZCd2cM7iH8S5Dt8Nd0KyzA3eXe9gcdrjjd4
         9p5w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769531128; x=1770135928; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x+K4BU/8z478VjYXj8lVXT8qCIdXrhfFCDO1tXoCchI=;
        b=zctzhQ075r8sTeRWOrX7NKM2iQuCChaHNPhsKjeydR4z0u77lcAM4mdo9XF7dbLW7m
         lMI93aCgLUtPLGs5JDagoMMWpPXVDq5Vh8hzh54W7+aUHq1+Uy5sSCs4RdvcwjuegNf7
         EOVLAgSmg+Vcb70BynC5t4Pk/WrHwQX+hYslg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769531128; x=1770135928;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x+K4BU/8z478VjYXj8lVXT8qCIdXrhfFCDO1tXoCchI=;
        b=uU2t0Kxq20dGt9+bGcrPJPukUd2epfUSICAtfVUZU5jmNYtZwpUifr9S1mJef51RA+
         9qadkjttchRjGzYgmubUMat6s8d4huL1K5bqLgnxTu5+74jWjgPKoNLBUmtc2o0qnNqi
         bXHJwCdFZ5PJpmHUmiEJXwd7bwufooD8cKRqsisBcPPowbFLFo7vY8WDe10tavCuqP6f
         5n8svs5sM/u94rlGgfyOeQfWhu+wTBwYcWfLzBsn+r2RF39NEbyHPd+B1yS7ssFr4edx
         I+hLeeoIN0jc/rWqSikK/MIRfOrPCXyAdjUFS2tMIFTYTluGtidnxBwhI7dODIfKj6fs
         3Vbw==
X-Gm-Message-State: AOJu0Yw/phDDkV6TwaUaT6zCC6GYzK2EVMvF/sG/2wSY2Aqb0iDSw9JG
	WeUdh/yf1vJBXTLd0iw/EkDUjUGNEIPJyfkssYXfo1mo6E1Uh023OBLLD9ZpUiqadNZde0pEt/m
	vgxvJgIkcFPOG/QjBZgwKG12xwU8trcot1nMDnLPRnw==
X-Gm-Gg: AZuq6aJC0aDfyXrZMW2FZOYJKDg1ZPkCfhIy57/NewyDHVm2EY2U0yClPTS4dDxqvC1
	FA4QQcrJJmjQ/BTEvZW3ixLynHt8oB8zKxjVReZQK0Ce0Xvg3RAG69nKVRAso43l/7+OS+2pKUy
	snG5sVjvfDZ+s4NivoFkPZUNBu24ByxD5FfaN68OMWStWpQBVB7wWQ5hr4/8JwRxXscdfG1CwMm
	koPXetHnwdLRwXd+BuPoNaTbroqpjnpoEln+yCl6y/8K7aA9A2cayHKAOBwGHMYJPezPTF5bGvE
	cgGyxt6EXjLBfjumctnTeat3rGB3
X-Received: by 2002:a05:600c:450b:b0:477:76bf:e1fb with SMTP id
 5b1f17b1804b1-48069c21c40mr32558495e9.16.1769531128131; Tue, 27 Jan 2026
 08:25:28 -0800 (PST)
MIME-Version: 1.0
References: <20260127145831.90764-1-adarsh.jagadish.kamini@est.tech>
In-Reply-To: <20260127145831.90764-1-adarsh.jagadish.kamini@est.tech>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Tue, 27 Jan 2026 17:25:02 +0100
X-Gm-Features: AZwV_Qi0YrI9X_wRJHrAvpSNsd1nLiuKzVA4JjycSr1CItL2u5ClbtmzUXfHLHo
Message-ID: <CAMSfU+7DNnktOowduOiJOwQrJA5CbMYAP87jNrHGLcPEL7foJQ@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH] avahi: Backport fix for CVE-2025-68276
To: adarsh.jagadish.kamini@est.tech
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004fd7d206496112c6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 16:25:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230055

--0000000000004fd7d206496112c6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 27 janv. 2026 =C3=A0 15:58, adarsh.jagadish.kamini via
lists.openembedded.org <adarsh.jagadish.kamini=3D
est.tech@lists.openembedded.org> a =C3=A9crit :

> From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>

Hello,

This fix was already sent a few days ago :
[scarthgap][PATCH 1/2] avahi: patch CVE-2025-68276
https://lists.openembedded.org/g/openembedded-core/message/229929
Maybe you can help reviewing it?

Thanks!


> ---
>  meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
>  .../avahi/files/CVE-2025-68276.patch          | 68 +++++++++++++++++++
>  2 files changed, 69 insertions(+)
>  create mode 100644
> meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch
>
> diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb
> b/meta/recipes-connectivity/avahi/avahi_0.8.bb
> index 7930bd3037..bb20fd17cc 100644
> --- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
> +++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
> @@ -37,6 +37,7 @@ SRC_URI =3D
> "${GITHUB_BASE_URI}/download/v${PV}/avahi-${PV}.tar.gz \
>             file://CVE-2023-38473.patch \
>             file://CVE-2024-52616.patch \
>             file://CVE-2024-52615.patch \
> +           file://CVE-2025-68276.patch \
>             "
>
>  GITHUB_BASE_URI =3D "https://github.com/avahi/avahi/releases/"
> diff --git a/meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch
> b/meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch
> new file mode 100644
> index 0000000000..b3e11f9597
> --- /dev/null
> +++ b/meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch
> @@ -0,0 +1,68 @@
> +From d5d18ced67e969d6a5052cacdbd7d4b2c97a1a3f Mon Sep 17 00:00:00 2001
> +From: Evgeny Vereshchagin <evvers@ya.ru>
> +Date: Wed, 17 Dec 2025 08:11:23 +0000
> +Subject: [PATCH] core: refuse to create wide-area record browsers when
> + wide-area is off
> +
> +It fixes a bug where it was possible for unprivileged local users to
> +crash avahi-daemon (with wide-area disabled) by creating record browsers
> +with the AVAHI_LOOKUP_USE_WIDE_AREA flag set via D-Bus (either by callin=
g
> +the RecordBrowserNew method directly or by creating
> hostname/address/service
> +resolvers/browsers that create those browsers internally themselves).
> +
> +```
> +$ gdbus call --system --dest org.freedesktop.Avahi --object-path /
> --method org.freedesktop.Avahi.Server.ResolveHostName -- -1 -1 yo.local -=
1 1
> +Error: GDBus.Error:org.freedesktop.DBus.Error.NoReply: Message recipient
> disconnected from message bus without replying
> +```
> +```
> +dbus-protocol.c: interface=3Dorg.freedesktop.Avahi.Server, path=3D/,
> member=3DResolveHostName
> +avahi-daemon: wide-area.c:725: avahi_wide_area_scan_cache: Assertion `e'
> failed.
> +=3D=3D307948=3D=3D
> +=3D=3D307948=3D=3D Process terminating with default action of signal 6 (=
SIGABRT)
> +=3D=3D307948=3D=3D    at 0x4B3630C: __pthread_kill_implementation
> (pthread_kill.c:44)
> +=3D=3D307948=3D=3D    by 0x4ADF921: raise (raise.c:26)
> +=3D=3D307948=3D=3D    by 0x4AC74AB: abort (abort.c:77)
> +=3D=3D307948=3D=3D    by 0x4AC741F: __assert_fail_base.cold (assert.c:11=
8)
> +=3D=3D307948=3D=3D    by 0x48D8B85: avahi_wide_area_scan_cache (wide-are=
a.c:725)
> +=3D=3D307948=3D=3D    by 0x48C8953: lookup_scan_cache (browse.c:351)
> +=3D=3D307948=3D=3D    by 0x48C8B1B: lookup_go (browse.c:386)
> +=3D=3D307948=3D=3D    by 0x48C9148: defer_callback (browse.c:516)
> +=3D=3D307948=3D=3D    by 0x48AEA0E: expiration_event (timeeventq.c:94)
> +=3D=3D307948=3D=3D    by 0x489D3AE: timeout_callback (simple-watch.c:447=
)
> +=3D=3D307948=3D=3D    by 0x489D787: avahi_simple_poll_dispatch
> (simple-watch.c:563)
> +=3D=3D307948=3D=3D    by 0x489D91E: avahi_simple_poll_iterate (simple-wa=
tch.c:605)
> +=3D=3D307948=3D=3D
> +```
> +
> +wide-area has been disabled by default since
> +9c4214146738146e454f098264690e8e884c39bd (v0.9-rc2).
> +
> +https://github.com/avahi/avahi/security/advisories/GHSA-mhf3-865v-g5rc
> +
> +CVE: CVE-2025-68276
> +Upstream-Status: Backport [
> https://github.com/avahi/avahi/pull/806/commits/0c013e2e819be3bda74cecf48=
b5f64956cf8a760
> ]
> +
> +Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> +---
> + avahi-core/browse.c | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/avahi-core/browse.c b/avahi-core/browse.c
> +index e8a915e..59d53cb 100644
> +--- a/avahi-core/browse.c
> ++++ b/avahi-core/browse.c
> +@@ -541,6 +541,11 @@ AvahiSRecordBrowser *avahi_s_record_browser_prepare=
(
> +     AVAHI_CHECK_VALIDITY_RETURN_NULL(server, AVAHI_FLAGS_VALID(flags,
> AVAHI_LOOKUP_USE_WIDE_AREA|AVAHI_LOOKUP_USE_MULTICAST),
> AVAHI_ERR_INVALID_FLAGS);
> +     AVAHI_CHECK_VALIDITY_RETURN_NULL(server, !(flags &
> AVAHI_LOOKUP_USE_WIDE_AREA) || !(flags & AVAHI_LOOKUP_USE_MULTICAST),
> AVAHI_ERR_INVALID_FLAGS);
> +
> ++    if ((flags & AVAHI_LOOKUP_USE_WIDE_AREA) &&
> !server->wide_area_lookup_engine) {
> ++        avahi_server_set_errno(server, AVAHI_ERR_NOT_SUPPORTED);
> ++        return NULL;
> ++    }
> ++
> +     if (!(b =3D avahi_new(AvahiSRecordBrowser, 1))) {
> +         avahi_server_set_errno(server, AVAHI_ERR_NO_MEMORY);
> +         return NULL;
> +--
> +2.34.1
> +
> --
> 2.44.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#230050):
> https://lists.openembedded.org/g/openembedded-core/message/230050
> Mute This Topic: https://lists.openembedded.org/mt/117489381/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--0000000000004fd7d206496112c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Le=C2=A0mar. 27 janv. 2026 =C3=A0=C2=A015=
:58, adarsh.jagadish.kamini via <a href=3D"http://lists.openembedded.org">l=
ists.openembedded.org</a> &lt;adarsh.jagadish.kamini=3D<a href=3D"mailto:es=
t.tech@lists.openembedded.org">est.tech@lists.openembedded.org</a>&gt; a =
=C3=A9crit=C2=A0:</div><div class=3D"gmail_quote gmail_quote_container"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">From: Adarsh Jagadish Kamini=
 &lt;adarsh.jagadish.kamini@est.tech&gt;<br>
<br>
Signed-off-by: Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.tech&g=
t;<br></blockquote><div><br></div><div>Hello,</div><div><br></div><div>This=
 fix was already sent a few days ago :</div><div>[scarthgap][PATCH 1/2] ava=
hi: patch CVE-2025-68276<br><a href=3D"https://lists.openembedded.org/g/ope=
nembedded-core/message/229929">https://lists.openembedded.org/g/openembedde=
d-core/message/229929</a></div><div>Maybe you can help reviewing it?</div><=
div><br></div><div>Thanks!</div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
---<br>
=C2=A0meta/recipes-connectivity/avahi/<a href=3D"http://avahi_0.8.bb" rel=
=3D"noreferrer" target=3D"_blank">avahi_0.8.bb</a>=C2=A0 |=C2=A0 1 +<br>
=C2=A0.../avahi/files/CVE-2025-68276.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 68 +++++++++++++++++++<br>
=C2=A02 files changed, 69 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-682=
76.patch<br>
<br>
diff --git a/meta/recipes-connectivity/avahi/<a href=3D"http://avahi_0.8.bb=
" rel=3D"noreferrer" target=3D"_blank">avahi_0.8.bb</a> b/meta/recipes-conn=
ectivity/avahi/<a href=3D"http://avahi_0.8.bb" rel=3D"noreferrer" target=3D=
"_blank">avahi_0.8.bb</a><br>
index 7930bd3037..bb20fd17cc 100644<br>
--- a/meta/recipes-connectivity/avahi/<a href=3D"http://avahi_0.8.bb" rel=
=3D"noreferrer" target=3D"_blank">avahi_0.8.bb</a><br>
+++ b/meta/recipes-connectivity/avahi/<a href=3D"http://avahi_0.8.bb" rel=
=3D"noreferrer" target=3D"_blank">avahi_0.8.bb</a><br>
@@ -37,6 +37,7 @@ SRC_URI =3D &quot;${GITHUB_BASE_URI}/download/v${PV}/avah=
i-${PV}.tar.gz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2023-38473.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2024-52616.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2024-52615.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-68276.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0GITHUB_BASE_URI =3D &quot;<a href=3D"https://github.com/avahi/avahi/r=
eleases/" rel=3D"noreferrer" target=3D"_blank">https://github.com/avahi/ava=
hi/releases/</a>&quot;<br>
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch b/m=
eta/recipes-connectivity/avahi/files/CVE-2025-68276.patch<br>
new file mode 100644<br>
index 0000000000..b3e11f9597<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch<br>
@@ -0,0 +1,68 @@<br>
+From d5d18ced67e969d6a5052cacdbd7d4b2c97a1a3f Mon Sep 17 00:00:00 2001<br>
+From: Evgeny Vereshchagin &lt;<a href=3D"mailto:evvers@ya.ru" target=3D"_b=
lank">evvers@ya.ru</a>&gt;<br>
+Date: Wed, 17 Dec 2025 08:11:23 +0000<br>
+Subject: [PATCH] core: refuse to create wide-area record browsers when<br>
+ wide-area is off<br>
+<br>
+It fixes a bug where it was possible for unprivileged local users to<br>
+crash avahi-daemon (with wide-area disabled) by creating record browsers<b=
r>
+with the AVAHI_LOOKUP_USE_WIDE_AREA flag set via D-Bus (either by calling<=
br>
+the RecordBrowserNew method directly or by creating hostname/address/servi=
ce<br>
+resolvers/browsers that create those browsers internally themselves).<br>
+<br>
+```<br>
+$ gdbus call --system --dest org.freedesktop.Avahi --object-path / --metho=
d org.freedesktop.Avahi.Server.ResolveHostName -- -1 -1 yo.local -1 1<br>
+Error: GDBus.Error:org.freedesktop.DBus.Error.NoReply: Message recipient d=
isconnected from message bus without replying<br>
+```<br>
+```<br>
+dbus-protocol.c: interface=3Dorg.freedesktop.Avahi.Server, path=3D/, membe=
r=3DResolveHostName<br>
+avahi-daemon: wide-area.c:725: avahi_wide_area_scan_cache: Assertion `e&#3=
9; failed.<br>
+=3D=3D307948=3D=3D<br>
+=3D=3D307948=3D=3D Process terminating with default action of signal 6 (SI=
GABRT)<br>
+=3D=3D307948=3D=3D=C2=A0 =C2=A0 at 0x4B3630C: __pthread_kill_implementatio=
n (pthread_kill.c:44)<br>
+=3D=3D307948=3D=3D=C2=A0 =C2=A0 by 0x4ADF921: raise (raise.c:26)<br>
+=3D=3D307948=3D=3D=C2=A0 =C2=A0 by 0x4AC74AB: abort (abort.c:77)<br>
+=3D=3D307948=3D=3D=C2=A0 =C2=A0 by 0x4AC741F: __assert_fail_base.cold (ass=
ert.c:118)<br>
+=3D=3D307948=3D=3D=C2=A0 =C2=A0 by 0x48D8B85: avahi_wide_area_scan_cache (=
wide-area.c:725)<br>
+=3D=3D307948=3D=3D=C2=A0 =C2=A0 by 0x48C8953: lookup_scan_cache (browse.c:=
351)<br>
+=3D=3D307948=3D=3D=C2=A0 =C2=A0 by 0x48C8B1B: lookup_go (browse.c:386)<br>
+=3D=3D307948=3D=3D=C2=A0 =C2=A0 by 0x48C9148: defer_callback (browse.c:516=
)<br>
+=3D=3D307948=3D=3D=C2=A0 =C2=A0 by 0x48AEA0E: expiration_event (timeeventq=
.c:94)<br>
+=3D=3D307948=3D=3D=C2=A0 =C2=A0 by 0x489D3AE: timeout_callback (simple-wat=
ch.c:447)<br>
+=3D=3D307948=3D=3D=C2=A0 =C2=A0 by 0x489D787: avahi_simple_poll_dispatch (=
simple-watch.c:563)<br>
+=3D=3D307948=3D=3D=C2=A0 =C2=A0 by 0x489D91E: avahi_simple_poll_iterate (s=
imple-watch.c:605)<br>
+=3D=3D307948=3D=3D<br>
+```<br>
+<br>
+wide-area has been disabled by default since<br>
+9c4214146738146e454f098264690e8e884c39bd (v0.9-rc2).<br>
+<br>
+<a href=3D"https://github.com/avahi/avahi/security/advisories/GHSA-mhf3-86=
5v-g5rc" rel=3D"noreferrer" target=3D"_blank">https://github.com/avahi/avah=
i/security/advisories/GHSA-mhf3-865v-g5rc</a><br>
+<br>
+CVE: CVE-2025-68276<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/avahi/avahi/pull/=
806/commits/0c013e2e819be3bda74cecf48b5f64956cf8a760" rel=3D"noreferrer" ta=
rget=3D"_blank">https://github.com/avahi/avahi/pull/806/commits/0c013e2e819=
be3bda74cecf48b5f64956cf8a760</a>]<br>
+<br>
+Signed-off-by: Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.tech&=
gt;<br>
+---<br>
+ avahi-core/browse.c | 5 +++++<br>
+ 1 file changed, 5 insertions(+)<br>
+<br>
+diff --git a/avahi-core/browse.c b/avahi-core/browse.c<br>
+index e8a915e..59d53cb 100644<br>
+--- a/avahi-core/browse.c<br>
++++ b/avahi-core/browse.c<br>
+@@ -541,6 +541,11 @@ AvahiSRecordBrowser *avahi_s_record_browser_prepare(<=
br>
+=C2=A0 =C2=A0 =C2=A0AVAHI_CHECK_VALIDITY_RETURN_NULL(server, AVAHI_FLAGS_V=
ALID(flags, AVAHI_LOOKUP_USE_WIDE_AREA|AVAHI_LOOKUP_USE_MULTICAST), AVAHI_E=
RR_INVALID_FLAGS);<br>
+=C2=A0 =C2=A0 =C2=A0AVAHI_CHECK_VALIDITY_RETURN_NULL(server, !(flags &amp;=
 AVAHI_LOOKUP_USE_WIDE_AREA) || !(flags &amp; AVAHI_LOOKUP_USE_MULTICAST), =
AVAHI_ERR_INVALID_FLAGS);<br>
+ <br>
++=C2=A0 =C2=A0 if ((flags &amp; AVAHI_LOOKUP_USE_WIDE_AREA) &amp;&amp; !se=
rver-&gt;wide_area_lookup_engine) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 avahi_server_set_errno(server, AVAHI_ERR_NOT_=
SUPPORTED);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
++=C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0if (!(b =3D avahi_new(AvahiSRecordBrowser, 1))) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0avahi_server_set_errno(server, AVAHI_ERR=
_NO_MEMORY);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
+-- <br>
+2.34.1<br>
+<br>
-- <br>
2.44.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#230050): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/230050" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/230050</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117489381/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117489381/4316185</a><br>
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

--0000000000004fd7d206496112c6--

