Return-Path: <sujith.h@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 98A3171A40
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2016 05:58:45 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id n24so11218098pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Oct 2016 22:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=4guuTWRO7u6zB7EuyxbV4TQxOG+CfFmDL9pFKAZZmAA=;
	b=cqX9V4eMx1CV/+Aiaj7IQ//9lR5lpHNSOOaQ7SJIhKlZh7nst7d8qDenZydGhLprpl
	5Ulzf3spEyW4k/KjT0h44e5KvjysOlpmW7zJNByPT63t7Ek4ahU9ZKxMWiQ4jwOIX6xH
	nwv+z1bjWsXCGmUSDAx4GCc+UKaHOBDDlhcqV4Naj56YSeqfCdg1AjIoj19K0p8c7Kcr
	/o0fW4VNKVFfLMUA7DC2kW76BZKTvugymJ4aaTgGGVqbpyGfycc7BP79Ux23M+iTR6lH
	5Xis30a0MkuMTGfLVWUgOMKKlElTX2W15cFN+jcbvzEE1GCMe8rS3n1BJWQ99uG4kIsV
	XJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4guuTWRO7u6zB7EuyxbV4TQxOG+CfFmDL9pFKAZZmAA=;
	b=JkhbQ026AoN5Rc5ZWTajQLacBmWkxT88fUGoqPCmr8AuYF37Y/e4UdJXsCgQeuLpX7
	fvw7DTDrQT6HKslepJdedgCv5xKUcT9aj3RbLSf1TJ7O7x23vnn2tAuheB8eDDsZPYsA
	CFgGhEVvAqZ6GgP8cx0WYp6EsLnMirjygDgz1wdQsyz+JeA3TF6UfYbj0Ocsz6yg/Mpb
	Xul8hzCpjdxmPXeuDpFV4CjYbRQp4LaNaW9FBg6ZSN4DQbpgHanduC5kTWyeo2YXkh3t
	AZThMPUaUhhdGSudZgZKitja5THr7s0t6b/J230+iOjDbnrL1E3dni3udew1pTPWV4qD
	PTnA==
X-Gm-Message-State: AA6/9RmgvLKno/BqNeu6dHkdvOzrDbJ30nt01O8yXJd7yoANpVpvVaY1ihQCkBkEHtCwjA==
X-Received: by 10.98.8.197 with SMTP id 66mr4212784pfi.76.1475647126362;
	Tue, 04 Oct 2016 22:58:46 -0700 (PDT)
Received: from kdekidd0.inp-wifi.mentorg.com ([139.181.35.34])
	by smtp.gmail.com with ESMTPSA id
	b123sm10932222pfa.96.2016.10.04.22.58.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 04 Oct 2016 22:58:45 -0700 (PDT)
From: Sujith H <sujith.h@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Oct 2016 11:28:39 +0530
Message-Id: <1475647119-465-1-git-send-email-sujith.h@gmail.com>
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
X-List-Received-Date: Wed, 05 Oct 2016 05:58:45 -0000

From: Sujith Haridasan <Sujith_Haridasan@mentor.com>

This patch brings the last bit from meta-mentor for the perf
to build successfully with minnowmax BSP. The meta-mentor
commit for the same is:
http://git.yoctoproject.org/cgit/cgit.cgi/meta-mentor/commit/meta-mentor-staging?id=a8db95c0d4081cf96915e0c3c4063a44f55e21cc

The previous fix:
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/recipes-kernel/perf?id=ef942d6025e1a339642b10ec1e29055f4ee6bd46
was incomplete and was not submitted upstream. And due to that this change is required.

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


