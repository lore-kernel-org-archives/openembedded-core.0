Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38A15E6F090
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 21:27:55 +0000 (UTC)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (NAM02-DM3-obe.outbound.protection.outlook.com [40.107.95.62])
 by mx.groups.io with SMTP id smtpd.web10.5348.1730496466583934192
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Nov 2024 14:27:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=YsM3BOeU;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.95.62, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jFRpenVIY3paElVZdz+B/55/apLOWp2KsNbq1u2Z7iSDzd1UTiPV0LzdQjDSxuR9/VeG+DyUqoZJlEvhtXz/rBn4EaSNPRuRJKdkL88dMWE/bMB01uCkG10qd3XdG+jOoeTkbbEH5bTeJy4fIQZvcOF35j2Vn9riQTwh4rt/rKgVjxlKA4RfrBFJ2ExzE4OvB4kd8JFp4kBZ1Y8dyihWoTpi8JoLcdFFw7amkw+5wMMNhsC8Xra/hltwmYgy1jklxdQ1BWxyxAp/nrf5Ctyzs9fkv6h+2vW/wQZdmfgNatGOLJSqO8ts8M9M3sfr7LXHMSfRsfVRLNzsMW80HLdBAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EQ0lrIgOQ0oq0I0hRudbaoUrHlMVUdXw8FNpktTa+gE=;
 b=dsuw6/XUJM0PHxrKA4u2dTjrl4o9avyGkZHf6GviPaDZLmYogu+0+kmPAK6Pi8faysi+ty6JsARl4iqMb4ZFPYttAfL2zvTdH62tRSIpipuF1UVkWZU4PiBBOpADHBT0nmNIJBvzytdtDSYmASWw+yon6u9X4slIjL7HSg7O6qNY81O9OYZMpYdBddAdU0D8yvFPG7lK2VRITjSmttsdsP7hxjkNvfqTbSLf6VwsEoVytteSWpbvGDybd4BZ9G0AGQHlZ+kB65j2qbdlFj2/vSNsBdT1hTxw8MHsWF49r5VoK+qucCrPY39cLiJUl3Q5JGG9nYtR6hjiUr2+KfhzkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQ0lrIgOQ0oq0I0hRudbaoUrHlMVUdXw8FNpktTa+gE=;
 b=YsM3BOeUTR7WS0uz9WnXv/c9MOavqNeyjdwJtv0VlFtNKoG73WVyViCxy5Lc4i/Cgc4rpgTBvwzNLo8ECxSiFdeui7bT2seiEMyArDEj8oO6oFrvgjpiFS7OF4pvrfGaFlEyg0I6WthG8l3uixLIc+PoCBGlXA/87vGM/B1NSrCUpAP2lx5+r08U3xjiBi+yt29c14+/LQGqii8URjnQzcXJpi0pJ6U/4CmHmIIsHVs33f+/icc2D9N+kaC8EvSifP/A9hyBcc69pMGD0oFoNTtudlTJ0UiyKfWV+UGxanQdxJ3DLfy7YL/EqBz3ELCM8DZfwlZzVM8b53EKX15aKQ==
Received: from DM8PR12MB5430.namprd12.prod.outlook.com (2603:10b6:8:28::6) by
 MN0PR12MB5762.namprd12.prod.outlook.com (2603:10b6:208:375::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Fri, 1 Nov
 2024 21:27:40 +0000
Received: from DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::604e:bc05:9357:c7d7]) by DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::604e:bc05:9357:c7d7%4]) with mapi id 15.20.8114.023; Fri, 1 Nov 2024
 21:27:39 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] devtool: modify: add DEVTOOL_PREFER_BRANCH
 support
Thread-Topic: [OE-core] [PATCH] devtool: modify: add DEVTOOL_PREFER_BRANCH
 support
Thread-Index: AQHbLJWiyUBsTo4LGkWC2zMcqdySibKi2vWAgAATJVA=
Date: Fri, 1 Nov 2024 21:27:39 +0000
Message-ID: 
 <DM8PR12MB5430BF49467783C0051229C68B562@DM8PR12MB5430.namprd12.prod.outlook.com>
References: <20241101193811.2068211-1-chris.laplante@agilent.com>
 <CANNYZj-_8+EH51Nk2tj+o7a2PpscSO2bi8e-ak8g5fnUhADULg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-_8+EH51Nk2tj+o7a2PpscSO2bi8e-ak8g5fnUhADULg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ActionId=446a3e2b-703c-476e-ba6d-5058f70627a5;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ContentBits=0;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Enabled=true;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Method=Standard;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Name=General;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SetDate=2024-11-01T21:18:46Z;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SiteId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=agilent.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5430:EE_|MN0PR12MB5762:EE_
