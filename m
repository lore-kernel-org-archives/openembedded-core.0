Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55692C433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 05:27:46 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web12.2422.1665034062500312232
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Oct 2022 22:27:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=WWLfxJKF;
 spf=pass (domain: mvista.com, ip: 209.85.214.180,
 mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f180.google.com with SMTP id d24so755555pls.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Oct 2022 22:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=l/rDloDAf7PGKeC3YC+cRulFdROSqQ4N9IZmQzq0Zz4=;
        b=WWLfxJKF8TpQjZJboCb8vGqlU/tQc4nJHQdIzkNyALwsHRFYcIODz2j4DcuJqVkl7f
         32i3ZW5QkelbOr3cjpQQSb0daG4ovqhimzNFiaHmlM/zr41gePaB0SNjCQIvBA3xa/BD
         hHebNn9vDyYsmM7WHYeHHLkA0Ru+fxL55tI+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=l/rDloDAf7PGKeC3YC+cRulFdROSqQ4N9IZmQzq0Zz4=;
        b=WYIv8aAm6tF7bPARU1Jj9OPcnyvI+FbHA+32ZFA0tXVG5V1Fm3eMwsTwhK0lgkK2e9
         6bKjNcU9+jbBoVII+UObMDgqWdDh2GRPAnGE8oadTEdtHWTKQvBE7+UNjo2389sWm8gU
         Tb/SOJMSmZWUHnyhtegE0h/OFNlJaSZTFoIw1y8DmtWJAgHZgnb3Jw2UXx5Y4fvXJvgP
         2AUut44dQ2q/lBc/LZchNDU8seOIgQdXgDnis1NWnsmWgUvdy3GJ1se7y6ZVq2YnHm6W
         0RuH98c9Sh36Gq3IsX3ydoWQxAabgkxV74LJDnVALQj8CYBSBHD1TWiTuAlT1BQ731vn
         x2tA==
X-Gm-Message-State: ACrzQf2c0DdJHnspv326vuIVbEvNWB5RZBFkg+cyMvRa1VDTZkTKuMp5
	RkdhuvU3tYjUHUziV0E4cFU5Ga086iIqLQ==
X-Google-Smtp-Source: 
 AMsMyM755yT1Va0f7LpUOCjRxSajVP4NgXRYK+0mDA/NGisl98HYHW3slDu4KBepUjdynmEUgVFWbw==
X-Received: by 2002:a17:902:d4d2:b0:17a:a33:e334 with SMTP id
 o18-20020a170902d4d200b0017a0a33e334mr2957442plg.17.1665034061428;
        Wed, 05 Oct 2022 22:27:41 -0700 (PDT)
Received: from MVIN00024 ([103.250.136.200])
        by smtp.gmail.com with ESMTPSA id
 s10-20020a63d04a000000b0043c732e1536sm764292pgi.45.2022.10.05.22.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 22:27:41 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation);
 Thu, 06 Oct 2022 10:57:36 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] dhcp: Fix CVE-2022-2928 & CVE-2022-2929
Date: Thu,  6 Oct 2022 10:57:34 +0530
Message-Id: <20221006052734.70370-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Oct 2022 05:27:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171480

Source: https://downloads.isc.org/isc/dhcp
MR: 122797, 122812
Type: Security Fix
Disposition: Backport from https://downloads.isc.org/isc/dhcp/4.4.3-P1/patches/
ChangeID: 31490133cae8fc9c77073f9023955d3ff39c0b6e
Description:

Fixed CVEs:
	1. CVE-2022-2928
	2. CVE-2022-2929

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../dhcp/dhcp/CVE-2022-2928.patch             | 120 ++++++++++++++++++
 .../dhcp/dhcp/CVE-2022-2929.patch             |  40 ++++++
 meta/recipes-connectivity/dhcp/dhcp_4.4.2.bb  |   2 +
 3 files changed, 162 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/CVE-2022-2928.patch
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/CVE-2022-2929.patch

