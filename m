Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89BAEC48BC3
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 06:42:52 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.83])
 by mx.groups.io with SMTP id smtpd.web11.8108.1708411363446308174
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Feb 2024 22:42:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=FX24ptTx;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.8.83, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eWQTyj0OP4aLPyzEJ7IUE1+uW14R2sZIAfuXMQQyF+osG1Eqr8dmdNwoXce3P0/9xReRmvwJpAfzJ4SfvtsmekpWDtRiMwWT+k+5JJnRmEz7OGaKRgJMB0HnkBlLh7R9k9ZMPI/prZpK99tjpjSmCRKpwlZljCQNRhhYOaHgZksxSR4RNALcNgRrmaU/xPYeDnieFIbsB8slEx3ZMDYBfe5llvRsZGsbNX87HzKhaGAG8dfciq7+BborZsOZ4ZNqUeH+61GpfL35XIQxU2O3dAdhIO0DqpDZvv655kLAgtgxkYyGKsmm/K5DPGvH5dBAfF5G104gnhYl+DKWcgtc4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OwJRdvMzGOQTwD++xMTN4pHEPok8zO+mxAtltnV2820=;
 b=EYAUCxStzN3hqsRfAUuDnr1ZozolDjKWLtyhyJihOBymHLspFJS2AwVO/u08/kIrW4r6TzCY530b+foa4dmaZC3eUDdgd1COuveSXP9ac01ekjva99WNb2mUjp8WnYrDsAdaSsGJ956sf4UZV3iAvtWMC8BYAfk2lsKd7rNexlL9NCtGkJQgpBXRe8WZxvhVC3HqFuyErPOaKGpvY87SQG45ZoFz4prF/sOmoO6YjDveLoa+juzzyAMQZDaZaeON1mkc3NzESNsITxdCrK2zX9Gt9U6QVmbeRHDUQObxwJTPK5RM9aB+3JM5+vDrgmq8EN0gRQNnUyw8zzY4AemlWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OwJRdvMzGOQTwD++xMTN4pHEPok8zO+mxAtltnV2820=;
 b=FX24ptTxbn+HTm+Y37adtXRNcsdwtl9KOvX/54tvWgHI3aufx5zuMIpHvd5xyYl4KPpyOHMheGpyipJoRWzTXBWSK4+lU3k3Un0z1uVHZBDBzgccAXhEwbDENW0eJLZxSEvnHo8j7nHnfepeU4rlT8ou1sYjVElOSLCNjfqANnU=
Received: from PAXPR06MB7534.eurprd06.prod.outlook.com (2603:10a6:102:153::11)
 by GVXPR06MB8634.eurprd06.prod.outlook.com (2603:10a6:150:119::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38; Tue, 20 Feb
 2024 06:42:38 +0000
Received: from PAXPR06MB7534.eurprd06.prod.outlook.com
 ([fe80::c95a:be0:915a:e097]) by PAXPR06MB7534.eurprd06.prod.outlook.com
 ([fe80::c95a:be0:915a:e097%4]) with mapi id 15.20.7292.036; Tue, 20 Feb 2024
 06:42:38 +0000
From: SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 1/3] image.bbclass/rootfs: archive and deploy
 opkg package database
Thread-Topic: [OE-core] [PATCH v2 1/3] image.bbclass/rootfs: archive and
 deploy opkg package database
Thread-Index: AQHaXmNzzc737gUXjkOqFKnnupSoJrERyTQAgAAlfGs=
Date: Tue, 20 Feb 2024 06:42:38 +0000
Message-ID: 
 <AM8PR06MB752199E5A53D2099686E5C3ABC512@AM8PR06MB7521.eurprd06.prod.outlook.com>
References: <20240213100012.252237-1-johannes.schneider@leica-geosystems.com>
	 <20240213100012.252237-2-johannes.schneider@leica-geosystems.com>
 <c0e0c4ccd170254d80613211f15cba89ac610d8a.camel@linuxfoundation.org>
