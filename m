Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 275C11073C9F
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 11:31:36 +0000 (UTC)
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.104297.1775647890896714647
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 04:31:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=keTDkNhR;
 spf=pass (domain: mvista.com, ip: 74.125.82.46, mailfrom: hprajapati@mvista.com)
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1271195d2a7so3099921c88.0
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 04:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1775647890; x=1776252690; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ETaYJ30k2D4A97F+CKEtSBN4VHbIIWhxAQLmTEkMQuE=;
        b=keTDkNhR9r85BRK2EbgUWxVSFK4h05AvfIy1tv5t6NLLD/3aLqdrA+CPu+x7vIA9nO
         RPp4rvctF4w8dh8cp0wZ++fW/YEfhXr27L4LpgOMS+Enj87L1c/EhDdWFpuu6twlNQPJ
         2jZuhEL8AdhXhFEpUipv7QAImfAn71ctfNQLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775647890; x=1776252690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ETaYJ30k2D4A97F+CKEtSBN4VHbIIWhxAQLmTEkMQuE=;
        b=N+64CYYIIC0lzFTI8rrwemeSzpwoK/8Oe17rreUrTaovD3pVq0t3OW4h364kc7mZZ6
         0kQ0LW5y6D8o/V7In3RnUm1BUTY0+iJGDJhPhJQr0HVLb9C3x/DrX1z55gZy5KbmgejF
         pzU4Arif1lNRKFihSMkphETVbCnY6jICu3MKeiDepsNTIMK3KXoWNdognLMbQ2GTnv8/
         +NK07IyJX6hSrZjrA0LKm5o9UEB9rGpuEa4hiM37iptAPQb2Rmu6mszrm3S81kdVmmKJ
         cbg6zGqqiWuaLohbCCKnyrxEbuObOjOjOfFiIva3dJ9l9hnsoa4DQuRhI/sCoyAbVU8Q
         HRLQ==
X-Gm-Message-State: AOJu0YzCz3MrBV4C2DcX56SyVp92sNL11CR4Yj4NYFrkuSWX4qj1rc4Y
	sMLUqyh/bw1s2nJMklW/mLYF2wk92BfAAMXuH9l5cMyTjADJVkigO6XfwU6gn7eVehq2XF4V0S5
	03R7KnsE=
X-Gm-Gg: AeBDiesrFf0ruAlNuroTtbZF/zYUkqYkuKmtTB9V8A+0P7OtjNUuDwgOSEEdie81FsW
	mWbU/7h9LQaGbrRt+qZwUe2ab5SFQnV/RzwW1QKNbKb1TQFOjJ/cRLnWxdqdQ3tWow5XEf5oET/
	l/S4J4Zmd1uurfr3Q04P8Ux/uI8jksg2Lc1rZJP+womNaLP07LiwWxaVkOWIktcv9HaMGCUii04
	O5kogZTzdkEmk2LMkjMI7fkJPJFcG3cyLTVbY2gBPEn+JK8SQV82kCNlsZtRsJVSQUolSZYQeTD
	X06MO3BOa/0lqdXXUaUZFOQgFEwEZbpcFrci43vnGzbgFMxW3uH+6O3Euz2SG4CmBt9lYL5PQdC
	3B7w/6dluiBLai4dqjko/tRoQSuKUFHytZCRNEATcZ//1ZlWraXiz7vDYN46Y2qkemW0efNJNdg
	HhGJ3/zQEVrX3BWGRbZXENSAS+tcVB39/HUV8=
X-Received: by 2002:a05:7022:e09:b0:12a:6902:ddc6 with SMTP id a92af1059eb24-12bfb63ac8cmr9983537c88.0.1775647887209;
        Wed, 08 Apr 2026 04:31:27 -0700 (PDT)
Received: from MVIN00013.mvista.com ([43.249.234.209])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2cb7ec57f9dsm18120829eec.11.2026.04.08.04.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 04:31:26 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] vim: Fix CVE-2026-28418
Date: Wed,  8 Apr 2026 17:01:19 +0530
Message-ID: <20260408113119.1030462-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 11:31:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234833

Pick patch from [1] also mentioned in [2]

[1] https://github.com/vim/vim/commit/f6a7f469a9c0d09e84cd6cb46c3a9e76f684da2d
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-28418

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../vim/files/CVE-2026-28418.patch            | 78 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-28418.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-28418.patch b/meta/recipes-support/vim/files/CVE-2026-28418.patch
new file mode 100644
index 0000000000..3a80ba77f7
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-28418.patch
@@ -0,0 +1,78 @@
+From f6a7f469a9c0d09e84cd6cb46c3a9e76f684da2d Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Mon, 23 Feb 2026 18:30:11 +0000
+Subject: [PATCH] patch 9.2.0074: [security]: Crash with overlong emacs tag
+ file
+
+Problem:  Crash with overlong emacs tag file, because of an OOB buffer
+          read (ehdgks0627, un3xploitable)
+Solution: Check for end of buffer and return early.
+
+Github Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-h4mf-vg97-hj8j
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+CVE: CVE-2026-28418
+Upstream-Status: Backport [https://github.com/vim/vim/commit/f6a7f469a9c0d09e84cd6cb46c3a9e76f684da2d]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/tag.c                    |  3 +++
+ src/testdir/test_taglist.vim | 15 +++++++++++++++
+ src/version.c                |  2 ++
+ 3 files changed, 20 insertions(+)
+
+diff --git a/src/tag.c b/src/tag.c
+index a32bbb2459..45af67f20d 100644
+--- a/src/tag.c
++++ b/src/tag.c
+@@ -1902,6 +1902,9 @@ emacs_tags_new_filename(findtags_state_T *st)
+ 
+     for (p = st->ebuf; *p && *p != ','; p++)
+ 	;
++    // invalid
++    if (*p == NUL)
++	return;
+     *p = NUL;
+ 
+     // check for an included tags file.
+diff --git a/src/testdir/test_taglist.vim b/src/testdir/test_taglist.vim
+index 5a946042be..506e64f7ae 100644
+--- a/src/testdir/test_taglist.vim
++++ b/src/testdir/test_taglist.vim
+@@ -301,4 +301,19 @@ func Test_tag_complete_with_overlong_line()
+   set tags&
+ endfunc
+ 
++" This used to crash Vim
++func Test_evil_emacs_tagfile()
++  CheckFeature emacs_tags
++  let longline = repeat('a', 515)
++  call writefile([
++	\ "\x0c",
++	\ longline
++	\ ], 'Xtags', 'D')
++  set tags=Xtags
++
++  call assert_fails(':tag a', 'E426:')
++
++  set tags&
++endfunc
++
+ " vim: shiftwidth=2 sts=2 expandtab
+diff --git a/src/version.c b/src/version.c
+index 712a3e637c..7d265ab641 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -724,6 +724,8 @@ static char *(features[]) =
+ 
+ static int included_patches[] =
+ {   /* Add new patch number below this line */
++/**/
++    1685,
+ /**/
+     1684,
+ /**/
+-- 
+2.50.1
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 2f222c5295..713e277936 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,6 +19,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-33412.patch \
            file://CVE-2026-25749.patch \
            file://CVE-2026-26269.patch \
+           file://CVE-2026-28418.patch \
            "
 
 PV .= ".1683"
-- 
2.50.1


