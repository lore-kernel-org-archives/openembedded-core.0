Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D569C48BC3
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 06:01:02 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.57])
 by mx.groups.io with SMTP id smtpd.web10.7663.1708408856560953059
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Feb 2024 22:00:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=J+rbr3H7;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.15.57, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lfjYV/MpGw1ZeQSPZKaHYcTKRdSmQ98nLh1LHTMjIeiT2rzzradSpNyyMm1qrzxIsW0VNC7HtoSmJHf3hcelHIWJ8Q4Pec/01Chlw3ZGDbt1S+zuJ4S/YMRak3JQCW9s4VUzJWQ1lYfy+B5GgfV8OqRj8qltx23DBHnGXh+cPicKI92KZLqL13/xGxk5qwdnDpSPuhygZLHUmo/h64ReDCqDKHVA6WV9RpxgjbxP+9m+HlfSm7vs9CMeW/yCDEGyk9StkiGQ3MWwrXJL9y5q/H+zqzeP3QBZFy+WRT5qhE+Is1k6v3ci2hhhFg+UFaxxOdwsWQf9W0CRc2mSmvOimQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yQtw3b04JhqJsQ29qNCq4eDFW/UuPoOFK2woHWhcuiE=;
 b=EiPAEhF0lJuN40AitlJ+ZX44syso03Bs47BjBRy/+Xv0LiImtmGn7Jw8kz1zVsoO7GjlgyvEbCWEVaS7stkr3hFgDqQW1dmBhRdkfKiFPc/XpMbJOhh7mFFH0uNFOXV0znneX4XQ5eSiyqOZUdzIfcNGXa21iwOoVvCGRn+i2n6KjvLMDPBI1ZK0PjaPNJb41B1ea7xaL5IxoJaV4XcKwE0aHaNIobZSI8ULrTEtmpefm08CME7Ybr7bVXlrJ/Y3QahfAPyz0QEpJNGKsa90f+Wh7qiOJXADS5jvQ2jW1mtaihgFJDKffKkIDgXOWSbyBQG4vQwCZmml1Msk1ST04g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQtw3b04JhqJsQ29qNCq4eDFW/UuPoOFK2woHWhcuiE=;
 b=J+rbr3H72Uovqxa/s9loa6hjht7S1wNJGPuKbicdZODPz5CAjVY02suPlfxo6dlKImH0MfBAAZySNUsZ2ueB98W3AWpRHy21cb8gEbNqcGTkvFr+ZrabYJ4BRKNIDK2XY3uQQTSkTMe/0kNgmZCbxNPVz9HHAKCEj0puHcUJ5yo=
Received: from PAXPR06MB7534.eurprd06.prod.outlook.com (2603:10a6:102:153::11)
 by AM7PR06MB6520.eurprd06.prod.outlook.com (2603:10a6:20b:11d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.37; Tue, 20 Feb
 2024 06:00:52 +0000
Received: from PAXPR06MB7534.eurprd06.prod.outlook.com
 ([fe80::c95a:be0:915a:e097]) by PAXPR06MB7534.eurprd06.prod.outlook.com
 ([fe80::c95a:be0:915a:e097%4]) with mapi id 15.20.7292.036; Tue, 20 Feb 2024
 06:00:51 +0000
From: SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 2/3] image.bbclass/rootfs: set&unpack
 package-database
Thread-Topic: [OE-core] [PATCH v2 2/3] image.bbclass/rootfs: set&unpack
 package-database
Thread-Index: AQHaXmNz8ls5h7DJKEiJlIzoGHWLfbERyl2AgAD5kMw=
Date: Tue, 20 Feb 2024 06:00:51 +0000
Message-ID: 
 <PAXPR06MB75340AA52D903B0C219F8C7CBC502@PAXPR06MB7534.eurprd06.prod.outlook.com>
References: <20240213100012.252237-1-johannes.schneider@leica-geosystems.com>
	 <20240213100012.252237-3-johannes.schneider@leica-geosystems.com>
 <ba662b54bfda53a4e3da6121091cfde260777191.camel@linuxfoundation.org>
In-Reply-To: 
 <ba662b54bfda53a4e3da6121091cfde260777191.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR06MB7534:EE_|AM7PR06MB6520:EE_
