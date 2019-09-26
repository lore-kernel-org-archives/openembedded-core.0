Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id C67006D666
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2019 05:16:12 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id z12so815778pgp.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 22:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=B2qbCInZvsaZrdxxiQna8+XPKMAnPi6wXWWRkc2rhVU=;
	b=hJAL7kKDDMXAj3TVk0BMOOqj+ATsPa5zMqXX4Z4v0CvLX8MdsjLKjvCalFOKUJyGlB
	Q3ahXa1aaa0tMNl3iukrAAbPuHX50wRhJLjtDBhKeZsqEgeK27T7KIV7cHATovRgNTSz
	YGDrMMWVdECKDArHAzT6/5HC0xOwQgyOb/GsQBtjbFS9mEyoNoYndaxneP7Bj6aX5gk8
	EwqahV3FqyPiaQxgtc7X17+O/JNhRnjflxGqoY21An9EChQdU8zOqcjYYd52SZQKHaQ8
	EG0Xh4uJNnlvdCsDLYVjhNW3yXCmZhOwTTdbCpDhvm3VLt56ruastR+EghSOnCPjWoS7
	zrrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=B2qbCInZvsaZrdxxiQna8+XPKMAnPi6wXWWRkc2rhVU=;
	b=OGotoGORJlj0NriL1PN7a+WoNf9MNRT14pxSIGt3mXUaOYHELGAPlblEIidzlklQBw
	fyW4D6iQ2E4gVoNSJRU3gFksn0XzsFUr5Dl5N5rvYngqsfzoRIn0zla6PYo5gutUpvfE
	92lJJA/7DMdUMN9PflAPHdHmjXgke/hGZcv/DnrtWwwLqPNEXya15AS7h4J7yPKIFZDh
	c3XvyfuSA4ap9XgJainLSB57VlI9P1zL3o/hdXDTsCca46ESfq9l3wbyzVTb2VzlHDqN
	t6uTadx8DXvNHUj/JMnwTDWsVPqv2MkUb0VjQTJseMqNbxlGA71N4hZZYVPZ3iPpZTaf
	iDwg==
X-Gm-Message-State: APjAAAVOVvwwgdIwwvmX3dqwJ/mTiYesDe4/qRdSlTr0n4Td06XfDCOF
	y67i+y+k6CPOHQDhqw0jMbcGK+oB0ZA=
X-Google-Smtp-Source: APXvYqyBt3VkUQQiGbvJXhL2KEJPYtpTtRIxqXOFbcawsytitGAIpSm65bd2aADgdnNiClIl1kWR9Q==
X-Received: by 2002:a62:19c7:: with SMTP id 190mr1598148pfz.105.1569474973194; 
	Wed, 25 Sep 2019 22:16:13 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3])
	by smtp.gmail.com with ESMTPSA id q13sm841294pjq.0.2019.09.25.22.16.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 25 Sep 2019 22:16:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Sep 2019 22:15:59 -0700
Message-Id: <20190926051559.2120971-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] sdk: Install nativesdk locales for all TCLIBC variants
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
X-List-Received-Date: Thu, 26 Sep 2019 05:16:12 -0000
Content-Transfer-Encoding: 8bit

install_locales() here is actually operating on nativesdk and only glibc
is the default library for nativesdk, since thats what most of
desktop/server distros use, therefore bailing out based on TCLIBC is not
needed here, since nativesdk-glibc would be required for all non-glibc
targetting SDKs as well.

Fixes SDK install time error

ERROR:  OE-core's config sanity checker detected a potential misconfiguration.
Either fix the cause of this error or at your own risk disable the checker (see sanity.conf).
Following is the list of potential problems / advisories:
Your system needs to support the en_US.UTF-8 locale.
ERROR: SDK preparation failed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/lib/oe/sdk.py | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index b4fbdb799e..d02a274812 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -88,10 +88,6 @@ class Sdk(object, metaclass=ABCMeta):
             bb.warn("cannot remove SDK dir: %s" % path)
 
     def install_locales(self, pm):
-        # This is only relevant for glibc
-        if self.d.getVar("TCLIBC") != "glibc":
-            return
-
         linguas = self.d.getVar("SDKIMAGE_LINGUAS")
         if linguas:
             import fnmatch
-- 
2.23.0


