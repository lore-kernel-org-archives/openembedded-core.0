Return-Path: <jpardeiro@rapyuta-robotics.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 64029731DA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 15:01:33 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id a66so3430741wme.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 08:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rapyuta-robotics-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=N2iGMdr3aLMyvK61GJdGa647qY956FTeVt/0muqBQHs=;
	b=VvUVMsZck88wtuSZ+26EV7BDXDru8lKV4wRiMtlqsVbbvx9T3/BMq5ElcrA1daRKj0
	m7VXwzBS+HRrQwa6QOXy9pzRYS+l29u/c83KWJuVav8U2lQkinouFf/YqM8IQjrtIQR4
	GWIaDbVwRKmbz3JcHrOZwFnSPNU9mFj45H5i7807SkOxhz4aM4pfG1cJnVckx2khQaUc
	e17XASemSKmTwJz1ruSvs/80Bx917ceHSpJWGEFjXfIozD8XbkLsADXp++zcmv1r8RkV
	yIV3X7LRf1DCTI3H5OehMXD+jKLWT0VMXf+/jKMmczf6JqR04YLAsJQxdn3dfzNEDf9y
	tzyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=N2iGMdr3aLMyvK61GJdGa647qY956FTeVt/0muqBQHs=;
	b=U85xIGLgaetxj/pa8lhnsdRIYvmozAIU6UG2Xz0tP7XjhK0exPf/PrGJGRrqfg+aJ4
	Z4hQ7wmnW0k2nRH98fRfd0ke+fUsTOSg8OS+WGOj5MP91Rv/tWBnJhkSi9aXWz4GyFrw
	zBN2WDG025qEoI/JFBwxmXSzyAORPJpBbpV9yZEsMgMNshMp5ta55Bw6XFhH2f9Fdj6j
	cd08tOEBFlXjxd5zrN/+IGS8/qdjJYy1+M1kjrSBItrf8dleMGP1MyOIpS8qzYwIJwG2
	+FdYKMkV8X6X4aHX3ssswl5vzdGZ6ORybMIvtk3uo2NnRLSYyE8bee3I4A5PqBYUgyMo
	KBog==
X-Gm-Message-State: ALyK8tLfggyH5rl7YW2ZMTmQIrEXu52263dAeu4Uy+G9aM984qESMbGrorlg5yIGJCRBWg==
X-Received: by 10.28.92.20 with SMTP id q20mr2911553wmb.76.1466175693415;
	Fri, 17 Jun 2016 08:01:33 -0700 (PDT)
Received: from RRCH08.v.cablecom.net (77-57-36-131.dclient.hispeed.ch.
	[77.57.36.131])
	by smtp.gmail.com with ESMTPSA id s67sm3338764wmf.3.2016.06.17.08.01.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Jun 2016 08:01:32 -0700 (PDT)
From: Jose Pardeiro <jpardeiro@rapyuta-robotics.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jun 2016 17:01:17 +0200
Message-Id: <1466175677-27464-1-git-send-email-jpardeiro@rapyuta-robotics.com>
X-Mailer: git-send-email 1.9.1
Cc: Jose Pardeiro <jpardeiro@rapyuta-robotics.com>
Subject: [PATCH v2] cmake.bbclass: set the modules directory correctly
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
X-List-Received-Date: Fri, 17 Jun 2016 15:01:34 -0000

The CMake recipes contain a mismatch between the environmental variable
which defines where the Modules are installed and the location where they
actually are. This patch fixes the environmental variable to point to the
proper folder defined according to the cmake version.

Signed-off-by: Jose Pardeiro <jpardeiro@rapyuta-robotics.com>
---
 meta/classes/cmake.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index e788310..6dbac2b 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -74,7 +74,7 @@ set( ENV{QT_CONF_PATH} ${WORKDIR}/qt.conf )
 set( CMAKE_INSTALL_RPATH ${OECMAKE_RPATH} )
 
 # Use native cmake modules
-list(APPEND CMAKE_MODULE_PATH "${STAGING_DATADIR}/cmake/Modules/")
+list(APPEND CMAKE_MODULE_PATH "${STAGING_DATADIR}/cmake-\${CMAKE_MAJOR_VERSION}.\${CMAKE_MINOR_VERSION}/Modules/")
 
 # add for non /usr/lib libdir, e.g. /usr/lib64
 set( CMAKE_LIBRARY_PATH ${libdir} ${base_libdir})
-- 
1.9.1


