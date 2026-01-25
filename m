Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B655E63C99
	for <webhook@archiver.kernel.org>; Sun, 25 Jan 2026 09:45:21 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36284.1769334316076626665
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jan 2026 01:45:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XH+ujikr;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-34c21417781so1844800a91.3
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Jan 2026 01:45:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769334315; cv=none;
        d=google.com; s=arc-20240605;
        b=ZPLZmWF5A/gPOFOt3Qzh98iukOfycl9CNqLWEFMicvG89BrOa5hPdaUW87h7lCMVxv
         pRIJbavDxVEgPsl6gHtzUyemo2Pwr8tuPfHaqzWDVeFX5W/Ekwk6gKF3monZrs41lLA/
         9g199AVt84vrEwvKuWjvOx7AseCKR7eJPpYVIaqHK5yNNEXWz08UoB0sDzUOkfz0ZkNx
         y5tApFjD0CydEdIZpze2kGULCWZdSaE3VnwzggmfWnvI4ozff5KUzthc0PwiJ8JtfWfo
         zF22C0VaJvR+figf1nCFLElOpUOn2lP/spwwObY3ZkRHF3bXBzMFG2kYd/4SxnJKBwv2
         ME1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ECJMnHkpC2KB+HPFB8Y2bxeD/4BbkAotgkIjqC/O3Sw=;
        fh=UxP1HceJM0T1LJz3AZ4pRYR3KesS3Uwc4ek1/I2Z9pE=;
        b=R7BKdznBsn/sm5s5ouVPGzTSqS+vZLjWB17X3VuK7cIvAnSp2D3mSqx0LjUjQHj2xM
         SS7Hol0vJLEX9w5y0cvkjGUQQ36TJ/uuXKGQrDJVUFZ+A0ovK6NuxY2X7rEsVLX6XGWr
         +qNIpkQjCpNA+A59bSvo6JSDaYfo17Cx+Jyxrd+duyQmi5wruN/2oC/ef15HUmCw8uY9
         pcmvYKxG/wyFaa9ruw5/AKUco9vkdeTOjCcSKhz4/zlClLpArlIhNvO09JoqQZWT7Kvf
         c/iH5OVo1Vn4PRMOfKINljYWNSQKsBzH25ycD4zmVXsmZTVvs/Q6AWRUg7MV2Fs5E8XB
         OKjA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769334315; x=1769939115; darn=lists.openembedded.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ECJMnHkpC2KB+HPFB8Y2bxeD/4BbkAotgkIjqC/O3Sw=;
        b=XH+ujikrtucJmkV/3CBQ2SdCZ3J2syYaW38vQHro5xYbG3LfwfCo5HaIWO9khhM5Cv
         HTYfY4sxWfmZq5l8MmS/KXWRlbLEd+k4+jsQ0ZYOGitRGk+dJswYAuPJNsHHRZ6wkb4s
         AVHHBrNsjmADZYhbQvHRlzusz+qxRwKjx1JwkADet7NtOosJk9qCt0F1Ii7HS1LuFuYy
         waoIVrZ7xtaFs7MDKbrBtSqIVZIjD+1FS0ubBOgHX4GIMkItD3+xm8JcPIvfqcDMnZ2k
         8d3whT4Y77uigx4HwkizEkvgFWY1u/LycjgPmQXHLQDpZmZpA/FuEBJcX0D2LLck9JuH
         /v5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769334315; x=1769939115;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ECJMnHkpC2KB+HPFB8Y2bxeD/4BbkAotgkIjqC/O3Sw=;
        b=KXtJqQqtw0TDJk7VSkRtunx2nv96GEx73oxZrXUoS/J6f9R7xHQ5Rn6qD4jXmWAB8S
         RNbmrzTXRT8x4660XwApbEnZVXf67zGAfIgZtK9x3cFRvBPeBX5NTrwd8vl3oKKF4Zcu
         pVyak7xngHO1xBp+GQKTJwouCRMJ1BqWGzt43mRnkUChmm7/whmrZk7XyT6ySKgVabau
         C5JIxFX0W950y9Ihcw5zoBmE0tJj945t2hD5eb7+M3UrvUddNhin8aOFVYkSnwYpZFG9
         BJMaSMydiz426BX9k5vIgDiT42qrlBzNxkVWUphslJbMIVBWfXBF4jWeWZJy6Qa6rA57
         +E0Q==
X-Gm-Message-State: AOJu0YyIUl0WQUWbhP7T1mxjypivQmyTrk5nTARUKmUPj/ppEjk9odQ0
	ISQvXouO931tkpJm/MfSkmDBSc5BfGFa1K5efxLjkOsxjpvDtnZkeSLkZLv9Ol3KRyJzYCN2FKG
	/TOW9LHhsl09Yhjl4sE0getqQG3eLxhiuBz7B
X-Gm-Gg: AZuq6aIEwDrikvsYrBnxHh+aMwgboLFgSQ0VZxA0VDkipUSrsK5xDHqsQ9X7C2WoSUj
	qQ5qZEyj/eYWviH64t/53rCJ6XqKS1E+5+vYel+soUZeXKiiHVaS/g1eF0g02OUpNYAwA8Awxpx
	TX0V8GprR7/ABMMkG6Qk8D8ZNz2iM/kk7foUKojQW30ffnLxD0C8bBAQdZ6kCrPANv7YghdYUpP
	qWPQ8d/IpzC5SUz/THXXO1J8jbijjVmIohkLniY0NvW4QIiEsJpTRnfAYLwvxI5l7JnlB9TPw==
