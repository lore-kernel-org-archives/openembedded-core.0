Received: from mail-pb0-f54.google.com ([209.85.160.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TypQc-0008Ep-1h
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 20:59:15 +0100
Received: by mail-pb0-f54.google.com with SMTP id rr4so394433pbb.27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 11:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=JaQQKf0A0La1+cqA+WPd2/eVDRK5BIOsXy0nV3SYmMo=;
	b=wt14MAKLsS+0du0QJFp3YyeC2ik18Wz0okcb1d/2PA9WKa6FvcoN5iz7LODQSschUN
	tPrgy62IU0SwQJW1gF01NllAlIdWykZb6zzdgBw+N3C8oind3dkAYBh8GGfLqovyfiCo
	iOJwu8AVZ6fMlDnEP5yYFw/scfcxPMbS3lN1UbNGLMpHVQ8aHzfa6DHl7TIYUpz3uNTK
	2AVN1PfLVW239LB5nJOpwZCYNRndJeIzI89yYu7R+xbW6EnfEugUyybh9FSD7Ysr+/5E
	Zu/Jc8rzFp7kMqQotMO8UnRa0qourcoTuRcpP0niUUBf+7TsgX7uHijABQCVjkKaJQrj
	Azcg==
X-Received: by 10.68.254.137 with SMTP id ai9mr16806638pbd.21.1359143014816;
	Fri, 25 Jan 2013 11:43:34 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id wh4sm1183319pbc.18.2013.01.25.11.43.32
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 11:43:33 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Jan 2013 20:42:53 +0100
Message-Id: <79eb34363a39748424f11dc9bda127fb42624516.1359142768.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.1
In-Reply-To: <cover.1359142768.git.Martin.Jansa@gmail.com>
References: <cover.1359142768.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1359142768.git.Martin.Jansa@gmail.com>
References: <cover.1359142768.git.Martin.Jansa@gmail.com>
Subject: [PATCH 6/7] eglibc-package: remove infodir/dir if it exists
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
X-List-Received-Date: Fri, 25 Jan 2013 19:59:17 -0000

* fixes error in world-image build:
 * check_data_file_clashes: Package eglibc-doc wants to install file
   rootfs/usr/share/info/dir
   But that file is already provided by package  * gcc-doc

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/eglibc/eglibc-package.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index 79c43f1..dae5d4f 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -80,6 +80,10 @@ do_install_append () {
 		sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,' -e '2s,exec.*perl,exec ${USRBINPATH}/env perl,' ${D}${bindir}/mtrace
 	fi
 	rm -rf ${D}${includedir}/rpcsvc/rquota*
+	# Info dir listing isn't interesting at this point so remove it if it exists.
+	if [ -e "${D}${infodir}/dir" ]; then
+		rm -f ${D}${infodir}/dir
+	fi
 }
 
 do_install_locale () {
-- 
1.8.1.1