In-Reply-To: 
 <c0e0c4ccd170254d80613211f15cba89ac610d8a.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR06MB7534:EE_|GVXPR06MB8634:EE_
x-ms-office365-filtering-correlation-id: aefccb4b-8363-4f32-0e15-08dc31df2164
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 NE/fisB/PaX4aTFA24rSOxM2Uk4RD3bOYA8LtW7kfkK8tdg3VJNnVb8EmCEvMhCjadAQNCNPa3Fu9puHxN2XGDI924JXcS9iI8h+SkYdBWYv49BM7/q18IAdAF4zDE8KbfA2a7cwbrFA8PyGK9WWsrwu/i5lR96kqTJA3Nqdev94iwcQnIcq50zSO2/3J8XcJ7acCEeI0XLuf67LzGv0rWe69l9U82bMtDgEXxNi2WWfzGUcIg3QC0ZnjELTQcW6UwJ+H5khwVQCA/4noItUf4Fw4ZYoHyRacXUFjTsUW+AteuROlADVlJXAm7ZWV9sYbJpWC8AXGNwqssMFPpV6K8Uy/9HMTMKHGKCDGN6CaSjduIX/nou531ScDGKsTDe1+gUzRZATlAMRBSWk+8bXIQeYjQaJJs08ZBwPP0llfHyYRYnRaJUKFZ8yLiQQR1cVar23BJBj8BaNzdL1PfQJxG2x/qUOBqAfpRcEREKKTGV8DTCHcD803dmCaB5MLfKCapFdI3LJNeCpYdedFibXLvvivnydTLEfdgG9gb9agF2sjiipH51G4+vZKtpca3dW6J21bKENKxNRooiYICeMqWNAmlOu7BqhEIgRiBA37n8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR06MB7534.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?pq5KcxrVWNkol/ghX8D749z46HSekZIDVavduSJDoakjS5bvCE4i9wFcbu?=
 =?iso-8859-1?Q?if14ZHC5rtE6YhSbMn47gZiH7Qdfs49RZqegQeszAuqXtUJHnjQtdiS/hN?=
 =?iso-8859-1?Q?KZzEfOIIhdYCZ9SBfGGoTl0sJygxD/Vt9nAsqRaQkOvh/mEQWtE8/wggaf?=
 =?iso-8859-1?Q?cyGlLU8NWEEuMq4kTPOCaz9Ihnsd0vgn5OSqOEpQuMO2r3CH/+QFzw+wF3?=
 =?iso-8859-1?Q?M/yCBSi5PQBwNduCNkOz2r40I2rS4S+FVePh0X4TDNksnM9y9Zr2kr6HSg?=
 =?iso-8859-1?Q?1DJdhM6WBu7RKf+VExAQH3PX6TnriR7UG9+yeA1j/zOmyXPbLKT/oE25qy?=
 =?iso-8859-1?Q?ZN1fdk+sQEU6A9knummUW40BdlOWmZPLwwXiJwcv4szh6OS6ejV+/ImS4m?=
 =?iso-8859-1?Q?P0PP81r/AVXVNL0YAwadjH1hMapZMfWMPNErrDwjMqMpc5bsUXBxjJeuoK?=
 =?iso-8859-1?Q?t+YcWV0f1hNaO9W88ih9hS2duL83aIBhbBAdAn9J1r8XfzY6ELVycWFVvx?=
 =?iso-8859-1?Q?YBNIXtfJgvhZpY1shZIqBH8zewWc37PH6gQPP/xsQl/TFylLzgUNrntKHz?=
 =?iso-8859-1?Q?DBdeUUYOzfkluvFp2pYKpFz4GXaLjHtWvkbhHbbYTTI6WQMOLVCW0cGzNx?=
 =?iso-8859-1?Q?5u0QaEwnvroxxeUvZKvaKMAnWYAlPw7cWNaVYZYw2xm+JtY9QQHw86p9Z/?=
 =?iso-8859-1?Q?mj2Gj33H9M834XBXKkJCBbVzzWPxSe+wzDs9oP6A2wz8xW/oWk8E3J21Sr?=
 =?iso-8859-1?Q?+tIhi8ene5OUkxcvKtQ/bsB4WFsj9/YlqmxJw5LBMteff6qt8+BjeThclS?=
 =?iso-8859-1?Q?sMDEWHVwyulNnkXuyGriQMZc56jvQpes23YiinL/3JhxTNfWzvmNReaZNK?=
 =?iso-8859-1?Q?L2lwIbsDnRFz1IUA+U9JPY+Usn81gWWwKSjRSHsxz5GGQn3g3shSUhcZVy?=
 =?iso-8859-1?Q?/SmnXvhtijd5Mhyvugugqi0CKVnBInPvycXRxBzh+gKSaT1z5ny6zy5Szd?=
 =?iso-8859-1?Q?K2Bk3x6+E+Br5rgyrMUZgzSDe0NrnkCq4/4yKMhq83xC+efe0pvqIINzXO?=
 =?iso-8859-1?Q?YCGt0oaRDem/HIKusuVD6cMM/c14ebSmZtXB6QMESyKdEqIuzDBo12/YQl?=
 =?iso-8859-1?Q?X3A0/iGqHtp3Ic9NDRaeU00+iglu8rPV6DOhO0uKi9DQJHrKWzwbSm4l6k?=
 =?iso-8859-1?Q?KS5lukeB2NEp+JH/pPvziW8+ZX1sQGP1dZ1M6tEpojFEgVLF2rfMU0KqtI?=
 =?iso-8859-1?Q?5yJTbBtABcla2yMaU3R+fP6FY11fJeglcg5ULauII4Q1elejlHesd34A4J?=
 =?iso-8859-1?Q?b5PKAbNOngMSuzlTdhmKVLhM2QCJtyS9xOHsCPHwyBfLLtHOQBzGgO/DsH?=
 =?iso-8859-1?Q?jJ3oLpDhfaDEDNu96w07sMELR9L+EQ+IfgL/rn/a6pOPCocld7mSV+rvsI?=
 =?iso-8859-1?Q?zsKz0u17ZQL4EMq92pbl0/kmisYLr4SioTaG9YtMNJ20u5Vf5+vTmx+0TV?=
 =?iso-8859-1?Q?zloFRpPEOVeqY941sbEHMoujuq4lYJxT2Bf7CxVOMYHJLcxeuGnsFRHog3?=
 =?iso-8859-1?Q?Z5BbrjxuyTRq8rlA2R0/xQ3eMM93RZaocRzJsItUkTD69Al6EacC1vp6d4?=
 =?iso-8859-1?Q?D6pu/qeXhigT1H8qAU3y9fxQ2hSJt65ho+T1HgvQ2NXu5Za9uVcb/MBYR4?=
 =?iso-8859-1?Q?Z0DciDcTU2SsRSnn2tI=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR06MB7534.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aefccb4b-8363-4f32-0e15-08dc31df2164
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2024 06:42:38.7226
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dgq7V1yemSHbsjhqm8RW5qVsD/kYHjL1shvAKonY1vKwU53fd3Pjtbs2JME2TTh+myHK8KkAqIIAT4+J7tBUvddaT4wKa4MYfFMVoy8OV+BNr5Ve9PELalozY1vTBh63
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR06MB8634
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 06:42:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195904

