Received: from exprod7og122.obsmtp.com ([64.18.2.22])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Fabien.Proriol@jdsu.com>) id 1TO96I-0007sj-Ua
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Oct 2012 17:30:35 +0200
Received: from MX3.jdsu.com ([141.169.254.5]) (using TLSv1) by
	exprod7ob122.postini.com ([64.18.6.12]) with SMTP
	ID DSNKUH16fhuQp5vWsS1lWwRCIiJcZQh6KxHX@postini.com;
	Tue, 16 Oct 2012 08:17:20 PDT
Received: from EUEXHTCA01.ds.jdsu.net (10.237.69.11) by MX3.jdsu.com
	(141.169.254.5) with Microsoft SMTP Server (TLS) id 8.3.213.0;
	Tue, 16 Oct 2012 16:32:31 +0200
Received: from EUEXMB01.ds.jdsu.net ([fe80::942f:1810:27a2:359d]) by
	EUEXHTCA01.ds.jdsu.net ([fe80::95ae:4a0b:5ca2:580f%11]) with mapi id
	14.02.0298.004; Tue, 16 Oct 2012 16:32:31 +0200
From: Fabien Proriol <Fabien.Proriol@jdsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] SDK: allow SDK path of various level
Thread-Index: AQHNq6sSHb7VENo72UOvqJp1Wc1e8Q==
Date: Tue, 16 Oct 2012 14:32:30 +0000
Message-ID: <1350397813-20977-1-git-send-email-fabien.proriol@jdsu.com>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.69.13]
MIME-Version: 1.0
Cc: Fabien Proriol <Fabien.Proriol@jdsu.com>
Subject: [PATCH] SDK: allow SDK path of various level
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
X-List-Received-Date: Tue, 16 Oct 2012 15:30:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

In the previous version, tar extraction use the --strip-component
option with "4" hard coded value.
If we set another SDKPATH, with a different depth, the sdk installation
fails.

This patch computes the level from the SDKPATH value.

Signed-off-by: Fabien Proriol <fabien.proriol@jdsu.com>
---
 meta/classes/populate_sdk_base.bbclass |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate=
_sdk_base.bbclass
index 6eb6726..971adfc 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -117,6 +117,7 @@ fakeroot create_shar() {
 #!/bin/bash
=20
 DEFAULT_INSTALL_DIR=3D"${SDKPATH}"
+COMPONENTS_LEN=3D$(echo ".${SDKPATH}" | sed "s/\// /g" | wc -w)
=20
 printf "Enter target directory for SDK (default: $DEFAULT_INSTALL_DIR): "
 read target_sdk_dir
@@ -153,7 +154,7 @@ fi
 payload_offset=3D$(($(grep -na -m1 "^MARKER:$" $0|cut -d':' -f1) + 1))
=20
 printf "Extracting SDK..."
-tail -n +$payload_offset $0| tar xj --strip-components=3D4 -C $target_sdk_=
dir
+tail -n +$payload_offset $0| tar xj --strip-components=3D$COMPONENTS_LEN -=
C $target_sdk_dir
 echo "done"
=20
 printf "Setting it up..."
--=20
1.7.8.6


