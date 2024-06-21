Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06F9AC27C4F
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 04:42:17 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web10.65962.1718944930389065115
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jun 2024 21:42:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=AfDM1IOy;
 spf=pass (domain: mvista.com, ip: 209.85.160.51, mailfrom: vanusuri@mvista.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-25cc31f3716so637105fac.3
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Jun 2024 21:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1718944929; x=1719549729; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dXl0bmEpye2x83alIooNDOqSXUEudho3FcMNPf4x71s=;
        b=AfDM1IOyv3RgHRrCq6V6fzZeZ4UhZLbdDZn27WsTRVSSXS9MsZnB4AVcsa25Di21kO
         2f8zbjVtG+ldcXOIs/oONcqXSSs2OzN/icRzKygwyBsEa1SLnCs8ve0CZyRLoAGsaSYa
         N+F1ZGGbC71ou7VKa7cXa1+FkibrziXjoCcb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718944929; x=1719549729;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dXl0bmEpye2x83alIooNDOqSXUEudho3FcMNPf4x71s=;
        b=ZVBGQW/MqZcGs0kC0Jo9FnjpjgPlOVwAxmvLtL9TkOm+nGSK9A8sR04xcBDhExLwMB
         HzedQFHQVsBeyBao+Sz+k36FAWaxa1V/VkpBbd3h418qS4o8VhGOZmZrtbFbQluvwo4F
         BD/qOPlnPNWC4obsRzA3t4cuKukcun+SEYC+TKq+PlPwTWgbBe9AE5GB3TgnZOan/rqw
         l9BGxW2rZioXCYcijZzdUtfU08s+DBqG3RyXP46XIWlwhdH3+Ti6PNggT+aFkdxrJQZ7
         MhdlQoD7UPOrDN5T+VZk3NqMUmXUXvbH3MDH9cNshsrVFXwiDmxBsPx/1EBe/PAcJmlZ
         ObAA==
X-Gm-Message-State: AOJu0YxWA0B515D+z1ryFJaIIPi3XwMhxWKtjId0mzph5xYGqBU3GC7R
	PcyVGHAcjRCl0buQfibpVadSa3oJgxoP5g9LGVcnaiUwsu9xTYNjzT//4KquayW/AjhLitSKN4X
	V7tg=
X-Google-Smtp-Source: AGHT+IHqNbGqjk7Z80EFvjtYgX0plQP5u0TuioMqXyECxMi+TgE5MWGUMQ3pZBNb9slOfJCb+lp6xA==
X-Received: by 2002:a05:6870:4411:b0:254:c4ab:daf5 with SMTP id 586e51a60fabf-25c94a73345mr8212996fac.22.1718944928626;
        Thu, 20 Jun 2024 21:42:08 -0700 (PDT)
Received: from MVIN00020.mvista.com ([2401:4900:882d:d0e2:4477:e629:efd2:c8e0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70651304126sm469188b3a.206.2024.06.20.21.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 21:42:08 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][PATCH] go: Fix for CVE-2024-24790
Date: Fri, 21 Jun 2024 10:11:56 +0530
Message-Id: <20240621044156.782276-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 04:42:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200992

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://github.com/golang/go/commit/12d5810cdb1f73cf23d7a86462143e9463317fca

Reference: https://github.com/golang/go/issues/67680

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-devtools/go/go-1.22.2.inc        |   1 +
 .../go/go/CVE-2024-24790.patch                | 225 ++++++++++++++++++
 2 files changed, 226 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2024-24790.patch

diff --git a/meta/recipes-devtools/go/go-1.22.2.inc b/meta/recipes-devtools/go/go-1.22.2.inc
index b399207311..29be82b4e0 100644
--- a/meta/recipes-devtools/go/go-1.22.2.inc
+++ b/meta/recipes-devtools/go/go-1.22.2.inc
@@ -14,5 +14,6 @@ SRC_URI += "\
     file://0007-exec.go-filter-out-build-specific-paths-from-linker-.patch \
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
+    file://CVE-2024-24790.patch \
 "
 SRC_URI[main.sha256sum] = "374ea82b289ec738e968267cac59c7d5ff180f9492250254784b2044e90df5a9"
diff --git a/meta/recipes-devtools/go/go/CVE-2024-24790.patch b/meta/recipes-devtools/go/go/CVE-2024-24790.patch
new file mode 100644
index 0000000000..bdc33ee82c
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2024-24790.patch
@@ -0,0 +1,225 @@
+From 12d5810cdb1f73cf23d7a86462143e9463317fca Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Tue, 28 May 2024 13:26:31 -0700
+Subject: [PATCH] [release-branch.go1.22] net/netip: check if address is v6
+ mapped in Is methods
+
+In all of the Is* methods, check if the address is a v6 mapped v4
+address, and unmap it if so.
+
+Thanks to Enze Wang of Alioth (@zer0yu) and Jianjun Chen of Zhongguancun
+Lab (@chenjj) for reporting this issue.
+
+Fixes #67680
+Fixes #67682
+Fixes CVE-2024-24790
+
+Change-Id: I6bd03ca1a5d93a0b59027d861c84060967b265b0
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/1460
+Reviewed-by: Russ Cox <rsc@google.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+(cherry picked from commit f7f270c1621fdc7ee48e0487b2fac0356947d19b)
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/1480
+Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/590296
+Auto-Submit: Michael Knyszek <mknyszek@google.com>
+Reviewed-by: David Chase <drchase@google.com>
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/12d5810cdb1f73cf23d7a86462143e9463317fca]
+CVE: CVE-2024-24790
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/net/netip/inlining_test.go |  2 --
+ src/net/netip/netip.go         | 26 +++++++++++++++++-
+ src/net/netip/netip_test.go    | 50 +++++++++++++++++++++++++++++++---
+ 3 files changed, 71 insertions(+), 7 deletions(-)
+
+diff --git a/src/net/netip/inlining_test.go b/src/net/netip/inlining_test.go
+index b521eeebfd8f3..98584b098df1b 100644
+--- a/src/net/netip/inlining_test.go
++++ b/src/net/netip/inlining_test.go
+@@ -36,8 +36,6 @@ func TestInlining(t *testing.T) {
+ 		"Addr.Is4",
+ 		"Addr.Is4In6",
+ 		"Addr.Is6",
+-		"Addr.IsLoopback",
+-		"Addr.IsMulticast",
+ 		"Addr.IsInterfaceLocalMulticast",
+ 		"Addr.IsValid",
+ 		"Addr.IsUnspecified",
+diff --git a/src/net/netip/netip.go b/src/net/netip/netip.go
+index 7a189e8e16f4f..92cb57efef9a6 100644
+--- a/src/net/netip/netip.go
++++ b/src/net/netip/netip.go
+@@ -508,6 +508,10 @@ func (ip Addr) hasZone() bool {
+ 
+ // IsLinkLocalUnicast reports whether ip is a link-local unicast address.
+ func (ip Addr) IsLinkLocalUnicast() bool {
++	if ip.Is4In6() {
++		ip = ip.Unmap()
++	}
++
+ 	// Dynamic Configuration of IPv4 Link-Local Addresses
+ 	// https://datatracker.ietf.org/doc/html/rfc3927#section-2.1
+ 	if ip.Is4() {
+@@ -523,6 +527,10 @@ func (ip Addr) IsLinkLocalUnicast() bool {
+ 
+ // IsLoopback reports whether ip is a loopback address.
+ func (ip Addr) IsLoopback() bool {
++	if ip.Is4In6() {
++		ip = ip.Unmap()
++	}
++
+ 	// Requirements for Internet Hosts -- Communication Layers (3.2.1.3 Addressing)
+ 	// https://datatracker.ietf.org/doc/html/rfc1122#section-3.2.1.3
+ 	if ip.Is4() {
+@@ -538,6 +546,10 @@ func (ip Addr) IsLoopback() bool {
+ 
+ // IsMulticast reports whether ip is a multicast address.
+ func (ip Addr) IsMulticast() bool {
++	if ip.Is4In6() {
++		ip = ip.Unmap()
++	}
++
+ 	// Host Extensions for IP Multicasting (4. HOST GROUP ADDRESSES)
+ 	// https://datatracker.ietf.org/doc/html/rfc1112#section-4
+ 	if ip.Is4() {
+@@ -556,7 +568,7 @@ func (ip Addr) IsMulticast() bool {
+ func (ip Addr) IsInterfaceLocalMulticast() bool {
+ 	// IPv6 Addressing Architecture (2.7.1. Pre-Defined Multicast Addresses)
+ 	// https://datatracker.ietf.org/doc/html/rfc4291#section-2.7.1
+-	if ip.Is6() {
++	if ip.Is6() && !ip.Is4In6() {
+ 		return ip.v6u16(0)&0xff0f == 0xff01
+ 	}
+ 	return false // zero value
+@@ -564,6 +576,10 @@ func (ip Addr) IsInterfaceLocalMulticast() bool {
+ 
+ // IsLinkLocalMulticast reports whether ip is a link-local multicast address.
+ func (ip Addr) IsLinkLocalMulticast() bool {
++	if ip.Is4In6() {
++		ip = ip.Unmap()
++	}
++
+ 	// IPv4 Multicast Guidelines (4. Local Network Control Block (224.0.0/24))
+ 	// https://datatracker.ietf.org/doc/html/rfc5771#section-4
+ 	if ip.Is4() {
+@@ -592,6 +608,10 @@ func (ip Addr) IsGlobalUnicast() bool {
+ 		return false
+ 	}
+ 
++	if ip.Is4In6() {
++		ip = ip.Unmap()
++	}
++
+ 	// Match package net's IsGlobalUnicast logic. Notably private IPv4 addresses
+ 	// and ULA IPv6 addresses are still considered "global unicast".
+ 	if ip.Is4() && (ip == IPv4Unspecified() || ip == AddrFrom4([4]byte{255, 255, 255, 255})) {
+@@ -609,6 +629,10 @@ func (ip Addr) IsGlobalUnicast() bool {
+ // ip is in 10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16, or fc00::/7. This is the
+ // same as [net.IP.IsPrivate].
+ func (ip Addr) IsPrivate() bool {
++	if ip.Is4In6() {
++		ip = ip.Unmap()
++	}
++
+ 	// Match the stdlib's IsPrivate logic.
+ 	if ip.Is4() {
+ 		// RFC 1918 allocates 10.0.0.0/8, 172.16.0.0/12, and 192.168.0.0/16 as
+diff --git a/src/net/netip/netip_test.go b/src/net/netip/netip_test.go
+index a748ac34f13cc..56a6c7dacb0dc 100644
+--- a/src/net/netip/netip_test.go
++++ b/src/net/netip/netip_test.go
+@@ -591,10 +591,13 @@ func TestIPProperties(t *testing.T) {
+ 		ilm6     = mustIP("ff01::1")
+ 		ilmZone6 = mustIP("ff01::1%eth0")
+ 
+-		private4a = mustIP("10.0.0.1")
+-		private4b = mustIP("172.16.0.1")
+-		private4c = mustIP("192.168.1.1")
+-		private6  = mustIP("fd00::1")
++		private4a        = mustIP("10.0.0.1")
++		private4b        = mustIP("172.16.0.1")
++		private4c        = mustIP("192.168.1.1")
++		private6         = mustIP("fd00::1")
++		private6mapped4a = mustIP("::ffff:10.0.0.1")
++		private6mapped4b = mustIP("::ffff:172.16.0.1")
++		private6mapped4c = mustIP("::ffff:192.168.1.1")
+ 	)
+ 
+ 	tests := []struct {
+@@ -618,6 +621,11 @@ func TestIPProperties(t *testing.T) {
+ 			ip:            unicast4,
+ 			globalUnicast: true,
+ 		},
++		{
++			name:          "unicast v6 mapped v4Addr",
++			ip:            AddrFrom16(unicast4.As16()),
++			globalUnicast: true,
++		},
+ 		{
+ 			name:          "unicast v6Addr",
+ 			ip:            unicast6,
+@@ -639,6 +647,12 @@ func TestIPProperties(t *testing.T) {
+ 			linkLocalMulticast: true,
+ 			multicast:          true,
+ 		},
++		{
++			name:               "multicast v6 mapped v4Addr",
++			ip:                 AddrFrom16(multicast4.As16()),
++			linkLocalMulticast: true,
++			multicast:          true,
++		},
+ 		{
+ 			name:               "multicast v6Addr",
+ 			ip:                 multicast6,
+@@ -656,6 +670,11 @@ func TestIPProperties(t *testing.T) {
+ 			ip:               llu4,
+ 			linkLocalUnicast: true,
+ 		},
++		{
++			name:             "link-local unicast v6 mapped v4Addr",
++			ip:               AddrFrom16(llu4.As16()),
++			linkLocalUnicast: true,
++		},
+ 		{
+ 			name:             "link-local unicast v6Addr",
+ 			ip:               llu6,
+@@ -681,6 +700,11 @@ func TestIPProperties(t *testing.T) {
+ 			ip:       IPv6Loopback(),
+ 			loopback: true,
+ 		},
++		{
++			name:     "loopback v6 mapped v4Addr",
++			ip:       AddrFrom16(IPv6Loopback().As16()),
++			loopback: true,
++		},
+ 		{
+ 			name:                    "interface-local multicast v6Addr",
+ 			ip:                      ilm6,
+@@ -717,6 +741,24 @@ func TestIPProperties(t *testing.T) {
+ 			globalUnicast: true,
+ 			private:       true,
+ 		},
++		{
++			name:          "private v6 mapped v4Addr 10/8",
++			ip:            private6mapped4a,
++			globalUnicast: true,
++			private:       true,
++		},
++		{
++			name:          "private v6 mapped v4Addr 172.16/12",
++			ip:            private6mapped4b,
++			globalUnicast: true,
++			private:       true,
++		},
++		{
++			name:          "private v6 mapped v4Addr 192.168/16",
++			ip:            private6mapped4c,
++			globalUnicast: true,
++			private:       true,
++		},
+ 		{
+ 			name:        "unspecified v4Addr",
+ 			ip:          IPv4Unspecified(),
-- 
2.25.1


