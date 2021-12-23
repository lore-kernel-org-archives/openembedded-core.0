Return-Path: <bevenson@melinkcorp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1539EC433EF
	for <webhook@archiver.kernel.org>; Thu, 23 Dec 2021 14:49:51 +0000 (UTC)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (NAM02-DM3-obe.outbound.protection.outlook.com [40.107.95.108])
 by mx.groups.io with SMTP id smtpd.web09.33814.1640270990121150499
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Dec 2021 06:49:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@melink.onmicrosoft.com
 header.s=selector1-melink-onmicrosoft-com header.b=oD6xkMUp;
 spf=pass (domain: melinkcorp.com, ip: 40.107.95.108,
 mailfrom: bevenson@melinkcorp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ad6DLTJZALU3FCVq+kQJQV63USyNECcSJLqi0HqBsLXZmxGnDKcvcH1somnxZhdv0v0842Pbm8FzG+1fcYdWQuaKRDkKXvKLvR5ZuozPWRI3IPoEg8nUD+EmX9kT3gSVHZGWTRin9KpbIKeMoe3pRvNK5m24iVEcw0/9W4idOO9EyDQMQ0ZNKYbuzv/p7RO13OqFisOzo+pryPZU53jNAnr2j2KJFhAj/N5OVec/bnG0nlDQdXm2p0BSoJyjLwhn9qeylGaRNqvUZiQ8AQX5FNl8mzCSKmotSRRkKIzIyh6jP12O7JWD4N9UJeg32bu2eJFhj7BJC/a+HkjFmHDSNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5HaSssmK5u2XQSmMleK2di9ekeL1p1Kq7eGyz2on4DE=;
 b=axYBmQoCsdTpeGIt6zlNsyDcK8XFQlFfpLNHffjltfGtD0VEtFshHLhCxe/Gd3zSwM1iiR7cvzeR5P3iVNoX53xlp5A5O55ooy7RwXwQJ4fvVfS1dA7VfNYbrBBYBL+pPB2JLtvk2r7LvtACNkr1CYOQfmqLCR3rLHYcI01swDB8/7cGiUJgOB3zpdpsfMz3LIc0+ceigY3zAY5lpE/2CNxh2vFckSlQc15spgPn3741edqcCbcEFeno5Xe3hwWPYY7r0dvbggG+wDXe3saef7B4Q7FqO4q7FEsyetrDO0nhq5XLOxdCwbHmDEsVSTIv5crPJBRqYFgXKqGK/Cptmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=melinkcorp.com; dmarc=pass action=none
 header.from=melinkcorp.com; dkim=pass header.d=melinkcorp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Melink.onmicrosoft.com; s=selector1-Melink-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5HaSssmK5u2XQSmMleK2di9ekeL1p1Kq7eGyz2on4DE=;
 b=oD6xkMUp/LN+8sIBZJU38xDabcE2AhdHxhzM76eVb9Hj063YwtVzBdJnpvuSvft+HQc2oq1lW+rmLTNDc/G5tZ1XGRt/TM6nBF2a3jR4cUanvEZoN978Ph7eNsYz4yJIzJ0Yz1rZcrSiRNGZReHMGHgdQAfvcbECIAGKwuFErBPcAyAtbTOoojD3h99JbdpcZ1APOykmBzx4afMUgA63d3plP88EjMa+DyWhAva8iHs33fhDV/0uO7Wm9hV+SkGac5Xo3OyUiHr3gs0lsX03oruA+7wpdVsF7LCbi3401FhN5grHc+nPZkap5nuq0C2fj/Dfqq3flkGX5AEeqslHLw==
Received: from BN0PR20MB3941.namprd20.prod.outlook.com (2603:10b6:408:128::6)
 by BN8PR20MB2418.namprd20.prod.outlook.com (2603:10b6:408:cf::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Thu, 23 Dec
 2021 14:49:48 +0000
Received: from BN0PR20MB3941.namprd20.prod.outlook.com
 ([fe80::a135:a38f:bc6:2179]) by BN0PR20MB3941.namprd20.prod.outlook.com
 ([fe80::a135:a38f:bc6:2179%9]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 14:49:47 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [dunfell][PATCH RFC] busybox.inc: Create temporary busybox links
 during install
Thread-Topic: [dunfell][PATCH RFC] busybox.inc: Create temporary busybox links
 during install
Thread-Index: Adf4C8WwNtN7PfwiTMOvhQxL/f6ORQ==
Date: Thu, 23 Dec 2021 14:49:47 +0000
Message-ID: 
 <BN0PR20MB3941083EB28A3B5AB04EFAC5BB7E9@BN0PR20MB3941.namprd20.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-bromium-msgid: 3f47a32b-a09c-4827-8699-2a385b915b84
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=melinkcorp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: db03c069-45f0-4619-9e47-08d9c623775c
x-ms-traffictypediagnostic: BN8PR20MB2418:EE_
x-microsoft-antispam-prvs: 
 <BN8PR20MB2418BA5E37FDFD9BD329F426BB7E9@BN8PR20MB2418.namprd20.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 GcFMrcJD5gGkrHeBJ4KNgprqtsfaIy9oKrAWOA2drRCWG+clKlhFT/O8GQipCnvAzzzHi616Cm/aH9QgNF5d3KlEfz2ahXdTXDnAFW6Iw61WBoP+5yfIXP8lOabZlOj+ypiQgZtDOnbc3bwncKU3AE1jI5Zp6NUKzX1VOSwh0pF6RaRukqnhtoRvlhgbi8DOgqgWIfeoOKQ5l3CKN5bkMV+Q/vKvJ3jQb4EXoGyh4+6B8co9EJtHAxHUiK6s+KAfXplNCYPeo+govJR/VEtbKz5HFbFxx85ZDLCdCx6w3uw87Ptz8MLjKipA2qcZ9C3FVvuXa6/Ij04Z8TmrgoSlJwnmtC2H96rt050cjd3gyzCWCv3g5bOYfCXu/cRxh7IFAPHVa+aE6gDZX70b6TWx3/Wzr1+VcDYCDTYNDFTKpgp78UDwarLLbc7rwpJoLI/UC5+22zmuBVAX9kED9RxtKVSxDozoEaHT0wClMgg2ssnjRLnAjxVmH6Ofprlj0yJ3zu1S0UYIaXcj01DIKYXb971PBazUTDrP51OvEiYEwd/OOZd9Cq5kk75tAdObGh/mZsEx8VW5ehSsxVgnoBRQXMCPzM2e6cCZ4XWzomq1OLrLuR9f3+tshji8q7nnKbN4E2zgsOd2g+CGNx87pOwMVJVQaSNNSum0EbB8BnfzUFc+jLQbnbs6rpQT7gVB63WHODFEMaLQfvwh9kns+gUvAWfYavtFrT8di1hvKBdDK2OLkaEyXtRME6KLn7ckWgHYqPbnbRXYlTfQKEe6IzaWzb3fl9zSdLBIuIYjyx8NhXo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR20MB3941.namprd20.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(396003)(136003)(366004)(39840400004)(7696005)(2906002)(83380400001)(38070700005)(6916009)(6506007)(38100700002)(5660300002)(316002)(122000001)(52536014)(55016003)(76116006)(66946007)(66446008)(8676002)(186003)(64756008)(66476007)(9686003)(26005)(508600001)(966005)(33656002)(71200400001)(8936002)(86362001)(66556008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?ylJ961vGKvhZaCh1aQKx1HvuUhoUl66GziJuMRzRRc8UJE0PRICtgr/dXtPp?=
 =?us-ascii?Q?ScTOSM+Hi/y2qXVF2oX1zsNJU3uquzdKzEmGmAGYARzeoIjWb8ZDbSBA3fq+?=
 =?us-ascii?Q?w0XL31B58raIj+Ozl4kx9OCMWeV/g4pKMlE4U8hzN/HMwIgGQz3AFrUyGeoJ?=
 =?us-ascii?Q?r22Ks1j68QfBVMP91tEcde2ZwTMTm4HFjUSW6OhU6KcvdMbm6J785hpSMGaH?=
 =?us-ascii?Q?7UNzc9Epx1BKJqKCAZBDbXT2ReGLXed9ya8+X36sAJccad+EdSsqtqaz8gDL?=
 =?us-ascii?Q?P18Ho2/VmWk7sOp4DBwHj/vF2QiSA2pX1Bxv0W6/dm3/BXrDCTcjy3kvi6XF?=
 =?us-ascii?Q?3mZzRLAkfKDRcuNjk1g7+PmuFKi6s3QnSRcoQXLxoQM91L9IzkDtVKM5CTx9?=
 =?us-ascii?Q?0yee9Bfi9D1o9lU+PUMfuphtji+qYA+P4C2vu0PmUAf17Ql6j+mbjw5XH7op?=
 =?us-ascii?Q?7vatxt7pn+gWTU32zaDQZBWlxwjYN+kmfA1IZimiVzWDOh2ajZ3vFR2h67S3?=
 =?us-ascii?Q?DEbF62/UoMNQIlFDv5bKNgPxHqtiF/T4pGFf9RuC1fzUKbKpE/QQaemQY6ah?=
 =?us-ascii?Q?lp3cJf4ILCPfkm67gWkBLzfNC0mLV6Nf1bA1GgtwmB/lc3rwqrGlStLwCEWK?=
 =?us-ascii?Q?wPmLkJfJVFTfHvj7CtQ57alVxmPvZagOYvlxAo6RuZ26Kt+skLQ75fvkJbH+?=
 =?us-ascii?Q?sArWewxzW+cwABi3FeqYqLzS6w3VMpwOOVsFFAHATLhPdLofANlqURb7e6Vl?=
 =?us-ascii?Q?nV6FkGKRKFMyIVqU7gehJwt7ZgEMApjwplKuSZR+agU8gA86tZD0MAh+O6/x?=
 =?us-ascii?Q?ceG1bJycoFglpd+xBez90IGhR2ZjNcRFuW/7IgUv6J+nH3zKlo46MQKjkTso?=
 =?us-ascii?Q?gGPo60BDTgzPzMzVB/SsRFjIR9vIPSOkP+GS/uJnHi30JLDJJ1RQrLvjJon7?=
 =?us-ascii?Q?nB4ljyo8QutyfN+lmVSxlU1vqMfioVTA/9UhZ70iVpoaMGuTuhz8VxmlxfJR?=
 =?us-ascii?Q?urAWdhdZ5SEUiV+EWJYU/UocD4RzQo1JoK72S4KpppYpEH69IfUq2C0ZikQN?=
 =?us-ascii?Q?5UDBXVFzoM45YtPNNpq9hgQJc8Tr5bjpbaHCq5v+NX3pVqK+kCcfCVDiRVSK?=
 =?us-ascii?Q?z6UqTT0lCj+oq7nK5jQXwTpXeTByQR2vMosuManDBXThygCufOErpY/J4b/O?=
 =?us-ascii?Q?kXGhe16UwerI9Ef1+UxXTNmLUhM4Y6j/HoN08lgYb9gj3t8y2AdnTjuzFUFJ?=
 =?us-ascii?Q?xtfVuXYc0TM9reMpCZlB4AlVc7BIvcFUmu+jVU/0dGy7t2d0n8ddciTmJGs5?=
 =?us-ascii?Q?0WUFNGYtaI5NAGzhOA3zTBNC4ZM6akxkVoimnjRgt3jbHlSvepV46eJFlP2t?=
 =?us-ascii?Q?SbTTurB/tSkNUo/kSSXZfGsBoxHuqCZdcgQuNhDzT/9HlC2Ykpo3rs/Y8Tcp?=
 =?us-ascii?Q?ktgK/DF6KQzUgzZ2hkU/8mmaksVTT/uwGZH0ldwH0nFhC/l0Eem8dlpH0/x0?=
 =?us-ascii?Q?zAXX5Rakn98AvGl/JvPo+5aIq/UBwudsZkK9eTR6G4FGGAbwQjFKpZ/d6a8C?=
 =?us-ascii?Q?SD2kPU6S/9wwc9J3IvVOK+ArR9+PnO0j3cI8lZKGAoLgxWHL0s7cc7Hyzz3v?=
 =?us-ascii?Q?qg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: melinkcorp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR20MB3941.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 db03c069-45f0-4619-9e47-08d9c623775c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2021 14:49:47.6626
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d06db0f9-efcc-42b5-9f8c-c934a01c9bfd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 6rdY+1ReaCzEmnClq+7w+p8x7css67nWKv4tlLEG6vxGvqdRVCrUpRk49JAFLp1C6ZiKdzcgdVyeUCRLS6ubJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR20MB2418
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Dec 2021 14:49:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159985

Busybox upgrades sometimes fail, especially if there is a major distributio=
n
upgrade and all packages need to be updated.  Success is highly dependent
on the package upgrade order.

Commit [1] attempts to ensure a shell is still present by adding an
alternative to /bin/sh if busybox is the only shell.  However, if busybox
is not the only shell present and the other shells are upgrading, it may
then be possible that all shells will be removed during the upgrade process=
.

Commit [2] creates temporary symbolic links for all the busybox links durin=
g
busybox's postinst step.  However, this is too late in the process as some
packages attempt to use 'rm' and 'sed' after update-alternatives removes th=
e
old links and prior to when busybox's postinst step runs.

This fix is similar to [2] but runs during the preinst step.  For opkg,
this is the first step that is guaranteed to run from the new package (prer=
m
is run from the old package) and will therefore be a backwards-compatible f=
ix
for upgrading older systems.

Copies the existing busybox binary and the busybox.links files to a tempora=
ry
directory and then creates alternative links for all installed busybox
commands.  The temporary links and directory are cleaned up during the
postinst step.

RFC: This works for me, but there may be room for improvement.  I don't kno=
w
if the current pkg_prerm steps are necessary anymore.  However, in my testi=
ng
I did need the links for update-alternatives to work in the preinst step. I
am also not certain if the populate_packages_updatealternatives_append
step is necessary anymore.  I have also only tested this fix on dunfell, as
I don't have a working image based on master yet.  It may be more appropria=
te
for this to go to master and then be backported to dunfell, but I would nee=
d
assistance in testing.

[1] https://git.openembedded.org/openembedded-core/commit/meta/recipes-core=
/busybox/busybox.inc?id=3Da9d2af8f5b3da8239cf00a52883ca596a19ea23a
[2] https://git.openembedded.org/openembedded-core/commit/meta/recipes-core=
/busybox/busybox.inc?id=3D3a035bd0a06a6ded4d0ce7e35a3bce42245727d2

Signed-off-by: Bryan Evenson <bevenson@melinkcorp.com>
---
 meta/recipes-core/busybox/busybox.inc | 57 ++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busy=
box/busybox.inc
index e0522be729..c85402411b 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -441,12 +441,28 @@ pkg_postinst_${PN}_prepend () {
 }
=20
 pkg_postinst_${PN}_append () {
-        # If busybox exists in the remove directory it is because it was t=
he only shell left.
         if [ "x$D" =3D "x" ] ; then
+           # If busybox exists in the remove directory it is because it wa=
s the only shell left.
            if [ "x$BUSYBOX" !=3D "x" ] ; then
               update-alternatives --remove sh $BUSYBOX
-              rm -f $BUSYBOX
            fi
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
@@ -480,6 +496,43 @@ pkg_prerm_${PN} () {
         fi
 }
=20
+pkg_preinst_${PN} () {
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
+       =20
+        if [ "x$D" =3D "x" ] ; then
+           # update-alternatives may need the links from commands added in=
 the prerm step
+           # to operate.  Make sure we can get to that path.
+           for busybox_rmdir in /tmp/busyboxrm-*; do
+               if [ "$busybox_rmdir" !=3D '/tmp/busyboxrm-*' ] ; then
+                  export PATH=3D$busybox_rmdir:$PATH
+               fi
+           done
+
+           # Create a temporary directory for the busybox binary and the l=
ink lists
+           BUSYBOX=3D${base_bindir}/busybox
+           BUSYBOX_TMP_DIR=3D`$BUSYBOX mktemp -d /tmp/busyboxpreinst-XXXXX=
X`
+           BUSYBOX_TMP_LOC=3D"$BUSYBOX_TMP_DIR/busybox"
+           $BUSYBOX cp $BUSYBOX $BUSYBOX_TMP_LOC
+
+           # Go through all the links and install an alternative that poin=
ts to the temporary
+           # busybox binary.
+           for suffix in "" ".nosuid" ".suid"; do
+               if [ -e ${sysconfdir}/busybox.links$suffix ] ; then
+                   $BUSYBOX cp ${sysconfdir}/busybox.links$suffix $BUSYBOX=
_TMP_DIR
+                   while read link; do
+                       update-alternatives --install $link $($BUSYBOX base=
name $link) $BUSYBOX_TMP_LOC 1
+                   done < $BUSYBOX_TMP_DIR/busybox.links$suffix
+               fi
+           done
+        fi
+}
+
 pkg_postrm_${PN} () {
         # Add path to remove dir in case we removed our only grep
         if [ "x$D" =3D "x" ] ; then
--=20
2.17.1

