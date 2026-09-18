Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4289DC982DA
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 09:19:47 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7088.1789723181837026368
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2026 02:19:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0Du39ylK;
 spf=pass (domain: smile.fr, ip: 74.125.225.76, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6351831so238779f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 02:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789723180; x=1790327980; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6atXNbulRLXNjeVrWL4575CWGtJb/l7VuYQsIXtaLio=;
        b=0Du39ylKbNwvEux8/6zEWF6okV8+YAOT7lYczqEKxt80pRmRwev6VDuSekgNa0H7vK
         MFOyYhQD5kjAa/rQgVp2ZBDMuvgh6+y245NdqXJnwfUHSXwg+Ts3iB7WqcMXMYzeqfrM
         A73KvJyQNlLi+Vv1S/iKjRoCVK0AT2DKiV8pw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723180; x=1790327980;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6atXNbulRLXNjeVrWL4575CWGtJb/l7VuYQsIXtaLio=;
        b=Fg2xfvBpBN0dLMIBv2J3I/UhRPXcP5Gr6khYLS3xan92JCd4Q7Z2ByDOxGrGGoAiLe
         Ev/b3bThdD9FgBDnI3G3AM+OwIaHf/mcmDCf7XjJ0uGdTtN3JFPYsPiH8Abz39gLuhHE
         R+Cm/qzdTdg6iFAY3xMygXuYyHa+i2E2vJP9p1S5b9/UnpXfhoUhd+Pc26CJb+hziE34
         pZfVXexpCrIwK1Axp6wN/l6gqgKCq2K/+8hDichXyw3wzVCJTwnX+LMzRuAnvAlnowjC
         WMUWT4V2sTxB+W9pbOu9MT34Lqh7Kqh41PYhDbS/DfdUYHOpvKv+mpT8yUyPyzJspM+e
         W8/A==
X-Forwarded-Encrypted: i=1; AKwUvBw4lCICAOMp+KEcnAJEbD8SDaYX7k62e5907NlwxbB6t8cnFfW0QsWG6YVLPxWaeFV11K+SuwDkGVsYI9b2o/hCag==@lists.openembedded.org
X-Gm-Message-State: AFuF++lNM3agBvH+laJWFtPj8wYVfalmyYduhQ1ASkXgORIWEcW3pxic
	AvNN6mINovDNdIEjGd78oBPNpQVlMyWu0x/czAezARUY1A6MKGwbsJgXet0EEzuS0Vw=
X-Gm-Gg: AYBFou1Tc4TIK+7KA3KDf1iOFJ2fiC2EJQK3bywKqbEaH6Ph41buTEd5LykxzbDP8cw
	LcXuWp1i+aEgGtyw9E1wRmsF75YohULGiq9IrDXVZC5D8XBiScrm7Ww9HpJBJruagLuECjaggYV
	NQs0Whv30YSJn4oUb6M0JSiJ4UADsqZvUSD+GAG2gOd9DVHAW30Yh+1CAA4arAmT4B7RBtmjWYJ
	QKPudp7KHhY1SALxytKk4mfM62k0qHRjZzQroD/z+myjEZ7j7SqQD6Wf86V8qTvuBn4pNsEeSGh
	AkIkPgfbAKL5iikn6pAzpQZX4JStA5D79Gn7oUV1NEOnYnCk3pxByoZaQb1bKwrNGhvGr5sNNiJ
	UlM/+UJENkTpzS0hVH3SB4yMbQrg5tm1csyBxR86BJ3nYEnoJeN33GKOUioRDoB1QmAWTduIU6N
	FgdpiiLvrxDtesxYCP9oMiXAc/up4jHXk6W4HJuoOYxFzOBoSK7UfcusBgmIEFVwtTSC4Jj2o5H
	CIycNS1Hd2lji1wAfulxsjILC4vY2QXsMm2vT9sa5fo6GXSN8enHQeg65weaExEjRnvcroQJQ==
X-Received: by 2002:a05:6000:4703:b0:487:15a3:1cab with SMTP id ffacd0b85a97d-4871e220ac9mr2142292f8f.18.1789723179849;
        Fri, 18 Sep 2026 02:19:39 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48720083c19sm2596921f8f.31.2026.09.18.02.19.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 02:19:39 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Sep 2026 11:19:39 +0200
Message-Id: <DLIBX22WN2SX.1MVF74KFYR0Q1@smile.fr>
To: <deeratho@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH v3 5/5] curl: fix CVE-2026-7168
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260804103305.1180770-5-deeratho@cisco.com>
 <20260824094720.2194782-1-deeratho@cisco.com>
In-Reply-To: <20260824094720.2194782-1-deeratho@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 09:19:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246202

Hello,

