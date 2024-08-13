Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0313C52D7B
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 09:56:41 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.68506.1723542992349721922
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Aug 2024 02:56:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LQd4/viF;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C5A5FF807;
	Tue, 13 Aug 2024 09:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723542990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iiHhyrkuDVVHZ9G3I9byzsTsnUnZWephXc029zJDjPQ=;
	b=LQd4/viFcUL+NGScA8NmLQuWqS++cpVA++BRzMt1pv+bmnRr+o1QSaK/ynBiPskJ4G/z5/
	Maw5BpUJv1wpzjXHZmLSm1Dfnv/PAxSK0GU1uuG8aadRcH1lAf5dygdoet3KY4eoYaMnBl
	eenev5YRfspL+MlIjoIR0vM3umB0EYFQRn0wEF8a/48lFqDOYuFKC6MvnLn8WkuOjJjeay
	IDoG0dcH/rGAzXRP0Q45hT99lsII8qyUAlJQoDG6QaY6jq4uayqF9YDHsHJhjf284o4FOu
	lm1QAYKm9t73X13DQJ+jTfGLCiylzVPKA0h5qEOIHOvV+kkF29HxyMTkATCDBw==
Date: Tue, 13 Aug 2024 11:56:29 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH 1/3] python3: upgrade 3.12.4 -> 3.12.5
Message-ID: <20240813095629734b9d87@mail.local>
References: <20240809122217.3825274-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240809122217.3825274-1-tgamblin@baylibre.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 09:56:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203261

Hello Trevor,

This causes a new ptest failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6894/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6898/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/6725/steps/13/logs/stdio

https://autobuilder.yocto.io/pub/non-release/20240812-77/testresults/qemux86-64-ptest/python3.log

FAIL: test_write_read_limited_history (test.test_readline.TestReadline.test_write_read_limited_history)

======================================================================
ERROR: test_write_read_limited_history (test.test_readline.TestHistoryManipulation.test_write_read_limited_history)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/usr/lib/python3.12/test/test_readline.py", line 153, in test_write_read_limited_history
    readline.read_history_file(TESTFN)
OSError: [Errno 22] Invalid argument

======================================================================
ERROR: test_write_read_limited_history (test.test_readline.TestReadline.test_write_read_limited_history)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/usr/lib/python3.12/test/test_readline.py", line 362, in test_write_read_limited_history
    readline.read_history_file(TESTFN)
OSError: [Errno 22] Invalid argument

----------------------------------------------------------------------
Ran 11 tests in 0.266s

FAILED (errors=2, skipped=3)
test test_readline failed


On 09/08/2024 08:22:15-0400, Trevor Gamblin wrote:
> Changelog: https://docs.python.org/release/3.12.5/whatsnew/changelog.html
> 
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>  .../python/{python3_3.12.4.bb => python3_3.12.5.bb}             | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/python/{python3_3.12.4.bb => python3_3.12.5.bb} (99%)
> 
> diff --git a/meta/recipes-devtools/python/python3_3.12.4.bb b/meta/recipes-devtools/python/python3_3.12.5.bb
> similarity index 99%
> rename from meta/recipes-devtools/python/python3_3.12.4.bb
> rename to meta/recipes-devtools/python/python3_3.12.5.bb
> index 119fe10ca9..5665c90fa9 100644
> --- a/meta/recipes-devtools/python/python3_3.12.4.bb
> +++ b/meta/recipes-devtools/python/python3_3.12.5.bb
> @@ -39,7 +39,7 @@ SRC_URI:append:class-native = " \
>             file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
>             "
>  
> -SRC_URI[sha256sum] = "f6d419a6d8743ab26700801b4908d26d97e8b986e14f95de31b32de2b0e79554"
> +SRC_URI[sha256sum] = "fa8a2e12c5e620b09f53e65bcd87550d2e5a1e2e04bf8ba991dcc55113876397"
>  
>  # exclude pre-releases for both python 2.x and 3.x
>  UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
> -- 
> 2.39.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203168): https://lists.openembedded.org/g/openembedded-core/message/203168
> Mute This Topic: https://lists.openembedded.org/mt/107806767/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

