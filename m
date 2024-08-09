Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98C0BC52D73
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 06:24:03 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.78439.1723184638162172077
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Aug 2024 23:23:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=We/206rn;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-368440b073bso977491f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 23:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723184636; x=1723789436; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sinBcdlW2MBZfqyWoiBBz/XXUc2lQ/PajHwd+5Cr8xo=;
        b=We/206rnVMs01g8CLfVysJ0CvjJf2qRRd2eByHLEav4xZiKJnk8xoiJtkWuqaK6ZXp
         GHVkxGzziELEhKM3A0dBj6e7FXKX1qRiBPLE0Mat7vUgliSByM9t4cNKMVukWby3mS8+
         Ieegc7nC/gp0DreVD9lzKFgShuvg6AJKKyEhDovsPjixugOIaENxPGzJo4HBmsXCJIsH
         +NQyNDLYqtpU8ojG9199jRBWqM4KCVRmtgbEf3e0hboaCygeqVW4x+Rpm+ShD2K+cUph
         MV4ckxmBOrCOc+GUJQ60OwN66CXe5gXs5ESw3jNP4aOlLDqunW37CpN3WV2Ap4OlEHIm
         Aq2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723184636; x=1723789436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sinBcdlW2MBZfqyWoiBBz/XXUc2lQ/PajHwd+5Cr8xo=;
        b=hm1CBsKAjdHoMVeTpXfzl2TMhARpX2EUbmheu07p2z1uWcXuQsnPfEIzh9cis54UGi
         iOH4n3ehMYO4ZSXQ75MiCbw8/qCwmE8Wc6VzwyGFXqOKGCn+PgMrInqFHH9TyxRxQTUr
         FydVhyr00gpFGRD2KGuIDdAk8JhXiiLs6POhSQlKmKJfDqClWTk7DNzF+xI5h8Svs6Te
         SeOoEbmSLQT427HQ/RMGpKoP0XTbRFUliWT1j9FtKNQy6FFRawOyZ1JG8H7FgZN9iQr/
         9dMoosTv0fcGTdyDPtIaXGbHS/tCuuwMbfCrYYN5Nv+TtUo5UprZgtUnAkQCuyORexTH
         IMXw==
X-Gm-Message-State: AOJu0Yz0/+yBDuDDqwN249zrctAGtPAin6hnDXq5frVD+J6cO4NxbKnp
	1GN5FJkRJa/6KSwf2BCfdnLm7QGOe7LuNoBywS+wyqxSt+Xi4qX4jtZM9w==
X-Google-Smtp-Source: AGHT+IGFKPDgvXUczDJrGQ0QyyJ6kfll+0EDHhxVKpdLPjX5R1nMaCkHHnZKdzkRE8cDnySPHlyRQA==
X-Received: by 2002:a05:6000:ec4:b0:368:318a:a191 with SMTP id ffacd0b85a97d-36d280efff3mr3132695f8f.8.1723184635529;
        Thu, 08 Aug 2024 23:23:55 -0700 (PDT)
Received: from localhost.localdomain ([2a04:cec0:1117:4fa6:ec:4387:cc6f:ef67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36d27157347sm4291782f8f.2.2024.08.08.23.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 23:23:55 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@syslinbit.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@syslinbit.com>
Subject: [RFC][PATCH 2/2] cve-extra-inclusions: encode CPEs of affected packages
Date: Fri,  9 Aug 2024 08:23:39 +0200
Message-ID: <20240809062339.15465-2-marta.rybczynska@syslinbit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240809062339.15465-1-marta.rybczynska@syslinbit.com>
References: <20240809062339.15465-1-marta.rybczynska@syslinbit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Aug 2024 06:24:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203152

Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
---
 .../distro/include/cve-extra-exclusions.inc    | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
index fcef6a14fb..6785f49e01 100644
--- a/meta/conf/distro/include/cve-extra-exclusions.inc
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -38,7 +38,7 @@ this to libc glob. Upstream have no plans to add BSD's GLOB_LIMIT or similar."
 # go https://nvd.nist.gov/vuln/detail/CVE-2020-29511
 CVE_STATUS_GROUPS += "CVE_STATUS_GO"
 CVE_STATUS_GO = "CVE-2020-29509 CVE-2020-29511"
-CVE_STATUS_GO[status] = "not-applicable-config: \
+CVE_STATUS_GO[status] = "not-applicable-config: golang:go: \
 The encoding/xml package in go can potentially be used for security exploits if not used correctly \
 CVE applies to a netapp product as well as flagging a general issue. We don't ship anything \
 exposing this interface in an exploitable way"
@@ -50,7 +50,7 @@ CVE-2015-2656 CVE-2015-4754 CVE-2015-4764 CVE-2015-4774 CVE-2015-4775 CVE-2015-4
 CVE-2015-4778 CVE-2015-4779 CVE-2015-4780 CVE-2015-4781 CVE-2015-4782 CVE-2015-4783 CVE-2015-4784 \
 CVE-2015-4785 CVE-2015-4786 CVE-2015-4787 CVE-2015-4788 CVE-2015-4789 CVE-2015-4790 CVE-2016-0682 \
 CVE-2016-0689 CVE-2016-0692 CVE-2016-0694 CVE-2016-3418 CVE-2020-2981"
-CVE_STATUS_DB[status] = "upstream-wontfix: Since Oracle relicensed bdb, the open source community is slowly but surely \
+CVE_STATUS_DB[status] = "upstream-wontfix: oracle:berkeley_db: Since Oracle relicensed bdb, the open source community is slowly but surely \
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
+CVE_STATUS[CVE-1999-0524] = "ignored: linux:linux_kernel:issue is that ICMP exists, can be filewalled if required"
+CVE_STATUS[CVE-2008-4609] = "ignored: linux:linux_kernel:describes design flaws in TCP"
+CVE_STATUS[CVE-2010-4563] = "ignored: linux:linux_kernel:low impact, only enables detection of hosts which are sniffing network traffic"
+CVE_STATUS[CVE-2011-0640] = "ignored: linux:linux_kernel:requires physical access and any mitigation would mean USB is impractical to use"
 
 # qemu:qemu-native:qemu-system-native https://nvd.nist.gov/vuln/detail/CVE-2021-20255
-CVE_STATUS[CVE-2021-20255] = "upstream-wontfix: \
+CVE_STATUS[CVE-2021-20255] = "upstream-wontfix: qemu:qemu: \
 There was a proposed patch https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg06098.html \
 qemu maintainers say the patch is incorrect and should not be applied \
 The issue is of low impact, at worst sitting in an infinite loop rather than exploitable."
 
 # qemu:qemu-native:qemu-system-native https://nvd.nist.gov/vuln/detail/CVE-2019-12067
-CVE_STATUS[CVE-2019-12067] = "upstream-wontfix: \
+CVE_STATUS[CVE-2019-12067] = "upstream-wontfix: qemu:qemu \
 There was a proposed patch but rejected by upstream qemu. It is unclear if the issue can \
 still be reproduced or where exactly any bug is. \
 We'll pick up any fix when upstream accepts one."
 
 # nasm:nasm-native https://nvd.nist.gov/vuln/detail/CVE-2020-18974
-CVE_STATUS[CVE-2020-18974] = "upstream-wontfix: \
+CVE_STATUS[CVE-2020-18974] = "upstream-wontfix: nasm:netwide_assembler\
 It is a fuzzing related buffer overflow. It is of low impact since most devices \
 wouldn't expose an assembler. The upstream is inactive and there is little to be \
 done about the bug, ignore from an OE perspective."
-- 
2.43.0