diff --git a/meta/recipes-connectivity/dhcp/dhcp/CVE-2022-2928.patch b/meta/recipes-connectivity/dhcp/dhcp/CVE-2022-2928.patch
new file mode 100644
index 0000000000..11f162cbda
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/dhcp/CVE-2022-2928.patch
@@ -0,0 +1,120 @@
+From 8a5d739eea10ee6e193f053b1662142d5657cbc6 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Thu, 6 Oct 2022 09:39:18 +0530
+Subject: [PATCH] CVE-2022-2928
+
+Upstream-Status: Backport [https://downloads.isc.org/isc/dhcp/4.4.3-P1/patches/]
+CVE: CVE-2022-2928
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ common/options.c               |  7 +++++
+ common/tests/option_unittest.c | 54 ++++++++++++++++++++++++++++++++++
+ 2 files changed, 61 insertions(+)
+
+diff --git a/common/options.c b/common/options.c
+index a7ed84c..4e53bb4 100644
+--- a/common/options.c
++++ b/common/options.c
+@@ -4452,6 +4452,8 @@ add_option(struct option_state *options,
+ 	if (!option_cache_allocate(&oc, MDL)) {
+ 		log_error("No memory for option cache adding %s (option %d).",
+ 			  option->name, option_num);
++		/* Get rid of reference created during hash lookup. */
++		option_dereference(&option, MDL);
+ 		return 0;
+ 	}
+ 
+@@ -4463,6 +4465,8 @@ add_option(struct option_state *options,
+ 			     MDL)) {
+ 		log_error("No memory for constant data adding %s (option %d).",
+ 			  option->name, option_num);
++		/* Get rid of reference created during hash lookup. */
++		option_dereference(&option, MDL);
+ 		option_cache_dereference(&oc, MDL);
+ 		return 0;
+ 	}
+@@ -4471,6 +4475,9 @@ add_option(struct option_state *options,
+ 	save_option(&dhcp_universe, options, oc);
+ 	option_cache_dereference(&oc, MDL);
+ 
++	/* Get rid of reference created during hash lookup. */
++	option_dereference(&option, MDL);
++
+ 	return 1;
+ }
+ 
+diff --git a/common/tests/option_unittest.c b/common/tests/option_unittest.c
+index cd52cfb..690704d 100644
+--- a/common/tests/option_unittest.c
++++ b/common/tests/option_unittest.c
+@@ -130,6 +130,59 @@ ATF_TC_BODY(pretty_print_option, tc)
+ }
+ 
+ 
++ATF_TC(add_option_ref_cnt);
++
++ATF_TC_HEAD(add_option_ref_cnt, tc)
++{
++    atf_tc_set_md_var(tc, "descr",
++        "Verify add_option() does not leak option ref counts.");
++}
++
++ATF_TC_BODY(add_option_ref_cnt, tc)
++{
++    struct option_state *options = NULL;
++    struct option *option = NULL;
++    unsigned int cid_code = DHO_DHCP_CLIENT_IDENTIFIER;
++    char *cid_str = "1234";
++    int refcnt_before = 0;
++
++    // Look up the option we're going to add.
++    initialize_common_option_spaces();
++    if (!option_code_hash_lookup(&option, dhcp_universe.code_hash,
++                                 &cid_code, 0, MDL)) {
++        atf_tc_fail("cannot find option definition?");
++    }
++
++    // Get the option's reference count before we call add_options.
++    refcnt_before = option->refcnt;
++
++    // Allocate a option_state to which to add an option.
++    if (!option_state_allocate(&options, MDL)) {
++	    atf_tc_fail("cannot allocat options state");
++    }
++
++    // Call add_option() to add the option to the option state.
++    if (!add_option(options, cid_code, cid_str, strlen(cid_str))) {
++	    atf_tc_fail("add_option returned 0");
++    }
++
++    // Verify that calling add_option() only adds 1 to the option ref count.
++    if (option->refcnt != (refcnt_before + 1)) {
++        atf_tc_fail("after add_option(), count is wrong, before %d, after: %d",
++                    refcnt_before, option->refcnt);
++    }
++
++    // Derefrence the option_state, this should reduce the ref count to
++    // it's starting value.
++    option_state_dereference(&options, MDL);
++
++    // Verify that dereferencing option_state restores option ref count.
++    if (option->refcnt != refcnt_before) {
++        atf_tc_fail("after state deref, count is wrong, before %d, after: %d",
++                    refcnt_before, option->refcnt);
++    }
++}
++
+ /* This macro defines main() method that will call specified
+    test cases. tp and simple_test_case names can be whatever you want
+    as long as it is a valid variable identifier. */
+@@ -137,6 +190,7 @@ ATF_TP_ADD_TCS(tp)
+ {
+     ATF_TP_ADD_TC(tp, option_refcnt);
+     ATF_TP_ADD_TC(tp, pretty_print_option);
++    ATF_TP_ADD_TC(tp, add_option_ref_cnt);
+ 
+     return (atf_no_error());
+ }
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/dhcp/dhcp/CVE-2022-2929.patch b/meta/recipes-connectivity/dhcp/dhcp/CVE-2022-2929.patch
new file mode 100644
index 0000000000..d605204f89
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/dhcp/CVE-2022-2929.patch
@@ -0,0 +1,40 @@
+From 5c959166ebee7605e2048de573f2475b4d731ff7 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Thu, 6 Oct 2022 09:42:59 +0530
+Subject: [PATCH] CVE-2022-2929
+
+Upstream-Status: Backport [https://downloads.isc.org/isc/dhcp/4.4.3-P1/patches/]
+CVE: CVE-2022-2929
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ common/options.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/common/options.c b/common/options.c
+index 4e53bb4..28800fc 100644
+--- a/common/options.c
++++ b/common/options.c
+@@ -454,16 +454,16 @@ int fqdn_universe_decode (struct option_state *options,
+ 		while (s < &bp -> data[0] + length + 2) {
+ 			len = *s;
+ 			if (len > 63) {
+-				log_info ("fancy bits in fqdn option");
+-				return 0;
++				log_info ("label length exceeds 63 in fqdn option");
++				goto bad;
+ 			}
+ 			if (len == 0) {
+ 				terminated = 1;
+ 				break;
+ 			}
+ 			if (s + len > &bp -> data [0] + length + 3) {
+-				log_info ("fqdn tag longer than buffer");
+-				return 0;
++				log_info ("fqdn label longer than buffer");
++				goto bad;
+ 			}
+ 
+ 			if (first_len == 0) {
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.4.2.bb b/meta/recipes-connectivity/dhcp/dhcp_4.4.2.bb
index 5609a350cc..d3c87d0d07 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.4.2.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.4.2.bb
@@ -11,6 +11,8 @@ SRC_URI += "file://0001-define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.pat
             file://0013-fixup_use_libbind.patch \
             file://0001-workaround-busybox-limitation-in-linux-dhclient-script.patch \
             file://CVE-2021-25217.patch \
+            file://CVE-2022-2928.patch \
+            file://CVE-2022-2929.patch \
 "
 
 SRC_URI[md5sum] = "2afdaf8498dc1edaf3012efdd589b3e1"
-- 
2.25.1