x-ms-office365-filtering-correlation-id: 06dc55b8-427c-4c09-0b96-08dcfabc0366
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?vTxPPG4x+bl66u6MeQ0q5BoB5PXcEtOjYv8GhizaTn41o4X855BdcSgMuVJu?=
 =?us-ascii?Q?BEuMr9HjqNm/MnjcG9UVwbk7mAe4n3YXp6PDHGmDt65RYEeto4tSSEulfdx1?=
 =?us-ascii?Q?jNNv1ejdj89mwm7Xs5zMPikDtoIv/rpMNcPP46oqA2CFIJu6WYHzDcttotRb?=
 =?us-ascii?Q?OLqahY7obnLB5deHPncOVQyqnu6fsLmehIhdwpUmyKaQWZw13XaOTXXJFh8s?=
 =?us-ascii?Q?Pjf2YwaMqblPqmMPFEtLkp6rRuIL1gTHlIb3Gp4CqGrMzt+PGh36nvKMMnXa?=
 =?us-ascii?Q?JALIoFblTWra4ax3ECnagMGYGfHxzN6/5vdEzYHssWKQhaN6prqfW/UuzvlT?=
 =?us-ascii?Q?nUKfjMJNdMwqmiYLcda3inh+esOorYUhM0J4nBd4mG2JoPvU3nVjAoRTF5so?=
 =?us-ascii?Q?LH5T9tgqsZB5iFxwNNWHnK1h4nDmcnT6Yf7uj0brPlZpMt8GonJ45umNsPye?=
 =?us-ascii?Q?8hHvQdnmT4jg1f0r+de2WbEWLWxVsQnItJWggJ7+yVb77sfeqT4diygblgdX?=
 =?us-ascii?Q?xFZOPBugSx+oRvlLYpr9zJxnkQxbBfUpCRFvNQSSiPp9CzymhSafzmYmfpQS?=
 =?us-ascii?Q?YdSeISLM92/iG5vHK3BwP/vIqfscFpDCISAJNDuvowCX8ZVDaZJZREf3+G7q?=
 =?us-ascii?Q?becVWrybDdgj4V7uYB0TPdujIgSTrgJca2NF69Omt8SdgkG3mQJrK5PmYd6z?=
 =?us-ascii?Q?WlfRR8seTEbN2zP5Af6RQoRP+aLKmpZAOm7NX+riGJZyt+3Su3PJYpvht/UU?=
 =?us-ascii?Q?LJ5K0QqF1+3XcBgMBuxZ4lJ82IyPkybNEW5n7YJmqt/UZ+k6KseAIhIEgu8O?=
 =?us-ascii?Q?0kgeXWrGtl2BO4KQomuaKodMKfOOF+IM6k8ZFW8k/m4QxeSlSeQs8fs4vDBj?=
 =?us-ascii?Q?unIknaj8lo9jgudJ7XaAVw0yMUqaDZkNoWvfm9ff/8jCBrUkvVhKfA3SC8L0?=
 =?us-ascii?Q?d/ZWH5ewvwXUTXubVopewxipF3GcMRW2iUHwXFEbOzcVCtoU0HWgvLS+DZjl?=
 =?us-ascii?Q?rWneSesHGEqYaRQD+CMk7OTP9INB8cxn8h33u9KRbQnc1bOF+hTg15F/9tyC?=
 =?us-ascii?Q?Sn7y/Vf8wv/0wsS0AqfOMh0F+GQSiGWltS+o8q9fvBWh3IzAysXt3khdGwzD?=
 =?us-ascii?Q?pLXKXUPTIRZVV2I92keQxav57CQOJnKOXFDFHxuoo1gb69aISkDJ2fOD6j0c?=
 =?us-ascii?Q?/iN5Bo7meubqIgWoEwr0iZ897VxHZcpRXarHFyX15PDIyb+gwvCJwDZKOvqv?=
 =?us-ascii?Q?4kGIkePCI81lt+l/iVNq2DjPFd7XnFYiVTfOgv2vTjONppx2EPzc6zHWvkpG?=
 =?us-ascii?Q?QEWlgjtnqHktCXmfBGbyCnFN?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5430.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?b5RDHWMqbo8/IEukVyQ0C/+GSAkpe1N41g1p0uat6MQyu8EN0sqXpVSz7d/m?=
 =?us-ascii?Q?Os2YHAaq4STHnS07HZY+V1r2EywCuuLuhYPcL9QatjdbaMYROxBQhC5cj6fG?=
 =?us-ascii?Q?DtiMmSZYFSWUrNwfaUSowDu+gHslf27W/03mXR3dEPaIYmPf8BPyT2dsyJPN?=
 =?us-ascii?Q?WGuiRzWI4y9GN/o0jfn6yXpWJn5LbQKOyGQmxlGCxkrwMzO6zgvQ+91us648?=
 =?us-ascii?Q?4Ia9hL7YlRRxTT0M0gAnwzO3ZHNTJnNcvwF/A9rPIEmY4r1zaoVtIVQF71FG?=
 =?us-ascii?Q?we/3rflBEuVufvnUwI0YeOSOlvqJwKdDlOmNB4zbYqiKP1Tk7sPjhfmXpslc?=
 =?us-ascii?Q?5RhK574lvR3zpWULM/7dqktGHwU76jvIBjwSI8to6v4Z0chovl/lotDZ0Upb?=
 =?us-ascii?Q?zWczAtyBu1VGrnEDj8YvqKnfpBYuyGb8NSZ1ozkMAqDfAeOyQbs4gJH9YKB3?=
 =?us-ascii?Q?fat+S0W+cdatpWKqLltl+teVqnwM9t7VGTGBMbWBiAh3WgZlFGFvCJS2wWwf?=
 =?us-ascii?Q?Vp9hKn+pyxA8noNcX2xEDrKh1aOJofj3cTNF+8nOagS7MTs8v8azEksU0wxv?=
 =?us-ascii?Q?ksVJJ6MFIGIcWgPbRLF7FnYJFGt8zd4Rilb61PsUm7KTRCJo5IPIaj8QAu8X?=
 =?us-ascii?Q?vmETBRjGrgUvcrYH3fO8CIHUj6lyp5JFjbpuzPQ3kKehGQSfqkXmU5skIsaQ?=
 =?us-ascii?Q?yGiLITJpzo+rr/4U212DNYIbltkZdr0SOUeTlvASCAyv8cAq4sknUbmtVfwl?=
 =?us-ascii?Q?XUmLX0WcftdLpgW6+cbsk5kbT3fdamc6eQBlKjBD3s5uPqU/lrvjaIpi69In?=
 =?us-ascii?Q?xMb4UDcwNH+Qwk2yOVTlOy0Hakbi/VkulwpXwUr3Y8gSeg52FvuBgc33m+O7?=
 =?us-ascii?Q?G0HEc0jsk1YW+Iiksq8jFMeCn1KA3OsSM1Kp0tUdI6BKKjLUALxmwniH3tHh?=
 =?us-ascii?Q?bvPt5V56NOiN3iRmRn6JhgkHVjVrOGwP0P5mBvP3m1YiB3aaBwEzA+XOCeuX?=
 =?us-ascii?Q?w0ajlYNYGShWWHTPgtP0UC6rPXkBGrzE3KWzruRBN2FnlO69EJ8hsE8mYYRF?=
 =?us-ascii?Q?nUP1E/m/htMMEke+2ezX5G4ZIaO/+TkTjTIiadrSc/3MoZmgi6QYxPLiK/Vh?=
 =?us-ascii?Q?2hbA9Q/5OGv8jcD4ca7iXsYCr+RreQi75eSvcAPgTyY7Cab1UOthQ8se4K6s?=
 =?us-ascii?Q?ZiZr2E0UlZbe6Iay1HStZGjWB1dLhbhwL/1iywB7XWy/IkQf2chsYh/6It5s?=
 =?us-ascii?Q?K8ZdGDYiSHJiQWYb5oO6GZM5PyeOZQPqLhDdipng5TW9ydLse7hvV9i65VXN?=
 =?us-ascii?Q?z/nt6myvhSHOkNFuBJoWIQMFfEkTDwhtCKIZ+9u6WeQEZxiKw9DfbsZq4gOI?=
 =?us-ascii?Q?lFmC/4zaCSwrZoaGJ7COrC9/D2od/uCMlboK8e6gSV+rjzJcb2QxRA3XSemR?=
 =?us-ascii?Q?bCIDfOz7pCiWp/xS3xASzowEaKWOxy0/UHPSiCJ0drujWLawoWLy8ax93pGZ?=
 =?us-ascii?Q?rzIkP9wWCgqir4nPt1Ada+e0wUvYAh5lMJvJqYm6iZjg1WntzsRFT7bMkAe0?=
 =?us-ascii?Q?taH3Yy9SfpXkZzz2nPmikau4h8rFqgkNf5Ctl+CR?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06dc55b8-427c-4c09-0b96-08dcfabc0366
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2024 21:27:39.7064
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: esHxnDJ7DQidKadiJ+O7RF2ktdlDqtna5B1rlnkgmRBMNqgRV1sV9DIlHOlnZ5WioI1j9Ic94GsV8/6b0b317otERFpVKSEID1JgMuQ9OaU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5762
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 21:27:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206637

