Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D74786D3AE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2013 18:28:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9OIS20o027239
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2013 11:28:03 -0700 (PDT)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.103]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.02.0342.003;
	Thu, 24 Oct 2013 11:28:03 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [v2][PATCH 1/1] vala.bbclass: add dependency on vala
Thread-Index: AQHOuumTJmtu258waUevbwOalfUjppoEVlYA
Date: Thu, 24 Oct 2013 18:28:03 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF8455BBBF3C@ALA-MBB.corp.ad.wrs.com>
References: <1380221559-25585-1-git-send-email-jslater@windriver.com>
In-Reply-To: <1380221559-25585-1-git-send-email-jslater@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.152.80]
MIME-Version: 1.0
Subject: FW: [v2][PATCH 1/1] vala.bbclass: add dependency on vala
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
X-List-Received-Date: Thu, 24 Oct 2013 18:28:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I sent the following a while ago and haven't seen any comments,
but I think it parallels the suggestions made about v1.

The patch has not been put into oe-core master.

Joe


-----Original Message-----
From: Joe Slater [mailto:jslater@windriver.com]=20
Sent: Thursday, September 26, 2013 11:53 AM
To: openembedded-core@lists.openembedded.org
Cc: MacLeod, Randy; Slater, Joseph
Subject: [v2][PATCH 1/1] vala.bbclass: add dependency on vala

This class points the inheritor, if it is a target,
to directories in the target sysroot, so we want to
be sure the .vapi files are there.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/classes/vala.bbclass |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/classes/vala.bbclass b/meta/classes/vala.bbclass
index c7db08c..3b70a04 100644
--- a/meta/classes/vala.bbclass
+++ b/meta/classes/vala.bbclass
@@ -1,9 +1,11 @@
 # Vala has problems with multiple concurrent invocations
 PARALLEL_MAKE =3D ""
=20
-# Vala needs vala-native
-DEPENDS +=3D "vala-native"
-DEPENDS_virtclass-native +=3D "vala-native"
+# Everyone needs vala-native and targets need vala, too,
+# because that is where target builds look for .vapi files.
+#
+VALADEPENDS_class-target =3D "vala"
+DEPENDS_append =3D " vala-native ${VALADEPENDS}"
=20
 # Our patched version of Vala looks in STAGING_DATADIR for .vapi files
 export STAGING_DATADIR
--=20
1.7.3.4


