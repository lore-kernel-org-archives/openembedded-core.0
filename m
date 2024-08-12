Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A7BFC3DA7F
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 04:09:31 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.38810.1723435769179930395
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Aug 2024 21:09:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YreF+hHa;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-428f5c0833bso27316615e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Aug 2024 21:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723435767; x=1724040567; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OkTa/98hIRKPFlwAaDSDreK1dxQgWRupIXuqrodBqtI=;
        b=YreF+hHaGsTG4pTQNXWPT6gDbRNFZ8i/x+vYPJQi31o53sRFrBqLqfopt6oyruwkpp
         fgtJYaInSNlxahNILnhbLu2jYy2flKaFH3tSI6joR1lK4kIp1pdH771oGSpP7dkCktUn
         fR0CDQApgz9lzgdQ1bA+/aoyXQvSLUNL5v8JL6uYn+ifGl8qZiIp45pKkfFaeuyZ2STh
         bjMw1LpSCKi/nVMk7YVnXcKXKztjORP4JX2NXT5QAJPnsl/gqkvzxbMxubXkKe+9CElM
         65vTFgkyANHYoq39bNJPqUpD4kxemsSuBeZLJGdccnfgdFpywyZMGT6YIusAaP88LbsE
         sOEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723435767; x=1724040567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OkTa/98hIRKPFlwAaDSDreK1dxQgWRupIXuqrodBqtI=;
        b=gMBv6aPz1Tb6Teu0r0lorhiDdJmpWZqZXEOWg6Tr2sxPteqRx45crM60m3AhkA+wZS
         iTfpvPE/qB9JKDACtlRn/J4pbKDs7Cc+YIdVaZkwf1dBxnzVWGUO4sXhaSpKXwasbEtc
         YI0nsbmGwRhztK6wQSJ/fZTNxaGVEuIljt7P9XGHHJ5tcGrNmYDniKEx0noDaqCt4VLt
         DdM36BQDvi6xkK2cQqJJQvhIDnzREBz0wtg7w5/Ab3fMu8F0O3s/66f+axhsT2pUVO6U
         MZQ9xzNXKknGEplwAMNKSd+jgM3jjffXdUqfAeAW/udPEH1gU/4tMWnKf29mH3w+9rX8
         IzkQ==
X-Gm-Message-State: AOJu0YzQbDw62DNZggVgAg/Joe9eYQuAISU5wVIyMY1tbBHKVJx7GFiv
	7yqkU1BUxUzc2UCMb6G5SSPBcDOpDkkB7bo9pbZcoqDs/0jt/hhpxNRIEQ==
X-Google-Smtp-Source: AGHT+IH5z7vBEEVe7o7kLeLsT4WWDRkCGu61XEi09QZjth/Gv0iC16WHtLAoFin+TLF57lq1Tl8NkA==
X-Received: by 2002:a05:600c:1827:b0:428:837:7015 with SMTP id 5b1f17b1804b1-4290b8b0ffbmr97712855e9.13.1723435766533;
        Sun, 11 Aug 2024 21:09:26 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:76:4400:56c3:4c21:1a48:89b5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290c7bc8c3sm174144655e9.47.2024.08.11.21.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 21:09:25 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@syslinbit.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@syslinbit.com>
Subject: [PATCH v4][OE-core 2/6] cve-extra-inclusions: encode CPEs of affected packages
Date: Mon, 12 Aug 2024 06:09:07 +0200
Message-ID: <20240812040911.13096-2-marta.rybczynska@syslinbit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240812040911.13096-1-marta.rybczynska@syslinbit.com>
References: <20240812040911.13096-1-marta.rybczynska@syslinbit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 04:09:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203195

Add the new cpe:vendor:product tagging to entries in cve-extra-inclusions, using
product/vendor combinations that are already present in OE-core (usually there
is no specific vendor).

Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
---
 .../distro/include/cve-extra-exclusions.inc   | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
index fcef6a14fb..ffbbb7bef1 100644
--- a/meta/conf/distro/include/cve-extra-exclusions.inc
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -16,11 +16,11 @@
 #
 
 # strace https://nvd.nist.gov/vuln/detail/CVE-2000-0006
-CVE_STATUS[CVE-2000-0006] = "upstream-wontfix: CVE is more than 20 years old \
+CVE_STATUS[CVE-2000-0006] = "upstream-wontfix: cpe:*:strace: CVE is more than 20 years old \
 with no resolution evident. Broken links in CVE database references make resolution impractical."
 
 # epiphany https://nvd.nist.gov/vuln/detail/CVE-2005-0238
-CVE_STATUS[CVE-2005-0238] = "upstream-wontfix: \
+CVE_STATUS[CVE-2005-0238] = "upstream-wontfix: cpe:*:epiphany: \
 The issue here is spoofing of domain names using characters from other character sets. \
 There has been much discussion amongst the epiphany and webkit developers and \
 whilst there are improvements about how domains are handled and displayed to the user \
@@ -28,7 +28,7 @@ there is unlikely ever to be a single fix to webkit or epiphany which addresses
 problem. There isn't any mitigation or fix or way to progress this further."
 
 # glibc https://nvd.nist.gov/vuln/detail/CVE-2010-4756
