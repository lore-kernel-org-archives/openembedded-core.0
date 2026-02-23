Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 114C1EEC2B1
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 23:54:46 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9028.1771890877563708767
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 15:54:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Qf2KM2r+;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4837584120eso34761875e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 15:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771890876; x=1772495676; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W/dDhSEgyOS9usizRXq8NhNbI1eCFlPkPrqwIlKIniY=;
        b=Qf2KM2r+eV9Rtxco88dHMYfu280nwE1tjtBiHSNPyz+ZQxNo2VCu7LG1iFRX+sPGz+
         WN9qd8j43FwXPTv64o34i43KRhe76QELAJRaZguAF+gacTH5Pqvae3dmwGlmVyslI8KV
         BLfZU1IEmJhUn5OQn91xP/KUKVQS6ST9Sbb1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771890876; x=1772495676;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W/dDhSEgyOS9usizRXq8NhNbI1eCFlPkPrqwIlKIniY=;
        b=lNYUui6vuvkN8tIk8rHFWGsXPxLJRflXW7eNCl6VZg4MSFgWw//aJqGzyQC1dp08BY
         J+KFCdXUZhhoqJNLe5JFIxASN1vJfGdkaovR+aobJct3pMF90npAlP+pjfF5mNmE7U2p
         hfHLoZs8sX2QEaPz6bdm1HIVAmlwW+h2FKiRbTvZcFV4MWcnHRk6oQPqInu6KL2vXon3
         YFbCM1ewyWcf3C7QunXHANBP0TWT1PWx4x2nbQB3nHtHKiiaxeMx+23KHqir5t9h/1l0
         rgCKsGo8MwsTRerUfAINBPpGfvxoaqlh4PfSkH2W47hZV/JNY6SRcQ5jNFCqZcVBnwqa
         QRJg==
X-Forwarded-Encrypted: i=1; AJvYcCWHpDgiKW8r/aJ1WU8Zy+znNiwVXavN/mUWWlmF+LKk/BlfwBeIwb/e5pn1u+T5NtoWcYipUK6wYf650H6gg61VfA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YypjSy+q9nCIMOq6SZEfQBLMAQQN83TM10iuFzb4jbyi5Vb7e0k
	lrQjP536NUe3TL8kqEnNGjrqFchtyDGXdFvSYPwAqfyA0xi/XoUY83ekdeYSN2dpKwQ=
X-Gm-Gg: AZuq6aJcaic3c/ZairTnMloon9OCRfWIcBQGn5KBZmd2+UcRRBsr7bNZJrR+jfpvf6A
	7xPZ/rpJEU1aksvHo4SaqQW7yVGRpgHCwOQzJ/hX6NK1ZxOc5w97K15jLRW9joh0BLNpHZEPYEn
	/NWAgG9kjzMsLyIXQAQ2B69X2KVO0K8fsDvacAn8oUYqMejhen3pkNB0EMSyqBlxGHpXWcELqJK
	nmo9cymZcdBpz5owMW7QDLXMG+J0N5Pj7tfnn08hG4W+0ZRAcD0ZWh6TewcC/P2mWV8Um41r+jk
	tFrx+mc+KykQXG2AvK82D5iTvzSIVzJ/xcLlkWPjF3qBhEA3PhfkJDpUvRK/AGY/+4mTladinfB
	+1h5+CH/epOKPn/DIfz7yk/qFVCGeeKB4GDAnLS5bQ6N8qQN+0JEfQWgb0Dw82dclQI8kf63h4X
	lg3W1JwlJ/XLxPYxiDagcnJrNznvEc5QinFSBbZODwqK+a3Mn5vhKbLpnb/9f+skgtY0ZmVgnKI
	ZNzvqeyYdLUrmk=
X-Received: by 2002:a05:600c:8b27:b0:480:69ae:f0e9 with SMTP id 5b1f17b1804b1-483a95eb3bamr207918135e9.16.1771890875916;
        Mon, 23 Feb 2026 15:54:35 -0800 (PST)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b822c9a5sm10333475e9.2.2026.02.23.15.54.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 15:54:35 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Feb 2026 00:54:35 +0100
Message-Id: <DGMQW6RKXYY9.184JW75V16VN3@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH v2] busybox: Fixes CVE-2025-60876
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <JPEWhacker@gmail.com>, <Peter.Marko@siemens.com>
To: <livinsunny519@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260221010838.3369126-1-livinsunny519@gmail.com>
In-Reply-To: <20260221010838.3369126-1-livinsunny519@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 23:54:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231719

Hello,