Hi Alex,

> Will devtool finish and devtool reset do the right thing as well when thi=
s is
> used?
>
> Alex
>
> On Fri 1. Nov 2024 at 20.38, Chris Laplante via
> http://lists.ope/
> nembedded.org%2F&data=3D05%7C02%7Cchris.laplante%40agilent.com%7C8f50
> bd87a682487c18a508dcfab13c88%7Ca9c0bc098b46420693512ba12fb4a5c0%7
> C0%7C0%7C638660886342885249%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiM
> C4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%
> 7C%7C&sdata=3DRLYQPy6ueVmaBE1IuIX28ADzR14kx8uEz7CdM76e8BM%3D&res
> erved=3D0 <chris.laplante=3Dmailto:agilent.com@lists.openembedded.org> wr=
ote:
> From: Chris Laplante <mailto:chris.laplante@agilent.com>
>
> Provide a per-recipe opt-out for devtool's default behavior of using the
> 'devtool'
> branch. This is primarily intended for company-internal recipes (e.g. on =
private
> layers) that use floating upstream SRCREV. It is assumed that such recipe=
s do
> not care about patches, since the upstream is 100% controlled by the user=
.

devtool reset works fine. (We have been using this patch internally for the=
 last 6 or 7 years.)

I just tested 'devtool finish' and 'devtool update-recipe', and both are br=
oken (not by this patch) for recipes with SRCREV =3D "${AUTOREV}" in genera=
l. So I wonder if devtool needs to be taught to handle recipes using AUTORE=
V. In which case, perhaps it should just automatically do the "DEVTOOL_PREF=
ER_BRANCH" behavior...

