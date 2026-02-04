Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95A4AE9D40F
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 17:43:44 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.850.1770227017597136076
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 09:43:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YpyNt+MU;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-45f171cb842so81778b6e.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 09:43:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770227017; cv=none;
        d=google.com; s=arc-20240605;
        b=BWM1rtcGV1gQZrYsmddjt7YABEZPyOvHms00ltQEOQvZ9iunSp4ufZncCd76+7dnqi
         qxkTtUtBzHh+hirUcL4062q3uXseKGHMIvTGDoGqCgOUJ/bvykcNjcVDABXcVJZ/N8dp
         /SFG7/JYGtIRE/wQ/3zC1/TaHRkYnxS7UWVxFHPiqZMilaAwCPmX5wUUqqygh58JgzEv
         GRjPr9y9iRpt4ieYWlnEUHGTshqlxxyoqb9dIEChgUo03/bereHpsfs3jwXEkfX5qoin
         gPYdXQJe4buI5BFFlHvmhJEKLtvqXHZEUxQfbeT94mwMgx+Lbj+xhj/jxsXoDW2JQQQI
         KM1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bneGvLjUMpXYjIDnMf39Vf7OUpgSGGlOG0VB8qlF220=;
        fh=5VpxgiaFCw99hmUxvV+/er63fRX0UWM338mat0ljUv0=;
        b=hNNwXokT0q/Z4IWh90UlZCfbU7gODt4S24XO4js40ojWKSb8qD1s/raw+l3a8H3Zs+
         JXEnvuOmhnw0yZQrfUIzljNQHPKYr4DXVPFFXS6GNGkxq7M0tm/RCys/YAlpXUVD7rVm
         l1Mb/85GkU/k4MfR1mMrNyRH1ywpwdLivaGJZNDcj2xu3wwdE53OSdKFJilW2wlAiEDm
         QaC0tFcR9KbSpvgwRgeF0vUuQ2nq9sxgEocO5rqUGaLn4VNCUCLt0jJCtptMe1po7S80
         eKPZwQWC32ieJ51wKwJP6gN7LJ1QvTjYRIOtsqY2qBxW6nv3LzYuiGUaMyzhyQytwjhC
         6sBw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770227017; x=1770831817; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bneGvLjUMpXYjIDnMf39Vf7OUpgSGGlOG0VB8qlF220=;
        b=YpyNt+MUA2Q5Hg8Fh6EkbTO5R8Qyez+Cm3AongntAZ1XW0UbwyuLJKdnPxM3x0Jd7u
         CwKoFGAA2eeq5yByjrlhPXEJiI5R/W8tHOavwbUCldaGaij2+uBdf+vYLY7alcuiUAxw
         Zjm6uPv8vDnslB1t+M1YAdEArMNFQ70rfZw8Kohzl5gLHUPHRK9UROhIRy/Rrc3CAfdx
         Bqq9vTYXsY6mA2L08aa/NExstTkKveXDN5KhQeXH071yA6+1+4tEkyFkxWZdTfkX9pdA
         3OX2jDaVqDMab5AcD4b7Fj7CYvGvZssnbUmyCNTZE0gBpF2QUCTfbARvLtYYIHrlIwgq
         83BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770227017; x=1770831817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bneGvLjUMpXYjIDnMf39Vf7OUpgSGGlOG0VB8qlF220=;
        b=E4BfVCWbHlI83RTU5xNdlEVgWxv5osAXcdA1PLCLH9zAMaW1ZJPQiEjf3A2hg6yXE1
         Rfz6IwdbQLFI9aWqL9jRmz4saOkHhUByPbfXQTe35ZrKDG+iNyOv5gzmiRnxu1GvJGYz
         1PlvRfWtFQN+zNseAQBGxH/u4m+dIAKSaNIHEhQlyYJ8oYK1MJaTAuNsBBjvpe8QXgNJ
         nGf53o6o6soaYq/hoQ7j8d+amkiBSLkQwSHJs8nuYAIWzNaA8hYg1LsFTeVDUCbR1W7h
         RfBGqiEhRCTiuyzFLbiMLVTfUd6BX4mGx9b+FBCaiiyePmd1cxfqUojTqOPhmWh3RHI/
         1usw==
X-Gm-Message-State: AOJu0Yydf8Fx8l4L7e+z3JPfsFSp1CFHQ9bUydS5n2dDtY8UDkjWrsaR
	feB/5MGgchHQ5gbfbFvwNrP7c4uT2EDQw3FYEp5nr5YP8z6gcBEgWU4PjWBSoDo5pFDPHY0Bxqy
	vgdhrGLH0umWeEQnxMCGc6patyyCMQLs=
