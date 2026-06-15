Return-Path: <spushpka@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84DBDCD98DA
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 20:13:44 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.138610.1781554420984298008
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2026 13:13:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=BmUK3LdG;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: spushpka@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3158; q=dns/txt;
  s=iport01; t=1781554421; x=1782764021;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XXiXRMj2a8EB4r+ClwwZtqTZnn/78EbjHFh6sNwwwCg=;
  b=BmUK3LdGRdKz6Fd2KDP2Xpj465HUjLiQrFP6KcuRGgt5FQOzjbwz55v0
   wQJwtrDR9myFVU9KEw9BWR1wGv+VtFXdHTYw8uFvdf+QrznWJL1eDn1Ab
   nbHJftMnKdo2sIZQsM6Hn7t7K0vWl6GuTiV54Wa4ZUqGOPn693fjTJO4Z
   m4ftpS5M+kBX3VGAbW4x93+A9EM5/h66xOJaPDqk+bBGbLrXMIlHlJye1
   gkp70IYuv7RXYv6iz/MYQtog537dPam8lLRqcnEJiy77K5jt/+B29JU8C
   rHnAVE2PJEp06XM3YTAHJR46vZTOEaYRstStWFZJXRTnuBxfvIQOPz2+c
   g==;
X-CSE-ConnectionGUID: 2EmVCk4UR5eU1lxa4Uajkg==
X-CSE-MsgGUID: UqIcWr9JSxq1wtjib9yfbA==
X-IPAS-Result: =?us-ascii?q?A0BFAgB0XDBq/5T/Ja1aglmCV3RfQkmWS4MBmx2Bfg8BA?=
 =?us-ascii?q?QEPRA0EAQGFBo1BAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NhloBAgEqCwEYAS0sAwECWiMhgwIBgjoDNgIBEbZBgXkzgQGDKAExB?=
 =?us-ascii?q?QkCQ1DbLAELFAEFgTOFP4gfWxgBhHwnGxuBcoR+gQWBGkIBAxiICwSCIoEMg?=
 =?us-ascii?q?VqPKEiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDBsHBYEegg+BBYUPI?=
 =?us-ascii?q?x8DOX+Bb4ElZ2YVMDWBAQERHwogAwsYDUgRLDcUGwQ+bgeMUxcPgj2BDgErB?=
 =?us-ascii?q?IFJcJNmkX+hDwoog3WMIZU6GjOFW6URmQiOCpZQhGiBaDyBRwsHcBWDIglKG?=
 =?us-ascii?q?Q+OOIVqgxTCeCQ1AgkyAQEHAgcOAwuBaJF9AQE?=
IronPort-Data: A9a23:xANPma+dAdmf/oq2nnYJDrUD0H+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 WtJUGyBPf2CYzT3e9x2a4S3oEpT7JHdztVjTgdu+ytEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4muyyHjEAX9gWAsbDtJs/jrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2lsEIgm0eUrPFsT+
 MFBLCAEMi2KheG5lefTpulE3qzPLeHxN48Z/3UlxjbDALN/GNbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP00n1lQ/UPrSmM+znmTkcyVboXqepLE85C7YywkZPL3FbIuJIobUG5UI9qqej
 l/f3m/GGEA4D8yGkCWZ8HOm1/7BlwquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXzFCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r+78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:Dcs/4qOebYUk4MBcTu2jsMiBIKoaSvp037Dk7S9MoHtuA6mlfq
 +V/cjzuSWYtN9zYgBDpTn/Asm9qBrnnPYfi7X5Vo3NYOCJggeVxahZnO/fKkXbak7D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb66GGTCv5am85+rJjsaDZ1d0w==
X-Talos-CUID: =?us-ascii?q?9a23=3Ar8/hUmn4gs2obwBuTFlDSZcJJcnXOSfwyUn7IBO?=
 =?us-ascii?q?FMztkdeSRWVbMxapmkMU7zg=3D=3D?=
X-Talos-MUID: 9a23:C5wg+wbeF9h7vOBTiibNjw54ZeVT8733F1wPkJ9XqseOHHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,207,1774310400"; 
   d="scan'208";a="494026685"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Jun 2026 20:13:33 +0000
