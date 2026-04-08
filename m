Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 289621073C9B
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 11:27:16 +0000 (UTC)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.104248.1775647633482124141
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 04:27:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Xx0rqGwu;
 spf=pass (domain: mvista.com, ip: 74.125.82.174, mailfrom: hprajapati@mvista.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2b6b0500e06so8570431eec.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 04:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1775647633; x=1776252433; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qwnhuyHzEZCf59ulpqyBCxFaTUWUj4pmBMHcwbav7yk=;
        b=Xx0rqGwuYuI3dxc/wuzRq9IgN2KCi2UR44M4E3eAwRZWcVhHYnWwZbjZcDPzMMIDLE
         fNQ90ztXL7Nx6MyDIaDWJEQryhVFsmcVfVYPhzsWayCJkO1TjXjHnklFHcuRFAEZNP6W
         F+y2SBazm8HOvtKP9JpfdQdCtX+3AR+e2eCEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775647633; x=1776252433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qwnhuyHzEZCf59ulpqyBCxFaTUWUj4pmBMHcwbav7yk=;
        b=qvncIxj62eJGNHuSV9H8JPVpc+6BP6yt0YeU3r9TioVBcXCtEsttf/uFOvCUCAuzPc
         BJMaRI1MvxkeQf+9ep41cFI7kmx3/lguQAhmQcBg0qJ+RHYOhylDWVHAlQOIipB2xZ0S
         aPh+ASN6fekbPF1YzS7qr2ILnMvjdFq1TUg6lWxDImmAo9eLj8EBUrsq2yMjatZqrJiC
         k2nVU634Zy24hGP+10cxnP81N9pvR2WeQ7jH3e/n8sAkr8A23YbqPU0aDeGpc5Lqk14a
         uKKfmSRcGnvdm5rTqmPyB92zYoJy/CPYWbwMi8u8EHCqUgwg7QNs5BJzcn8kc6FDwuVx
         uYtQ==
X-Gm-Message-State: AOJu0YwLOgIiCv47eLGNyOAgTNxRg64crrftoHJMqHv/AxR51od/enRS
	CICQ8u0uU/SOZktk/pI2xO28RfOK68XBwn3YieNNuFTc0nNCx+iXqHuDA8rLiD0Zj+mw67RWGlG
	eWLEN6gE=
X-Gm-Gg: AeBDietuDYN/pKmRMHx30EPrdWNUPv3WHoULPzpUWG/39ZOEZzmZdCSJAJ7XknBCFTL
	dCOcV/dcgFngr8dIvEyzZcN0cj4hsvN1/qF+q1YiOasfZTEzzHd8CWLd6OI+onQiBXodj/mfMLD
	M8yDDRBPQCnunOoe7pTMgzCYbkjdMdatUuX6oUQfOg43vXOzPd6K5ibyWThLD5i83g2/UiFYhD8
	nFfSTMp2+EUgzgTsAMiye2//mXD+8wtcW254CMJSXE8LrtIu3D9c9g6cMzzjpfs8JhEveK01quZ
	+a0hew71M+IQjR1yqM2eWaKlIZ4g1gFw3iJKqlAUbVCBbbktM2cl59wByM5WqHuc1BYm5lvMdJl
	iFI6VNJU8Y3A64FmfN8+UD8+/t+ucmWrBpSL994AUtXCRFXOpWRlEQT3+nKzhlqoJLnSH8/vE/C
	8gmsrpurzB9SupfGjdJD3VNsPahR/UT3xK3Dc=
X-Received: by 2002:a05:693c:40c2:b0:2ce:3aa1:d3b4 with SMTP id 5a478bee46e88-2ce3aa1db1bmr5606770eec.21.1775647632669;
        Wed, 08 Apr 2026 04:27:12 -0700 (PDT)
Received: from MVIN00013.mvista.com ([43.249.234.209])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2cae7e3ec57sm23092896eec.1.2026.04.08.04.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 04:27:12 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] vim: Fix CVE-2026-25749
Date: Wed,  8 Apr 2026 16:56:54 +0530
Message-ID: <20260408112654.1029664-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 11:27:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234830

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


