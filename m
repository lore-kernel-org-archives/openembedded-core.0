Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5EE3C4321E
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 16:37:17 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.105.1665679032322272116
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Oct 2022 09:37:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=CoP5y86F;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id y1so2443986pfr.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 09:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WhFV2ag1V5cKdfgp1+hCeZHmkeR9+UihVlWMV9BsxRE=;
        b=CoP5y86F7iQdTi1oHDumxfDZdnv5FccT2dY5S1uklVasH5fc+5zHxy75lq7ukFXWNi
         2ZxM9sRiUmewHk/qlyZk6/K/hqACX+HmLjOohzqVUFZOTer3iRcnMhuFr8AcvzHSVbcD
         Yvt0cKrW6kjkZmWo2X4RqxKbmrebZAQ3i/Ybi38jPyDzrzp2wOaa9G0gz8Qi9lmMfyXN
         bJMnV+1QdskP0Pm3KYyDDGpoAubejxCG+4wM+UGScn3UrjgszBb9ILGDmJ0vtzpvPX17
         sUSXinf5wVmoCvdxaXXEUzKYpuONNAa2ER1J51adWl/hOfzzPj1kcmLOJ+0ZRLsfKhYr
         N9yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WhFV2ag1V5cKdfgp1+hCeZHmkeR9+UihVlWMV9BsxRE=;
        b=PYIuAbh+SqZIqNYv/bA5VxuGHUqm+JJ9H/hxlz8dlWJH3t58oqSdKzYFGtDOUtRy5S
         PyIyDWIDMOGuDRbM7oCKAv8QSbCMc7aL2ThktfmDn88GToBEQBJ9nSBqPF93OqEk1tGY
         eWhhqK1WuR5JcdjAzlYdCDA9W8HjcezG0UXbEEDwPLkw6UM/A2Xm6zfMMZfpEOJrU1y7
         eWQfyRzO/PBsfy7MjMXUo1wvQkLx/XTKTIhgU0BtmbbUAeQltlN4IdnUL2XHqSZ44B6+
         ZyRZhh9XSYiPPcvaFD6RqkD48ARIBBEUYMo3z9wx4Q9gSqvd+pEwx6h8vN+dtqkAfJ/w
         6Y/g==
X-Gm-Message-State: ACrzQf3skNCSAekheKFuTqNAObpCbZ50/mMDEiSoRImtWPYOM2ZUWyqF
	3W6WGKY3JCFOnXFUhlRw//xGQd56yf7ZsJBI
X-Google-Smtp-Source: AMsMyM6UHW59lJI7jLMeBYIRiojF6mcQOCYTkJC8Gg4hwf/o8FVTYPRk8O7mzJwlaQJdjEygbNAP3g==
X-Received: by 2002:a62:ce8b:0:b0:562:9e5c:bb5 with SMTP id y133-20020a62ce8b000000b005629e5c0bb5mr350233pfg.45.1665679031192;
        Thu, 13 Oct 2022 09:37:11 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id d29-20020a634f1d000000b0043a09d5c32bsm3460615pgb.74.2022.10.13.09.37.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 09:37:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/9] dhcp: Fix CVE-2022-2928 & CVE-2022-2929
Date: Thu, 13 Oct 2022 06:36:48 -1000
Message-Id: <89d8ac907cbb5a0e214cb306a2d7bb4896165278.1665678874.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1665678874.git.steve@sakoman.com>
References: <cover.1665678874.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 16:37:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171709

From: Hitendra Prajapati <hprajapati@mvista.com>

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


