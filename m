Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 847E877500
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 00:58:34 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id 203so5298490ith.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 16:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZNzcBu45ri1CwHdF6lcn1zIu5XZZuXUMO5B+O2PQoPA=;
	b=ixOdCxMPv1gXCcj7to8YXIPBGy5/CS4xiN3tI81IyESaUW//Skkt8jOZejVFhSWNwU
	+IQRAaa+8YlPp7urolDxuGlqSdjKEqH0j6pCkRMSRR44zi25Z/sPrmbyNtQJ4eDSQVZP
	qcKgee1cCCzHVee4Ko6TC3s1hW0X6wZV8KYwhqVYMmLQ9urvYSHagZhjY1FXK36YDzCB
	ZJI0h7gKBLLomU2OBcN+jNOyl5Abk9SmS8dnCcg20mW9Y8+LGGf1h8pHguQiD59CiQom
	Ra3b+G8LaIseygtbev4gfy/16xT8WOc1aFMbqXMINWB2aV2ehR5lGVRqQI63jL4rcQf0
	+NAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZNzcBu45ri1CwHdF6lcn1zIu5XZZuXUMO5B+O2PQoPA=;
	b=hLRFxu36Y14zwHeVL3DUCzH5p6Ln7E2aiHyqH7KKMC4aGA78yLzulr8Yy5yagQnLup
	KuucgCdFhl3s7t35qNi/sW8lYbLVv8GWT19z9vaoCK7rYgkPBg6BXhUb+pne8RjN3AjQ
	Olgynw7GtoG8+o6EG7vIaN6iSlbwd44XISvbyv5xvvC8wpV69Uuehewhj3Nyc/zcCF/8
	GH4NC/G1Z9MGD6DextdjP1BgyNfM+E8PBy3X/R7buUucMsitwB71qz0F0zWSfmexQB4e
	4WxUctvCuFq39tUoH7V/a+xw/eFAOhe6bqYWi6lno14SMpJN4u80jthJeKWVuW6TbWpa
	Kn1A==
X-Gm-Message-State: AMke39nwmgSHTQ31fivu7rdbgjGhh9SMA97DA91Ov92S9Kcl6VDOcQkgNWzyDpd1SfO7Bb+b
X-Received: by 10.36.240.11 with SMTP id s11mr443115ith.16.1487897915200;
	Thu, 23 Feb 2017 16:58:35 -0800 (PST)
Received: from pohly-mobl1.hil-pdxphhh.sea.wayport.net
	(ip-64-134-128-59.public.wayport.net. [64.134.128.59])
	by smtp.gmail.com with ESMTPSA id f127sm66818ite.26.2017.02.23.16.58.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Feb 2017 16:58:33 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Feb 2017 01:58:26 +0100
Message-Id: <1487897906-24948-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1487897839.11306.49.camel@intel.com>
References: <1487897839.11306.49.camel@intel.com>
Subject: [PATCH v2] ovmf: increase path length limit
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
X-List-Received-Date: Fri, 24 Feb 2017 00:58:34 -0000

The VfrCompile tool has a hard-coded maximum length for path names
which turned out to be too small by around 20 characters in the
Yocto autobuilder setup. Increasing the maximum by a factor of 4
is relatively easy and makes the problem less likely.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 .../VfrCompile-increase-path-length-limit.patch    | 33 ++++++++++++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb                 |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-core/ovmf/ovmf/VfrCompile-increase-path-length-limit.patch

diff --git a/meta/recipes-core/ovmf/ovmf/VfrCompile-increase-path-length-limit.patch b/meta/recipes-core/ovmf/ovmf/VfrCompile-increase-path-length-limit.patch
new file mode 100644
index 0000000..bb12d8b
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/VfrCompile-increase-path-length-limit.patch
@@ -0,0 +1,33 @@
+From c7722d10c7bcf6be0adcf54abb1d406599dd7914 Mon Sep 17 00:00:00 2001
+From: Patrick Ohly <patrick.ohly@intel.com>
+Date: Fri, 24 Feb 2017 01:40:02 +0100
+Subject: [PATCH] VfrCompile: increase path length limit
+
+The VfrCompile tool has a hard-coded maximum length for path names
+which turned out to be too small by around 20 characters in the Yocto
+autobuilder setup. Increasing the maximum by a factor of 4 is
+relatively easy and makes the problem less likely.
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
+---
+ BaseTools/Source/C/VfrCompile/EfiVfr.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/BaseTools/Source/C/VfrCompile/EfiVfr.h b/BaseTools/Source/C/VfrCompile/EfiVfr.h
+index d187902..9ad4a7b 100644
+--- a/BaseTools/Source/C/VfrCompile/EfiVfr.h
++++ b/BaseTools/Source/C/VfrCompile/EfiVfr.h
+@@ -19,7 +19,7 @@ WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.
+ #include "Common/UefiInternalFormRepresentation.h"
+ #include "Common/MdeModuleHii.h"
+ 
+-#define MAX_PATH                 255
++#define MAX_PATH                 1023
+ #define MAX_VFR_LINE_LEN         4096
+ 
+ #define EFI_IFR_MAX_LENGTH       0xFF
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 6b3a597..a658c9d 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://github.com/tianocore/edk2.git;branch=master \
 	file://0001-BaseTools-Force-tools-variables-to-host-toolchain.patch \
 	file://0002-ovmf-update-path-to-native-BaseTools.patch \
 	file://0003-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch \
+	file://VfrCompile-increase-path-length-limit.patch \
         "
 
 SRC_URI_append_class-target = " \
-- 
2.1.4