X-Gm-Gg: AZuq6aLuGquLRT+hcPEliNX24ZqilF73jnavwkxijgUOvu3ppNH/JvVg6DP8nr4AZNr
	ewVs5kAAa57CQh2eh2Del4P9hZn4LNz4J6XP2tLTzIPOa2kMFvcVuo2arVVEMJPNyZrbEJv332P
	3Wbyj/shbvLLKL2FZHQ9T2mM/Babt60BTvfxAu6mIvgXlGp+J0Bx/eMa7w2NccrfQ6GW2Gm9iHx
	5oFQWmeADofZ+KmHZ7q+XQDHupMqeWhkX3cKHhQQL0XikeEa5raT2gokiMdbOHJuoQ/0IT6
X-Received: by 2002:a05:6808:1392:b0:462:de55:9d29 with SMTP id
 5614622812f47-462ea00f30amr25084b6e.33.1770227016637; Wed, 04 Feb 2026
 09:43:36 -0800 (PST)
MIME-Version: 1.0
References: <20260125094020.1232242-1-ankur.tyagi85@gmail.com> <DG6D1CEDHPPZ.2393HBV6MK1OX@smile.fr>
In-Reply-To: <DG6D1CEDHPPZ.2393HBV6MK1OX@smile.fr>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 5 Feb 2026 06:43:24 +1300
X-Gm-Features: AZwV_Qh1fHsNIWUnzNwDfSRc15LM32nENvk7lKv7Bc4A_rcg6VPzfIkcC3e_vc8
Message-ID: <CADySD0FtC+WrCMxTv=L5dUOBXg4B_Cdfn7+b87JPafVVy3PEgQ@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH 1/2] avahi: patch CVE-2025-68276
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 17:43:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230559

On Thu, Feb 5, 2026 at 6:40=E2=80=AFAM Yoann Congal <yoann.congal@smile.fr>=
 wrote:
>
> On Sun Jan 25, 2026 at 10:40 AM CET, Ankur Tyagi via lists.openembedded.o=
rg wrote:
> > From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >
> > Backport the patch[1] from the PR[2] mentioned in the nvd[3].
> >
> > [1] https://github.com/avahi/avahi/commit/2d48e42d44a183f26a4d12d1f5d41=
abb9b7c6355
> > [2] https://github.com/avahi/avahi/pull/806
> > [3] https://nvd.nist.gov/vuln/detail/CVE-2025-68276
> >
> > Dropped CI changes from the original PR during backport.
> >
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
> >  meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
> >  .../avahi/files/CVE-2025-68276.patch          | 65 +++++++++++++++++++
> >  2 files changed, 66 insertions(+)
> >  create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-6827=
6.patch
>
> Hello,
>
> Thank you for the patch. As far as I can tell, a fix for CVE-2025-68276
> is also needed for whinlatter. Can you send a fix there as well?
>
> Thanks!
>

Sure, I will.

> >
> > diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipe=
s-connectivity/avahi/avahi_0.8.bb
> > index 7930bd3037..bb20fd17cc 100644
> > --- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
> > +++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
> > @@ -37,6 +37,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/avahi=
-${PV}.tar.gz \
> >             file://CVE-2023-38473.patch \
> >             file://CVE-2024-52616.patch \
> >             file://CVE-2024-52615.patch \
> > +           file://CVE-2025-68276.patch \
> >             "
> >
> >  GITHUB_BASE_URI =3D "https://github.com/avahi/avahi/releases/"
> > diff --git a/meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch=
 b/meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch
> > new file mode 100644
> > index 0000000000..75169419f1
> > --- /dev/null
> > +++ b/meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch
> > @@ -0,0 +1,65 @@
> > +From 8ec85459d8e6e59cc14457e16fb7ba171901f90e Mon Sep 17 00:00:00 2001
> > +From: Evgeny Vereshchagin <evvers@ya.ru>
> > +Date: Wed, 17 Dec 2025 08:11:23 +0000
> > +Subject: [PATCH] core: refuse to create wide-area record browsers when
> > + wide-area is off
> > +
> > +It fixes a bug where it was possible for unprivileged local users to
> > +crash avahi-daemon (with wide-area disabled) by creating record browse=
rs
> > +with the AVAHI_LOOKUP_USE_WIDE_AREA flag set via D-Bus (either by call=
ing
> > +the RecordBrowserNew method directly or by creating hostname/address/s=
ervice
> > +resolvers/browsers that create those browsers internally themselves).
> > +
> > +```
> > +$ gdbus call --system --dest org.freedesktop.Avahi --object-path / --m=
ethod org.freedesktop.Avahi.Server.ResolveHostName -- -1 -1 yo.local -1 1
> > +Error: GDBus.Error:org.freedesktop.DBus.Error.NoReply: Message recipie=
nt disconnected from message bus without replying
> > +```
> > +```
> > +dbus-protocol.c: interface=3Dorg.freedesktop.Avahi.Server, path=3D/, m=
ember=3DResolveHostName
> > +avahi-daemon: wide-area.c:725: avahi_wide_area_scan_cache: Assertion `=
e' failed.
> > +=3D=3D307948=3D=3D
> > +=3D=3D307948=3D=3D Process terminating with default action of signal 6=
 (SIGABRT)
