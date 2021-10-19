Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6555CC433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 19:55:36 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.15110.1634673335209612353
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:55:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=2DAuDm1B;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id i5so8227140pla.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ecP5OHRfQ/XS5/UJaTyghj/FI9Lp0Fp4H1wLYmydC7I=;
        b=2DAuDm1B0uSURky+ROqNVEBGtwL0dWyQH1C2S2Z593R+0VGLNY66CfAvfCJgV73pMs
         LARE8UT/NNna0rUFe2ypAs6EWsDIeN3M4An8TXxn9HhJ2+J9BHlF52uAsvF2dDCwxQxy
         q9bjLTcE49w+9q6FvyHhDBozxpYEL8B/VWIL2IA3QkQ/3/gmiOYY77cY0sm26aJdGjgA
         KJTAn4QuNMwft9zR+DhVbTG5ROPowADRFwUaNF9bdNCxpPeyHPV25oKXuMIvFgLf42Yz
         KbAHUXSBcv//n9itHG3YxaaB3JBpCuheiqTRU4aZEBf4o+YHVuhVnpo0EKINCrcfjk2F
         nvvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ecP5OHRfQ/XS5/UJaTyghj/FI9Lp0Fp4H1wLYmydC7I=;
        b=KF9TOb5OdIE/Hhw5D/Qs0QfqBf4qey0pnyyi2kboa9Yy5XfNaQ/ymSs9AfJBIqqLTz
         3emwcplTePCCh0q+Da4udfI+jZI84DajHRuHt5ROApWcdsQ+T9OiGbNu0ZmKVQ2dWfIC
         AYygumBw0eYNw+CTHa7IH6WYeNF5VD3ZsITBJAgYQk7tzNOQ7mLyAv0UDyS4ovmMot8J
         FyqSlNvkR8B2su4P6e6AZl8zJqzk7/YzedCFk14Xk3pOG5OKJkM8V7fEsseilgl40urq
         WjBJZc9g1QmLxYzPT3NBKQIY2kGWjnUQGaU3XNyDvCgDcMObLJ7GL3zLAernxOs/9PIf
         8aNQ==
X-Gm-Message-State: AOAM530whaPM5PokitsoHqM9nScFw3Qs3HDzD4fF07ImBkvax0WTmK4C
	Ahx54w/7l1ILABOruzua2hMgD2sQtDFtZ2uP0hY=
X-Google-Smtp-Source: 
 ABdhPJzisSEg72Q5V5Ttf167Q5SfXDDL/LXxxxzIYXZzR2bUauJUksNu/K5eZi5VQSKgJ/BzMhQM0w==
X-Received: by 2002:a17:90b:1b42:: with SMTP id
 nv2mr2061826pjb.91.1634673334237;
        Tue, 19 Oct 2021 12:55:34 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q14sm67104pfk.3.2021.10.19.12.55.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 12:55:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 37/38] python3: Add a fix for a make install race
Date: Tue, 19 Oct 2021 09:53:48 -1000
Message-Id: 
 <917f800368c6d452670d3ccf74057afae98013b0.1634665675.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634665675.git.steve@sakoman.com>
References: <cover.1634665675.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 19:55:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157242

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Add a fix for reproducibility issues where pyc files for python-config.py
may not always be generated.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d1c3a87c48b598b6e5624d0affe8bd89320631bf)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python/python3/makerace.patch             | 23 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.8.11.bb |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/makerace.patch

diff --git a/meta/recipes-devtools/python/python3/makerace.patch b/meta/recipes-devtools/python/python3/makerace.patch
new file mode 100644
index 0000000000..8971f28b8e
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/makerace.patch
@@ -0,0 +1,23 @@
+libainstall installs python-config.py but the .pyc cache files are generated
+by the libinstall target. This means some builds may not generate the pyc files
+for python-config.py depending on the order things happen in. This means builds
+are not always reproducible.
+
+Add a dependency to avoid the race.
+
+Upstream-Status: Pending
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: Python-3.8.11/Makefile.pre.in
+===================================================================
+--- Python-3.8.11.orig/Makefile.pre.in
++++ Python-3.8.11/Makefile.pre.in
+@@ -1415,7 +1415,7 @@ LIBSUBDIRS=	tkinter tkinter/test tkinter
+ 		unittest unittest/test unittest/test/testmock \
+ 		venv venv/scripts venv/scripts/common venv/scripts/posix \
+ 		curses pydoc_data
+-libinstall:	build_all $(srcdir)/Modules/xxmodule.c
++libinstall:	build_all $(srcdir)/Modules/xxmodule.c libainstall
+ 	@for i in $(SCRIPTDIR) $(LIBDEST); \
+ 	do \
+ 		if test ! -d $(DESTDIR)$$i; then \
diff --git a/meta/recipes-devtools/python/python3_3.8.11.bb b/meta/recipes-devtools/python/python3_3.8.11.bb
index f549bb2205..2a2472b3d0 100644
--- a/meta/recipes-devtools/python/python3_3.8.11.bb
+++ b/meta/recipes-devtools/python/python3_3.8.11.bb
@@ -33,6 +33,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-configure.ac-fix-LIBPL.patch \
            file://0001-python3-Do-not-hardcode-lib-for-distutils.patch \
            file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
+           file://makerace.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.25.1


