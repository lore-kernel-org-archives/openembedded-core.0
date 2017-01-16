Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 50AB871A9B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 14:16:03 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id f144so14234701pfa.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 06:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=tif2pPgsV7FwEBRhGy5WR3OaUJyXUvf2YyTR88UnvU0=;
	b=H//FWrSnRHUqseBS1u4wQF1P3Ji+/6jZNaH+GWT6teJNtmIQMLD5EqPZ8r3zBsYZZE
	pBkjPOcOO/tbTuUFabSe88YV1pZXJqPUXOI4vQsK5+wUPcnu1uk7+5qfUkGoXFCCUHX+
	pIUugbBpHUf3/RkB/Dg4QAS6Fyruwa0LbSkxpVStGxNImelbFv17s/PdzOhIuHbkl5Gs
	pjUurzVOkN8sS6AEayQMEi+OcO/UhVu9GOakJVxk5V95LaamlxQHT3qONja6gpVvWSF1
	5uySV7CYJnyYfglerPQk71jZGYBDtWeF3e3hs7/Z10P1kyOud+SDwOjqBm263O/jQWOi
	Ky4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=tif2pPgsV7FwEBRhGy5WR3OaUJyXUvf2YyTR88UnvU0=;
	b=SVOL0oYgTq9GthIQthRQNscxOMbGnyaAT/EZevAlKmzGPRrlr6NGfR23zi8TMnL2i+
	vGfBnKTRNPhNCR0atpeYwxDtaMTKby4LCVDhY9jKnv0u7P7wrOkl7pDSZBwiW3dX/O0D
	VkHR7i4GXqmJ2ZYmwJfsuk6BFNmQ6rwDWiZzdcjmeo25rdqIVA9zZmFmYUdOB0jmnk9f
	aSDteba77eM89KqJcv3aafzFk9Jzv7KRLBhlsBfvPYupqrNGIqyk3DY9TbQDz7tg02hJ
	y9oiNzhTxWzJesmVkXejqRD60HmBlaux8aprP9JMZQvO5GWCCEyrbIPcMfUhtptbYdSe
	BfWg==
X-Gm-Message-State: AIkVDXKQqrjAFBH8J4THOnJnjliRZlLv8yDZcyCVYO4HOENnDaTB9n57rhjoPkTawbW+kg==
X-Received: by 10.98.67.72 with SMTP id q69mr8976011pfa.14.1484576164483;
	Mon, 16 Jan 2017 06:16:04 -0800 (PST)
Received: from [127.0.1.1] (CPE-58-165-45-185.lns1.lon.bigpond.net.au.
	[58.165.45.185]) by smtp.gmail.com with ESMTPSA id
	195sm48251049pfa.6.2017.01.16.06.16.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jan 2017 06:16:03 -0800 (PST)
Date: Tue, 17 Jan 2017 00:15:10 +1000
Message-Id: <20170116141510.3321-6-nathan@nathanrossi.com>
In-Reply-To: <20170116141510.3321-0-nathan@nathanrossi.com>
References: <20170116141510.3321-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH 6/30] libpcre_8.39.bb: Handle shipping .exe and .dll files for mingw32
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
X-List-Received-Date: Mon, 16 Jan 2017 14:16:04 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Package the .dll and .exe files into their expected packages.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-support/libpcre/libpcre_8.39.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/libpcre/libpcre_8.39.bb b/meta/recipes-support/libpcre/libpcre_8.39.bb
index 2d4668b52d..1d2e98d051 100644
--- a/meta/recipes-support/libpcre/libpcre_8.39.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.39.bb
@@ -59,11 +59,11 @@ SUMMARY_pcregrep-doc = "grep utility that uses perl 5 compatible regexes - docs"
 SUMMARY_pcretest = "program for testing Perl-comatible regular expressions"
 SUMMARY_pcretest-doc = "program for testing Perl-comatible regular expressions - docs"
 
-FILES_libpcrecpp = "${libdir}/libpcrecpp.so.*"
-FILES_libpcreposix = "${libdir}/libpcreposix.so.*"
-FILES_pcregrep = "${bindir}/pcregrep"
+FILES_libpcrecpp = "${libdir}/libpcrecpp.so.* ${bindir}/libpcrecpp*.dll"
+FILES_libpcreposix = "${libdir}/libpcreposix.so.* ${bindir}/libpcreposix*.dll"
+FILES_pcregrep = "${bindir}/pcregrep*"
 FILES_pcregrep-doc = "${mandir}/man1/pcregrep.1"
-FILES_pcretest = "${bindir}/pcretest"
+FILES_pcretest = "${bindir}/pcretest*"
 FILES_pcretest-doc = "${mandir}/man1/pcretest.1"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.11.0


