Return-Path: <dnagodra@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86EE8C001E0
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 06:46:28 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.web10.5615.1690353978150461627
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jul 2023 23:46:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=PC2y+4le;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: dnagodra@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=3130; q=dns/txt; s=iport;
  t=1690353978; x=1691563578;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rXrJLa0lznj7PJyJG2boRoJ4r698iSShwjagBRBX+3g=;
  b=PC2y+4le/ysb8xgoEaq4wOnkKWJiacXYky3a/CcC6cC5adpCQTXI3geB
   q23K7FBDKdhsfMhX9wRqICIryUbc+euf7q3cX+wbkXW5DgTPUUBeVFDy8
   ifMCt8UeFpKxhDfLu/3VIhnCrjaiRdy4y9+xXyzucNCTFfFjrnlfsbm7d
   c=;
X-IronPort-AV: E=Sophos;i="6.01,231,1684800000"; 
   d="scan'208";a="92799625"
Received: from rcdn-core-11.cisco.com ([173.37.93.147])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 06:46:17 +0000
Received: from sjc-ads-8077.cisco.com (sjc-ads-8077.cisco.com [171.68.208.115])
	by rcdn-core-11.cisco.com (8.15.2/8.15.2) with ESMTPS id 36Q6kGAT029731
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 26 Jul 2023 06:46:16 GMT
Received: by sjc-ads-8077.cisco.com (Postfix, from userid 1820939)
	id D2F1CCC1251; Tue, 25 Jul 2023 23:46:15 -0700 (PDT)
From: Dhairya Nagodra <dnagodra@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, anuj.mittal@intel.com,
        Dhairya Nagodra <dnagodra@cisco.com>
Subject: [dunfell] [PATCH] harfbuzz: Resolve backported commit bug.
Date: Tue, 25 Jul 2023 23:45:34 -0700
Message-Id: <20230726064533.1263164-1-dnagodra@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 171.68.208.115, sjc-ads-8077.cisco.com
X-Outbound-Node: rcdn-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 06:46:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184863

The commit [https://github.com/openembedded/openembedded-core/commit/c22bbe9b45e3]
backports fix for CVE-2023-25193 for version 2.6.4.
The apply() in src/hb-ot-layout-gpos-table.hh ends prematurely.
The if block in apply() has an extra return statement,
which causes it to return w/o executing
buffer->unsafe_to_concat_from_outbuffer() function.

Signed-off-by: Dhairya Nagodra <dnagodra@cisco.com>
---
 .../harfbuzz/harfbuzz/CVE-2023-25193.patch       | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193.patch b/meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193.patch
index 8243117551..e4ac13dbad 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193.patch
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193.patch
@@ -1,4 +1,4 @@
-From 8708b9e081192786c027bb7f5f23d76dbe5c19e8 Mon Sep 17 00:00:00 2001
+From 9c8e972dbecda93546038d24444d8216397d75a3 Mon Sep 17 00:00:00 2001
 From: Behdad Esfahbod <behdad@behdad.org>
 Date: Mon, 6 Feb 2023 14:51:25 -0700
 Subject: [PATCH] [GPOS] Avoid O(n^2) behavior in mark-attachment
@@ -8,13 +8,15 @@ Comment1: The Original Patch [https://github.com/harfbuzz/harfbuzz/commit/85be87
 Comment2: The Patch contained files MarkBasePosFormat1.hh and MarkLigPosFormat1.hh which were moved from hb-ot-layout-gpos-table.hh as per https://github.com/harfbuzz/harfbuzz/commit/197d9a5c994eb41c8c89b7b958b26b1eacfeeb00
 CVE: CVE-2023-25193
 Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+Signed-off-by: Dhairya Nagodra <dnagodra@cisco.com>
+
 ---
- src/hb-ot-layout-gpos-table.hh | 101 ++++++++++++++++++++++++---------
+ src/hb-ot-layout-gpos-table.hh | 103 +++++++++++++++++++++++----------
  src/hb-ot-layout-gsubgpos.hh   |   5 +-
- 2 files changed, 77 insertions(+), 29 deletions(-)
+ 2 files changed, 78 insertions(+), 30 deletions(-)
 
 diff --git a/src/hb-ot-layout-gpos-table.hh b/src/hb-ot-layout-gpos-table.hh
-index 024312d..88df13d 100644
+index 024312d..db5f9ae 100644
 --- a/src/hb-ot-layout-gpos-table.hh
 +++ b/src/hb-ot-layout-gpos-table.hh
 @@ -1458,6 +1458,25 @@ struct MarkBasePosFormat1
@@ -102,8 +104,9 @@ index 024312d..88df13d 100644
 +    //if (!_hb_glyph_info_is_base_glyph (&buffer->info[idx])) { return_trace (false); }
  
 -    unsigned int base_index = (this+baseCoverage).get_coverage  (buffer->info[skippy_iter.idx].codepoint);
+-    if (base_index == NOT_COVERED) return_trace (false);
 +    unsigned int base_index = (this+baseCoverage).get_coverage  (buffer->info[idx].codepoint);
-     if (base_index == NOT_COVERED) return_trace (false);
++    if (base_index == NOT_COVERED)
 +    {
 +      buffer->unsafe_to_concat_from_outbuffer (idx, buffer->idx + 1);
 +      return_trace (false);
@@ -174,6 +177,3 @@ index 5a7e564..437123c 100644
    void set_auto_zwj (bool auto_zwj_) { auto_zwj = auto_zwj_; init_iters (); }
    void set_auto_zwnj (bool auto_zwnj_) { auto_zwnj = auto_zwnj_; init_iters (); }
    void set_random (bool random_) { random = random_; }
--- 
-2.25.1
-
-- 
2.35.6


