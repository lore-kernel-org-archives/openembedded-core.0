Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A8D7CD6E4C
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 07:30:11 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23140.1780299006401930762
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 00:30:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=b4mdA2vR;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202606010730028be7345656000207e0-9xcqnr@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202606010730028be7345656000207e0
        for <openembedded-core@lists.openembedded.org>;
        Mon, 01 Jun 2026 09:30:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=xfBxvAWV357Bc7Sbmr1EipXJnettvYrx561Ue1aEwEo=;
 b=b4mdA2vR2x3xo5eAi3IRj0YRJMeW+APzl5TXz48OhdeuGZ0Tl++413iLapdrpd0gDG8RPM
 HFPCJkyAznehoBKGWsRUoPsR+oOSytqG3Xj+SZ8bFtkclchNQd/DvpTUm3rrJmFC80+HO1aQ
 tOD/P6Ae5sVcSVpgqBJDS9Lhu3Ua4K3sxiYxiWWIKZ7M/Xmek8kGIgZkk8l39h90dE2v/GTJ
 /3sollN2U2ecy4OfLPbneOaTnw3AXaNxcdIMuHLKiLtXSxNqHe/DJCzCXIw9gZ0FUS4lSo0H
 sn91/1MZspCgW3I9C/amjSkSDohCKMH2oE4il3i6tuVl1x14ydTNFGdQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH] perf: make libraries for install_headers configurable
Date: Mon,  1 Jun 2026 09:29:56 +0200
Message-ID: <20260601072956.11823-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 07:30:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237816

From: Peter Marko <peter.marko@siemens.com>

Older kernels don't support install_headers for all libraries.
For instance kernel 6.1 fails for two (api and symbol) with:
make: *** No rule to make target 'install_headers'.  Stop.

Also sort the list when moving to variable.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 089e2571b1a220607b00a16c87c1a2dcdcde9792)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-kernel/perf/perf.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index f24b44954e7..c3ef25fd999 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -169,6 +169,9 @@ PERF_EXTRA_LDFLAGS:mipsarchn32el = "-m elf32ltsmipn32"
 PERF_EXTRA_LDFLAGS:mipsarchn64eb = "-m elf64btsmip"
 PERF_EXTRA_LDFLAGS:mipsarchn64el = "-m elf64ltsmip"
 
+# override for older kernels which don't support installing headers for all libraries
+REPRODUCIBLE_HEADERS_TARGETS ?= "api bpf perf subcmd symbol"
+
 do_compile() {
 	# Linux kernel build system is expected to do the right thing
 	unset CFLAGS
@@ -179,7 +182,7 @@ do_compile() {
 	# There are two copies of internal headers such as:
 	# libperf/include/internal/xyarray.h and tools/lib/perf/include/internal/xyarray.h
 	# For reproducibile binaries, we need to find one copy, hence force libXXX to be created first
-	for i in api bpf subcmd symbol perf
+	for i in ${REPRODUCIBLE_HEADERS_TARGETS}
 	do
 		oe_runmake -C ${S}/tools/lib/$i DESTDIR=${B}/lib$i prefix= install_headers V=1
 	done

