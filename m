Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 766C2C531DC
	for <webhook@archiver.kernel.org>; Wed, 14 Aug 2024 05:31:08 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.91186.1723613458684079802
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Aug 2024 22:30:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EeaFizMs;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-426526d30aaso42935475e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 22:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723613456; x=1724218256; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OkTa/98hIRKPFlwAaDSDreK1dxQgWRupIXuqrodBqtI=;
        b=EeaFizMscKIeqCgZkgfejXRAvpkpLoazpZwmzsH85kaSEJ2x60XJX+XGg5ofYsBye+
         DC3Vp8lCsWnH787XuuMSZBp+xF8LvPV3qHvdpxvVFFJn8dh9K5Wy4QU6WTo9Lbawtghy
         lSvtw0p15eC0lyr3NZEHSQ5rJrkZ75BWtGO6H9riCf82UlzWqsfdofVPhcnqiWYhSI1K
         I6PAXU9Y2bSIFOjUTGAWRZFCto0YwGlmMSbsfHH20cgN4ZTb9kgIOF04xVAO4afYdxbk
         YBVx3C/bBt5WtI73y6ibfKt0ejQklCjmnfbnvu3KQ7m0YifpJ+gwdNV8fQSFgNjxz8jG
         HQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723613456; x=1724218256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OkTa/98hIRKPFlwAaDSDreK1dxQgWRupIXuqrodBqtI=;
        b=Y85paAKJm1ez8ZJr0r0gA+cJ4i6TMp3LcKb1WzFGzVTKQ7B/QrAX47bOIFDrphl2aq
         ryovys32ZBKb/SuhZbJm3w3HJY1FdHki06+Bq/XqH44YQBtXMpbyulK2+wCxyjgauWeL
         XAXHc8YV8El53Se5P+2yxQMEr4zJB0bUsTrEucgHLjObXHvptaD0oPWV1B2bdyQn2jK3
         T7vyL/ZWKNJ8sS7CZAY29xKMnXKbZN9mLRND0MOFUjgEaMqHXp6tr8Xm1ItCXaihcjX9
         FAUo3gtRia5mBXEqWwJ0fTbAyJsMLytOTLA0OQRgJ9Nwof3ZZyYhU8g0Usv2OkU4Cqy/
         lyhg==
X-Gm-Message-State: AOJu0YwoXGFUHExPo28ueVsM87wJgvOT6iw2/zOM6cRIcAluYIcDom6Y
	f/857XaWTCyojS0MfO2J6kDH8dDN0BwDYEGUAXAPg2dktYe0/0rJWMeyJw==
X-Google-Smtp-Source: AGHT+IH1ScGQCxN5OTQbBXFns4fo/dfVfThu3L+XlhPNFLonghVZ9edCgChxEwL7yM2bj71DpJ+/JA==
X-Received: by 2002:a05:600c:1c0a:b0:426:5d0d:a2c9 with SMTP id 5b1f17b1804b1-429dd23ba73mr11295505e9.10.1723613456017;
        Tue, 13 Aug 2024 22:30:56 -0700 (PDT)
Received: from voyage.lan ([2a0d:3344:2311:d410:8c63:2ebf:4fe1:9568])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded4db0bsm8885525e9.32.2024.08.13.22.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 22:30:55 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@syslinbit.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@syslinbit.com>
Subject: [PATCH v5][OE-core 2/7] cve-extra-inclusions: encode CPEs of affected packages
Date: Wed, 14 Aug 2024 07:30:36 +0200
Message-ID: <20240814053041.4991-2-marta.rybczynska@syslinbit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240814053041.4991-1-marta.rybczynska@syslinbit.com>
References: <20240814053041.4991-1-marta.rybczynska@syslinbit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 05:31:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203303

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


