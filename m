Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06957C5DF6A
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 15:22:34 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21788.1786634550544689392
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 08:22:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=MSUhseeR;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4815b8781c7so352695f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 08:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1786634549; x=1787239349; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PlLRZ0kArsFcdivnjDjJ8A90Z5BwwHet1IJDF8SAvis=;
        b=MSUhseeRC1OdHNGq9m1sJjEbCuYc8hHPLDz9wp3NqtwARSNxcct2rI2LCT8mwpV4jc
         zyPLLRN2YcqK011qOGK4a5qwL/pxvjEzTtXJXEcP5qXbgVpUvHUKKS7nU2CHw4KCbVAe
         pRhlEO2QjEBHd8nDLGcRL/RShNiaxHrbUqPrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786634549; x=1787239349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PlLRZ0kArsFcdivnjDjJ8A90Z5BwwHet1IJDF8SAvis=;
        b=X+xtGqhiI3zBU/9P9SI1ALz6rLokxEWj3oVglA+qs/GF+zObA3FaLOKj3wVL0KlNc0
         uLSwCQWOkfkCw/xA4Fr/low9e1vo95G2Dp1kH60n29ecJrlJ8+TC7BG7WtMFO2vN04Z2
         N4fLBfGBh/TL0F0ZjxTJxIQ4e/B69oAxUDcfhf/WCOB9mPbhK9+StYavEaK0pS6NN5Mo
         apbGvo/luWUHOSfCKwfKRnfPl/EeAklAJlU/OA2OrRXbUsLPviFbUe/ktNQbhDsF4Lyq
         /oIPQuVTolU3u0T8ePvK5OQi91IDFlIt+dW8CYk+/xFrbcZrSkqgRzf3OqjUl27O8hbI
         8D9Q==
X-Gm-Message-State: AOJu0Yyr8+PQYEictP7mdiLQzOlz1jeonEuKkZt2ufMw16m642VOwJeP
	oD5jALvgpnJHdQu46BWwVaXN7obD9FzpnTgXvw7gi2JoiujKuRp9AeBbzn4yuUOeq1rTcxUYmE1
	hG+hAf7D7MQ==
X-Gm-Gg: AR+sD12e7HGnV0W7GHJdgfzxw+U/GnzCZzoV6tMTgM8/oZFp9vhmF0LP58VprjZKffZ
	wcc1NLVUCtF1+TRia3V0qz4VrVHJIjacOG7rihyNLgKqDpFXeEbRzUe90XBDyXlHYTaqjZ4i4eF
	t26JFCzxtsZ9PzNcKbdBce4XWKrncMmvVOrZSLyKwAE7ZP9xepnReOyfu9/FW4URp7KC8U7RNsF
	loH/8YQJ76Iby8oLovxMRU5CtYRKWmtDHD2WKWFuMW3/i/IxivpY6aTDtqz05gTy8up8XfGJKJZ
	TXA+UQC6moadQzEOd8k2GVDOb3dbuyPoPyVgOHt0O5YO2Ppy8PXObS5llvZLZtuqajCULXNxTz7
	PpZrleGcKe8uiHltsYTFO9H8I4/dmlmIZQzQ7zU2WPPlqLoYaB8i1qxqrrE8vC55q3gU+ImMhEp
	GR7dupRgA1YMHeVivA+jcAdvrK35efivOsIB/L6x670AmQE3/9F+m5IXYY6ZlA/u7Nmvphtu783
	AuO4FQYk2hFS6rs3y/zfUEEQXOOJ/u4dNu/A2MXzezNCFVqu7XQKG9FvEY3zKrnlJmIXiIHFKiY
	FWcRR9aM45fqVLI7Bg0fdnIW+eeXtOtcKnMMreD0
X-Received: by 2002:a05:6000:41ea:b0:47f:eca7:ad1a with SMTP id ffacd0b85a97d-48159cbd2ecmr11718082f8f.1.1786634548762;
        Thu, 13 Aug 2026 08:22:28 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f21a068sm110450f8f.12.2026.08.13.08.22.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 08:22:28 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 08/17] python3-idna: set CVE_PRODUCT
Date: Thu, 13 Aug 2026 17:21:58 +0200
Message-ID: <4a4f4851bc2bbd9b45485de05d47c9ac72bba1db.1786633048.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1786633048.git.fabien.thomas@smile.fr>
References: <cover.1786633048.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 15:22:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243365

From: "mark.yang" <mark.yang@lge.com>

The pypi class default python:idna matches nothing in the CVE
databases, which track the Python idna CVEs as:

* CVE-2024-3651 (kjd:internationalized_domain_names_in_applications) [1]
* CVE-2026-45409 (kjd:idna in the CNA record, same NVD CPE as above)

Set both vendor:product pairs.

For wrynose, python3-idna is 3.11. CVE-2024-3651 is fixed before
3.7, so it does not apply here. CVE-2026-45409 affects idna versions
before 3.15, so this metadata change will expose that CVE as
applicable/unpatched for wrynose.

The bare product name is not an option here: it would also match
"servo:idna", the Rust idna crate (e.g. CVE-2024-12224).

[1] https://nvd.nist.gov/vuln/detail/CVE-2024-3651

Signed-off-by: mark.yang <mark.yang@lge.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 48428c0fe22d8ecbfa53efffb28173d4d37539e6)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 meta/recipes-devtools/python/python3-idna_3.11.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-idna_3.11.bb b/meta/recipes-devtools/python/python3-idna_3.11.bb
index de4595c1d4..eb87572934 100644
--- a/meta/recipes-devtools/python/python3-idna_3.11.bb
+++ b/meta/recipes-devtools/python/python3-idna_3.11.bb
@@ -10,4 +10,6 @@ inherit pypi python_flit_core ptest-python-pytest
 RDEPENDS:${PN} += "python3-codecs"
 RDEPENDS:${PN}-ptest += "python3-unittest-automake-output"
 
+CVE_PRODUCT = "kjd:idna kjd:internationalized_domain_names_in_applications"
+
 BBCLASSEXTEND = "native nativesdk"

