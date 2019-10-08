Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id EA09E7F365
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2019 10:46:09 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id n14so18768228wrw.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Oct 2019 03:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yZtI7T9kSZTpLHo8vYNbO7taxDRGZRx+tdPlzLc2CMw=;
	b=LmLmAGOotzCDdWtjvv4WetNTG6dM3YUWZfvIb31aYcRlLa47xBj/6M+d6QojbMBG5v
	xD5sIEUKeK8RM7TVcHINL87MCLv0i1g/LqhUaFsjgzwCMAdRKYVv46XmcVqw0RtEhUTn
	0R1GIhjvSz6zN9E/WklaaASR8T3SSOq9pkWTWxWTqlO0UyrUKjNRl6ypLz5TzhEBmw62
	oF4VQky3vxuqrefs7JUpNDJ2+5PnmWUtZLHd3ri1d0/o5n9U8ChYGf3vvo6vI6E4V0qq
	mygzKaUFOwsN6cqdQuV1GPoW2IoN0xSNZ4tsKQBbYrulJsnFZcL5TueYVbxoEJwqz5Em
	OXGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yZtI7T9kSZTpLHo8vYNbO7taxDRGZRx+tdPlzLc2CMw=;
	b=tajU0bFvTN4WLU0IZY7Bim88QdXuhm6ia5DMJX+T+w39vRkwGEgUhDGVVQz0UVVbyS
	qknuc/yULrWC4IKRN2NHcQdoevkyMYXW76W0Kex/KTU+rNKE9tBSAEXziBbcwlO04GL1
	LuxhfgWmzYTWQXUTQa3DYG8zO0d1FzX+TRJieObpRrJYZofaeF2mJls1vMiIyFbE+w7G
	xMfEKG284RAJdvKOJHkgnfiz9csPiaJdnvutEZqSlPJmWH47FaVKslNsdzTHDgnbUq0A
	KiMxEv6jTX5hnDHPwgu+F5aLDSCDrqXCybRSE2lNAzCnsdYVucHLLg3/pX7x4DlYY/o0
	xVQA==
X-Gm-Message-State: APjAAAUPV/MD3pDc+05/6x9vrhQVO5KGu2kpahaSEBCZNs+eOjWwIecD
	qhIbkkrNM4p1Q057dYT4yAXBYFsDP8M=
X-Google-Smtp-Source: APXvYqzX4hKkpVyppWAZ7WtdhrBUdM6nXUW15WYKVzmWKuPk7rCin6zyczOUALyCv8jjeYkQXEchqQ==
X-Received: by 2002:a5d:62c8:: with SMTP id o8mr25952723wrv.350.1570531570141; 
	Tue, 08 Oct 2019 03:46:10 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	x129sm3387191wmg.8.2019.10.08.03.46.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 08 Oct 2019 03:46:08 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Oct 2019 11:46:04 +0100
Message-Id: <20191008104605.28981-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] bluez5: add needed character encoding for ptests
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
X-List-Received-Date: Tue, 08 Oct 2019 10:46:10 -0000
Content-Transfer-Encoding: 8bit

The test-gobject-header test suite needs UTF-16 encoding:

test_decode_header_name_ascii:
assertion failed (err == NULL):
Unicode conversion failed:
Conversion from character set ?UTF-16BE? to ?UTF-8? is not supported (g-obex-error-quark, 256)

Add gconv-utf-16 to the bluez5-ptest RDEPENDS.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 6c79ed0606b..f582a07e22a 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -155,3 +155,5 @@ do_install_ptest() {
 	cp -r ${B}/unit/ ${D}${PTEST_PATH}
 	rm -f ${D}${PTEST_PATH}/unit/*.o
 }
+
+RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-gconv-utf-16"
-- 
2.20.1


