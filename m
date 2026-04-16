Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01498F8DFEB
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:33:16 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28563.1776378787992115962
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 15:33:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=aIJfdGzh;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-488afb0427eso613555e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 15:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776378786; x=1776983586; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mXN7aEZFKmUORiNVJiXvWTSjjE98DeEPnv8xkjv6vSc=;
        b=aIJfdGzhIZ4lVndkkoJI4O1Gt7lsHnDP7DwsorPCNh0gEFWxPFv0p2BYLuwprxeStw
         bwgOAnUd/iJkeQboxFywzkfrK/iWBKP1Exg9nhhd70/KdzJD4fXd2EdpKiJyZ1Upbb/T
         i9Ruvp+X7+yH4hDKuoskpwjYvyLLO9o0czIFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776378786; x=1776983586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mXN7aEZFKmUORiNVJiXvWTSjjE98DeEPnv8xkjv6vSc=;
        b=ZyUhe71kznngH9wwGlcql/irqex2YryRlTNCuQzUSzMRyOLl8J34jxhkz0cQBZ2tPA
         mm2r8P+AHgcPM9R8q/csteSVtLWym8y8grlV95mKoy3HttTJ7YtaywcGN00kL4EoN0uT
         AUyJoPrjI62pHiU9Ad+B4mbhpiUkY0fuhAS3Rd+abOMOMZQ98TePJHqkNEoiKjQG0he/
         KaZ9OmkpG4aBaRx1sFfP9yhMHpwkJPzZ0Zd7PMr7eFX19QjLtun7Wk3btpUfmcUxljDr
         FyOtDpDoAQP8Wv/MJ9ADWepNQz6TuAAUj/0ZrRSUrHQSM6NM87O6fm3y/t24myI/Ykkk
         9e/g==
X-Gm-Message-State: AOJu0Yy4934gbN449PUW97VM1Bpj9i9id8ckXXiBjSVyi+aKp8KC67OJ
	9qtwdONKzVlGIx/Aj41OwD9dpLA1ZDqXw86kpN++NTBTdhH9EIT2uj534wQYWqj0tPOZoxjw2Fx
	fboVFKN0jmJFs
X-Gm-Gg: AeBDietuDTcyM0cPXibSRw/DAMwgiR7OX+LlyXd0kN1mnqR521q+Yc7zC5yfCEg0pl/
	j/L2ItqRMeNHobaU3sUc4vpowibmNK7MUSPdz6vOfRv+N/Frb/uGvDPdTfiWXd0xVkuU5jCAlDm
	TRFpt5mCPWoo+lWMFQCdmrw+ZIAbh0oDIO/gpKJkxDqT50cbZUHBzanymvnsELju2VPlnk8pgPj
	Sz0iXOss2Eq7cwtx1HeDVa45ECb/DlDLxDwKs0o1GrsFQTJBGXT4+M/t3rZZcJ3tbFNNz2iqdBd
	kHjf8DBRE8TZghin8G0Si260iuUnEhlEbuyigmeXMtHAA822asvs8yhJn17CT/9qjKnWxamimJG
	dlRhNFrjBcyK0T2Tk67vO7HQ2NkM6QoiHO69SIOm8YAkkzsKI6RBMOQlQkqztjuiT4ruia++lMB
	0q9at0HEejheTEhlxmZwTo1GubkayYgyz+0mcHdm2Z8A1m+bmHKkb4H0JGYz1ONaitcpGjk8Vj+
	Ci2ot5LNEl3jzhvONtR4tntd0v7YrYXE6RIPQ==
X-Received: by 2002:a05:600c:a416:b0:488:90ac:8f71 with SMTP id 5b1f17b1804b1-488fb73a9fcmr4034545e9.5.1776378786115;
        Thu, 16 Apr 2026 15:33:06 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57da2aesm141885005e9.0.2026.04.16.15.33.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 15:33:05 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 12/51] vim: Fix CVE-2026-28419
Date: Fri, 17 Apr 2026 00:29:55 +0200
Message-ID: <d4829660cfbd9c46c99142c935fd6ca26a3c13f9.1776377993.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776377993.git.yoann.congal@smile.fr>
References: <cover.1776377993.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 22:33:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235441

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
index 11200a08240..70d3dbf7d8c 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,6 +20,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-26269.patch \
            file://CVE-2026-33412.patch \
            file://CVE-2026-28418.patch \
+           file://CVE-2026-28419.patch \
            "
 
 PV .= ".1683"