Received: from sjc-ads-3321.cisco.com (sjc-ads-3321.cisco.com [171.68.249.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 9AC1918000149;
	Mon, 15 Jun 2026 20:13:33 +0000 (GMT)
Received: by sjc-ads-3321.cisco.com (Postfix, from userid 1839047)
	id 48A93CC1243; Mon, 15 Jun 2026 13:13:33 -0700 (PDT)
From: "Shubham Pushpkar -X (spushpka - E INFOCHIPS PRIVATE LIMITED at Cisco)" <spushpka@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Shubham Pushpkar <spushpka@cisco.com>
Subject: [OE-core] [scarthgap] [PATCH] dpkg: Fix CVE-2026-2219
Date: Mon, 15 Jun 2026 13:13:21 -0700
Message-Id: <20260615201321.2329923-1-spushpka@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-3321.cisco.com [171.68.249.19];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.249.19, sjc-ads-3321.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 20:13:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238860

From: Shubham Pushpkar <spushpka@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://git.dpkg.org/cgit/dpkg/dpkg.git/commit/?id=6610297a62c0780dd0e80b0e302ef64fdcc9d313
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-2219

Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
---
 .../dpkg/dpkg/CVE-2026-2219.patch             | 47 +++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.22.0.bb     |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/CVE-2026-2219.patch

diff --git a/meta/recipes-devtools/dpkg/dpkg/CVE-2026-2219.patch b/meta/recipes-devtools/dpkg/dpkg/CVE-2026-2219.patch
new file mode 100644
index 0000000000..779ab924de
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/CVE-2026-2219.patch
@@ -0,0 +1,47 @@
+From 6610297a62c0780dd0e80b0e302ef64fdcc9d313 Mon Sep 17 00:00:00 2001
+From: Guillem Jover <guillem@debian.org>
+Date: Sat, 7 Feb 2026 00:57:55 +0100
+Subject: [PATCH] libdpkg: Terminate zstd decompression when we have no more
+ data
+
+We should be checking whether the input buffer is zero-sized, and then
+mark the stream as finished. Otherwise the zstd implementation does not
+detect that as an end of stream situation and we get stuck in an
+infinite loop spinning the CPU. This means the decompression process
+in dpkg-deb does not terminate, so no EPIPE gets generated and the
+other processes that are part of the unpacking do not stop either.
+
+Reported-by: Yashashree Gund <yash_gund@live.com>
+Fixes: commit 2c2f7066bd8c3209762762fa6905fa567b08ca5a
+Fixes: CVE-2026-2219
+Closes: #1129722
+Stable-Candidate: 1.21.x 1.22.x
+
+CVE: CVE-2026-2219
+Upstream-Status: Backport [https://git.dpkg.org/cgit/dpkg/dpkg.git/commit/?id=6610297a62c0780dd0e80b0e302ef64fdcc9d313]
+
+(cherry picked from commit 6610297a62c0780dd0e80b0e302ef64fdcc9d313)
+Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
+---
+ lib/dpkg/compress.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/lib/dpkg/compress.c b/lib/dpkg/compress.c
+index adf26ea7..bf73affe 100644
+--- a/lib/dpkg/compress.c
++++ b/lib/dpkg/compress.c
+@@ -1070,6 +1070,11 @@ filter_unzstd_code(struct io_zstd *io, struct io_zstd_stream *s)
+ 	ZSTD_outBuffer buf_out = { s->next_out, s->avail_out, 0 };
+ 	size_t ret;
+ 
++	if (buf_in.size == 0) {
++		s->status = DPKG_STREAM_END;
++		return;
++	}
++
+ 	ret = ZSTD_decompressStream(s->ctx.d, &buf_out, &buf_in);
+ 	if (ZSTD_isError(ret))
+ 		filter_zstd_error(io, ret);
+-- 
+2.35.6
+
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.22.0.bb b/meta/recipes-devtools/dpkg/dpkg_1.22.0.bb
index 41f5123508..16162ca926 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.22.0.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.22.0.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=main
            file://pager.patch \
            file://0001-Add-support-for-riscv32-CPU.patch \
            file://CVE-2025-6297.patch \
+           file://CVE-2026-2219.patch \
            "
 
 SRC_URI:append:class-native = " file://0001-build.c-ignore-return-of-1-from-tar-cf.patch"
-- 
2.35.6


