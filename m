Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70DB9C79FBD
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 07:30:12 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6437.1788939002361638108
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 00:30:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=f8cnjrd2;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-482ea739de2so3777769f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 00:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788939000; x=1789543800; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JI94KdcV7NQIIpDcpfAEw6laepzw6QJZn+3FcUREBoo=;
        b=f8cnjrd2Uole8/7KI8gDykTbnizEuSsfCJYz7sGgWMTnTrRsAxX/nUi0pt3d3mU54a
         rCZOUdHXQOk+y8lSd9SeX+2Dm3s08eiNqx2ZI2DJafLwIoHMdVl5UK1ZYSOnPnCxOFMV
         nW1Io1FkZa83kYxy4F10T9CyQzADm5Uxus/jc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788939001; x=1789543801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JI94KdcV7NQIIpDcpfAEw6laepzw6QJZn+3FcUREBoo=;
        b=T+7lQ0pXo4+9iLVSB+WVaeHI6LYyjk80UCgJJg5VJKaUmONA6b2FYy42bQlvcdCQLN
         MZkNH8CQ3qEdphS/97yuXA/jxXEZMxB5ZfOpc2/AgKrwGnmMt3wZ9zwpYOO4EvXKCXsd
         64B3j1/dIn34IQ+jS9TJDscxKsRxOy/UY8+wumO852SydFxj0FhJ5IKp8AFOYZWL3zra
         1Y2hbeWC2LGWnlNzdmcUPGJbVrunCQWiBnbY1IJuJq2iPDb+GlkpFhct0w2bwn+D/FID
         SH7CQeuCaXUNlMIHp88QJ7rPN+srbYxBiUalqSrliV/rZ+dPyEIpGr2IEImEidzLVQES
         I9PQ==
X-Gm-Message-State: AFuF++mx+5jrFCmznP5k/d1qYyOUXYA1HP7GnUZXmZo4sHPqI7/gf/Zk
	G3UPQZejtmg8I2hNO8P9AFnOMuJasXziPhKEX8O584pWg8Ijvblf8VACIM0qd5MtMOcM+eMAtK0
	V33NsisU=
X-Gm-Gg: AYBFou37WlHGbe0l3dABtVEpQBRFmkPEvPWZgcVuavLeLNuSh28Z762bUVV4n/eQ9yK
	loc2ogG1EsAgp937QaKE839YIIanonu0RKDTZgJj7+NfYO40IWQYHUMCnbBXyFVBK92pVTMJPxQ
	lzlFNCvdx+NsyZAymSTCyEh84zy9zuRM9UnIR/FvoOkzgDUmP8rjKt2ikzuxFeQeDhJ/jMRX5kN
	khC/ydbkWPdpFSrXRArxXEep8INqAe1VouI1Lo9awLg0VIoJRaBp2HWwbeSVqlz3Seh24FYkXny
	qcfa5LUXSpJEnQrF/I1DQcGVvkgdBV/JfGmZlmLGv2lh0mfqiGody9iq0g+vucss6pc0lkovqgK
	3QrAJ0V8NU8FKM+ORmjvnLNVy0dG7LLHyaMXX2J5l49p1wzDbAmljjTiYpALk6k25X6h7/9ZD0l
	oZH4iVPaVRnByD0IY6t34gNFjzzjzNapzCibT34QTGtkfD33fVvKYHKb3hlhg19/aWz8W4vPiRC
	4X+QZw7CsbQuAu4x4KpEi8HKe2RyHUK2NHkVJZ9DVeNydX4cAYsP87m81RJ4E9iz8H2jBJcpz1V
	zRrW4RWaNw==
X-Received: by 2002:a5d:5e8a:0:b0:485:af9d:cd1f with SMTP id ffacd0b85a97d-485af9dcf4dmr1682828f8f.51.1788939000510;
        Wed, 09 Sep 2026 00:30:00 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm40624310f8f.16.2026.09.09.00.30.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:30:00 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 12/38] vim: Fix for CVE-2026-73072
