Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64C37C531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 13:03:51 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30604.1785157424524873488
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 06:03:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=U77CATcE;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4374; q=dns/txt;
  s=iport01; t=1785157424; x=1786367024;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TyALoFxghlnVxqzhBv7I7n+Wyjkir8zi+bA2vP7T4hE=;
  b=U77CATcEFu1pvZciwcvZ1balrdJNe6B1l1bsH5G+ygQ6YI74+sP19SbP
   4vAgxEFtOIuarrhvPCdk3j0b108wvqs0wnFrUeFNjeeiLWmXtH1ZxRE6f
   jGgSLW+BYXhkKywVEYMsC5M7nKZV4O2D4i8JvCn6eSrEMke3/hZe44hxX
   cC/lA2rQ2a7CvAaRiPZiRVuO57m1FkIyV1iAx1Zu1sYpuVdY92Wk9DK39
   apfz0RUKvvCKH/HpmmsJzC8I4m4VYc54e5yQi0ZPvy64s2mvikDOC89kK
   jU58mVER1aeEXaGB38/Ty4go0EFSerJdBIVoecnNWel6BMUSnvHvaBPZ4
   A==;
X-CSE-ConnectionGUID: jFNb2kNBRwCHwRPQbZe//w==
X-CSE-MsgGUID: +xKFj9lGR/OqvPha2bgsYw==
X-IPAS-Result: =?us-ascii?q?A0BKAgDvVWdq/5UQJK1aglmCV3ReQ0mEV5EHb54bgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhQUCjWACJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2GWgECAQMjDwEYAS0QHAMBAgMCJgICKyMIEAmDAgGCdAMRxCx6g?=
 =?us-ascii?q?TKBAYMoAT8CQ1DbLgELFAEFgQUuhT+DHQGFAlwYAYR8JxsbgXKBFYNpgQWBX?=
 =?us-ascii?q?AEDGIUhgmoEgiKBDIFabo9ZSIECHANZLAFVEw0KCwcFgWYDNRIqFW4yHYEjP?=
 =?us-ascii?q?hc0WBsHBYEdgSxhhFgjGTl/gTF1SnctaQESF4EagzwCgUwDCxgNSBEsNxQZB?=
 =?us-ascii?q?D0BbgeNViKCO4EOASuBRZN4HZJIgTWfWgoog3WMIZU6GjOqbAuYfY4KlWhoh?=
 =?us-ascii?q?GmBaDyBRwsHcBWDIglKGQ+OLgoLhV+DFMM+JzICAQEHMgEBBwIHAgwDC4Fok?=
 =?us-ascii?q?AAsgVIBAQ?=
IronPort-Data: A9a23:Gl1iZq4DsS850+huw+N/OwxRtG/GchMFZxGqfqrLsTDasY5as4F+v
 mYbC2rUaa6LN2qmL9x/Poq//RsPvsTQy9NqHgtv/3s2Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2Qqaj1OtPrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eP6M+8Lx0J0t06
 tc4Nwo1VxqxiqXx3+fuIgVsrpxLwMjDNYcbvDRkiDreF/tjGMqFSKTR7tge1zA17ixMNa+BP
 IxCN3w2MlKZP0wn1lQ/UPrSmM+omnn2cDRCgFmUvqEwpWPUyWSd1ZCyYIqNIYzUHZ09ckCw5
 XLl0WaoBj4gc/uG1wKF+yimifT+gnauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJZF+k8rQXIwa3O7kPAXC4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:TeFNpqy86YWZC+kJyKOyKrPw8r1zdoMgy1knxilNoNJuHfBw8P
 re+sjztCWE7wr5N0tApTntAsS9qDbnhPxICOoqTNOftXfd2FdARbsKheCJ/9SjIVyaygc378
 ldmsZFZOEYJGIK9PoSmDPIcOoI8Z2g7L2ig/vYwjNGSAFnbLwl0iJCYzzranGfgGJ9dOAE/F
 323Ls9mwad
X-Talos-CUID: 9a23:JPV8cWO6tfH0+u5DWgdB/hQXPOofbVb9003oGkWKBCEuV+jA
X-Talos-MUID: =?us-ascii?q?9a23=3A64SfGA4zjBN/Tpmzzi66gEJTxowr84eAChEJvq9?=
 =?us-ascii?q?BnNCaDSx5YT2SlwWoF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,188,1779148800"; 
   d="scan'208";a="788038600"
