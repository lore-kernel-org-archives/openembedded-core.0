Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BA56C0219D
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 15:22:12 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.13547.1739460112516949332
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 07:21:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CJ10HYaE;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38dc9f3cc80so433747f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 07:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739460111; x=1740064911; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rCSVDKGM9tlph9YtrQZWwy1Mz79mYr+DFKtWJBX3yAs=;
        b=CJ10HYaEFefnLLaQbcdZaN6sb6F1wXcakutAKJbORab+T2bTGbijDSwLgz3rVNzldf
         CIt8drRPDrOKAXHoKoaG/GEKbyJOXnJ4kRr0NVxwna/hmR09Pzx9gDod4BSh7hzzcA/h
         zFn575vG/ByelyJOShAEd3YTmtXjDbSgPPHtc36Q7p5UvG4tbEeXf2SK3tySZArNOUkA
         Y1qF6DJiCfSSCtp9X1l033iJPQH2ISkyidZXLSPl9HWviMfBSVGlxhak5uKKJqeUjfcg
         GVj1jjRHwLQbjtm8Vr4K6ZKWd1CyOThm9gKDZF1b8s8dKktQJOYWDCXRfGfXaFCzm86J
         lYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739460111; x=1740064911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rCSVDKGM9tlph9YtrQZWwy1Mz79mYr+DFKtWJBX3yAs=;
        b=aD/6mhKj0sYCMd8dAmJoyRZg94UHrWDk4doRxrRa9WnLOVWVzZ+p/mD7pZe0o5Ef/W
         es5jR0G0Dt1DVf250GTSNl2322YAztsrp3df/6JZtDqtthgDwdLrGCGVCkaPC+HO0Wcc
         tENdzommL536suja+i+5TdDfKXp1oD7MgNYAzC6MRifsCZocY93fIKHGJ5LwhZrOJAKa
         zGXQwoKhaNBzXz/BLn9s5ej21iNqCvY7axjvsSq3NrVDuQ6IXbHYyyvAPJIV8Uc3G4QJ
         qb587Pktui9TL4ASD54HPMgIKAevnN9vYFlKuOPEbqMnsSnp3JS5a89nOAxg/Bbn5SxL
         Gq9w==
X-Gm-Message-State: AOJu0Ywxj419V62CGA1U8KKCnbtQRiC37Dxwxr4eOdG0PQiGNnY8Krfv
	ALvwUJqybzyAThoKA+0rXk5L9O41YOaoGmLOtmVcQyG/48E9TPfAjwESfg==
X-Gm-Gg: ASbGncuKgSyUZvHLGI9Xq4FBfhE9c4eABqK0GS2UDhm3IDerJZsF074FSRTPGMAhdYN
	33XjTgXU+7rwLPMO0hbqZ8Aqc5sEcu9arGvRTXBnF8TF8cdHZcN4rGcT0fHYF4o5YZQT6I4DMcM
	GY2a6sT75rQJmMJmjFo2jo+OmP1GuYQVhcqEEJuLBX6yixw0y95y6zCUoikipVbXcC3WvKOvrxI
	q5crEA9gNcFLYu0U+lj29qXAm7DTvD/O8hRCsn6tD3OGKR9JIALLF9bPsZdMpEXFNy9/osxhXcg
	OdGmn1ZfFwK9EU/w8QumoAINp+382zYVdaaY9ocXfDbnlw==
X-Google-Smtp-Source: AGHT+IH2kbh5jzwyp0yebFzM4oWP0G4JcVH2lGHglCO4AKeYXDkBI/3krIapINIp4/HsEHV9is5mXA==
X-Received: by 2002:a05:6000:144f:b0:38d:e304:7478 with SMTP id ffacd0b85a97d-38dea2e8070mr8633539f8f.38.1739460110399;
        Thu, 13 Feb 2025 07:21:50 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43961884f93sm20541625e9.27.2025.02.13.07.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 07:21:49 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [OE-core][PATCH v12.1 1/5] rpm-sequoia-crypto-policy: New recipe
Date: Thu, 13 Feb 2025 16:21:43 +0100
Message-ID: <20250213152144.4016665-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250212043532.1258912-1-zboszor@gmail.com>
References: <20250212043532.1258912-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 15:22:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211349

This ships a crypto policy file for rpm-sequoia.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../rpm-sequoia-crypto-policy_git.bb          | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+)
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
index 0000000000..098881e3da
--- /dev/null
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
@@ -0,0 +1,38 @@
+SUMMARY = "Crypto policy for rpm-sequoia"
+HOMEPAGE = "https://gitlab.com/redhat-crypto/fedora-crypto-policies/"
+
+LICENSE = "LGPL-2.1-or-later"
+
+LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=a6f89e2100d9b6cdffcea4f398e37343"
+
+DEPENDS = "coreutils-native openssl-native make-native"
+
+inherit allarch python3native
+
+SRC_URI = "git://gitlab.com/redhat-crypto/fedora-crypto-policies.git;protocol=https;branch=master"
+
+SRCREV = "032b418a6db842f0eab330eb5909e4604e888728"
+UPSTREAM_CHECK_COMMITS = "1"
+
+S = "${UNPACKDIR}/git"
+
+do_compile () {
+	# Remove most policy variants, leave DEFAULT.pol
+	# It speeds up the build and we only need DEFAULT/rpm-sequoia.
+	rm -f $(ls -1 policies/*.pol | grep -v DEFAULT.pol) || echo nothing to delete
+
+	# Don't validate openssh policy variants.
+	# Validation may fail and these variants are not needed.
+	export OLD_OPENSSH=1
+
+	make ASCIIDOC=echo XSLTPROC=echo
+}
+
+do_install () {
+	install -d -m755 ${D}${datadir}/crypto-policies/back-ends
+	install -m644 ${S}/output/DEFAULT/rpm-sequoia.txt ${D}${datadir}/crypto-policies/back-ends/rpm-sequoia.config
+}
+
+FILES:${PN} = "${datadir}/crypto-policies/back-ends/*"
+
+BBCLASSEXTEND = "native"
-- 
2.48.1


