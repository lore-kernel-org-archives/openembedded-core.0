Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 104E9C43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 05:20:06 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14869.1782796795625257445
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 22:19:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=vPyVzVnW;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493b691cb44so8037155e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 22:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782796794; x=1783401594; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uqqkWeu48FobJr/CKKERRfxA4ICkiITKZJ02iNWDrvw=;
        b=vPyVzVnWpzNJZKnxZJOm9+oF63r7NhDb8Va1LnKY/rQ8XiiVo+iEe2Bn86A+HQgSdQ
         Q+yZgvAGa16nTGiahVnsSJGqzKj0XfFCe9xKrRoU5mfjBAAvnkcsr4VbwwpnLvE/LopX
         HQinGYLAvS0qGUxeB2jbMZwHtDpHQyU1+FMqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782796794; x=1783401594;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uqqkWeu48FobJr/CKKERRfxA4ICkiITKZJ02iNWDrvw=;
        b=juQclJuQbWpl7YS8AsPtkCTMBceqzQ2/g6b1wYAPdUWpia33nkKwOWamue/oskopso
         SH6tJsAjjibTUleFXJ97wlFzsHk0NnwvFp54SiUdSPJNjapBODMPDGcRVjeDsWBRM1ON
         24nBSYxk0b44aJzs27tow6mfy+uh5G7cNWpXMJFIKpD5KAh5t/YcB8+dkTOBwZMWZdWn
         05TAZTjkUiwN5B1UwG8U1QiUS+fm6s2+O26fXpAz0ndgeFYbRHgHx2A0Rjpczf62OlIO
         R/75hqcFqC1QEViTT9hGud4EnjegUX7Qxyt84VtPVdmqbb0s+qvMb9OMAtD/KJhC7t9m
         9Njw==
X-Forwarded-Encrypted: i=1; AFNElJ8t4SLCUpwXyOgTQo3710atybO5dkP2LPQt8TKOqaY+0NaSaeqPdM6Ocls2faZWhPG1BITUSGTM8NS/g6VVGIEOIg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzphh+QAoTUkA48yNgJRiMQTpOC3tkRxHvgLevbUyQzLsjyXBKJ
	QZFhI297rK6NwR9qG4ICQUGuBQGFm7UMw17dJw9nw8B8+0VpmgnNANJE1q5b+lZxY78=
X-Gm-Gg: AfdE7clw9UVE78fD0GZvhgapHaZxqJyBNjTLaWYakr00OGCIaDG9f6sg57dsXt8LnLK
	83WvIoVYAr/Iohd4EkU0qiHfMCRZrZlP6ezvGXLYkgP3riDAyhhAzYrNq2tTO5UidAhhThTR6KN
	/aZBD///f7YUhJKCPsGSD+yofpOjUh1+qvt6GsDMeaoABhYQe7TnnoyLIHugXKsLzXQvoVaNe2A
	OJT8FK0sooTmuQSGc//+O2DLMf/vYM1ash92P/G/eL5/+1/ocY873qZYjljm7eIl+WMMe4+iSSC
	UFivaYLjGwhaU7/SnT2+3pgamU/RqNzplrRUuU85XwneBRSoRE/hFO1xjVShnZjecPZicBKQAZ7
	Eiv3slrQxSO1Hc5jDYPscXuyVel60xbSJhDqMpG742hC6tKWH7zIhFIF5lOqI/i+9pyWKy5WVbr
	TFU4AqIOwGcQ93FvX49Noyq3c7QqeuLmJm2C/KUeSJHnhSXZeiBbsjEMcDKe3GDS9UMckBW8ylk
	U61
X-Received: by 2002:a05:600c:8b8b:b0:493:b572:dccf with SMTP id 5b1f17b1804b1-493b82ae3a9mr28602165e9.24.1782796793656;
        Mon, 29 Jun 2026 22:19:53 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756636cf26sm3855780f8f.19.2026.06.29.22.19.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 22:19:53 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Jun 2026 07:19:51 +0200
Message-Id: <DJM4PVOWN9AQ.13IPY2OP9QIAS@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>, "Jaipaul Cheernam via
 lists.openembedded.org" <jaipaul.cheernam=est.tech@lists.openembedded.org>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH v2] curl: fix CVE-2026-5773 - wrong
 reuse of SMB connection
X-Mailer: aerc 0.20.0
References: <20260623074847.3424-1-jaipaul.cheernam@est.tech>
 <18BBF7650C0584E5.1138462@lists.openembedded.org>
 <DU7PPF66507B2D74801DCDBE0149F5394B9F3F72@DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM>
In-Reply-To: <DU7PPF66507B2D74801DCDBE0149F5394B9F3F72@DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 05:20:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239839

