Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web09.487.1621543748299220421
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 13:49:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=W/Yi0oc5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 62so8923426wmb.3
        for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 13:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E/cTMB/pKYh7fG+rBPbIH3/TKmAHT1499tNB6plh0iE=;
        b=W/Yi0oc5TB6mhZTERMKh2/1eo3FwP1ooRfNMbdusl26fEUBONcLtOmTrvzWyWYEpB7
         FqxC/wIJ4suyCPI4/IFxLMyEH6JPznt14XTEpaQMrAxXgVKf/m1dOV0zDFkA7Up6EYAu
         nQN7PYVFlcZfqk/peUs90yZ8W20Um/V7MlPbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E/cTMB/pKYh7fG+rBPbIH3/TKmAHT1499tNB6plh0iE=;
        b=I03x3QMaXCk0O7/mXXftq2XZoTqFbIBd+W6gIvqrOCt3lAilCtr4K3/b4FcMnF3qov
         ufzQ/tYXnHFrWHP/iFAPICt2DI9GbIS+MBwSb+EXTmO65g8YOyqm7PZTyUJ+o4NlOE6W
         O/ErgVViKWn+vmlUCWCANhaOUgQEjDQwoLGS5Zn8rp9U7pRygPJpWmUazsShdKpRn/L5
         7smjDvPS0H+7Quty56uw7qXkpxuoKoyxNK9t4VaS0ouj6VT9hQTBxjRC8l/frppB3xwQ
         hY8gSsDqQG9FkWF+AGsGA1HmG6ZZJyhtoMEVVqO+9QGk32oC3kTCb9EDtCBGzY15TTKP
         umJw==
X-Gm-Message-State: AOAM532ctcrpm/HbLayuN6h/pnmAP6OGJkjZf3tDvDuJKBAA7nBqe/CB
	wU4Z4lg1A5SNopp72an7xdfyu+6zCO7A6Q==
X-Google-Smtp-Source: ABdhPJwheaZFDo6/0W0VVE3YxTbM1QHAFIEvbt6OoqXgLVlwsqbGt44u+K7/PrW/ucoHkRSapAxJgA==
X-Received: by 2002:a05:600c:4f04:: with SMTP id l4mr5275343wmq.18.1621543746776;
        Thu, 20 May 2021 13:49:06 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:c394:d896:3913:6568])
        by smtp.gmail.com with ESMTPSA id n189sm3768061wme.9.2021.05.20.13.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 13:49:06 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Tony Tascioglu <tony.tascioglu@windriver.com>
Subject: [hardknott] [PATCH 07/28] libxml2: fix CVE-2021-3516
Date: Thu, 20 May 2021 21:48:41 +0100
Message-Id: <20210520204902.2527687-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
References: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tony Tascioglu <tony.tascioglu@windriver.com>

Fixes use-after-free in xmlEncodeEntitiesInternal() in entities.c

CVE: CVE-2021-3516
Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/1358d157d0bd83be1dfe356a69213df9fac0b539]

Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libxml/libxml2/CVE-2021-3516.patch        | 36 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2021-3516.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2021-3516.patch b/meta/recipes-core/libxml/libxml2/CVE-2021-3516.patch
new file mode 100644
index 00000000000..287a171924d
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2021-3516.patch
@@ -0,0 +1,36 @@
+From b76718876953e11bbd73dc6c9457323fd5aeda2e Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Wed, 21 Apr 2021 13:23:27 +0200
+Subject: [PATCH 2/3] Fix use-after-free with `xmllint --html --push`
+
+Call htmlCtxtUseOptions to make sure that names aren't stored in
+dictionaries.
+
+Note that this issue only affects xmllint using the HTML push parser.
+
+Fixes #230.
+
+CVE: CVE-2021-3516
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/1358d157d0bd83be1dfe356a69213df9fac0b539]
+
+Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
+---
+ xmllint.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/xmllint.c b/xmllint.c
+index c0712674..ba66676b 100644
+--- a/xmllint.c
++++ b/xmllint.c
+@@ -2204,7 +2204,7 @@ static void parseAndPrintFile(char *filename, xmlParserCtxtPtr rectxt) {
+             if (res > 0) {
+                 ctxt = htmlCreatePushParserCtxt(NULL, NULL,
+                             chars, res, filename, XML_CHAR_ENCODING_NONE);
+-                xmlCtxtUseOptions(ctxt, options);
++                htmlCtxtUseOptions(ctxt, options);
+                 while ((res = fread(chars, 1, pushsize, f)) > 0) {
+                     htmlParseChunk(ctxt, chars, res, 0);
+                 }
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-core/libxml/libxml2_2.9.10.bb
index ad612379b3f..6f1229c2d08 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
@@ -25,6 +25,7 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
            file://CVE-2020-24977.patch \
            file://fix-python39.patch \
            file://CVE-2021-3517.patch \
+           file://CVE-2021-3516.patch \
            "
 
 SRC_URI[libtar.md5sum] = "10942a1dc23137a8aa07f0639cbfece5"
-- 
2.30.2

