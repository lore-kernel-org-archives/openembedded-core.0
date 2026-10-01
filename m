Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C91BBCA5FB3
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 09:16:59 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6961.1790846217050857708
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2026 02:16:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=pzwagzoW;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e79a408deso39472675e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 02:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790846215; x=1791451015; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+gL4NYO7Kx7kKJ7l3wUhzCYRLt5JlsnC1i5vzdDKl7k=;
        b=pzwagzoW8CPU0OEE4tPv3iwDoqd9+woCso9x9T3yOU8VwRem+fiuIgzeKQiO+TVadR
         MHXY7VgH5G7lbzOHqpiaA1nfz4VCsZqhk7GrtT9mDvoi4AgIGAwiSdOnIWYNMKEu51NZ
         K9zAsMlNHY4U1K0ANUBktDfjcxF22b5xDsZN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790846215; x=1791451015;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+gL4NYO7Kx7kKJ7l3wUhzCYRLt5JlsnC1i5vzdDKl7k=;
        b=Nmo7HXETcXGJFY6ot9QWkSjwnYoIJIATIQz1ewI9JNj1GrpU1JBl5SxhvpbwkJ4++/
         PbEAmEADbRb1hIEhX126ViEG8MUvUuSiWw/D2nQ9iI61BsejjxOemIKJsNh5sxiQK2fT
         p+6FziKkxb9MKc3UpFvjlbKzMrYSbzVCDPeNlWeb2hqWRWc5johcUBHhtN2yzoC0rTGy
         lyClZLW0mdv2QHyUhF038CRLzvZahWBeJpab0G16TZSaYloUQgmxiHPgDo1yTusKqLic
         utIVGNkks5lDK0KrTZ1kotcj+QzxRXcCO/7Qbs7Vg9kH+3ZYjkbb4XiaDoP/HXPmwBR5
         QsBA==
X-Forwarded-Encrypted: i=1; AKwUvBzvkdCkuEpWW9wkhLeVVQ0q9v8FAyyIsly3vmTsO/DUCJivcRlXJH6Zwy7mm8dMporO9AWjvupIGnbW5MGcv90VoQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++kG0DHs839l39JmU0khkQChj3+UI7VLRGB9T9oTMOwtZ1M8V7Dw
	2He92htmHbO1V0oMot3lunaNmeIv+pi2q2BxNpZKGFT8G3DRjhyGk3aPcsArp2tc+Dg=
X-Gm-Gg: AYBFou0F4on9cz9MQYJemd2L88Okw3J/2c4fDxm278oD/gFnXYLk92brU676/QqTdRt
	hm2Gp0xD6R2fcP01dGzOHHS/PqbBIxNp5vLbBJZ7BhrZHSVO3qNggWOvo83/cWaY44w17c6ddNi
	SyxooWPjbTT9lxyNwDH1Pz8AZHhvCEZvwCBlhTTluS2jRdQo21D+PjVBU0vjZZt+wMKGl2FtAdG
	z/wOxkjyJPtUbONfnjg/i4ZQ8QiCtkjNiWhfCXCKZHj2uyEvlou70YJRP4gYiG5cak5WGkY7cP5
	8yUibpZjwtZ4GLO5egUUQW1EC8Na7Sk/I/jKOFkX+LnJEHavGBT30/MvJtLc9B9VFZqLUfcXZvM
	a3jR6h7fkDfXdNDaJ4YiTfdqTL/Iy4rjPzYYj/RlfrqGs2ZACFz/qcThHwV3xZiekZnnJi2IAjD
	57ftk24RLszJflZ2Q8GjgqkuWxLnqQrcbb+7xKVd0YY3SBk3BQ2DpXftBFtytfVj+o7R5aHKPdQ
	h1HesA3xIXUYZ0zQnLFFySmx4Awd71lWONNEibXdouiYR4x65UydeWfRbHxlw==
