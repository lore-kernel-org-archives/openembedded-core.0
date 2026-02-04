Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4723E9539C
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 13:25:47 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20198.1770211537732721904
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 05:25:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2tHVFVxq;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so72559445e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 05:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770211536; x=1770816336; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31qQMqCRtwDDyIb2RNcHzRhIq12NF/QGy82TbZEqHJk=;
        b=2tHVFVxqqgF6f0m/x9R3vayTv3034hN+AvC4u9kySdjVECulpwI+2L4ngE+wbBgzDq
         UQHqFWPxy3rArvL4HNCNRkY3H4X850uVrN4wo/YyTAaR9403ktFOTTugy6vLE4I64nri
         +RSmZu78PuSF3OzEb51VxnooLdwGW39RXwUNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770211536; x=1770816336;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=31qQMqCRtwDDyIb2RNcHzRhIq12NF/QGy82TbZEqHJk=;
        b=Vg47wp50W0sjhtSgVOqI8wovVvTWbzS3S/qZZsw77JenX1QeT8KaernVxj1KqmP5bR
         ZDrrEbyiHD0JyvlQUrh80Kc1o3NA3UXnP+YKvVhjsiQV8MTw364E1ZSF0dqrmNQA3jUJ
         IO4TUwfaD5+ISGdBr6UqF76XVw6nhIpO2P0xSvMS4jY/DYob7g5wJI4Ll5ChMWNhrYvL
         IoT1K7yy4JmMfhYn0tYJKwSnPYIpYLB4fmNaGIqQjzEUpJP9V3pssReXNnfx7NvpR8qV
         8i+gIlCcKUtWqzqJouiU8AY0gOjsBP6UzTYF4o3AjEWj9MWlELVJhi0H1iZdFbLximP/
         sqxA==
X-Forwarded-Encrypted: i=1; AJvYcCX3HlT0pqAWLfKQxIaVyDrLkHtPs9wzkkPLR0EMQHp1yZm9czFoiFTNcEOdEAhCG4iDa7D8AMRGz8l9r3Q4Dfok0w==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz9nq4n9qduVMt4EKqh2ORnfE6KiQor+pNW9KuzOGc3RNPiXTBq
	WmrMxdHYtUoPJ/MZxyIYYDh9SFlpKgcFbCTmUInuw97RTarX2C6prffgznAcQL63K5M=
X-Gm-Gg: AZuq6aIift30a6GmEU4GLpog7EhTkduQ0RoY5nNC91eCSIs0HqaRNaI5u6lTETRfMO8
	oqlJALWPiaKHRfjS1rMbhlfcbqoB4m7UzGFZjTbxZUZKOF6r4AEcvL78e85zzOfhubvzpxXeMIW
	tj0PV7hSoQR/cMSsJaqzMOf3QKqhQF9Ghhc+W6aG5Bcye2N17E5/hiRIJCDHywxQ8YJgkYifKvq
	8IiLMp0c6+4I6rlAFqlRfdNvWSJdkFcdbWYYzk3pWqSkP52tdCWl2TER/EzV3NXI4BOPg6Fxxdt
	tq7RYxTc4brFb3KboOJq174HiGml/mJAjEdYrTJHtXMT3+yIi3PRpfn5+xMMbaFLgRmUXaU/MC+
	wFnXsZsmD/5tqX8ilDy275wDj7FKs3pHQgDjG7fuvdTMwLCqj1c3bjNM9xp8WaSvvyNGn+a8mEX
	FCyVwtopk/XIUSlOCjMS5wY4e3ppYI/s6KZl4XQyHTl3XfaT7Bh30Ugqygss95/wEUYFbmRxXD5
	Yw=
X-Received: by 2002:a05:600c:c4ab:b0:477:c478:46d7 with SMTP id 5b1f17b1804b1-4830e9793c8mr41939695e9.22.1770211535918;
        Wed, 04 Feb 2026 05:25:35 -0800 (PST)
Received: from localhost (2a01cb001331aa0002b8d20d4b496413.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:2b8:d20d:4b49:6413])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48310895107sm44975905e9.12.2026.02.04.05.25.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 05:25:35 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Feb 2026 14:25:35 +0100
Message-Id: <DG67M8MRB856.8FBFECYKGWOG@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH v2] avahi: patch CVE-2026-24401
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <ankur.tyagi85@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260125094620.1239193-1-ankur.tyagi85@gmail.com>
In-Reply-To: <20260125094620.1239193-1-ankur.tyagi85@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 13:25:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230521

On Sun Jan 25, 2026 at 10:46 AM CET, Ankur Tyagi via lists.openembedded.org=
 wrote:
> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Details https://nvd.nist.gov/vuln/detail/CVE-2026-24401
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
> changes in v2:
> - fixed CVE reference in the patch
> ---
>  meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
>  .../avahi/files/CVE-2026-24401.patch          | 74 +++++++++++++++++++
>  2 files changed, 75 insertions(+)
>  create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2026-24401.=
patch

Hello,

That patch looks needed on master (and maybe whinlatter). Can you send
the patch there first please?

Thanks!

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
> =20
>  GITHUB_BASE_URI =3D "https://github.com/avahi/avahi/releases/"
> diff --git a/meta/recipes-connectivity/avahi/files/CVE-2026-24401.patch b=
/meta/recipes-connectivity/avahi/files/CVE-2026-24401.patch
> new file mode 100644
> index 0000000000..1a442966fc
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
> +CVE: CVE-2026-24401
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
> +=20
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
> ++	        /* `to` not found, continue */
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
> +=20
> ++    if (cname_would_create_loop(l, n)) {
> ++        /* CNAME loops are not allowed */
> ++        lookup_unref(n);
> ++        return;
> ++    }
> ++
> +     l->cname_lookups =3D avahi_rlist_prepend(l->cname_lookups, lookup_r=
ef(n));
> +=20
> +     lookup_go(n);


--=20
Yoann Congal
Smile ECS


