Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BB72C61DD3
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 07:45:05 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2548.1788248698705204451
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 00:44:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=MiIhF69I;
 spf=pass (domain: mvista.com, ip: 209.85.216.53, mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-398b3d66515so3243862a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 00:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1788248698; x=1788853498; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pq8bO0PzDc2RkRwb4HUlSRQIgs6hFvJSxBcGCrIbpc8=;
        b=MiIhF69I3Fm2JQpvPOyDpLPOezTaKLBQPBKHZYyth+LSk0sUV44J/64uMe+lO0isY4
         /DxpK7GhYc8aQc6BHnLzQfXw4WsTIb+Ik0C1gLkigIaG/CQuoUhaIc5WN4YRDdypTmJ6
         f+/ykdzQ2/2avLJ3QE+qzbm1knGCPHoR9Z+ag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788248698; x=1788853498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pq8bO0PzDc2RkRwb4HUlSRQIgs6hFvJSxBcGCrIbpc8=;
        b=hF4wwc8t17upqD+yWWzfd9jrN8tFJC4vtl6K2yvLrQs7R3syM1mWFYhAhNe+wwc25e
         XvPiXoAUNjzf6xsjA8RqvM0Sib98h70kD2Z74Z2x6AcKZJ9x3luEbeVf3kWihVrIXyhv
         6pKKuGaBWmVuN7U9BLCiIeky2TUIwe3RdjXGVnga8YOwGVEi+dvSgoNu/L9+uOAUFjf2
         4M4E4x360MbpjOZOgoFvD8IT2/oAs39E8JBVtBbXR0O6qlRgvlFiDIpfiAX5RrXkeCub
         Gyyw7VCLEnvl6nDwCZwlPICTmCMZfS+xV8p0q4INYgPes9u2C6mZNaQwaIrCLXOEN3Z7
         a/pQ==
X-Gm-Message-State: AFuF++m4qLnRxa2Cn3r6y89KRM7ZVLnlyeIbgF+wKnAwN+Y+A5fEgEfp
	BwOadqtnMRG466ycUQRBlQFrHupo96yaiDKzZZaKeWEtGVxHVzDh26Zs3A/GblYZ+MIVL9h7Gig
	GEA1M
X-Gm-Gg: AYBFou1VXTc6UwLMBR1XkNldub6yCOUBFrQloaVH9xbH1EGRTDDt/8ZTnik38hGXEYy
	rXNEHW2dOTNe0XppYyaqooNbmfEToCXmTIGvjdzB4n2TttbM7nFzv479+VTzn7pr9OjTHPe1oNG
	AavUNEMwYJcHlZR1Nst0MbWqvF2tmTcQUE1ol5//jyGsVrrYTeIYBggRfY2zQklBq6QO3WJ7fjc
	pZH8jRGkvVPqFeSrG4Ul2Ng0mcto0ObBJlO8coiDtRJsOLPNx/S7tM7A9QkkcDSqePhs7ry7VFY
	yN3f9KjfeEucwTmn8bH2mcZozLBCF0oloGQJec+CgMPjdp3Swfr8b0fz/6DcenCmQ5oYAUFoOG2
	hCOxcpzjRnZ2ancsIhHDiujhUDVbOL6XydU4GaYhR49aKvto1OGpglDlpqc62za4KW6T1TryW3Q
	lbOVfzNTC5+QN+DNRASh8kL0CBTSlCatiAwUQyWXZ/vv3nDF9jB9bSy6JVwz6QHF1YtpCETFecr
	w==
X-Received: by 2002:a17:90b:538c:b0:398:d6e6:4671 with SMTP id 98e67ed59e1d1-398d6e68870mr23154859a91.25.1788248698009;
        Tue, 01 Sep 2026 00:44:58 -0700 (PDT)
Received: from MVIN00013.mvista.com ([103.250.136.191])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0de4de3sm47564414c88.12.2026.09.01.00.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:44:57 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH 1/3] vim: Fix for CVE-2026-73072
Date: Tue,  1 Sep 2026 13:14:42 +0530
Message-ID: <20260901074444.59811-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 07:45:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244802

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://github.com/vim/vim/commit/05c41c922309c7a11b6ec2f124be66551c90d66a
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-73072

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../vim/files/CVE-2026-73072.patch            | 64 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-73072.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-73072.patch b/meta/recipes-support/vim/files/CVE-2026-73072.patch
new file mode 100644
index 0000000000..0ae3b2b49e
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
index 577656c6c1..6097fb72a2 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -51,6 +51,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-59856.patch \
            file://CVE-2026-59857.patch \
            file://CVE-2026-59858.patch \
+           file://CVE-2026-73072.patch \
            "
 
 PV .= ".1683"
-- 
2.50.1


