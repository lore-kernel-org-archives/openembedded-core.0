Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 878707E2A3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 11:51:50 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id z23so1393495wma.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 04:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=G6HZ57aaC9mhOnGe3enuKsv+y2FwN+YgRPoLtMJyHjw=;
	b=ML9WSEt6095RTDjiVasA0/+vbhvPbAZEhKULHzy0VYbP1JsASxYBWUfveCK1ZN80TK
	BgOoG2m8PluS2Rq7majJjOLCgMEnu2fqqQmeaekRuw05HAqEz0QlIvJAd/xnXzGd3T9Q
	EgRf7fdEqiFG4XK+cHkeuBIF198OHKqWyzixI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=G6HZ57aaC9mhOnGe3enuKsv+y2FwN+YgRPoLtMJyHjw=;
	b=QACDifZ+zr5E3tKtYOcriQ2fUzm0R60SV7V8BZMCURx34wJ6w7cakOaNb1m457P/F+
	+0eUelSOHkH4MxPXGZHKXSS+Ye7klNDEjmjmPi2r5KsuibENaKEegW+SjCDKH+4eRuX3
	LG0lxDZs3QOy4k/eoPsqplhp+dMb2IOr3vlda4kBzwvyXnLAXt7uKw7IT1zbGR+ge31h
	pYHeKVlwvGqT5vNdiaUdWWZHoiJBHT1Wn/QaDj6C8SZGGHNowZ709GXxg+yq6eW7Tft3
	MXxgZxHSFoO3qjeKLVB4RT4YuY+ZIXqUtyJUwIXnP/7QUb6DKhPhqkbHgafj+/fiyNX6
	GvVQ==
X-Gm-Message-State: APjAAAVeZpYqsZFki8VDfiVGKlQ/BLKSjQ/PUFY4XPxeBaTtdk8d9m0I
	MREan0xd9kj8Zlbqu3GXeBr4gq/oPTs=
X-Google-Smtp-Source: APXvYqygLsHQOWzdWkZ4R4zQ5pJc6rAsbtGDRjGM6UzVAIVEAvFOPUPcjoBme8iYxFDKk3r63my3zQ==
X-Received: by 2002:a1c:2c89:: with SMTP id s131mr6984460wms.142.1559130710798;
	Wed, 29 May 2019 04:51:50 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l18sm17924492wrv.38.2019.05.29.04.51.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 May 2019 04:51:49 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 May 2019 12:51:46 +0100
Message-Id: <20190529115148.28833-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/3] uninative-tarball: Fix file generation after class changes
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
X-List-Received-Date: Wed, 29 May 2019 11:51:50 -0000
Content-Transfer-Encoding: 8bit

OE-Core rev: 57a33048a89a422cfdc986d3489c67b2d297e1e7 renamed the tar_sdk function
but didn't fix this recipe. This leads to broken uninative tarballs as the internal
structure isn't correct. Fix this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/uninative-tarball.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/uninative-tarball.bb b/meta/recipes-core/meta/uninative-tarball.bb
index e0cb9ffee0d..34d53f9ec87 100644
--- a/meta/recipes-core/meta/uninative-tarball.bb
+++ b/meta/recipes-core/meta/uninative-tarball.bb
@@ -57,7 +57,7 @@ fakeroot create_sdk_files() {
 }
 
 
-fakeroot tar_sdk() {
+fakeroot archive_sdk() {
 	cd ${SDK_OUTPUT}/${SDKPATH}
 
 	DEST="./${SDK_ARCH}-${SDK_OS}"
-- 
2.20.1