x-ms-office365-filtering-correlation-id: 1252874a-02cd-4697-1423-08dc31d94ae2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 2EvPfrj2J2XM21OIBZO+LMQwKL39HyhjfXPaWKmdC6qqWsZ3o+WzxkQ7lPU2ErolvvsES9PCt6eYLhRSzMUHUlDwB/5Zmj6yBQHQdHD8CAVg8+TME9B9ogrnX8FdKLO+nDDfov7AxJfdOM37fKEeKYuYNkAm1pdQoo36wDwhuBKhVoDZ2uRAjWNG+9xJ19JTt6sr2pSrq2H2sBdzl8clEwD1/WJUjlUtmhieql/qfDtIyyOvM4YGf427vAcht64VwetSoie0aJFgn7797sc0ab0iQtB9a6O/6MVbOpnnMj2aDz9A5hVw4mAVpuD5TailPc0goqlkSpNs3QJ8YwlfypfnWs9uGZP7HJpxe4edXHQKDgEii2FIzipjXUvPNwqdemCIh8JdUXAjndCFhQjV68rXCEnlOy/LuhUCuKHfqaOTnnHWMG95JHwg+fbwlpJNGYKd65ReD+pIrLz4E/QoX2AsIfri3nMjJGm/7HQKPeNfp6O1kuJyrANm47dox40IYdFKdjWfInh5KjE97OVHSahkmoCeJCyHVzyp966tdE1WX4zz/ffNUWmB8iq0tA7qVZ51mpVlRu5D27SRM+JoFh52UOV8ML1c4TYThB839rk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR06MB7534.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?Q5yAOChV/LFKeh/ppL+h631orYIoZMUdIaiwd18oObdKSDtdI2jQfZ3Gb7?=
 =?iso-8859-1?Q?5YGusQ+q0YnD2NcT2iImxLEYhJbg0fS0Rz1QMsiljrppqdYzpXrLwGTAmG?=
 =?iso-8859-1?Q?lF8KRuG/OvKPEB/7I7lFZWobVXPmYWHygKMuH0SqEuLdoxesj4C2k+5efp?=
 =?iso-8859-1?Q?fumk8eerijUbHnH1C+YKDVNsXh18fMD677gP3DpCGy3FnX7cIM7i4Zny04?=
 =?iso-8859-1?Q?zUvLJWVYTof59xFzDt5/Ls7ul06v4QUFa/IhF9HkfGg5xzxC9WeK8XlyHM?=
 =?iso-8859-1?Q?jm7g5DYCulm17BJlwzJwLiyQUj7XFlGs9CI9cMiq3aWLSZMR91OTGtB6Hh?=
 =?iso-8859-1?Q?aOld0DJ7O+PsNJhLL/fmDvBxdXZF5LI08hweR4IVp+pAVzAOzh/+qP9k0y?=
 =?iso-8859-1?Q?JuX2xIf2zYY9VF6/QyHHAx73skiESKT8MY8Fmx5xTxV0tDtkppHcFkJLW3?=
 =?iso-8859-1?Q?lxNqBC7eE7m/sP5qoPAg5wxWxwvOH5n6G1Ee0LCmJpKuKmFlvmNneivuCo?=
 =?iso-8859-1?Q?/dHNwbk8ua40DSDybw0AWfYXIz1lJhlub4UKuTKu/oQN1zI3k1t0WwLXgy?=
 =?iso-8859-1?Q?UwQjDMmmU2+3NUgFzoBenQ/fFp6xOVeahnJQCYXDq/eYiQ5uCk0kQKT8zB?=
 =?iso-8859-1?Q?av+9VdRy0WF4dgR2FEBvdmLROlHih6S/yPopTZBGHA35X1wJTS1qKBEGe7?=
 =?iso-8859-1?Q?sz7gkmt7J+xynCeoJGGh4G7oKsHNRmwudrNbX0pQyZzfiliA3r3jRViA7t?=
 =?iso-8859-1?Q?z2uOwi9pI/49bcPbiOx6TvuBu8c1HlXYDdjDV7Vdp7d9p9NS3He1k0w+eZ?=
 =?iso-8859-1?Q?aOdIAmar8yqpwt66XXsFjBtNxzoSnD/YUkhNWboVrkbZEgap0Qdm6Su17a?=
 =?iso-8859-1?Q?Lce9+J37pNNykKQ9qeSdOqTNNYvnr4Aq+Ut+dsEarvqB8iRxzSVPdzqg9i?=
 =?iso-8859-1?Q?0ik1djeVeUDuAFkdjgmn4rZK77N/RfehXul4dTb1twnzkMag41yh1VVl/w?=
 =?iso-8859-1?Q?HW3bWC2oZyFuu7D7FPXgIEZWcOJX0/lFxnxBfD6uwJSZaAKAuwOpDL5V81?=
 =?iso-8859-1?Q?CU7wrmK435AxawxDMeKPptZUx9wm8Le9bVZULSBSgJzjg77BXcJCBzTJ2D?=
 =?iso-8859-1?Q?DtLvot6BQtWIugZ25juzKMiugNGFF8R0TA5dn/ykcPJlDeNtmekTqBJ32y?=
 =?iso-8859-1?Q?PzTDtibUnHEYbQFdJdR5EqPzxoL9mE9LDUTjouoiQIg1KnIlGKwB6awcjc?=
 =?iso-8859-1?Q?O2gfQj3Imj+OiCVfrWxFZEwZEXkB4udJOCir5bYO7T3DR+8tal2F8nwbx2?=
 =?iso-8859-1?Q?dbxuFjNeEw520iJG6DRQlVSXDtcUNpLOK7MUj+7isDUZU8LNYXG/aU7xKU?=
 =?iso-8859-1?Q?PhH6FPCdiM9I67onVCH/OOCtIh2BGF65qnaWM0RAVuEZWO3ZbLfUf4PIrZ?=
 =?iso-8859-1?Q?8t9cRNzb1bBimCU+hsL+XEUREKbBrhqgha1UYbiEbKzrtBuI8PTpxH1yi0?=
 =?iso-8859-1?Q?eBszE5RXOr4/Ap8FqouTwB6/rz7ICl6JvN2/G/n8D0OVhxGlaho9YJWYs8?=
 =?iso-8859-1?Q?zwZMfdPZYJd1Q/cUAjRvQZ4TqmHvLsuc1mwi65NXETGk41Q3RbRdySB9yS?=
 =?iso-8859-1?Q?wnPStf0u8Mj4FDg9ww5zPuXZeaLpWgaeU6BgWCxxMciTiAV4JUFGDTs0es?=
 =?iso-8859-1?Q?xzhqt0ZsWDeIg03J218=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR06MB7534.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1252874a-02cd-4697-1423-08dc31d94ae2
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2024 06:00:51.3257
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wHXBNin83mRtwHhqsC6C2VWGmoPrOVMeJ54T6IhCJ5IhvHMYBKal7b2j1krGOmwuNiXwk6ABrGAyqYawAlZuE2Llf8uzqV+3dM+fP1lxU+ukATcftO2t8Hp+eaTAjQJw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR06MB6520
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 06:01:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195903

