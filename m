Return-Path: <bevenson@melinkcorp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBFD0C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 22:08:07 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.108])
 by mx.groups.io with SMTP id smtpd.web10.1084.1643926086679212838
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 14:08:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@melink.onmicrosoft.com
 header.s=selector1-melink-onmicrosoft-com header.b=Ft91gbQB;
 spf=pass (domain: melinkcorp.com, ip: 40.107.92.108,
 mailfrom: bevenson@melinkcorp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U293omsB4MHu7BVGhajWRw4r9yQwrnqvvZ4ZzYAO4cJW0/nW4J68m/A2pC4wMGTKrq81bnX3Ol7OdXOr5gU45Gsdj5uPs0gWyY407TuYV7A2KqjtHb/2osgz+K0ajq4G0a5ncpktMy+GFjIlZxGczetNaiaMT0V2Y5DcE2QK1JK4AuWkjLBfAA0S0svQxLz+nEX/fOnUGimxu//JRZ8WNBHUnbgrgc4cxwTa2EHHqeFTsOP5CAN8zJ2rtBmeG31+PaIYhZn2gMDsrUzmh3DOfm9eC3OD1hIG+vZhEI4CyL9zbv/aocl0oO5vsGKZWiA2hnmx35hcpBJr1B1Iwvi7zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q3Vii4DYA8uitMykh/rTA240BCuQEI2fbDLhMmY/M7M=;
 b=ggjWhthbCTA5ZPPKNsMnb5+/T9FqpHZIfN65tHgZySZTOP4FcNacfCDRwWij9TG+c6m/5ULw7ekd7gJbUToKCuG/5OA9zWX6HRNqMQf5BBNH9VYha8AYj2Ut4gYMDQJ7pbe0gF7QaX98JDLrPITQEEdzdWRPn2FfD3gKlWyDj7ZygZLugLWeujtGvsKfsXWv9yQsIwjTaMy5r2YaB/RQAuygDjDQSycXOS1CEjGJLFhLWB6VcGyhD1JqYVVxW5xPqRiizV0/IJBSF1zt0hkVzaRFwveOvI0QJJqrobFh0Oadnh1Q0RYsTD4CiCJn/LUaCG8Mi9L+SzcRszeM3i8YyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Melink.onmicrosoft.com; s=selector1-Melink-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q3Vii4DYA8uitMykh/rTA240BCuQEI2fbDLhMmY/M7M=;
 b=Ft91gbQB06ZvpsxNspP5WLTGxcoxNklaJLFD0WjkH8YdiLu/MqI2GsJqZyEj5TJrYatkNtp0q0yzp3vO33GqSodNtWvX5f/GlEj7GKkuaqk4EonV/oFESVCy1FdDvVz2AHMKjBivWf4op6rFdoepigapmzB5scGtDj7ZQ7M8n+wf4QrIWmzeldwUlalhWSh9g/tjRtzQEkU3+ZlQHyEtf3zLvSWJcI/H7FPqV5VjwF6Y72JX0vzE33lq8nZeYTEhlx5Otyd9O23alcEaJ7+Nqsw9x+Xm+0hug3XMwxJ9gbojsw9QQKrLtxitrT/uLk9YKhBNaqvrMvs3x8JUzEiziw==
Received: from CH0PR20MB3948.namprd20.prod.outlook.com (2603:10b6:610:c6::22)
 by BN8PR20MB2753.namprd20.prod.outlook.com (2603:10b6:408:81::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 22:08:05 +0000
Received: from CH0PR20MB3948.namprd20.prod.outlook.com
 ([fe80::b805:3743:bea:e7d]) by CH0PR20MB3948.namprd20.prod.outlook.com
 ([fe80::b805:3743:bea:e7d%5]) with mapi id 15.20.4951.012; Thu, 3 Feb 2022
 22:08:05 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Valek, Andrej"
	<andrej.valek@siemens.com>
Subject: [OE-core] [PATCH] busybox.inc: Create temporary links during install
Thread-Topic: [OE-core] [PATCH] busybox.inc: Create temporary links during
 install
Thread-Index: AdgZRBJIiZRLZ2aoSDe7ocwvEW6K3Q==
Date: Thu, 3 Feb 2022 22:08:04 +0000
Message-ID: 
 <CH0PR20MB3948E1BBAA0BF3FB61BAF097BB289@CH0PR20MB3948.namprd20.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-bromium-msgid: d3fceb03-d53e-4bb4-9658-471d43c1ed77
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=melinkcorp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6884cd9c-0305-42f1-5265-08d9e761a712
x-ms-traffictypediagnostic: BN8PR20MB2753:EE_
x-microsoft-antispam-prvs: 
 <BN8PR20MB27534A6A3CDC16919695AA25BB289@BN8PR20MB2753.namprd20.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:510;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ewYg8uXIJOKtyZV5DnJXCCLp2Vcjcnwfqtlx8WSWrji5ZBdHfOcLEBeEs6+XAAaXKXubipoCl0TTAYL6ev+viGTqTguw7lMVo3P0DCgH1EmwuRhDStrG5rdVPV8j5izEmuA0T0nQJcZCslf/OBVvv2lNOQPUoWDgphiC2LVCyPhxu9exgeky4upsq2QDtDoIOFeJFHgzGZBA4Ac/frl0Unba6Ae+WDuCcPkTuK2d6HOMo+C6mjWUnO7r82rcoJ89MucZl27q/8i3fTAdrR0B+10ttHMRMpYQ9/ChLvvho/c4+mMFOGchAKiQPhI5WkqvAcGksH7Mk/6hsZu9KnVgtGj7918kivUE6A7ncXbxoU5UrNkNJFZMH4hTNeKNSLFYGZbm+dJYfg9nms2dra2tkn0ybCYFSlg4mQx7QT+TV8biLQDGyFeYn04iVzq4mOOzj/vMGluo6HLKmE/l3PVGIr+kzQT+x+h2942x2XKVPOJD/rj7pYY40vMDltfrslsAvEY8RHTXVXbmUxtSEchSIbVD7VG/8T2RoVNPrnXkANG46NzLeaUeYLubnmgqmljwh5YrrTj8c3OqICWzUtFJ+v+2kPfCc2dVGGvaaD5Wt4FlARb16B/jAgYH/sJiUNkFCspvdKcWUHqeSfRTTK7gfzBoaj9AzdfcvhLnSYb/LetZ2Qnk4blZVBVUy4o9h36W8kCTS6lxv+jbfTD3gE/rng==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR20MB3948.namprd20.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(136003)(396003)(39840400004)(366004)(346002)(376002)(64756008)(5660300002)(8936002)(8676002)(55016003)(66946007)(52536014)(66476007)(66556008)(76116006)(2906002)(6506007)(7696005)(9686003)(508600001)(33656002)(66446008)(316002)(110136005)(26005)(83380400001)(186003)(86362001)(122000001)(38070700005)(38100700002)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?m+A+xlpcqeuScZ40jR6Dv2LszK0wErqsBwiwCLOOqtnC+/pj0LcOWwf76ooY?=
 =?us-ascii?Q?GjC1lLlRvVt89+QdfhbgrV1dsWOWGcg+PrEjscdsMuD7dNIrYsIE1ZmPg/zI?=
 =?us-ascii?Q?YxLwIUgBPl/lYdSVXU3vPVa3eeEiloShX063lrSq648oE4+VdhCsVWYf4FOf?=
 =?us-ascii?Q?JU8irV9jtoFAEEInyuRauWpcvXcj9wnBooEaBmsJVAQmiid0Ylq8veCsKrAU?=
 =?us-ascii?Q?Y8LzzWTjuFvmZAJUA/IvJAPVO/yt68v8oiyOHp9AKwHvazTN9mbnwVQD4BG7?=
 =?us-ascii?Q?/7RARPSZROk75k8FV/eIdkUAegaIAd6Qp+xhhBDftSzTRRHEsKr3CBRG3Y7P?=
 =?us-ascii?Q?Q2ZF/9g/CrOGzixM03pWV4Mroo5t4wDkCkmEr3CmZUJXKjPshQi2T43efPFW?=
 =?us-ascii?Q?cl/Lii0uMuXE8zMKsw3maRcA3GxI10Ls4p/qPxku+2h0suoPsr31X6iwyA/5?=
 =?us-ascii?Q?PTE56vGM7zGmeIeuxu1D4gquF+UJhUH2fuJ7qc9LczJomM7HQRY8NLAdKBtl?=
 =?us-ascii?Q?v5Dm8aKctIequCgTeLovV5sZxDPSdhrOOqC5MpSwrCaE1Pm7sT6+vvaBPId0?=
 =?us-ascii?Q?Rmijo8AfN/eRoJFnOJ9oFLXw/CfE1noMfS20I5REFjQcAwUOlvGGpOgLZqPV?=
 =?us-ascii?Q?x8Ljdef7Q9aEpUUJ8GSI8mbVbnAb+P8/jRNQZx++yciLbNci9Kd0NnV3nYtw?=
 =?us-ascii?Q?EErgsVEu6o8lcvXyp+WvhnokqmG1jrIFmr+f9k+cfzszyG4CijkupDy3bfB4?=
 =?us-ascii?Q?NOJzDgzcZNJ99KmX/oYgrftd6cPLmYcmy0Kf7jipyvJ9YOHG7fJzjMW0CmvP?=
 =?us-ascii?Q?VR41IRhB07JJ18m3wV4yiie/oWewBe+R9G1AI4SN3lMn8Qd458ZcGulWzAWj?=
 =?us-ascii?Q?vEmzO8gWrnfaRv6xlWAPWjjIILqTnW1iFT8PUlfZ2cjqvznRfaRoZJTFioHv?=
 =?us-ascii?Q?CjjM55Nez9zyamKeKPEIUQhoJyIqWZVCrtBDzz89UimLS9e/3r0QL8nd7tlh?=
 =?us-ascii?Q?yqA5eSCUucv+Q5CHDSGuid3yKzGoqcU2wlQn6kb+7SJbZ+JdeC0sH8anyknA?=
 =?us-ascii?Q?dkDGmvGyjSWqIix6GvWkF3yN3MEjAYzIO0uw1AcVoe4fvZ6iiOfZquHte5Ou?=
 =?us-ascii?Q?aBY3TfCjHDojZW3IrHVHknlEhpl0IgFhSBo4OzpG3kPJ3YFVuAbnx7Hh3Cff?=
 =?us-ascii?Q?FBk5sR7T3N5DJ4XuysKLbbpZYuSjSJj5sFk1N1hsNbJLYVR2XzY9NJt9nQMs?=
 =?us-ascii?Q?SS1fQWuqE60okc6/bXFx+RtijW1VhNzFT5CKyn3giVF/wQ1SuQ0P7nMOaio1?=
 =?us-ascii?Q?9JnFHXZnnP53ERfDEwGAqJ6aFViJq/wqgL50DOlz3NTxBLWvwrvoQ+TlY4mT?=
 =?us-ascii?Q?y58uhEQSx1r5N5+kZNsMtrNZg8IBKnUuPglPuSYGSfcS643iJC1X+dePShsl?=
 =?us-ascii?Q?KwK6qwUoTG1pT3oDOkCTr2+7PmejvR0bDmsGCLXRqfTR9Cro8xUinRq+A1Ec?=
 =?us-ascii?Q?m3X2Ua4ncbf+y9I9qCS6TdTBxSz0jKmDAPmSOkc5RUUBwH58VLrIxqsxNPHW?=
 =?us-ascii?Q?Oez7LufTmB++lzv1KT02M6WhoV/0ZIB8D4yRYoUw2xiP9Z2gfKbvZ0nDUEw4?=
 =?us-ascii?Q?xiSM5sAV01mBYCOPAcsukCE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: melinkcorp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR20MB3948.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6884cd9c-0305-42f1-5265-08d9e761a712
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2022 22:08:04.9694
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d06db0f9-efcc-42b5-9f8c-c934a01c9bfd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 r3I9FwlLmsUZLmVvQ0kkKXym6/Sg9owgRlEZlZxaAa4HvQ+Nj5U3emK9YNvpULrQo1zab6vIgL5LQs59uNKWgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR20MB2753
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 22:08:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161326

Other packages may use busybox applets in their installation
scripts.  If busybox is also being upgraded, other package upgrades
may run between when the old busybox alternative links are removed
and when the new alternative links are installed.  This may prevent
other packages from installing correctly.

Copies the busybox binary and busybox.links files to a temporary
directory.  Installs temporary alternative links for each listed
link that points to the temporary binary that are live during the
busybox installation process.

Removes the prerm and populate_packages_updatealternatives steps
that were intended for the same purpose.

Tested with an core-image-minimal based image which uses opkg for
its package manager and sysvinit for init.

Signed-off-by: Bryan Evenson <bevenson@melinkcorp.com>
---
 meta/recipes-core/busybox/busybox.inc | 156 +++++++++++++-------------
 1 file changed, 78 insertions(+), 78 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busy=
box/busybox.inc
index 622325aabb..c0b63ad2c0 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -387,95 +387,95 @@ python do_package:prepend () {
         set_alternative_vars("${sysconfdir}/busybox.links.suid", "${base_b=
indir}/busybox.suid")
 }
=20
-# This part of code is dedicated to the on target upgrade problem.  It's k=
nown
-# that if we don't make appropriate symlinks before update-alternatives ca=
lls,
-# there will be errors indicating missing commands such as 'sed'.
-# These symlinks will later be updated by update-alternatives calls.
-# The update-alternatives.bbclass' postinst script runs firstly before oth=
er
-# postinst, but this part of code needs run firstly, so add this funtion.
-python populate_packages_updatealternatives:append() {
-    postinst =3D """
-test -n 2 > /dev/null || alias test=3D'busybox test'
-if test "x$D" =3D "x"; then
-    # Remove busybox.nosuid if it's a symlink, because this situation indi=
cates
-    # that we're installing or upgrading to a one-binary busybox.
-    if test -h ${base_bindir}/busybox.nosuid; then
-        rm -f ${base_bindir}/busybox.nosuid
-    fi
-    for suffix in "" ".nosuid" ".suid"; do
-        if test -e ${sysconfdir}/busybox.links$suffix; then
-            while read link; do
-                if test ! -e "$link"; then
-                    # we can use busybox here because even if we are using=
 splitted busybox
-                    # we've made a symlink from /bin/busybox to /bin/busyb=
ox.nosuid.
-                    busybox rm -f $link
-                    busybox ln -s "${base_bindir}/busybox$suffix" $link
-                fi
-            done < ${sysconfdir}/busybox.links$suffix
-        fi
-    done
-fi
-if grep -q "^${base_bindir}/bash$" $D${sysconfdir}/busybox.links*; then
-    grep -q "^${base_bindir}/bash$" $D${sysconfdir}/shells || echo ${base_=
bindir}/bash >> $D${sysconfdir}/shells
-fi
-
-"""
-    d.prependVar('pkg_postinst:%s' % pkg, postinst)
-}
-
-pkg_postinst:${PN}:prepend () {
-        # Need path to saved utils, but they may have be removed on upgrad=
e of busybox
-        # Only use shell to get paths. Also capture if busybox was saved.
-        BUSYBOX=3D""
-        if [ "x$D" =3D "x" ] ; then=20
+pkg_postinst:${PN}:append () {
+        if [ "x$D" =3D "x" ] ; then
+           # Older versions may have added a temporary directory and an al=
ternative
+           # to sh in a prerm step.  Remove these if they are present.
            for busybox_rmdir in /tmp/busyboxrm-*; do
                if [ "$busybox_rmdir" !=3D '/tmp/busyboxrm-*' ] ; then
-                  export PATH=3D$busybox_rmdir:$PATH
                   if [ -e $busybox_rmdir/busybox* ] ; then
                     BUSYBOX=3D"$busybox_rmdir/busybox*"
+                    update-alternatives --remove sh $BUSYBOX
+                    rm -f $BUSYBOX
                   fi
                fi
            done
-        fi
-}
=20
-pkg_postinst:${PN}:append () {
-        # If busybox exists in the remove directory it is because it was t=
he only shell left.
-        if [ "x$D" =3D "x" ] ; then
-           if [ "x$BUSYBOX" !=3D "x" ] ; then
-              update-alternatives --remove sh $BUSYBOX
-              rm -f $BUSYBOX
-           fi
+           # Remove the temporary alternatives
+           for busybox_preinstdir in /tmp/busyboxpreinst-*; do
+               if [ "$busybox_preinstdir" !=3D '/tmp/busyboxpreinst-*' ] ;=
 then
+                  BUSYBOX_PREINST_DIR=3D"$busybox_preinstdir"
+                  BUSYBOX=3D"$BUSYBOX_PREINST_DIR/busybox"
+                  if [ -e $BUSYBOX ] ; then
+                      for suffix in "" ".nosuid" ".suid"; do
+                          if [ -e $BUSYBOX_PREINST_DIR/busybox.links$suffi=
x ] ; then
+                              while read link; do
+                                  update-alternatives --remove $($BUSYBOX =
basename $link) $BUSYBOX
+                              done < $BUSYBOX_PREINST_DIR/busybox.links$su=
ffix
+                          fi
+                      done
+                  fi
+                  rm -rf $BUSYBOX_PREINST_DIR
+               fi
+           done
         fi
 }=20
=20
-pkg_prerm:${PN} () {
-	# This is so you can make busybox commit suicide - removing busybox with =
no other packages
-	# providing its files, this will make update-alternatives work, but the u=
pdate-rc.d part
-	# for syslog, httpd and/or udhcpd will fail if there is no other package =
providing sh
-	tmpdir=3D`mktemp -d /tmp/busyboxrm-XXXXXX`
-	ln -s ${base_bindir}/busybox $tmpdir/[
-	ln -s ${base_bindir}/busybox $tmpdir/test
-	ln -s ${base_bindir}/busybox $tmpdir/head
-	ln -s ${base_bindir}/busybox $tmpdir/sh
-	ln -s ${base_bindir}/busybox $tmpdir/basename
-	ln -s ${base_bindir}/busybox $tmpdir/echo
-	ln -s ${base_bindir}/busybox $tmpdir/mv
-	ln -s ${base_bindir}/busybox $tmpdir/ln
-	ln -s ${base_bindir}/busybox $tmpdir/dirname
-	ln -s ${base_bindir}/busybox $tmpdir/rm
-	ln -s ${base_bindir}/busybox $tmpdir/sed
-	ln -s ${base_bindir}/busybox $tmpdir/sort
-	ln -s ${base_bindir}/busybox $tmpdir/grep
-	ln -s ${base_bindir}/busybox $tmpdir/tail
-	export PATH=3D$PATH:$tmpdir
-
-        # If busybox is the shell, we need to save it since its the lowest=
 priority shell
-        # Register saved bitbake as the lowest priority shell possible as =
back up.
-        if [ -n "$(readlink -f /bin/sh | grep busybox)" ] ; then
-           BUSYBOX=3D$(readlink -f /bin/sh)
-           cp $BUSYBOX $tmpdir/$(basename $BUSYBOX)
-           update-alternatives --install /bin/sh sh $tmpdir/$(basename $BU=
SYBOX) 1=20
+pkg_preinst:${PN} () {
+
+        # Create a temporary copy the busybox binary and the links files. =
 Then,
+        # install an alternative link for all the links.  Other packages u=
se these
+        # commands during their upgrade process.  This ensures the links a=
re available
+        # to all the other packages.  We do this in the preinst step becau=
se it is
+        # the first step guaranteed to be used from the new package.  The =
prerm is
+        # used from the old package.  Placing this here ensures it runs on=
 upgrade even
+        # on older systems.
+
+        if [ "x$D" =3D "x" ] ; then
+           # Create a temporary directory for the busybox binary and the l=
ink lists
+           BUSYBOX=3D${base_bindir}/busybox
+           BUSYBOX_TMP_DIR=3D`$BUSYBOX mktemp -d /tmp/busyboxpreinst-XXXXX=
X`
+           BUSYBOX_TMP_LOC=3D"$BUSYBOX_TMP_DIR/busybox"
+           $BUSYBOX cp $BUSYBOX $BUSYBOX_TMP_LOC
+
+           # Commands needed by update-alternatives may not exist anymore.=
  Set softlinks
+           # for these commands so update-alternatives will function.
+           $BUSYBOX ln -s $BUSYBOX_TMP_LOC $BUSYBOX_TMP_DIR/[
+           $BUSYBOX ln -s $BUSYBOX_TMP_LOC $BUSYBOX_TMP_DIR/test
+           $BUSYBOX ln -s $BUSYBOX_TMP_LOC $BUSYBOX_TMP_DIR/head
+           $BUSYBOX ln -s $BUSYBOX_TMP_LOC $BUSYBOX_TMP_DIR/sh
+           $BUSYBOX ln -s $BUSYBOX_TMP_LOC $BUSYBOX_TMP_DIR/basename
+           $BUSYBOX ln -s $BUSYBOX_TMP_LOC $BUSYBOX_TMP_DIR/echo
+           $BUSYBOX ln -s $BUSYBOX_TMP_LOC $BUSYBOX_TMP_DIR/mv
+           $BUSYBOX ln -s $BUSYBOX_TMP_LOC $BUSYBOX_TMP_DIR/ln
+           $BUSYBOX ln -s $BUSYBOX_TMP_LOC $BUSYBOX_TMP_DIR/dirname
+           $BUSYBOX ln -s $BUSYBOX_TMP_LOC $BUSYBOX_TMP_DIR/rm
+           $BUSYBOX ln -s $BUSYBOX_TMP_LOC $BUSYBOX_TMP_DIR/sed
+           $BUSYBOX ln -s $BUSYBOX_TMP_LOC $BUSYBOX_TMP_DIR/sort
+           $BUSYBOX ln -s $BUSYBOX_TMP_LOC $BUSYBOX_TMP_DIR/grep
+           $BUSYBOX ln -s $BUSYBOX_TMP_LOC $BUSYBOX_TMP_DIR/tail
+           $BUSYBOX ln -s $BUSYBOX_TMP_LOC $BUSYBOX_TMP_DIR/cp
+
+           # Export the path to the temporary directory so update-alternat=
ives can find the
+           # new links
+           OLD_PATH=3D$PATH
+           export PATH=3D$PATH:$BUSYBOX_TMP_DIR
+
+           # Go through all the links and install an alternative that poin=
ts to the temporary
+           # busybox binary.
+           for suffix in "" ".nosuid" ".suid"; do
+               if [ -e ${sysconfdir}/busybox.links$suffix ] ; then
+                   cp ${sysconfdir}/busybox.links$suffix $BUSYBOX_TMP_DIR
+                   while read link; do
+                       # Old packages may have installed an alternative to=
 sh at priority 1.
+                       # Install these at priority 2 to avoid conflict.
+                       update-alternatives --install $link $(basename $lin=
k) $BUSYBOX_TMP_LOC 2
+                   done < $BUSYBOX_TMP_DIR/busybox.links$suffix
+               fi
+           done
+
+           # Reset PATH to its previous value
+           PATH=3D$OLD_PATH
         fi
 }
=20
--

