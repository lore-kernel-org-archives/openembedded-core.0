Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id E5AA874AEB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Aug 2018 13:48:43 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id d10-v6so8417222itj.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Aug 2018 06:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ePJgvxkoEKflFiYu5Dj0KtHPmI+fA5QarxNny13dflg=;
	b=gnSbSV+5IFBnv7lWdP6JfEFKY2gF7SfWw81BgtOTXzwWGxcZt/srEbTXuMk8ATHVhd
	6OBiA/CQIvLEBaLHH+oOUfb5I4KN6uChMXfvktWsUOQqJWJpI+UKDCmKqkeOenSRgb00
	OdXAswMs/N6YfQwYds3pp92SwuZhyRUM+7tHOES5k5WD2T+trLwxqRS8gzdp9TVdfW/4
	6aBXnEriqGG357uTqLpKOM9HKLF5Z6CIwMa2tjJe74w+TScp9v0sKw0rVUJxhDzDi/GU
	DpeM+GeHaKPPfRXJDqe4T2kQyxfK9qCk299hrWxgWFJrDkZ3YqLXKQNA3GDcXBLe/Xll
	/vJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ePJgvxkoEKflFiYu5Dj0KtHPmI+fA5QarxNny13dflg=;
	b=r5KH+C8iivdpp1a8fsyNjbm70OMGBAQYMv7phDcw2ZLXEqN9Yo+Z85SumRJipUJH7q
	KU+bn3WPrZmkuR0Z1rGl3paHROk8okZw0hWQIVFwVNzpSuh1jPky7Cp3WMZ+1RTygPFi
	u2MMuhneyJt6m6O1w8o5fgF8Nb2DhHDbZvzG/zsPb/x03p0iqNL/P+K8Rkbh4Qz5FXtK
	YlrkZuK/uoRwt5NVNx/RgmgKXga/lU8Pb4wcp0SGJGjaQf/bEltLaWgX2jkEaE9i5rZU
	W9znW4UHY6W4eEVnWevOvHYseWJNnIqilavHRJIQX4wpQAH73wDMIGjHC2k5YVqKnEID
	nKSQ==
X-Gm-Message-State: AOUpUlHEHeuDQ45bigy6U0FNxokFPfd2p3QKVAoIxOpSMXcNfm6Poly6
	gTe+npSK3Uhgkv7z/GBcCMkxM5ax
X-Google-Smtp-Source: AAOMgpf94lfzqps95OZHpzVNjn+90SXwmwzGfU0e9hA+3FO91hD4Qflsg0c3w1S6K/neMBkYP3XTwQ==
X-Received: by 2002:a02:9c54:: with SMTP id
	h20-v6mr3519817jal.49.1533304124630; 
	Fri, 03 Aug 2018 06:48:44 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	d8-v6sm1958106itj.10.2018.08.03.06.48.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 03 Aug 2018 06:48:44 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Fri,  3 Aug 2018 08:48:31 -0500
Message-Id: <20180803134831.16694-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Tanu Kaskinen <tanuk@iki.fi>
Subject: [PATCH v2] alsa-lib: Cleanup packaging
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
X-List-Received-Date: Fri, 03 Aug 2018 13:48:44 -0000

Cleans up the packaging by moving libasound.so.2 back into the alsa-lib
package which was previously empty.

Previously, it was difficult to create an image that had libasound.so.2,
then create an SDK from that image that had the proper development
files, because the only way to get libasound.so.2 was to do:

 IMAGE_INSTALL += "libasound"

This however caused a problem because all of the development files that
would be desired in the SDK were located in alsa-lib-dev, which wouldn't
be included because alsa-lib wasn't included, and it was impossible to
include alsa-lib because it was an empty package that was culled.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-multimedia/alsa/alsa-lib_1.1.6.bb | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.1.6.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.1.6.bb
index 6364e9eafaa..569f9f61e3a 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.1.6.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.1.6.bb
@@ -18,19 +18,18 @@ EXTRA_OECONF += " \
     --disable-python \
 "
 
-PACKAGES =+ "alsa-server libasound alsa-conf alsa-doc"
+PACKAGES =+ "alsa-server alsa-conf alsa-doc"
 
-FILES_libasound = "${libdir}/libasound.so.*"
 FILES_alsa-server = "${bindir}/*"
 FILES_alsa-conf = "${datadir}/alsa/"
 
-RDEPENDS_libasound = "alsa-conf"
-
-# alsa-lib gets automatically added to alsa-lib-dev dependencies, but the
-# alsa-lib package doesn't exist. libasound is the real library package.
-RDEPENDS_${PN}-dev = "libasound"
+RDEPENDS_${PN}_class-target = "alsa-conf"
 
 # upgrade path
+RPROVIDES_${PN}-dev = "libasound"
+RREPLACES_${PN}-dev = "libasound"
+RCONFLICTS_${PN}-dev = "libasound"
+
 RPROVIDES_${PN}-dev = "alsa-dev"
 RREPLACES_${PN}-dev = "alsa-dev"
 RCONFLICTS_${PN}-dev = "alsa-dev"
-- 
2.17.1


