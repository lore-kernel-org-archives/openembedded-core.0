Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C38BC36018
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 11:45:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5972.1743594338181533130
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 04:45:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=618716983d=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532B8RnB009262
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Apr 2025 04:45:37 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45rtf2grgx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 04:45:37 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 2 Apr 2025 04:45:36 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 2 Apr 2025 04:45:35 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH  1/2] go: fix CVE-2025-22870
Date: Wed, 2 Apr 2025 11:45:32 +0000
Message-ID: <20250402114533.2807712-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: CSY7cCuloUAXhfHn4ERUHhec3AoXKWsK
X-Proofpoint-GUID: CSY7cCuloUAXhfHn4ERUHhec3AoXKWsK
X-Authority-Analysis: v=2.4 cv=fM453Yae c=1 sm=1 tr=0 ts=67ed2361 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=XR8D0OoHHMoA:10 a=Oh2cFVv5AAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=A1X0JdhQAAAA:8 a=1XWaLZrsAAAA:8 a=yhUri8FnAAAA:8
 a=pM9yUfARAAAA:8 a=6hXdQ5SXz-P5BoRplDAA:9 a=7KeoIwV6GZqOttXkcoxL:22 a=FdTzh2GWekK77mhwV6Dw:22 a=8nbOMqh3J4Vhtx036jbE:22 a=YH-7kEGJnRg4CV3apUU-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_04,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 mlxscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504020074
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 11:45:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214261

From: Archana Polampalli <archana.polampalli@windriver.com>

Matching of hosts against proxy patterns can improperly treat an IPv6 zone ID
as a hostname component. For example, when the NO_PROXY environment variable
is set to "*.example.com", a request to "[::1%25.example.com]:80` will incorrectly
match and not be proxied.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |  1 +
 .../go/go/CVE-2025-22870.patch                | 80 +++++++++++++++++++
 2 files changed, 81 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-22870.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 05aa3a95b6..df77794506 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -14,5 +14,6 @@ SRC_URI += "\
     file://0007-exec.go-filter-out-build-specific-paths-from-linker-.patch \
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
+    file://CVE-2025-22870.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
diff --git a/meta/recipes-devtools/go/go/CVE-2025-22870.patch b/meta/recipes-devtools/go/go/CVE-2025-22870.patch
new file mode 100644
index 0000000000..6ed394c8e5
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2025-22870.patch
@@ -0,0 +1,80 @@
+From 25177ecde0922c50753c043579d17828b7ee88e7 Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Wed, 26 Feb 2025 16:08:57 -0800
+Subject: [PATCH] all: updated vendored x/net with security fix
+
+0b6d719 [internal-branch.go1.23-vendor] proxy, http/httpproxy: do not mismatch IPv6 zone ids against hosts
+
+Fixes CVE-2025-22870
+For #71985
+
+Change-Id: Ib72c96bd0ab44d9ed2ac1428e0a9fc245464b3fc
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/2141
+Commit-Queue: Damien Neil <dneil@google.com>
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Reviewed-by: Neal Patel <nealpatel@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/654695
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-by: Michael Pratt <mpratt@google.com>
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Auto-Submit: Junyang Shao <shaojunyang@google.com>
+
+CVE: CVE-2025-22870
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/25177ecde0922c50753c043579d17828b7ee88e7]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/cmd/internal/moddeps/moddeps_test.go            |  1 +
+ src/vendor/golang.org/x/net/http/httpproxy/proxy.go | 10 ++++++++--
+ 2 files changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/src/cmd/internal/moddeps/moddeps_test.go b/src/cmd/internal/moddeps/moddeps_test.go
+index 3d4c99e..ffaa16c 100644
+--- a/src/cmd/internal/moddeps/moddeps_test.go
++++ b/src/cmd/internal/moddeps/moddeps_test.go
+@@ -33,6 +33,7 @@ import (
+ // See issues 36852, 41409, and 43687.
+ // (Also see golang.org/issue/27348.)
+ func TestAllDependencies(t *testing.T) {
++	t.Skip("TODO(#71985) 1.23.7 contains unreleased changes from vendored modules")
+	goBin := testenv.GoToolPath(t)
+
+	// Ensure that all packages imported within GOROOT
+diff --git a/src/vendor/golang.org/x/net/http/httpproxy/proxy.go b/src/vendor/golang.org/x/net/http/httpproxy/proxy.go
+index c3bd9a1..864961c 100644
+--- a/src/vendor/golang.org/x/net/http/httpproxy/proxy.go
++++ b/src/vendor/golang.org/x/net/http/httpproxy/proxy.go
+@@ -14,6 +14,7 @@ import (
+	"errors"
+	"fmt"
+	"net"
++	"net/netip"
+	"net/url"
+	"os"
+	"strings"
+@@ -180,8 +181,10 @@ func (cfg *config) useProxy(addr string) bool {
+	if host == "localhost" {
+		return false
+	}
+-	ip := net.ParseIP(host)
+-	if ip != nil {
++	nip, err := netip.ParseAddr(host)
++	var ip net.IP
++	if err == nil {
++		ip = net.IP(nip.AsSlice())
+		if ip.IsLoopback() {
+			return false
+		}
+@@ -363,6 +366,9 @@ type domainMatch struct {
+ }
+
+ func (m domainMatch) match(host, port string, ip net.IP) bool {
++	if ip != nil {
++		return false
++	}
+	if strings.HasSuffix(host, m.host) || (m.matchHost && host == m.host[1:]) {
+		return m.port == "" || m.port == port
+	}
+--
+2.40.0
-- 
2.40.0


