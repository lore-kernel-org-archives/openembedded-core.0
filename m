Return-Path: <liu.ming50@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4DF4672FD3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 07:34:47 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id z61so361198wrc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 23:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=KCwf8MhPIdBRWq0GCtuYxIabSglEC6S/rDSY3AGasI4=;
	b=qXcU3jexdykl8ewLgoxvZeIaRno7I/UvGPUOwzIcMQ67WsIjLpFpg90KtJ+HTDQkcE
	47wOoEF2f9+ZPl67vjPGDVzdpAaXPWxoytnpGzX2SKO4G4Ize36r3YpOAjrZ+5dXTq7M
	Rgo78aV9wNtV8ikCoYqDDhroTrXYwSkKaBrEu+sgZwBLHcTaVVis4WY6SCjPbtDkoCjW
	VfmLUoWDUXTafDIHEuCshlxMCEaJ1QsG2SRvmvmVgY5s7dWFrm0ARoSCO6VeZ+kc27Rv
	A1HYiDS3OaMvlzdAohX1EABbQ4OfO3Y/XucFPxMPiqwM6bBgWMGc/qoN7dpiRCk3Lib9
	op9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KCwf8MhPIdBRWq0GCtuYxIabSglEC6S/rDSY3AGasI4=;
	b=cLZdQlZxSaRfitn55bHxZgxCmadMxF/495MiHlK0k9PlPem8vXahF+EwgMGnhPOTl1
	lh8tcFITZgn0I228Ry/HidQB5G/v2GrjA+UZbogXfyLRpH5Pf6K7P64K8luMyqbKe2Nm
	TsbRAmMK5ugbc4GmorRt8NvQGgjoOqVx8Ik66OJoHAWZwxcTUAoB7RwG82+txsbItEtL
	dbe3cCnuodF3+c5Xe63EtFLuNQCcNgH6SGNC2QPZUdQhlO8VyZVuVPOzBfpo3sAXFe++
	TRPyZprxX47bv5uqfnjAjDImPHaJfJBFeK2+3v3jJA2DRgBkqgu8cH6AOYNjO36o8p/S
	N5ng==
X-Gm-Message-State: AMke39l7N6lWWyKt4yhsNxQFf30hhCaiODIS1vHmriX6NvPyuMkMJ3kzN+O63Lnq02H45g==
X-Received: by 10.223.136.168 with SMTP id f37mr22288677wrf.98.1487748888828; 
	Tue, 21 Feb 2017 23:34:48 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([117.136.38.175])
	by smtp.gmail.com with ESMTPSA id b51sm577649wrd.39.2017.02.21.23.34.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Feb 2017 23:34:47 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2017 08:34:20 +0100
Message-Id: <1487748860-2427-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] python-native: extend RPROVIDES
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
X-List-Received-Date: Wed, 22 Feb 2017 07:34:50 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

Let RPROVIDES include identical packages as listed in PROVIDES of
python-2.7-manifest.inc, to satisfy the native runtime requirement
on python-native.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 .../python/python-native_2.7.12.bb                 | 70 +++++++++++++++++++++-
 1 file changed, 69 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python-native_2.7.12.bb b/meta/recipes-devtools/python/python-native_2.7.12.bb
index de83cbd..7819ab6 100644
--- a/meta/recipes-devtools/python/python-native_2.7.12.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.12.bb
@@ -25,7 +25,75 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/${PN}:"
 
 inherit native
 
-RPROVIDES += "python-distutils-native python-compression-native python-textutils-native python-codecs-native python-core-native python-unittest-native"
+RPROVIDES += "python-2to3-native \
+              python-argparse-native \
+              python-audio-native \
+              python-bsddb-native \
+              python-codecs-native \
+              python-compile-native \
+              python-compiler-native \
+              python-compression-native \
+              python-contextlib-native \
+              python-core-native \
+              python-crypt-native \
+              python-ctypes-native \
+              python-curses-native \
+              python-datetime-native \
+              python-db-native \
+              python-debugger-native \
+              python-dev-native \
+              python-difflib-native \
+              python-distutils-native \
+              python-distutils-staticdev-native \
+              python-doctest-native \
+              python-email-native \
+              python-fcntl-native \
+              python-gdbm-native \
+              python-hotshot-native \
+              python-html-native \
+              python-idle-native \
+              python-image-native \
+              python-importlib-native \
+              python-io-native \
+              python-json-native \
+              python-lang-native \
+              python-logging-native \
+              python-mailbox-native \
+              python-math-native \
+              python-mime-native \
+              python-mmap-native \
+              python-multiprocessing-native \
+              python-netclient-native \
+              python-netserver-native \
+              python-numbers-native \
+              python-pickle-native \
+              python-pkgutil-native \
+              python-plistlib-native \
+              python-pprint-native \
+              python-profile-native \
+              python-pydoc-native \
+              python-re-native \
+              python-readline-native \
+              python-resource-native \
+              python-robotparser-native \
+              python-shell-native \
+              python-smtpd-native \
+              python-sqlite3-native \
+              python-sqlite3-tests-native \
+              python-stringold-native \
+              python-subprocess-native \
+              python-syslog-native \
+              python-terminal-native \
+              python-tests-native \
+              python-textutils-native \
+              python-threading-native \
+              python-tkinter-native \
+              python-unittest-native \
+              python-unixadmin-native \
+              python-xml-native \
+              python-xmlrpc-native \
+              python-zlib-native \
+             "
 
 EXTRA_OECONF_append = " --bindir=${bindir}/${PN} --with-system-expat=${STAGING_DIR_HOST}"
 
-- 
1.9.1


