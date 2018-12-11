Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 70ED16C46D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 10:49:12 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id l9so13507446wrt.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 02:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Kl5b6skCtzn/kXvhg+BFWnYHOgr9k4EhIzP1ljREdBQ=;
	b=qaxQkXWNayMYguBx0HuO9aUGN/HlJmx6ES+taoP76cO/ZaDdC+Tq2Y4FjLthCm3s58
	X9kSS1HotaZE+YfrXVBG/qL9RnjPgHSEcsX2DThq0kX+V/mClz0YjdC1n5ArR5L6WN9v
	f3ytF88csDj8GGnp864RD80R6jJjX0Gjurp/zyWDAqDSXs3C0OlagRapHl/uMV6r+0V+
	lcYlfBC9YEyUgsD1wH6oBozBOkuA6+aN4FOp+e+HdwchxNjkWj9iwTzyu+eNdBHx8fro
	U+LLs40N36JHQQaELRlLZDyqsMjBg51hfNe858hNL2CEqUe/OvB8WJG5bwhwthkCs1iS
	aZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Kl5b6skCtzn/kXvhg+BFWnYHOgr9k4EhIzP1ljREdBQ=;
	b=WC6XEFUCRqrxUPu4fGnqAIDiWoWJNpo3H2C/gasbcz/Lp0nGsg/aEoUU8pKEgPw8lq
	Z6yrVPLhg4Q1PsiAbh8e19bQokVPjHerk1kRoCZcOdG8XdC3HpWVs27l8P79iyOXZ0hx
	cRJq7kIqVqWk1D3H11UhiTeHsVTGpVEoZDRnPaAJ+T8W42RTUpZqBXIJc8H9f4JTUKjA
	3otYJVtacXGPDIPtJg8L6Muo6KI8og0GV2LJFbRevXQqEn1P3U1rT215otbXz3a+s/no
	ZegQArXLhATv/kWOvIp3YC9ZAAxbS7ahLjwILnugA+HFA7ql5KLnK8V+1MPl28JrXeH7
	kzxQ==
X-Gm-Message-State: AA+aEWYgKOOXKdOh10RDVQEtj+iysJ14y63qU+Jp+nPEVliptIvRzBH3
	/8ddoxkKiTRIjgMKI0A2KzuFqKRiVVg=
X-Google-Smtp-Source: AFSGD/UeRsWtSVa7rP99rsxswk7/VbR7fejaeSbCQSUtBEfx9W6C3BQqEA6SMwh5CWD8KuXHyVP84Q==
X-Received: by 2002:a5d:4d11:: with SMTP id z17mr12292603wrt.209.1544525352925;
	Tue, 11 Dec 2018 02:49:12 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	b18sm15050939wrw.83.2018.12.11.02.49.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Dec 2018 02:49:12 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Dec 2018 10:49:07 +0000
Message-Id: <20181211104907.7400-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] lzip: clean up recipe
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
X-List-Received-Date: Tue, 11 Dec 2018 10:49:12 -0000

Use cleandirs to ensure ${B} is always empty, and remove redundant assignment of
EXTRA_OEMAKE (presumably from when it had a non-empty default).

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/lzip/lzip_1.20.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/lzip/lzip_1.20.bb b/meta/recipes-extended/lzip/lzip_1.20.bb
index d1fc2a1da80..ed648e8011a 100644
--- a/meta/recipes-extended/lzip/lzip_1.20.bb
+++ b/meta/recipes-extended/lzip/lzip_1.20.bb
@@ -6,10 +6,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=76d6e300ffd8fb9d18bd9b136a9bba13 \
                     file://decoder.cc;beginline=3;endline=16;md5=db09fe3f9573f94d0076f7f07959e6e1"
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/lzip/lzip-${PV}.tar.gz"
-
 SRC_URI[md5sum] = "21c1517da2ace9689fd953918660b3c3"
 SRC_URI[sha256sum] = "c93b81a5a7788ef5812423d311345ba5d3bd4f5ebf1f693911e3a13553c1290c"
 
+B = "${WORKDIR}/build"
+do_configure[cleandirs] = "${B}"
+
 CONFIGUREOPTS = "\
     '--srcdir=${S}' \
     '--prefix=${prefix}' \
@@ -23,9 +25,7 @@ CONFIGUREOPTS = "\
     'CXXFLAGS=${CXXFLAGS}' \
     'LDFLAGS=${LDFLAGS}' \
 "
-EXTRA_OEMAKE = ""
 
-B = "${S}/obj"
 do_configure () {
     ${S}/configure ${CONFIGUREOPTS}
 }
-- 
2.11.0


