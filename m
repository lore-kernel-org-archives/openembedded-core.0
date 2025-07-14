Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6A52C83F1B
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 16:23:43 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.82446.1752510219979555778
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jul 2025 09:23:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FeD0aa+e;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-749068b9b63so3046547b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 09:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752510219; x=1753115019; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0a/ZPYUh7uJTf/jXJAyfZuIg34NzLjfoYiesVW2NFFE=;
        b=FeD0aa+exZ+rQ4LZt4ks6Fzas0uq3yu/WGOwZjU7FWYbLqKXJrtHjsxeegIA88dhKe
         1LQuNQ1SYZDEKp7kORvbrPjDjU3QH47BtH5qqczwRZ82XEiPstDm9M4+oLIqPzvzPopg
         BGSnf5vT//qG0esBScYnPZEq6UXY0o/idnEHC/bpRoJKk1E/uCM1wLR+KNof0YBuXo1f
         0SbDv8Vfd653zWmI3Y/I74ds2ZVn+W42VWDnt99RBcTqxlCw9Nqx/DzfdTxzGctmubYN
         HQe3aYC65wQ3fIjVDD3JyKgpvs6mE2EfGDTJGdjoboLq9IEYwb3DO7mwYvS+cG4cRwsW
         QBOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752510219; x=1753115019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0a/ZPYUh7uJTf/jXJAyfZuIg34NzLjfoYiesVW2NFFE=;
        b=NijjXCV63IUxTx6VtfkmfKUFg1IcIgNyKlVlT6rmSBbeAQd/M/V/rqSMzBOoHyNnka
         xYFsZgoL7EINEvegc9S+eVVbeSnvChHHZ21aIYxEtMOVyVtvmyi0KeQY+YpgNFdaJn4A
         FVmPGHEGFgT8AQ0k2Im1XN6dxGuwoqBsvIaHpwXTeluvvPrf3/xX/Zaw2GdIpRXPD/WJ
         TFyFwaGTuS0BEhorLXR2adjIyYzUhZWpqHBXcgZdU8eTnShEJh9JbVCyDnI5L++Flc4j
         WlCGtaZ8shMNCjEuKLzSmlRlmQiE1DKuk5alriQP8NwrVy6ORbRfQh84FrXbCW31pQmf
         EwGw==
X-Gm-Message-State: AOJu0YzaC4ni528eUz4dx+6jeRz8MRiw9WVWzVQQ1pxNPs4KQnclrieZ
	DqBgLL8YfY3sjvDAXhasW5p0tTB9IQMpQOduCIShgfT150ELUeiJqIDwOa9XaJulG3dsUeLxUPD
	np60K
X-Gm-Gg: ASbGncuyBJmzarikEX5tdp+bbhSv/tOVqMA+YNOtbatfi0Rm6SM5bcVfikXnUKJh4+p
	ONKBlCeVOpGr+t3LlMSMNKCuHaDtteGgEYT6hB55QPHcMzY9fNPlO+igG3LAw91IdheA//uJ2Iv
	T14C1N+puiEj/o+cKBdr/oG3LEV2Hia8k1mYgDQQ1iM0efMwFKjW1gOMrR6dJwlzP6EKF9VBcju
	2mMSra4FnSfitHYgvgWnzGgkxazA+1NcG+aNzptk2eGxMhlHjPWyLTX3w7ex8uOzyJyZLB802su
	/+bNjgPZTR7VNl+ZR1mhIbw5GuuPfWenFcJDzwBjNXtI1yoPde8JDgvAIuymodbboqD0ctyeN+S
	q20+LUf7kS6jH
X-Google-Smtp-Source: AGHT+IFttZpwCNE0nffAzdAMHpY4rYeYRb5xUMzFmYRtpN3JrNK4pN6/NUeIO/P23YlWUBgR9TKxew==
X-Received: by 2002:a05:6a21:3987:b0:1f5:9961:c44 with SMTP id adf61e73a8af0-2317dbd4e8fmr26065309637.3.1752510218980;
        Mon, 14 Jul 2025 09:23:38 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4aa7:6b72:b465:3a4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd5e8fsm10456053b3a.29.2025.07.14.09.23.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 09:23:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 14/15] mingetty: fix do_package warning
Date: Mon, 14 Jul 2025 09:23:08 -0700
Message-ID: <3efb82f1f51cbfa04f74626531615526e10bd2b2.1752509862.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752509862.git.steve@sakoman.com>
References: <cover.1752509862.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 16:23:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220252

From: Changqing Li <changqing.li@windriver.com>

Reproduce steps(Under the same project dir):
1. enable DISTRO_FEATURES usrmerge,  bitbake mingetty
2. disable DISTRO_FEATURES usrmerge, bitbake mingetty

Result in step 2:
WARNING: mingetty-1.08-r3 do_package: mingetty: NOT adding alternative provide /usr/sbin/getty: /usr/sbin/mingetty does not exist
WARNING: mingetty-1.08-r3 do_package: QA Issue: mingetty: Files/directories were installed but not shipped in any package:
  /sbin
  /usr/sbin

In step1, Line SBINDIR=/sbin is replaced to SBINDIR=/usr/sbin, in step2,
since do_fetch does not rerun, Makefile still has SBINDIR=/usr/sbin, so
sed not works as expected, SBINDIR still equal to /usr/sbin when disable
usrmerge. And cause above two warnings.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/mingetty/mingetty_1.08.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/mingetty/mingetty_1.08.bb b/meta/recipes-extended/mingetty/mingetty_1.08.bb
index 00d2564257..5aa19f6c8f 100644
--- a/meta/recipes-extended/mingetty/mingetty_1.08.bb
+++ b/meta/recipes-extended/mingetty/mingetty_1.08.bb
@@ -16,7 +16,7 @@ EXTRA_OEMAKE = "CC='${CC}' \
                 CFLAGS='${CFLAGS} -D_GNU_SOURCE'"
 
 do_install(){
-    sed -i -e "s;SBINDIR=/sbin;SBINDIR=$base_sbindir;"  ${S}/Makefile
+    sed -i -e "/^SBINDIR=/c SBINDIR=$base_sbindir"  ${S}/Makefile
     install -d ${D}${mandir}/man8 ${D}/${base_sbindir}
     oe_runmake install DESTDIR=${D}
 }
-- 
2.43.0