Date: Wed,  9 Sep 2026 09:29:11 +0200
Message-ID: <c63a621b8af877b76b7cc6487d1256d8ff51f622.1788938909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788938908.git.yoann.congal@smile.fr>
References: <cover.1788938908.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 07:30:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245421

From: Hitendra Prajapati <hprajapati@mvista.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://github.com/vim/vim/commit/05c41c922309c7a11b6ec2f124be66551c90d66a
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-73072

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-73072.patch            | 64 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-73072.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-73072.patch b/meta/recipes-support/vim/files/CVE-2026-73072.patch
new file mode 100644
index 00000000000..0ae3b2b49e6
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-73072.patch
@@ -0,0 +1,64 @@
+From 05c41c922309c7a11b6ec2f124be66551c90d66a Mon Sep 17 00:00:00 2001
+From: Yasuhiro Matsumoto <mattn.jp@gmail.com>
+Date: Fri, 24 Jul 2026 00:58:37 +0900
+Subject: [PATCH] patch 9.2.0846: [security]: heap buffer overflow in
+ set_sofo()
+
+Problem:  [security]: heap buffer overflow in set_sofo()
+          (Yazan Balawneh)
+Solution: Reset sl_sal_first (Yasuhiro Matsumoto).
+
+A crafted spell file with an empty SN_SAL section before an SN_SOFO
+section reaches set_sofo() with sl_sal_first[] already set to -1 by
+set_sal_first(). The counting loop then under-counts colliding
+multi-byte "from" characters, allocates an undersized list and writes
+past its end.
+
+Github Security Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-9jqx-hgpr-6v64
+
+Signed-off-by: Yasuhiro Matsumoto <mattn.jp@gmail.com>
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+CVE: CVE-2026-73072
+Upstream-Status: Backport [https://github.com/vim/vim/commit/05c41c922309c7a11b6ec2f124be66551c90d66a]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/spellfile.c                | 4 +++-
+ src/testdir/test_spellfile.vim | 5 +++++
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/src/spellfile.c b/src/spellfile.c
+index b3ee9c0d63..a9f7e83752 100644
+--- a/src/spellfile.c
++++ b/src/spellfile.c
+@@ -1433,7 +1433,9 @@ set_sofo(slang_T *lp, char_u *from, char_u *to)
+ 	gap->ga_len = 256;
+ 
+ 	// First count the number of items for each list.  Temporarily use
+-	// sl_sal_first[] for this.
++	// sl_sal_first[] for this.  Reset it first: a preceding SN_SAL section
++	// may have set the entries to -1 via set_sal_first().
++	vim_memset(lp->sl_sal_first, 0, sizeof(salfirst_T) * 256);
+ 	for (p = from, s = to; *p != NUL && *s != NUL; )
+ 	{
+ 	    c = mb_cptr2char_adv(&p);
+diff --git a/src/testdir/test_spellfile.vim b/src/testdir/test_spellfile.vim
+index 3a93883b4d..0b0cf42066 100644
+--- a/src/testdir/test_spellfile.vim
++++ b/src/testdir/test_spellfile.vim
+@@ -319,6 +319,11 @@ func Test_spellfile_format_error()
+   " SN_SOFO: multi-byte characters in sofofrom and sofoto
+   call Spellfile_Test(0z0600000000080002CF810002CF82FF000000000000000000000000, '')
+ 
++  " SN_SAL (empty) followed by SN_SOFO with two multi-byte 'from' characters
++  " sharing the same low byte.  A preceding SN_SAL poisons sl_sal_first[], so
++  " without a reset set_sofo() under-counts and writes out of bounds.
++  call Spellfile_Test(0z05000000000300000006000000000A0004CAABCEAB00024142FF000000000000000000000000, '')
++
+   " SN_COMPOUND: compmax is less than 2
+   call Spellfile_Test(0z08000000000101, 'E759:')
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 1da47d92430..34d45079061 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -39,6 +39,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-59856.patch \
            file://CVE-2026-59857.patch \
            file://CVE-2026-59858.patch \
+           file://CVE-2026-73072.patch \
            "
 
 PV .= ".0340"

