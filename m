Return-Path: <jpardeiro@rapyuta-robotics.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 99D3565CC2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 14:27:20 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id m124so72181668wme.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 07:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rapyuta-robotics-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=c6bsLDoKpHU7dusKWeNS8EMD8VDYNTvpFy0so6Ujwh0=;
	b=ykqMBLVfvsWtlzPQoaYfTqzFbMYX4AbZWXU3kWDr93SyNqva6H6qpLlBidR6cjKycu
	rXY6MY645wI90rwGZo7MEedG4WU8deLaWKbXs0lt+nvnjHA2N+Rbt3NPIHhxILopW+0T
	HGcFN47oBvfGKiqpDpjs+vA2ynWlPtZxjjGyEhVX8u4KQ8jN1uEEOv2Vqdi/DYErT5VZ
	38JlpEDVRzRsQZ0G79QnT5fonQ9ELJgEwwHkKPmbTeSDOTR1PLcd4zwsLVLwpNhbLbpP
	Sd76qEB/SqMUS5XFxCSwHeCIP2kr+vjbAYtdPD+HglsuQw73htvAc6q4iM0GPXjB0yQW
	TUCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=c6bsLDoKpHU7dusKWeNS8EMD8VDYNTvpFy0so6Ujwh0=;
	b=RxYGVJo/pM1jPxbixpKIC0HdKHW4oSCKSh60VluhxOqITmffwggoQzJGZPByugbVtB
	b+kENILu5Sphq5zcMCwvgSUTfEaU7yIDM4jELlQXpg4CeBELzcQEtP/ht9wRdVWaXR4q
	OQ/NPaxi4V2pfBDIs7bwemGL+3qPQA7B+c7XGNALWrXQzWiDiVURtb7Qw641vEMLL9h5
	A/6Nv7+Nowciw65kGOHDlm43HP2q+R7dgSdTuXw7Z74Fu0iPqOzULGRtPUQ4tpgSv+xX
	XTDfhtK5K1fhk+1nx0ncgW2lIeNx97l5eJLMjRVvDtCLpqaZbDZmQtl63PvCK/Dvq5wC
	/SNQ==
X-Gm-Message-State: ALyK8tIElmkEYYaDkECwrNgTHL0dwBug5KJunQxjLlek5OTzVNbgtK6WYYLr+C1PA1eUzw==
X-Received: by 10.28.31.204 with SMTP id f195mr4985256wmf.45.1466087240944;
	Thu, 16 Jun 2016 07:27:20 -0700 (PDT)
Received: from RRCH08.v.cablecom.net (77-57-36-131.dclient.hispeed.ch.
	[77.57.36.131]) by smtp.gmail.com with ESMTPSA id
	kd7sm43981464wjc.33.2016.06.16.07.27.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Jun 2016 07:27:20 -0700 (PDT)
From: Jose Pardeiro <jpardeiro@rapyuta-robotics.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Jun 2016 16:27:11 +0200
Message-Id: <1466087231-14928-1-git-send-email-jpardeiro@rapyuta-robotics.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] The CMake recipes contain a mismatch between the environmental variable which defines where the Modules are installed and the location where they actually are. This patch fixes the environmental variable to point to the proper folder defined according to the cmake version.
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
X-List-Received-Date: Thu, 16 Jun 2016 14:27:23 -0000

Signed-off-by: Jose Pardeiro <jpardeiro@rapyuta-robotics.com>
---
 meta/classes/cmake.patch | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta/classes/cmake.patch

diff --git a/meta/classes/cmake.patch b/meta/classes/cmake.patch
new file mode 100644
index 0000000..c9cc9f2
--- /dev/null
+++ b/meta/classes/cmake.patch
@@ -0,0 +1,20 @@
+The CMake recipes contain a mismatch between the environmental variable
+which defines where the Modules are installed and the location where they
+actually are. This patch fixes the environmental variable to point to the
+proper folder defined according to the cmake version.
+
+Signed-off-by: Jose Pardeiro <jpardeiro@rapyuta-robotics.com>
+
+diff --git a/cmake.bbclass b/cmake.bbclass
+index 995ddf1..6de4247 100644
+--- a/meta/classes/cmake.bbclass
++++ b/meta/classes/cmake.bbclass
+@@ -60,7 +60,7 @@ set( ENV{QT_CONF_PATH} ${WORKDIR}/qt.conf )
+ set( CMAKE_INSTALL_RPATH ${OECMAKE_RPATH} )
+
+ # Use native cmake modules
+-set( CMAKE_MODULE_PATH ${STAGING_DATADIR}/cmake/Modules/ )
++set( CMAKE_MODULE_PATH ${STAGING_DATADIR}/cmake-\${CMAKE_MAJOR_VERSION}.\${CMAKE_MINOR_VERSION}/Modules/ )
+
+ # add for non /usr/lib libdir, e.g. /usr/lib64
+ set( CMAKE_LIBRARY_PATH ${libdir} ${base_libdir})
-- 
1.9.1


