Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.20736.1599740699667529280
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:25:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ShPkvwl0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id e11so1788510wme.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/il58+TdmGdpF7qKxe7z3r77MKe+7PZEmoBKtVX/3N4=;
        b=ShPkvwl0woHQQF91rHVQQ0PA3O0mOHVWgDskkzJ5SPtZAUPRXatmhI6Mx3c/ool070
         es6AbTEVgY2wEza+HRImpKMavSAPvikBPulRKAvkfUzdlGkkPmpKm1Fhq30MOmYX6dcB
         54R6X0Ic01alRsDvZuN4HijNj/iAlvrbtpFgc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/il58+TdmGdpF7qKxe7z3r77MKe+7PZEmoBKtVX/3N4=;
        b=qrbbK08/ydyzhDF4jkWuFw31TBrm32ZV4EKntY7/CS+mOvJRyvyLSEM+Hn3dwzeLqL
         uIZlbMjmgZsLG0RGejStkVKiIu3JBPZxmjaHpLDKha7Tpp0DRLoKR0Rqh+2lfx3NQEby
         jTJqhvs7Q5oHLxQZFaSapUHx5acnOMqvlA8exiFtUe4Jhe/+W3CCL4gp36iCtzVRHeXR
         yCRFqzNUuY/FzRshAMT0FRPCR4TdVATqLIrJM9hILOxKssw6Vh5CeQqTSUiYKPiJ5EoC
         L/LD2wkha2cKfzI8IjssGt6yeXmTK3bshWGoTiTSw8lrgRsN+0KDTpoE0i6jVfs7Kgs+
         xYVw==
X-Gm-Message-State: AOAM5336K9JAitad1Eu+92CpTWxQx3ei0YuoWGGWUO49c/UtKN2dw21a
	MouRQYe0SA/QzxMTCdfS0jJkY8f9CVjt/A==
X-Google-Smtp-Source: ABdhPJzWa/mv5DkNf8KZ/n02yQo0k7ynKdtSbD+OKV/xKVvYvrUVnOSjb7wuIC5pf/RMs/564uekLQ==
X-Received: by 2002:a1c:6187:: with SMTP id v129mr8111795wmb.35.1599740697893;
        Thu, 10 Sep 2020 05:24:57 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id j7sm8590498wrs.11.2020.09.10.05.24.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:24:57 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][thud 23/29] python3-testtools: Avoid traceback2 module requirement
Date: Thu, 10 Sep 2020 13:24:27 +0100
Message-Id: <20200910122433.2040293-23-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
References: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

traceback2 adds traceback for python2. Rather than depend on traceback2, we're
python3 only so just use traceback.

This caused breakage in oe-selftest -j which uses testtools on the autobuilder
using buildtools-tarball.

[YOCTO #13652]

(From OE-Core rev: ee80a06c107375e3cf0d246ea17c09dda4536dab)

(From OE-Core rev: ee82e3c24fe5727ce81e972cadedca431d6086c5)

(From OE-Core rev: be4470c9590183b388d9ff176331d0c50984dec8)

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

