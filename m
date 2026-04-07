Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EA22FB519E
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 06:43:36 +0000 (UTC)
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.75241.1775544213231825828
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2026 23:43:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=aCzWNXm4;
 spf=pass (domain: mvista.com, ip: 74.125.82.169, mailfrom: hprajapati@mvista.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2bdd40d3c61so4056027eec.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 23:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1775544212; x=1776149012; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qwnhuyHzEZCf59ulpqyBCxFaTUWUj4pmBMHcwbav7yk=;
        b=aCzWNXm4ZGMXi1sUKrSRTdp8TADMKwqd5ODA/uyqLbjcdhfLfuxmgLvoxOuMs9TWBa
         SYJHwetUA7VcP8XD1loLbqQQGPYJaFyv+M2Pm952GJy2SxAuPstD/VTd4S317qpwYvv2
         0S2jVhnalhA3HcMuW4AaCFs8UHZ/FK7E7yi7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775544212; x=1776149012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qwnhuyHzEZCf59ulpqyBCxFaTUWUj4pmBMHcwbav7yk=;
        b=bhCji9+20E9InDdf8eMpnVhEOJq8awKcajbNqIOV/jG1FgmeGnrpBKey9eNBbyyLMs
         DVD+xJvAgEBPKH4QtEt4JOjj9F2CyxdFeoSkuBs/adoLBqEsllB2pV282jR5EBGm1Q5l
         x75rVJuLNMkwVqVswQlR9vmniVBnBlJfiPPVvMPCwoRDhM/uG+A4FoIS4IKUDrGgH0+A
         jKiSNu4ero4/gIxM1vye8rSEx7xIDeS2hUCl3DmK1B8K4ZWCL1+d1t1BAXyM9fVEZO7T
         nimG7reDuYCUe7orEa+yo3IKKzFHOY2fr/oz86PM5pFwWPqvhJXI+S0i0Y2XZupu6hud
         lo9A==
X-Gm-Message-State: AOJu0YxryofkR8GWclVGyK4f5JZRusl5pLElAcie+94Ec+mb5/pSAK3m
	ue+qkE3KXKLfudRKTJF1ydQNkIwhFZrFuldloXM6qSx2LpzKtobaeG//C4NWWzMbPsy87IpvtrU
	haslO
X-Gm-Gg: AeBDieu7eSMZ+hSUCNCMnmYinNraSbAIqJo4cFI4fZp8T7LoBzjhazPg9UA/vg82zhC
	yjfGz2m2NdIXspHPSxUu3OzR44yEKR+6kDn+77HA9fjZ1ItQZbDNW1Weo5ZhJPN8fnf1Gu4kdGo
	3pL5AgtlQacNh1ast1I0/0FdAl8QfX6TQbs+Ar8ygDN3fgMBOZe4MS7ul0olLlNPTIz5x3bcr5U
	o9kcIfbnqTWKOD0059jZbukjCkwyDPeNgkE2wf/LDWxaJfbLTwdBFAS40uvAhMWqPHvCnPu05EJ
	Gjxq7hk/1x3f80XuW+VQ53lFoneEdgie38n6kyugWxL9tvdFe+/nzCDqYUtkQiR7PoCpFdsLdxH
	ln1k5LaOwfklMstfMVbi1mPJsJEvNebtLYBsB7LC7XCs0VYI/Kgabf0y9AqhFh9BBMLlDaCOJYW
	SoS72hnB1TcLQbqm3PGzl28uhRoSUU3wVN2PFk
X-Received: by 2002:a05:7300:fd05:b0:2c8:aef9:cf31 with SMTP id 5a478bee46e88-2cbfc764b1dmr8329135eec.23.1775544212426;
        Mon, 06 Apr 2026 23:43:32 -0700 (PDT)
Received: from MVIN00013.mvista.com ([103.250.136.160])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d1bf4447dasm1130347eec.21.2026.04.06.23.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 23:43:32 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] vim: Fix CVE-2026-25749
Date: Tue,  7 Apr 2026 12:13:15 +0530
Message-ID: <20260407064315.37697-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 06:43:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234698

Pick patch from [1] also mentioned in [2]

[1] https://github.com/vim/vim/commit/0714b15940b245108e6e9d7aa2260dd849a26fa9
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-25749

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../vim/files/CVE-2026-25749.patch            | 64 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-25749.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-25749.patch b/meta/recipes-support/vim/files/CVE-2026-25749.patch
new file mode 100644
index 0000000000..8b04379b9b
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-25749.patch
@@ -0,0 +1,64 @@
+From e0065a61a42bdff9c75aa18104f8ff546938395f Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Thu, 5 Feb 2026 18:51:54 +0000
+Subject: [PATCH] patch 9.1.2132: [security]: buffer-overflow in 'helpfile'
+ option handling
+
+Problem:  [security]: buffer-overflow in 'helpfile' option handling by
+          using strcpy without bound checks (Rahul Hoysala)
+Solution: Limit strncpy to the length of the buffer (MAXPATHL)
+
+Github Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-5w93-4g67-mm43
+
+CVE: CVE-2026-25749
+Upstream-Status: Backport [https://github.com/vim/vim/commit/0714b15940b245108e6e9d7aa2260dd849a26fa9]
+
+Backport Changes:
+- Excluded changes to src/version.c and runtime/doc/version9.txt
+  from this backport. This file only tracks upstream version increments.
+  We are applying a security fix, not a version upgrade. These changes
+  were skipped to maintain current package versioning and avoid merge conflicts.
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+(cherry picked from commit 0714b15940b245108e6e9d7aa2260dd849a26fa9)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ src/tag.c                 | 2 +-
+ src/testdir/test_help.vim | 9 +++++++++
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/src/tag.c b/src/tag.c
+index 6912e8743..a32bbb245 100644
+--- a/src/tag.c
++++ b/src/tag.c
+@@ -3348,7 +3348,7 @@ get_tagfname(
+ 	    if (tnp->tn_hf_idx > tag_fnames.ga_len || *p_hf == NUL)
+ 		return FAIL;
+ 	    ++tnp->tn_hf_idx;
+-	    STRCPY(buf, p_hf);
++	    vim_strncpy(buf, p_hf, MAXPATHL - 1);
+ 	    STRCPY(gettail(buf), "tags");
+ #ifdef BACKSLASH_IN_FILENAME
+ 	    slash_adjust(buf);
+diff --git a/src/testdir/test_help.vim b/src/testdir/test_help.vim
+index dac153d86..f9e4686bb 100644
+--- a/src/testdir/test_help.vim
++++ b/src/testdir/test_help.vim
+@@ -222,4 +222,13 @@ func Test_helptag_navigation()
+ endfunc
+ 
+ 
++" This caused a buffer overflow
++func Test_helpfile_overflow()
++  let _helpfile = &helpfile
++  let &helpfile = repeat('A', 5000)
++  help
++  helpclose
++  let &helpfile = _helpfile
++endfunc
++
+ " vim: shiftwidth=2 sts=2 expandtab
+-- 
+2.43.7
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index fc9b4db055..fa63689ef1 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -17,6 +17,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://0001-src-Makefile-improve-reproducibility.patch \
            file://no-path-adjust.patch \
            file://CVE-2026-33412.patch \
+           file://CVE-2026-25749.patch \
            "
 
 PV .= ".1683"
-- 
2.50.1


