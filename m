Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99847C88E40
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 07:30:12 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6320.1788939003577747152
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 00:30:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xYz54KsS;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0f79so3534715e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 00:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788939002; x=1789543802; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=n5hxVys31tLDYEmxaUOto3Rn05vlvRdVhLfAZRhySzo=;
        b=xYz54KsS83d+vXvhliY/kJeGz4UDyF2DemVKjolj3PGHTfpym/CbL+rNZPPeAW3YQP
         fXbanAApyht1IzkM67gsnNVXVPo33dcqUa5RHqSNSnz5kn4uUkTLh+UGlQJ8egFnUliZ
         Os9mNw7I+my0YsLUBqr+pQiRr5EPuzPd5qq8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788939002; x=1789543802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=n5hxVys31tLDYEmxaUOto3Rn05vlvRdVhLfAZRhySzo=;
        b=azyW8Ms+coXGjgr6uf40rX2cYLpKG958cq/ng3d/QK+Zu3OD7Rhyk8+I+FNr62fZIJ
         TruHVB5dztcj0XyTo7H1hJFv28bGo4j9ORr7cGH6/ufPPROrHKUixMu039c6l3+46rAG
         lmCT9paUGjfUFvC9KAhGuKtztLEFxaAS/OgFIx6yudgKqPIBRbhzwjfT/KZ7m2OxAWAw
         YTzfOBufDyQTNK62hTn/u0Nou6XOewWMTDBvh2Kl75FvlN+flqMasLR4PO9IzjjzllRn
         R2u/zTl1qH9rSqDz6GPcMU/yJ8vYqWBxWPblGl0M6W/Gd0kAt4cqSFgv4KoFxnjhpX22
         95bg==
X-Gm-Message-State: AFuF++mM6KYvzJJyka4SUMBRlaK/Yz9KM6Y6mJZKq24Hz5ng/FCVWaIR
	1dXvR9kMlPpcYXydZzPEUf5ZbhK3j5b2F1MPKC0iOv6U8nCSYtXAmkgCBxLnW9VyKaqtRq/HXwN
	DPd3ApXU=
X-Gm-Gg: AYBFou2P5kK232gvxkS2o40QY2L/X3Y7kPu8b8ncJWs9taAUEehTwN/mHhbPg1auqXq
	NYl/d6SYixpZU1u51Np19iNTNrHqDbUXr/OhwrXQVynn/C05VGnOTrjAHI0C6x1C5pVvBn8Qhn3
	D8W7gWaKGa55DZ4e7Ivyju4u6270iUCNcwuGB2sSMk50EKnYFG9OnZD0HcJzkTMKrn90Vlvim9c
	CEA3JJpZ8E2AZfR8GSJjMAs1Yd1pB3q5br6xtAoSCuMV6TkCfuGngLBi/c08DMXwPLHl0t5PLiI
	JW0WfKzYttdMcdK2Qs7vXGGq0aHxoWe+R0/g45+asbbyTRcPhwR4802apPpCb0JO6+9I8c2M9yZ
	WkBoatyRKiwsj2lDX2t95pPe9Lu0TNC6qfyizUlKTNpvfehvBqWM8dctsBIU7IO5WUc4uMPN41/
	g0MzlOKLDHGAsTXl+3Aw3jZNOUmw0eYtKyBSraV2/mKjsXLNDnpQ45YfJTbuq1J7AyeSPkb4OIE
	PlHCMAIgyaYNpuUk+EYpmooPL1CaqeCOLP3dPR0+qe3ejwkVcGuh5S5QwZEWvUyVM+/Xn8OAxM=
X-Received: by 2002:a05:600c:c178:b0:49d:870:7a69 with SMTP id 5b1f17b1804b1-49d1f362a92mr52773295e9.12.1788939001613;
        Wed, 09 Sep 2026 00:30:01 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm40624310f8f.16.2026.09.09.00.30.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:30:01 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 14/38] vim: Fix for CVE-2026-73074
Date: Wed,  9 Sep 2026 09:29:13 +0200
Message-ID: <76bfbf7742275f21acd82535584615ca5ebd2902.1788938909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788938908.git.yoann.congal@smile.fr>
References: <cover.1788938908.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 07:30:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245423