Here is a trace of the failure, for example:

INFO: Updating SRCREV in recipe recipe_git.bb (dry-run)
Traceback (most recent call last):
  File "/home/laplante/main_yocto/sources/poky/scripts/devtool", line 350, =
in <module>
    ret =3D main()
  File "/home/laplante/main_yocto/sources/poky/scripts/devtool", line 337, =
in main
    ret =3D args.func(args, config, basepath, workspace)
  File "/home/laplante/main_yocto/sources/poky/scripts/lib/devtool/standard=
.py", line 1995, in update_recipe
    updated, _, _ =3D _update_recipe(args.recipename, workspace, rd, args.m=
ode, args.append, args.wildcard_version, args.no_remove, args.initial_rev, =
dry_run_outdir=3Ddry_run_outdir, no_overrides=3Dargs.no_overrides, force_pa=
tch_refresh=3Dargs.force_patch_refresh)
                    ~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/laplante/main_yocto/sources/poky/scripts/lib/devtool/standard=
.py", line 1955, in _update_recipe
    updated, appendf, removed =3D _update_recipe_srcrev(recipename, workspa=
ce, srctree, crd, appendlayerdir, wildcard_version, no_remove, no_report_re=
move, dry_run_outdir)
                                ~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^
  File "/home/laplante/main_yocto/sources/poky/scripts/lib/devtool/standard=
.py", line 1642, in _update_recipe_srcrev
    upd_p, new_p, del_p =3D _export_patches(srctree, rd, old_srcrev,
                          ~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^
                                          patches_dir)
                                          ^^^^^^^^^^^^
  File "/home/laplante/main_yocto/sources/poky/scripts/lib/devtool/standard=
.py", line 1387, in _export_patches
    GitApplyTree.extractPatches(srctree, start_revs, destdir, patch_pathspe=
c)
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^
  File "/home/laplante/main_yocto/sources/poky/meta/lib/oe/patch.py", line =
523, in extractPatches
    out =3D runcmd(["sh", "-c", " ".join(shellcmd)], os.path.join(tree, nam=
e))
  File "/home/laplante/main_yocto/sources/poky/meta/lib/oe/patch.py", line =
49, in runcmd
    raise CmdError(cmd, exitstatus >> 8, "stdout: %s\nstderr: %s" % (stdout=
, stderr))
oe.patch.CmdError: Command Error: 'sh -c 'git format-patch --no-signature -=
-no-numbered AUTOINC -o /tmp/oepatchczdfrg5l -- .'' exited with 0  Output:
stdout:
stderr: fatal: bad revision 'AUTOINC'

Thanks,
Chris

