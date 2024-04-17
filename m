Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B661DC001CC
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 20:35:55 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.24873.1713386150405548973
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Apr 2024 13:35:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=eDuzPO6Y;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2a3095907ffso166011a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 13:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1713386150; x=1713990950; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c9UzC/lEOeszMlOFkbfZ0hnqyTRoqhG/PyuNMRrqoRk=;
        b=eDuzPO6Y+rztBytypjpRQn+L4D8vGfKYlZ8irKHI+0yfU6z+DzmoDFEF7srLTgnk7M
         WmOxzDkdxFCMD3Cg3nKF4YN/XYDCjnA2MRzpCA0xEn8uuwA4DCpEoNjQsvvhkGiFBI5w
         vHnaLTYv3rMfkvTATxZLj1YkYYFEj7HuNe4KdcmT9TqWxsh02wsayMbKBT93dJdIimSP
         LcaH/0dzlAvBh9rWPowgPoeuGEE57tWkwzM34z0ThWwpT4+w8oJo84QD3jSzr5/kVNgE
         yMsOiq5HNGj9AjkpJCanfF5qRpGLgssSuPT6rP/CRt4VH7308B7U8Rg1xkZ3RHsrRzDF
         f+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713386150; x=1713990950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c9UzC/lEOeszMlOFkbfZ0hnqyTRoqhG/PyuNMRrqoRk=;
        b=pR+jpqD5v/eCuv91aZIB31vA3JHnZlbDIAR0OOc5J/7GLcm2vE6gsviCD6CzBhs0JS
         gyQ6l0tjV/WbKEyYBQ70IGpCJr8pl2ebLZoiQcqgA9jADsIiEv7gf64exEn4mpPd9swk
         IMUx8nDCFXAljZT8QGHFe+sjgWWsTkeZKxVG0ofnunl1OF547uByBr3zwe5PNtVcEN+Z
         WpoQQp9tmZ650FUTKcuXolW93UvqpNxe2ooSIn2Fx29BxGdhZeB1TBaBLk5GaHxaqEEN
         jBMsUA2fDV6sGON/nOg03FCuWTYN/cDbxU1cM841g8CjUAT/MaZXzGyDQ5dPJzilF8gt
         J6QA==
X-Gm-Message-State: AOJu0YzO3mZ1JBR9BAu7X7lKAE0/VhcLFNnDfBLLQm72h5TW/Mxl/BIU
	1BSptHk+OHv1T/nD963UGjeZHslaPkrbNsZKrPks9lUR/TkSfBvOdZ8xFEKOhRvStfRB8bFXnPn
	pJEg=
X-Google-Smtp-Source: AGHT+IEcuS69t07P/a/xBKbTv7OLw0gHGdE+QCFQsX6GXWfmhqhdEAnPFsZKi7XSTfmIAiR7YgwlHQ==
X-Received: by 2002:a17:90b:380b:b0:2a5:2db0:cbda with SMTP id mq11-20020a17090b380b00b002a52db0cbdamr549347pjb.25.1713386149678;
        Wed, 17 Apr 2024 13:35:49 -0700 (PDT)
Received: from xps13.. ([199.58.97.236])
        by smtp.gmail.com with ESMTPSA id s22-20020a17090aa11600b002ab664e5e17sm76876pjp.1.2024.04.17.13.35.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 13:35:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 7/7] systemd: Fix vlan qos mapping
Date: Wed, 17 Apr 2024 13:35:31 -0700
Message-Id: <1010d57595b0a4634d728d1d3fcb0087a2ff17ce.1713385733.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713385733.git.steve@sakoman.com>
References: <cover.1713385733.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 20:35:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198484

From: Sana Kazi <sanakazisk19@gmail.com>

Drop unnecessary restriction for QoS mapping.
Also adds tests for vlan QoS mapping.

Link: https://github.com/systemd/systemd/commit/fe830b84d4002582e7aefb16e5e09fd0195f21c8.patch
PR: https://github.com/systemd/systemd/pull/27761

