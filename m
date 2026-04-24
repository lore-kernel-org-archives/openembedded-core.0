Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90E53FF8842
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:56:51 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32581.1777064210922121993
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:56:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=m00UuFEC;
 spf=pass (domain: smile.fr, ip: 209.85.128.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso53508195e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064209; x=1777669009; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tJGaAq0rTcZqLgoZS+Ul7DUemylemdKvrIv1X9zr90A=;
        b=m00UuFECHUS4d56A4GDW9oWhOzs327jiKXexyCvTnj/VVaplxm1DQcSZffJyvMLRGa
         BWkhlFI77ZWdc2cZvmJ6DLn4T3ggXoaWt8lrhKvldP/JpO46G8anKEn0AXuUveEQnb9a
         V/TNogr1dxbsPGhmHKksbMLsOKxxssN+qDf0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064209; x=1777669009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tJGaAq0rTcZqLgoZS+Ul7DUemylemdKvrIv1X9zr90A=;
        b=rGPGifau2V1vOPWSRPngG2ZirF0gG+wL7RKJ9/CW8DH5MtmiEzs9+sjiXT4XYIkkIN
         FmSjvva6PvbKBac5ZCCpbeA+jUW20POe0+9mNMi8RdT9TOoqfSY6swe/Sh68zIPz/IHM
         Ib3j32LpDd811ig7QczORjawRprEBW1MhXhtl8ROZOxI9iPcIXQ7KYmen1q69nxghLaj
         SDYnHXNcAFbWw/9dK8dUsmGzLJU2MUmI7FUnWeNa6r8I/p4F9omhwovzTZdzeMw4jaSt
         urlHxIS6j5HkRZh7WmBAD8JEW4lYvDnPRw+PrcmvWk54FAZGfK6upFGw2COuoAfg7KSo
         ATyg==
X-Gm-Message-State: AOJu0YzFilYtE1Cjown+7TQ5NkiYkbl6pQyQjHma6Yf943cnYbAHeaMy
	1fSMj3ZvGzb2s3jwGm3Zx/YBewcOXdZVmF3lMULc7XAy6mrYBmL/qxBhcpFUhB8Ux24ZndtF0+C
	R+w+NCvYDCYOt
X-Gm-Gg: AeBDiesFpeDNf2Sj47ikVvfh96w1CnuWGezYzv7hufcKj9EzV5JjRjgAEOeR5Lqh9Is
	d5wWuVag+Rw2aO4LnlIR0KIxVEOkxLDDpHy50VMxE8l2XvO7YdWUn8k+YJKJRVdft/m+VvSraVO
	9MAvMZu4Rb370vHdeh/CFtJSSkyKF6qdzevlkogEHLlh8Dm/XcEIw2bjmuOigvqOgzfMxQRAfSG
	nYDtZ1l0wpz5nUUOyILr5PVUJ4iUvk/SpsGkq7bos5HffchXceQcg87BGdDlEvuJjbFhh65dF0H
	z1XVljr5tnlE5zNGRNfzXsN+KUTVV8gsc/5VZbVxVsYeSHdXKtmB075Aq2HipPL8QCFyeL9MqHR
	aZsgf+UAhJGxzZ7+FdBa5OgujRnvmaX2sDm5ClEqN9GfV7Qnb/oijVJf3qSson9CYglnCY/AIvN
	lBSzrKTMBb8/FRdcm3W513NVfOlQ+1ndBQIVp+Q/x+SXg8YE7EeswHpKsWxgefx5SQMYzmNByib
	qbxr4TG412W/OmL6CZIKVDorgPrKh5KTe+37w==
X-Received: by 2002:a05:600c:8b8c:b0:489:1d74:56d with SMTP id 5b1f17b1804b1-4891d7406famr363457155e9.29.1777064209086;
        Fri, 24 Apr 2026 13:56:49 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.56.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:56:48 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 20/66] vim: Fix CVE-2026-28419
