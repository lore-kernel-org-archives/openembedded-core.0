Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7E2D972F11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 16:14:26 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id w20so12103759pgc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 09:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=bOhoZ/FTaCjhmhXk7K6CBa7xhlMW9m+20LWVBJmHT80=;
	b=KDGlOvTtWDC5u3c6f/VsX2CsO0z73ggRqJGFGIrx8D3+XOf0gaOFMJBBh2ddxw+Gmj
	ri8bQhpAJ2vBAvXjX1E7PrfEJlLmxam0Tqob+TW0xXXJTE4rsJ1e5dSAiPHrbB6+pfch
	RBeY3Ncvrs2HgZyaqc82Y03KWiZAMKWFwkTp9ujvBAXXzRAQ/QmOx6XP/cljTR9VmOLN
	rMwCARGbWUsxGwzYGpOL1rKPM97nU72+EgLJklIW7etjHo9GX2/QIyK9vbBRF082+Qw6
	6UQ0C8rsEAlfTkEpJQiD5ZSjmH4OBaiJIDi+byLfdeBhToVyaT2ZONgOyLHJp09W9PTR
	T9+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=bOhoZ/FTaCjhmhXk7K6CBa7xhlMW9m+20LWVBJmHT80=;
	b=AzrlEAw5J9CFyHHgcK5FvXyjNC2pGFfkRheth+DDf1TKweQusvm3kHCWmKuryQXy87
	pfiFYR8e3319BW+77LL6b9zVwwIMekKRyEBtbNeE89ighJ1ort5sE+1R5dON5sxBuT1z
	+31hygVBoQXod9eN7X1KOaaqXAzifJUgDm776TH8KB6ckiYdGnt2B3SPmO55+UYYvvhS
	+iEAUAholDAe2Fr2IeW1Y2vlml/kA63+s8xq3Nq9NHyKPnnY9k5Z+Q3iMdRfTlSY8JU7
	REdYn8foscepqQOIJg8/oZSI58DIyBYrJLZlHS3DLy3zdNRgShZnHOYPQAQ8OrYjN42/
	SjsA==
X-Gm-Message-State: AFeK/H1DocjGTLHZVI4TNBsvWs8Ade29HsApmmDhK8YAfnwKyZbKBr4SrS8B5TVqMi9yYg==
X-Received: by 10.99.55.85 with SMTP id g21mr3767807pgn.62.1490285667210;
	Thu, 23 Mar 2017 09:14:27 -0700 (PDT)
Received: from [127.0.1.1] (CPE-123-211-11-185.lnse3.cha.bigpond.net.au.
	[123.211.11.185]) by smtp.gmail.com with ESMTPSA id
	d63sm11187342pfg.132.2017.03.23.09.14.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Mar 2017 09:14:26 -0700 (PDT)
Date: Fri, 24 Mar 2017 02:14:16 +1000
Message-Id: <20170323161416.8400-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH] uninative-tarball: glibc-gconv-{utf-16, cp1252} for binutils windres
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
X-List-Received-Date: Thu, 23 Mar 2017 16:14:26 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The windres binutils binary which is used for Windows resource files
requires utf-16 and cp1252 encoding support in order to correctly
generate resource files with strings. As such when using uninative to
build mingw resources for a nativesdk target the windres binary is
executed on the native host, thus using the uninative libc and gconv
modules.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-core/meta/uninative-tarball.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/meta/uninative-tarball.bb b/meta/recipes-core/meta/uninative-tarball.bb
index bbde0d2150..f3fc1ebe62 100644
--- a/meta/recipes-core/meta/uninative-tarball.bb
+++ b/meta/recipes-core/meta/uninative-tarball.bb
@@ -5,10 +5,13 @@ TOOLCHAIN_TARGET_TASK = ""
 
 # ibm850 - mcopy from mtools
 # iso8859-1 - guile
+# utf-16, cp1252 - binutils-windres
 TOOLCHAIN_HOST_TASK = "\
     nativesdk-glibc \
     nativesdk-glibc-gconv-ibm850 \
     nativesdk-glibc-gconv-iso8859-1 \
+    nativesdk-glibc-gconv-utf-16 \
+    nativesdk-glibc-gconv-cp1252 \
     nativesdk-patchelf \
     "
 
-- 
2.11.0


