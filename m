Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.20721.1599740606234004420
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:23:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PDoPkllj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id q9so5450266wmj.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=rzTEJeAvs6VgDCGU+oI/4SnHJuc2VtTH7sGtGyiNPcA=;
        b=PDoPkllj1wJVq+KbAnkXh1iqI2TggCWadUy+dfoHngsMwSaR7gYMCpi9mIApr4VZg4
         4RsfyWiFbQpOoMfV59AzkeV+CwT+Ux1AD4A0JZ/l90OTFQyDlsJ1aFN/jLy40rOyNZdN
         qU6N4XiFCOqeaBnOCTmeIWaeFKJeFekX1Tx7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rzTEJeAvs6VgDCGU+oI/4SnHJuc2VtTH7sGtGyiNPcA=;
        b=slTk/0hhLPe+b3buvW9bb2leazHuJ9K9TD0SgiEBYM1zNZqHFo0srFy+Uos5dVifcd
         PUuH2uYBHjueCGv6T8GRUt3GaMpUvjO35mHoIZvnnvwy66eOx9pA6nMrNgHFYcY26Djq
         t2gbxGonEXA4irL2ERtZV97dbwKW4+zvHwCoyR72+9aKAPlPV0sEDRbxWSmEXMOWxg4c
         WCnFuBtxhRHNvEFuC8gIlorXfoysInjCrX7wwj7T7MAbkOMsdd6fSovf8AGt6zeWPKS5
         kZD4Nk7jdM2y1SjG+gpkxpVFZlDwHnRUJSsZoLxoZDvWjxvje60z+6zUPN5noeB/Yjc1
         3iRA==
X-Gm-Message-State: AOAM532uONIB3JeiFO/6tTPXQERuJlSKHEujUX0yn5/jWgLuPtrgbAfR
	rzITIRw2DEJUnfGvdXdz/bBe4zymxd+CcA==
X-Google-Smtp-Source: ABdhPJwP52gEDV/hRI3wV7OLXkzbCaCX3G6/Uc9wKxlvIWqs9piCpyUApcun/+G9Lvao25XRaNGNpQ==
X-Received: by 2002:a1c:98c7:: with SMTP id a190mr8706515wme.131.1599740604479;
        Thu, 10 Sep 2020 05:23:24 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id v17sm8810794wrr.60.2020.09.10.05.23.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:23:24 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][warrior 18/22] python3-testtools: Avoid traceback2 module requirement
Date: Thu, 10 Sep 2020 13:23:02 +0100
Message-Id: <20200910122306.2040194-18-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910122306.2040194-1-richard.purdie@linuxfoundation.org>
References: <20200910122306.2040194-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

traceback2 adds traceback for python2. Rather than depend on traceback2, we're
python3 only so just use traceback.

This caused breakage in oe-selftest -j which uses testtools on the autobuilder
using buildtools-tarball.

[YOCTO #13652]

(From OE-Core rev: ee80a06c107375e3cf0d246ea17c09dda4536dab)

(From OE-Core rev: ee82e3c24fe5727ce81e972cadedca431d6086c5)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python3-testtools/no_traceback2.patch     | 23 +++++++++++++++++++
 .../python/python3-testtools_2.3.0.bb         |  2 ++
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-testtools/no_traceback2.patch

diff --git a/meta/recipes-devtools/python/python3-testtools/no_traceback2.patch b/meta/recipes-devtools/python/python3-testtools/no_traceback2.patch
new file mode 100644
index 00000000000..594510342b9
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-testtools/no_traceback2.patch
@@ -0,0 +1,23 @@
+traceback2 adds traceback for python2. Rather than depend on traceback2, we're
+python3 only so just use traceback.
+This caused breakage in oe-selftest -j which uses testtools on the autobuilder
+using buildtools-tarball.
+
+Upstream-Status: Inappropriate [Our recipe is python3 specific]
+(Once py2 is EOL upstream probably could/should take this)
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: testtools-2.3.0/testtools/content.py
+===================================================================
+--- testtools-2.3.0.orig/testtools/content.py
++++ testtools-2.3.0/testtools/content.py
+@@ -19,8 +19,7 @@ import os
+ import sys
+ 
+ from extras import try_import
+-# To let setup.py work, make this a conditional import.
+-traceback = try_import('traceback2')
++import traceback
+ 
+ from testtools.compat import (
+     _b,
diff --git a/meta/recipes-devtools/python/python3-testtools_2.3.0.bb b/meta/recipes-devtools/python/python3-testtools_2.3.0.bb
index 896ecee65c5..a254b90a758 100644
--- a/meta/recipes-devtools/python/python3-testtools_2.3.0.bb
+++ b/meta/recipes-devtools/python/python3-testtools_2.3.0.bb
@@ -1,2 +1,4 @@
 inherit setuptools3
 require python-testtools.inc
+
+SRC_URI += "file://no_traceback2.patch"
-- 
2.25.1

