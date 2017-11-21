Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 37CDC60778
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 23:53:25 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id l22so12866787wrc.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 15:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=ONPBt3DpAbVBKkTu2kvJHs8wFAVN/Pn1N8+yKMvY500=;
	b=KoMQwhBZlx0NIgDMfuUqbU79EgCy4xSixWiW5zMwWiN4VvKjTZli26bOtEx0qVxzzA
	nS6IewoqeqUL7Y6tb4S97E1etTa2zmEn5UESNY9ao4IqJ4qhfJLL3btrbIjx4E45Rd+p
	IJZz2s1CZmTWAaLh0fEij+L6mZ/joEhXIcHBgQK3LLxJ9hHsZr4MfOhK9VGIz34anT8a
	P2mT11WFN9eNyzWgkGMXwO6lUgBvgBIiIEvL3FsR8CYUXsel731rjZwwSv7iaizwzMel
	RypXI7Kj5XXKRzjM+Q5CRGzfLfz4WJO0BCvWUNJMxOWyywMUxCQ0xzbiSOWR2xzzhxne
	/2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ONPBt3DpAbVBKkTu2kvJHs8wFAVN/Pn1N8+yKMvY500=;
	b=J6urfImHnpfWNVeKb2+mVjoU9c6bHDYcldT3T4Uh/XKhbh1rVdHoILo9gi/DN640c5
	EYEP8Du4V8qeRFSmEhYRi1TackxjFkHnJo8fHem32gQvntMTTjO3xcQVT/al1Pki8Tc0
	XFMPNFCSCdhVqcZl0shBKeC8wckHVtjedqAU+j3QI+4I9xL5s7MzvZcl23sb73jWVgB4
	Hc2ezxfP0MFq+I5JY9yikkhNYVQS6O8mH5snC2e9DZQraWphI1N31u5E734ryAXaRWZa
	hXLE0oizEeibAdW8TUqtPaDv3kVs7DVxuLuKLLHAVrBXL7bpJqk5+0AcSDYLH5+DFk8m
	jv+w==
X-Gm-Message-State: AJaThX4T6Jxs1s5F1ozZ4CIj7vHPRSRDCOTZ73rK2s0/JXnY0OK/zbNn
	kqLB8TDp83C4si4UQzmJMsCyVTO0
X-Google-Smtp-Source: AGs4zMZuw5/61MDYH5shnA8viNDcPFw3HkYbor+LdSEL0rXJg/drBpXVLTePTRP5Xqu/wiUESSOK0g==
X-Received: by 10.223.199.70 with SMTP id b6mr6613792wrh.25.1511308406718;
	Tue, 21 Nov 2017 15:53:26 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id d4sm2811606wmh.35.2017.11.21.15.53.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Nov 2017 15:53:25 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Nov 2017 23:53:23 +0000
Message-Id: <20171121235323.29727-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] bin_package: fail if ${S} doesn't actually contain anything
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
X-List-Received-Date: Tue, 21 Nov 2017 23:53:26 -0000

If the user is trying to use bin_package but the SRC_URI hasn't extracted
anything into ${S}, which is easily done when writing a recipe by hand, instead
of silently shippping an empty package abort the build.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/bin_package.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/bin_package.bbclass b/meta/classes/bin_package.bbclass
index a52b75be5c0..cbc9b1fa131 100644
--- a/meta/classes/bin_package.bbclass
+++ b/meta/classes/bin_package.bbclass
@@ -26,7 +26,10 @@ do_compile[noexec] = "1"
 bin_package_do_install () {
     # Do it carefully
     [ -d "${S}" ] || exit 1
-    cd ${S} || exit 1
+    if [ -z "$(ls -A ${S})" ]; then
+        bbfatal bin_package has nothing to install. Be sure the SRC_URI unpacks into S.
+    fi
+    cd ${S}
     tar --no-same-owner --exclude='./patches' --exclude='./.pc' -cpf - . \
         | tar --no-same-owner -xpf - -C ${D}
 }
-- 
2.11.0