On Sat Feb 21, 2026 at 2:05 AM CET, Livin Sunny via lists.openembedded.org =
wrote:
>
> This patch addresses CVE-2025-60876[1], which allows malicious URLs to in=
ject
> HTTP headers. It has been accepted by Debian[2] and is tracked here [4].
> The upstream fix has been submitted [3] and is pending merge.
>
> [1] https://nvd.nist.gov/vuln/detail/CVE-2025-60876
> [2] https://bugs.debian.org/1120795
> [3] https://lists.busybox.net/pipermail/busybox/2025-November/091840.html
> [4] https://security-tracker.debian.org/tracker/CVE-2025-60876

Thank for the patch.

CVE-2025-60876 also impacts master and whinlatter. Please send a patch
to master and, then, request a backport for stable branches.
>
> Signed-off-by: Livin Sunny <livinsunny519@gmail.com>
> ---
> Changes in v2:
>     - Updated the commit message to include details from debian.
>     - Updated the upstream status to submitted.
> ---
>  ...control-chars-in-URLs-CVE-2025-60876.patch | 42 +++++++++++++++++++
>  meta/recipes-core/busybox/busybox_1.36.1.bb   |  1 +
>  2 files changed, 43 insertions(+)
>  create mode 100644 meta/recipes-core/busybox/busybox/wget-disallow-contr=
ol-chars-in-URLs-CVE-2025-60876.patch
>
> diff --git a/meta/recipes-core/busybox/busybox/wget-disallow-control-char=
s-in-URLs-CVE-2025-60876.patch b/meta/recipes-core/busybox/busybox/wget-dis=
allow-control-chars-in-URLs-CVE-2025-60876.patch
> new file mode 100644
> index 0000000000..aafd0ec60b
> --- /dev/null
> +++ b/meta/recipes-core/busybox/busybox/wget-disallow-control-chars-in-UR=
Ls-CVE-2025-60876.patch
> @@ -0,0 +1,42 @@
> +From: Radoslav Kolev <radoslav.kolev@suse.com>
> +Date: Fri, 21 Nov 2025 11:21:18 +0200
> +Subject: wget: don't allow control characters or spaces in the URL
> +Bug-Debian: https://bugs.debian.org/1120795
> +
> +Fixes CVE-2025-60876 malicious URL can be used to inject
> +HTTP headers in the request.
> +
> +Signed-off-by: Radoslav Kolev <radoslav.kolev@suse.com>
> +Reviewed-by: Emmanuel Deloget <logout@free.fr>
> +
> +Upstream-Status: Submitted [https://lists.busybox.net/pipermail/busybox/=
2025-November/091840.html]
> +
> +CVE: CVE-2025-60876
> +
> +Signed-off-by: Livin Sunny <livinsunny519@gmail.com>
> +---
> + networking/wget.c | 9 +++++++++
> + 1 file changed, 9 insertions(+)
> +
> +diff --git a/networking/wget.c b/networking/wget.c
> +index ec3767793..fa555427b 100644
> +--- a/networking/wget.c
> ++++ b/networking/wget.c
> +@@ -536,6 +536,15 @@ static void parse_url(const char *src_url, struct h=
ost_info *h)
> + {
> + 	char *url, *p, *sp;
> +
> ++	/* Fix for CVE-2025-60876 - don't allow control characters or spaces i=
n the URL */
> ++	/* otherwise a malicious URL can be used to inject HTTP headers in the=
 request */
> ++	const unsigned char *u =3D (void *) src_url;
> ++	while (*u) {
> ++		if (*u <=3D ' ')
> ++			bb_simple_error_msg_and_die("Unencoded control character found in th=
e URL!");
> ++		u++;
> ++	}
> ++
> + 	free(h->allocated);
> + 	h->allocated =3D url =3D xstrdup(src_url);
> +
> +--
> +2.47.3
> diff --git a/meta/recipes-core/busybox/busybox_1.36.1.bb b/meta/recipes-c=
ore/busybox/busybox_1.36.1.bb
> index d3f259d45b..b7a8ad2ed5 100644
> --- a/meta/recipes-core/busybox/busybox_1.36.1.bb
> +++ b/meta/recipes-core/busybox/busybox_1.36.1.bb
> @@ -61,6 +61,7 @@ SRC_URI =3D "https://busybox.net/downloads/busybox-${PV=
}.tar.bz2;name=3Dtarball \
>             file://CVE-2023-39810.patch \
>             file://CVE-2025-46394-01.patch \
>             file://CVE-2025-46394-02.patch \
> +           file://wget-disallow-control-chars-in-URLs-CVE-2025-60876.pat=
ch \
As a matter of conventions, name this file CVE-2025-60876.patch.

>             "
>  SRC_URI:append:libc-musl =3D " file://musl.cfg "
>  # TODO http://lists.busybox.net/pipermail/busybox/2023-January/090078.ht=
ml
> --
> 2.53.0

Regards,
--=20
Yoann Congal
Smile ECS


