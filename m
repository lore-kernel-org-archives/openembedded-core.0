Received: from mail-ea0-f178.google.com ([209.85.215.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Ud1xS-0005hR-6i
	for openembedded-core@lists.openembedded.org;
	Thu, 16 May 2013 19:27:17 +0200
Received: by mail-ea0-f178.google.com with SMTP id q16so1955116ead.23
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2013 10:09:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=S4zP9ru8qkBw1tN8T+ONzyjebndqzEVrppQQ9t+BsgY=;
	b=kI+jkVQIGdX42Cqd1rN8X7ytVQQ1lIUSXaQd9fRxjZqBpCcul5Im6XMYRf3k6afi/x
	1mw+sTOrzP9uMnQpc58367kgtGe/MlWemvWGogWJtLe9euwazkkUyHt6YA8nR11KgC8l
	9r5RyQ4S3fRkoDCaNJ7OI924v4X/tONGTHYJsWtxqwYnk+dhYzmRBLc2nfH6Akdn+vtc
	epO7BTqNUhO4bGkFUS6rT/bkzsLtCizzbkro4n0fmbJlWB09oBw8k0LmcNc5H9/3Zxew
	yt1tr/BSH0S5wadPAUq3M4c7xesw5rQXISkakJOEjOLJYciNFg+IKCIvd1YDHLkTOgJa
	i+dQ==
X-Received: by 10.14.221.67 with SMTP id q43mr72258469eep.1.1368724139905;
	Thu, 16 May 2013 10:08:59 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	bj12sm11961301eeb.8.2013.05.16.10.08.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 16 May 2013 10:08:59 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 May 2013 18:05:43 +0100
Message-Id: <1368723943-10440-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQku5KXOOm16Oqru1G+2yyDXMafCMI0PyrQGUpdZBfkRpzFqCOuFDCJevxzsAc3s9qS6Hk5F
Subject: [PATCH] libcroco: allow native builds
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 May 2013 17:27:23 -0000

Use BBCLASSEXTEND to get native builds, and inherit gnomebase instead of gnome.
libcroco uses the class just for the SRC_URI helpers, and the full class was
pulling in many unrequired dependencies including hicolor-icon-theme-native,
which doesn't exist.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/libcroco/libcroco_0.6.8.bb |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/libcroco/libcroco_0.6.8.bb b/meta/recipes-support/libcroco/libcroco_0.6.8.bb
index 5c3fd5c..3c5dc9a 100644
--- a/meta/recipes-support/libcroco/libcroco_0.6.8.bb
+++ b/meta/recipes-support/libcroco/libcroco_0.6.8.bb
@@ -9,9 +9,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605 \
 
 SECTION = "x11/utils"
 DEPENDS = "glib-2.0 libxml2 zlib"
+BBCLASSEXTEND = "native"
+
 PR = "r1"
 
-inherit autotools pkgconfig gnome
+inherit autotools pkgconfig gnomebase
 
 GNOME_COMPRESS_TYPE = "xz"
 
-- 
1.7.10.4



