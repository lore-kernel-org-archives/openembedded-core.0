Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 869AFC433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 17:15:46 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.2181.1632762945426155826
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Sep 2021 10:15:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 998E3C000A;
	Mon, 27 Sep 2021 17:15:42 +0000 (UTC)
Date: Mon, 27 Sep 2021 19:15:42 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] libevent: mark util/monotonic_prc_fallback as
 retriable
Message-ID: <YVH8PvaqaHPeA+6d@piout.net>
References: <20210922083506.29630-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210922083506.29630-1-mingli.yu@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Sep 2021 17:15:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156392

Hello,

On 22/09/2021 16:35:06+0800, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> Backport a patch to fix the below ptest failure:
>  # ./run-ptest
>  Running tests:
>  EVPORT
>  Skipping test
>  KQUEUE
>  Skipping test
>  EPOLL
>  test-eof: OKAY
>  test-dumpevents: OKAY (output not checked)
>  regress:
>   FAIL ../libevent-2.1.12-stable/test/regress_util.c:1478: assert(diff.tv_sec == 0): 1 vs 0 util/monotonic_prc_fallback:
>   [monotonic_prc_fallback FAILED]
>  1/312 TESTS FAILED. (33 skipped)
>  FAILED
>  regress_debug:
>   FAIL ../libevent-2.1.12-stable/test/regress_util.c:1478: assert(diff.tv_sec == 0): 1 vs 0 util/monotonic_prc_fallback:
>   [monotonic_prc_fallback FAILED]
>  1/312 TESTS FAILED. (33 skipped)
>  FAILED
>  [snip]
> 

Thanks, I did apply this patch on top of my kirkstone-next branch for a
while and unfortunately, this didn't solve the issue on the
autobuilders. What I know for now is that the time difference in the
loop is not the issue and what is failing is actually the setup of the
build, i.e, the evutil_configure_monotonic_time_() call fails in
test_evutil_monotonic_prc(). I still dodn't find why as this should
simply return 0 under Linux. We are looking at thet a bit more in depth
this week but we may end up disabling that test.


> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  ...-monotonic_prc_fallback-as-retriable.patch | 30 +++++++++++++++++++
>  .../libevent/libevent_2.1.12.bb               |  1 +
>  2 files changed, 31 insertions(+)
>  create mode 100644 meta/recipes-support/libevent/libevent/0001-test-mark-util-monotonic_prc_fallback-as-retriable.patch
> 
> diff --git a/meta/recipes-support/libevent/libevent/0001-test-mark-util-monotonic_prc_fallback-as-retriable.patch b/meta/recipes-support/libevent/libevent/0001-test-mark-util-monotonic_prc_fallback-as-retriable.patch
> new file mode 100644
> index 0000000000..754c446a67
> --- /dev/null
> +++ b/meta/recipes-support/libevent/libevent/0001-test-mark-util-monotonic_prc_fallback-as-retriable.patch
> @@ -0,0 +1,30 @@
> +From 8fc3fb57ac1b1b0f338506cb86e3adac29d684d7 Mon Sep 17 00:00:00 2001
> +From: Azat Khuzhin <azat@libevent.org>
> +Date: Wed, 22 Sep 2021 15:14:01 +0800
> +Subject: [PATCH] test: mark util/monotonic_prc_fallback as retriable
> +
> +Refs: #1193
> +
> +Upstream-Status: Backport [https://github.com/libevent/libevent/commit/04fcd7c6df158bb65261867de4b9ec8439696934]
> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + test/regress_util.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/test/regress_util.c b/test/regress_util.c
> +index 45caa27..a9e80db 100644
> +--- a/test/regress_util.c
> ++++ b/test/regress_util.c
> +@@ -1672,7 +1672,7 @@ struct testcase_t util_testcases[] = {
> + 	{ "monotonic_res_fallback", test_evutil_monotonic_res, TT_OFF_BY_DEFAULT, &basic_setup, (void*)"fallback" },
> + 	{ "monotonic_prc", test_evutil_monotonic_prc, 0, &basic_setup, (void*)"" },
> + 	{ "monotonic_prc_precise", test_evutil_monotonic_prc, TT_RETRIABLE, &basic_setup, (void*)"precise" },
> +-	{ "monotonic_prc_fallback", test_evutil_monotonic_prc, 0, &basic_setup, (void*)"fallback" },
> ++	{ "monotonic_prc_fallback", test_evutil_monotonic_prc, TT_RETRIABLE, &basic_setup, (void*)"fallback" },
> + 	{ "date_rfc1123", test_evutil_date_rfc1123, 0, NULL, NULL },
> + 	{ "evutil_v4addr_is_local", test_evutil_v4addr_is_local, 0, NULL, NULL },
> + 	{ "evutil_v6addr_is_local", test_evutil_v6addr_is_local, 0, NULL, NULL },
> +-- 
> +2.17.1
> +
> diff --git a/meta/recipes-support/libevent/libevent_2.1.12.bb b/meta/recipes-support/libevent/libevent_2.1.12.bb
> index 4b419eab22..3f29c0cffe 100644
> --- a/meta/recipes-support/libevent/libevent_2.1.12.bb
> +++ b/meta/recipes-support/libevent/libevent_2.1.12.bb
> @@ -16,6 +16,7 @@ SRC_URI = "https://github.com/libevent/libevent/releases/download/release-${PV}-
>             file://run-ptest \
>             file://0001-test-regress_dns.c-patch-out-tests-that-require-a-wo.patch \
>             file://0002-test-regress.h-Increase-default-timeval-tolerance-50.patch \
> +           file://0001-test-mark-util-monotonic_prc_fallback-as-retriable.patch \
>             "
>  
>  SRC_URI[sha256sum] = "92e6de1be9ec176428fd2367677e61ceffc2ee1cb119035037a27d346b0403bb"
> -- 
> 2.32.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156237): https://lists.openembedded.org/g/openembedded-core/message/156237
> Mute This Topic: https://lists.openembedded.org/mt/85785430/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