This patch conflict with other patches in my branch. Because this one
has issues, I will hold it for another cycle, you will have to
refresh/rebase on top of the next merge (or send me a new version that
applies on top of the -nut branch I will push/test later today)

Details of the issues below:

On Mon Aug 24, 2026 at 11:47 AM CEST, Deepak Rathore via lists.openembedded=
.org wrote:
> From: Deepak Rathore <deeratho@cisco.com>
>
> This patch applies the upstream backport for CVE-2026-7168.
> The upstream fix commit is referenced in [1], and the public
> CVE advisory is referenced in [2].
>
> [1] https://github.com/curl/curl/commit/c1cfdf59acbaf9504c4578d4cf56cdd7c=
8594507
> [2] https://curl.se/docs/CVE-2026-7168.html
>
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> ---
> Changes in v3:
> - Rebase on top of the revised CVE-2026-6429 patch.
>
> Changes from v1 to v2:
> - Rebase the patches on top of the latest Scarthgap branch.
>
>  .../curl/curl/CVE-2026-7168.patch             | 425 ++++++++++++++++++
>  meta/recipes-support/curl/curl_8.7.1.bb       |   1 +
>  2 files changed, 426 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-7168.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-7168.patch b/meta/re=
cipes-support/curl/curl/CVE-2026-7168.patch
> new file mode 100644
> index 0000000000..0669be6546
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-7168.patch
> @@ -0,0 +1,425 @@
> +From 0f0bb5efbd1e4f2199eeb98e6c62a7a67242cad2 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Fri, 5 Jun 2026 01:22:37 -0700
> +Subject: [PATCH] setopt: clear proxy auth properties when switching
> +
> +Verify with test 1588
> +
> +Closes #21453
> +
> +CVE: CVE-2026-7168
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/c1cfdf59a=
cbaf9504c4578d4cf56cdd7c8594507]
> +
> +Backport Changes:
> +- The upstream lib/setopt.c hunk reuses Curl_auth_digest_cleanup() from =
the
> +  newer tree. curl-8.7.1 does not expose that helper to setopt.c in the =
same
> +  way, so this backport adds the vauth/vauth.h include before applying t=
he
> +  upstream setproxy() cleanup logic.
> +- The upstream tree already provides a CURL_DISABLE_DIGEST_AUTH fallback=
 for
> +  Curl_auth_digest_cleanup(). curl-8.7.1 does not, so this backport adds=
 the
> +  equivalent no-op macro in lib/vauth/vauth.h.
> +- curl-8.7.1 uses tests/data/Makefile.inc and tests/libtest/Makefile.inc
> +  instead of the upstream tests/data/Makefile.am and
> +  tests/libtest/Makefile.am lists.
> +- curl-8.7.1 uses the older libtest harness, so first.h,
> +  test_lib1588(), libtest_arg4, and CURLcode result handling were adapte=
d to
> +  test.h, test(), test_argv[4], and int res.
> +- curl-8.7.1 does not define the newer digest test feature in runtests.p=
l.
> +  This backport defines the target harness feature as digest-auth, match=
ing
> +  tests/server/disabled.c, and makes test 1588 require digest-auth.
> +- The curl-8.7.1 server harness does not handle crlf=3D"headers" correct=
ly on
> +  response data sections for this test, so those attributes were removed=
 from
> +  the two server response blocks and datacheck. The protocol block keeps
> +  crlf=3D"headers" because runtests.pl normalizes protocol verification =
when any
> +  crlf attribute is present.

Related to what really changed, the above is mostly noise :-( You have
to filter/check/edit whatever the LLM generates.

> +
> +(cherry picked from commit c1cfdf59acbaf9504c4578d4cf56cdd7c8594507)
> +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> +---
> + lib/setopt.c               |  18 ++++-
> + lib/vauth/vauth.h          |   2 +
> + tests/data/Makefile.inc    |   1 +
> + tests/data/test1588        | 106 ++++++++++++++++++++++++++
> + tests/libtest/Makefile.inc |   5 +-
> + tests/libtest/lib1588.c    | 152 +++++++++++++++++++++++++++++++++++++
> + tests/runtests.pl          |   2 +
> + 7 files changed, 283 insertions(+), 3 deletions(-)
> + create mode 100644 tests/data/test1588
> + create mode 100644 tests/libtest/lib1588.c
> +
> +diff --git a/lib/setopt.c b/lib/setopt.c
> +index 8a5a5d7..7eaf309 100644
> +--- a/lib/setopt.c
> ++++ b/lib/setopt.c
> +@@ -51,6 +51,7 @@
> + #include "altsvc.h"
> + #include "hsts.h"
> + #include "tftp.h"
> ++#include "vauth/vauth.h"
> + #include "strdup.h"
> + /* The last 3 #include files should be in this order */
> + #include "curl_printf.h"
> +@@ -76,6 +77,20 @@ CURLcode Curl_setstropt(char **charp, const char *s)
> +   return CURLE_OK;
> + }
> +=20
> ++#ifndef CURL_DISABLE_PROXY
            ^ This line is new and not explained in the changes
