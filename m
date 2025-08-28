Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB5FCA0EED
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 13:03:45 +0000 (UTC)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web10.20500.1756386219481798008
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Aug 2025 06:03:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=Sm59l1YR;
 spf=pass (domain: baylibre.com, ip: 209.85.218.66, mailfrom: tgamblin@baylibre.com)
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-afede1b3d05so160356466b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 06:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1756386218; x=1756991018; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jdoL+DTZHviZKZ0n445hRcLf7JLWlFXBnoCLVORzdU8=;
        b=Sm59l1YRcppkKuNqEFI4AuZtMa0JBWjf15usVw+G5evmdL+okzyTTO53ufvpjg8kqE
         VKzhYw4rll7EkXYTlGTgb/0QK+T+r6bLDIMqu0h/4txUzcOkjXo/D95zFuK+cqgIlXYf
         umMPjI2imaxXDkBrCCY2d3HyvK9lCGm1pQ6dkBY564Ww+czL+LzP0bF/P7LUm7g+aIXK
         zt9H5m8QVlIzPw+LBaV9YFFsjEs7DQA33m5Db5plN0hg+LF451IN0v1S/bgr28RTPFBs
         LGPC9u0AblJU50jwmzUckyLCSFcObMEYpNrfSaPNGvfQ/Q/RPAU0WVitvaFfwUatj/PB
         I6XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756386218; x=1756991018;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jdoL+DTZHviZKZ0n445hRcLf7JLWlFXBnoCLVORzdU8=;
        b=U4GEJPN6bxvPfo4IYg7dZqqyutBbBP9UuuS9bOty06AfONjkkUhfDqAKzOpOsP89Nm
         Qml/UaWzovBD2SwN9joQkegt+lk5JnRRu5fHZhG4RGQ5Hhica3cOCFuwACgjrEs0XVdt
         zgTlFI0wDNz97h8QAmRs3l0zTt69yqV8ed6luwDXh7W8ocCyK6YW72aw6paobONHQ2U2
         xWZS5jfGdcrkaxto0sUFqSTHQfMtTXlMuUVqN2GyBLuvmCaiZOGfMuHM8zZTz0Rl5/0L
         cCpyLMhUlg3J3ZQeuzRijfLJRqFKHMEm7zgw9PQfrZuAtP7Hc+6M92nsHuwW26+9sJsw
         qT2g==
X-Gm-Message-State: AOJu0Yw9ZRUgYIcipG289RIT6n1zznUiq12jUnccK9W5xzNUi4fvycsS
	vGTmahKCsAk0guz0gJJd/+cwosMGRhiTMJRYw3tpghreBY5lgvjzauSXIQt6v5+KAtc=
X-Gm-Gg: ASbGncv5t00SUuk8VaR2LCpPam4S6LY8Xth/qZPbOnjpHkw7tQimJ+DksUrMPn7g5Gb
	CI6ZxMcOEOroPIF7x7MRNu0vwD46ekCssGO1OqBB8m72xZc5/uiw08PWOgDWW/DfKmDPeofJVO2
	q3OaTsOmPPTJje6QmkoAxkOVE6dZ5mhmc9Ap6qf0DpKMOxgouauuQUa7A7qfJmAVTP5izjeAhbn
	dC5DdJIiXXVePYqia1KR80Qe9KRew55ye7LxcQCmQnEGVG5+EqqaQDaCiMgNxHZdcp9H20Dbr28
	tfPukkWZAsGR7WMT74CEnsaSMHfAhwpSIKUGS5HbfHhVqh+AXhQItZFBIyw2tXOQyFlxYS29Kpr
	KFeEaGpOQHCsluV+dQrax80Ik51H5c6yixJG3X7B8MFXOwTzorZXQpY7Aap610NPWn7q6l5bs8Z
	L6
X-Google-Smtp-Source: AGHT+IEx/ZwPZ0+mh9XCijFgLiXdgVndnZ/YyUN5E0VyrX5z7y7Xer3YcIkNBC+70Rru6SY7SuURYQ==
X-Received: by 2002:a17:906:d54d:b0:afe:ad5b:f5b1 with SMTP id a640c23a62f3a-afead5bfc21mr892083866b.32.1756386217719;
        Thu, 28 Aug 2025 06:03:37 -0700 (PDT)
