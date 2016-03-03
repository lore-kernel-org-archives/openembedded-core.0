Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id D3B7677100
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2016 16:56:49 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id l68so39764555wml.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Mar 2016 08:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=fPmCoSoKWpudEVVdSkV9Lv2H3gZAcHy+bKioDu1f8NM=;
	b=vPAofstz9LmN9owBWuHKq90F2BdrvW0PBr0QOiSJg8XmpAPkTyQ2OTldE56UrNv8Kz
	RHwcmVJJGgfP4mSYd3gOZLPfyTKkgKWOfxctfiqL72HgoUkS4N9wC1nY4IFtiLT8UQsO
	GWS7phPC1VPyM6kqJ9fsyBJaAcZ/DEbXqv3IgFk98ecc8ime60NscO7viOp/5jGCNJQG
	qOpz3r0tuz/M60NYTOGhg7KIp9qGp8bv5F9qQS4eYROa6YbsxaSEriyvY5AMC+hFPhnR
	ui1ysrnJEgqutoxpiMbyKdF0ppGeAsHhIq3mr2MmtAsWGLkvDCiZuM2kSkK2YxaHtrHO
	SkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=fPmCoSoKWpudEVVdSkV9Lv2H3gZAcHy+bKioDu1f8NM=;
	b=Q4gLDKmEBaAmWYaPt1Q4zLtNDt45X9U8J5iBj8Zz8fO/vVcHhDhONq7twIc8DNltoP
	Y4JMKt+QPxTlAPU46hhNrTtsBtncFlDahLIhQvl28Jk1W3sOMLSMuONqaZWwACMFpmHf
	gqidbCRX3oRidutt82238Ixa+GKGnLim1S8MU48oSHLkY8hASs1XPnQlbQ+k2Oh+0l+A
	bwweqmVEjORiNjA+a5kHcvb1gMSJmP9I9ix3+iDbl1Nrl3ZMExT781v+8sbq1yRsMYGD
	WxcUnFAdFr+KNn5nBe1PU/pakVFs38R5jtnP/PnRw8JoEnBCjLZEJYCrVKPt7rcJZHIx
	ezfA==
X-Gm-Message-State: AD7BkJKPYJU6yrCenu5qTv3F5nvx2O75jNqddwj2YE98PzL59D65QomZo+aFp2jBA6ZgRoxs
X-Received: by 10.28.63.149 with SMTP id m143mr46299wma.95.1457024209209;
	Thu, 03 Mar 2016 08:56:49 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id z65sm3592363wmg.1.2016.03.03.08.56.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Mar 2016 08:56:48 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Mar 2016 16:56:43 +0000
Message-Id: <1457024203-7052-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] formfactor: assume a keyboard is plugged in
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
X-List-Received-Date: Thu, 03 Mar 2016 16:56:50 -0000

A sensible assumption is that BSPs have a USB keyboard and mouse connected
unless told otherwise, so flip the logic in the formfactor config script that
previously assumed that a keyboard was not connected by default.

[ YOCTO #9174 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-bsp/formfactor/files/config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/formfactor/files/config b/meta/recipes-bsp/formfactor/files/config
index 41066de..ecfdf26 100755
--- a/meta/recipes-bsp/formfactor/files/config
+++ b/meta/recipes-bsp/formfactor/files/config
@@ -9,7 +9,7 @@ if [ -z "$HAVE_TOUCHSCREEN" ]; then
 fi
 
 if [ -z "$HAVE_KEYBOARD" ]; then
-    HAVE_KEYBOARD=0
+    HAVE_KEYBOARD=1
 fi
 
 if [ -z "$HAVE_KEYBOARD_PORTRAIT" ]; then
-- 
2.7.0


