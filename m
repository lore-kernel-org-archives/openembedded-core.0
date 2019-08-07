Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id C012C7F3AE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2019 10:29:45 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id s15so58108771wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Aug 2019 03:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TIzY1HXgz6g4oU74s2bXA9WMGRLBkqjonNdW5ohI6rA=;
	b=B0RwWct1NVq51XHZObaJat6uBvS3UvMpvjBEL3dPL3Ca9Jk/1iwg8aAeYYgr1Unfy8
	pRh2YxDxHyFkjeEetKszs1fzMghUWb1endVIxujMA7yA9kUqOLYSVe8i6K9JJJf79YGO
	fboVgUgqn/ChRgKUx+jbR6Tp4CLyJiBDNtPKYoM9x/3fiblUET40MGiYxV4O8yUtIEDA
	tIgiv5QAkBWcxMRdaVN0Z64OgrkDONmZuYIdN6+4kr7XPu1aHUu6B+HHfkuuzi5opDqG
	CQidD1gHiGIOZQryEdWEO8OVBcx1+uA91okLQ03oCFzM/5ReaM0Dyc2YN6aDtPczwKU8
	QMdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TIzY1HXgz6g4oU74s2bXA9WMGRLBkqjonNdW5ohI6rA=;
	b=liU4xf6cjvY2c1e65EmQm4CMYn6wCAVRNwLUDeUQca6B2bvHfaa9sNbqkeLqZcJj1D
	97uQAavLNvaOkn6WnrsHvFmn9hManLyoBkjNtJxf3LJZ2EzlMzNyDaq1jLJ0AGFMneQr
	C4fdMsuGFuJZsdaV7uG00CzBZzfUmjh6osJgYEocZmQe3/0YYzq5AQ0h9w5qn6uN9GqE
	TeBOuZ12rWCWcHrU8cfrJGEDS29yuLQL7kBiaLVRVzcXq9GynEAKWJtIxwtHfldmSf1a
	jPz8qyVX0QMLWMozyyvqxAzBokAtfTMsN4m90tUNFBe5J5JGQ3PWy0EDSnT6aPmnrHhK
	nY+Q==
X-Gm-Message-State: APjAAAWv5ulPA/d2JbGujzEYq21MEQUXhFPl0J1Nfi0W0DVM5CGLDlS9
	GWwAGLNYK2xABcxSCEaEFmrWAR1VWE571Q==
X-Google-Smtp-Source: APXvYqwsWXRwrpgVZ8MVclYjHBNq4tn8QqKb7EWNRS1jIZQLBlgr1rXjX2vBjhvJ9nl2tkGJ1sPAQg==
X-Received: by 2002:a1c:ac81:: with SMTP id
	v123mr10228892wme.145.1565173786287; 
	Wed, 07 Aug 2019 03:29:46 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	o3sm79705336wrs.59.2019.08.07.03.29.45
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 07 Aug 2019 03:29:45 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Aug 2019 12:29:35 +0200
Message-Id: <20190807102939.12760-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190807102939.12760-1-alex.kanavin@gmail.com>
References: <20190807102939.12760-1-alex.kanavin@gmail.com>
Subject: [PATCH 3/7] elfutils: use PRIVATE_LIBS for the ptest package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Aug 2019 10:29:46 -0000

EXCLUDE_PACKAGES_FROM_SHLIBS is too broad: it suppresses both generation
of required and provided shlibs. We need to suppress only the provided shlibs
(to avoid clashes with the main package providing the same shlibs),
and run the required shlib dependencies generator as usual.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.176.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.176.bb b/meta/recipes-devtools/elfutils/elfutils_0.176.bb
index 75acf59d26e..d98457e3f9f 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.176.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.176.bb
@@ -142,4 +142,4 @@ INHIBIT_PACKAGE_STRIP_FILES = "\
     ${PKGD}${PTEST_PATH}/backends/libebl_x86_64.so \
 "
 
-EXCLUDE_PACKAGES_FROM_SHLIBS = "${PN}-ptest"
+PRIVATE_LIBS_${PN}-ptest = "libdw.so.1 libelf.so.1"
-- 
2.17.1