Hoi Richard,=0A=
=0A=
and thanks for the feedback!=0A=
=0A=
>> archive the package database after the rootfs has been put together as=
=0A=
>> *rootfs-pkdbfs.tar.gz, and put it into the deploy folder.=0A=
>>=0A=
>> This creates a snapshot of the package mangers state at the point in tim=
e when=0A=
>> all dependencies have been resolved and installed; which can be used by =
"follow=0A=
>> up" images to be built upon.=0A=
>=0A=
>I'm torn on this series. On the one hand I can see why it might be=0A=
>useful. On the other hand:=0A=
>=0A=
>* no test cases for it=0A=
>* no documentation updates=0A=
>* no real indications in the code on what it is doing (no comments)=0A=
>=0A=
=0A=
point taken, i'll look into the test framework and add something with V3=0A=
=0A=
and i missed the in-source docs... also sth for V3=0A=
i'll redistribute the example/documentation from the cover letter amongst t=
he =0A=
meta/conf/documentation.conf for the variables, and in-source comments=0A=
=0A=
any other place in this repo i should be aware off/add documentation to?=0A=
=0A=
>=0A=
>It also copies and pastes a lot of the debugfs code and duplicates it=0A=
>which makes me wonder if there isn't something better we should be=0A=
>doing here.=0A=
=0A=
the copy&paste comes from the similar steps having to be taken at around th=
e same time.=0A=
could you elaborate on "something better"? taking different steps, de-dupli=
cating code? ...?=0A=
=0A=
>=0A=
>There is good info in the 0/3 series email but that will get lost once=0A=
>things merge.=0A=
=0A=
good point - i'll incorporate more from the cover-letter into the code itse=
lf=0A=
with the next version.=0A=
=0A=
>=0A=
>> Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.c=
om>=0A=
>> ---=0A=
>>  meta/classes-recipe/image.bbclass         | 45 ++++++++++++++++++++++-=
=0A=
>>  meta/classes-recipe/image_types.bbclass   |=A0 1 +=0A=
>>  meta/conf/bitbake.conf                    |=A0 1 +=0A=
>>  meta/lib/oe/package_manager/deb/rootfs.py |=A0 1 +=0A=
>>  meta/lib/oe/package_manager/ipk/rootfs.py |=A0 1 +=0A=
>>  meta/lib/oe/package_manager/rpm/rootfs.py |=A0 1 +=0A=
>>  meta/lib/oe/rootfs.py                     | 35 ++++++++++++++++++=0A=
>>  7 files changed, 83 insertions(+), 2 deletions(-)=0A=
>>=0A=
>> diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/ima=
ge.bbclass=0A=
>> index 28be6c6362..c688c39f15 100644=0A=
>> --- a/meta/classes-recipe/image.bbclass=0A=
>> +++ b/meta/classes-recipe/image.bbclass=0A=
>> @@ -42,6 +42,9 @@ IMAGE_FEATURES ?=3D ""=0A=
>>  IMAGE_FEATURES[type] =3D "list"=0A=
>>  IMAGE_FEATURES[validitems] +=3D "debug-tweaks read-only-rootfs read-onl=
y-rootfs-delayed-postinsts stateless-rootfs empty-root-password allow-empty=
-password allow-root-login serial-autologin-root post-install-logging overl=
ayfs-etc"=0A=
>>=0A=
>> +# Generate snapshot of the package database?=0A=
>> +IMAGE_GEN_PKGDBFS ?=3D "0"=0A=
>> +=0A=
>>  # Generate companion debugfs?=0A=
>>  IMAGE_GEN_DEBUGFS ?=3D "0"=0A=
>>=0A=
>> @@ -131,7 +134,8 @@ def rootfs_variables(d):=0A=
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
>> -                 'CONVERSIONTYPES', 'IMAGE_GEN_DEBUGFS', 'ROOTFS_RO_UNN=
EEDED', 'IMGDEPLOYDIR', 'PACKAGE_EXCLUDE_COMPLEMENTARY', 'REPRODUCIBLE_TIME=
STAMP_ROOTFS', 'IMAGE_INSTALL_DEBUGFS']=0A=
>> +                 'CONVERSIONTYPES', 'IMAGE_GEN_PKGDBFS', 'IMAGE_GEN_DEB=
UGFS', 'ROOTFS_RO_UNNEEDED', 'IMGDEPLOYDIR', 'PACKAGE_EXCLUDE_COMPLEMENTARY=
', 'REPRODUCIBLE_TIMESTAMP_ROOTFS',=0A=
>> +                 'IMAGE_INSTALL_DEBUGFS']=0A=
>>      variables.extend(rootfs_command_variables(d))=0A=
>>      variables.extend(variable_depends(d))=0A=
>>      return " ".join(variables)=0A=
>> @@ -337,6 +341,19 @@ python do_image_qa_setscene () {=0A=
>>  }=0A=
>>  addtask do_image_qa_setscene=0A=
>>=0A=
>> +def setup_pkgdbfs_variables(d):=0A=
>> +    d.appendVar('IMAGE_ROOTFS', '-pkgdb')=0A=
>> +    if d.getVar('IMAGE_LINK_NAME'):=0A=
>> +        d.appendVar('IMAGE_LINK_NAME', '-pkgdb')=0A=
>> +    d.appendVar('IMAGE_NAME','-pkgdb')=0A=
>> +    pkgdbfs_image_fstypes =3D d.getVar('IMAGE_FSTYPES_PKGDBFS')=0A=
>> +    if pkgdbfs_image_fstypes:=0A=
>> +        d.setVar('IMAGE_FSTYPES', pkgdbfs_image_fstypes)=0A=
>> +=0A=
>> +python setup_pkgdbfs () {=0A=
>> +    setup_pkgdbfs_variables(d)=0A=
>> +}=0A=
>> +=0A=
>>  def setup_debugfs_variables(d):=0A=
>>      d.appendVar('IMAGE_ROOTFS', '-dbg')=0A=
>>      if d.getVar('IMAGE_LINK_NAME'):=0A=
>> @@ -381,6 +398,11 @@ python () {=0A=
>>      alltypes =3D d.getVar('IMAGE_FSTYPES').split()=0A=
>>      typedeps =3D {}=0A=
>>=0A=
>> +    if d.getVar('IMAGE_GEN_PKGDBFS') =3D=3D "1":=0A=
>> +        pkgdbfs_fstypes =3D d.getVar('IMAGE_FSTYPES_PKGDBFS').split()=
=0A=
>> +        for t in pkgdbfs_fstypes:=0A=
>> +            alltypes.append("pkgdbfs_" + t)=0A=
>> +=0A=
>>      if d.getVar('IMAGE_GEN_DEBUGFS') =3D=3D "1":=0A=
>>          debugfs_fstypes =3D d.getVar('IMAGE_FSTYPES_DEBUGFS').split()=
=0A=
>>          for t in debugfs_fstypes:=0A=
>> @@ -393,6 +415,10 @@ python () {=0A=
>>              basetypes[baset]=3D []=0A=
>>          if t not in basetypes[baset]:=0A=
>>              basetypes[baset].append(t)=0A=
>> +        pkgdb =3D ""=0A=
>> +        if t.startswith("pkgdbfs_"):=0A=
>> +            t =3D t[8:]=0A=
>> +            pkgdb =3D "pkgdbfs_"=0A=
>>          debug =3D ""=0A=
>>          if t.startswith("debugfs_"):=0A=
>>              t =3D t[8:]=0A=
>> @@ -401,6 +427,13 @@ python () {=0A=
>>          vardeps.add('IMAGE_TYPEDEP:' + t)=0A=
>>          if baset not in typedeps:=0A=
>>              typedeps[baset] =3D set()=0A=
>> +        deps =3D [pkgdb + dep for dep in deps]=0A=
>> +        for dep in deps:=0A=
>> +            if dep not in alltypes:=0A=
>> +                alltypes.append(dep)=0A=
>> +            _add_type(dep)=0A=
>> +            basedep =3D _image_base_type(dep)=0A=
>> +            typedeps[baset].add(basedep)=0A=
>>          deps =3D [debug + dep for dep in deps]=0A=
>>          for dep in deps:=0A=
>>              if dep not in alltypes:=0A=
>> @@ -419,6 +452,7 @@ python () {=0A=
>>=0A=
>>      maskedtypes =3D (d.getVar('IMAGE_TYPES_MASKED') or "").split()=0A=
>>      maskedtypes =3D [dbg + t for t in maskedtypes for dbg in ("", "debu=
gfs_")]=0A=
>> +    maskedtypes =3D [pkgdb + t for t in maskedtypes for pkgdb in ("", "=
pkgdbfs_")]=0A=
>>=0A=
>>      for t in basetypes:=0A=
>>          vardeps =3D set()=0A=
>> @@ -430,6 +464,11 @@ python () {=0A=
>>              continue=0A=
>>=0A=
>>          localdata =3D bb.data.createCopy(d)=0A=
>> +        pkgdb =3D ""=0A=
>> +        if t.startswith("pkgdbfs_"):=0A=
>> +            setup_pkgdbfs_variables(localdata)=0A=
>> +            pkgdb =3D "setup_pkgdbfs "=0A=
>> +            realt =3D t[8:]=0A=
>>          debug =3D ""=0A=
>>          if t.startswith("debugfs_"):=0A=
>>              setup_debugfs_variables(localdata)=0A=
>> @@ -468,6 +507,8 @@ python () {=0A=
>>              for ctype in sorted(ctypes):=0A=
>>                  if bt.endswith("." + ctype):=0A=
>>                      type =3D bt[0:-len(ctype) - 1]=0A=
>> +                    if type.startswith("pkgdbfs_"):=0A=
>> +                        type =3D type[8:]=0A=
>>                      if type.startswith("debugfs_"):=0A=
>>                          type =3D type[8:]=0A=
>>                      # Create input image first.=0A=
>> @@ -508,7 +549,7 @@ python () {=0A=
>>          d.setVarFlag(task, 'func', '1')=0A=
>>          d.setVarFlag(task, 'fakeroot', '1')=0A=
>>=0A=
>> -        d.appendVarFlag(task, 'prefuncs', ' ' + debug + ' set_image_siz=
e')=0A=
>> +        d.appendVarFlag(task, 'prefuncs', ' ' + debug + pkgdb + ' set_i=
mage_size')=0A=
>>          d.prependVarFlag(task, 'postfuncs', 'create_symlinks ')=0A=
>>          d.appendVarFlag(task, 'subimages', ' ' + ' '.join(subimages))=
=0A=
>>          d.appendVarFlag(task, 'vardeps', ' ' + ' '.join(vardeps))=0A=
>=0A=
>The above is the particular piece of copy and paste of the debugfs code=0A=
>which worries me a bit.=0A=
=0A=
can you elaborate on how/why?=0A=
those two variables are set either/or, or neither; and this way the additio=
nal task(?) is weaved in exactly once=0A=
TBH i didn't quite get why it is done this way for the debugfs... but the a=
ddition still works with both on, so... open for suggestions on a better wa=
y :-)=0A=
=0A=
>=0A=
>=0A=
>> diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-reci=
pe/image_types.bbclass=0A=
>> index 3733bdfc20..03d8852aed 100644=0A=
>> --- a/meta/classes-recipe/image_types.bbclass=0A=
>> +++ b/meta/classes-recipe/image_types.bbclass=0A=
>> @@ -25,6 +25,7 @@ def imagetypes_getdepends(d):=0A=
>>=0A=
>>      fstypes =3D set((d.getVar('IMAGE_FSTYPES') or "").split())=0A=
>>      fstypes |=3D set((d.getVar('IMAGE_FSTYPES_DEBUGFS') or "").split())=
=0A=
>> +    fstypes |=3D set((d.getVar('IMAGE_FSTYPES_PKGDBFS') or "").split())=
=0A=
>>=0A=
>>      deprecated =3D set()=0A=
>>      deps =3D set()=0A=
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf=0A=
>> index 6f180d18b0..b03eb80c0b 100644=0A=
>> --- a/meta/conf/bitbake.conf=0A=
>> +++ b/meta/conf/bitbake.conf=0A=
>> @@ -844,6 +844,7 @@ include conf/bblock.conf=0A=
>>  DL_DIR ?=3D "${TOPDIR}/downloads"=0A=
>>  SSTATE_DIR ?=3D "${TOPDIR}/sstate-cache"=0A=
>>  IMAGE_FSTYPES ?=3D "tar.gz"=0A=
>> +IMAGE_FSTYPES_PKGDBFS ?=3D "tar.gz"=0A=
>>  IMAGE_FSTYPES_DEBUGFS ?=3D "tar.gz"=0A=
>=0A=
>bitbake.conf variables go everywhere even for non-images. Whilst I=0A=
>appreciate the others are there, mainly for historical reasons I'd=0A=
>prefer not to add to things if we can help it. I keep thinking we=0A=
>should really have a dedicated conf/imagevars.conf or similar file.=0A=
=0A=
ok, so those are already marked as "legacy" and await refactoring ... =0A=
which is a bit beyond the scope of this feature PR :-S=0A=
but as noted in the response to your other mail - having the FSTYPE configu=
rable=0A=
might not be needed in the first place - which would sidestep this issue.=
=0A=
=0A=
>=0A=
>>  INITRAMFS_FSTYPES ?=3D "cpio.gz"=0A=
>> diff --git a/meta/lib/oe/package_manager/deb/rootfs.py b/meta/lib/oe/pac=
kage_manager/deb/rootfs.py=0A=
>> index 1e25b64ed9..43107c8663 100644=0A=
>> --- a/meta/lib/oe/package_manager/deb/rootfs.py=0A=
>> +++ b/meta/lib/oe/package_manager/deb/rootfs.py=0A=
>> @@ -178,6 +178,7 @@ class PkgRootfs(DpkgOpkgRootfs):=0A=
>>          if self.progress_reporter:=0A=
>>              self.progress_reporter.next_stage()=0A=
>>=0A=
>> +        self._setup_pkg_db_rootfs(['/var/lib/dpkg'])=0A=
>>          self._setup_dbg_rootfs(['/var/lib/dpkg'])=0A=
>>=0A=
>>          self.pm.fix_broken_dependencies()=0A=
>> diff --git a/meta/lib/oe/package_manager/ipk/rootfs.py b/meta/lib/oe/pac=
kage_manager/ipk/rootfs.py=0A=
>> index ba93eb62ea..64d9bc7969 100644=0A=
>> --- a/meta/lib/oe/package_manager/ipk/rootfs.py=0A=
>> +++ b/meta/lib/oe/package_manager/ipk/rootfs.py=0A=
>> @@ -319,6 +319,7 @@ class PkgRootfs(DpkgOpkgRootfs):=0A=
>>=0A=
>>          opkg_lib_dir =3D self.d.getVar('OPKGLIBDIR')=0A=
>>          opkg_dir =3D os.path.join(opkg_lib_dir, 'opkg')=0A=
>> +        self._setup_pkg_db_rootfs([opkg_dir])=0A=
>>          self._setup_dbg_rootfs([opkg_dir])=0A=
>>=0A=
>>          execute_pre_post_process(self.d, opkg_post_process_cmds)=0A=
>> diff --git a/meta/lib/oe/package_manager/rpm/rootfs.py b/meta/lib/oe/pac=
kage_manager/rpm/rootfs.py=0A=
>> index 3ba5396320..673006c131 100644=0A=
>> --- a/meta/lib/oe/package_manager/rpm/rootfs.py=0A=
>> +++ b/meta/lib/oe/package_manager/rpm/rootfs.py=0A=
>> @@ -110,6 +110,7 @@ class PkgRootfs(Rootfs):=0A=
>>          if self.progress_reporter:=0A=
>>              self.progress_reporter.next_stage()=0A=
>>=0A=
>> +        self._setup_pkg_db_rootfs(['/etc/rpm', '/etc/rpmrc', '/etc/dnf'=
, '/var/lib/rpm', '/var/cache/dnf', '/var/lib/dnf'])=0A=
>>          self._setup_dbg_rootfs(['/etc/rpm', '/etc/rpmrc', '/etc/dnf', '=
/var/lib/rpm', '/var/cache/dnf', '/var/lib/dnf'])=0A=
>>=0A=
>>          execute_pre_post_process(self.d, rpm_post_process_cmds)=0A=
>> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py=0A=
>> index 8cd48f9450..9268a02531 100644=0A=
>> --- a/meta/lib/oe/rootfs.py=0A=
>> +++ b/meta/lib/oe/rootfs.py=0A=
>> @@ -106,6 +106,41 @@ class Rootfs(object, metaclass=3DABCMeta):=0A=
>>      def _cleanup(self):=0A=
>>          pass=0A=
>>=0A=
>> +    def _setup_pkg_db_rootfs(self, package_paths):=0A=
>> +        gen_pkg_db_fs =3D self.d.getVar('IMAGE_GEN_PKGDBFS') or '0'=0A=
>> +        if gen_pkg_db_fs !=3D '1':=0A=
>> +           return=0A=
>=0A=
>bb.utils.to_boolean(self.d.getVar('IMAGE_GEN_PKGDBFS'))=0A=
>=0A=
=0A=
thnx: added for V3=0A=
=0A=
>=0A=
>> +=0A=
>> +        bb.note("=A0 Renaming the original rootfs...")=0A=
>> +        try:=0A=
>> +            shutil.rmtree(self.image_rootfs + '-orig')=0A=
>> +        except:=0A=
>> +            pass=0A=
>=0A=
>Please don't use non-specific except: blocks, look for specific=0A=
>exceptions.=0A=
>=0A=
=0A=
oriented myself on the preexisting code for debugfs - but i'll improve it :=
-)=0A=
=0A=
>=0A=
>> +        bb.utils.rename(self.image_rootfs, self.image_rootfs + '-orig')=
=0A=
>> +=0A=
>> +        bb.note("=A0 Creating pkg-db rootfs...")=0A=
>> +        bb.utils.mkdirhier(self.image_rootfs)=0A=
>> +=0A=
>> +        bb.note("=A0 Copying back package database...")=0A=
>> +        for path in package_paths:=0A=
>> +            bb.utils.mkdirhier(self.image_rootfs + os.path.dirname(path=
))=0A=
>> +            if os.path.isdir(self.image_rootfs + '-orig' + path):=0A=
>> +                shutil.copytree(self.image_rootfs + '-orig' + path, sel=
f.image_rootfs + path, symlinks=3DTrue)=0A=
>> +            elif os.path.isfile(self.image_rootfs + '-orig' + path):=0A=
>> +                shutil.copyfile(self.image_rootfs + '-orig' + path, sel=
f.image_rootfs + path)=0A=
>> +=0A=
>> +        ####=0A=
>> +=0A=
>> +        bb.note("=A0 Rename pkg-db rootfs...")=0A=
>> +        try:=0A=
>> +            shutil.rmtree(self.image_rootfs + '-pkgdb')=0A=
>> +        except:=0A=
>> +            pass=0A=
>=0A=
>Similar to above.=0A=
>=0A=
>> +        bb.utils.rename(self.image_rootfs, self.image_rootfs + '-pkgdb'=
)=0A=
>> +=0A=
>> +        bb.note("=A0 Restoring original rootfs...")=0A=
>> +        bb.utils.rename(self.image_rootfs + '-orig', self.image_rootfs)=
=0A=
>> +=0A=
>=0A=
>Why does this function need to rename the original directory, create a new=
 one,=0A=
>then move the other one back? Can't it just create what it needs in the ot=
her path?=0A=
>=0A=
=0A=
heh - true... after the original debugfs-copy was stripped down to this,=0A=
i overlooked that it could be simplified this way -> adding it to V3=0A=
=0A=
>=0A=
>Cheers,=0A=
>=0A=
>Richard=0A=
>=0A=
>=0A=
>=0A=
=0A=
Gru=DF=0A=
Johannes=

