Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02778C5474F
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:27:03 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.8738.1724833614403108073
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:26:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=t6afnt7Q;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833615; x=1756369615;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ALgCJdP3aEUXp0ykvs1X543VfaV1oB3za4ssdCaoZgQ=;
  b=t6afnt7QqwJMjpSFwc64AuxGSywTPAu76cAXvN8/FOcYAVsF5UzW5MEp
   YnSSx5IoJEaj98NdntmNABU9ewXA3RZ/EiG5IbZQ98fev4cUrZU+3OgnR
   B3/3qjBj4L4EvXeen+iDUZZ+mKzFC39MhbI2bjKsXCDWGlJtbHs3yy+vF
   tAJBxJkjfH9knBe0adB/mVeLxWUZRzPBBdUtJQkomzOe7AGa3/goNZgic
   NFgcxF8aegXR+zqZYkGCkBMhxiAU7NeG3hN7n8HhQgGm3xDdnpXyRzGml
   zJykvtB3AWoGGle8zyALbgcq76mqA48V/NTFkajYAxeBDpoVKG2dW2A7x
   A==;
X-CSE-ConnectionGUID: DvLg7QuUTXe62ZlyfZpDKA==
X-CSE-MsgGUID: RBw09wTuSbmmgPiJ6RPj+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="171131493"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="171131493"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:26:52 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 24559D800A
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 17:26:50 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 717E0D4C00
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 17:26:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0C6BA6BD48
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 17:26:45 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AB86E1A0002;
	Wed, 28 Aug 2024 16:26:44 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] util-linux: use update-alternatives to  solve conflicts with lastlog2
Date: Wed, 28 Aug 2024 16:26:40 +0800
Message-Id: <1724833600-2270-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724833600-2270-1-git-send-email-wangmy@fujitsu.com>
References: <1724833600-2270-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10--6.224700-10.000000
X-TMASE-MatchedRID: hp3d3iDR7tiMPz8Goa6fXdl0i+WyI+910NnUUVMlTKaysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmLy9zcRSkKatWX7d9h2Er/bngIgpj8eDcBpkajQR5gb3lQwtQm7iV5jKra
	uXd3MZDUV2mQ/HE5PbiRLpO+Gzw9uHQTwPuoORtW4OqnWUhdWB4KBsJemD+9N
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 08:27:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203870

From: Wang Mingyu <wangmy@fujitsu.com>

Error: Transaction test error:
  file /usr/bin/lastlog2 conflicts between attempted installs of lastlog2-1.2.0-r0.core2_64 and util-linux-lastlog2-2.40.1-r0.core2_64
  file /usr/lib/security/pam_lastlog2.so conflicts between attempted installs of lastlog2-1.2.0-r0.core2_64 and util-linux-lastlog2-2.40.1-r0.core2_64

lastlog2 also uses the doc '/usr/bin/lastlog2' and '/usr/lib/security/pam_lastlog2.so'.
lastlog2 has a priority of 100.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/util-linux/util-linux_2.40.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/util-linux/util-linux_2.40.2.bb b/meta/recipes-core/util-linux/util-linux_2.40.2.bb
index a8e346539a..e21a16ab84 100644
--- a/meta/recipes-core/util-linux/util-linux_2.40.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.40.2.bb
@@ -298,6 +298,10 @@ ALTERNATIVE_LINK_NAME[unshare] = "${bindir}/unshare"
 ALTERNATIVE_LINK_NAME[utmpdump] = "${bindir}/utmpdump"
 ALTERNATIVE_LINK_NAME[uuidgen] = "${bindir}/uuidgen"
 ALTERNATIVE_LINK_NAME[wall] = "${bindir}/wall"
+ALTERNATIVE:${PN}-lastlog2 = "lastlog2 pam_lastlog2"
+ALTERNATIVE_LINK_NAME[lastlog2] = "${bindir}/lastlog2"
+ALTERNATIVE_TARGET[pam_lastlog2] = "${libdir}/security/pam_lastlog2.so"
+ALTERNATIVE_LINK_NAME[pam_lastlog2] = "${libdir}/security/pam_lastlog2.so"
 
 ALTERNATIVE:${PN}-doc = "\
 blkid.8 eject.1 findfs.8 fsck.8 kill.1 last.1 lastb.1 libblkid.3 logger.1 mesg.1 \
-- 
2.34.1


