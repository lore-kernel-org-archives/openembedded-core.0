Return-Path: <frieder.schrempf@kontron.de>
X-Greylist: delayed 585 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 12 Sep 2019 15:12:01 UTC
Received: from skedge03.snt-world.com (skedge03.snt-world.com [91.208.41.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8F3CC7DD9F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2019 15:12:01 +0000 (UTC)
Received: from sntmail12r.snt-is.com (unknown [10.203.32.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by skedge03.snt-world.com (Postfix) with ESMTPS id 52BDD67A64E;
	Thu, 12 Sep 2019 17:02:16 +0200 (CEST)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail12r.snt-is.com
	(10.203.32.182) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5;
	Thu, 12 Sep 2019 17:02:15 +0200
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
	sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
	15.01.1713.004; Thu, 12 Sep 2019 17:02:15 +0200
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [warrior][PATCH] uboot: fixes to uboot-extlinux-config attribute
	values
Thread-Index: AQHVaXsQ4FzNqdi46kOze0zy2ww9cQ==
Date: Thu, 12 Sep 2019 15:02:15 +0000
Message-ID: <20190912150214.29180-1-frieder.schrempf@kontron.de>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.17.1
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: 52BDD67A64E.AD354
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
	Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, wpage@polysync.io
X-Spam-Status: No
Cc: Will Page <wpage@polysync.io>
Subject: [warrior][PATCH] uboot: fixes to uboot-extlinux-config attribute values
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
X-List-Received-Date: Thu, 12 Sep 2019 15:12:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From: Will Page <wpage@polysync.io>

The way this class uses overrides to support generation of multiple
sections is subject to two different issues: 1) labels that conflict
with existing override names causing the value for the conflicting label
to be set for all labels, and 2) reusing the override list through each
iteration, prepending each new label to the list of overrides makes
earlier labels' value take precedence over later labels, making later
labels virtually impossible to customize.

The first issue is resolved by removing all label names from overrides
before iterating over labels.  The second issue is resolved by
generating a fresh list of overrides with only the current label added.

The current label is also appended to the list of overrides instead of
prepended, which makes it the highest priority override.  This is
matches the behavior of devtool-source.bbclass, which similarly
monkey-patches overrides.

Closes https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13469 .

Signed-off-by: Will Page <wpage@polysync.io>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/uboot-extlinux-config.bbclass | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/classes/uboot-extlinux-config.bbclass b/meta/classes/uboo=
t-extlinux-config.bbclass
index b5b1a81dfc..f4bf94be04 100644
--- a/meta/classes/uboot-extlinux-config.bbclass
+++ b/meta/classes/uboot-extlinux-config.bbclass
@@ -104,13 +104,16 @@ python do_create_extlinux_config() {
                 if default:
                     cfgfile.write('DEFAULT %s\n' % (default))
=20
-            for label in labels.split():
+            # Need to deconflict the labels with existing overrides
+            label_overrides =3D labels.split()
+            default_overrides =3D localdata.getVar('OVERRIDES').split(':')
+            # We're keeping all the existing overrides that aren't used as=
 a label
+            # an override for that label will be added back in while we're=
 processing that label
+            keep_overrides =3D list(filter(lambda x: x not in label_overri=
des, default_overrides))
=20
-                overrides =3D localdata.getVar('OVERRIDES')
-                if not overrides:
-                    bb.fatal('OVERRIDES not defined')
+            for label in labels.split():
=20
-                localdata.setVar('OVERRIDES', label + ':' + overrides)
+                localdata.setVar('OVERRIDES', ':'.join(keep_overrides + [l=
abel]))
=20
                 extlinux_console =3D localdata.getVar('UBOOT_EXTLINUX_CONS=
OLE')
=20
--=20
2.17.1