> ++static CURLcode setproxy(struct Curl_easy *data, const char *proxy)
> ++{
> ++  if((data->set.str[STRING_PROXY] && proxy) &&
> ++     /* there was one set, is this a new one? */
> ++     !strcmp(data->set.str[STRING_PROXY], proxy))
> ++    return CURLE_OK; /* same one as before */
> ++
> ++  Curl_auth_digest_cleanup(&data->state.proxydigest);
> ++  memset(&data->state.authproxy, 0, sizeof(data->state.authproxy));
> ++  return Curl_setstropt(&data->set.str[STRING_PROXY], proxy);
> ++}
> ++#endif
> ++
> + CURLcode Curl_setblobopt(struct curl_blob **blobp,
> +                          const struct curl_blob *blob)
> + {
> [...]
> +diff --git a/tests/libtest/lib1588.c b/tests/libtest/lib1588.c
> +new file mode 100644
> +index 0000000..00c6b35
> +--- /dev/null
> ++++ b/tests/libtest/lib1588.c
> +@@ -0,0 +1,152 @@
> ++ * argv1 =3D URL
> ++ * argv2 =3D proxy host
> ++ * argv3 =3D proxy port
> ++ * argv4 =3D proxyuser:password
> ++ */
> ++
> ++#include "test.h"
> ++#include "testutil.h"
> ++
> ++static CURLcode init1588(CURL *curl, const char *url,
> ++                         const char *userpwd, const char *proxy)
> ++{
> ++  int res =3D CURLE_OK;
The upstream line is "CURLcode result =3D CURLE_OK"
why did the type changed? CURLcode is supported and used the line above.
Why did the variable name changed? This create a lot of noise in the
comparison.

> ++
> ++  res_easy_setopt(curl, CURLOPT_URL, url);
> ++  if(res)
> ++    goto init_failed;
> ++
> [...]
> ++int test(char *URL)
> ++{
> ++  int res =3D CURLE_OK;
> ++  CURL *curl =3D NULL;
> ++  const char *proxyuserpws;
> ++  struct curl_slist *host =3D NULL;
> ++  struct curl_slist *host2 =3D NULL;
> ++  char proxy1_resolve[128];
> ++  char proxy2_resolve[128];
> ++  char proxy1_connect[128];
> ++  char proxy2_connect[128];
> ++
> ++  if(test_argc < 5)
> ++    return TEST_ERR_MAJOR_BAD;
> ++  proxyuserpws =3D test_argv[4];

Upstream code compares argc to 3 not 5. proxyuserpws is added. Why?
Again, this is important and not explained in the changes (or not clear
enough)

> +diff --git a/tests/runtests.pl b/tests/runtests.pl
> +index ddfab20..b40df55 100755
> +--- a/tests/runtests.pl
> ++++ b/tests/runtests.pl
> +@@ -637,6 +637,8 @@ sub checksystemfeatures {
> +             $feature{"Kerberos"} =3D $feat =3D~ /Kerberos/i;
> +             # SPNEGO enabled
> +             $feature{"SPNEGO"} =3D $feat =3D~ /SPNEGO/i;
> ++            # Digest auth enabled unless disabled by build
> ++            $feature{"digest-auth"} =3D 1;
                ^ This is not part of the upstream commit but is from
                  another one.
Please don't squash commits like this or when code is needed try to find
the proper commit to backport (even partially).

> +             # CharConv enabled
> +             $feature{"CharConv"} =3D $feat =3D~ /CharConv/i;
> +             # TLS-SRP enabled
> +--
> +2.35.6
> diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-suppo=
rt/curl/curl_8.7.1.bb
> index 882ab67aae..6b7f6f6f51 100644
> --- a/meta/recipes-support/curl/curl_8.7.1.bb
> +++ b/meta/recipes-support/curl/curl_8.7.1.bb
> @@ -42,6 +42,7 @@ SRC_URI =3D " \
>      file://CVE-2026-5545.patch \
>      file://CVE-2026-6253.patch \
>      file://CVE-2026-6429.patch \
> +    file://CVE-2026-7168.patch \
>  "
> =20
>  SRC_URI:append:class-nativesdk =3D " \


Try to use the interdiff tool to compare the upstream patch and yours,
changes highlighted should be documented (the obvious ones can be
omitted).

Regard,
--=20
Yoann Congal
Smile ECS