> > +=3D=3D307948=3D=3D    at 0x4B3630C: __pthread_kill_implementation (pth=
read_kill.c:44)
> > +=3D=3D307948=3D=3D    by 0x4ADF921: raise (raise.c:26)
> > +=3D=3D307948=3D=3D    by 0x4AC74AB: abort (abort.c:77)
> > +=3D=3D307948=3D=3D    by 0x4AC741F: __assert_fail_base.cold (assert.c:=
118)
> > +=3D=3D307948=3D=3D    by 0x48D8B85: avahi_wide_area_scan_cache (wide-a=
rea.c:725)
> > +=3D=3D307948=3D=3D    by 0x48C8953: lookup_scan_cache (browse.c:351)
> > +=3D=3D307948=3D=3D    by 0x48C8B1B: lookup_go (browse.c:386)
> > +=3D=3D307948=3D=3D    by 0x48C9148: defer_callback (browse.c:516)
> > +=3D=3D307948=3D=3D    by 0x48AEA0E: expiration_event (timeeventq.c:94)
> > +=3D=3D307948=3D=3D    by 0x489D3AE: timeout_callback (simple-watch.c:4=
47)
> > +=3D=3D307948=3D=3D    by 0x489D787: avahi_simple_poll_dispatch (simple=
-watch.c:563)
> > +=3D=3D307948=3D=3D    by 0x489D91E: avahi_simple_poll_iterate (simple-=
watch.c:605)
> > +=3D=3D307948=3D=3D
> > +```
> > +
> > +wide-area has been disabled by default since
> > +9c4214146738146e454f098264690e8e884c39bd (v0.9-rc2).
> > +
> > +https://github.com/avahi/avahi/security/advisories/GHSA-mhf3-865v-g5rc
> > +
> > +CVE: CVE-2025-68276
> > +Upstream-Status: Backport [https://github.com/avahi/avahi/commit/2d48e=
42d44a183f26a4d12d1f5d41abb9b7c6355]
> > +(cherry picked from commit 2d48e42d44a183f26a4d12d1f5d41abb9b7c6355)
> > +Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > +---
> > + avahi-core/browse.c | 5 +++++
> > + 1 file changed, 5 insertions(+)
> > +
> > +diff --git a/avahi-core/browse.c b/avahi-core/browse.c
> > +index e8a915e..59d53cb 100644
> > +--- a/avahi-core/browse.c
> > ++++ b/avahi-core/browse.c
> > +@@ -541,6 +541,11 @@ AvahiSRecordBrowser *avahi_s_record_browser_prepa=
re(
> > +     AVAHI_CHECK_VALIDITY_RETURN_NULL(server, AVAHI_FLAGS_VALID(flags,=
 AVAHI_LOOKUP_USE_WIDE_AREA|AVAHI_LOOKUP_USE_MULTICAST), AVAHI_ERR_INVALID_=
FLAGS);
> > +     AVAHI_CHECK_VALIDITY_RETURN_NULL(server, !(flags & AVAHI_LOOKUP_U=
SE_WIDE_AREA) || !(flags & AVAHI_LOOKUP_USE_MULTICAST), AVAHI_ERR_INVALID_F=
LAGS);
> > +
> > ++    if ((flags & AVAHI_LOOKUP_USE_WIDE_AREA) && !server->wide_area_lo=
okup_engine) {
> > ++        avahi_server_set_errno(server, AVAHI_ERR_NOT_SUPPORTED);
> > ++        return NULL;
> > ++    }
> > ++
> > +     if (!(b =3D avahi_new(AvahiSRecordBrowser, 1))) {
> > +         avahi_server_set_errno(server, AVAHI_ERR_NO_MEMORY);
> > +         return NULL;
>
>
> --
> Yoann Congal
> Smile ECS
>

