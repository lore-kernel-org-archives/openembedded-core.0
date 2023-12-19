Return-Path: <russ.dill@nikolamotor.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2CFBC35274
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 01:11:13 +0000 (UTC)
Received: from CY4PR02CU008.outbound.protection.outlook.com (CY4PR02CU008.outbound.protection.outlook.com [40.93.200.16])
 by mx.groups.io with SMTP id smtpd.web11.587.1702948272706928492
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 17:11:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nikolamotor.com header.s=selector2 header.b=VKpxmwL6;
 spf=pass (domain: nikolamotor.com, ip: 40.93.200.16, mailfrom: russ.dill@nikolamotor.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VMxubrj6UxKZ+1jZpFb4nL42yaGgdv9FOs8+gr+1oAfmmrTTDecg6vIXPx8vnElEYGHTWiwJqRyI6Ov1vvadcZV4pQCJPtLOZ18jjj+JgOTwA1xIIwdlWDx2ModeWV5DXtLfkT1A0pmUDxDtf+tMZ6U1EizmKmXYDsRsNYjWJWaH8/tnbJNmcCtabdlIRW93+y7IfOt2a9L9BQvvJy8lQDp7ZZ+NK/rm1fWYFqKcYkWfePes+oDSa3YJnn1wXexGYzl60Wb6LwQA8LuGiHrCbiV3Nt7BCRuGdjhlGuMIkPSdqV/+kMi3CcMce/fTHUhKr9GoEH0lDhgSIE/iAwFJzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BNuArtlo8i8lUv0O/SKUvf5jLhZUHHeS6BAawS5R1sQ=;
 b=KTrsp4ZrQAjaj4lb1QXctby49TJQ4GNPxwX8Thdhk5PiCHtcL/zXCjVL8+pTUECnCwL5+mfqhOVUzodRwbExFku+WoCHFhJrH7j1V5BQ2BMotXxG5PivWS9cdGH/BS0lErm42qqWWTKaGpjofwjdzhJwyIKL/lRIVM0s5pdmKh46qtRC6f/a0LpFJLgyRJXfvZdzm5G1M1WGMl5t1hCp2T5n4oRQ2uAC8vOIwzZj/hGdxcaVdNQWvpu6DsQPLauBV++4gHM2dB7kPpBRE9zBqAXbpgzN8ZXh8zb27WOuc+ZNnSoB4J5lU7oFEvDw2oYVvKy2+nGGSYpkWDkVaFTQPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nikolamotor.com; dmarc=pass action=none
 header.from=nikolamotor.com; dkim=pass header.d=nikolamotor.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nikolamotor.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNuArtlo8i8lUv0O/SKUvf5jLhZUHHeS6BAawS5R1sQ=;
 b=VKpxmwL6r4XATNelrRywrajBAQFK4V5g9iRy9faGdCWPkIkg9hRFows0A/ENUfXybr85jsUc93Bi1JyK8tHsvjm0M94ctWssBKdO0x6WpXE/S7eqM2LVCTDhRLVF/DZ21Kr6GcVzTyMnxmsTSIHJUB50Wvyj7g+IjUT4fOVWfBJuNLa6eM2vbcTB3bZVAiumJmbaFxFa9SU1kRebaScpjcBVvhJ5TKKsJoddh3UYFEbzQ1zKDZHc/ZamO+qRcRUayCQf/UqhiP4d7Tm2QKxUAsyCN9Pl8ueGfJ/arekr5G4wRBWhRWIvJO2ALidbpZncD5drl6qguTH2Flit6C0AwQ==
Received: from CH3PR05MB9388.namprd05.prod.outlook.com (2603:10b6:610:148::20)
 by SA1PR05MB8756.namprd05.prod.outlook.com (2603:10b6:806:1cb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Tue, 19 Dec
 2023 01:11:05 +0000
Received: from CH3PR05MB9388.namprd05.prod.outlook.com
 ([fe80::263f:31ae:dac8:9388]) by CH3PR05MB9388.namprd05.prod.outlook.com
 ([fe80::263f:31ae:dac8:9388%4]) with mapi id 15.20.7091.034; Tue, 19 Dec 2023
 01:11:04 +0000
From: Russ Dill <russ.dill@nikolamotor.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/6 v2] license/license_image: Fix license file
 layout to avoid overlapping files
Thread-Topic: [OE-core] [PATCH 1/6 v2] license/license_image: Fix license file
 layout to avoid overlapping files
Thread-Index: AQHZ67Fa1d/wxHFCq028yQn0JqPtibCwWCsA
Date: Tue, 19 Dec 2023 01:11:04 +0000
Message-ID: 
 <CH3PR05MB9388320700CCBB3EB75E07E8F497A@CH3PR05MB9388.namprd05.prod.outlook.com>
References: <20230920105802.1008778-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20230920105802.1008778-1-richard.purdie@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nikolamotor.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR05MB9388:EE_|SA1PR05MB8756:EE_
x-ms-office365-filtering-correlation-id: b5a80be3-a43b-4bb2-dc8e-08dc002f5f63
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 zW6+QegXSxovGXVk6UzTomssquRaM0Dqq/06TX2MDOm6/v5ZneV1FugPDHl4HRCiUo8ByTo7gNLQT7b0W24fLYa6csacUK8AuLMHogBjBVaITz5uNueQtRZiSECLD3MGnjqJEHIy5GM4z4oUgzR4P4e34/aHo9rA9bQjlSzjuienuhct9T4LpcsTR9sxfqwQJOz/1s67BKE2XR5WWS2b+oC8+s4K4TzZuTx+3jZxzuPnfjq6Xuwhc54coAiUs0gSrd6lzZrmFNY2foCW529ZvaLx+AqDlcXxcadbepgIkGBAM6VQ3OUDm8rKkgkt00e0ixRWTe4B+JVH1rOQ5DYtwdNssSmfyASmnnmviH/BhiUb9VBblTNiQ+UzPVB8htVQFcGQQCzI/j2htqrm5D3s51rfnxRCPBLSH9Q60EBv9w9wqrjPD+n5nSl9PMJ6TA2nsOqMiKkP62CcvYemEG4SCmQ1SAb81XugCgh966bB50xelAnOGahVBhncDqOFqcw28byzW4jiCkX2n+ws8zdwe9kmDFxIF+3NylVutBcc5HHbCE7/QE9QEDDnD1YLR/rpeVLOJ5udbdfFalIKninNH2KRdgjg4ufLI73ZFvlk8Y72+azHFK7/fCB5fsY2v1aX7hR+9/Xni356PoSluutYvmktNxi3Y5sn7H9FWV/k1tQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR05MB9388.namprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(346002)(39850400004)(136003)(396003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(26005)(6506007)(7696005)(8676002)(66556008)(52536014)(5660300002)(9686003)(8936002)(44832011)(83380400001)(41300700001)(76116006)(478600001)(316002)(91956017)(64756008)(66946007)(66476007)(2906002)(66446008)(110136005)(86362001)(71200400001)(33656002)(38070700009)(38100700002)(122000001)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?e4knYePW7vylHfrK8R36PMm4/svz+OT//cYfvRf58f9gwCTyDUKyeu73y3?=
 =?iso-8859-1?Q?DrEbKcZuzt++H8qH4uxDY/h8N3AuJsUZtIh+hfQyBVdot8E0ht8MbfO2Qw?=
 =?iso-8859-1?Q?NGeGlOgo70QCYnFtAJuJ3f4Xq8OZ+hYdpSEuoB6lqb5K/4jVh7JcAe5LEt?=
 =?iso-8859-1?Q?Xj87rBxHva6MzyWvhw5iqB4GpbcaJV0xKtWhhB+D9gaz5uqp7oexbUGAPG?=
 =?iso-8859-1?Q?FEYJghWnOPfo2mWWq76KSLC/S594T9VhhZms1SB7TzWy1KbYmFyJWW2W7x?=
 =?iso-8859-1?Q?RP/xVYnGLlFJUJ9mnQFsxG4ZRHhm7bYe09AVJKZNx0ILSxahjfHZTFiwk9?=
 =?iso-8859-1?Q?t00JPAEj460pfI/fn2lliRB4ZffubcihM10rOKqplzcFzyiuHh55kmQOOO?=
 =?iso-8859-1?Q?2G80Z4IVft2TYk85ahEAildzJ2Mah1ZUYOqnmcBZo8bF3xZKOO1MnYdS7i?=
 =?iso-8859-1?Q?ewjbGVmHq4RBTUdNlWFLZsRj9HF9H+rmS9ARm6cJoA7Z3jgc6DSmm67a4f?=
 =?iso-8859-1?Q?XXOkSBaUbZD/3sFDqFQfWHCOSX6bYKLkSvOH6B9XxqwqE5zxpz51T33pLg?=
 =?iso-8859-1?Q?k1P1BIts+/dyOfcUq5hfymd4StMeLwcIIJ4q66y8CjBkoL1jRxnOnIwiR3?=
 =?iso-8859-1?Q?94sKkMKQ+JCTRzvP1rhzSq/7ciu2HPw5DxyzjA3QKNh/WrGAsFzbGFRx5g?=
 =?iso-8859-1?Q?uHqdoBx4smO047qJARD5zM7366IkxY9lMcujZiF7tVHpVp7DSktybbg+Go?=
 =?iso-8859-1?Q?b5XzS8Ei9ttS80SzjH4eudcjYi6CIX6FyZNCT78GbBaOlX5muW66aGrAlr?=
 =?iso-8859-1?Q?RAKHgcVAzp+isZOD/2STaPx94thQHEkuf+85ITmurhrvLk13o61im+K5cg?=
 =?iso-8859-1?Q?gYCvL5q1350tvaWaMK0u4slcI7twxm1niVP84YAzqhFplDYOzo3K5NhvKr?=
 =?iso-8859-1?Q?XbnLj9OOjU6Lzkp7ljOYuchW+6GFO411hGku6IYkcAQhyWJr+S+GsZwFZB?=
 =?iso-8859-1?Q?u2s7cv+iQM4z9rqAwwGqW4JKFpYLuY21vvZgM+QhTYFYzUmF8Smel/+Dth?=
 =?iso-8859-1?Q?rdT4jqL1sIgBeh27dMs0maKLzeBYS57qryA/F6UajSU8lD6hLcgv7PymU1?=
 =?iso-8859-1?Q?CiJ3qA38pCO1+r3PMFo/VXk99tkof+FgVdrSjtWfbo8A+edKKhxHVJYwLq?=
 =?iso-8859-1?Q?F5ZP/qnbDc3f+/dJn6DjCBooUWR5ka9JVn5nDqTMrObs03Jen7IgU7qulR?=
 =?iso-8859-1?Q?E4DQWNItVtsBsO3bmF4zd6yGfMUjEDzBbHz9v/zNphuDnY6+D5EL/l08aI?=
 =?iso-8859-1?Q?aH50cWWdCl0Qm7urk5LMNQPuByD74Buvy4TudcZu9tVVp1VnDeoxrhDj6Y?=
 =?iso-8859-1?Q?43IcLhvCLKPhXVbLt4hAJJ7Po8eM0NN3OuvSggC/GS/sPSuSWYCyBMeXRq?=
 =?iso-8859-1?Q?hkProXI3WotPher3FKps75Er+xV356smXcoETAfN9qquFNVSxuBmYwT4fB?=
 =?iso-8859-1?Q?UKG4Lq4kESk8vty0SyerprwVPvQnqfBhslm6PxmfR8P6Jkb/HMJPh/gT4+?=
 =?iso-8859-1?Q?Rm4sZfYzRetDYgn6MrLkN8ijYk4Pu2RCui9P2irKCFiZg7J6QJmVVXN8Eh?=
 =?iso-8859-1?Q?/gq6lRh0bkF9f/gOk24wr4aXJHqzUL4jPK?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nikolamotor.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR05MB9388.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5a80be3-a43b-4bb2-dc8e-08dc002f5f63
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2023 01:11:04.3089
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: cd45403b-72e2-4592-a46a-4687dcacfc95
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iZlLr+L789LjSRLsbNkc3Mn1Hpb9ab8BNEKM6CU6iBKGK3MN9S7QFuPsHyoFpJOiSMFcI++XKGp8ldn2FOFgMp2wkmA88yVctxPsz2mT2oE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR05MB8756
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 01:11:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192682

=0A=
> Currently DEPLOY_DIR/licenses is added to SSTATE_ALLOW_OVERLAP_FILES. Thi=
s=0A=
> leads to bugs since when one MACHINE_ARCH recipes is cleaned, it removes =
the=0A=
> files for another which then results in later build failures as license f=
iles=0A=
> disappear.=0A=
> =0A=
> The solution is to include SSTAGE_PKGARCH in the path names to the licens=
e files.=0A=
> That does mean a search has to be used to find the correct license files =
for a=0A=
> given PN but that can be done via SSTATE_ARCHS.=0A=
> =0A=
> The implication for other tools is the layout has changed so tools will n=
eed to=0A=
> adapt to the new paths. The benefit is no more strange build failures suc=
h as from=0A=
> patterns like:=0A=
> =0A=
> MACHINE=3Dqemux86-64 bitbake core-image-minimal=0A=
> MACHINE=3Dgenericx86-64 bitbake core-image-minimal=0A=
> MACHINE=3Dqemux86-64 bitbake linux-yocto -c clean=0A=
> MACHINE=3Dgenericx86-64 bitbake core-image-minimal -C rootfs=0A=
> =0A=
> [YOCTO #14123]=0A=
> =0A=
> For anyone finding this commit, I'd question how much people should be re=
lying on=0A=
> this code for tooling and suggest the SPDX manifests should be the prefer=
red data=0A=
> format going forward anyway.=0A=
> =0A=
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>=0A=
> ---=0A=
> =A0meta/classes-global/license.bbclass=A0=A0=A0=A0=A0=A0 |=A0 2 +-=0A=
> =A0meta/classes-global/sstate.bbclass=A0=A0=A0=A0=A0=A0=A0 |=A0 2 -=0A=
> =A0meta/classes-recipe/license_image.bbclass | 46 +++++++++++++++++------=
=0A=
> =A03 files changed, 35 insertions(+), 15 deletions(-)=0A=
> =0A=
> v2 - use reversed order of SSTATE_ARCHS=0A=
> =0A=
> diff --git a/meta/classes-global/license.bbclass b/meta/classes-global/li=
cense.bbclass=0A=
> index 23625f0104f..b2e0d3fabaf 100644=0A=
> --- a/meta/classes-global/license.bbclass=0A=
> +++ b/meta/classes-global/license.bbclass=0A=
> @@ -29,7 +29,7 @@ python do_populate_lic() {=0A=
> =A0=A0=A0=A0 lic_files_paths =3D find_license_files(d)=0A=
>=A0=0A=
> =A0=A0=A0=A0 # The base directory we wrangle licenses to=0A=
> -=A0=A0=A0 destdir =3D os.path.join(d.getVar('LICSSTATEDIR'), d.getVar('P=
N'))=0A=
> +=A0=A0=A0 destdir =3D os.path.join(d.getVar('LICSSTATEDIR'), d.getVar('S=
STATE_PKGARCH'), d.getVar('PN'))=0A=
> =A0=A0=A0=A0 copy_license_files(lic_files_paths, destdir)=0A=
> =A0=A0=A0=A0 info =3D get_recipe_info(d)=0A=
> =A0=A0=A0=A0 with open(os.path.join(destdir, "recipeinfo"), "w") as f:=0A=
=0A=
It looks like an update to do_populate_lic[dirs] was missed here.=0A=

