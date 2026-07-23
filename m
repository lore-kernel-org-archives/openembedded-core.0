Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F052C531CF
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 09:26:27 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19552.1784798785064960883
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 02:26:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=dFebYDLt;
 spf=pass (domain: mvista.com, ip: 209.85.210.170, mailfrom: sdoshi@mvista.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84867f07d63so453989b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 02:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1784798784; x=1785403584; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=udBSS33EhUme1QDtTVbdyK+de985OCvLbCuBUuaI00s=;
        b=dFebYDLtUBFGU2Jqigb+FBS/bQuu8IsgPgXA7H5HXjk9oKo7PE623q5oe1izJhmgx/
         5683X99qMn1J9E/6eb8d5fqORuszw13l79mScpdPKuxhmhGw3Em2v26tORQ5/vQl8ERD
         kSxpbmYBjDr8gkQJFmaHKX14I0sJBvpjcwGHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784798784; x=1785403584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=udBSS33EhUme1QDtTVbdyK+de985OCvLbCuBUuaI00s=;
        b=iiaqOujf0Hq0Kpig/lJFqZKaVEx9uXQusBMhK4B1MGyeoiLvR5CpBCu4pLJPadvIkM
         qynRCxYd1TGWv3khpdvVkVuQ5pVoGYRp4L8IWmhUVOa/vxCVV/K50HxK9IisF5VMsHU5
         FFdW72UaHt7e+wVVWeJDPsXfcFpWrSkXMmhC64WqkQNMrnkrpu2/l6gwYrmE0KeFvNHg
         aJCmkwkoX3TlQWh+Ud3AYlg3RDIi7R3V3fDdADLAiWkPxtuUgNWczAgc9P8x17YivOlt
         TYqFUYk9M63cRRol/1FUQT67v9wIDNqhFdqkelT++ZTP/6/j3GhHZ4PWGwvRT411vc34
         KRRA==
X-Gm-Message-State: AOJu0YwRPAndY37NUdWLbFuPAYa/q/cDjimx2AGC7beUdQSoTArc6BQk
	aDHF/VmTCRM0zqORmsGKJhBAZhQ/Tj9UBm2gmMQt4rSYPneqt6K7b7P7D8Dsyk8vehwyF5CZgEv
	tlBX2rfA=
X-Gm-Gg: AR+sD125Bv4opE9pV3YvfkI3cUvZnxKtRk0ogbSyH1vt8K+ayVJCyfiEkwX9Jv08MFy
	yg9qerS5lc3g/ojg8MN9rY8tEQRXRSWv2zhNp2W2l6Kkhe5U5TZP5JWCvvCpoY+UymE6tTN/P5c
	kdDsyT1aqUa2+jdGK0NdEiv8xAwSXb6L1VLdncDSaWEhr3Hhs3DczwDUtaKaMnaCKShWDbNO+G7
	Nhk3RJ3Uyhpr1nzapQ5H/KwCJI8DxJrylHQEg/IJNZIf/kGQvELKtUd/rmyXFFdxhTNMvOTmh4T
	C1p/mAELKbJ9lPoWG8ssPoWaF+dlMvMM1cgh6/uHQlL+CwPf0N02hzx3k+5z+cmdRsm8Yg3BIvp
	ylYSF0vSZNufXyw6iJx9XY5oq8JS2eEM9CbaATwiqppyN55b8EvXT3w0iC8HR3flT4VmvLAu0YI
	wtKUVwcrL0d/8=
X-Received: by 2002:a05:6a21:50a:b0:3bf:a681:a262 with SMTP id adf61e73a8af0-3c44b18c987mr2441967637.38.1784798784418;
        Thu, 23 Jul 2026 02:26:24 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.44.18])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1c7ff4sm19333788eec.27.2026.07.23.02.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:26:23 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][scarthgap][PATCHv2 08/13] vim: Security Fix for CVE-2026-55895
Date: Thu, 23 Jul 2026 14:53:49 +0530
Message-Id: <20260723092354.54697-8-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723092354.54697-1-sdoshi@mvista.com>
References: <20260723092354.54697-1-sdoshi@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 09:26:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241812

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

References:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-55895
[2] https://security-tracker.debian.org/tracker/CVE-2026-55895

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../vim/files/CVE-2026-55895.patch            | 53 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-55895.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-55895.patch b/meta/recipes-support/vim/files/CVE-2026-55895.patch
new file mode 100644
index 0000000000..0084006b72
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
index 07f7b7dd16..bd1d52eaf6 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -43,6 +43,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-47167.patch \
            file://CVE-2026-55693.patch \
            file://CVE-2026-55892.patch \
+           file://CVE-2026-55895.patch \
            "
 
 PV .= ".1683"
-- 
2.34.1