On Tue Jun 30, 2026 at 6:39 AM CEST, Jaipaul Cheernam wrote:
> Hi Yoann,
>
> I see that status in patch work shows Changes Requested but I didn=E2=80=
=99t see any response on this mail thread .
>
> Can you check

That look like a mistake on my part, sorry.
I guess I was confused with the wrynose patch geting  v3 but not this
one.

To avoid that, in the future, you could add a small patch changelog,
like you did here:
https://lore.kernel.org/all/20260629203408.52210-1-jaipaul.cheernam@est.tec=
h/

I've re-added the patch into my review queue.

Thanks!

>
> Regards,
> Jaipaul
> ________________________________
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> on behalf of Jaipaul Cheernam via lists.openembedded.org <=
jaipaul.cheernam=3Dest.tech@lists.openembedded.org>
> Sent: Wednesday, June 24, 2026 10:34 AM
> To: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org>
> Cc: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> Subject: [OE-core] [scarthgap][PATCH v2] curl: fix CVE-2026-5773 - wrong =
reuse of SMB connection
>
> libcurl's SMB handler marks connections for reuse (connkeep) without
> verifying that subsequent requests target the same share. This allows
> a second SMB request to the same host to reuse a connection
> authenticated for a different share, potentially accessing data
> without proper authorization.
>
> The upstream fix removes connection reuse for SMB entirely in
> lib/protocol.c, a file introduced in curl 8.20.0. For 8.7.1, the
> equivalent fix is changing connkeep() to connclose() in lib/smb.c,
> which prevents the connection from being returned to the pool.
>
> Tested with SMBv1 server (Docker dperson/samba):
>   Without patch: "Re-using existing connection" for different shares
>   With patch: New connection per request, no reuse
>
> Binary verified: Curl_conncontrol arg changes from 0 (KEEP) to 1 (CLOSE)
>
> Reference: https://curl.se/docs/CVE-2026-5773.html
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---
>  .../curl/curl/CVE-2026-5773.patch             | 41 +++++++++++++++++++
>  meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
>  2 files changed, 42 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-5773.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-5773.patch b/meta/re=
cipes-support/curl/curl/CVE-2026-5773.patch
> new file mode 100644
> index 0000000000..0a5fa588fe
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-5773.patch
> @@ -0,0 +1,41 @@
> +From 74a169575d6412dc0ff532acdf94de35a6c2a571 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Sun, 5 Apr 2026 18:23:35 +0200
> +Subject: [PATCH] protocol: disable connection reuse for SMB(S)
> +
> +Connections should only be reused when using the same "share" (and
> +perhaps some additional conditions), but instead of fixing this flaw,
> +this change completely disables connection reuse for SMB. This protocol
> +is about to get dropped soon anyway.
> +
> +Reported-by: Osama Hamad
> +Closes #21238
> +Signed-off-by: Daniel Stenberg <daniel@haxx.se>
> +
> +CVE: CVE-2026-5773
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/74a169575=
d6412dc0ff532acdf94de35a6c2a571]
> +
> +Note: The upstream fix targets lib/protocol.c which was introduced in
> +curl 8.20.0. In 8.7.1 the equivalent is changing connkeep() to
> +connclose() in lib/smb.c, which prevents the connection from being
> +returned to the pool. The effect is identical.
> +
> +Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> +---
> + lib/smb.c | 3 +--
> + 1 file changed, 1 insertion(+), 2 deletions(-)
> +
> +diff --git a/lib/smb.c b/lib/smb.c
> +index 7c73cbcec..a1f5c9b31 100644
> +--- a/lib/smb.c
> ++++ b/lib/smb.c
> +@@ -461,8 +461,7 @@ static CURLcode smb_connect(struct Curl_easy *data, =
bool *done)
> +   if(!smbc->send_buf)
> +     return CURLE_OUT_OF_MEMORY;
> +
> +-  /* Multiple requests are allowed with this connection */
> +-  connkeep(conn, "SMB default");
> ++  connclose(conn, "SMB default");
> +
> +   /* Parse the username, domain, and password */
> +   slash =3D strchr(conn->user, '/');
> diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-suppo=
rt/curl/curl_8.7.1.bb
> index 14d63d6373..d026731751 100644
> --- a/meta/recipes-support/curl/curl_8.7.1.bb
> +++ b/meta/recipes-support/curl/curl_8.7.1.bb
> @@ -36,6 +36,7 @@ SRC_URI =3D " \
>      file://CVE-2026-1965-2.patch \
>      file://CVE-2026-3783.patch \
>      file://CVE-2026-3784.patch \
> +    file://CVE-2026-5773.patch \
>  "
>
>  SRC_URI:append:class-nativesdk =3D " \
> --
> 2.34.1


--=20
Yoann Congal
Smile ECS