Hoi Richard,=0A=
=0A=
and thanks for the feedback!=0A=
your other mail is still being processed, but to get already back to you on=
 this one:=0A=
=0A=
>> set the package-database of a "lower image" to unpack and build upon whe=
n=0A=
>> installing packages for the current image. This way a lean image will be=
=0A=
>> created, which only holds the packages that are not already present in t=
he lower=0A=
>> image, that then could be used with overlayfs or systemd-sysext to exten=
d the=0A=
>> "lower image" on demand; for development purposes on an RO lower image f=
or=0A=
>> example.=0A=
>>=0A=
>> Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.c=
om>=0A=
>> ---=0A=
>>  meta/classes-recipe/image.bbclass         | 10 +++++++-=0A=
>>  meta/lib/oe/package_manager/deb/rootfs.py |=A0 2 ++=0A=
>>  meta/lib/oe/package_manager/ipk/rootfs.py |=A0 6 +++--=0A=
>>  meta/lib/oe/package_manager/rpm/rootfs.py |=A0 7 ++++--=0A=
>>  meta/lib/oe/rootfs.py                     | 29 +++++++++++++++++++++++=
=0A=
>>  5 files changed, 49 insertions(+), 5 deletions(-)=0A=
>>=0A=
>> diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/ima=
ge.bbclass=0A=
>> index c688c39f15..b4a2460187 100644=0A=
>> --- a/meta/classes-recipe/image.bbclass=0A=
>> +++ b/meta/classes-recipe/image.bbclass=0A=
>> @@ -42,8 +42,16 @@ IMAGE_FEATURES ?=3D ""=0A=
>>  IMAGE_FEATURES[type] =3D "list"=0A=
>>  IMAGE_FEATURES[validitems] +=3D "debug-tweaks read-only-rootfs read-onl=
y-rootfs-delayed-postinsts stateless-rootfs empty-root-password allow-empty=
-password allow-root-login serial-autologin-root post-install-logging overl=
ayfs-etc"=0A=
>>=0A=
>> +# Image layering:=0A=
>> +# a "base image" would create a snapshot of the package-database after =
the=0A=
>> +# installation of all packages into the rootfs is done. The next/other =
image=0A=
>> +# "layered on-top" of the former would then import that database and in=
stall=0A=
>> +# further packages; without reinstalling package dependencies that are =
already=0A=
>> +# installed in the layer below.=0A=
>>  # Generate snapshot of the package database?=0A=
>>  IMAGE_GEN_PKGDBFS ?=3D "0"=0A=
>> +# Package-database of the base image, upon which to build up a new imag=
e-layer=0A=
>> +IMAGE_BASE_PKGDB ?=3D ""=0A=
>>=0A=
>>  # Generate companion debugfs?=0A=
>>  IMAGE_GEN_DEBUGFS ?=3D "0"=0A=
>> @@ -134,7 +142,7 @@ def rootfs_variables(d):=0A=
>>                   'IMAGE_ROOTFS_MAXSIZE','IMAGE_NAME','IMAGE_LINK_NAME',=
'IMAGE_MANIFEST','DEPLOY_DIR_IMAGE','IMAGE_FSTYPES','IMAGE_INSTALL_COMPLEME=
NTARY','IMAGE_LINGUAS', 'IMAGE_LINGUAS_COMPLEMENTARY', 'IMAGE_LOCALES_ARCHI=
VE',=0A=
>>                   'MULTILIBRE_ALLOW_REP','MULTILIB_TEMP_ROOTFS','MULTILI=
B_VARIANTS','MULTILIBS','ALL_MULTILIB_PACKAGE_ARCHS','MULTILIB_GLOBAL_VARIA=
NTS','BAD_RECOMMENDATIONS','NO_RECOMMENDATIONS',=0A=
>>                   'PACKAGE_ARCHS','PACKAGE_CLASSES','TARGET_VENDOR','TAR=
GET_ARCH','TARGET_OS','OVERRIDES','BBEXTENDVARIANT','FEED_DEPLOYDIR_BASE_UR=
I','INTERCEPT_DIR','USE_DEVFS',=0A=
>> -                 'CONVERSIONTYPES', 'IMAGE_GEN_PKGDBFS', 'IMAGE_GEN_DEB=
UGFS', 'ROOTFS_RO_UNNEEDED', 'IMGDEPLOYDIR', 'PACKAGE_EXCLUDE_COMPLEMENTARY=
', 'REPRODUCIBLE_TIMESTAMP_ROOTFS',=0A=
>> +                 'CONVERSIONTYPES', 'IMAGE_GEN_PKGDBFS', 'IMAGE_BASE_PK=
GDB', 'IMAGE_GEN_DEBUGFS', 'ROOTFS_RO_UNNEEDED', 'IMGDEPLOYDIR', 'PACKAGE_E=
XCLUDE_COMPLEMENTARY', 'REPRODUCIBLE_TIMESTAMP_ROOTFS',=0A=
>>                   'IMAGE_INSTALL_DEBUGFS']=0A=
>>      variables.extend(rootfs_command_variables(d))=0A=
>>      variables.extend(variable_depends(d))=0A=
>> diff --git a/meta/lib/oe/package_manager/deb/rootfs.py b/meta/lib/oe/pac=
kage_manager/deb/rootfs.py=0A=
>> index 43107c8663..71a21df09b 100644=0A=
>> --- a/meta/lib/oe/package_manager/deb/rootfs.py=0A=
>> +++ b/meta/lib/oe/package_manager/deb/rootfs.py=0A=
>> @@ -152,6 +152,8 @@ class PkgRootfs(DpkgOpkgRootfs):=0A=
>>=0A=
>>          execute_pre_post_process(self.d, deb_pre_process_cmds)=0A=
>>=0A=
>> +        self._unpack_pkg_db_rootfs(['/var/lib/dpkg'])=0A=
>> +=0A=
>>          if self.progress_reporter:=0A=
>>              self.progress_reporter.next_stage()=0A=
>>              # Don't support incremental, so skip that=0A=
>> diff --git a/meta/lib/oe/package_manager/ipk/rootfs.py b/meta/lib/oe/pac=
kage_manager/ipk/rootfs.py=0A=
>> index 64d9bc7969..408faa8030 100644=0A=
>> --- a/meta/lib/oe/package_manager/ipk/rootfs.py=0A=
>> +++ b/meta/lib/oe/package_manager/ipk/rootfs.py=0A=
>> @@ -276,12 +276,16 @@ class PkgRootfs(DpkgOpkgRootfs):=0A=
>>          pkgs_to_install =3D self.manifest.parse_initial_manifest()=0A=
>>          opkg_pre_process_cmds =3D self.d.getVar('OPKG_PREPROCESS_COMMAN=
DS')=0A=
>>          opkg_post_process_cmds =3D self.d.getVar('OPKG_POSTPROCESS_COMM=
ANDS')=0A=
>> +        opkg_lib_dir =3D self.d.getVar('OPKGLIBDIR')=0A=
>> +        opkg_dir =3D os.path.join(opkg_lib_dir, 'opkg')=0A=
>>=0A=
>>          # update PM index files=0A=
>>          self.pm.write_index()=0A=
>>=0A=
>>          execute_pre_post_process(self.d, opkg_pre_process_cmds)=0A=
>>=0A=
>> +        self._unpack_pkg_db_rootfs([opkg_dir])=0A=
>> +=0A=
>>          if self.progress_reporter:=0A=
>>              self.progress_reporter.next_stage()=0A=
>>              # Steps are a bit different in order, skip next=0A=
>> @@ -317,8 +321,6 @@ class PkgRootfs(DpkgOpkgRootfs):=0A=
>>          if self.progress_reporter:=0A=
>>              self.progress_reporter.next_stage()=0A=
>>=0A=
>> -        opkg_lib_dir =3D self.d.getVar('OPKGLIBDIR')=0A=
>> -        opkg_dir =3D os.path.join(opkg_lib_dir, 'opkg')=0A=
>>          self._setup_pkg_db_rootfs([opkg_dir])=0A=
>>          self._setup_dbg_rootfs([opkg_dir])=0A=
>>=0A=
>> diff --git a/meta/lib/oe/package_manager/rpm/rootfs.py b/meta/lib/oe/pac=
kage_manager/rpm/rootfs.py=0A=
>> index 673006c131..9986b13b5f 100644=0A=
>> --- a/meta/lib/oe/package_manager/rpm/rootfs.py=0A=
>> +++ b/meta/lib/oe/package_manager/rpm/rootfs.py=0A=
>> @@ -67,12 +67,15 @@ class PkgRootfs(Rootfs):=0A=
>>          pkgs_to_install =3D self.manifest.parse_initial_manifest()=0A=
>>          rpm_pre_process_cmds =3D self.d.getVar('RPM_PREPROCESS_COMMANDS=
')=0A=
>>          rpm_post_process_cmds =3D self.d.getVar('RPM_POSTPROCESS_COMMAN=
DS')=0A=
>> +        package_paths =3D ['/etc/rpm', '/etc/rpmrc', '/etc/dnf', '/var/=
lib/rpm', '/var/cache/dnf', '/var/lib/dnf']=0A=
>>=0A=
>>          # update PM index files=0A=
>>          self.pm.write_index()=0A=
>>=0A=
>>          execute_pre_post_process(self.d, rpm_pre_process_cmds)=0A=
>>=0A=
>> +        self._unpack_pkg_db_rootfs(package_paths)=0A=
>> +=0A=
>>          if self.progress_reporter:=0A=
>>              self.progress_reporter.next_stage()=0A=
>>=0A=
>> @@ -110,8 +113,8 @@ class PkgRootfs(Rootfs):=0A=
>>          if self.progress_reporter:=0A=
>>              self.progress_reporter.next_stage()=0A=
>>=0A=
>> -        self._setup_pkg_db_rootfs(['/etc/rpm', '/etc/rpmrc', '/etc/dnf'=
, '/var/lib/rpm', '/var/cache/dnf', '/var/lib/dnf'])=0A=
>> -        self._setup_dbg_rootfs(['/etc/rpm', '/etc/rpmrc', '/etc/dnf', '=
/var/lib/rpm', '/var/cache/dnf', '/var/lib/dnf'])=0A=
>> +        self._setup_pkg_db_rootfs(package_paths)=0A=
>> +        self._setup_dbg_rootfs(package_paths)=0A=
>>=0A=
>>          execute_pre_post_process(self.d, rpm_post_process_cmds)=0A=
>>=0A=
>> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py=0A=
>> index 9268a02531..7ca574e6b1 100644=0A=
>> --- a/meta/lib/oe/rootfs.py=0A=
>> +++ b/meta/lib/oe/rootfs.py=0A=
>> @@ -106,6 +106,35 @@ class Rootfs(object, metaclass=3DABCMeta):=0A=
>>      def _cleanup(self):=0A=
>>          pass=0A=
>>=0A=
>> +    def _unpack_pkg_db_rootfs(self, package_paths):=0A=
>> +        import tarfile=0A=
>> +        gen_pkg_db_fs =3D self.d.getVar('IMAGE_BASE_PKGDB') or ''=0A=
>> +        if gen_pkg_db_fs =3D=3D '':=0A=
>> +           return=0A=
>=0A=
>Can be simplified to:=0A=
>=0A=
>gen_pkg_db_fs =3D self.d.getVar('IMAGE_BASE_PKGDB')=0A=
>if not gen_pkg_db_fs:=0A=
>    return=0A=
>=0A=
=0A=
thanks! will be in V3=0A=
=0A=
>=0A=
>> +=0A=
>> +        fname =3D self.d.getVar('DEPLOY_DIR_IMAGE') + '/' + self.d.getV=
ar('IMAGE_BASE_PKGDB') + '-pkgdb.tar.gz'=0A=
>> +        if not fname:=0A=
>> +            bb.warn("PKGDB does not exit:", fname)=0A=
>> +            return=0A=
>=0A=
>Shouldn't that be a hard error?=0A=
=0A=
good point, i also need to figure out a way to get a task-dependency there,=
 so=0A=
that the lower-layer-base-image:setup_pkg_db is triggered when only=0A=
upper-layer-image is built separatly - thoughts/suggestions?=0A=
=0A=
>=0A=
>> +=0A=
>> +        bb.note("=A0 unpacking package database...")=0A=
>> +        bb.utils.mkdirhier(self.image_rootfs + '-pkgdb')=0A=
>> +        if fname.endswith("tar.gz"):=0A=
>> +            tar =3D tarfile.open(fname, "r:gz")=0A=
>> +            tar.extractall(path=3Dself.image_rootfs + '-pkgdb')=0A=
>> +            tar.close()=0A=
>=0A=
>Didn't you hardcode it to tar.gz above? FWIW the python tarfile module=0A=
>is also very slow.=0A=
>=0A=
>=0A=
>What happens if I set IMAGE_FSTYPES_PKGDBFS to something other than=0A=
>tar.gz?=0A=
>=0A=
=0A=
that's true, would i get away with dropping the whole "configurable FSTYPE"=
 and=0A=
just always use tar.gz instead?=0A=
since the pack+unpack artifacts are only used internally while building the=
 images,=0A=
therefor there is probably not much benefit in keeping it user-configurable=
=0A=
=0A=
python tarfile: what alternatives are there?=0A=
is it ok to call the systems native tar?=0A=
looking around i see some uses of bb.compression in combination with tarfil=
e,=0A=
but also others (spdx license packaging) that use the python tarfile=0A=
=0A=
>> +=0A=
>> +        bb.note("=A0 Copying back package database...")=0A=
>> +        for path in package_paths:=0A=
>> +            try:=0A=
>> +                bb.utils.mkdirhier(self.image_rootfs + os.path.dirname(=
path))=0A=
>> +            except:=0A=
>> +                pass=0A=
>> +            if os.path.isdir(self.image_rootfs + '-pkgdb' + path):=0A=
>> +                shutil.copytree(self.image_rootfs + '-pkgdb' + path, se=
lf.image_rootfs + path, symlinks=3DTrue, dirs_exist_ok=3DTrue)=0A=
>> +            elif os.path.isfile(self.image_rootfs + '-pkgdb' + path):=
=0A=
>> +                shutil.copyfile(self.image_rootfs + '-pkgdb' + path, se=
lf.image_rootfs + path)=0A=
>> +=0A=
>>      def _setup_pkg_db_rootfs(self, package_paths):=0A=
>>          gen_pkg_db_fs =3D self.d.getVar('IMAGE_GEN_PKGDBFS') or '0'=0A=
>>          if gen_pkg_db_fs !=3D '1':=0A=
>=0A=
>=

