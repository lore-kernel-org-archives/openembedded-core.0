Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id F07946A467
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2013 12:08:20 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	rA8C8HHw010849
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Nov 2013 13:08:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1383912499;
	bh=/6HlC7nvg9qYZEq5DhSuhzP6p7s4l/sF7R92AJLVLRw=;
	h=From:To:Cc:Subject:Date:Message-Id:Sender;
	b=Dkhr8PjXfRdH85GDBTFTVVoxPGlZMsMX00gjwngPrSIUraj8J4+BrzigkLWvH8rvI
	TCNvxopwucex5dTub2G77evzA5owROKp36YFWddQ78FxzLw5UF01By/dcWOpEVSJ0N
	L5NvsudA193PHFeK6lsiMfXaIG16S4l1UBE330hM=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id rA8C8Bas031667
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 8 Nov 2013 13:08:12 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1VekrD-00062L-Pv; Fri, 08 Nov 2013 13:08:11 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Nov 2013 13:07:57 +0100
Message-Id: <1383912477-23166-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.8.3.1
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.9575
X-Spam-Score: -3.9
X-Spam-Level: ---
X-Spam-Tests: AWL,DKIM_ADSP_ALL,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.74
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] vala: cleanup DEPENDS
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
X-List-Received-Date: Fri, 08 Nov 2013 12:08:21 -0000

Patch cleans up and fixes dependencies of 'vala' in the following way:

* remove deps on 'gtk+' + 'dbus'; these packages are not required and
  'gkt+' is high barrier preventing using 'vala' on headless systems

* 'bison-native' is required both on native and target builds; 'DEPENDS'
  and 'DEPENDS_virtclass-native' and 'DEPENDS' can be merged hence

* 'flex-native' is required

* although 'xsltproc' (from libxslt-native) is optional, a dependency
  on it was added to make builds deterministic.  An alternative method
  might be 'EXTRA_OECONF += "ac_cv_path_XSLTPROC=:"' but this is error
  prone as it depends on internals of the build system.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/recipes-devtools/vala/vala.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/vala/vala.inc
index a8927d7..a51ceb4 100644
--- a/meta/recipes-devtools/vala/vala.inc
+++ b/meta/recipes-devtools/vala/vala.inc
@@ -1,9 +1,8 @@
 DESCRIPTION = "Vala is a C#-like language dedicated to ease GObject programming. \
 Vala compiles to plain C and has no runtime environment nor penalities whatsoever."
 SECTION = "devel"
-DEPENDS = "glib-2.0 dbus gtk+"
+DEPENDS = "bison-native flex-native libxslt-native glib-2.0"
 BBCLASSEXTEND = "native"
-DEPENDS_virtclass-native = "bison-native glib-2.0-native dbus-native"
 HOMEPAGE = "http://vala-project.org"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
-- 
1.8.3.1