X-Received: by 2002:a05:600c:6088:b0:49f:fd66:5fec with SMTP id 5b1f17b1804b1-4a01ab4d57dmr61246395e9.0.1790846215199;
        Thu, 01 Oct 2026 02:16:55 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f93ad0bsm37116845e9.4.2026.10.01.02.16.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 02:16:54 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 01 Oct 2026 11:16:54 +0200
Message-Id: <DLTE01F62XXV.3FNSVSTSP764G@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <jason.stasiak@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH 1/5] libsoup-2.4: fix CVE-2026-1539
X-Mailer: aerc 0.20.0
References: <20260929205055.2403390-1-jason.stasiak@garmin.com>
 <20260929205055.2403390-2-jason.stasiak@garmin.com>
In-Reply-To: <20260929205055.2403390-2-jason.stasiak@garmin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 09:16:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247020

On Tue Sep 29, 2026 at 10:50 PM CEST, Jason Stasiak via lists.openembedded.=
org wrote:
> Backport fix for CVE-2026-1539 from meta-oe to OE-core.
> Update CVE patch to restore the auth-redirect proxy validation
> unit test from the upstream libsoup3 patch.
>
> (From meta-oe rev: 07d67228162018f5f619dce7183f85e79293378d)
>
> Signed-off-by: Jason Stasiak <jason.stasiak@gmail.com>
> ---
>  .../libsoup/libsoup-2.4/CVE-2026-1539.patch   | 104 ++++++++++++++++++
>  .../libsoup/libsoup-2.4_2.74.3.bb             |   1 +
>  2 files changed, 105 insertions(+)
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-153=
9.patch
>
> diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-1539.patch=
 b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-1539.patch
> new file mode 100644
> index 0000000000..e8c9ee0583
> --- /dev/null
> +++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-1539.patch
> @@ -0,0 +1,104 @@
> +From 285faea567e1e2a95226201175dbf745a64a2439 Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Fri, 20 Mar 2026 15:04:22 +0800
> +Subject: [PATCH 4/4] Also remove Proxy-Authorization header on cross ori=
gin
> + redirect
> +
> +Closes #489
> +
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/comm=
it/98c1285d9d78662c38bf14b4a128af01ccfdb446]
> +CVE: CVE-2026-1539
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +
> +Backport the auth-redirect proxy validation unit tests from the upstream
> +libsoup3 patch
> +
> +Signed-off-by: Jason Stasiak <jason.stasiak@gmail.com>

Hello,

This patch has formatting issues (see below):
> +---
> + libsoup/soup-session.c |  1 +
> + tests/httpd.conf.in    |  1 +
> + tests/proxy-test.c     | 36 ++++++++++++++++++++++++++++++++++++
> + 3 files changed, 38 insertions(+)
> +
> +diff --git a/libsoup/soup-session.c b/libsoup/soup-session.c
> +index fadd5cd2..4cad0946 100644
> +--- a/libsoup/soup-session.c
> ++++ b/libsoup/soup-session.c
> +@@ -1192,6 +1192,7 @@ soup_session_redirect_message (SoupSession *sessio=
n, SoupMessage *msg)
> + 	/* Strip all credentials on cross-origin redirect. */
> + 	if (!soup_uri_host_equal (soup_message_get_uri (msg), new_uri)) {
> + 		soup_message_headers_remove (msg->request_headers, "Authorization");
> ++		soup_message_headers_remove (msg->request_headers, "Proxy-Authorizati=
on");
> + 		soup_message_set_auth (msg, NULL);
> + 	}
> +
   ^ Context lines must start with exactly one space. This line is missing =
its prefix.

Other issues:
Error: Malformed patch line at meta/recipes-support/libsoup/libsoup-2.4/CVE=
-2026-1539.patch:35
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-support/libsoup/libsoup-2.4/CVE=
-2026-1539.patch:45
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-support/libsoup/libsoup-2.4/CVE=
-2026-1539.patch:55
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-support/libsoup/libsoup-2.4/CVE=
-2026-1539.patch:95
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-support/libsoup/libsoup-2.4/CVE=
-2026-1539.patch:100
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.

Regards,
--=20
Yoann Congal
Smile ECS


