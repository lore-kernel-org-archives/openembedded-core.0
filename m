Return-Path: <Matthew.Zeng@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9A82A60677
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 20:06:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 00UK6rbj007886
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 12:06:53 -0800 (PST)
Received: from mzeng (128.224.141.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Thu, 30 Jan 2020 12:06:52 -0800
User-agent: mu4e 1.3.6; emacs 28.0.50
From: "Mingde (Matthew) Zeng" <matthew.zeng@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Jan 2020 15:06:31 -0500
Message-ID: <87ftfw7lq0.fsf@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.141.67]
Subject: [PATCH] glib-2.0: add -dev dependencies to fix ptest failures
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
X-List-Received-Date: Fri, 31 Jan 2020 09:28:00 -0000
Content-Type: text/plain

There are a number of ptest failures due to glib-genmarshal, glib-mkenums
and couple other executables not in the image. Since these
executables are in FILES_${PN}-dev, we add ${PN}-dev to ptest RDEPENDS.

When starting a glib ptest but decided to Ctrl-c interrupt midway,
./run-ptest cannot be restarted unless running `userdel glib2-test`
manually. Therefore adding a check prior to ptest will ensure the
ptest can be restarted.

Signed-off-by: Matthew Zeng<Matthew.Zeng@windriver.com>
---
 meta/recipes-core/glib-2.0/glib-2.0/run-ptest | 3 +++
 meta/recipes-core/glib-2.0/glib.inc           | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/run-ptest b/meta/recipes-core/glib-2.0/glib-2.0/run-ptest
index fc50082c8e..7a231b514b 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/run-ptest
+++ b/meta/recipes-core/glib-2.0/glib-2.0/run-ptest
@@ -1,6 +1,9 @@
 #! /bin/sh

 set -eux
+if id -u glib2-test; then
+   userdel glib2-test
+fi
 useradd glib2-test
 su glib2-test -c 'gnome-desktop-testing-runner glib'
 userdel glib2-test
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index f4aff297e5..7204fc908a 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -138,6 +138,9 @@ CODEGEN_PYTHON_RDEPENDS_mingw32 = ""

 RDEPENDS_${PN}-codegen += "${CODEGEN_PYTHON_RDEPENDS}"

+RDEPENDS_${PN}-ptest += "${PN}-dev"
+INSANE_SKIP_${PN}-ptest += "dev-deps"
+
 RDEPENDS_${PN}-ptest += "\
             coreutils \
             libgcc \
--
2.24.0

