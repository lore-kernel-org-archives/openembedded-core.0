Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 678D5C0219C
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 04:43:12 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.32632.1738816979997095271
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 20:43:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S4tqrVa4;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4361f664af5so5050355e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 20:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738816978; x=1739421778; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VU0Ip6eSWbE7Go8ufmSA9mjBOcp4p2dWiwdJIPipRjc=;
        b=S4tqrVa4LJm102SBMyyd35qxbzcKQ1KiXNNdQ4vf9EW8y/wMiBJESxzwn0gtM6Buyq
         aDMdRn5+g2FJebRhEzGUI+nsNpxmr9WQKxxKnlzGw/37OfA8xWgMH1wl2/jkLgPDhnE0
         fEKpbGw1Fq8ZJ8UBb/cMo+xIOHwFaXUG78h6geL1g9LOjgtoWihmb+bMXdpVmA8zTvMT
         /Js5TADQ27rWTphGc6Kw8DqZ4+gdwBnC7VdrBuHCcC2dc2cFekvskUZ47deSMrVD1U4Q
         +uFNJmxrhTaDMCerU3jv6p1fHJ4GDmZ4CYI6AX0Dup5UFbsAiIzFCAuHj9U6q4ytuUmb
         pAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738816978; x=1739421778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VU0Ip6eSWbE7Go8ufmSA9mjBOcp4p2dWiwdJIPipRjc=;
        b=fGCTSMoFX9i8PLD8Qa2+RWWMOvQ9iqhYtjnSGouZNpyZ/K0Mx+Gyenl9gfHnM2gnuy
         UUP5qeh0vldBe43hvWt6arZxfbHLc04W4lPoSGsZc8BUxUll31wyX1xb9/rS9pyqtbvR
         tjtYbyCwoM4Auil0ksCfz1eylbzNN9IYdygxQvDnbZ9iKCIXHbij4tf5ceRFcnJCI7Ln
         o3Hr9T1P2z7Hrl1Oim+zR3SQ4kyMPWA3nMZNKoMEHIPfW1UWgMsXrGCFVLW93p39/bTf
         LkhNePvzekSKRIKzNc20LFxDI8ZEmRI7LHDYJCKc9a51aJLBzW8DeKx3INW27v3n7471
         HTDg==
X-Gm-Message-State: AOJu0YxKAqUqTZU/07iUzjAyVXk1W627D4sTnf+aG4vqXzpDFF2xD1Wn
	jCy2f171/G9wsoplGhFZpzcVDC3crycmTZmRjmGwb578im8kS+riignxaA==
X-Gm-Gg: ASbGncuzG1cZ/7g7aPMSE2jCRJaS6zZSjzjZl+KKRGOMPupiVKJw35/aNC82lwGvbSV
	91wd/w0BOlb67zw1fr8uVVj/xKL0lWgPAOUW4FVIotKZB4CVhAf5e7qZHwRQH+bhPuIv4cI6wdT
	v7ZTuok/hH3hcP7cGnjQQgPwPU+GOiCpG89hHSkdcA3AuBW9Aid4J1I+Aq6RaHc2KFz+1hQvibh
	SEgNxfLUweV6hIP1bPGt7ghrjM/NcU6GD7jl4/XtHImXfsXDWswIw4F4cQMkm22RpRhKiHrOxq2
	uzSxs77Gr5lQDTgI6OijOJQqOm94TtVQvMwLaeTszCepQw==
X-Google-Smtp-Source: AGHT+IH2rrts0IB+D7rqZlAHT+abXQMhDO9lRojUPuUDax7Xoa4yzbIBwsfnPef/bp/NZDQjfZAEAQ==
X-Received: by 2002:adf:f604:0:b0:385:f64e:f163 with SMTP id ffacd0b85a97d-38db489c230mr3452036f8f.32.1738816977758;
        Wed, 05 Feb 2025 20:42:57 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dca34a8sm5819695e9.16.2025.02.05.20.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 20:42:57 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [OE-core][PATCH v7 1/5] rpm-sequoia-crypto-policy: New recipe
Date: Thu,  6 Feb 2025 05:42:46 +0100
Message-ID: <20250206044250.3311711-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 04:43:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210889

This ships a crypto policy file for rpm-sequoia.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../rpm-sequoia-crypto-policy_git.bb          | 26 +++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index bec55a7c1c..648c8fceb8 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -744,6 +744,7 @@ RECIPE_MAINTAINER:pn-rpcbind = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-rng-tools = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-rpcsvc-proto = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-rpm = "Robert Yang <liezhi.yang@windriver.com>"
+RECIPE_MAINTAINER:pn-rpm-sequoia-crypto-policy = "Zoltán Böszörményi <zboszor@gmail.com>"
 RECIPE_MAINTAINER:pn-rsync = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-rt-tests = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-ruby = "Ross Burton <ross.burton@arm.com>"
diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
new file mode 100644
index 0000000000..9ccf198c14
--- /dev/null
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Crypto policy for rpm-sequoia"
+HOMEPAGE = "https://gitlab.com/redhat-crypto/fedora-crypto-policies/"
+
+LICENSE = "LGPL-2.1-or-later"
+
+LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=a6f89e2100d9b6cdffcea4f398e37343"
+
+DEPENDS = "openssl-native asciidoc-native libxslt-native make-native"
+
+SRC_URI = "git://gitlab.com/redhat-crypto/fedora-crypto-policies.git;protocol=https;branch=master"
+
+# Commit ID for crypto-policies 20250124-1.git4d262e7.fc41
+SRCREV = "4d262e79be1cd15c84cad55ad88c53a2d7712e85"
+
+S = "${UNPACKDIR}/git"
+
+do_compile () {
+	make
+}
+
+do_install () {
+	mkdir -p ${D}${datadir}/crypto-policies/back-ends
+	install -m644 ${S}/output/DEFAULT/rpm-sequoia.txt ${D}${datadir}/crypto-policies/back-ends/rpm-sequoia.config
+}
+
+BBCLASSEXTEND = "native"
-- 
2.48.1


