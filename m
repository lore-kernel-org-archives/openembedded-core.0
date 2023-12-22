Return-Path: <tobias.hagelborn@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0E89C41535
	for <webhook@archiver.kernel.org>; Fri, 22 Dec 2023 06:24:53 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.77])
 by mx.groups.io with SMTP id smtpd.web11.17219.1703226286296502725
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Dec 2023 22:24:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=W+ia79WC;
 spf=pass (domain: axis.com, ip: 40.107.21.77, mailfrom: tobias.hagelborn@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eM/rwCd9RO8EnyMJ5cTEB1GLUHgV5IptqUJRc8aVS4aEOYrwdMvI4amaFOcMMGrIoUB23PnTgqcmg/gYmBKD4wv3mMw6so+xZUBJJK4ng3NTjLGqbz7RtFU4BJVEZ4BIzLzqB5Nnsn4lAVIunw65UEV7U16fC+GGCmOGHVszB/Cr+KRe4Ja6G6/7DR8zhtqnMPNOKbI3T2Iqdp542nGMI49SKA9c2rJ+AkF0D+ikUoF+uKKXdlvbo8uBBWyGAYIRN8GdZiEOxYwlKxmFAEv3k3xAfirEC1Rx+Fr0qHNaM0TtrUKwlKNg3pfZI2DwALhvTlx9ZTGCxDW9bJ+Vo59iMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CkuaT1JUAXpveqf+8sWyVF4tmrMl1QsHRxTG0VSR9E8=;
 b=cXfgQdvZ4pWVAKnuPeNazikmVxBwDmIEUlge/LLJTNBZG/78/O9S/9cKNP1FRd4rAKktPCWtrNWsfS5CX8zvYa2ZDs6OLRzEtRSNMLRxGUPjbXzcUZbyNbnbFjc3TGB1ojO/pDOW7ikEYbN4/TEs9X1/N+vGGSBuVtbZKEYLnn8zB3Y2054sCC7kaaok7AMqnnoeRnsBKwLJWzGn/tMTnpmDzaT4MXBmCg7yIRjL615F91U+Oh9no0FnOTcjtPsJB7LuFzbv80IlyMdc2rCnN2vEnugk3Ao+BpiW9ktQPEp7MnYnHQc7XNclUeFPQtpH6FGpSkTB5i0k8OSaS1wrRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CkuaT1JUAXpveqf+8sWyVF4tmrMl1QsHRxTG0VSR9E8=;
 b=W+ia79WCjXLvihUr28uyTUX7Ta27yVvlFI2L0WSDxawO4lPNzpcc7oBj9vzkBl2B4KlaV7RMd3UlxLWmhsArIh8asWcgH6Onih2CVCpOMld3zm4xjflPdd4IzKD0Zr0T58h1irZColfjBiefbJAQUEA2k+EjBIs0ND2p1DppYYY=
Received: from AS8PR02MB9483.eurprd02.prod.outlook.com (2603:10a6:20b:5a6::5)
 by PAVPR02MB10399.eurprd02.prod.outlook.com (2603:10a6:102:327::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21; Fri, 22 Dec
 2023 06:24:41 +0000
Received: from AS8PR02MB9483.eurprd02.prod.outlook.com
 ([fe80::5a25:7f3c:a068:733d]) by AS8PR02MB9483.eurprd02.prod.outlook.com
 ([fe80::5a25:7f3c:a068:733d%3]) with mapi id 15.20.7113.019; Fri, 22 Dec 2023
 06:24:41 +0000
From: Tobias Hagelborn <Tobias.Hagelborn@axis.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] sstate.bbclass: Only sign packages at the time
 of their creation
Thread-Topic: [OE-core] [PATCH] sstate.bbclass: Only sign packages at the time
 of their creation
Thread-Index: AQHaNJ2BAsHCahb030idAWEl8aeXX7C01crY
Date: Fri, 22 Dec 2023 06:24:41 +0000
Message-ID: 
 <AS8PR02MB9483C5AE8C36503B823E2977EC94A@AS8PR02MB9483.eurprd02.prod.outlook.com>
References: <20231222060932.1504845-1-tobias.hagelborn@axis.com>
 <17A31276A3BF9B83.28089@lists.openembedded.org>
In-Reply-To: <17A31276A3BF9B83.28089@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR02MB9483:EE_|PAVPR02MB10399:EE_
x-ms-office365-filtering-correlation-id: ae09bccb-5b6e-433f-b81f-08dc02b6ae9f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 lW4LmrXW2JHv4ZtbNHz69/UzCBB7tp+H2nHh/LOcqaGEbKM8AE2nDXNN+YrI24G1uyVEnUB/cGn27DUBI6vJrMizzISqsA+zGo2/lsO62a8YeGDHABRzM55x/7jW9bZT2DW4zAvNjD1QqOkPP6gTsdoSWhJD+3vkX5rW3gD5HD9pruuqePM1bXHO5rAjiclv+deMQU9eBqQZBUlwVn8xRgx0f9tpU4JessMBfj+kcQrkBj0MsoklRXyFj0KdY/IXQySBYNquO1CIO0Yf8c97ummj298+JmCbU5l7bo8uraNkVzq6Vb8TFHvphwKHKbzpofJf/FTYuTekyG1Z4a7DD4PicjCpiX2ev+PkwVCZlN5GQp1CgH7fMsaBxdEN7WaehlDMbrd5vo+BKN7UsdJyW51QOwj1gxtbhncTQ8RDx7tq+IQqBExXEzrZqgZGmQGaWWQsZv0nmCgdzb0rz9k8pgudmrugpoG6OdtkIk1VGXxHttOQG6weBrEeYY8yXxdmJk7nT65iJ5BxZe26DALkBqkpMMonL8lg5/GT84mZS9HfdZaEAjq5vJ2zVUdCcFupfnqYaNkTCQ6wLgWoZEEAi1JFodQ4rLJR8HZEK7ac76BB2t1kXBQTc+E+1kzC5DvF
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB9483.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(39860400002)(376002)(346002)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(38070700009)(33656002)(86362001)(53546011)(9686003)(5660300002)(52536014)(8936002)(8676002)(6506007)(7696005)(71200400001)(2906002)(55016003)(26005)(6916009)(316002)(64756008)(91956017)(66946007)(76116006)(66446008)(66476007)(66556008)(83380400001)(478600001)(19627405001)(122000001)(38100700002)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?DHTnQHDt/ND2uCX6iswn60v1wJX8sWLJk5nshUKU6E4L4mggkonE9/lGQXTr?=
 =?us-ascii?Q?HY+OYAqdLpO1driByfIc5NNJIZVGxN7fdiHAG7iWtyxWlOpDrM6MYIXPtNmz?=
 =?us-ascii?Q?x44JnR5YKCQjfmzYlnoGQpUWuLhxXiELBb+rA1uqpqz9YIL/VNLkUWDu3GBv?=
 =?us-ascii?Q?eybH8yHyitIHAUrxs2JTe5yor1Yb3vXLgeMZZbjQHyrCtJSDG7mAc7kL512o?=
 =?us-ascii?Q?yve4bBPruJbt4GsU81CSmDLDSbO5NVMX/Y4/fO0O/YsOvYm9WgAcML3fEAtl?=
 =?us-ascii?Q?8JI+DIJ35WIOaMjJKGJeVKPXtnnMte+vtu1tRyegH835LU3WzJhhMdqyBF8b?=
 =?us-ascii?Q?VIqyzI7eekeExr/CnMpmZg3HYyMjA/7tBzSRWF9CkDiWm5doE1grlBKzoQKx?=
 =?us-ascii?Q?XL8qCRndPOIq9SRlqQktpZDgWJ9VhyDo4h81c0liD8pWa6jpeG5iZHaflt/l?=
 =?us-ascii?Q?W3Sl7X95jdE82pGUdKrTrHJBP4a9Gkr7NoFxa+4cwIViBOhNLmeZBa5BBGba?=
 =?us-ascii?Q?78huETHE0FAVq6Cx22gAvemfaA8dibUIvqxfcf67TGqhzVA2i+wiSw0uf+hx?=
 =?us-ascii?Q?1bUv6+XxVZrCDqIuC0zypYm2S0jO6jr5tjrKwGY0G+KUbaM0MPAPPcGxYkFm?=
 =?us-ascii?Q?Klan2ciStVamr37IVEikqixxvshXf1WR+IidVwMXoA6gnV0JS95yaI+33Eel?=
 =?us-ascii?Q?CKx1NsWgAHhZWLIwE57UWR1wKUx9Y/OB27/etikh39jjiihutF42covRe9hT?=
 =?us-ascii?Q?+73POnlYdDi73vJQot/LPzglFpIAp4IdKv+h2KWCZJJDxXImnITccQD89c9b?=
 =?us-ascii?Q?sEdENo3VZUqlv+KUdkda6AGvsYP4qBMNWQV9/PfRMr5Jqsm2Ghxqt+l4tkDP?=
 =?us-ascii?Q?TYdJzF3xf1+XDX+rkjCnG73RJKDmmDzakIlkrq0s3C0ICbgzr8//BF5rEkc4?=
 =?us-ascii?Q?UhX7Eb34+Ayo4Jh3jMFz+5LV3aVNwyNGrocZmaQaBY8y/c4phpRV36IdF7sm?=
 =?us-ascii?Q?husnjTSENkOamn3Kc/tWMfFhL9/jXqwppjZFw7D93JLYYDUyWl6483UB4ScQ?=
 =?us-ascii?Q?xWzxc/hQgEtaaHf91rq8QJkdKr4i8MG9/AMuQrEfTtjFCABYh3yaet6NZKfG?=
 =?us-ascii?Q?KpPhxsqDpFMv/+w0bK3KFuEHPGx5WO6llrFT4o0xJi+pBtLy/KD5PTN9hpa1?=
 =?us-ascii?Q?ztTPlZqcesRZ+5vZinZDXFRDtPA28VsTQhLwf7V44RWh2oNWsEZ20C3U7nLk?=
 =?us-ascii?Q?hRauULjXaFi+s9aHKqemuSEFItXvoaPC9lNNF3KkaHPyPMR8F9mWTclqHPvh?=
 =?us-ascii?Q?RDXGhRS/tY3NU3/PNl0k1LUtBwphh9gb529Da53Pc4mV3wNCqSYHgbloZvo9?=
 =?us-ascii?Q?21VYyxn/obOJEKQxtSRNmz85lkWHDR5aHVAYjUnWu3BkFtZ5tUZW3WvFeTZ/?=
 =?us-ascii?Q?iPbyQoNRKyWog2c65B/UzuXGvse9PWJF9jmxif7hy85zMt+hDzvnsyL6C2tm?=
 =?us-ascii?Q?VkovEbJLJGl1x53ryFDbBJRn7JZNBCKpb18pTh7isM4xnnmfm+jdTmW+k1PE?=
 =?us-ascii?Q?jqgoosvPf/1wiNpXbOI=3D?=
Content-Type: multipart/alternative;
	boundary="_000_AS8PR02MB9483C5AE8C36503B823E2977EC94AAS8PR02MB9483eurp_"
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB9483.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae09bccb-5b6e-433f-b81f-08dc02b6ae9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2023 06:24:41.6161
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zn2Zv5fIBA0l47b2Oehu3DpyWudIOW1rjAlDQlcaePRTPpg8FOdSx4Au1WpAII704eOKL778hVhOFh0IeUBA7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB10399
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Dec 2023 06:24:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192861

--_000_AS8PR02MB9483C5AE8C36503B823E2977EC94AAS8PR02MB9483eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Validated by "compromising" a signed .zst sstate file and verifying
that it is not used but rather build from scratch, the old archive
persists until the modified .zst or corresponding .sig file is removed.
Prior to the change, the modified .zst archive was singed as is.

Cheers
Tobias

________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Tobias Hagelborn <tobias.hagelborn@axis.com>
Sent: Friday, December 22, 2023 7:09 AM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: [OE-core] [PATCH] sstate.bbclass: Only sign packages at the time o=
f their creation

From: Tobias Hagelborn <tobiasha@axis.com>

The purpose of the change is to never sign a package not created by
the build itself.

sstate_create_package is refactored into Python and re-designed
to handle signing inside the function. Thus, the signing should never
apply to existing sstate packages. The function is therefore renamed
into sstate_create_and_sign_package.
The creation of the archive remains in a separate shellscript function.

Co-authored-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Tobias Hagelborn <tobias.hagelborn@axis.com>
---
 meta/classes-global/sstate.bbclass | 128 ++++++++++++++++++++---------
 1 file changed, 87 insertions(+), 41 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstat=
e.bbclass
index 9330433bb2..bc7bdbe7d5 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -703,9 +703,7 @@ def sstate_package(ss, d):
     if d.getVar('SSTATE_SKIP_CREATION') =3D=3D '1':
         return

-    sstate_create_package =3D ['sstate_report_unihash', 'sstate_create_pkg=
dirs', 'sstate_create_package']
-    if d.getVar('SSTATE_SIG_KEY'):
-        sstate_create_package.append('sstate_sign_package')
+    sstate_create_package =3D ['sstate_report_unihash', 'sstate_create_pkg=
dirs', 'sstate_create_and_sign_package']

     for f in (d.getVar('SSTATECREATEFUNCS') or '').split() + \
              sstate_create_package + \
@@ -817,19 +815,91 @@ python sstate_create_pkgdirs () {
         bb.utils.mkdirhier(os.path.dirname(d.getVar('SSTATE_PKG')))
 }

-#
-# Shell function to generate a sstate package from a directory
-# set as SSTATE_BUILDDIR. Will be run from within SSTATE_BUILDDIR.
-#
-sstate_create_package () {
-       # Exit early if it already exists
-       if [ -e ${SSTATE_PKG} ]; then
-               touch ${SSTATE_PKG} 2>/dev/null || true
-               return
-       fi
+# Create sstate package
+# If enabled, sign the package.
+# Package and signature are created in a sub-directory
+# and renamed in place once created.
+python sstate_create_and_sign_package () {
+    from pathlib import Path
+
+    # Best effort touch
+    def touch(file):
+        try:
+            file.touch()
+        except:
+            pass
+
+    def update_file(src, dst, force=3DFalse):
+        if dst.is_symlink() and not dst.exists():
+            force=3DTrue
+        try:
+            # This relies on that src is a temporary file that can be rena=
med
+            # or left as is.
+            if force:
+                src.rename(dst)
+            else:
+                os.link(src, dst)
+            return True
+        except:
+            pass
+
+        if dst.exists():
+            touch(dst)
+
+        return False

-       TFILE=3D`mktemp ${SSTATE_PKG}.XXXXXXXX`
+    verify_sig =3D (
+        bb.utils.to_boolean(d.getVar("SSTATE_VERIFY_SIG")) and
+        bool(d.getVar("SSTATE_SIG_KEY"))
+    )

+    sstate_pkg =3D Path(d.getVar("SSTATE_PKG"))
+    sstate_pkg_sig =3D Path(str(sstate_pkg) + ".sig")
+    if verify_sig:
+        if sstate_pkg.exists() and sstate_pkg_sig.exists():
+            touch(sstate_pkg)
+            touch(sstate_pkg_sig)
+            return
+    else:
+        if sstate_pkg.exists():
+            touch(sstate_pkg)
+            return
+
+    from tempfile import TemporaryDirectory
+    if not sstate_pkg.parent.is_dir():
+        sstate_pkg.parent.mkdir(parents=3DTrue, exist_ok=3DTrue)
+
+    with TemporaryDirectory(dir=3Dsstate_pkg.parent) as tmp_dir:
+        tmp_pkg =3D Path(tmp_dir) / sstate_pkg.name
+        localdata =3D d.createCopy()
+        localdata.setVar("SSTATE_PKG", str(tmp_pkg))
+        bb.build.exec_func('sstate_archive_package', localdata)
+
+        force =3D False
+        if verify_sig:
+            from oe.gpg_sign import get_signer
+            signer =3D get_signer(d, 'local')
+            signer.detach_sign(str(tmp_pkg), d.getVar('SSTATE_SIG_KEY'), N=
one,
+                                d.getVar('SSTATE_SIG_PASSPHRASE'), armor=
=3DFalse)
+
+            tmp_pkg_sig =3D Path(tmp_dir) / sstate_pkg_sig.name
+            if not update_file(tmp_pkg_sig, sstate_pkg_sig):
+                # If the created signature file could not be copied into p=
lace,
+                # then we should not use the sstate package either.
+                return
+
+            # If the .sig file was updated, then the sstate package must a=
lso
+            # be updated.
+            force =3D True
+
+        update_file(tmp_pkg, sstate_pkg, force)
+}
+
+# Shell function to generate a sstate package from a directory
+# set as SSTATE_BUILDDIR. Will be run from within SSTATE_BUILDDIR.
+# The calling function handles moving the sstate package into the final
+# destination.
+sstate_archive_package () {
         OPT=3D"-cS"
         ZSTD=3D"zstd -${SSTATE_ZSTD_CLEVEL} -T${ZSTD_THREADS}"
         # Use pzstd if available
@@ -840,42 +910,18 @@ sstate_create_package () {
         # Need to handle empty directories
         if [ "$(ls -A)" ]; then
                 set +e
-               tar -I "$ZSTD" $OPT -f $TFILE *
+               tar -I "$ZSTD" $OPT -f ${SSTATE_PKG} *
                 ret=3D$?
                 if [ $ret -ne 0 ] && [ $ret -ne 1 ]; then
                         exit 1
                 fi
                 set -e
         else
-               tar -I "$ZSTD" $OPT --file=3D$TFILE --files-from=3D/dev/nul=
l
-       fi
-       chmod 0664 $TFILE
-       # Skip if it was already created by some other process
-       if [ -h ${SSTATE_PKG} ] && [ ! -e ${SSTATE_PKG} ]; then
-               # There is a symbolic link, but it links to nothing.
-               # Forcefully replace it with the new file.
-               ln -f $TFILE ${SSTATE_PKG} || true
-       elif [ ! -e ${SSTATE_PKG} ]; then
-               # Move into place using ln to attempt an atomic op.
-               # Abort if it already exists
-               ln $TFILE ${SSTATE_PKG} || true
-       else
-               touch ${SSTATE_PKG} 2>/dev/null || true
+               tar -I "$ZSTD" $OPT --file=3D${SSTATE_PKG} --files-from=3D/=
dev/null
         fi
-       rm $TFILE
+       chmod 0664 ${SSTATE_PKG}
 }

-python sstate_sign_package () {
-    from oe.gpg_sign import get_signer
-
-
-    signer =3D get_signer(d, 'local')
-    sstate_pkg =3D d.getVar('SSTATE_PKG')
-    if os.path.exists(sstate_pkg + '.sig'):
-        os.unlink(sstate_pkg + '.sig')
-    signer.detach_sign(sstate_pkg, d.getVar('SSTATE_SIG_KEY', False), None=
,
-                       d.getVar('SSTATE_SIG_PASSPHRASE'), armor=3DFalse)
-}

 python sstate_report_unihash() {
     report_unihash =3D getattr(bb.parse.siggen, 'report_unihash', None)
--
2.30.2


--_000_AS8PR02MB9483C5AE8C36503B823E2977EC94AAS8PR02MB9483eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Helvetic=
a, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">Validated by &quot;co=
mpromising&quot; a signed .zst sstate file and verifying<br>
that it is not used but rather build from scratch, the old archive<br>
persists until the modified .zst or corresponding .sig file is removed.<br>
Prior to the change, the modified .zst archive was singed as is.</span></di=
v>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Helvetic=
a, sans-serif; font-size: 10pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 10pt; color: rgb(0, 0, 0);">Cheers<br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 10pt; color: rgb(0, 0, 0);">Tobias<br>
<br>
</span></div>
<div id=3D"Signature"></div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Tobias Hagelborn &lt;tobias.hagelborn@axis.com&gt;<br>
<b>Sent:</b> Friday, December 22, 2023 7:09 AM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> [OE-core] [PATCH] sstate.bbclass: Only sign packages at the=
 time of their creation</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Tobias Hagelborn &lt;tobiasha@axis.com&gt;<b=
r>
<br>
The purpose of the change is to never sign a package not created by<br>
the build itself.<br>
<br>
sstate_create_package is refactored into Python and re-designed<br>
to handle signing inside the function. Thus, the signing should never<br>
apply to existing sstate packages. The function is therefore renamed<br>
into sstate_create_and_sign_package.<br>
The creation of the archive remains in a separate shellscript function.<br>
<br>
Co-authored-by: Peter Kjellerstedt &lt;peter.kjellerstedt@axis.com&gt;<br>
Signed-off-by: Tobias Hagelborn &lt;tobias.hagelborn@axis.com&gt;<br>
---<br>
&nbsp;meta/classes-global/sstate.bbclass | 128 ++++++++++++++++++++--------=
-<br>
&nbsp;1 file changed, 87 insertions(+), 41 deletions(-)<br>
<br>
diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstat=
e.bbclass<br>
index 9330433bb2..bc7bdbe7d5 100644<br>
--- a/meta/classes-global/sstate.bbclass<br>
+++ b/meta/classes-global/sstate.bbclass<br>
@@ -703,9 +703,7 @@ def sstate_package(ss, d):<br>
&nbsp;&nbsp;&nbsp;&nbsp; if d.getVar('SSTATE_SKIP_CREATION') =3D=3D '1':<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; sstate_create_package =3D ['sstate_report_unihash', 'ss=
tate_create_pkgdirs', 'sstate_create_package']<br>
-&nbsp;&nbsp;&nbsp; if d.getVar('SSTATE_SIG_KEY'):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sstate_create_package.append('s=
state_sign_package')<br>
+&nbsp;&nbsp;&nbsp; sstate_create_package =3D ['sstate_report_unihash', 'ss=
tate_create_pkgdirs', 'sstate_create_and_sign_package']<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; for f in (d.getVar('SSTATECREATEFUNCS') or '').spl=
it() + \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; sstate_create_package + \<br>
@@ -817,19 +815,91 @@ python sstate_create_pkgdirs () {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb.utils.mkdirhier(os.path=
.dirname(d.getVar('SSTATE_PKG')))<br>
&nbsp;}<br>
&nbsp;<br>
-#<br>
-# Shell function to generate a sstate package from a directory<br>
-# set as SSTATE_BUILDDIR. Will be run from within SSTATE_BUILDDIR.<br>
-#<br>
-sstate_create_package () {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Exit early if it already exists<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ -e ${SSTATE_PKG} ]; then<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; touch ${SSTATE_PKG} 2&gt;/dev/null || true<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
+# Create sstate package<br>
+# If enabled, sign the package.<br>
+# Package and signature are created in a sub-directory<br>
+# and renamed in place once created.<br>
+python sstate_create_and_sign_package () {<br>
+&nbsp;&nbsp;&nbsp; from pathlib import Path<br>
+<br>
+&nbsp;&nbsp;&nbsp; # Best effort touch<br>
+&nbsp;&nbsp;&nbsp; def touch(file):<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; try:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file.to=
uch()<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; except:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pass<br=
>
+<br>
+&nbsp;&nbsp;&nbsp; def update_file(src, dst, force=3DFalse):<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if dst.is_symlink() and not dst=
.exists():<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; force=
=3DTrue<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; try:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # This =
relies on that src is a temporary file that can be renamed<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # or le=
ft as is.<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if forc=
e:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; src.rename(dst)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else:<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; os.link(src, dst)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return =
True<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; except:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pass<br=
>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if dst.exists():<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; touch(d=
st)<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return False<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TFILE=3D`mktemp ${SSTATE_PKG}.XXXXXXX=
X`<br>
+&nbsp;&nbsp;&nbsp; verify_sig =3D (<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb.utils.to_boolean(d.getVar(&q=
uot;SSTATE_VERIFY_SIG&quot;)) and<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool(d.getVar(&quot;SSTATE_SIG_=
KEY&quot;))<br>
+&nbsp;&nbsp;&nbsp; )<br>
&nbsp;<br>
+&nbsp;&nbsp;&nbsp; sstate_pkg =3D Path(d.getVar(&quot;SSTATE_PKG&quot;))<b=
r>
+&nbsp;&nbsp;&nbsp; sstate_pkg_sig =3D Path(str(sstate_pkg) + &quot;.sig&qu=
ot;)<br>
+&nbsp;&nbsp;&nbsp; if verify_sig:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if sstate_pkg.exists() and ssta=
te_pkg_sig.exists():<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; touch(s=
state_pkg)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; touch(s=
state_pkg_sig)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return<=
br>
+&nbsp;&nbsp;&nbsp; else:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if sstate_pkg.exists():<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; touch(s=
state_pkg)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return<=
br>
+<br>
+&nbsp;&nbsp;&nbsp; from tempfile import TemporaryDirectory<br>
+&nbsp;&nbsp;&nbsp; if not sstate_pkg.parent.is_dir():<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sstate_pkg.parent.mkdir(parents=
=3DTrue, exist_ok=3DTrue)<br>
+<br>
+&nbsp;&nbsp;&nbsp; with TemporaryDirectory(dir=3Dsstate_pkg.parent) as tmp=
_dir:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tmp_pkg =3D Path(tmp_dir) / sst=
ate_pkg.name<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; localdata =3D d.createCopy()<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; localdata.setVar(&quot;SSTATE_P=
KG&quot;, str(tmp_pkg))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb.build.exec_func('sstate_arch=
ive_package', localdata)<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; force =3D False<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if verify_sig:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from oe=
.gpg_sign import get_signer<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; signer =
=3D get_signer(d, 'local')<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; signer.=
detach_sign(str(tmp_pkg), d.getVar('SSTATE_SIG_KEY'), None,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d.getVar('SSTATE_SIG_PASSPHRASE'), ar=
mor=3DFalse)<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tmp_pkg=
_sig =3D Path(tmp_dir) / sstate_pkg_sig.name<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if not =
update_file(tmp_pkg_sig, sstate_pkg_sig):<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; # If the created signature file could not be copied into p=
lace,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; # then we should not use the sstate package either.<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; return<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # If th=
e .sig file was updated, then the sstate package must also<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # be up=
dated.<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; force =
=3D True<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; update_file(tmp_pkg, sstate_pkg=
, force)<br>
+}<br>
+<br>
+# Shell function to generate a sstate package from a directory<br>
+# set as SSTATE_BUILDDIR. Will be run from within SSTATE_BUILDDIR.<br>
+# The calling function handles moving the sstate package into the final<br=
>
+# destination.<br>
+sstate_archive_package () {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OPT=3D&quot;-cS&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ZSTD=3D&quot;zstd -${SSTAT=
E_ZSTD_CLEVEL} -T${ZSTD_THREADS}&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Use pzstd if available<b=
r>
@@ -840,42 +910,18 @@ sstate_create_package () {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Need to handle empty dir=
ectories<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ &quot;$(ls -A)&quot; =
]; then<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; set +e<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; tar -I &quot;$ZSTD&quot; $OPT -f $TFILE *<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; tar -I &quot;$ZSTD&quot; $OPT -f ${SSTATE_PKG} *<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ret=3D$?<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if [ $ret -ne 0 ] &amp;&amp; [ $ret -ne 1 ]; then<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; exit =
1<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; fi<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; set -e<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; tar -I &quot;$ZSTD&quot; $OPT --file=3D$TFILE --files-from=3D/de=
v/null<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; chmod 0664 $TFILE<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Skip if it was already created by s=
ome other process<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ -h ${SSTATE_PKG} ] &amp;&amp; [ =
! -e ${SSTATE_PKG} ]; then<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; # There is a symbolic link, but it links to nothing.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; # Forcefully replace it with the new file.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ln -f $TFILE ${SSTATE_PKG} || true<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; elif [ ! -e ${SSTATE_PKG} ]; then<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; # Move into place using ln to attempt an atomic op.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; # Abort if it already exists<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ln $TFILE ${SSTATE_PKG} || true<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; touch ${SSTATE_PKG} 2&gt;/dev/null || true<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; tar -I &quot;$ZSTD&quot; $OPT --file=3D${SSTATE_PKG} --files-fro=
m=3D/dev/null<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rm $TFILE<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; chmod 0664 ${SSTATE_PKG}<br>
&nbsp;}<br>
&nbsp;<br>
-python sstate_sign_package () {<br>
-&nbsp;&nbsp;&nbsp; from oe.gpg_sign import get_signer<br>
-<br>
-<br>
-&nbsp;&nbsp;&nbsp; signer =3D get_signer(d, 'local')<br>
-&nbsp;&nbsp;&nbsp; sstate_pkg =3D d.getVar('SSTATE_PKG')<br>
-&nbsp;&nbsp;&nbsp; if os.path.exists(sstate_pkg + '.sig'):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; os.unlink(sstate_pkg + '.sig')<=
br>
-&nbsp;&nbsp;&nbsp; signer.detach_sign(sstate_pkg, d.getVar('SSTATE_SIG_KEY=
', False), None,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d.getVar('SSTATE=
_SIG_PASSPHRASE'), armor=3DFalse)<br>
-}<br>
&nbsp;<br>
&nbsp;python sstate_report_unihash() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; report_unihash =3D getattr(bb.parse.siggen, 'repor=
t_unihash', None)<br>
-- <br>
2.30.2<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_AS8PR02MB9483C5AE8C36503B823E2977EC94AAS8PR02MB9483eurp_--