X-Received: by 2002:a17:90b:4c48:b0:34a:b8e0:dd64 with SMTP id
 98e67ed59e1d1-353c40bdeb5mr792889a91.1.1769334315174; Sun, 25 Jan 2026
 01:45:15 -0800 (PST)
MIME-Version: 1.0
References: <20260125094020.1232242-1-ankur.tyagi85@gmail.com> <20260125094020.1232242-2-ankur.tyagi85@gmail.com>
In-Reply-To: <20260125094020.1232242-2-ankur.tyagi85@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sun, 25 Jan 2026 22:45:03 +1300
X-Gm-Features: AZwV_Qh7Mv6CO2IesJV_lVUIaRzJHe3E42XcOLGQP5Xh-C4_Pk9qera2WyyNLtc
Message-ID: <CADySD0EFJWQiokfOn7-Nat1NycnJhB8nJ=xYT3=G91b=gUDbJg@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH 2/2] avahi: patch CVE-2026-24401
To: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Jan 2026 09:45:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229931

On Sun, Jan 25, 2026 at 10:40=E2=80=AFPM <ankur.tyagi85@gmail.com> wrote:
>
> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Details https://nvd.nist.gov/vuln/detail/CVE-2026-24401
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
>  .../avahi/files/CVE-2026-24401.patch          | 74 +++++++++++++++++++
>  2 files changed, 75 insertions(+)
>  create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2026-24401.=
patch
>
> diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-=
connectivity/avahi/avahi_0.8.bb
> index bb20fd17cc..bf93e4c7b9 100644
> --- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
> +++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
> @@ -38,6 +38,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/avahi-$=
{PV}.tar.gz \
>             file://CVE-2024-52616.patch \
>             file://CVE-2024-52615.patch \
>             file://CVE-2025-68276.patch \
> +           file://CVE-2026-24401.patch \
>             "
>
>  GITHUB_BASE_URI =3D "https://github.com/avahi/avahi/releases/"
> diff --git a/meta/recipes-connectivity/avahi/files/CVE-2026-24401.patch b=
/meta/recipes-connectivity/avahi/files/CVE-2026-24401.patch
> new file mode 100644
> index 0000000000..47efbdd70c
> --- /dev/null
> +++ b/meta/recipes-connectivity/avahi/files/CVE-2026-24401.patch
> @@ -0,0 +1,74 @@
> +From 5eea2640324928c15936b7a2bcbf8ea0de7b08f7 Mon Sep 17 00:00:00 2001
> +From: Hugo Muis <198191869+friendlyhugo@users.noreply.github.com>
> +Date: Sun, 2 Mar 2025 18:06:24 +0100
> +Subject: [PATCH] core: fix uncontrolled recursion bug using a simple loo=
p
> + detection algorithm
> +
> +Closes https://github.com/avahi/avahi/issues/501
> +
> +CVE: CVE-2025-68468

sending v2 to fix the CVE reference

> +Upstream-Status: Backport [https://github.com/avahi/avahi/commit/78eab31=
128479f06e30beb8c1cbf99dd921e2524]
> +(cherry picked from commit 78eab31128479f06e30beb8c1cbf99dd921e2524)
> +Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> +---
> + avahi-core/browse.c | 40 ++++++++++++++++++++++++++++++++++++++++
> + 1 file changed, 40 insertions(+)
> +
> +diff --git a/avahi-core/browse.c b/avahi-core/browse.c
> +index f461083..975b3e9 100644
> +--- a/avahi-core/browse.c
> ++++ b/avahi-core/browse.c
> +@@ -401,6 +401,40 @@ static int lookup_go(AvahiSRBLookup *l) {
> +     return n;
> + }
> +
> ++static int lookup_exists_in_path(AvahiSRBLookup* lookup, AvahiSRBLookup=
* from, AvahiSRBLookup* to) {
> ++    AvahiRList* rl;
> ++    if (from =3D=3D to)
> ++        return 0;
> ++    for (rl =3D from->cname_lookups; rl; rl =3D rl->rlist_next) {
> ++        int r =3D lookup_exists_in_path(lookup, rl->data, to);
> ++        if (r =3D=3D 1) {
> ++            /* loop detected, propagate result */
> ++            return r;
> ++        } else if (r =3D=3D 0) {
> ++            /* is loop detected? */
> ++            return lookup =3D=3D from;
> ++        } else {
> ++              /* `to` not found, continue */
> ++            continue;
> ++        }
> ++    }
> ++    /* no path found */
> ++    return -1;
> ++}
> ++
> ++static int cname_would_create_loop(AvahiSRBLookup* l, AvahiSRBLookup* n=
) {
> ++    int ret;
> ++    if (l =3D=3D n)
> ++        /* Loop to self */
> ++        return 1;
> ++
> ++    ret =3D lookup_exists_in_path(n, l->record_browser->root_lookup, l)=
;
> ++
> ++    /* Path to n always exists */
> ++    assert(ret !=3D -1);
> ++    return ret;
> ++}
> ++
> + static void lookup_handle_cname(AvahiSRBLookup *l, AvahiIfIndex interfa=
ce, AvahiProtocol protocol, AvahiLookupFlags flags, AvahiRecord *r) {
> +     AvahiKey *k;
> +     AvahiSRBLookup *n;
> +@@ -420,6 +454,12 @@ static void lookup_handle_cname(AvahiSRBLookup *l, =
AvahiIfIndex interface, Avahi
> +         return;
> +     }
> +
> ++    if (cname_would_create_loop(l, n)) {
> ++        /* CNAME loops are not allowed */
> ++        lookup_unref(n);
> ++        return;
> ++    }
> ++
> +     l->cname_lookups =3D avahi_rlist_prepend(l->cname_lookups, lookup_r=
ef(n));
> +
> +     lookup_go(n);

