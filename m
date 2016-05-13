Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id A7B5273212
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 16:47:02 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id zy2so10477892pac.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 09:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=CFZ4sO8aSREE9ADLImy8gXA4+z+Y/Kxw2Rq1wOJWEvw=;
	b=yBiKABduKulli+PUQnW2k3nepchgsDcL3ajzHL8235jBJsIirgg0G73sm2s+t6q4hm
	sJgM2aVOFTDIZ2bmeJFZqDzW2kXRv59QTkItblrqaWfL870qeQJuA4wHRAEt4YPUXuNY
	ArFDsSFShA0prgG89U2VtOPwoZRHyuqvBm/qQ3DH6RxqcoWFTs3HkKnKUVKa5zKzoyi2
	R66I+rpqOxr6rJEXFEpAPy7dgNNI1QVBd8MlmE3oYIfxHZmkAmQbOLY81q7NSfwMpGBr
	oHfltfpdDGcyuawgNrZnbROXZOC+z0p2X5BtMICyzyYiDszgvTo+qFr7dLeEk3/6u+80
	g3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=CFZ4sO8aSREE9ADLImy8gXA4+z+Y/Kxw2Rq1wOJWEvw=;
	b=S8p+fkMXHxz9Zzv20+PySNCDe6EfOgaKVuXIuSAMWYCgaIVJjQPuSba2PoLT4EYYcT
	/ryUfMQ0Q2/l3B+RMn2jL8DT5ybYOhvRypGPYNP3LaksbKrkhbJp4KQmv5NoKs2uXIG3
	BXv3sP5EcqMhPrWVyQ965gFIMCoqfyeDFfvsl44YawIz1lFZhDbhEvSlpNw4JpfNfh26
	MPjdtE6j75WF2vFUk+05D4AYKRukOtUhKHWuHT/C5cZewojoBCTXs3lJiq9E1HgxScKR
	f+8OaEGJPdSgObVu9L43gvsGRd9XYv3LCbytCefA61CtkAwPOY2jO6dbZtCPR5CM151V
	y95g==
X-Gm-Message-State: AOPr4FUxMGJGCN5Qd5HqTSnIVmklUDTk41jmVIaBLatD7QpYbVXUWLwVWCHZ1jBMwbk6FA==
X-Received: by 10.67.15.9 with SMTP id fk9mr24223177pad.77.1463158023698;
	Fri, 13 May 2016 09:47:03 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	uw2sm28725174pac.10.2016.05.13.09.47.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 May 2016 09:47:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 May 2016 09:46:50 -0700
Message-Id: <835021c9b331284213c201dbf4b8a2c61b6c9891.1463157783.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <fa9c2d513cff678eebb231d4cf5991ea37061b34.1463157783.git.raj.khem@gmail.com>
References: <fa9c2d513cff678eebb231d4cf5991ea37061b34.1463157783.git.raj.khem@gmail.com>
In-Reply-To: <cover.1463157783.git.raj.khem@gmail.com>
References: <cover.1463157783.git.raj.khem@gmail.com>
Subject: [PATCH 2/6] python-native: Point to expat in native sysroot and add missing dep on expat-native
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
X-List-Received-Date: Fri, 13 May 2016 16:47:06 -0000

This fixes inconsistency where expat dependency is
then depending upon build host having it or not having it

Fixes errors like
WARNING: renaming "pyexpat" since importing it failed: build/lib.linux-x86_64-2.7/pyexpat.so: undefined symbol: XML_SetCommentHandler

also reported here
https://dev.openwrt.org/ticket/20087

This work due to the fact that we use -isystem pointing to native sysroot
so the search order of native includedir is moved after buildhosts system
includdirs. Moment we replace it with -I, build falls apart

This also fixes the error

Caught exception: <type 'exceptions.ImportError'> ImportError('No module named _elementtree',)

where gobject-introspection-native fails to find _elementtree
which is only compiled if expat is available

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/python/python-native_2.7.11.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python-native_2.7.11.bb b/meta/recipes-devtools/python/python-native_2.7.11.bb
index 4c204a4..abb69fc 100644
--- a/meta/recipes-devtools/python/python-native_2.7.11.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.11.bb
@@ -1,7 +1,7 @@
 require python.inc
 
 EXTRANATIVEPATH += "bzip2-native"
-DEPENDS = "openssl-native bzip2-replacement-native zlib-native readline-native sqlite3-native"
+DEPENDS = "openssl-native bzip2-replacement-native zlib-native readline-native sqlite3-native expat-native"
 PR = "${INC_PR}.1"
 
 SRC_URI += "\
@@ -27,7 +27,7 @@ inherit native
 
 RPROVIDES += "python-distutils-native python-compression-native python-textutils-native python-codecs-native python-core-native python-unittest-native"
 
-EXTRA_OECONF_append = " --bindir=${bindir}/${PN}"
+EXTRA_OECONF_append = " --bindir=${bindir}/${PN} --with-system-expat=${STAGING_DIR_HOST}"
 
 EXTRA_OEMAKE = '\
   BUILD_SYS="" \
-- 
2.8.2


