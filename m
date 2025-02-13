Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30B27C0219D
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 15:23:32 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.13578.1739460211522422644
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 07:23:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z9g8xzj8;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38f286b5281so335761f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 07:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739460209; x=1740065009; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rCSVDKGM9tlph9YtrQZWwy1Mz79mYr+DFKtWJBX3yAs=;
        b=Z9g8xzj8PZizbBBifqxj7fUZA3wfY6Fyz5dS+VdDh7600zdz4Ct+vISiN0npmWgaN1
         03ylYw/0nLasd+g6MAi+gZ+SI29V+uqFrR9q6CeeqxvLfEnDYVkGRdnXIYT0/Ds2MVso
         dcQ2p+1P1dBL+YP2nYrHgIE1vXjwVWHdBd8o7E8om8o0ieWUhIgmPUZ2WBwqpQhjml5e
         U46jjocnlVBhc9P3HAb8eX+9GtwU17m9xvLO8FEe1X4SU6nVJNfj8aJdy1p4o7w8Prnr
         gk/APJ9sZthxIccUst6mKEC2cV1WffzQ/KEM+Tc1tHkCSuG/lTp5C9e3UtHGpVkX+Zkl
         eDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739460209; x=1740065009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rCSVDKGM9tlph9YtrQZWwy1Mz79mYr+DFKtWJBX3yAs=;
        b=emsycUVO5KF3ZWceBRox8TAabpVpfnohCs1VxJNFOOauPlHX+Lbl4eoKT5Nlf13qNs
         XVio/M8Y+79h50ssaxOs+eTUKV6RucDZZ+nqkH5yzrPtArs9AIUYc2933IIVBk0EABZu
         eUxCVD6m14tEIu4z94cMJX9Gyfjd0OJoQluFyWAsVjndUX++KyEoBHvla6nU0HoXiruN
         lRwBx/ObMBz35/pbjg/TEOsSmAUvHP5kdEwCUvjbtucZfD6TwBxfL3Nl7vt3XFDnfyDh
         HjgChOCeBUCvTGUdGCjNc+SK+8SQIK+gTTDUeaSoBlqd/dIkUdwfwx4p/n92NyzXAm7i
         tFfw==
X-Gm-Message-State: AOJu0YwEZWN65QN9Vh0Cestu61NyFfYhuWNnFkB0pz7a8rDAEME/Arok
	PfBbBWb3JyTQD5AEpzvauByOxCt5w3J/Lwsppvf2TmmYdcEmWOExXouBjA==
X-Gm-Gg: ASbGncv7otJGEGGw4PCDe/FMmRjUqix76vmB9QG38TKIIVNDAZPXXVmn0SBWVaNikPY
	2/x8+cuvYp05h4kbIDdEM/QQbpoTDcUrUg/oJZxmThgp5ymqgsxzajrpTcTrcDhKPtbWi5hVIwX
	+SVzISpnVXgRwpROIdXVH08TcUFntqs2eE20UMnmCp5tvhDenYlITkRwAHaHe6rW0+DmFQhxHC/
	fWZRTZokb6lrP7lBf/fN99gOmnlyluVJBjZQnKyxHy3/IbQIiujv8Oi5VxYg/XBfFlYKRH+zV1R
	Xpe+h1kerlQX5caKa4ZTSlENQFsKWAPxi3+SpFeorMlzlA==
X-Google-Smtp-Source: AGHT+IHyWx/MSpwU2Exj4qAj8ZxODZRpV8Pi9ZemPWAAaREDBSr1lqWv7KBWb12SVuhAa8Q37duCcA==
X-Received: by 2002:a5d:59ad:0:b0:38d:d9bd:18a6 with SMTP id ffacd0b85a97d-38dea2e8252mr7372345f8f.42.1739460207770;
        Thu, 13 Feb 2025 07:23:27 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b434fsm2223564f8f.16.2025.02.13.07.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 07:23:27 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [OE-core][PATCH v12.1 1/5] rpm-sequoia-crypto-policy: New recipe
Date: Thu, 13 Feb 2025 16:23:20 +0100
Message-ID: <20250213152324.4016755-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 15:23:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211350

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


