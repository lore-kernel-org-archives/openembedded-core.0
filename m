Return-Path: <liu.ming50@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id F221B7303B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 07:38:10 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id z61so370152wrc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 23:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=6YZwxxA+MWmnwyFib7s40rD7xc93lVO19C9gzvIG6gU=;
	b=Gsll5D78+OipWkUkEheQe8tnDlU49nP/sWQywqEzYmG22d++SJS+ZvCbsIOGO88yqr
	XNSyNMAJXbNY8PVSooBzCcrpBK6qDRt90KKapP6RMBALfUvHVgi+dvAaeq3KC1m8JQ69
	vFOaX93qPdMS5HXftG+BkGWs6E59qjVPns3YnORjf68hkiUQQ9SiepskclsyKPBwAwgy
	WwgkdR/NVcNWoLYpEhJVrqAXr2GmGasg/MtnBMxorr163dYuxDbD2LMfVtdhAW6MZSgX
	zJ13+M+2y6vZ9Bfd0tTZF/LS34wLHZMB4Bi3aEkf5MFP6KQV6BpOmt1fMetHJGSp4TzJ
	sZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6YZwxxA+MWmnwyFib7s40rD7xc93lVO19C9gzvIG6gU=;
	b=fRTKZ7d8K2FkT064k2nfwq9riQhFG/249Iwi0o/aw7pdsfP6Ss+yvTissIKXOykOSI
	g5jy2A9EI/QsLqqbJxgBjZgscft8/x/5IoFBBtqteTeT8I0bc4zKfzWVBB4xwkdE80Xf
	M5WgvXYIVwazwO83wGvVAWdAnP7WkawivDL8w1mOsXr/C0Cu1+LKZ5YOCNJbSv6gqKrR
	CVtdOtgWg2XH9eChkVrIMb75jTjpxwIyy2nct4+UBspP63gg+TdT6Rw+d3na3XOhnRUb
	/iV7It0lOGle2NbV8cu9TE1S5FWmAVll6sn4HCAhLRq1oXns1OHVM1rvXtpmkH2CLJg6
	YzhA==
X-Gm-Message-State: AMke39nMsz1d6X7w422Ewsz97mfQeu9S1orcNkmimynLL7dPKhfm8kzH6b6By6HBONFf6g==
X-Received: by 10.223.176.70 with SMTP id g6mr21974232wra.12.1487749091621;
	Tue, 21 Feb 2017 23:38:11 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([117.136.38.175])
	by smtp.gmail.com with ESMTPSA id p49sm607741wrb.10.2017.02.21.23.38.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Feb 2017 23:38:11 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2017 08:37:50 +0100
Message-Id: <1487749070-3660-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] python3-native: extend RPROVIDES
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
X-List-Received-Date: Wed, 22 Feb 2017 07:38:11 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

Let RPROVIDES include identical packages as listed in PROVIDES of
python-3.5-manifest.inc, to satisfy the native runtime requirement
on python3-native.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 .../python/python3-native_3.5.2.bb                 | 94 ++++++++++++++++------
 1 file changed, 68 insertions(+), 26 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-native_3.5.2.bb b/meta/recipes-devtools/python/python3-native_3.5.2.bb
index bf4e686..5cb4ab8 100644
--- a/meta/recipes-devtools/python/python3-native_3.5.2.bb
+++ b/meta/recipes-devtools/python/python3-native_3.5.2.bb
@@ -41,32 +41,74 @@ DEPENDS = "openssl-native bzip2-replacement-native zlib-native readline-native s
 
 inherit native
 
-RPROVIDES += " \
-    python3-compression-native \
-    python3-core-native \
-    python3-distutils-native \
-    python3-datetime-native \
-    python3-enum-native \
-    python3-terminal-native \
-    python3-email-native \
-    python3-importlib-native \
-    python3-io-native \
-    python3-json-native \
-    python3-lang-native \
-    python3-misc-native \
-    python3-modules-native \
-    python3-netclient-native \
-    python3-netserver-native \
-    python3-numbers-native \
-    python3-pkgutil-native \
-    python3-pprint-native \
-    python3-re-native \
-    python3-shell-native \
-    python3-subprocess-native \
-    python3-textutils-native \
-    python3-threading-native \
-    python3-unittest-native \
-"
+RPROVIDES += "python3-2to3-native \
+              python3-argparse-native \
+              python3-asyncio-native \
+              python3-audio-native \
+              python3-codecs-native \
+              python3-compile-native \
+              python3-compression-native \
+              python3-core-native \
+              python3-crypt-native \
+              python3-ctypes-native \
+              python3-curses-native \
+              python3-datetime-native \
+              python3-db-native \
+              python3-debugger-native \
+              python3-dev-native \
+              python3-difflib-native \
+              python3-distutils-native \
+              python3-distutils-staticdev-native \
+              python3-doctest-native \
+              python3-email-native \
+              python3-enum-native \
+              python3-fcntl-native \
+              python3-gdbm-native \
+              python3-html-native \
+              python3-idle-native \
+              python3-image-native \
+              python3-importlib-native \
+              python3-io-native \
+              python3-json-native \
+              python3-lang-native \
+              python3-logging-native \
+              python3-mailbox-native \
+              python3-math-native \
+              python3-mime-native \
+              python3-mmap-native \
+              python3-multiprocessing-native \
+              python3-netclient-native \
+              python3-netserver-native \
+              python3-numbers-native \
+              python3-pickle-native \
+              python3-pkgutil-native \
+              python3-pprint-native \
+              python3-profile-native \
+              python3-pydoc-native \
+              python3-re-native \
+              python3-readline-native \
+              python3-reprlib-native \
+              python3-resource-native \
+              python3-selectors-native \
+              python3-shell-native \
+              python3-signal-native \
+              python3-smtpd-native \
+              python3-sqlite3-native \
+              python3-sqlite3-tests-native \
+              python3-stringold-native \
+              python3-subprocess-native \
+              python3-syslog-native \
+              python3-terminal-native \
+              python3-tests-native \
+              python3-textutils-native \
+              python3-threading-native \
+              python3-tkinter-native \
+              python3-typing-native \
+              python3-unittest-native \
+              python3-unixadmin-native \
+              python3-xml-native \
+              python3-xmlrpc-native \
+             "
 
 EXTRA_OECONF_append = " --bindir=${bindir}/${PN} --without-ensurepip"
 
-- 
1.9.1


