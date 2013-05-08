Received: from mail-pb0-f54.google.com ([209.85.160.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UZwaU-0004it-S3
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 07:07:16 +0200
Received: by mail-pb0-f54.google.com with SMTP id rr4so933295pbb.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2013 21:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=ZyUJt+GhiBp8fNsLA3rtwcGwSK/+HAXX8k1/AWZHCPI=;
	b=eDZhPfmSHHbKOzsvDv0HKvd/k02bsr8n1mM+0DiCAplhlTFvVHKXPhE3sz5MdwfMIz
	TjuFWor0Azzcrkfrn4/5QzN+cr7W2xPAzyiG+m1AExNcoPQV6AxcC+yFdvjviOJLtFtX
	VFzvDjT1BPqO/+Lx7mgT97pW0EhiTbCBIpu4gESa0WU/mDncOdBVbeIjPVtXmGkJ9pXi
	T+UJA667bDjmS85GrtAyMRKm+ovZ4uGETbxsM/Yv4fSWznXJoJ1t+AwUyYi9FVid1Woo
	P65iImQOYI4fScvrljMdZXIm/MtrwBIl7cswXe2xYqVvP9eG2dJJHZG/DFpLv5vlufP6
	aQ2A==
X-Received: by 10.68.223.10 with SMTP id qq10mr5688804pbc.57.1367988524384;
	Tue, 07 May 2013 21:48:44 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	aa8sm33230558pad.14.2013.05.07.21.48.42 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 07 May 2013 21:48:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2013 21:47:16 -0700
Message-Id: <1367988436-23974-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] gcc-configure-cross.inc: Remove info generation
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
X-List-Received-Date: Wed, 08 May 2013 05:07:16 -0000

Some distros have newer makeinfo which does not go well with
anything below gcc 4.8, this fix avoids regenerating info files

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-configure-cross.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-configure-cross.inc b/meta/recipes-devtools/gcc/gcc-configure-cross.inc
index 243ee55d..db7980b 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-cross.inc
@@ -11,6 +11,9 @@ EXTRA_OECONF_PATHS = " \
                       --with-sysroot=${STAGING_DIR_TARGET} \
                       --with-build-sysroot=${STAGING_DIR_TARGET}"
 
+do_configure_prepend () {
+	sed -i 's/BUILD_INFO=info/BUILD_INFO=/' ${S}/gcc/configure
+}
 do_compile_prepend () {
 	export CC="${BUILD_CC}"
 	export AR_FOR_TARGET="${TARGET_SYS}-ar"
-- 
1.8.2.2



