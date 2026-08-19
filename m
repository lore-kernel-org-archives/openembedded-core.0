Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C6FAC5DF93
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 15:57:52 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10405.1787155063818149974
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 08:57:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=gu/2Q87t;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4994c49f588so439555e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 08:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787155062; x=1787759862; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yh+qPsVg4DqIXUXqiiPidy9eWD5EQHmQbZn5iaTmAdY=;
        b=gu/2Q87th6Lf5GuRC/GHy5LPXo4ewGatCk1Tvgpy2smvJis0kOxThjzGFRWgpEXhmF
         TUOcr+3VttCfJCw3nN4q0duusLQlbVxlhAEg9iiy+2g3u/Y+Akcde3I6YKcduBndhG7r
         6NTugqCjZn+/mz0CLmXvpcYfE9OflnlHIXZo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787155062; x=1787759862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yh+qPsVg4DqIXUXqiiPidy9eWD5EQHmQbZn5iaTmAdY=;
        b=m0BR6elMBX4cVanMrfc9zgDrsovRzfUkqyTRuJXtckttemrwZILcGGSE2inXxCOs3W
         sRuNeJGUgW+goa7sttditpwUBC2XHPc+Bie/cLTxpCpEUBSSA6GVHarxfogXnpsHgEm5
         6fawU4S0hp6kUjljerzwXDSzk/Lznf1Jyr3wohEajPH8L9OBiEYLomTFMNhlH0zMzCuf
         KLJ0jjEGPFPTudRs5WZOAzSK3gD9+vaUSNbPx4cRYrKOS/Hz33xMHj5V92kBX335WL8o
         nzXucN3R5Aubv9ajVDhFL1ScJl0PQUXL0R3vI3voRCRIuS9CDtcoHmy8b9PH36msu+Hq
         8TIA==
X-Gm-Message-State: AOJu0YzFtYrTsXA2YcqILuKet+PR+zEDzCxKhi/VVLPE+Rc6vAEL95mX
	vs2uevXmlslVvaEGdR+cDRskk7u7dAHGbdysU6VzbFDpVYKg6f6/VpkZ8mxZL/7WAuIc9N3ZPPH
	16/eeJEI=
X-Gm-Gg: AR+sD12VVA29oopZ3t6emr4EBxYHMYqSkNWxkJtpm/o80eTIPkHAv5KWAjOOL0lUqyC
	pOcN/r7wE24N07B5hhJQzYFQKYmMF1sWS0Ejex+lcG9CMtkTFwQyk35/+2BuFcL3pem/ScTH5fE
	xclN/WqYa67xO6/5wq2YcAUclh1PnX2841nc7Q2dC70uWbMVeysskEa+pWkiOfH1xDdkzwLoCK3
	EEZ7c0dyVU6QPq4nWsoIJu06IKhzLV2Kj4A9hMdL1CJnyDjxFRpHEV7q+ep5VkDdLT2gd7hZrCu
	Vj0c1YjFQpU/CiLoU9L8tuSL8yl9an5nA8xdj1j+0Z0G6+bZNwVCgdi/KV77WCarlRuRmxAjC/r
	6WwBHDZKfWd7Npqy8YnrU6X4vyTY26SyBnahwBYb0STrGvhKy6K9MhYbwy2B7cW+idsO85S798W
	1+NnpR97JqTr83APhQS7BEEqMiZ+Z4DSYJmyqQvN6dKdBMGn/rkpoUpiu9GrXU1K2QHSwZai9Bp
	GZyCgEAI7pGk1+i74yY2Af/5KlvQ1H4+Fgavhobr8cCfJJ5yTkTSlEPHBJ/Rw85Bh6a5h9s4I/Q
	9ekvAj3/7EcFErToZqAZTQBesA+ZsNvogM7oSqLt
X-Received: by 2002:a05:600c:4982:b0:498:1577:e11a with SMTP id 5b1f17b1804b1-499b06ea08cmr1709545e9.5.1787155062096;
        Wed, 19 Aug 2026 08:57:42 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm7215698f8f.35.2026.08.19.08.57.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:57:41 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/37] expat: fix CVE-2026-56408
Date: Wed, 19 Aug 2026 17:56:39 +0200
Message-ID: <51cd346218f5dcc5712e0ed7a3213673131ce819.1787154074.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787154074.git.fabien.thomas@smile.fr>
References: <cover.1787154074.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 15:57:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243744

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream fix shown in [1] as referenced by [2].
The fix is adapted to the existing Scarthgap Expat 2.6.4 source.

[1] https://github.com/libexpat/libexpat/commit/16e2efd867ea8567ffa012210b52ef5918e20817
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-56408

(From OE-Core rev: 7a0997b570488debe1ae1f2ab5a312150a96b940)

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../expat/expat/CVE-2026-56408.patch          | 29 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.6.4.bb        |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56408.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56408.patch b/meta/recipes-core/expat/expat/CVE-2026-56408.patch
new file mode 100644
index 00000000000..8e066565ba2
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56408.patch
@@ -0,0 +1,29 @@
+From c1ad5610cf060c6374d8f8d3b39163edd7053321 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Thu, 23 Apr 2026 10:31:45 +0200
+Subject: [PATCH 03/17] lib: Waterproof `copyString` from integer overflow
+
+CVE: CVE-2026-56408
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/16e2efd867ea8567ffa012210b52ef5918e20817]
+
+(cherry picked from commit 16e2efd867ea8567ffa012210b52ef5918e20817)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/lib/xmlparse.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index df92a3ca..12bbe23e 100644
+--- a/expat/lib/xmlparse.c
++++ b/expat/lib/xmlparse.c
+@@ -8489,6 +8489,10 @@ copyString(const XML_Char *s, XML_Parser parser) {
+   /* Include the terminator */
+   charsRequired++;
+ 
++  /* Detect and prevent integer overflow */
++  if (charsRequired > SIZE_MAX / sizeof(XML_Char))
++    return NULL;
++
+   /* Now allocate space for the copy */
+   result = MALLOC(parser, charsRequired * sizeof(XML_Char));
+   if (result == NULL)
diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/expat/expat_2.6.4.bb
index de03bab4ab7..7fe81749095 100644
--- a/meta/recipes-core/expat/expat_2.6.4.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -63,6 +63,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-45186-07.patch \
            file://CVE-2026-56403_p1.patch;striplevel=2 \
            file://CVE-2026-56403_p2.patch;striplevel=2 \
+           file://CVE-2026-56408.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

