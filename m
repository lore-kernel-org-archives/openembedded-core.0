Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1C48D2FEDF
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 20:09:12 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21436.1769544544224890041
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jan 2026 12:09:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BAaCUZ+G;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-34c363eb612so3362883a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 12:09:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769544544; cv=none;
        d=google.com; s=arc-20240605;
        b=VWq68j/OfZXRhDT+7loCLZ3eJZWjJy9zICygdqfTcBTD20/fICNMsoQ/d5eIdcWOHT
         aHoDFCHqe79WvX8EgCQvn+ClQ2t9gKi1sUmnyddstYVdcORGjVH19iiNU46MxDKiTKiu
         ddxSTvQBJ9Xe4aEIiSubRF38YfM1Cn9b+ooHHwZawmVxLjQCy3ZQJqf3XHtq04NvCC0m
         prL89qsw5dtLyKVFwgtBvYlatM+1Rq/r8lRDpnt2zZYKDML/skFukvxA8bgeGgFppmcC
         6O/4qfFgHtCkfUYhQZoHU1zCUcxTHhniPY8Tr5rqqMzKJxIAuvVepIbP67A6gYH305oz
         A+2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZSFGYihNh6QhDIzh5KtRFe1o6pnojaVTCKnCXHGegkU=;
        fh=hWZuxx5dUamW/oXfhUXdvxUCcvfzgO0pgIbw24g1Eb0=;
        b=BmAeTUG4HkHEx9e0f4qvw2uTQIZ70LGeRVtwaRodZVpOKfgzoSbkuLNkD/X7PlNdMU
         ophvjxJD7b2tj88HJpCxdqdu0yTDC/yPz/jvWNwbkOVgmKWnwvVNCuxLThu2yYfvG8pL
         gD8G0YPfVgcpdlRZwYj3F/NVhw7vjf3wUxvYpvFE+dY9+bz+omhBQlogXQSoJB2DkMH1
         6uf+EKF/WTxArDT9yO+WSOIFgP11u7ao6TYu0+Q6wx2bLgN2Pmt5uOmndEv+POnj4bux
         r8XTwSx18aUE2gP9+JfztFQSUN5qxwreUNXQ1MP/njJoQLZ2RZ1nfZkNrKriyCMSP2W4
         XgsQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769544544; x=1770149344; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZSFGYihNh6QhDIzh5KtRFe1o6pnojaVTCKnCXHGegkU=;
        b=BAaCUZ+GP172gS+Z6aLNPnFiiQjkJJVlfGPou2yJ3NPxA0VgSu+VqP4CeK/ETvDhtG
         uBsV/VANagSHu3AJOUmQyXrbrdt3KNOtVsiQh7brapxPxAXOWEtXjvkh4RNl7e9RoRM4
         HL4764xS+5vOAlu01WGotuNpZLui2FMXSXkX9/F/VqlIMq3HjQcGTjQSQ480pVvDJsZd
         i+SI/WRpmUDdP7Oi53M1tvBm8oNsmzUshjruF248RCVSTbXm2tSbbStCqyCcIbY6NJKa
         bFMdA33gbTdc5P4WtJzlgMas0+tLXMfnPNAEbFfGCdiCrJSB/T6V1/crqZrVCr9ZgXan
         kMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769544544; x=1770149344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZSFGYihNh6QhDIzh5KtRFe1o6pnojaVTCKnCXHGegkU=;
        b=jt4vnrqnmXYacN0bcVAYnZZB1qog8+69K8DgHHpOo6/4Cwr5AsBfwvi5/XVbwTnJvh
         7D6IdePOv8xZFTucoK0gl8NLFJlKb3kRpDPNwYb6oZ5a9xPl1vwwehZr6qn/BJH9Mjby
         2dcL72Bp77f58m6ySG53WGdZNdtW01cboROVljdYJoqfnlFhHUpGvcjCEkke/kXy+rEV
         GdLxIfvZ95TchDZmP2ZvZxOJulZouO5DlQu90QQtXG23OSTIUCbCWfwvE3VzKLPosIuI
         nXZUXlxDlybHH6deVortE8DG3mw+vo7rqzEsOc4gqp8op/6Ee0brgUaejI9+WVnIn0ma
         IU5A==