From: Hitendra Prajapati <hprajapati@mvista.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://github.com/vim/vim/commit/a9336b476fd1a182e3f79b5f83c0ffb04f8a922b
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-73074

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-73074.patch            | 115 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 116 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-73074.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-73074.patch b/meta/recipes-support/vim/files/CVE-2026-73074.patch
new file mode 100644
index 00000000000..896298b7032
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-73074.patch
@@ -0,0 +1,115 @@
+From a9336b476fd1a182e3f79b5f83c0ffb04f8a922b Mon Sep 17 00:00:00 2001
+From: Yasuhiro Matsumoto <mattn.jp@gmail.com>
+Date: Thu, 23 Jul 2026 20:14:13 +0000
+Subject: [PATCH] patch 9.2.0841: [security]: heap overflow when adding > 65535
+ text properties
+
+Problem:  [security]: heap overflow when adding > 65535 text properties
+          (Wang1rrr).
+Solution: Verify that the number of text properties falls within the
+          limit (Yasuhiro Matsumoto).
+
+Github Security Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-hm4g-pjfx-m27j
+
+Signed-off-by: Yasuhiro Matsumoto <mattn.jp@gmail.com>
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+CVE: CVE-2026-73074
+Upstream-Status: Backport [https://github.com/vim/vim/commit/a9336b476fd1a182e3f79b5f83c0ffb04f8a922b]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/errors.h                  |  4 ++++
+ src/po/vim.pot                |  3 +++
+ src/testdir/test_textprop.vim | 18 ++++++++++++++++++
+ src/textprop.c                |  7 +++++++
+ src/version.c                 |  2 ++
+ 5 files changed, 34 insertions(+)
+
+diff --git a/src/errors.h b/src/errors.h
+index 53e5b1dda6..1682c8587c 100644
+--- a/src/errors.h
++++ b/src/errors.h
+@@ -3812,3 +3812,7 @@ EXTERN char e_gethostbyname_in_channel_listen[]
+ EXTERN char e_cannot_create_pipes[]
+ 	INIT(= N_("E1575: Cannot create pipes"));
+ #endif
++#ifdef FEAT_PROP_POPUP
++EXTERN char e_too_many_text_properties_on_a_single_line[]
++	INIT(= N_("E1580: Too many text properties on a single line"));
++#endif
+diff --git a/src/po/vim.pot b/src/po/vim.pot
+index b2e3b0f647..aed7d833cf 100644
+--- a/src/po/vim.pot
++++ b/src/po/vim.pot
+@@ -8859,6 +8859,9 @@ msgstr ""
+ msgid "E1575: Cannot create pipes"
+ msgstr ""
+ 
++msgid "E1580: Too many text properties on a single line"
++msgstr ""
++
+ #. type of cmdline window or 0
+ #. result of cmdline window or 0
+ #. buffer of cmdline window or NULL
+diff --git a/src/testdir/test_textprop.vim b/src/testdir/test_textprop.vim
+index f94acfc97c..a293363a8a 100644
+--- a/src/testdir/test_textprop.vim
++++ b/src/testdir/test_textprop.vim
+@@ -4907,4 +4907,22 @@ func Test_textprop_materialize_list()
+ 	call assert_equal([], prop_list(1, #{ids: 3->range()}))
+ endfunc
+ 
++" Adding more than 65535 text properties to one line must be rejected instead
++" of wrapping the uint16_t property count and overflowing the allocation.
++func Test_prop_add_over_uint16_max()
++  CheckNotAsan
++  CheckNotValgrind
++  new
++  call setline(1, 'x')
++  call prop_type_add('overflow', {})
++  for _ in range(0xffff)
++    call prop_add(1, 1, {'type': 'overflow', 'length': 0})
++  endfor
++  call assert_equal(0xffff, prop_list(1)->len())
++  call assert_fails("call prop_add(1, 1, {'type': 'overflow', 'length': 0})", 'E1580:')
++  call assert_equal(0xffff, prop_list(1)->len())
++  call prop_type_delete('overflow')
++  bwipe!
++endfunc
++
+ " vim: shiftwidth=2 sts=2 expandtab
+diff --git a/src/textprop.c b/src/textprop.c
+index 5959ecc45f..fe453244c1 100644
+--- a/src/textprop.c
++++ b/src/textprop.c
+@@ -758,6 +758,13 @@ prop_add_one(
+ 	proplen = get_text_props(buf, lnum, &props, TRUE);
+ 	textlen = ml_get_buf_len(buf, lnum) + 1;
+ 
++	// prop_count is a uint16_t; stop before proplen + 1 wraps to zero.
++	if (proplen >= 0xffff)
++	{
++	    emsg(_(e_too_many_text_properties_on_a_single_line));
++	    goto theend;
++	}
++
+ 	if (lnum == start_lnum)
+ 	    col = start_col;
+ 	else
+diff --git a/src/version.c b/src/version.c
+index 26e4e026c3..2a056f9da5 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -734,6 +734,8 @@ static char *(features[]) =
+ 
+ static int included_patches[] =
+ {   /* Add new patch number below this line */
++/**/
++    841,
+ /**/
+     845,
+ /**/
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 7ab7a405ffc..9dda2c0be55 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -41,6 +41,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-59858.patch \
            file://CVE-2026-73072.patch \
            file://CVE-2026-73073.patch \
+           file://CVE-2026-73074.patch \
            "
 
 PV .= ".0340"

