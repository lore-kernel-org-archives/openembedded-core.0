Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 8A2CE72DF2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:04:37 +0000 (UTC)
Received: by pdjg10 with SMTP id g10so2406543pdj.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=4KErtMlmKNFbLhX6nUYYVePaOUR6qo80+AIvr0lXn8I=;
	b=H2BXSJkAqtwX0CaVRma+lvx6acD1+8p9MDAx8nnXxyaso9Q69sJtWT1lDa1D6Y4+pp
	IQGDxcoXlbMDvueIwtv2tJVRw0HKm2WiQOn8yzKK9mtyb6DQcZbK/LNqRQ3u3GLaNQuV
	pGAnTM16yQnAcWabtRq73kGB9XXcd0crVOrHvDcccBk5BFT3p6HBjtJg8PBBsYJJ8AcH
	iAh0RiBrDeHieSq9nXrsEBfwWsCtPL60uC532XCRNrYNvzguGamBCz0hTi8rff/31ED5
	0ubmWG3a+oEVgZ2JJxl+CrhZnw1nUss/8NO9+5Quim00jlsGm5ZBZZgA72I9zIeOjJrz
	XZPQ==
X-Received: by 10.68.196.99 with SMTP id il3mr6829013pbc.158.1423152278841;
	Thu, 05 Feb 2015 08:04:38 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.04.36
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:04:37 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:03:21 -0800
Message-Id: <678df2884e14889be171167e1b9c3a50621d3de8.1423150739.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Andr=C3=A9=20Draszik?= <adraszik@digisoft.tv>
Subject: [PATCH 13/61] openssl: fix hard paths in native openssl
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
X-List-Received-Date: Thu, 05 Feb 2015 16:04:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@digisoft.tv>

This causes the package to not be relocateable from sstate

The OpenSSL binaries respect a few environment variables for determining
locations of files, so we now use these to point the binaries to the
relocated locations.

[YOCTO #6827]

(From OE-Core rev: 771d3123331fbfab1eb9ce47e3013eabcb2248f5)

Signed-off-by: André Draszik <adraszik@digisoft.tv>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl.inc | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 9ec884f..31dfd8f 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -193,5 +193,12 @@ do_install_ptest () {
 	install util/shlib_wrap.sh     ${D}${PTEST_PATH}/util
 }
 
-BBCLASSEXTEND = "native nativesdk"
+do_install_append_virtclass-native() {
+	create_wrapper ${D}${bindir}/openssl \
+	    OPENSSL_CONF=${libdir}/ssl/openssl.cnf \
+	    SSL_CERT_DIR=${libdir}/ssl/certs \
+	    SSL_CERT_FILE=${libdir}/ssl/cert.pem \
+	    OPENSSL_ENGINES=${libdir}/ssl/engines
+}
 
+BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1