X-Gm-Message-State: AOJu0YxAtMKqAQdYQY9JMyiOcXn6kq3phmBGttb9CHiDf7GtcGWJfShq
	2C+XsdmklLy4uP6tk3SFa1XtelVrSzoQh9r/IpZDmPkjaPafjwNpbw0XoXrFv091K9BxMmFkn1k
	ryUpAmz/uDQpL9AeOIJeI1tQpBWZEtBw=
X-Gm-Gg: AZuq6aJVQNnlIz1llbm8uRzMs1o3fmIj9i+EDrYM4N5aWrltPCdb+gOYZbut5gXxwwV
	89Ww/rvSB2zL2iUgiHggG5wXJ9ws10TrVtLQy68kKK+c+QRyvGJMNmvjCI6xKi4km/KGRwfT1Ib
	MZKjdrvbh345ZUvFg6CvC8UvuCY5oO3J1JCIMdDMQMERACBmDJSeCgKIkAK+CWpTCu/7JDXzIxF
	oaVaLaTal9npbsUPT3dRABRCNIHWlw8n9p6QV22L3GGds9TNlEikM8+o6y/1JDxYfa/+wu6
X-Received: by 2002:a17:90b:3c11:b0:352:c995:808a with SMTP id
 98e67ed59e1d1-353fecda875mr2807626a91.14.1769544543324; Tue, 27 Jan 2026
 12:09:03 -0800 (PST)
MIME-Version: 1.0
References: <20260127152035.94651-1-adarsh.jagadish.kamini@est.tech>
In-Reply-To: <20260127152035.94651-1-adarsh.jagadish.kamini@est.tech>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 28 Jan 2026 09:08:52 +1300
X-Gm-Features: AZwV_QjVvnv2cjZoI3Q6wD7HW2MXZszNwVmna_kJMcJTNzaXZX98t1DRGcg9Q4E
Message-ID: <CADySD0EXCmp0CBMzLvcYzDRAG3zAWXa5Md60fiBt8pJ_6Nqucg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] avahi: Backport fix CVE-2025-68276
To: adarsh.jagadish.kamini@est.tech
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 20:09:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230064

On Wed, Jan 28, 2026 at 4:20=E2=80=AFAM adarsh.jagadish.kamini via
lists.openembedded.org
<adarsh.jagadish.kamini=3Dest.tech@lists.openembedded.org> wrote:
>
> From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>
> Include the patch linked in the NVD report: https://github.com/avahi/avah=
i/pull/806/commits/0c013e2e819be3bda74cecf48b5f64956cf8a760

Will be helpful to add NVD reference as well.
In this case https://nvd.nist.gov/vuln/detail/CVE-2025-68276

Otherwise the patch LGTM.

>
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> ---
>  meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
>  .../avahi/files/CVE-2025-68276.patch          | 68 +++++++++++++++++++
>  2 files changed, 69 insertions(+)
>  create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68276.=
patch
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
>
>  GITHUB_BASE_URI =3D "https://github.com/avahi/avahi/releases/"
> diff --git a/meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch b=
/meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch
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
> +Upstream-Status: Backport [https://github.com/avahi/avahi/pull/806/commi=
ts/0c013e2e819be3bda74cecf48b5f64956cf8a760]
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
> +     AVAHI_CHECK_VALIDITY_RETURN_NULL(server, AVAHI_FLAGS_VALID(flags, A=
VAHI_LOOKUP_USE_WIDE_AREA|AVAHI_LOOKUP_USE_MULTICAST), AVAHI_ERR_INVALID_FL=
AGS);
> +     AVAHI_CHECK_VALIDITY_RETURN_NULL(server, !(flags & AVAHI_LOOKUP_USE=
_WIDE_AREA) || !(flags & AVAHI_LOOKUP_USE_MULTICAST), AVAHI_ERR_INVALID_FLA=
GS);
> +
> ++    if ((flags & AVAHI_LOOKUP_USE_WIDE_AREA) && !server->wide_area_look=
up_engine) {
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
> View/Reply Online (#230053): https://lists.openembedded.org/g/openembedde=
d-core/message/230053
> Mute This Topic: https://lists.openembedded.org/mt/117489879/3619737
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [an=
kur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