Signed-off-by: Sana Kazi <sana.kazi@kpit.com>
Signed-off-by: Sana Kazi <sana.kazisk19@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../systemd/fix-vlan-qos-mapping.patch        | 140 ++++++++++++++++++
 meta/recipes-core/systemd/systemd_250.5.bb    |   1 +
 2 files changed, 141 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/fix-vlan-qos-mapping.patch

diff --git a/meta/recipes-core/systemd/systemd/fix-vlan-qos-mapping.patch b/meta/recipes-core/systemd/systemd/fix-vlan-qos-mapping.patch
new file mode 100644
index 0000000000..c530de7f50
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/fix-vlan-qos-mapping.patch
@@ -0,0 +1,140 @@
+From 4d13d175f8454df63843a880c78badd4f6d720ca Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Wed, 24 May 2023 11:02:36 +0900
+Subject: [PATCH 1/3] network/vlan: drop unnecessary restriction for QoS
+ mapping
+
+Fixes #27460.
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/fe830b84d4002582e7aefb16e5e09fd0195f21c8.patch]
+Signed-off-by: Sana Kazi <sana.kazi@kpit.com>
+---
+ src/network/netdev/vlan.c | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/src/network/netdev/vlan.c b/src/network/netdev/vlan.c
+index a3d961dac3ca4..d61e9486abc47 100644
+--- a/src/network/netdev/vlan.c
++++ b/src/network/netdev/vlan.c
+@@ -165,11 +165,6 @@ int config_parse_vlan_qos_maps(
+                         continue;
+                 }
+ 
+-                if (m->to > m->from || m->to == 0 || m->from == 0) {
+-                        log_syntax(unit, LOG_WARNING, filename, line, 0, "Invalid %s, ignoring: %s", lvalue, w);
+-                        continue;
+-                }
+-
+                 r = set_ensure_consume(s, &vlan_qos_maps_hash_ops, TAKE_PTR(m));
+                 if (r < 0) {
+                         log_syntax(unit, LOG_WARNING, filename, line, r, "Failed to store %s, ignoring: %s", lvalue, w);
+
+From 4194478af861f80a73905d1f9e570a09862f91a7 Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Wed, 24 May 2023 11:06:35 +0900
+Subject: [PATCH 2/3] network/vlan: paranoia about type safety
+
+No functional change, as the struct is defined as the following:
+```
+struct ifla_vlan_qos_mapping {
+      __u32 from;
+      __u32 to;
+};
+```
+---
+ src/network/netdev/vlan.c | 16 +++++++++++-----
+ 1 file changed, 11 insertions(+), 5 deletions(-)
+
+diff --git a/src/network/netdev/vlan.c b/src/network/netdev/vlan.c
+index d61e9486abc47..5eb36ef6801f3 100644
+--- a/src/network/netdev/vlan.c
++++ b/src/network/netdev/vlan.c
+@@ -144,6 +144,7 @@ int config_parse_vlan_qos_maps(
+         for (const char *p = rvalue;;) {
+                 _cleanup_free_ struct ifla_vlan_qos_mapping *m = NULL;
+                 _cleanup_free_ char *w = NULL;
++                unsigned from, to;
+ 
+                 r = extract_first_word(&p, &w, NULL, EXTRACT_CUNESCAPE|EXTRACT_UNQUOTE);
+                 if (r == -ENOMEM)
+@@ -155,16 +156,21 @@ int config_parse_vlan_qos_maps(
+                 if (r == 0)
+                         return 0;
+ 
+-                m = new0(struct ifla_vlan_qos_mapping, 1);
+-                if (!m)
+-                        return log_oom();
+-
+-                r = parse_range(w, &m->from, &m->to);
++                r = parse_range(w, &from, &to);
+                 if (r < 0) {
+                         log_syntax(unit, LOG_WARNING, filename, line, r, "Failed to parse %s, ignoring: %s", lvalue, w);
+                         continue;
+                 }
+ 
++                m = new(struct ifla_vlan_qos_mapping, 1);
++                if (!m)
++                        return log_oom();
++
++                *m = (struct ifla_vlan_qos_mapping) {
++                        .from = from,
++                        .to = to,
++                };
++
+                 r = set_ensure_consume(s, &vlan_qos_maps_hash_ops, TAKE_PTR(m));
+                 if (r < 0) {
+                         log_syntax(unit, LOG_WARNING, filename, line, r, "Failed to store %s, ignoring: %s", lvalue, w);
+
+From 73d24e45f8ac18eaaebf1df2b1f055c14179c6ff Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Wed, 24 May 2023 11:15:44 +0900
+Subject: [PATCH 3/3] test-network: add tests for vlan QoS mapping
+
+---
+ .../conf/21-vlan.netdev.d/override.conf            | 10 ++++++----
+ test/test-network/systemd-networkd-tests.py        | 14 ++++++++------
+ 2 files changed, 14 insertions(+), 10 deletions(-)
+
+diff --git a/test/test-network/conf/21-vlan.netdev.d/override.conf b/test/test-network/conf/21-vlan.netdev.d/override.conf
+index 3b8d47d9b1db5..c71077d274a69 100644
+--- a/test/test-network/conf/21-vlan.netdev.d/override.conf
++++ b/test/test-network/conf/21-vlan.netdev.d/override.conf
+@@ -3,7 +3,9 @@ MTUBytes=2000
+ 
+ [VLAN]
+ Id=99
+-GVRP=true
+-MVRP=true
+-LooseBinding=true
+-ReorderHeader=true
++GVRP=yes
++MVRP=yes
++LooseBinding=yes
++ReorderHeader=yes
++EgressQOSMaps=0-1 1-3 10-3 6-6 7-7
++IngressQOSMaps=15-13 20-100
+diff --git a/test/test-network/systemd-networkd-tests.py b/test/test-network/systemd-networkd-tests.py
+index fe72f37ce4f47..8b01718d55e64 100755
+--- a/test/test-network/systemd-networkd-tests.py
++++ b/test/test-network/systemd-networkd-tests.py
+@@ -1285,12 +1285,14 @@ def test_vlan(self):
+ 
+         output = check_output('ip -d link show vlan99')
+         print(output)
+-        self.assertRegex(output, ' mtu 2000 ')
+-        self.assertRegex(output, 'REORDER_HDR')
+-        self.assertRegex(output, 'LOOSE_BINDING')
+-        self.assertRegex(output, 'GVRP')
+-        self.assertRegex(output, 'MVRP')
+-        self.assertRegex(output, ' id 99 ')
++        self.assertIn(' mtu 2000 ', output)
++        self.assertIn('REORDER_HDR', output)
++        self.assertIn('LOOSE_BINDING', output)
++        self.assertIn('GVRP', output)
++        self.assertIn('MVRP', output)
++        self.assertIn(' id 99 ', output)
++        self.assertIn('ingress-qos-map { 4:100 7:13 }', output)
++        self.assertIn('egress-qos-map { 0:1 1:3 6:6 7:7 10:3 }', output)
+ 
+         output = check_output('ip -4 address show dev test1')
+         print(output)
diff --git a/meta/recipes-core/systemd/systemd_250.5.bb b/meta/recipes-core/systemd/systemd_250.5.bb
index 80a797cf2c..4d520c85f3 100644
--- a/meta/recipes-core/systemd/systemd_250.5.bb
+++ b/meta/recipes-core/systemd/systemd_250.5.bb
@@ -33,6 +33,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0001-network-remove-only-managed-configs-on-reconfigure-o.patch \
            file://0001-nspawn-make-sure-host-root-can-write-to-the-uidmappe.patch \
            file://CVE-2023-7008.patch \
+           file://fix-vlan-qos-mapping.patch \
            "
 
 # patches needed by musl
-- 
2.34.1