Received: from [10.149.7.36] (144-178-124-20.static.ef-service.nl. [144.178.124.20])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe7fd59b00sm870917566b.106.2025.08.28.06.03.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 06:03:37 -0700 (PDT)
Message-ID: <37e62f33-96a4-4691-81ba-5fa32c0f76b7@baylibre.com>
Date: Thu, 28 Aug 2025 09:03:36 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH 2/2] python3-cython: upgrade 3.1.2 -> 3.1.3
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
References: <20250828101857.3947730-1-tgamblin@baylibre.com>
 <20250828101857.3947730-2-tgamblin@baylibre.com>
 <CAMSfU+4tCg9qeuUO27hfMdjcg7Gh1a=37Nhu9H-RZu7i6u433w@mail.gmail.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <CAMSfU+4tCg9qeuUO27hfMdjcg7Gh1a=37Nhu9H-RZu7i6u433w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 13:03:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222574


On 2025-08-28 07:17, Yoann Congal wrote:
>
>
> Le jeu. 28 août 2025 à 12:19, Trevor Gamblin via 
> lists.openembedded.org <http://lists.openembedded.org> 
> <tgamblin=baylibre.com@lists.openembedded.org> a écrit :
>
>     Release notes: https://github.com/cython/cython/releases/tag/3.1.3
>
>     Reproducibility OK:
>
>     |2025-08-28 06:15:01,526 - oe-selftest - INFO -
>     ----------------------------------------------------------------------
>     |2025-08-28 06:15:01,526 - oe-selftest - INFO - Ran 1 test in
>     1173.893s
>     |2025-08-28 06:15:01,526 - oe-selftest - INFO - OK
>     |2025-08-28 06:15:05,831 - oe-selftest - INFO - RESULTS:
>     |2025-08-28 06:15:05,832 - oe-selftest - INFO - RESULTS -
>     reproducible.ReproducibleTests.test_reproducible_builds: PASSED
>     (1141.07s)
>     |2025-08-28 06:15:05,950 - oe-selftest - INFO - SUMMARY:
>     |2025-08-28 06:15:05,950 - oe-selftest - INFO - oe-selftest () -
>     Ran 1 test in 1173.894s
>     |2025-08-28 06:15:05,950 - oe-selftest - INFO - oe-selftest - OK -
>     All required tests passed (successes=1, skipped=0, failures=0,
>     errors=0)
>
>
> Hello,
>
> FYI, the same upgrade was sent earlier
> https://lists.openembedded.org/g/openembedded-core/message/222404
Thanks, I didn't see that. I think the numpy one is still OK, though.
>
>
>     Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>     ---
>      .../python/{python3-cython_3.1.2.bb
>     <http://python3-cython_3.1.2.bb> => python3-cython_3.1.3.bb
>     <http://python3-cython_3.1.3.bb>} | 2 +-
>      1 file changed, 1 insertion(+), 1 deletion(-)
>      rename meta/recipes-devtools/python/{python3-cython_3.1.2.bb
>     <http://python3-cython_3.1.2.bb> => python3-cython_3.1.3.bb
>     <http://python3-cython_3.1.3.bb>} (93%)
>
>     diff --git a/meta/recipes-devtools/python/python3-cython_3.1.2.bb
>     <http://python3-cython_3.1.2.bb>
>     b/meta/recipes-devtools/python/python3-cython_3.1.3.bb
>     <http://python3-cython_3.1.3.bb>
>     similarity index 93%
>     rename from meta/recipes-devtools/python/python3-cython_3.1.2.bb
>     <http://python3-cython_3.1.2.bb>
>     rename to meta/recipes-devtools/python/python3-cython_3.1.3.bb
>     <http://python3-cython_3.1.3.bb>
>     index 77dbbe8b2c..dcb61a3634 100644
>     --- a/meta/recipes-devtools/python/python3-cython_3.1.2.bb
>     <http://python3-cython_3.1.2.bb>
>     +++ b/meta/recipes-devtools/python/python3-cython_3.1.3.bb
>     <http://python3-cython_3.1.3.bb>
>     @@ -7,7 +7,7 @@ SECTION = "devel/python"
>      LICENSE = "Apache-2.0"
>      LIC_FILES_CHKSUM =
>     "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
>
>     -SRC_URI[sha256sum] =
>     "6bbf7a953fa6762dfecdec015e3b054ba51c0121a45ad851fa130f63f5331381"
>     +SRC_URI[sha256sum] =
>     "10ee785e42328924b78f75a74f66a813cb956b4a9bc91c44816d089d5934c089"
>
>      inherit pypi setuptools3 cython
>
>     -- 
>     2.50.1
>
>
>     -=-=-=-=-=-=-=-=-=-=-=-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#222555):
>     https://lists.openembedded.org/g/openembedded-core/message/222555
>     Mute This Topic: https://lists.openembedded.org/mt/114932433/4316185
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     [yoann.congal@smile.fr]
>     -=-=-=-=-=-=-=-=-=-=-=-
>
>
>
> -- 
> Yoann Congal
> Smile ECS

