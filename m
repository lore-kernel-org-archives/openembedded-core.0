Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AFB9D5AE77
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:01:59 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2908.1765620112640438778
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:01:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GhMWGxoE;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a0833b5aeeso12020885ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620112; x=1766224912; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/RAT8XFXX/btrdwnl888bEhKa3JbKAOYGgYQszESsPw=;
        b=GhMWGxoE7LnJV2uA0fzZXJDkrO9i+SdNeZm9EDtIdR0p4VmvoQ8/R4UOfRMZKKh1KL
         HO6RIB8HsPEovzJIfmZF3owCGuoOjqSDuj8mO9GuvaHraH5inex8Ac1b3bj36Sf3IjJ9
         gnhUeuVwP+/IWebbcrxiowPI/2gEN6KUrPIcNX1prb/3qhuZT/1EJiuR7KPLi1nTl1zJ
         RkyoAZITxVGAdk8lvOMwY8j0J06dekpwhgUMIHE91nxzE4ro/71OtCq3LsZZdS2axEch
         1E7a7r3juusgE75GfGVz6lYSLV+AykxmUW27NPwOzjh3caxE/qGLDQcun0ST1Ychh08I
         BC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620112; x=1766224912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/RAT8XFXX/btrdwnl888bEhKa3JbKAOYGgYQszESsPw=;
        b=p2pkR0U29b7joZ8P/wW1VpcGPAQyiLo603XV/F8DwvRDV3VnVhAnP96aakoWKMlgQp
         EtmExrQtCDNZk/2V1aJwMRWFv3PK/gRfhWvUPHu4M/SksN5oWtXqBJfBFc3f76UhJ7D7
         //ZCanftM+An6ZPVzAsaI/WIKmb1bL5VqHNu5b6SV2jlpkFRNSKEuIoUxwQGnKs5kikE
         uSiAU5nFcljK5JaEWNSi9rO1w+etCN1YEs5C1e8uc+juHWeXV/eWPKOmCZsu9dSHrICv
         G4Knrr+AAcDkc2jP6HKd0s9NjsL92/3fhhD7CdLuZNXqchzO6Ft/ekG5lFqojZd3hAnv
         Krgg==
X-Gm-Message-State: AOJu0Yzi6fq8OUrsVrHxfhKx68bAmny26NKkFCv11tsqIicW+4cAldVU
	CIdnaitmz+9xszzJBug72fVGopfg9ZW5yuvXbcOGPOesYAbWPA5dpjKAo2WzT650
X-Gm-Gg: AY/fxX68TxXVsNG7ptE1ClYWutknKmzA/C8+vd491ZwMcVY3pNfr6xNLq68LDTAkHEG
	muy4opokQ/vEHaGm2/Eh2894r5J5rEZP9x5m93I2u3l8UjINUYBXHWxFji0ipe7KWOSpGPug5di
	9fV37ehf2OBaXOL/szOBHPALJftmnAGx8TM27cVwwJyJUqMIfLW9lGTNpe4G5Mny9/urnmuLF7R
	nsNITyfexhLNM3/pDA3SWCImoVMern7PykQx3X+As1xQMoLOfbKDmfgX9IxpZhRE0oRZgHyDGcX
	1Sa5jKTpD6+0FmY4tVkr0TZfk9pBEVHTLzaY3qvw5VacUSAm6Fu2K13Hg89AKmZ1V77o+ofyndN
	4/FsE6wGE7nhC1kIacN9gP+1iurl0+/t9XcqkCUJw0u09xfZYE8x/SzYH9fV9ZTbM0CkRee64r6
	2odt38bOpSmh5I62mGY0A0aVNR
X-Google-Smtp-Source: AGHT+IE88nFMaG/tXrBOm/EYV4/c/MoUA1r3puUzS7C/ssWuX+24jawK1OXPstdWIKeaIGnuoWXIWA==
X-Received: by 2002:a17:902:d489:b0:295:350a:f9b8 with SMTP id d9443c01a7336-29f2404b639mr47012005ad.29.1765620111836;
        Sat, 13 Dec 2025 02:01:51 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:01:51 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 48/67] utfcpp: upgrade 4.0.6 -> 4.0.8
Date: Sat, 13 Dec 2025 15:29:12 +0530
Message-ID: <20251213095931.2571498-48-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:01:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227666

From: Gyorgy Sarvari <skandigraun@gmail.com>

License-update: the project removed the submodules, and included
the necessary files in the main repository. The license itself hasn't
chaged, however it seems that it was indicated incorrectly in the recipe
previously: the main application is BSL-1.0, but the additional header
is under MIT, and not BSD.

Selection from the shortlog:
- fix compile warning
- Get rid of submodules and add ftest.h to tests directry
- tidy code
- Compile time checks for size of UTF-16 code units

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 702df27ef420e45b3aff1d22759f855babc7c8fe)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/conf/distro/include/maintainers.inc    |  2 +-
 meta/recipes-support/utfcpp/utfcpp_4.0.6.bb | 14 --------------
 meta/recipes-support/utfcpp/utfcpp_4.0.8.bb | 15 +++++++++++++++
 3 files changed, 16 insertions(+), 15 deletions(-)
 delete mode 100644 meta/recipes-support/utfcpp/utfcpp_4.0.6.bb
 create mode 100644 meta/recipes-support/utfcpp/utfcpp_4.0.8.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 49e067eee7..6a8e1c53fd 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -854,7 +854,7 @@ RECIPE_MAINTAINER:pn-usbutils = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-util-linux = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-util-linux-libuuid = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-util-macros = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-utfcpp = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-utfcpp = "Gyorgy Sarvari <skandigraun@gmail.com>"
 RECIPE_MAINTAINER:pn-v86d = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-vala = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-valgrind = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-support/utfcpp/utfcpp_4.0.6.bb b/meta/recipes-support/utfcpp/utfcpp_4.0.6.bb
deleted file mode 100644
index 344f270158..0000000000
--- a/meta/recipes-support/utfcpp/utfcpp_4.0.6.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = " UTF-8 with C++ in a Portable Way"
-HOMEPAGE = "https://github.com/nemtrif/utfcpp"
-
-LICENSE = "BSL-1.0 & BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e4224ccaecb14d942c71d31bef20d78c \
-                    file://extern/ftest/LICENSE;md5=d33c6488d3b003723a5f17ac984db030"
-
-SRC_URI = "gitsm://github.com/nemtrif/utfcpp;protocol=https;branch=master"
-
-SRCREV = "b26a5f718f4f370af1852a0d5c6ae8fa031ba7d0"
-
-inherit cmake
-
-FILES:${PN}-dev += "${datadir}/utf8cpp/cmake"
diff --git a/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb b/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb
new file mode 100644
index 0000000000..7f6eb367f1
--- /dev/null
+++ b/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb
@@ -0,0 +1,15 @@
+SUMMARY = " UTF-8 with C++ in a Portable Way"
+HOMEPAGE = "https://github.com/nemtrif/utfcpp"
+
+LICENSE = "BSL-1.0 & MIT"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e4224ccaecb14d942c71d31bef20d78c \
+                    file://tests/ftest.h;endline=25;md5=d33c6488d3b003723a5f17ac984db030"
+
+SRC_URI = "git://github.com/nemtrif/utfcpp;protocol=https;branch=master;tag=v${PV}"
+
+SRCREV = "f9319195dfddf369f68f18e7c0039b3f351797fd"
+
+inherit cmake
+
+FILES:${PN}-dev += "${datadir}/utf8cpp/cmake"

