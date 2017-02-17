Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id 9BBA571B27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 16:14:16 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id x75so19859915itb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 08:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=tEr/Iq8o3YfeG+EALSN8Jq+nOlLmc32EUHO6RWuP6QY=;
	b=z4XL1jKR3ncnpjy5tYYH0FffDXJTWxtcOxeFxjomLYtyWtfWlORUQk2PoiE2a03Ogq
	gjKOo8E39AOWABAQwDmQegSHu0VWbY+drWcciG1GwtNoX2j5lmQtjPWpbtOSDOXzsXUw
	faDF7tCtNFz4NT3LSQJF9eRex3EkUMKzA7ThjeDby0B4OzlAnb1WwADcOFEd5Onn2d5k
	snjNKEWCyi5z6FR8d44CT4H4ZaxIo5flZcv/Z4ijO15PWD6AM1STKwrrGkuMpE428AE5
	dbQrUgo2ZBXY44DJphp9miUryvSTiU2ICC64iPbOxRjkfdjXo5NLtjDpRbbkuVB08kE+
	4FLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tEr/Iq8o3YfeG+EALSN8Jq+nOlLmc32EUHO6RWuP6QY=;
	b=p8x+s7vGJtXHhSF+nVAFeefFx5Z+1T9q/lCS7P4DhZXE7ZVYXipkNygQAjQ9tB+Oeg
	ZlBgXFCebBUUMy+2oAgsn2Gp9gMuTtGQO9FT32rBF8HSd4yJeZsjk9nXbbFRNTaBgmBE
	SFdNa9VWUGjzZNIGIzxwvGAbhjyKeufbkHffaYlT1/HCYRRfTe+1KjVuEnsVXGPJo4Ig
	JKMUEH2VT22cpGRTRR4SgZXC2FWOWLUon92AHOvfo0wR5V1a1m8rt57XRHp2dW26yY26
	48mYwZyLEZMp/Ae0UOaOyEQJIVn8xAsOB9hOG9QLIsfouXBUp1gqZ1UJo0+xokEFt6qQ
	9Mlg==
X-Gm-Message-State: AMke39kdFn6Zb5FJkKIJsWISNWFVWwXuoji4ZDjDmYRXDouO8Ppkb18vrMZxwpxBtFVd+on0
X-Received: by 10.107.32.144 with SMTP id g138mr3201031iog.234.1487348056656; 
	Fri, 17 Feb 2017 08:14:16 -0800 (PST)
Received: from pohly-mobl1.fritz.box (p5DE8FD56.dip0.t-ipconnect.de.
	[93.232.253.86])
	by smtp.gmail.com with ESMTPSA id k66sm734616itg.8.2017.02.17.08.14.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Feb 2017 08:14:15 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Feb 2017 17:14:10 +0100
Message-Id: <1487348050-23774-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] libarchive: fix bzip2 dependency for native build
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
X-List-Received-Date: Fri, 17 Feb 2017 16:14:16 -0000

When DEPENDS=bzip2 becomes bzip2-native in libarchive-native,
the dependency ends up getting ignored because bzip2-native
is in ASSUME_PROVIDED.

But we need the library and thus have to depend on
bzip2-replacement-native, otherwise the build proceeds
without it despite the explicit --with-bz2lib.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-extended/libarchive/libarchive_3.2.2.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.2.2.bb b/meta/recipes-extended/libarchive/libarchive_3.2.2.bb
index 8ad62ad..a7c1204 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.2.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.2.2.bb
@@ -18,11 +18,14 @@ PACKAGECONFIG_append_class-target = "\
 
 PACKAGECONFIG_append_class-nativesdk = " largefile"
 
+DEPENDS_BZIP2 = "bzip2-replacement-native"
+DEPENDS_BZIP2_class-target = "bzip2"
+
 PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
 PACKAGECONFIG[xattr] = "--enable-xattr,--disable-xattr,attr,"
 PACKAGECONFIG[largefile] = "--enable-largefile,--disable-largefile,,"
 PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib,"
-PACKAGECONFIG[bz2] = "--with-bz2lib,--without-bz2lib,bzip2,"
+PACKAGECONFIG[bz2] = "--with-bz2lib,--without-bz2lib,${DEPENDS_BZIP2},"
 PACKAGECONFIG[xz] = "--with-lzmadec --with-lzma,--without-lzmadec --without-lzma,xz,"
 PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl,"
 PACKAGECONFIG[libxml2] = "--with-xml2,--without-xml2,libxml2,"
-- 
2.1.4


