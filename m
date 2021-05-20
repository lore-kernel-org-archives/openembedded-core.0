Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.498.1621543748769922783
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 13:49:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LhkPWx+X;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id p7so15232710wru.10
        for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 13:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hZj5yh3XOt/qspmgQOx2Wj1VWsjO9kqw5zWvOQGlmDQ=;
        b=LhkPWx+XPlDQ7FDbdGCX/Ttg7/trFFzCA6nKSJu7ogRy9j86TQiZr2JYOmgbMIfACG
         BTWmOHxms4DgmaPPHc/PTR3MwcMVjKwwl8720xC61n87YomENk/n7NCpkTWqhwfNCOU6
         0DPxr7PKHo1AsbpacEszYwjE0skd1zwH6nnVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hZj5yh3XOt/qspmgQOx2Wj1VWsjO9kqw5zWvOQGlmDQ=;
        b=FNzwBdjLQOTagyKIPLiMUS3SOD9XyQFyhOv2UfgeVkhql6c6XCpkxcZKSXbpipy2sO
         +MwiXwGFWNfvBB0Eg4u52Pv7tv3I0V2Ue0cYwYM/WbaiuxkzaIzaYh54+iDdPgX3bi6/
         XRTb5nxPqCAGl1xJkPrKCBpcc29t0V2oJtoPInHVqRXC4p0QEL9K0ul5/Ygjyh9ufzS9
         YHOVO17nUD2E5azKWD1bCYjv4Q1auUodHgwxCSz0/k9twzMUkB+sUSdIWrWiTTHDu80c
         eCTCmZNcKYMKW09WbkgUqdzeAEgqdCucJUgC8k4YrCrzKKGq2mqFrHy/042IKx+QVgMB
         ja3Q==
X-Gm-Message-State: AOAM530DkWXRshIo5in3idpLjL+r7noJbcYQiVELX8vsHFlndlnwDwfN
	tDd1cikG6vcfD8DAGLM5Q4ObuH8bkXSPCQ==
X-Google-Smtp-Source: ABdhPJw0tHZpi7XoT4IbaROmCSaWWCnOzwxNcRo0LS4x2hZW/JEIntl6/zT81LcPWGf4Nuep+slmgQ==
X-Received: by 2002:adf:f8cd:: with SMTP id f13mr6112586wrq.77.1621543747279;
        Thu, 20 May 2021 13:49:07 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:c394:d896:3913:6568])
        by smtp.gmail.com with ESMTPSA id n189sm3768061wme.9.2021.05.20.13.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 13:49:07 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Tony Tascioglu <tony.tascioglu@windriver.com>
Subject: [hardknott] [PATCH 08/28] libxml2: fix CVE-2021-3537
Date: Thu, 20 May 2021 21:48:42 +0100
Message-Id: <20210520204902.2527687-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
References: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tony Tascioglu <tony.tascioglu@windriver.com>

Parsing specially crafted Mixed Content while parsing XML data may
lead to invalid data structure being created, as errors were not
propagated. This could lead to several NULL Pointer Dereference when
post-validating documents parsed in recovery mode.

CVE: CVE-2021-3537
Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/babe75030c7f64a37826bb3342317134568bef61]

Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libxml/libxml2/CVE-2021-3537.patch        | 49 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2021-3537.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2021-3537.patch b/meta/recipes-core/libxml/libxml2/CVE-2021-3537.patch
new file mode 100644
index 00000000000..defbe7867b4
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2021-3537.patch
@@ -0,0 +1,49 @@
+From 5ae9c39401f679648301efa6d2d35e09cc376462 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Sat, 1 May 2021 16:53:33 +0200
+Subject: [PATCH 3/3] Propagate error in xmlParseElementChildrenContentDeclPriv
+
+Check return value of recursive calls to
+xmlParseElementChildrenContentDeclPriv and return immediately in case
+of errors. Otherwise, struct xmlElementContent could contain unexpected
+null pointers, leading to a null deref when post-validating documents
+which aren't well-formed and parsed in recovery mode.
+
+Fixes #243.
+
+CVE: CVE-2021-3537
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/babe75030c7f64a37826bb3342317134568bef61]
+
+Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
+---
+ parser.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/parser.c b/parser.c
+index a34bb6cd..bbcff39f 100644
+--- a/parser.c
++++ b/parser.c
+@@ -6195,6 +6195,8 @@ xmlParseElementChildrenContentDeclPriv(xmlParserCtxtPtr ctxt, int inputchk,
+ 	SKIP_BLANKS;
+         cur = ret = xmlParseElementChildrenContentDeclPriv(ctxt, inputid,
+                                                            depth + 1);
++        if (cur == NULL)
++            return(NULL);
+ 	SKIP_BLANKS;
+ 	GROW;
+     } else {
+@@ -6328,6 +6330,11 @@ xmlParseElementChildrenContentDeclPriv(xmlParserCtxtPtr ctxt, int inputchk,
+ 	    SKIP_BLANKS;
+ 	    last = xmlParseElementChildrenContentDeclPriv(ctxt, inputid,
+                                                           depth + 1);
++            if (last == NULL) {
++		if (ret != NULL)
++		    xmlFreeDocElementContent(ctxt->myDoc, ret);
++		return(NULL);
++            }
+ 	    SKIP_BLANKS;
+ 	} else {
+ 	    elem = xmlParseName(ctxt);
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-core/libxml/libxml2_2.9.10.bb
index 6f1229c2d08..b850164285a 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
@@ -26,6 +26,7 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
            file://fix-python39.patch \
            file://CVE-2021-3517.patch \
            file://CVE-2021-3516.patch \
+           file://CVE-2021-3537.patch \
            "
 
 SRC_URI[libtar.md5sum] = "10942a1dc23137a8aa07f0639cbfece5"
-- 
2.30.2

