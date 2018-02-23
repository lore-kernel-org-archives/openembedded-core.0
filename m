Return-Path: <andre.draszik@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3CC29786DD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 14:50:15 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id l12so10032905ioc.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 06:50:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5iZXezW33OPuQOjRj3Utf44aPxiXQuByL6tQoU3qsBM=;
	b=VsZ8yG8r/g4+jG7VDhfVlrJdSyEarIIfrFdQ8W55Qxe2hPQkvkdWZwd4juB6AspsH4
	YiUfFD7Q52TDYuld14YW8vJsM19AvCmCZK2bN/Fb7MgCQnkLuWhVejlIkOGuOWB0BeRd
	FYXGUgwFpRXWGT+otwDaBd4yenjwR1aoo8hVbGufQqHFKgWIilE9y+PGMzx3OuOZolqI
	3TJ1LgcFbdhSNljGJnfQhFiIySGYgh5aHw8eAAOpF3s4ayM9jP3hx7ITE7Nk55P54r01
	FtG71k3LVRin1DskUeq5H9KYUtqpioDbH3aRoZt2HOqoOCoEzoUWB5qxk2rY2y7BIss6
	Tncg==
X-Gm-Message-State: APf1xPAgEINwsbmouxtu7OyqlsURFpKskteE+cqnDWG5pjhMEY2gsrCp
	jOgazVswikjcAvLpWo3mlKjLx/Z9
X-Google-Smtp-Source: AG47ELuhXs3MRCV539A0v81UchMpV6hYifQg4zKVPwRKUcxz3VzmRUyDr5dAl4d8kzLYEAvzNDGskQ==
X-Received: by 10.107.28.66 with SMTP id c63mr2093707ioc.247.1519397416978;
	Fri, 23 Feb 2018 06:50:16 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	t76sm1698320iof.87.2018.02.23.06.50.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Feb 2018 06:50:16 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Feb 2018 14:50:13 +0000
Message-Id: <20180223145013.755-1-git@andred.net>
X-Mailer: git-send-email 2.16.1
MIME-Version: 1.0
Subject: [PATCH] cmake: refactor compile and install for easier re-use
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
X-List-Received-Date: Fri, 23 Feb 2018 14:50:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

cmake_do_compile() and cmake_do_install() basically do the
same, except they use a different --target, and at the
moment this is copy/pasted code with a minor modification.

Other recipes which e.g. might want to support compilation
as part of ptest have to do the same. This is a bit
inconvenient.

By factoring out all of this into a common helper,
cmake_runcmake_build(), this is easily re-used. An
(imaginary) recipe can compile ptest support simply by
using
  cmake_runcmake_build --target buildtest-TESTS
(assuming such a build target exists).

Also, this now is very similar to oe_runmake().

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta/classes/cmake.bbclass | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index d60dad8d66..fcfd5dda4f 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -159,14 +159,17 @@ cmake_do_configure() {
 	  -Wno-dev
 }
 
+cmake_runcmake_build() {
+	bbnote ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '${B}' "$@" -- ${EXTRA_OECMAKE_BUILD}
+	eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '${B}' "$@" -- ${EXTRA_OECMAKE_BUILD}
+}
+
 cmake_do_compile()  {
-	bbnote VERBOSE=1 cmake --build '${B}' --target ${OECMAKE_TARGET_COMPILE} -- ${EXTRA_OECMAKE_BUILD}
-	VERBOSE=1 cmake --build '${B}' --target ${OECMAKE_TARGET_COMPILE} -- ${EXTRA_OECMAKE_BUILD}
+	cmake_runcmake_build --target ${OECMAKE_TARGET_COMPILE}
 }
 
 cmake_do_install() {
-	bbnote DESTDIR='${D}' cmake --build '${B}' --target ${OECMAKE_TARGET_INSTALL} -- ${EXTRA_OECMAKE_BUILD}
-	DESTDIR='${D}' cmake --build '${B}' --target ${OECMAKE_TARGET_INSTALL} -- ${EXTRA_OECMAKE_BUILD}
+	DESTDIR='${D}' cmake_runcmake_build --target ${OECMAKE_TARGET_INSTALL}
 }
 
 EXPORT_FUNCTIONS do_configure do_compile do_install do_generate_toolchain_file
-- 
2.16.1


