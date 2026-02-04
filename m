Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93FBAE83F05
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 17:40:34 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.770.1770226828100144627
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 09:40:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Pqw9565L;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4806d23e9f1so456905e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 09:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770226826; x=1770831626; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPOREg+d7kmcu3XbEYNHNHUfBtm2D4Q4r0KR3Izm5Wg=;
        b=Pqw9565L8Y2RUXRqb6nBGkqjIBUXJudS/NoM6EemYTIIEgr+1f75RmJF9NT4rzkJjO
         4wumH3ySe/fDnkCDf8gDSs/yeJhUoVlFlltK/zQbrRy6JoMxOef+19/uCkhfmgz6+99i
         WmAqcjXv36JfuB4mC8nVaqKlaXvEY65eryIyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770226826; x=1770831626;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rPOREg+d7kmcu3XbEYNHNHUfBtm2D4Q4r0KR3Izm5Wg=;
        b=h0r+5o3Sy475bJor4DlZleF//5+suZjG+Pw6I/C5j3hDPVdPPYTqccf7baovvtTVqF
         vHf9IgxvbzkJBUVu9SvOuHw+SjGLUS0SZyvlO3eqce78hL7nnmP9LpRTeO8DYlaaD4Q5
         R5byqiZwHeVNTOCD4offnNPmFN6zpplAOeWZ0ApelO58uybAyRbOjLOK/+vv1YuP3ikc
         sNCC1Jlr5iZTk/j4qGyueDtzCq8pzWaOdKHzLp74YSR1xp85n733ld/SLR5aNWsqKuzr
         Cmgumzz8iV2dKDs4z+ZYHYSykm6Y0QeHHmLgSIL7NENOPNq4DrNWru2tz1FCIQ3Da3CK
         y4zA==
X-Forwarded-Encrypted: i=1; AJvYcCVSPog/waTShnpdwTh1OgDfM2Dccu+6OAswShr+RP+uJsfhy0wOWI28DPJvTFyFwQWAfcE1gVxW2CXDzDfVPqR0eg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzU6asrXTg/dQmQtZuRYHzJIixUz8m6ErdfNGDCkg7ZI9qPZg2q
	+V4Mwi6thasFq4uDwe/TvZyVjZZPyqnWezYxcIAxwYw9dNpmalKkWlZop2NQtkHNwYI=
X-Gm-Gg: AZuq6aJ9Dna9PVVpISdgxP/b3roCAvcA/whN5rSFoGBD5T7gnkSoXnnIBfGJKirNkLu
	GAemApnVpyLEpfZVEec/13ekpWOTR9zXnTZp7vqGZVzVeDttO8xgWVY0ZUgMKhN01TldlYsx7GA
	y/9XKBfzmdxu+OVWIuXQIwgR5dEM2vuZuvCVNecHLxgP0F6YGgPJHvcb4e1MGFhvkLOteY/V6W/
	7ShzvEpRWuSBQ/WpQ+2OklYIV9B7MW46BFRTYwwuHmmzCRyxdtOI5K1kW/bcTVIABQPZQVf2GYZ
	WzrkYZNDsC5y5HBk9tjAx7Fj0ALGLW8MJRPMVQLlrwwsggynfa59wnI/1Qajdbbt97o93TFscYd
	wkjPqd41WJtL5kRtPuBw6yB6gi7oPkiU4HOJG0zjN9H4a//6fNGXiXgDFtySdqEPzWmbU9Z/a1j
	buxmH91vUMl/V7yQiVOBGOMQq47UnsuMopQgNzC6DhWl7THwncmB5kQjRNU9uwdvxYkGeRTZItA
	1/hKSKQG0nVog==
X-Received: by 2002:a05:600d:844f:10b0:480:7162:fa48 with SMTP id 5b1f17b1804b1-4830e9492aamr37859425e9.13.1770226826380;
        Wed, 04 Feb 2026 09:40:26 -0800 (PST)
Received: from localhost (2a01cb001331aa0002b8d20d4b496413.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:2b8:d20d:4b49:6413])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4831093650esm83926405e9.15.2026.02.04.09.40.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 09:40:24 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Feb 2026 18:40:24 +0100
Message-Id: <DG6D1CEDHPPZ.2393HBV6MK1OX@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <ankur.tyagi85@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH 1/2] avahi: patch CVE-2025-68276
X-Mailer: aerc 0.20.0
References: <20260125094020.1232242-1-ankur.tyagi85@gmail.com>
In-Reply-To: <20260125094020.1232242-1-ankur.tyagi85@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 17:40:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230558

On Sun Jan 25, 2026 at 10:40 AM CET, Ankur Tyagi via lists.openembedded.org=
 wrote:
> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Backport the patch[1] from the PR[2] mentioned in the nvd[3].
>
> [1] https://github.com/avahi/avahi/commit/2d48e42d44a183f26a4d12d1f5d41ab=
b9b7c6355
> [2] https://github.com/avahi/avahi/pull/806
> [3] https://nvd.nist.gov/vuln/detail/CVE-2025-68276
>
> Dropped CI changes from the original PR during backport.
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
>  .../avahi/files/CVE-2025-68276.patch          | 65 +++++++++++++++++++
>  2 files changed, 66 insertions(+)
>  create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68276.=
patch

Hello,

Thank you for the patch. As far as I can tell, a fix for CVE-2025-68276
is also needed for whinlatter. Can you send a fix there as well?

Thanks!

>
> diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-=
connectivity/avahi/avahi_0.8.bb
> index 7930bd3037..bb20fd17cc 100644
> --- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
> +++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
> @@ -37,6 +37,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/avahi-$=
{PV}.tar.gz \
>             file://CVE-2023-38473.patch \
>             file://CVE-2024-52616.patch \
>             file://CVE-2024-52615.patch \
> +           file://CVE-2025-68276.patch \
>             "
> =20
>  GITHUB_BASE_URI =3D "https://github.com/avahi/avahi/releases/"
> diff --git a/meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch b=
/meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch
> new file mode 100644
> index 0000000000..75169419f1
> --- /dev/null
> +++ b/meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch
> @@ -0,0 +1,65 @@
> +From 8ec85459d8e6e59cc14457e16fb7ba171901f90e Mon Sep 17 00:00:00 2001
> +From: Evgeny Vereshchagin <evvers@ya.ru>
> +Date: Wed, 17 Dec 2025 08:11:23 +0000
> +Subject: [PATCH] core: refuse to create wide-area record browsers when
> + wide-area is off
> +
> +It fixes a bug where it was possible for unprivileged local users to
> +crash avahi-daemon (with wide-area disabled) by creating record browsers
> +with the AVAHI_LOOKUP_USE_WIDE_AREA flag set via D-Bus (either by callin=
g
> +the RecordBrowserNew method directly or by creating hostname/address/ser=
vice
> +resolvers/browsers that create those browsers internally themselves).
> +
> +```
> +$ gdbus call --system --dest org.freedesktop.Avahi --object-path / --met=
hod org.freedesktop.Avahi.Server.ResolveHostName -- -1 -1 yo.local -1 1
> +Error: GDBus.Error:org.freedesktop.DBus.Error.NoReply: Message recipient=
 disconnected from message bus without replying
> +```
> +```
> +dbus-protocol.c: interface=3Dorg.freedesktop.Avahi.Server, path=3D/, mem=
ber=3DResolveHostName
> +avahi-daemon: wide-area.c:725: avahi_wide_area_scan_cache: Assertion `e'=
 failed.
> +=3D=3D307948=3D=3D
> +=3D=3D307948=3D=3D Process terminating with default action of signal 6 (=
SIGABRT)
> +=3D=3D307948=3D=3D    at 0x4B3630C: __pthread_kill_implementation (pthre=
ad_kill.c:44)
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
> +=3D=3D307948=3D=3D    by 0x489D787: avahi_simple_poll_dispatch (simple-w=
atch.c:563)
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
> +Upstream-Status: Backport [https://github.com/avahi/avahi/commit/2d48e42=
d44a183f26a4d12d1f5d41abb9b7c6355]
> +(cherry picked from commit 2d48e42d44a183f26a4d12d1f5d41abb9b7c6355)
> +Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
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
> +     AVAHI_CHECK_VALIDITY_RETURN_NULL(server, AVAHI_FLAGS_VALID(flags, A=
VAHI_LOOKUP_USE_WIDE_AREA|AVAHI_LOOKUP_USE_MULTICAST), AVAHI_ERR_INVALID_FL=
AGS);
> +     AVAHI_CHECK_VALIDITY_RETURN_NULL(server, !(flags & AVAHI_LOOKUP_USE=
_WIDE_AREA) || !(flags & AVAHI_LOOKUP_USE_MULTICAST), AVAHI_ERR_INVALID_FLA=
GS);
> +=20
> ++    if ((flags & AVAHI_LOOKUP_USE_WIDE_AREA) && !server->wide_area_look=
up_engine) {
> ++        avahi_server_set_errno(server, AVAHI_ERR_NOT_SUPPORTED);
> ++        return NULL;
> ++    }
> ++
> +     if (!(b =3D avahi_new(AvahiSRecordBrowser, 1))) {
> +         avahi_server_set_errno(server, AVAHI_ERR_NO_MEMORY);
> +         return NULL;


--=20
Yoann Congal
Smile ECS