-CVE_STATUS[CVE-2010-4756] = "upstream-wontfix: \
+CVE_STATUS[CVE-2010-4756] = "upstream-wontfix: cpe:*:glibc: \
 Issue is memory exhaustion via glob() calls, e.g. from within an ftp server \
 Best discussion in https://bugzilla.redhat.com/show_bug.cgi?id=681681 \
 Upstream don't see it as a security issue, ftp servers shouldn't be passing \
@@ -38,7 +38,7 @@ this to libc glob. Upstream have no plans to add BSD's GLOB_LIMIT or similar."
 # go https://nvd.nist.gov/vuln/detail/CVE-2020-29511
 CVE_STATUS_GROUPS += "CVE_STATUS_GO"
 CVE_STATUS_GO = "CVE-2020-29509 CVE-2020-29511"
-CVE_STATUS_GO[status] = "not-applicable-config: \
+CVE_STATUS_GO[status] = "not-applicable-config: cpe:golang:go: \
 The encoding/xml package in go can potentially be used for security exploits if not used correctly \
 CVE applies to a netapp product as well as flagging a general issue. We don't ship anything \
 exposing this interface in an exploitable way"
@@ -50,7 +50,7 @@ CVE-2015-2656 CVE-2015-4754 CVE-2015-4764 CVE-2015-4774 CVE-2015-4775 CVE-2015-4
 CVE-2015-4778 CVE-2015-4779 CVE-2015-4780 CVE-2015-4781 CVE-2015-4782 CVE-2015-4783 CVE-2015-4784 \
 CVE-2015-4785 CVE-2015-4786 CVE-2015-4787 CVE-2015-4788 CVE-2015-4789 CVE-2015-4790 CVE-2016-0682 \
 CVE-2016-0689 CVE-2016-0692 CVE-2016-0694 CVE-2016-3418 CVE-2020-2981"
-CVE_STATUS_DB[status] = "upstream-wontfix: Since Oracle relicensed bdb, the open source community is slowly but surely \
+CVE_STATUS_DB[status] = "upstream-wontfix: cpe:*:berkeley_db: Since Oracle relicensed bdb, the open source community is slowly but surely \
 replacing bdb with supported and open source friendly alternatives. As a result this CVE is unlikely to ever be fixed."
 
 # Kernel CVEs that are generic but can't be added to the kernel's hand-maintained cve-exclusion.inc
@@ -60,25 +60,25 @@ replacing bdb with supported and open source friendly alternatives. As a result
 # For OE-Core our policy is to stay as close to the kernel stable releases as we can. This should
 # ensure the bulk of the major kernel CVEs are fixed and we don't dive into each individual issue
 # as the stable maintainers are much more able to do that.
-CVE_STATUS[CVE-1999-0524] = "ignored: issue is that ICMP exists, can be filewalled if required"
-CVE_STATUS[CVE-2008-4609] = "ignored: describes design flaws in TCP"
-CVE_STATUS[CVE-2010-4563] = "ignored: low impact, only enables detection of hosts which are sniffing network traffic"
-CVE_STATUS[CVE-2011-0640] = "ignored: requires physical access and any mitigation would mean USB is impractical to use"
+CVE_STATUS[CVE-1999-0524] = "ignored: cpe:*:linux_kernel:issue is that ICMP exists, can be filewalled if required"
+CVE_STATUS[CVE-2008-4609] = "ignored: cpe:*:linux_kernel:describes design flaws in TCP"
+CVE_STATUS[CVE-2010-4563] = "ignored: cpe:*:linux_kernel:low impact, only enables detection of hosts which are sniffing network traffic"
+CVE_STATUS[CVE-2011-0640] = "ignored: cpe:*:linux_kernel:requires physical access and any mitigation would mean USB is impractical to use"
 
 # qemu:qemu-native:qemu-system-native https://nvd.nist.gov/vuln/detail/CVE-2021-20255
-CVE_STATUS[CVE-2021-20255] = "upstream-wontfix: \
+CVE_STATUS[CVE-2021-20255] = "upstream-wontfix: cpe:*:qemu: \
 There was a proposed patch https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg06098.html \
 qemu maintainers say the patch is incorrect and should not be applied \
 The issue is of low impact, at worst sitting in an infinite loop rather than exploitable."
 
 # qemu:qemu-native:qemu-system-native https://nvd.nist.gov/vuln/detail/CVE-2019-12067
-CVE_STATUS[CVE-2019-12067] = "upstream-wontfix: \
+CVE_STATUS[CVE-2019-12067] = "upstream-wontfix: cpe:*:qemu: \
 There was a proposed patch but rejected by upstream qemu. It is unclear if the issue can \
 still be reproduced or where exactly any bug is. \
 We'll pick up any fix when upstream accepts one."
 
 # nasm:nasm-native https://nvd.nist.gov/vuln/detail/CVE-2020-18974
-CVE_STATUS[CVE-2020-18974] = "upstream-wontfix: \
+CVE_STATUS[CVE-2020-18974] = "upstream-wontfix: cpe:*:netwide_assembler: \
 It is a fuzzing related buffer overflow. It is of low impact since most devices \
 wouldn't expose an assembler. The upstream is inactive and there is little to be \
 done about the bug, ignore from an OE perspective."
-- 
2.43.0


