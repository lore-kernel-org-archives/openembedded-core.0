Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4F0EC624A5
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 06:15:02 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23738.1788156894346874585
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 23:14:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=jPz3r7bc;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3003; q=dns/txt;
  s=iport01; t=1788156894; x=1789366494;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aW5GsAfVLdfsBlyOkvq7EGKXFDn/RB1v6iS0Vci4pmw=;
  b=jPz3r7bcRrzxr8BdFJjp/8GkPVFsauIsGpKbeDg0NKjB8aOwRov5tKR4
   JLMCyqDl/ocO+yvrKeDLAwX/ob8kAXg5ZFCcqYCWgYouwyyk1OZj2uFUc
   H2srJa890WUjlOgtfWElniA7p5gs8lF5RR7Kb0ho56JFSGs0c1IXVahyT
   aFp6spXLfWNv65mmpB+ep+AWB93qpjNKy9P28VG0/fzfEr4lujEFKPYUf
   n2xxJtIZIt85gqKFbLVShQMgdwWQ/DaZxEJRNMMe6RY7x0LXTBW9ewzu4
   5g9DvhP/zOqk8S+VNmQ70tqX05xgNyifGsfllWSAOvSoJ8CrN9gNcVYKH
   Q==;
X-CSE-ConnectionGUID: KO30/a1xRTG0zTRKmCuwrg==
X-CSE-MsgGUID: ALBmtqZcSJua4kzxscHZsw==
X-IPAS-Result: =?us-ascii?q?A0CBSQDSGpVq/40QJK1aglmCV3RfQkmWSp4egSQDA1QPA?=
 =?us-ascii?q?QEBD0QNBAEBhQWNdQImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZaAQIBNQFGLAMBAlojIYMCAYJ0AgERwh6CLIEBg2IBgRrbMAELF?=
 =?us-ascii?q?AEFgTOFP4giXRgBhHwnGxuBcoR+gQWBXAKCLYV4BIIigQyBWpIfSIEeA1ksA?=
 =?us-ascii?q?VUTDQoLBwWBZgM1EioVbjIdgSM+F4ENGwYFgR2BKIQPIxk2eoEJXoErKWABE?=
 =?us-ascii?q?heBCYIIAoJaggUCAUlDDgdHUwkECxgNSBEsNxUZBD5uB456H4JEBgF7EwEqA?=
 =?us-ascii?q?YIEDwE6k1qReqEPCiiDdowilToaM4QEpmgLmH2CWYsxiHiNWIRpgWg8OYEgc?=
 =?us-ascii?q?BWDIglKGQ+OOINrgkrJbyQ1CzIBAQcCBw4DC4FokAItgU8BAQ?=
IronPort-Data: A9a23:aIsd36+G0LZ84gAq33LaDrUD13+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 2ofCm7QOfjfZzemfdAjPISyox8O6pTTyIdrTABoqX1EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mvyyHjEAX9gWAsYjlMs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kVGtZAve8uEVty2
 qQKFAouazuemPi5lefTpulE3qzPLeHiOIcZ/3UlxjbDALN+HdbIQr7B4plT2zJYasJmRKmFI
 ZFHL2MxKk2cOnWjOX9PYH46tOe0hnD8eidwo1OOrq1x6G/WpOB0+Oi3bIeOJoLbHq25mG6xg
 kjD433LCSo4KdXDyiiV6XmMtPTQyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NUF+t/7ESGzbDZpl7FQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSj1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:PWGVqaMm/EjlvcBcTu2jsMiBIKoaSvp037Dk7S9MoHtuA6mlfq
 +V/cjzuSWYtN9zYgBDpTn/Asm9qBrnnPYfi7X5Vo3NYOCJggeVxahZnO/fKkXbak7D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb66GGTCv5am85+rJjsaDZ1d0w==
X-Talos-CUID: 9a23:Wx1cTmGDF+37lRC5qmJE0xVMXcl8Ykfh4y/CH3WbDE10V6eaHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AEEwIag1bgrke4VDxnPL2ChCZITUjyoCEDVwUo54?=
 =?us-ascii?q?9mdSNaS9iKyyWrAasXdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,252,1779148800"; 
   d="scan'208";a="824534693"
Received: from alln-l-core-04.cisco.com ([173.36.16.141])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 31 Aug 2026 06:14:53 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-04.cisco.com (Postfix) with ESMTPS id 675A518000188;
	Mon, 31 Aug 2026 06:14:53 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id 02501CE1C04; Sun, 30 Aug 2026 23:14:52 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][scarthgap][PATCH 1/2] go: Fix CVE-2026-33814
Date: Sun, 30 Aug 2026 23:14:46 -0700
Message-Id: <20260831061447.180612-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: alln-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 06:15:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244730

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/golang/go/commit/9024c3f6b150fb1349d8a5dc5e9aa31d7896f67f
[2] https://pkg.go.dev/vuln/GO-2026-4918

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |  1 +
 .../go/go/CVE-2026-33814.patch                | 44 +++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-33814.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 99c5f8b63b..ee2f5ca277 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -62,6 +62,7 @@ SRC_URI += "\
     file://CVE-2026-25679.patch \
     file://CVE-2026-32288.patch \
     file://CVE-2026-27145.patch \
+    file://CVE-2026-33814.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2026-33814.patch b/meta/recipes-devtools/go/go/CVE-2026-33814.patch
new file mode 100644
index 0000000000..8265bf205f
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2026-33814.patch
@@ -0,0 +1,44 @@
+From 825d42a14d8ffbdbdda87a39e78795eb17e4f0f2 Mon Sep 17 00:00:00 2001
+From: Mark Freeman <mark@golang.org>
+Date: Fri, 17 Apr 2026 16:28:03 -0400
+Subject: [PATCH] [release-branch.go1.25] all: update x/net to a9171bc8
+
+Fixes #78477
+
+Change-Id: I0a4c8e25f569fc1bfb8ac39ff728bfe7300b751f
+Reviewed-on: https://go-review.googlesource.com/c/go/+/768323
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+TryBot-Bypass: Dmitri Shuralyov <dmitshur@google.com>
+
+CVE: CVE-2026-33814
+Upstream-Status: Backport [https://github.com/golang/go/commit/9024c3f6b150fb1349d8a5dc5e9aa31d7896f67f]
+
+Backport Changes:
+- Omitted src/go.mod, src/go.sum, and src/vendor/modules.txt because
+  their x/net version updates are not required for this focused backport.
+- Omitted removal of the SETTINGS_ENABLE_CONNECT_PROTOCOL-specific
+  s.Valid call because Go 1.22 does not contain that setting case; validation
+  is added at the start of the settings callback instead.
+
+(cherry picked from commit 9024c3f6b150fb1349d8a5dc5e9aa31d7896f67f)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/net/http/h2_bundle.go | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/net/http/h2_bundle.go b/src/net/http/h2_bundle.go
+index c1a2e76ea4d..2f5a6d3d5a2 100644
+--- a/src/net/http/h2_bundle.go
++++ b/src/net/http/h2_bundle.go
+@@ -9910,6 +9910,9 @@ func (rl *http2clientConnReadLoop) processSettingsNoWrite(f *http2SettingsFrame)
+ 
+ 	var seenMaxConcurrentStreams bool
+ 	err := f.ForeachSetting(func(s http2Setting) error {
++		if err := s.Valid(); err != nil {
++			return err
++		}
+ 		switch s.ID {
+ 		case http2SettingMaxFrameSize:
+ 			cc.maxFrameSize = s.Val
+-- 
+2.35.6
-- 
2.35.6


