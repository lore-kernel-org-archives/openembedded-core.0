Return-Path: <bevenson@melinkcorp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DE43C4332F
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 13:29:20 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.111])
 by mx.groups.io with SMTP id smtpd.web08.11616.1642771751901000359
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jan 2022 05:29:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@melink.onmicrosoft.com
 header.s=selector1-melink-onmicrosoft-com header.b=jbQ4MKLz;
 spf=pass (domain: melinkcorp.com, ip: 40.107.94.111,
 mailfrom: bevenson@melinkcorp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PODisZC/TV5zap5dlPHkMHqnDm69xQCvMgV1NNiuwAVnnKO0GjrHsFTcvznW8PbsT3RSS+l/D4z1Ro+pAUfRXk6XJ8iJ1992E6BCaFQ5dq461bcTzDqnxavvdWi9qZb+poGdc9yvDMXNwOG2yRUC9k7SvMeqVJqz3ZDd2ihRzr+0Xz6VssT7Ih4NNby5Y/qXW5yc0P4+J1SrFKa31RIwU7hz52P7pBw8E5Ncc+/p3A11DzP6zoSS0IoqSR01EwIQbMuTsdfFl0Z3/x0AWefOhjBWYqHwNvX3RW89F9EtQwxXdmDQ8k8udO9KuaPdYwWdlG4mqHvmKDa2TQNlM21fcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kf6ZrUm1evod9kcFzavM3irR1Y3PMAnFFm8RPuErUAs=;
 b=kBeCM6TzFOUQSAS/o0yqb0jCQeuIViGuY0EsuPV9nndkJHLnclbqi6lRpSzdlpKsH5pOrxxqviiyC+jfod3SipP2B1Nybqf1IebF/T9ISSG7ClQvbUqCGL5qWPH3EoyrciVtMP9asdizII7SHR+Zag3hjPNR6ZUlG4WT/+qIzhiuWfbsvNqkbwu16uHooYo50QC4cbBkQkE7QSCN4hGrzOAykVAKh7yyJUkng2X5RLy0OWVORh2mPHiYOL1wZXKWRqKPh9s73RaJawtM4Hhj5Q6ASUXoJ4RcjS6Ey28ZA1yxDVUqm23tYFZ6Ln2VXPSzhs/KG/6FCRb+uWFS3NrrHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Melink.onmicrosoft.com; s=selector1-Melink-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kf6ZrUm1evod9kcFzavM3irR1Y3PMAnFFm8RPuErUAs=;
 b=jbQ4MKLzN1Qt4lsrMYpFeoLm1w2+9PCzV6V3IRPewE5n0T6i0ctLvQhRBSjrwlgBjcUl+3kwO77Y0ioELJzQRKKYaoxEKPJOve30abu/2HsvhSCWp6SBikv9voUZ0m/qNpG/My3BpjT5m5KIrlV3XirYDX8sptGYif0JRss90P9L0oXF2J2QQEBU3A5Ewh5dSLk/5CrT+mD06uG/blKN1J3TP+PcdwNMEqmeOgMyED8c5yIYULjLJAXDUHklur2KjuYCL/eg9YmqqmD+0pkhid3nugXGhuYymAcqDnUA3JmQa6jVxkuanMz62G4tZSjFbDbOb+mfT4wKFRt9icS4Jg==
Received: from CH0PR20MB3948.namprd20.prod.outlook.com (2603:10b6:610:c6::22)
 by DM6PR20MB2539.namprd20.prod.outlook.com (2603:10b6:5:1b1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.12; Fri, 21 Jan
 2022 13:29:10 +0000
Received: from CH0PR20MB3948.namprd20.prod.outlook.com
 ([fe80::5d6b:e641:470e:e3be]) by CH0PR20MB3948.namprd20.prod.outlook.com
 ([fe80::5d6b:e641:470e:e3be%5]) with mapi id 15.20.4909.011; Fri, 21 Jan 2022
 13:29:10 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Andrej Valek <andrej.valek@siemens.com>
Subject: RE: [dunfell][PATCH RFC] busybox.inc: Create temporary busybox links
 during install
Thread-Topic: [dunfell][PATCH RFC] busybox.inc: Create temporary busybox links
 during install
Thread-Index: Adf4C8WwNtN7PfwiTMOvhQxL/f6ORQWua5qA
Date: Fri, 21 Jan 2022 13:29:10 +0000
Message-ID: 
 <CH0PR20MB3948AC46EF12C3A3605BF32CBB5B9@CH0PR20MB3948.namprd20.prod.outlook.com>
References: 
 <BN0PR20MB3941083EB28A3B5AB04EFAC5BB7E9@BN0PR20MB3941.namprd20.prod.outlook.com>
In-Reply-To: 
 <BN0PR20MB3941083EB28A3B5AB04EFAC5BB7E9@BN0PR20MB3941.namprd20.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-bromium-msgid: 39c41bd0-d535-4062-982e-a63056ad7290
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=melinkcorp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b326cd7b-8323-4140-da29-08d9dce20207
x-ms-traffictypediagnostic: DM6PR20MB2539:EE_
x-microsoft-antispam-prvs: 
 <DM6PR20MB2539BC71664D3E8531D9CA12BB5B9@DM6PR20MB2539.namprd20.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 z1T8RBdEcB5nQjwIllZgeK59I0wfVPs8kXC4LFZ/IQfnUfR0u6Vq5obC/Ftob8ctWWONGg0FyfrGiPTaLX8iplOzkyQle1YmMj4Ju1HHXoq5ocVlMombZJ50DpgbaBpXHjmVhS4cln39v+eL7MNL7MCJjFhH4+TQzGQtj9FyW+Mowe4NV4zucTWBvm7teoft91RS7W8G4oBQortDDZZkktgLyYGDaSiFF0Yq0ukbAMaaeHNTFtrjwtJrWoqTnxNYLNoKIQy+IGT+S2sAvBgFNKQGRRL+Xb1ZRSDymtfKN9oIKk2LiqCUqi6Yk6YkUI0tUhzxKy6X+EFqCzwRX9YiPW7t6zSD6QE7DQ+wUmzWf++JAt+HJ+a9oKc60Yr/aBsQX5KtSOxVIybKBdfXcIznahC/Z/XzU9kVYaKd7a9AXnwO+KSOj1z/FWfCvFTmHKwDVO1fMHBJG23GKiCfHRMnoxrOyPDXh0nq04zYoftusr81bwfexOM5VXe1xknlS4Uxd20jlzxyBq8m/rM0526Y0cKoHZ9WVDXpHkq3KbeQbGPC83ghsSKMTT5GpsvgEkNM1Ao4S3y1okh9Og7gx1nfEvisV4qXg6DK1CMXd4UWu2gEkNH3w2NsvcjeWcip0hWNhavGeqnMRpa28ly6AFWRqSsVZ1q595dCYLbeO0HnuzULm0qU1IZtHc4yHBx0ff2WWYBhObBNtkZVaFD/+gFrX2LlUYH3mBoYrW66WngMpPxFdheWGwU07LnLCzvQa8Rqv+nEQHF9ynCcYo2p8Zk79a18VMU92X0Sv+Z96Wj4qJY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR20MB3948.namprd20.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(346002)(136003)(376002)(39840400004)(316002)(33656002)(122000001)(38100700002)(9686003)(26005)(186003)(86362001)(71200400001)(53546011)(83380400001)(4326008)(55016003)(52536014)(5660300002)(38070700005)(66946007)(66446008)(66556008)(66476007)(64756008)(8676002)(2906002)(8936002)(6506007)(7696005)(508600001)(76116006)(966005)(6916009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?8QSCGYiOt9kp3/nrFmZ11zmZ1F1VESmVsgm+oXwm9sPqgKUbC7QST13TyJJC?=
 =?us-ascii?Q?6tnrlcMlOEgKJ5bRvOK2Rtp298k3UZSSKNcbJ7r3w++JBmW9ORnHR3W4IKur?=
 =?us-ascii?Q?y1vt2TH6XYCXrABal7NwOSQ9rL2F2VOkGk4x2uC1T8xp6cS3Kltrj59l+sv/?=
 =?us-ascii?Q?3mPPh7T2QrTOQrLhADn2OHZkwGIABujNVD1MipWkagt/8MB2y4Oh3e9kc8t8?=
 =?us-ascii?Q?c44J8qjZXBxpgjIooviQLnySqFMX9PEEaHUQVH6h2Kur/XjyDfuhgQ1MexfI?=
 =?us-ascii?Q?d/GdpCy7bNNVGo8a0J8AWyt1LqlO1j86teTd62FmrDqSGtwtffbV0sHHYZiB?=
 =?us-ascii?Q?2qDcUVsiuuygLogrduRheSxC8FNKO//ALyiUthVReCMRFT8NYs0M5bY8RPSu?=
 =?us-ascii?Q?UNKHCfR+N8l7A7kARlIRsDR8z05UVO274CF8dnZFuhyfjdSLiKgpl30U+M1A?=
 =?us-ascii?Q?KJPNWX1WsNmkG6ocKqd8zx716prBCVYVvX2gsahpz5CE4XpPp4zRmB2bo+0D?=
 =?us-ascii?Q?u+ezrC8MUZ0Q5/8h9w0BGMSHuMumtQR9w1FBdHZ8P0wzHZPTdfx9ys1JbIdR?=
 =?us-ascii?Q?pPUHC5AT5NfeusavwMyjai+zrGQbKrF7GJEMaBqBHDweTxpRwt/WlaURId5j?=
 =?us-ascii?Q?mmj1m+bwwGuPZgNX88QurZYnKmzm0baAzC2eMYmpipXM3UYkSF0uHAindX3T?=
 =?us-ascii?Q?mJLYB2qe0MUYye7noORviNtXerMhrqELqn6XxuWm2nXLfRKkQYCmNpyuPemV?=
 =?us-ascii?Q?LF40PUom5wk0H3dlyOna5ET0rOV06cAycyybJCgY2TXXbWDz/pVbq0g9HyDd?=
 =?us-ascii?Q?eewMsg0ojDXm+P42vM7FGYNVeHI6CGD/UWSWoVC/vbxLH63B1TywD74LbDFY?=
 =?us-ascii?Q?sEi4YSAOccc0jkaVDGFEaQH5Jtz7eUnnJfg7ffcFzTrfhXRCPb+7bK4A3q+r?=
 =?us-ascii?Q?0Ib6WWlge37nM/6YdS+oUZfTw/W8pkG1HrLWnVMSWzagwOEk7rlNU/IRr6ah?=
 =?us-ascii?Q?NfLTICE+mHtwhPX4yP0EhW+5c+HL9R6DsG9WjbC7dBhocP8ddl5Jh6W7D7DE?=
 =?us-ascii?Q?eXCslsMNT9NRwjoCgTvdvx+mCrfv/B9LYRszQypu86BKTABSHRLig+rIrZAY?=
 =?us-ascii?Q?OpBigwGDMCUMsK5dZRyDTiIgzb+pw5dbWqXA9/zGqWcRugYGtrY8irNelN6W?=
 =?us-ascii?Q?00/60ai7BH2H/Tp8VH5mIQK+rRAoAazgppastfWhy12q1xzp+sYmujHCevdQ?=
 =?us-ascii?Q?Bv+gNZnziz+ZM5c0DWrCiaR9Eq1MTrfl2pXQoePs8qFA8woWgMFWyf3mkUuJ?=
 =?us-ascii?Q?y1cSsh1RiXWZREnspjcV9zbCtcH0FLovHTk+HYZOajxR3NWnktr43AnEGI+U?=
 =?us-ascii?Q?Fu+MORe1ywZBbTTZEcoBjrZBsSBsNpT8YhG12/CaWnoXaD7bU0G8TGQP2ksw?=
 =?us-ascii?Q?97+oecO0pd6zzk9XGNmvQTTrppOALHqyYH7liSprUQlvUwntfCgP4TlIP1MQ?=
 =?us-ascii?Q?jTaF4Pzv9uc/NvT9S9RM2qgUdwEjLv+CmdGQus3JB8MNjXrC+jChWLWI9WqH?=
 =?us-ascii?Q?q1GBt4kV80PtT+YemOuK7UCt8erEpRnX7XwEY22PipPr0PyvZ7cwi8Fh9U5A?=
 =?us-ascii?Q?Pg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: melinkcorp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR20MB3948.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b326cd7b-8323-4140-da29-08d9dce20207
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2022 13:29:10.2862
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d06db0f9-efcc-42b5-9f8c-c934a01c9bfd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 EZKUaikDyOTXPv4Yph0t4chX8O8hqfFGEJ2ULMPpW+v4nt+ORhARAgrWxSTMhkmgiehL0hB8jZYBqkB+pwt9iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR20MB2539
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jan 2022 13:29:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160824

All,

Ping on this RFC.  It works for me, but I have a feeling there is a better =
way to do this.  It still seems a little messy and could probably be simpli=
fied for the same effect.

Thanks,
Bryan

> -----Original Message-----
> From: Bryan Evenson
> Sent: Thursday, December 23, 2021 9:50 AM
> To: openembedded-core@lists.openembedded.org
> Subject: [dunfell][PATCH RFC] busybox.inc: Create temporary busybox links
> during install
>=20
> Busybox upgrades sometimes fail, especially if there is a major distribut=
ion
> upgrade and all packages need to be updated.  Success is highly dependent
> on the package upgrade order.
>=20
> Commit [1] attempts to ensure a shell is still present by adding an alter=
native
> to /bin/sh if busybox is the only shell.  However, if busybox is not the =
only
> shell present and the other shells are upgrading, it may then be possible=
 that
> all shells will be removed during the upgrade process.
>=20
> Commit [2] creates temporary symbolic links for all the busybox links dur=
ing
> busybox's postinst step.  However, this is too late in the process as som=
e
> packages attempt to use 'rm' and 'sed' after update-alternatives removes
> the old links and prior to when busybox's postinst step runs.
>=20
> This fix is similar to [2] but runs during the preinst step.  For opkg, t=
his is the
> first step that is guaranteed to run from the new package (prerm is run f=
rom
> the old package) and will therefore be a backwards-compatible fix for
> upgrading older systems.
>=20
> Copies the existing busybox binary and the busybox.links files to a tempo=
rary
> directory and then creates alternative links for all installed busybox
> commands.  The temporary links and directory are cleaned up during the
> postinst step.
>=20
> RFC: This works for me, but there may be room for improvement.  I don't
> know if the current pkg_prerm steps are necessary anymore.  However, in
> my testing I did need the links for update-alternatives to work in the pr=
einst
> step. I am also not certain if the
> populate_packages_updatealternatives_append
> step is necessary anymore.  I have also only tested this fix on dunfell, =
as I
> don't have a working image based on master yet.  It may be more
> appropriate for this to go to master and then be backported to dunfell, b=
ut I
> would need assistance in testing.
>=20
> [1] https://git.openembedded.org/openembedded-
> core/commit/meta/recipes-
> core/busybox/busybox.inc?id=3Da9d2af8f5b3da8239cf00a52883ca596a19ea23a
> [2] https://git.openembedded.org/openembedded-
> core/commit/meta/recipes-
> core/busybox/busybox.inc?id=3D3a035bd0a06a6ded4d0ce7e35a3bce42245727
> d2
>=20
> Signed-off-by: Bryan Evenson <bevenson@melinkcorp.com>
> ---
>  meta/recipes-core/busybox/busybox.inc | 57
> ++++++++++++++++++++++++++-
>  1 file changed, 55 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-
> core/busybox/busybox.inc
> index e0522be729..c85402411b 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -441,12 +441,28 @@ pkg_postinst_${PN}_prepend () {  }
>=20
>  pkg_postinst_${PN}_append () {
> -        # If busybox exists in the remove directory it is because it was=
 the only
> shell left.
>          if [ "x$D" =3D "x" ] ; then
> +           # If busybox exists in the remove directory it is because it =
was the only
> shell left.
>             if [ "x$BUSYBOX" !=3D "x" ] ; then
>                update-alternatives --remove sh $BUSYBOX
> -              rm -f $BUSYBOX
>             fi
> +           # Remove the temporary alternatives
> +           for busybox_preinstdir in /tmp/busyboxpreinst-*; do
> +               if [ "$busybox_preinstdir" !=3D '/tmp/busyboxpreinst-*' ]=
 ; then
> +                  BUSYBOX_PREINST_DIR=3D"$busybox_preinstdir"
> +                  BUSYBOX=3D"$BUSYBOX_PREINST_DIR/busybox"
> +                  if [ -e $BUSYBOX ] ; then
> +                      for suffix in "" ".nosuid" ".suid"; do
> +                          if [ -e $BUSYBOX_PREINST_DIR/busybox.links$suf=
fix ] ; then
> +                              while read link; do
> +                                  update-alternatives --remove $($BUSYBO=
X basename
> $link) $BUSYBOX
> +                              done < $BUSYBOX_PREINST_DIR/busybox.links$=
suffix
> +                          fi
> +                      done
> +                  fi
> +                  rm -rf $BUSYBOX_PREINST_DIR
> +               fi
> +           done
>          fi
>  }
>=20
> @@ -480,6 +496,43 @@ pkg_prerm_${PN} () {
>          fi
>  }
>=20
> +pkg_preinst_${PN} () {
> +        # Create a temporary copy the busybox binary and the links files=
.  Then,
> +        # install an alternative link for all the links.  Other packages=
 use these
> +        # commands during their upgrade process.  This ensures the links=
 are
> available
> +        # to all the other packages.  We do this in the preinst step bec=
ause it is
> +        # the first step guaranteed to be used from the new package.  Th=
e
> prerm is
> +        # used from the old package.  Placing this here ensures it runs =
on
> upgrade even
> +        # on older systems.
> +
> +        if [ "x$D" =3D "x" ] ; then
> +           # update-alternatives may need the links from commands added =
in
> the prerm step
> +           # to operate.  Make sure we can get to that path.
> +           for busybox_rmdir in /tmp/busyboxrm-*; do
> +               if [ "$busybox_rmdir" !=3D '/tmp/busyboxrm-*' ] ; then
> +                  export PATH=3D$busybox_rmdir:$PATH
> +               fi
> +           done
> +
> +           # Create a temporary directory for the busybox binary and the=
 link lists
> +           BUSYBOX=3D${base_bindir}/busybox
> +           BUSYBOX_TMP_DIR=3D`$BUSYBOX mktemp -d /tmp/busyboxpreinst-
> XXXXXX`
> +           BUSYBOX_TMP_LOC=3D"$BUSYBOX_TMP_DIR/busybox"
> +           $BUSYBOX cp $BUSYBOX $BUSYBOX_TMP_LOC
> +
> +           # Go through all the links and install an alternative that po=
ints to the
> temporary
> +           # busybox binary.
> +           for suffix in "" ".nosuid" ".suid"; do
> +               if [ -e ${sysconfdir}/busybox.links$suffix ] ; then
> +                   $BUSYBOX cp ${sysconfdir}/busybox.links$suffix
> $BUSYBOX_TMP_DIR
> +                   while read link; do
> +                       update-alternatives --install $link $($BUSYBOX ba=
sename $link)
> $BUSYBOX_TMP_LOC 1
> +                   done < $BUSYBOX_TMP_DIR/busybox.links$suffix
> +               fi
> +           done
> +        fi
> +}
> +
>  pkg_postrm_${PN} () {
>          # Add path to remove dir in case we removed our only grep
>          if [ "x$D" =3D "x" ] ; then
> --
> 2.17.1

