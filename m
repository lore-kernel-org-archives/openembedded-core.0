Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68537C4829A
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 14:56:05 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.13519.1707836158682154935
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 06:55:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=q4H+Wd8N;
 spf=pass (domain: baylibre.com, ip: 209.85.222.170, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-785d56fbc57so130667985a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 06:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707836158; x=1708440958; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uGMNKbmx2uRe1ur5JH8NyPmnmQpsBGA7c4br5g/gOTQ=;
        b=q4H+Wd8NlODP/6dQN+OxrNhlPr7TrRVGiR+Yx8vc0Y4KW8TjjA7LFE8fo1/a4Alc/a
         O6RW/SWUKDR/DvkqOBzBOWZhxBftqjhgOdB66Db087i7thzYydPYWM7/8anziUhk5Ngd
         R8gZSTwCzPAUh88ju1oMxG2P2wssLTZXZGPWUAiLMHJ0LM5ZOJwljvlZ343ZPAwx9M6/
         5BkKxOjT2HMbHhfFE910rrVK7KsBGjHQsv9m3DgZ7SYt+kUIte6gnJrF8tOKljN3QkOP
         SvMnT6WYIV6kBLLjdbUOrqhN00hRvSUkT+O94s/qcqQdJ+3YbTonVuXl5OuWKaJCIVFN
         rEuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707836158; x=1708440958;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uGMNKbmx2uRe1ur5JH8NyPmnmQpsBGA7c4br5g/gOTQ=;
        b=eijlK/qUXibn5RwYXv6FX8naMMwR0cYtjz9sdLY2P5usERZixneq/bfO8k+tjXQfE5
         WsLstOYfP56DxhbAsBd0KDaDyPnjWGVEluz8OgZTU2ufOlmA7yqGWmgrjUAjjNzfG7YX
         LllwQ0Kmm6mGIwczfNLWvy6B67wQ2UsoAUMp4GsTtiqsXDVZNxiab4qS9FGlJ7dEFp34
         5qF43LrzUCom8rGrQfQY73ZoupQJZVkMuCFqg6qXdUDG/eIy1kPydgkz1raKL/Fk5//d
         fYk7cWE+BJ/3lK7A8e57yR90f3GQGHhtyP8W8PoifLL9NuqNN4n79O9Tqlb+uiDBJtZw
         3M9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXsHzTSdc1opycJGFzwImXKKYm9RflKt+EYwNbrFzu2g1NR4k0yBncpeppufcF69+l5egmAF85nRhwFafwtl3e2e5GXOvGfr5VAVpkvQTMzhNZs5+DNFU4b
X-Gm-Message-State: AOJu0Yyp1u08A/zH9n9whHf34TWNfC12AEnWifgdCo9JH780xuWMmrfu
	OXqYfIbxGs5hWUTdKKrsusNk2LoMN6HfoLj+n95cAp0n/NnaLmCjdlL+RDBr0OqZezM9EuR7INN
	A
X-Google-Smtp-Source: AGHT+IFfZRkK8lf+NMpcLPCAONyPxvGTMODge59yakLBWp/hPnY1WkXBTXN9hAMhzHPjTf6rnLJKag==
X-Received: by 2002:a05:6214:dc3:b0:68e:e9ab:957a with SMTP id 3-20020a0562140dc300b0068ee9ab957amr2598883qvt.8.1707836157662;
        Tue, 13 Feb 2024 06:55:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU9+OWo7MkZI8sDiZL+9idAnzPtH2T1Ck9Adfij2PwNzlWZALaLJw+sfM/nW8LBFk72fj4AuUshFvuRQY3fk2XW+8dcDHkucvA/N4Bm4jfADZXXQiBwdB+C
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id na4-20020a0562142d4400b0068ef90b40fasm149576qvb.107.2024.02.13.06.55.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 06:55:57 -0800 (PST)
Message-ID: <cf013188-f838-4d44-ae15-21f2d6fc4e5b@baylibre.com>
Date: Tue, 13 Feb 2024 09:55:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] patchtest: Add selftest for test
 cve_check_ignore
Content-Language: en-US
To: =?UTF-8?Q?Simone_Wei=C3=9F?= <simone.p.weiss@posteo.com>,
 openembedded-core@lists.openembedded.org
References: <20240210135259.563083-1-simone.p.weiss@posteo.com>
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <20240210135259.563083-1-simone.p.weiss@posteo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 14:56:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195408


On 2024-02-10 08:52, Simone Weiß wrote:
> From: Simone Weiß <simone.p.weiss@posteo.com>
>
> Add a selftest for the recently introduced check for CVE_CHECK_IGNORE.
Hi, sorry for the late reply. Were you able to test this successfully 
using the patchtest selftest run (or by manually running patchtest on 
the test patches)? I am seeing both cases skip on my end.
>
> Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
> ---
>   .../TestMetadata.test_cve_check_ignore.fail   | 30 ++++++++++++++++++
>   .../TestMetadata.test_cve_check_ignore.pass   | 31 +++++++++++++++++++
>   2 files changed, 61 insertions(+)
>   create mode 100644 meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignore.fail
>   create mode 100644 meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignore.pass
>
> diff --git a/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignore.fail b/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignore.fail
> new file mode 100644
> index 0000000000..3574463ade
> --- /dev/null
> +++ b/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignore.fail
> @@ -0,0 +1,30 @@
> +From c4ca86b9cca3643097db0328e2f34dccffbba309 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
> +Date: Sat, 10 Feb 2024 13:18:44 +0100
> +Subject: [PATCH] selftest-hello: add CVE_CHECK_IGNORE
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +This should fail the test_cve_tag_format selftest.
> +
> +Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
> +---
> + .../recipes-test/selftest-hello/selftest-hello_1.0.bb          | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +index 547587bef4..3ef9b87c34 100644
> +--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> ++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +@@ -16,4 +16,5 @@ do_install() {
> + 	install -m 0755 helloworld ${D}${bindir}
> + }
> +
> +-BBCLASSEXTEND = "native nativesdk"
> +\ No newline at end of file
> ++CVE_CHECK_IGNORE = "CVE-2024-12345"
> ++BBCLASSEXTEND = "native nativesdk"
> +--
> +2.39.2
> +
> diff --git a/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignore.pass b/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignore.pass
> new file mode 100644
> index 0000000000..10f942a6eb
> --- /dev/null
> +++ b/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignore.pass
> @@ -0,0 +1,31 @@
> +From 7d4d3fee0c7111830ee9b2b049ae3ce265b26030 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
> +Date: Sat, 10 Feb 2024 13:23:56 +0100
> +Subject: [PATCH] selftest-hello: add CVE_STATUS
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +This should pass the test_cve_tag_format selftest.
> +
> +Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
> +---
> + .../recipes-test/selftest-hello/selftest-hello_1.0.bb         | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +index 547587bef4..9908b3b417 100644
> +--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> ++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +@@ -16,4 +16,6 @@ do_install() {
> + 	install -m 0755 helloworld ${D}${bindir}
> + }
> +
> +-BBCLASSEXTEND = "native nativesdk"
> +\ No newline at end of file
> ++CVE_STATUS[CVE-2024-12345] = "not-applicable-platform: Issue only applies on Windows"
> ++
> ++BBCLASSEXTEND = "native nativesdk"
> +--
> +2.39.2
> +
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195273): https://lists.openembedded.org/g/openembedded-core/message/195273
> Mute This Topic: https://lists.openembedded.org/mt/104277396/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

