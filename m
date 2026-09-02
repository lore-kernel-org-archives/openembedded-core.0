Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5428C61DFD
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 05:27:18 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5678.1788326829148628669
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 22:27:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=nDDY968l;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49b8687630fso4317405e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 22:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788326824; x=1788931624; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sGrz6NYiJrzUJjb5sq6H3Vqb72HZT/DyugxJyfQTcEk=;
        b=nDDY968lKMXX1hkzkdgENV8pH9owAxL6JTgTupKilkknfDAMOT85V164Hy82XHZWFV
         kj49VqbbdMoVNbfs/XsIJR7c2/RY2OxKfm8xMj5Ex0oVl6hdPHUio3wJIVsgWO997Van
         Ak2SsEvW5f0eJanlqKzkMzD2HCT8cWLypOBAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788326824; x=1788931624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sGrz6NYiJrzUJjb5sq6H3Vqb72HZT/DyugxJyfQTcEk=;
        b=VpqL9oo5PSp3AVKbKc23MZ+g6SClWLcNpzIk2SEu+PD9JMIMfHrsQv63kcFqwu0Lv6
         7BRIBcFv6jOSaLlRuUDy2XAUnOQtjrwP0oc7moW/39fANskTJWykv39ZexB6zE6oPtW/
         agkdCft+hQCp2HHYpAZNC9Cl+11j1cU3qxxsgyX8HD9VZlHqUpx0eK3A1WYL/d7PQ9A4
         941ggyq0+GspEAgCJvC8YpvBFR1t2rRxNaNCdhbW1z1A+xBfnvMnnI+4C4FGS9xJCn0q
         dJDZFacgvzbf+sT0g7q6wDc96Paqb2evybDGPEmvmrVoLrnehb94OxwciuKWNM69Cf+D
         hNag==
X-Gm-Message-State: AFuF++ni1ORihegz9sM/Ei/XwphHzklM0Fxp5Iq9Kvl74KXwj3j3k6hM
	ckZWviDpgYFhkkNrpKquoAscXrg31VB7VgTEYAL/eqwax/7LeKewgJVEY5odiEnZnOxXNcKrxBE
	02e/z5Gg=
X-Gm-Gg: AR+sD12nKvnYKhmvRZLpYiPLrHI33AR8DIETP18TQZNLxmvZAJDmnB2AzaXgZCP+W3W
	DBDRpoRuH3dOIGcAUsKwX1Kn8ywZJQmYIiU1dMbjm1LpXjqKkvuWeM36h4lz4tGHI0EZmLf6G81
	OFqCe0MH2TycFlfVRfUsb4xTDmSGDf8mUasSj9e8QUyBFfdLa9BvW2nKVu8XUfStsHUpEv0Kghz
	BJv8qVwnz2Kw+iZV19EYDe1ZKmUBRnjniwAC100DN06uJ/ioEks2WQrHlxkIEdPtk/6lYdZF1Xh
	aNg11hswh7J6StLO2VgpsVguCnGGvHuVBox6QREJbW3/MGIqA+vRhnYD8mfY7/cNqjT1cJLq2XM
	Lx8kj98CowtgQv0KwaVFvPKTmGHiNSPCMnHf8gfr8s1OSTLksj51kwB/K5AHk2OltNK8M1jm1Gy
	EXH29mtZ1M9RoDYiGGmhWcf8RxtTgfRgcLNKsqryF3D8IoSaKhPVimAz2aqxJtkIi5vbyYd448Q
	VHaGz/f9b80yEktsQ==
X-Received: by 2002:a05:600c:3b07:b0:496:bffb:fb7b with SMTP id 5b1f17b1804b1-49ce5823706mr32063605e9.10.1788326823963;
        Tue, 01 Sep 2026 22:27:03 -0700 (PDT)
Received: from FRSMI25-LASER.wifi-gare.sncf.com ([148.169.40.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4780f0dsm37084695e9.12.2026.09.01.22.27.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 22:27:03 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 19/27] vim: Security Fix for CVE-2026-55895
Date: Wed,  2 Sep 2026 07:25:36 +0200
Message-ID: <87b2def5858ea51650b1e0381ed104d5670c50b1.1788326578.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788326578.git.yoann.congal@smile.fr>
References: <cover.1788326578.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 05:27:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244873

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

References:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-55895
[2] https://security-tracker.debian.org/tracker/CVE-2026-55895

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-55895.patch            | 53 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-55895.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-55895.patch b/meta/recipes-support/vim/files/CVE-2026-55895.patch
new file mode 100644
index 00000000000..0084006b72d
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-55895.patch
@@ -0,0 +1,53 @@
+From 0d286458d71ff7b4d759621dd9a567aa9354819a Mon Sep 17 00:00:00 2001
+From: Yasuhiro Matsumoto <mattn.jp@gmail.com>
+Date: Tue, 16 Jun 2026 21:00:28 +0000
+Subject: [PATCH 11/17] patch 9.2.0663: [security]: runtime(netrw): code
+ injection in local file deletion
+
+Problem:  [security]: s:NetrwLocalRmFile() escapes only the backslash in
+          the file name before passing it to :execute, so a name
+          containing "|" injects arbitrary Ex commands when the file is
+          deleted (cipher-creator)
+Solution: Use fnameescape() to correctly escape the file name
+          (Yasuhiro Matsumoto).
+
+Github Security Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-vhh8-v6wx-hjjh
+
+Supported by AI
+
+Signed-off-by: Yasuhiro Matsumoto <mattn.jp@gmail.com>
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/55bc757a5d436e59d50fe43f7cda94b118f86cb2]
+CVE: CVE-2026-55895
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ runtime/pack/dist/opt/netrw/autoload/netrw.vim | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/runtime/pack/dist/opt/netrw/autoload/netrw.vim b/runtime/pack/dist/opt/netrw/autoload/netrw.vim
+index 9014ca339b..af43f469d1 100644
+--- a/runtime/pack/dist/opt/netrw/autoload/netrw.vim
++++ b/runtime/pack/dist/opt/netrw/autoload/netrw.vim
+@@ -3025,7 +3025,7 @@ function s:NetrwBrowse(islocal,dirname)
+     elseif !a:islocal && dirname !~ '[\/]$' && dirname !~ '^"'
+         " s:NetrwBrowse :  remote regular file handler {{{3
+         if bufname(dirname) != ""
+-            exe "NetrwKeepj b ".bufname(dirname)
++            exe "NetrwKeepj b ".fnameescape(bufname(dirname))
+         else
+             " attempt transfer of remote regular file
+ 
+@@ -8737,7 +8737,7 @@ function s:NetrwLocalRmFile(path, fname, all)
+             call netrw#msg#Notify('ERROR', printf("unable to delete <%s>!", rmfile))
+         else
+             " Remove file only if there are no pending changes
+-            execute printf('silent! bwipeout %s', rmfile)
++            execute printf('silent! bwipeout %s', fnameescape(rmfile))
+         endif
+ 
+     elseif dir && (all || empty(ok))
+-- 
+2.44.4
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 07f7b7dd16c..bd1d52eaf67 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -43,6 +43,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-47167.patch \
            file://CVE-2026-55693.patch \
            file://CVE-2026-55892.patch \
+           file://CVE-2026-55895.patch \
            "
 
 PV .= ".1683"