Received: from alln-l-core-12.cisco.com ([173.36.16.149])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 27 Jul 2026 13:03:43 +0000
Received: from sjc-ads-5471.cisco.com (sjc-ads-5471.cisco.com [10.28.23.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-12.cisco.com (Postfix) with ESMTPS id 75A1918000B1E;
	Mon, 27 Jul 2026 13:03:43 +0000 (GMT)
Received: by sjc-ads-5471.cisco.com (Postfix, from userid 1887505)
	id 12305CC12A6; Mon, 27 Jul 2026 06:03:43 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][scarthgap][PATCH 2/2] patch: Fix CVE-2026-56288
Date: Mon, 27 Jul 2026 06:03:18 -0700
Message-Id: <20260727130318.56057-2-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260727130318.56057-1-hthakar@cisco.com>
References: <20260727130318.56057-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5471.cisco.com [10.28.23.235];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.23.235, sjc-ads-5471.cisco.com
X-Outbound-Node: alln-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 13:03:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242099

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix referenced by NVD in [2], using
the commit shown in [1].

[1] https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=e6d6a4e021660679d7fc9150f981d4920f722313
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-56288

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../patch/patch/CVE-2026-56288.patch          | 75 +++++++++++++++++++
 meta/recipes-devtools/patch/patch_2.7.6.bb    |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-devtools/patch/patch/CVE-2026-56288.patch

diff --git a/meta/recipes-devtools/patch/patch/CVE-2026-56288.patch b/meta/recipes-devtools/patch/patch/CVE-2026-56288.patch
new file mode 100644
index 0000000000..03e1211f2e
--- /dev/null
+++ b/meta/recipes-devtools/patch/patch/CVE-2026-56288.patch
@@ -0,0 +1,75 @@
+From f98fd4b5f696d1fcc9d86f81555370cf4b21150f Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Tue, 21 Apr 2026 10:05:02 -0700
+Subject: [PATCH] Avoid null pointer derefence with bad hunks
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Problem reported by Michał Majchrowicz.
+* src/pch.c (another_hunk): Keep chars_read positive
+even with malformed hunks.
+
+CVE: CVE-2026-56288
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=e6d6a4e021660679d7fc9150f981d4920f722313]
+
+(cherry picked from commit e6d6a4e021660679d7fc9150f981d4920f722313)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/pch.c | 15 ++++++++++-----
+ 1 file changed, 10 insertions(+), 5 deletions(-)
+
+diff --git a/src/pch.c b/src/pch.c
+index 6f9f36f..0a31f72 100644
+--- a/src/pch.c
++++ b/src/pch.c
+@@ -1728,7 +1728,8 @@ another_hunk (enum diff difftype, bool rev)
+ 		    p_end = filldst-1;
+ 		    malformed ();
+ 		}
+-		chars_read -= fillsrc == p_ptrn_lines && incomplete_line ();
++		chars_read -= (1 < chars_read && fillsrc == p_ptrn_lines
++			       && incomplete_line ());
+ 		p_Char[fillsrc] = ch;
+ 		p_line[fillsrc] = s;
+ 		p_len[fillsrc++] = chars_read;
+@@ -1745,7 +1746,8 @@ another_hunk (enum diff difftype, bool rev)
+ 		    malformed ();
+ 		}
+ 		context++;
+-		chars_read -= fillsrc == p_ptrn_lines && incomplete_line ();
++		chars_read -= (1 < chars_read && fillsrc == p_ptrn_lines
++			       && incomplete_line ());
+ 		p_Char[fillsrc] = ch;
+ 		p_line[fillsrc] = s;
+ 		p_len[fillsrc++] = chars_read;
+@@ -1765,7 +1767,8 @@ another_hunk (enum diff difftype, bool rev)
+ 		    p_end = fillsrc-1;
+ 		    malformed ();
+ 		}
+-		chars_read -= filldst == p_end && incomplete_line ();
++		chars_read -= (1 < chars_read && filldst == p_end
++			       && incomplete_line ());
+ 		p_Char[filldst] = ch;
+ 		p_line[filldst] = s;
+ 		p_len[filldst++] = chars_read;
+@@ -1852,7 +1855,8 @@ another_hunk (enum diff difftype, bool rev)
+ 	    if (buf[0] != '<' || (buf[1] != ' ' && buf[1] != '\t'))
+ 	      fatal ("'<' followed by space or tab expected at line %s of patch",
+ 		     format_linenum (numbuf0, p_input_line));
+-	    chars_read -= 2 + (i == p_ptrn_lines && incomplete_line ());
++	    chars_read -= 2 + (3 < chars_read && i == p_ptrn_lines
++			       && incomplete_line ());
+ 	    p_len[i] = chars_read;
+ 	    p_line[i] = savebuf (buf + 2, chars_read);
+ 	    if (chars_read && ! p_line[i]) {
+@@ -1897,7 +1901,8 @@ another_hunk (enum diff difftype, bool rev)
+ 	    if (buf[0] != '>' || (buf[1] != ' ' && buf[1] != '\t'))
+ 	      fatal ("'>' followed by space or tab expected at line %s of patch",
+ 		     format_linenum (numbuf0, p_input_line));
+-	    chars_read -= 2 + (i == p_end && incomplete_line ());
++	    chars_read -= 2 + (3 < chars_read && i == p_end
++			       && incomplete_line ());
+ 	    p_len[i] = chars_read;
+ 	    p_line[i] = savebuf (buf + 2, chars_read);
+ 	    if (chars_read && ! p_line[i]) {
diff --git a/meta/recipes-devtools/patch/patch_2.7.6.bb b/meta/recipes-devtools/patch/patch_2.7.6.bb
index 74d9085c6b..53e96dea0f 100644
--- a/meta/recipes-devtools/patch/patch_2.7.6.bb
+++ b/meta/recipes-devtools/patch/patch_2.7.6.bb
@@ -12,6 +12,7 @@ SRC_URI += "file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
             file://0001-Don-t-leak-temporary-file-on-failed-multi-file-ed.patch \
             file://CVE-2019-20633.patch \
             file://CVE-2026-56289.patch \
+            file://CVE-2026-56288.patch \
 "
 
 SRC_URI[md5sum] = "4c68cee989d83c87b00a3860bcd05600"
-- 
2.35.6


