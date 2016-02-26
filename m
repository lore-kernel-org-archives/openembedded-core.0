Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id C28A177468
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 21:12:23 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id m82so70378601oif.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 13:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=1TZGUNcPqcbl9IVxog8T4AmTYmIp29/kSnepG8S2Kwc=;
	b=CqgxRf786T2CqANJnr91j1a3VH0apZ4/NNwglZOnt7r4MQHg8npp4jNOeZ20HZQRXM
	PWsLN9L5q5ho708Z2j2NdvnyqWcYLKBKOK0jh90OsQVAQrHSbHvSrUfVgT99BCecdHfB
	XhfBpjd+z1RIdNsD8/Dlo/fL++uN1vhzLVjJYYnpL6ythkbGQ0P1KUerIQEJ5/KOPw7k
	3wxyIl0uWyv8cUH4tqCUABKQ9BKLUJv1INscA5/XZyWq/c6+yCdOQjmVb+Yti5I7RpH+
	CczW7CLbc5a2cjJpC2znjscjnLcNnBeQMdK9Jt5MHD5MCqO4ULTwuR7rJVEKh/x1eDCR
	ZD5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1TZGUNcPqcbl9IVxog8T4AmTYmIp29/kSnepG8S2Kwc=;
	b=htfLUx/PMP5jmM1x0pvzo/PGqO8AUUilRBbCe0SblfVkHFRZrPnEk/mdi7Aj60kFxy
	LNb/+WwY6/pWUmVzdz3IC/odBnpyRy9YEwXMymUVvlYzACQt2+akxcgLP5q0XoyB9fth
	pGltU3aWKxG4DqciQ1wD6jzKC/OsRh28CizXb6KsvTEMs4C06XRhOj3iuf4urg4lCOkl
	aTbzJ/FsjprbijXSPqHMXRVnDqMY0a8t7SecawH04PKlz86P6asdFU9DAsgcc65hepVY
	ylvfhqzFp0+aAQ51GerUHwjmLUl4ClV8uNFOczqlAge9iGV99ax7yXJu7yFwbF+5nlVc
	AydQ==
X-Gm-Message-State: AD7BkJJUOzR8u12GiF5gujcOfG0dcv6P6qHfSAUWUPZIzb0xX8OBYQpfkz5oTzKfYP86Mw==
X-Received: by 10.202.107.18 with SMTP id g18mr2832624oic.125.1456521144685;
	Fri, 26 Feb 2016 13:12:24 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	n84sm9883785oig.14.2016.02.26.13.12.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Feb 2016 13:12:23 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Feb 2016 13:12:18 -0800
Message-Id: <1456521138-23570-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] harfbuzz: update 1.2.1 -> 1.2.3
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
X-List-Received-Date: Fri, 26 Feb 2016 21:12:25 -0000

Overview of changes leading to 1.2.3
Thursday, February 25, 2016
====================================

- Blacklist GDEF table of certain versions of Times New Roman (Bold) Italic,
  due to bug in glyph class of ASCII double-quote character.  This should
  address "regression" introduced in 1.2.0 when we switched mark zeroing
  in most shapers from BY_UNICODE_LATE to BY_GDEF_LATE.
  This fourth release in a week should finally stablize things...

- hb-ot-font's get_glyph() implementation saw some optimizations.  Though,
  might be really hard to measure in real-world situations.

- Also, two rather small API changes:

We now disable some time-consuming internal bookkeeping if built with NDEBUG
defined.  This is a first time that we use NDEBUG to disable debug code.  If
there exist production systems that do NOT want to enable NDEBUG, please let
me know and I'll add HB_NDEBUG.

Added get_nominal_glyph() and get_variation_glyph() instead of get_glyph()

New API:
- hb_font_get_nominal_glyph_func_t
- hb_font_get_variation_glyph_func_t
- hb_font_funcs_set_nominal_glyph_func()
- hb_font_funcs_set_variation_glyph_func()
- hb_font_get_nominal_glyph()
- hb_font_get_variation_glyph()

Deprecated API:
- hb_font_get_glyph_func_t
- hb_font_funcs_set_glyph_func()

Clients that implement their own font-funcs are encouraged to replace
their get_glyph() implementation with a get_nominal_glyph() and
get_variation_glyph() pair.  The variation version can assume that
variation_selector argument is not zero.  Old (deprecated) functions
will continue working indefinitely using internal gymnastics; it is
just more efficient to use the new functions.

Overview of changes leading to 1.2.2
Wednesday, February 24, 2016
====================================

- Fix regression with mark positioning with fonts that have
  non-zero mark advances.  This was introduced in 1.2.0 while
  trying to make mark and cursive attachments to work together.
  I have partially reverted that, so this version is much more
  like what we had before.  All clients who updated to 1.2.0
  should update to this version.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../harfbuzz/{harfbuzz_1.2.1.bb => harfbuzz_1.2.3.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.2.1.bb => harfbuzz_1.2.3.bb} (88%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_1.2.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_1.2.3.bb
similarity index 88%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_1.2.1.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_1.2.3.bb
index fead2d3..cfe885f 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_1.2.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_1.2.3.bb
@@ -12,8 +12,8 @@ DEPENDS = "glib-2.0 cairo fontconfig freetype"
 
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "c50034739e4b5ea85d46199bf7859ea6"
-SRC_URI[sha256sum] = "0c189aa386c5ea8d7c315adf273f56f48f412081a367b3f92abc2d0855fa2226"
+SRC_URI[md5sum] = "da8d97e262e6ef8288e1ae76369421bd"
+SRC_URI[sha256sum] = "8216d2404aaab7fde87be0365a90d64aa6c55928e104557cfcb37b54a096cb8c"
 
 inherit autotools pkgconfig lib_package
 
-- 
1.9.1


