Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9D7610A1E9B
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 15:03:03 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50523.1774537380093017929
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 08:03:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bEPWqIKH;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43b87970468so1076708f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 08:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774537378; x=1775142178; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nS5Jp2TMkeD0B5BtQqBCjjDMBiLfnRWqu0BlOfA2Umg=;
        b=bEPWqIKHGPtmluSO4qMkRTfCUPnrJd250FN6tYiEchj2HbUep5o7M9fa73kewK6sAb
         oWFykCqgaBTaYaIxP2v0eWJpZTgKcevLGOdC+LI2/lDq3HVv7faGw+JxMTof1s0Vf9+9
         /JI5RrM/Tna92ykmH1tETOEaiJSd6doVPrAoTtMf5WMabtHJMbd2w6AWDKelqxuJo3cr
         kHqLSSVAnhUrEw4I7sHoxDbAnikfOS5hDJAoBtjrEUSD42higkHKP770QFvZdr7fTlZE
         nY+CB7mvQn2z2jXWBLE8mX85ARqNppIwSTK+ZsG/UhvpJHWED2iAP09rEGp4dO9cFGtJ
         7hxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774537378; x=1775142178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nS5Jp2TMkeD0B5BtQqBCjjDMBiLfnRWqu0BlOfA2Umg=;
        b=s0kwXWyBCl4oDc1nqtZfJ033PeWAD0Sbc5s4AaA2H2n2fj4xUoW9FnupUa0zcrci0d
         TDQ1gezF/6hqS8ZUofJBLLujoUGC7nc3GVVGueQDJSggztZdV3rozFiZfGXOYLg8v8DG
         Z/qeftFJ6iQzmJokyhADDOaXuh304mN8U3/UkAcQEEZ86W6BMSmf5NaW61woVElYqsJ/
         /1so0qYGPpYFw3Re3e7xBjKtJ1ytHQ3u8qpMGuDXuuu2WyzkWW5VtAPUxsiqOemFfJqY
         orpfsXTADbldMhXK6aNrfMCqs+fwL3KoSqTOrJ8nT100YF5bcjDWRfhp3PlWCgdQ7+Cy
         2kqA==
X-Gm-Message-State: AOJu0YxImJ4dtEHv3BnWp7kVRsG7vSZns9CWOr8Nx+Hiu2CipF5Ipd/q
	KVn6Gl4nIyTnQcnh/j6yNcDDokTVadpaIKK/ZtgXVBc/N4bU0X5nt4FoPZfv/g==
X-Gm-Gg: ATEYQzxQAnZnS8x6/FSZUn5XNBgLgKd2rkE6lWRF9jHu+v/Wg9uehx4mp6bptNXl9EF
	c/XnftjhwqyRZY0b2Nufltf+75nBmeGPxFYKrr5fYrf2FVktxSB9MIOWTg8JjxfAr23ptrSBD7o
	j4FM34GFFR/z/mCiri0SUPV706NmDdWw+vd/P89LebYh08mhGOnO/btNXF/UFxUOBFjxhxFDMdI
	niA2ShL4UtemsfTDRcTYKkQ3cI/A4/CVy7w+5Rtd/Vjcx56D1PbNWWrjmp4lD60fXKfFEPEROpe
	lgr98GXRL6BEq79JHxOZYPVuGTte85rp4xzZZLBOE5iuc8XRNRnKtwLzV3BcS9vYfWzLwiqwWce
	U0ROo7PKQ4cS+lCWKV69yL47mbXqH1v/ZhiEF1F0VWtvCHn5ne8iv8CcyJ1UihD2ytmyxiA+riH
	2LTYhGwTfvBMI6DA==
X-Received: by 2002:a05:6000:611:b0:43b:63df:1330 with SMTP id ffacd0b85a97d-43b88a3d43bmr12305882f8f.20.1774537377432;
        Thu, 26 Mar 2026 08:02:57 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e352sm9022321f8f.3.2026.03.26.08.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 08:02:56 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [RFC][PATCH 4/4] python3, python3-dir.bbclass: Support Python free-threading
Date: Thu, 26 Mar 2026 15:35:54 +0100
Message-ID: <20260326150225.2083962-5-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326150225.2083962-1-zboszor@gmail.com>
References: <20260326150225.2083962-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 15:03:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234019

A new DISTRO_FEATURE[_NATIVE] = "python_freethreading" sets
PYTHON_ABI[_NATIVE]. This enables PACKAGECONFIG[freethreading] for
python3 and allows building Python modules.

Also added PYTHON_MAINVERSION_NATIVE and PYTHON_DIR_NATIVE in
an anticipation that they may be different.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/classes-recipe/python3-dir.bbclass        | 5 ++++-
 meta/recipes-devtools/python/python3_3.14.3.bb | 6 +++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/python3-dir.bbclass b/meta/classes-recipe/python3-dir.bbclass
index f3ad0a2d91..748ef3ec6e 100644
--- a/meta/classes-recipe/python3-dir.bbclass
+++ b/meta/classes-recipe/python3-dir.bbclass
@@ -5,8 +5,11 @@
 #
 
 PYTHON_BASEVERSION = "3.14"
-PYTHON_ABI = ""
+PYTHON_ABI = "${@bb.utils.contains('DISTRO_FEATURES', 'python_freethreading', 't', '', d)}"
+PYTHON_ABI_NATIVE = "${@bb.utils.contains('DISTRO_FEATURES_NATIVE', 'python_freethreading', 't', '', d)}"
 PYTHON_MAINVERSION = "${PYTHON_BASEVERSION}${PYTHON_ABI}"
+PYTHON_MAINVERSION_NATIVE = "${PYTHON_BASEVERSION}${PYTHON_ABI_NATIVE}"
 PYTHON_DIR = "python${PYTHON_MAINVERSION}"
+PYTHON_DIR_NATIVE = "python${PYTHON_MAINVERSION_NATIVE}"
 PYTHON_PN = "python3"
 PYTHON_SITEPACKAGES_DIR = "${libdir}/${PYTHON_DIR}/site-packages"
diff --git a/meta/recipes-devtools/python/python3_3.14.3.bb b/meta/recipes-devtools/python/python3_3.14.3.bb
index 12d1223d4c..f62ed5f0e2 100644
--- a/meta/recipes-devtools/python/python3_3.14.3.bb
+++ b/meta/recipes-devtools/python/python3_3.14.3.bb
@@ -109,7 +109,11 @@ CACHED_CONFIGUREVARS:append:libc-musl = "\
 "
 
 # PGO currently causes builds to not be reproducible so disable by default, see YOCTO #13407
-PACKAGECONFIG ??= "editline gdbm ${@bb.utils.filter('DISTRO_FEATURES', 'lto', d)}"
+# For freethreading, see the comment below.
+PACKAGECONFIG ??= "editline gdbm \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'lto', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'python_freethreading', 'freethreading', '', d)} \
+"
 
 # Some LLVM/CLANG subprojects (e.g. lldb) and many Python modules
 # do not build when free-threading is enabled. Also, the support
-- 
2.53.0


