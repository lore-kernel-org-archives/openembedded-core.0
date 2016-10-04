Return-Path: <sujith.h@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 805AB71A0E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2016 09:41:10 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id b184so18727757wma.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Oct 2016 02:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=K58HP8VffPE8+K2bPi/uiSkSMEb7B3nn4XUCNSH98nQ=;
	b=AlTq+HfxmTiCDnNBSiyQB2Olh46JlNp7jrEvJn1igF9JFhf+olTCufM4Qb1liSFKRy
	gNiCrP9PMk37dtzpoOKYoehNn9Jc7zY/11T8bromA1smFje5Fmt1dW1UFvn8l9HrFYkf
	c3mMJhzVV/5IvkNRscaoB8N4AUpiOPWQMI5HhRdnggz/OCnEhJufARu94c9A3rF2S226
	1wOtHbYwACclpTgRbHAWmjt8v30gYjwAKAB6xGWF7XsOB9HN5DOpXDK6mG+HYyvIUcZO
	8YuHCR0PQRvrf2b4P/z6HN+wzN/SKfH6V4HpjF8AkayaCni+aXueBZWaq/R3+RtedeJa
	BNzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=K58HP8VffPE8+K2bPi/uiSkSMEb7B3nn4XUCNSH98nQ=;
	b=PQ7K4iJC8AwuO5wt6lFUAwLmxwYFlYX00LxAhPGkmqzzXFvvskjNqW2WBUbzjkrSc6
	WtKXZsX4cUHS9KCKd0bzmRZ11+qacUEGr/Lr1VGZwNM8CLK2t+srmFIEQsie3FMgd7pT
	2IetRtNry8irUSL3qN6PJbru+lwv9Y6jsCuIciZp+NVls3JQbyuCaruDXpPOQjqM/Go6
	vXDk0bRaIbW58b7UXLL/1EUKmhT2bTsz4IWt66NfxP3PcZTSxZgWjsDHEbkfQqn5epWh
	fTkVryeX1IyqRFjIbIkSM7GWyAKxHm4iU62NtesBjtKjA90OSmlhLNbABxUgDXD93EZX
	xXxw==
X-Gm-Message-State: AA6/9RkjYkVaLDQwK0ixWuydLWgNz2i2sznMrYgcqIpwiJ+X8cgpo5wrcYTBlonfnuQVfg==
X-Received: by 10.28.9.194 with SMTP id 185mr3170036wmj.108.1475574071622;
	Tue, 04 Oct 2016 02:41:11 -0700 (PDT)
Received: from kdekidd0.inp-wifi.mentorg.com ([139.181.35.34])
	by smtp.gmail.com with ESMTPSA id
	x124sm23373134wmf.22.2016.10.04.02.41.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 04 Oct 2016 02:41:11 -0700 (PDT)
From: Sujith H <sujith.h@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Oct 2016 15:11:04 +0530
Message-Id: <1475574064-30613-1-git-send-email-sujith.h@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Sujith Haridasan <Sujith_Haridasan@mentor.com>
Subject: [PATCH] perf: Fix to obey LD failure
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Oct 2016 09:41:12 -0000

From: Sujith Haridasan <Sujith_Haridasan@mentor.com>

When built on minnowmax ( machine name: intel-corei7-64),
an error is noticed during the do_compile:

 /home/sujith/codebench-linux-install-2015.12-133-i686-pc-linux-gnu/codebench/bin/i686-pc-linux-gnu-ld:
Relocatable linking with relocations from format elf64-x86-64
(/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/fd/array.o)
to format elf32-i386 (/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/fd/libapi-in.o)
is not supported

This change help fix the issue.

Signed-off-by: Sujith Haridasan <Sujith_Haridasan@mentor.com>
---
 meta/recipes-kernel/perf/perf.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 0d104d3..471023d 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -170,6 +170,7 @@ do_configure_prepend () {
     if [ -e "${S}/tools/perf/Makefile.perf" ]; then
         sed -i 's,CC = $(CROSS_COMPILE)gcc,#CC,' ${S}/tools/perf/Makefile.perf
         sed -i 's,AR = $(CROSS_COMPILE)ar,#AR,' ${S}/tools/perf/Makefile.perf
+        sed -i 's,LD = $(CROSS_COMPILE)ld,#LD,' ${S}/tools/perf/Makefile.perf
     fi
     if [ -e "${S}/tools/lib/api/Makefile" ]; then
         sed -i 's,CC = $(CROSS_COMPILE)gcc,#CC,' ${S}/tools/lib/api/Makefile
-- 
1.9.1