Date: Fri, 24 Apr 2026 22:55:19 +0200
Message-ID: <5e05e5e86d4ac5cc8a8d39ceb4f784feb9b0d327.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:56:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235893

From: Hitendra Prajapati <hprajapati@mvista.com>

Pick patch from [1] also mentioned in [2]

[1] https://github.com/vim/vim/commit/9b7dfa2948c9e1e5e32a5812812d580c7879f4a0
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-28419

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-28419.patch            | 86 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 87 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-28419.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-28419.patch b/meta/recipes-support/vim/files/CVE-2026-28419.patch
new file mode 100644
index 00000000000..91100a7e91e
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-28419.patch
@@ -0,0 +1,86 @@
+From 9b7dfa2948c9e1e5e32a5812812d580c7879f4a0 Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Mon, 23 Feb 2026 19:35:25 +0000
+Subject: [PATCH] patch 9.2.0075: [security]: Buffer underflow with emacs tag
+ file
+
+Problem:  When parsing a malformed Emacs-style tags file, a 1-byte
+          heap-buffer-underflow read occurs if the 0x7f delimiter
+          appears at the very beginning of a line. This happens
+          because the code attempts to scan backward for a tag
+          name from the delimiter without checking if space exists.
+          (ehdgks0627, un3xploitable)
+Solution: Add a check to ensure the delimiter (p_7f) is not at the
+          start of the buffer (lbuf) before attempting to isolate
+          the tag name.
+
+GitHub Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-xcc8-r6c5-hvwv
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+
+CVE: CVE-2026-28419
+Upstream-Status: Backport [https://github.com/vim/vim/commit/9b7dfa2948c9e1e5e32a5812812d580c7879f4a0]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/tag.c                    |  3 +++
+ src/testdir/test_taglist.vim | 16 ++++++++++++++++
+ src/version.c                |  2 ++
+ 3 files changed, 21 insertions(+)
+
+diff --git a/src/tag.c b/src/tag.c
+index 45af67f20d..d3a73997bb 100644
+--- a/src/tag.c
++++ b/src/tag.c
+@@ -2023,6 +2023,9 @@ etag_fail:
+     }
+     else			    // second format: isolate tagname
+     {
++	if (p_7f == lbuf)
++	    goto etag_fail;
++
+ 	// find end of tagname
+ 	for (p = p_7f - 1; !vim_iswordc(*p); --p)
+ 	    if (p == lbuf)
+diff --git a/src/testdir/test_taglist.vim b/src/testdir/test_taglist.vim
+index 506e64f7ae..42ecc4b76e 100644
+--- a/src/testdir/test_taglist.vim
++++ b/src/testdir/test_taglist.vim
+@@ -316,4 +316,20 @@ func Test_evil_emacs_tagfile()
+   set tags&
+ endfunc
+ 
++" This used to crash Vim due to a heap-buffer-underflow
++func Test_emacs_tagfile_underflow()
++  CheckFeature emacs_tags
++  " The sequence from the crash artifact:
++  let lines = [
++    \ "\x0c\xff\xffT\x19\x8a",
++    \ "\x19\x19\x0dtags\x19\x19\x19\x00\xff\xff\xff",
++    \ "\x7f3\x0c"
++    \ ]
++  call writefile(lines, 'Xtags', 'D')
++  set tags=Xtags
++  call assert_fails(':tag a', 'E431:')
++
++  set tags&
++endfunc
++
+ " vim: shiftwidth=2 sts=2 expandtab
+diff --git a/src/version.c b/src/version.c
+index 7d265ab641..4f47ec2688 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -724,6 +724,8 @@ static char *(features[]) =
+ 
+ static int included_patches[] =
+ {   /* Add new patch number below this line */
++/**/
++    1686,
+ /**/
+     1685,
+ /**/
+-- 
+2.50.1
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 37534c696b1..9456cf3e13c 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,6 +20,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-26269.patch \
            file://CVE-2026-33412.patch \
            file://CVE-2026-28418.patch \
+           file://CVE-2026-28419.patch \
            "
 
 PV .= ".1683"

