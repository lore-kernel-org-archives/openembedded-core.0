Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8685A7E701
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 14:53:27 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id f17so3486960wme.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 07:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=nzOrHYKprPnIJgvgMREcSKQeA3hK57Y7zdkT17O/tWI=;
	b=Yze5M4MZXn5QQTr9tkOIOn+MZCbSqgP/6upK/SmZsPZXbRu9AWR6zM8lw2HWIRrTLD
	0obOSw6SRse1GGXcajwIUWljo5ohsbMSrrfzYDgmH9aO5P9BN8TCVuFqRiwXoQDpRgnm
	SSAVLMu0UYuGwUAwH2hXUxd3VLBh6LelNkEw7vgioRCQYKVW2TdFAQ/NJKvP+/bq2sD6
	PBlC/MT/qzwv3NvcquHlJ3xdNJvZBX91Q43wAtKNUNPRCe1r1DlWSXQ8bCDUvHn3/UX2
	7fSWS1q5v+GPOmte5cZ5fBLCXkXblrTRjHOzv0vamqpN0qj0LHIj1zPtjOYW/9CL3EeA
	J+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=nzOrHYKprPnIJgvgMREcSKQeA3hK57Y7zdkT17O/tWI=;
	b=hgW4IKPW6Zytdp72BVseZ3DuGtQo8PCxWonfLiTMKZaLyXf4QAmC5W9/GQn5g0uGHG
	M6V7GEtTq0nyYY0f0RpA7kJGvyoDZjZcl/CEXzUbMSnjSfaIIVF9fTUsqU8SC+XJMNyN
	2tKK/51wCCGMe3JqwDLhdFLRtzq2DQSGJ9BNslDzLII31EOiZbI8vd8ccAUjrO9Qn1o3
	FwcCX0smLeLSpMjpq4cpciRZKVIW+X1jDpWqyIOm9QlIkoxEAigefjrTEOLHv+fxNMPf
	NJ0oDXluFd/QH0Dc5c5n3OwQKmuZdYNrNO2xDdpcHeeAdLSfPc1MScSi8G2XvBAk7bfu
	DuVg==
X-Gm-Message-State: APjAAAWNue+UHb2TO0cAkABMrLCTM3FKeyjIosujRgc+FOChcotHmEAh
	ZMKU4g1OJlAq7ISTzOQvcyDYZQj7WzE=
X-Google-Smtp-Source: APXvYqyDc4IRSc9XMw3B1JQ4uSa8p6fCnSkxAVpi4OZx7pTVe4VFD+8BHrAINsCrR2kaxQSDL6sr7Q==
X-Received: by 2002:a1c:9d86:: with SMTP id g128mr24694wme.51.1561042407787;
	Thu, 20 Jun 2019 07:53:27 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	f2sm30244777wrq.48.2019.06.20.07.53.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Jun 2019 07:53:27 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jun 2019 15:53:25 +0100
Message-Id: <20190620145325.8654-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] python: make 'python' install everything instead of just the interpretter
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
X-List-Received-Date: Thu, 20 Jun 2019 14:53:27 -0000

Follow the python3 behaviour, and common sense, by making 'python' install
python-modules instead of python-core.  This means a user installing python gets
all of Python, instead of just a fraction of the library.

[ YOCTO #13402 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python_2.7.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python_2.7.16.bb b/meta/recipes-devtools/python/python_2.7.16.bb
index d70342fe3a6..5f387b8af11 100644
--- a/meta/recipes-devtools/python/python_2.7.16.bb
+++ b/meta/recipes-devtools/python/python_2.7.16.bb
@@ -162,7 +162,7 @@ py_package_preprocess () {
 PACKAGES_remove = "${PN}"
 
 # manual dependency additions
-RPROVIDES_${PN}-core = "${PN}"
+RPROVIDES_${PN}-modules = "${PN}"
 RRECOMMENDS_${PN}-core_append_class-nativesdk = " nativesdk-python-modules"
 RRECOMMENDS_${PN}-crypt = "openssl"
 
-- 
2.11.0


