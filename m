Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F6CEC6FD1D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:19:20 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.9347.1678889954586166987
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:19:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XpQ6rwQc;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 86AAC240003;
	Wed, 15 Mar 2023 14:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678889952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D+JzFL+VGKFtb4lRW0285MP5Vs8F0K0oxjN0zEYuXn4=;
	b=XpQ6rwQcqGvvBTyRJ6IvIjer94bjyC8Cq8GG+/Tu2IqjZGhMflUDSJHvC0SOsKgw3xE7oC
	kR/A+9spfclUqU9mOFCCtKDqpwyjODY7pkkmMBvd2YRYSavrQ8hnJnxwGSAGmni+mcgy04
	WqyAP0ilTYrpW01a7zuElc6R7OEA8/qNrsl8hGpFf1FY7pa6pB4HFHtAnteyro9BfidXKJ
	mcEAt3xdzfmocRHi4y6Js4iM9BMAZ8eyGRv3lDyxeWHUzb6VmgPDv8tL3hOCoLSQ9+Il/0
	f4HdlspwkVyksRjD8tvFo8j2o8xPAbAT4h/7R5hZGrzDiT3pzhfBbKYwUFCjyQ==
Date: Wed, 15 Mar 2023 15:19:12 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: "VAUTRIN Emmanuel (Canal Plus Prestataire)" <Emmanuel.VAUTRIN@cpexterne.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] connman: Backports for security fixes (2) #poky
Message-ID: <20230315141912f7471037@mail.local>
References: <wpQl.1678887096623820376.VRAn@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <wpQl.1678887096623820376.VRAn@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 14:19:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178576

Hello,

On 15/03/2023 06:31:36-0700, VAUTRIN Emmanuel (Canal Plus Prestataire) wrote:
> Fixes
> CVE: CVE-2022-32293
> 
> Commit b33cf2d113d0 ("connman: Backports for security fixes")

Your SoB is required here.


> ---
> .../connman/connman/CVE-2022-32293_p3.patch� �| 67 +++++++++++++++++++
> .../connman/connman_1.41.bb� � � � � � � � � �|� 1 +
> 2 files changed, 68 insertions(+)
> create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2022-32293_p3.patch
> 
> diff --git a/meta/recipes-connectivity/connman/connman/CVE-2022-32293_p3.patch b/meta/recipes-connectivity/connman/connman/CVE-2022-32293_p3.patch
> new file mode 100644
> index 000000000000..0fefe3e45408
> --- /dev/null
> +++ b/meta/recipes-connectivity/connman/connman/CVE-2022-32293_p3.patch
> @@ -0,0 +1,67 @@
> +From e6523511d736667e45877d588a64988e818a06fe Mon Sep 17 00:00:00 2001
> +From: Daniel Wagner <wagi@monom.org>
> +Date: Wed, 7 Sep 2022 20:52:20 +0200
> +Subject: [PATCH] wispr: Fix context refcounting in
> + wispr_portal_request_portal()
> +
> +The wispr_portal_request_portal() function is expected to read until
> +there is no data. Hence, the wp_context refcount is supposed to be
> +hold on while reading.
> +
> +Furthermore, we should not return early when we read the
> +X-ConnMan-Status header. Instead we are supposed to go through the
> +normal return path so that we cleanup any added routing entries. Thus,
> +we also don't need to update the refcount in this code path as we
> +handle it at the main return path.
> +
> +Fixes: 416bfaff9888 ("wispr: Update portal context references")
> +Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=e6523511d736667e45877d588a64988e818a06fe]
> +---
> + src/wispr.c | 10 +++++-----
> + 1 file changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/src/wispr.c b/src/wispr.c
> +index 9b27af5fff55..a7562e8462f3 100644
> +--- a/src/wispr.c
> ++++ b/src/wispr.c
> +@@ -537,7 +537,8 @@ static bool wispr_route_request(const char *address, int ai_family,
> + static void wispr_portal_request_portal(
> + struct connman_wispr_portal_context *wp_context)
> + {
> +- DBG("");
> ++ DBG("wp_context %p %s", wp_context,
> ++ __connman_ipconfig_type2string(wp_context->type));
> +
> + wispr_portal_context_ref(wp_context);
> + wp_context->request_id = g_web_request_get(wp_context->web,
> +@@ -753,7 +754,7 @@ static bool wispr_portal_web_result(GWebResult *result, gpointer user_data)
> + if (length > 0) {
> + g_web_parser_feed_data(wp_context->wispr_parser,
> + chunk, length);
> +- wispr_portal_context_unref(wp_context);
> ++ /* read more data */
> + return true;
> + }
> +
> +@@ -783,8 +784,6 @@ static bool wispr_portal_web_result(GWebResult *result, gpointer user_data)
> + if (g_web_result_get_header(result, "X-ConnMan-Status",
> + &str)) {
> + portal_manage_status(result, wp_context);
> +- wispr_portal_context_unref(wp_context);
> +- return false;
> + } else {
> + wispr_portal_context_ref(wp_context);
> + __connman_agent_request_browser(wp_context->service,
> +@@ -996,7 +995,8 @@ int __connman_wispr_start(struct connman_service *service,
> + struct connman_wispr_portal *wispr_portal = NULL;
> + int index, err;
> +
> +- DBG("service %p", service);
> ++ DBG("service %p %s", service,
> ++ __connman_ipconfig_type2string(type));
> +
> + if (!wispr_portal_hash)
> + return -EINVAL;
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-connectivity/connman/connman_1.41.bb b/meta/recipes-connectivity/connman/connman_1.41.bb
> index 79542b2175dc..73ba673fd0a4 100644
> --- a/meta/recipes-connectivity/connman/connman_1.41.bb
> +++ b/meta/recipes-connectivity/connman/connman_1.41.bb
> @@ -7,6 +7,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
> file://no-version-scripts.patch \
> file://CVE-2022-32293_p1.patch \
> file://CVE-2022-32293_p2.patch \
> +� � � � � �file://CVE-2022-32293_p3.patch \
> file://CVE-2022-32292.patch \
> "
> 
> --
> 2.25.1

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178547): https://lists.openembedded.org/g/openembedded-core/message/178547
> Mute This Topic: https://lists.openembedded.org/mt/97627289/3617179
> Mute #poky:https://lists.openembedded.org/g/openembedded-core/mutehashtag/poky
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

