Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F47FFF885A
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 09:46:24 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35110.1777974374015243389
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 02:46:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=VinZZ7pS;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20260505094610750a4b9beb0002076c-5xqtlm@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260505094610750a4b9beb0002076c
        for <openembedded-core@lists.openembedded.org>;
        Tue, 05 May 2026 11:46:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=1GAqUuxWX4Q96oVXemvfMe2c7khXvXcbG7khqRM8YCo=;
 b=VinZZ7pSL3ziXiDPuOR6yn0mOgE/Ei9KcC+jDD5PFRZ0Jqn7HJs4yE6Gdu8+oWYBF7Fyoq
 2GptHBhkBYi22O3xiecXaNecNvu4oGOgSnKKXPoCDbi0wybQGewTCc5nbiXynCsG/7Aee98A
 kIq7J8p5q4cvjntpvnJ67RaDb42OMcD18SkxL0AuoDVSjZ7RYxuk8rA+2v/EuFihpIyAAC1f
 eHTCHXf+mkV8nZfyVvV8q8RRMuW6NBbWUXJg9dQJnUTtnXlIiXZ1I0ASuQQrW6ErEK2+XhdO
 htfAEO4vovdjdPSVcMa2FAQXRV96l3lvPBVw3V7kz6CsRB4oElhN8fag==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] perf: make libraries for install_headers configurable
Date: Tue,  5 May 2026 11:46:01 +0200
Message-ID: <20260505094601.1315091-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 09:46:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236477

From: Peter Marko <peter.marko@siemens.com>

Older kernels don't support install_headers for all libraries.
For instance kernel 6.1 fails for two (api and symbol) with:
make: *** No rule to make target 'install_headers'.  Stop.

Also sort the list when moving to variable.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-kernel/perf/perf.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index f24b44954e..c3ef25fd99 100644
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

