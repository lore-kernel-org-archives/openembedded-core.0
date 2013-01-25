Received: from mail-pb0-f46.google.com ([209.85.160.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TypQQ-0008Az-K5
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 20:58:58 +0100
Received: by mail-pb0-f46.google.com with SMTP id uo15so391587pbc.19
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 11:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=w0G/z9CJamgPl6PNc9X3qGIRisQNhhxRELew32w5mm8=;
	b=Pz8iak5mLRwF+fVLtejs5yEiYDguHmMGvCT3iYMmZJ/JrjpCsdIgLKD7G8M/b6wIoV
	dSpXwsCPuObC3EnYrjkV2VE9n5N6pM15Sip7lnim6oCbqZAn8qNq9aXf/pmzBwl8K4bX
	0D5EvUsWZH/uUrhn+CqbKYMhu+Hz/O0OMfo8mewpPp57B83LqmZ+eseE/M4vLnJe6OUQ
	WqTNiUQEpgBnrQJsz0ZZpRqwylbFeKyD/sEZwQIkKVCnG+Ua2rGxMOXHlv2iNfN1G52Z
	vECaNlvBzhbOK0mYX3lDyXd0rcuA1wZwyymIQBlYuLp7VeA0102pzM0TdpQAwyzkP4WB
	ABGw==
X-Received: by 10.68.193.199 with SMTP id hq7mr16837003pbc.3.1359143003368;
	Fri, 25 Jan 2013 11:43:23 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id x2sm1401336paw.8.2013.01.25.11.43.20
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 11:43:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Jan 2013 20:42:51 +0100
Message-Id: <0f39a188698a35354e59b32ed5d4f824438a3add.1359142768.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.1
In-Reply-To: <cover.1359142768.git.Martin.Jansa@gmail.com>
References: <cover.1359142768.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1359142768.git.Martin.Jansa@gmail.com>
References: <cover.1359142768.git.Martin.Jansa@gmail.com>
Subject: [PATCH 4/7] gcc-configure-runtime: always remove info/dir
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
X-List-Received-Date: Fri, 25 Jan 2013 19:58:58 -0000

* move libgomp.info removal also outside that for cycle, can be removed outside if exists
* also use infodir variable instead of ${datadir}/info

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-configure-runtime.inc | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
index 1c9155f..a9f77d9 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
@@ -41,12 +41,10 @@ do_install () {
 	for d in ${RUNTIMETARGET}; do
 		cd ${B}/$target/$d/
 		oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/$target/$d/ install
-		if [ "$d" = "libgomp" ]; then
-			rm -rf ${D}${datadir}/info/libgomp.info ${D}${datadir}/info/dir
-			rmdir --ignore-fail-on-non-empty -p ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/finclude
-			rmdir --ignore-fail-on-non-empty -p ${D}${datadir}/info
-		fi
 	done
+	rm -rf ${D}${infodir}/libgomp.info ${D}${infodir}/dir
+	rmdir --ignore-fail-on-non-empty -p ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/finclude
+	rmdir --ignore-fail-on-non-empty -p ${D}${infodir}
 	chown -R root:root ${D}
 }
 
-- 
1.8.1.1



