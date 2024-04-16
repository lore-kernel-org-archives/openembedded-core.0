Return-Path: <sanakazisk19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB36EC4345F
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 13:16:51 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.20479.1713273409441953927
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Apr 2024 06:16:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WQnMSLFI;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: sanakazisk19@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-347e635b1fcso1361959f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713273407; x=1713878207; darn=lists.openembedded.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rI3JyAsIwF/aUOohDl8WWScGISOoe5JBnJhxj3kjMSo=;
        b=WQnMSLFIFp535zC1WAY9vCcae+zKiozaZtxneY7sohTZqUfFSyAB/rPszVO/qXzPJ7
         DiFpi3lMPxCKINAXE1cNzg8x9Equ81iIeCK4I/z2E0aOYSy1eMq+FOBF7Ka4/TasETDR
         tmh8HkQcKfw5MPJ7nn7GPmTZmhIFOKd3Q1gVB1ma7Bw6GMgT+UqKSNzqviAttKRe90qL
         rDwtEBBsOyO0zD8zHUzL8LIKnVN63Am8kaPgiiBIteCJ2npPM1lYu/NOsbHqsCqfPXQD
         n9qwWa5BsIeom2twyY/yg1uldo7hiK5r+G+iuf/5VZJ0Yaj99UTco+qDK1csZciV9DSf
         DMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713273407; x=1713878207;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rI3JyAsIwF/aUOohDl8WWScGISOoe5JBnJhxj3kjMSo=;
        b=oosRIFSzFkU1MCJnI7h4JH4Tc+KU6/PtLnHDRDykhUwleQvQyDR5XIF1ccl+8LZXD6
         sxrxj8TawdydQXdqHHst0qTasG2DdFu3GrdAWB2gWaOE9ijCjgC1dEwW7z0ujP+M5bS0
         O1/zsb8SdctJ/KsJgYIMtGG4IQ70QUQDc2kPq0bFqlV5XNJvmmsTtVL+9/bZv1zVMxUJ
         d2n/pgZCTwH4UMAXEDsKx4kwEhqykiXKg8Eo2DpJlvprgDpm2++md3FR/v92dTQdjtZe
         Bv/rbGFQGbY5pk09dx/cdBH0VRrDvPhlC525XPuns1Xo3XsywjNkov51pfe91xx005F4
         PMwA==
X-Gm-Message-State: AOJu0YzkLO+PLyjkilI9XOge8iUlTpJRdAI+Emeai6J/SGaaemuaYdkI
	oN6fuiS2b4v5msEzS3FXrLCXtH4z9uOnXkZwvK2jLZHV/+KVAIYidFA+NQ==
X-Google-Smtp-Source: AGHT+IHTzS817/UV6NGNWHFJ5v46Ntl3boVz3/oT92jZ0O6U/zg3Uyilges4jDD+TvFdGGL3H6CWPw==
X-Received: by 2002:a05:6000:1bc2:b0:341:bd4c:f075 with SMTP id j2-20020a0560001bc200b00341bd4cf075mr8774192wrv.16.1713273406888;
        Tue, 16 Apr 2024 06:16:46 -0700 (PDT)
Received: from GL-449.bmw-carit.intra ([212.118.206.70])
        by smtp.gmail.com with ESMTPSA id m5-20020a5d6245000000b0034334af2957sm14883965wrv.37.2024.04.16.06.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 06:16:46 -0700 (PDT)
From: Sana Kazi <sanakazisk19@gmail.com>
X-Google-Original-From: Sana Kazi <sana.kazisk19@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sana Kazi <sana.kazi@kpit.com>
Subject: [OE-Core][kirkstone][PATCH] systemd: Fix vlan qos mapping
Date: Tue, 16 Apr 2024 15:16:32 +0200
Message-Id: <20240416131632.335-1-sana.kazisk19@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 13:16:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198451

Drop unnecessary restriction for QoS mapping.
Also adds tests for vlan QoS mapping.

Link: https://github.com/systemd/systemd/commit/fe830b84d4002582e7aefb16e5e09fd0195f21c8.patch
PR: https://github.com/systemd/systemd/pull/27761

Signed-off-by: Sana Kazi <sana.kazi@kpit.com>
Signed-off-by: Sana Kazi <sana.kazisk19@gmail.com>
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
2.17.1


