Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE8CAC433FE
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 14:30:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8223.1668090626058746101
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Nov 2022 06:30:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Pexgj60w;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8313773439=narpat.mali@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AACTgFF014003
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 06:30:25 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=HN/n91Ey/b9c8WswSdIRk4L0odpulQ+zU79byThwknM=;
 b=Pexgj60w4oJylDuD9IDXXnIGSgzwHlDcMXY/Wg8JZR6xvHZSjrq/i3+JEyOmHVKrD1eo
 wRhDNXi0MuszjjaE7/oScbtqWJ8RWwzXjBeMRmY1zVKmDOycBxxYz6sloowNKvgwNs0u
 Gq1N1PzBcIPp0f77sFxYFQ3+Nw6Xwtar1dzXhSVX0d3ArYUdkbLq178+DLyEelDYivlO
 2dQptus4g90FcwOqVprkOffdhfQ9xPUSaBgxJJKOq3Aok10QsI9CtqVbBTy791cbfFLl
 pAYeN3S1zOVNpM6s1a2s32WWASxaWFBe72MDjfnaNu2Gt5VGGOZ8jyZACQL6yhfi5HTd 6A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3knk43cn0p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 06:30:25 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AAETpxf010844
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 06:30:24 -0800
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1anam02lp2041.outbound.protection.outlook.com [104.47.57.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3knk43cn0n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Nov 2022 06:30:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JqTVrpjW+BI1a9E8rUfMgKPEHSVL+4PJ7maO65D+8YbHzWlom0ur+0N9v/sruNZBJvUpjP5A3eRwXa6KmodrD00mSfLS8xyVZFodpZoiYuz/v0bwpI2yI9KleHJsmf+bYN+NT7i6aDLElDhlihqv9JRBdkLSC16X3ehs1CoIeMxyrmB/sTFvtu3XnQajijGwABkTyoHwym2d3NaDF/oABEat/AqKkBrBev3U6tj8JDt1qPfB6Gb0v/7pmWIyWACNE4i3wLlAWBM13Dw6xQpvpgnlOt2nOKxB6JTexIIi1rfhoWz7GiMEFVbhJ6eMx6ul+2z6MLwj+AznedxqbdX30g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HN/n91Ey/b9c8WswSdIRk4L0odpulQ+zU79byThwknM=;
 b=U9j0eLW/xK1RLH8FNg9GkIIViLXbKIKGThnTazwc1eF2VMwtASjGZpVCrQHLLUiSa1U+jDTVOeDFRxtyEFbIHv6kzg/7CS9R2qsoSHUkcYu+7owexMX0GX//H8QSEiyu066mxklWpVSYXc4AWMmLstW/CSO9yePIvcwtj3aEadYVgRezm2eBBWFnJp8wj+MlSfTHKGvM0XvcNRKRbZ2KIO2y340TPfxPFF4CxGjCCzjRlLDhVNkU/e7t/vIrCtPwiFHW3PZCUnP0pqqHKHlupwPSVug+LXCgzJCG+PE4IxXxwoBur4vkFXrpKonAorLh0gKpVSbXQN7IitZoRbNXGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24)
 by MW4PR11MB6958.namprd11.prod.outlook.com (2603:10b6:303:229::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Thu, 10 Nov
 2022 14:30:22 +0000
Received: from DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::332b:c38a:c916:43d9]) by DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::332b:c38a:c916:43d9%6]) with mapi id 15.20.5791.027; Thu, 10 Nov 2022
 14:30:22 +0000
From: "Mali, Narpat" <Narpat.Mali@windriver.com>
To: Tim Orling <ticotimo@gmail.com>
CC: Alexander Kanavin <alex@linutronix.de>,
        "G Pillai, Hari"
	<Hari.GPillai@windriver.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        "Polampalli, Archana" <Archana.Polampalli@windriver.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][kirkstone][PATCH 1/1] python3-mako: upgrade 1.1.6 ->
 1.2.0
Thread-Topic: [OE-core][kirkstone][PATCH 1/1] python3-mako: upgrade 1.1.6 ->
 1.2.0
Thread-Index: AQHY6d+HAj5KszDx+kuwI4zEZtgwDq4qNnOAgAF5n9mAAJR0gIAMCUBw
Date: Thu, 10 Nov 2022 14:30:22 +0000
Message-ID: 
 <DM4PR11MB555002770BA700300F9FBB96E4019@DM4PR11MB5550.namprd11.prod.outlook.com>
References: <20221027083541.1757707-1-narpat.mali@windriver.com>
 <CANx9H-AzEchfTH796JGdD1AFRAa3zYD6wBDmWU3JYQiX+VVzvw@mail.gmail.com>
 <DM4PR11MB55501F0FED5A7469F5FC9009E4399@DM4PR11MB5550.namprd11.prod.outlook.com>
 <CANx9H-B2X748reADNACGu3ys+=qraG87qtnCiaj2wKVX=iN=Tg@mail.gmail.com>
In-Reply-To: 
 <CANx9H-B2X748reADNACGu3ys+=qraG87qtnCiaj2wKVX=iN=Tg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-IN
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5550:EE_|MW4PR11MB6958:EE_
x-ms-office365-filtering-correlation-id: dce0da59-ad68-48a2-8e3a-08dac32819a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 7ke6wKv5FyOT/6cFsxJHayeqYt3w8zcaj9MQI/8Zu6uNOXP7cO9/KuaGy+95ecnr3vm5uGKETOyTIsztLqGM68Hatewxued6roABdF13HhtfgDg2/4oGy/9GImIk8uoXAf/D5ARXoheGYBbYJDuRhh+EAp7IriuftFiC7mOuKU22nz/vBdSm7DisOEp92qQDcRfaEVca6kJaNum7wn4XW0XRhwbmB0vCsKG2UZEdGxi6Pnd3s5yAZeCRhzCaRVQchFFVrkq8t3b3j2fUc2k3Pd7g4SkfKK/PPU86OtQObyc23Rso68OcIoZrABpg/4EOza991spziKU7AkzLoECeSTabVqnwEzeuT+upjFgqftyn4O4NHkN4Jr3hAUVzvkZiJzbnPGTQ+BTnThY0+xagugdXycUrkT9L1p1xC2yo2SZfY/Qx5A9ZKLb0+XvA2LBR1ApFPpTmGxA2aRbbKs0qAe/kSyNqYgKqbPwMyOE9wW3l1iJ9LZ9aP4Uw5BwQNQe/l1dXDk2LWeRkRNBS2uJhg1K8WejNysj1BAFG+76hyMfebTYG1y47WSeC9nNCdt6Uf6QvI7p0Q5ULeO81RLkyEs+xePIAjho1Mb7JEPf+41CkCkvEq1BGE/g7XsxQSFb5WG5hhgyjV9HxQayFWdudXN4wIPWFEljDZ17NQ7jUjj+JTpbIrZhUCmfud+1RyYl5NrV6Jq+VhQe8nZzZi0YPTXkSR6cTGzM0Gybj226AyZia2O3w5kOPYLbPzioOMZBCagVegMvhNAa1nJSsAZFE+pZ9GKefxH3UtDhziLaWrY4egAHGbhck0H64gFJlgvWd6oTSZrJkarTfScvW1GbaLg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(39850400004)(136003)(366004)(451199015)(53546011)(9686003)(83380400001)(26005)(186003)(38100700002)(122000001)(99936003)(166002)(66556008)(6506007)(5660300002)(2906002)(7696005)(55016003)(6916009)(966005)(71200400001)(41300700001)(54906003)(478600001)(4326008)(76116006)(66946007)(52536014)(9326002)(64756008)(316002)(66476007)(66446008)(91956017)(8676002)(8936002)(66899015)(33656002)(38070700005)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?BrceOMy7fBctc/rB9M61cADCSvsfJtKRL34N/fPME8iB1RGOfOHuUGNI?=
 =?Windows-1252?Q?rpHbX3phfoilTo3NEDWoyw7LjoU2AnAx5oKzCfwuDCPpcO6BdPP72XvM?=
 =?Windows-1252?Q?P4kif1qx8G/1pCrtbYc/aPo38ZLdGEWixk2DOAxvUwQIHw5WIvyKWg7w?=
 =?Windows-1252?Q?k7TnA5x9Ah0z7/jy2CU6tv5XyHK0UyEMCdEYNIzUSFSInaziydadAuD/?=
 =?Windows-1252?Q?CiH2zCCHL48Zmga/m0ghN3w1f5J3LiIDHdXBm1sAJReaEqbuSNXtLBPN?=
 =?Windows-1252?Q?iVnhFTq2xRf61N8yg7w0M9esBu7IbdMONdxzcEutxuUy0GaAt5qV1/52?=
 =?Windows-1252?Q?7V9F4ONUvTOH6KuMnFPIMIcYoGucmc0zOSJjChSdigcSv7fbk9Ml1RPe?=
 =?Windows-1252?Q?TlEry9gIq3W67Tqn5uy3nDSRPHikSq9pVRTdwZhPWAZ//BLT3BWpctwb?=
 =?Windows-1252?Q?OdKNauTVbz1pkGX2ZsDoaJhDjzSPfpJCUz1cphQ+Tg4fytAVTltdZzH8?=
 =?Windows-1252?Q?iOsGPXExK+CgsgiI9O9wsQ3mg6GU6FebuUHWn75La1L5BPcaGDxLWy7Z?=
 =?Windows-1252?Q?5tVt6PWL84il7D/qtGbMpFIhLtXsaV/7q8NaKJ90sUInmuVIWszCn0aT?=
 =?Windows-1252?Q?jLhKeOh0t5SoGUXT953g6bZJGkrlQzRDtY/qJf7NVrMBPENzRyNGgmy4?=
 =?Windows-1252?Q?pq6bogur/uJRfwykGpTmzGGGrJD2yDEKp+18rE62MEiphxH/LK8Cyrfy?=
 =?Windows-1252?Q?IYobFovQcP6fHf5qoHhDIfUNExzC4PHyYht5HWMH/0rO5zJsClPKB8Pb?=
 =?Windows-1252?Q?uzzGY6e3K3mpxC1UHlWETSAuLcGKMHk9iACD3PSrTN9flth7wDEGzCQA?=
 =?Windows-1252?Q?i2SKuG+26K52G6TdaMFsN/WzdXz1hA3DQ39fZg0SxLR6sVFh0hW8siSx?=
 =?Windows-1252?Q?nv83rNOqpNTCwtS+45/a8PYjMFH6jVloGvKLyHLjJK8mIcgagyZhCHFW?=
 =?Windows-1252?Q?yWbytxRryycjNGpY9sqRfEPZ2TNbKSkpPU1WpW2P5eqBXKdddBpnb7oq?=
 =?Windows-1252?Q?SeTRYZ7QYPTjXV7kHjPvl8FgDe/VSwJRx6lnxnf7itMJbdC9T33Nm/5D?=
 =?Windows-1252?Q?rIPIxXcB0pMGQX9DRF/isCM51v5MvE/iumZYWjgZSYVHh2qaKpZ1T86+?=
 =?Windows-1252?Q?DjLIdJKPVG76EhYAu4nOQ8PPPalqmPymHB+rsEMVJ61PDksg1h0I43Zl?=
 =?Windows-1252?Q?KTwkF2om974hIBLzEjHtIDlgGC8QQ6T20cMlqv9cZMpu2MRxoZcqoa4N?=
 =?Windows-1252?Q?GmCGhpG23Nd7ZYgmFkIx7A6poM7HUAlmIgKGWGrowX7QyPFGy6QL0LAG?=
 =?Windows-1252?Q?heuBnlkpW4Wgf5o8orIyfpPqP2GHRGqoo8hCdzCGVSwy4KA5+xOS62sw?=
 =?Windows-1252?Q?Jd7QELxV+wtzbR/GBcKxwbnyfvzSO2DEhRO/YDeyxBQjyZEg48e1OcPZ?=
 =?Windows-1252?Q?LeHa64jxW0ka/ByR4NrpUMXKJe2t8YOK1Rc2lkhGepyhAVtRPc4cIHkG?=
 =?Windows-1252?Q?mTYEG73Omv1ztFgCBdyJxiWAwsmdkqYJDYD6U/nSDy7ohYsew5fuzerw?=
 =?Windows-1252?Q?yAE5LocngQjaN22Au2sy/ihW5W9QRcpcfbaw8zyZK+j+g8EqWc54OAtJ?=
 =?Windows-1252?Q?ENLZ58v/00hObZk5YfESJmF8DgkrFLEeRN9lGWPMm4qtpmiupYUIwCex?=
 =?Windows-1252?Q?TSFr44AqQ+4lTivNztU=3D?=
Content-Type: multipart/related;
	boundary="_004_DM4PR11MB555002770BA700300F9FBB96E4019DM4PR11MB5550namp_";
	type="multipart/alternative"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dce0da59-ad68-48a2-8e3a-08dac32819a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2022 14:30:22.2709
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EWgUz5sT7iaRMcuU/qrjkeDUV/z4EoWcGjeoVqDSyAqE/wY44yL8MArgvY3LcD3ciR38RFH/Z1tW9ibPmN0u3TDOp957vQUfTv8N9Nf7YL8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6958
X-Proofpoint-ORIG-GUID: qCh7wiXpv2Q02FRTZZJAC24mznW5rcKo
X-Proofpoint-GUID: aCae5ogobjYi7vldlTvf-gNPI9_AX_Nn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-10_09,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 phishscore=0 mlxscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211100103
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 14:30:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173076

--_004_DM4PR11MB555002770BA700300F9FBB96E4019DM4PR11MB5550namp_
Content-Type: multipart/alternative;
	boundary="_000_DM4PR11MB555002770BA700300F9FBB96E4019DM4PR11MB5550namp_"

--_000_DM4PR11MB555002770BA700300F9FBB96E4019DM4PR11MB5550namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Tim,

Have sent the patch to backport the CVE fix on python3-mako 1.1.6 version.

Best Regards,
Narpat

From: Tim Orling<mailto:ticotimo@gmail.com>
Sent: 03 November 2022 04:11
To: Mali, Narpat<mailto:Narpat.Mali@windriver.com>
Cc: Alexander Kanavin<mailto:alex@linutronix.de>; G Pillai, Hari<mailto:Har=
i.GPillai@windriver.com>; Luca Ceresoli<mailto:luca.ceresoli@bootlin.com>; =
Polampalli, Archana<mailto:Archana.Polampalli@windriver.com>; openembedded-=
core@lists.openembedded.org<mailto:openembedded-core@lists.openembedded.org=
>
Subject: Re: [OE-core][kirkstone][PATCH 1/1] python3-mako: upgrade 1.1.6 ->=
 1.2.0

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.


On Wed, Nov 2, 2022 at 8:21 AM Narpat Mali <narpat.mali@windriver.com<mailt=
o:narpat.mali@windriver.com>> wrote:
Hi Tim,

Actually, our product is based on =93kirkstone=94 branch in which the curre=
nt version of python3-mako is 1.1.6 version.
The CVE-2022-40023 has been fixed in python3-mako 1.2.2 version and this is=
 the patch available on GitHub https://github.com/sqlalchemy/mako/commit/92=
5760291d6efec64fda6e9dd1fd9cfbd5be068c<https://urldefense.com/v3/__https:/g=
ithub.com/sqlalchemy/mako/commit/925760291d6efec64fda6e9dd1fd9cfbd5be068c__=
;!!AjveYdw8EvQ!cp5_at5LQwcAN2n-5SkkRsIMXCm-NnlpfsskzuKFjA9ZTJT-P6eRqeSaouMi=
XJlkvgqxIrLP0s3Y1nnqKl0H$>

In master branch python3-mako is already been upgraded to 1.2.2 version. We=
 want the CVE-2022-40023 fix to be available on kirkstone branch so, I have=
 sent patch request to upgrade python3-mako from 1.1.6 -> 1.2.0 , 1.2.0 -> =
1.2.1 , & 1.2.1 -> 1.2.2 version.

It is the 1.1.6 to 1.2.0 upgrade that adds new =93changes=94. So either you=
 make a strong case that the changes do not break ABI or you backport a fix=
 for the CVEs.

Have also found that the version 1.2.2 doesn=92t include any new feature as=
 below.
1.2.2
Released: Mon Aug 29 2022
bug

  *   [bug] [lexer]
Fixed issue in lexer where the regexp used to match tags would not correctl=
y interpret quoted sections individually. While this parsing issue still pr=
oduced the same expected tag structure later on, the mis-handling of quoted=
 sections was also subject to a regexp crash if a tag had a large number of=
 quotes within its quoted sections. Credit to Sebastian Chnelik for locatin=
g the issue.
As Mako templates inherently render and directly invoke arbitrary Python co=
de from the template source, it is never appropriate to create templates th=
at contain untrusted input.
References: #366<https://urldefense.com/v3/__https:/github.com/sqlalchemy/m=
ako/issues/366__;!!AjveYdw8EvQ!cp5_at5LQwcAN2n-5SkkRsIMXCm-NnlpfsskzuKFjA9Z=
TJT-P6eRqeSaouMiXJlkvgqxIrLP0s3Y1ue7GW-n$>


Shall I just backport this CVE-2022-40023 fix given in 1.2.2 version on pyt=
hon3-mako 1.1.6 version or what shall I do in this case ?

Best Regards,
Narpat


From: Tim Orling <ticotimo@gmail.com<mailto:ticotimo@gmail.com>>
Sent: Tuesday, November 1, 2022 8:47:47 PM
To: Mali, Narpat <Narpat.Mali@windriver.com<mailto:Narpat.Mali@windriver.co=
m>>
Cc: openembedded-core@lists.openembedded.org<mailto:openembedded-core@lists=
.openembedded.org> <openembedded-core@lists.openembedded.org<mailto:openemb=
edded-core@lists.openembedded.org>>; Polampalli, Archana <Archana.Polampall=
i@windriver.com<mailto:Archana.Polampalli@windriver.com>>; G Pillai, Hari <=
Hari.GPillai@windriver.com<mailto:Hari.GPillai@windriver.com>>; Alexander K=
anavin <alex@linutronix.de<mailto:alex@linutronix.de>>; Luca Ceresoli <luca=
.ceresoli@bootlin.com<mailto:luca.ceresoli@bootlin.com>>
Subject: Re: [OE-core][kirkstone][PATCH 1/1] python3-mako: upgrade 1.1.6 ->=
 1.2.0


[Please note: This e-mail is from an EXTERNAL e-mail address]
This would break stable policy as it includes new features:

https://docs.makotemplates.org/en/latest/changelog.html#change-1.2.0<https:=
//urldefense.com/v3/__https:/docs.makotemplates.org/en/latest/changelog.htm=
l*change-1.2.0__;Iw!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ=
_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABi7HzfhJ$>

1.2.0
Released: Thu Mar 10 2022
changed

  *   [changed] [py3k]

Corrected =93universal wheel=94 directive in setup.cfg so that building a w=
heel does not target Python 2.

References: #351<https://urldefense.com/v3/__https:/github.com/sqlalchemy/m=
ako/issues/351__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_j=
GnDIa09o0b7fl0FewZr1UlMEFq79SSZABkYd7YO7$>

  *   [changed] [py3k]

The bytestring_passthrough template argument is removed, as this flag only =
applied to Python 2.

  *   [changed] [py3k]

With the removal of Python 2=92s cStringIO, Mako now uses its own internal =
FastEncodingBuffer exclusively.

  *   [changed] [py3k]

Removed disable_unicode flag, that=92s no longer used in Python 3.

  *   [changed]

Refactored test utilities into mako.testing module. Removed unittest.TestCa=
se dependency in favor of pytest.

References: #349<https://urldefense.com/v3/__https:/github.com/sqlalchemy/m=
ako/issues/349__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_j=
GnDIa09o0b7fl0FewZr1UlMEFq79SSZABkPlQz9_$>

  *   [changed] [setup]

Replaced the use of pkg_resources with the importlib library. For Python < =
3.8 the library importlib_metadata is used.

  *   [changed] [py3k]

Removed support for Python 2 and Python 3.6. Mako now requires Python >=3D =
3.7.

bug

  *   [bug] [py3k]

Mako now performs exception chaining using raise from, correctly identifyin=
g underlying exception conditions when it raises its own exceptions. Pull r=
equest courtesy Ram Rachum.

On Thu, Oct 27, 2022 at 1:38 AM Narpat Mali <narpat.mali@windriver.com<mail=
to:narpat.mali@windriver.com>> wrote:
License-Update: copyright years
Signed-off-by: Alexander Kanavin <alex@linutronix.de<mailto:alex@linutronix=
.de>>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com<mailto:luca.ceresol=
i@bootlin.com>>

Upstream master commit:
https://git.openembedded.org/openembedded-core/commit/?id=3Df273900e846b8ac=
416c9d579db32a08c2f34141e<https://urldefense.com/v3/__https:/git.openembedd=
ed.org/openembedded-core/commit/?id=3Df273900e846b8ac416c9d579db32a08c2f341=
41e__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7=
fl0FewZr1UlMEFq79SSZABiU1UtWG$>

Signed-off-by: Narpat Mali <narpat.mali@windriver.com<mailto:narpat.mali@wi=
ndriver.com>>
---
 .../python/{python3-mako_1.1.6.bb<https://urldefense.com/v3/__http:/python=
3-mako_1.1.6.bb__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_=
jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABqRMx25E$> =3D> python3-mako_1.2.0.bb<http=
s://urldefense.com/v3/__http:/python3-mako_1.2.0.bb__;!!AjveYdw8EvQ!dSMZxno=
sWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABtTOsC=
S_$>} | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-mako_1.1.6.bb<https://urldefe=
nse.com/v3/__http:/python3-mako_1.1.6.bb__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5a=
Sur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABqRMx25E$> =3D> p=
ython3-mako_1.2.0.bb<https://urldefense.com/v3/__http:/python3-mako_1.2.0.b=
b__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl=
0FewZr1UlMEFq79SSZABtTOsCS_$>} (59%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.1.6.bb<https://url=
defense.com/v3/__http:/python3-mako_1.1.6.bb__;!!AjveYdw8EvQ!dSMZxnosWE-wgF=
xB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABqRMx25E$> b/=
meta/recipes-devtools/python/python3-mako_1.2.0.bb<https://urldefense.com/v=
3/__http:/python3-mako_1.2.0.bb__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ=
5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABtTOsCS_$>
similarity index 59%
rename from meta/recipes-devtools/python/python3-mako_1.1.6.bb<https://urld=
efense.com/v3/__http:/python3-mako_1.1.6.bb__;!!AjveYdw8EvQ!dSMZxnosWE-wgFx=
B5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABqRMx25E$>
rename to meta/recipes-devtools/python/python3-mako_1.2.0.bb<https://urldef=
ense.com/v3/__http:/python3-mako_1.2.0.bb__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5=
aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABtTOsCS_$>
index 71e5d96ba1..11e5f326bd 100644
--- a/meta/recipes-devtools/python/python3-mako_1.1.6.bb<https://urldefense=
.com/v3/__http:/python3-mako_1.1.6.bb__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur=
9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABqRMx25E$>
+++ b/meta/recipes-devtools/python/python3-mako_1.2.0.bb<https://urldefense=
.com/v3/__http:/python3-mako_1.2.0.bb__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur=
9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABtTOsCS_$>
@@ -2,16 +2,18 @@ SUMMARY =3D "Templating library for Python"
 HOMEPAGE =3D "http://www.makotemplates.org/<https://urldefense.com/v3/__ht=
tp:/www.makotemplates.org/__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKE=
rqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABgBvHIC8$>"
 SECTION =3D "devel/python"
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D943eb67718222db21d44a4ef1836675=
f"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db32291f107a8f1ea94c4a41e00a6a18=
d"

 PYPI_PACKAGE =3D "Mako"

 inherit pypi python_setuptools_build_meta

-SRC_URI[sha256sum] =3D "4e9e345a41924a954251b95b4b28e14a301145b544901332e6=
58907a7464b6b2"
+SRC_URI[sha256sum] =3D "9a7c7e922b87db3686210cf49d5d767033a41d4010b284e747=
682c92bddd8b39"

 RDEPENDS:${PN} =3D "${PYTHON_PN}-html \
+                  ${PYTHON_PN}-markupsafe \
                   ${PYTHON_PN}-netclient \
+                  ${PYTHON_PN}-pygments \
                   ${PYTHON_PN}-threading \
 "

--
2.34.1




-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#172593): https://lists.openembedded.org/g/openembedded-=
core/message/172593<https://urldefense.com/v3/__https:/lists.openembedded.o=
rg/g/openembedded-core/message/172593__;!!AjveYdw8EvQ!cp5_at5LQwcAN2n-5SkkR=
sIMXCm-NnlpfsskzuKFjA9ZTJT-P6eRqeSaouMiXJlkvgqxIrLP0s3Y1lXqeEXU$>
Mute This Topic: https://lists.openembedded.org/mt/94600007/924729<https://=
urldefense.com/v3/__https:/lists.openembedded.org/mt/94600007/924729__;!!Aj=
veYdw8EvQ!cp5_at5LQwcAN2n-5SkkRsIMXCm-NnlpfsskzuKFjA9ZTJT-P6eRqeSaouMiXJlkv=
gqxIrLP0s3Y1lInCKnh$>
Group Owner: openembedded-core+owner@lists.openembedded.org<mailto:openembe=
dded-core%2Bowner@lists.openembedded.org>
Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub<https=
://urldefense.com/v3/__https:/lists.openembedded.org/g/openembedded-core/un=
sub__;!!AjveYdw8EvQ!cp5_at5LQwcAN2n-5SkkRsIMXCm-NnlpfsskzuKFjA9ZTJT-P6eRqeS=
aouMiXJlkvgqxIrLP0s3Y1vrEiIBt$> [ticotimo@gmail.com<mailto:ticotimo@gmail.c=
om>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


--_000_DM4PR11MB555002770BA700300F9FBB96E4019DM4PR11MB5550namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
h3
	{mso-style-priority:9;
	mso-style-link:"Heading 3 Char";
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:13.5pt;
	font-family:"Calibri",sans-serif;
	font-weight:bold;}
h4
	{mso-style-priority:9;
	mso-style-link:"Heading 4 Char";
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;
	font-weight:bold;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
code
	{mso-style-priority:99;
	font-family:"Courier New";}
span.Heading3Char
	{mso-style-name:"Heading 3 Char";
	mso-style-priority:9;
	mso-style-link:"Heading 3";
	font-family:"Calibri",sans-serif;
	font-weight:bold;}
span.Heading4Char
	{mso-style-name:"Heading 4 Char";
	mso-style-priority:9;
	mso-style-link:"Heading 4";
	font-family:"Calibri",sans-serif;
	font-weight:bold;}
span.m-1127688351980422530heading4char
	{mso-style-name:m_-1127688351980422530heading4char;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:82997384;
	mso-list-template-ids:-1;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:72.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:108.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:144.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:180.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:216.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:252.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:288.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:324.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l1
	{mso-list-id:750542091;
	mso-list-template-ids:-1;}
@list l1:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l1:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:72.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l1:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:108.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:144.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:180.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:216.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:252.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:288.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:324.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2
	{mso-list-id:1987586084;
	mso-list-template-ids:-1;}
@list l2:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l2:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:72.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l2:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:108.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:144.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:180.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:216.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:252.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:288.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:324.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style>
</head>
<body lang=3D"EN-IN" link=3D"blue" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi Tim,</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Have sent the patch to backport the CVE fix on pytho=
n3-mako 1.1.6 version.</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best Regards,</p>
<p class=3D"MsoNormal">Narpat</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"mso-element:para-border-div;border:none;border-top:solid #E1E=
1E1 1.0pt;padding:3.0pt 0cm 0cm 0cm">
<p class=3D"MsoNormal" style=3D"border:none;padding:0cm"><b>From: </b><a hr=
ef=3D"mailto:ticotimo@gmail.com">Tim Orling</a><br>
<b>Sent: </b>03 November 2022 04:11<br>
<b>To: </b><a href=3D"mailto:Narpat.Mali@windriver.com">Mali, Narpat</a><br=
>
<b>Cc: </b><a href=3D"mailto:alex@linutronix.de">Alexander Kanavin</a>; <a =
href=3D"mailto:Hari.GPillai@windriver.com">
G Pillai, Hari</a>; <a href=3D"mailto:luca.ceresoli@bootlin.com">Luca Ceres=
oli</a>;
<a href=3D"mailto:Archana.Polampalli@windriver.com">Polampalli, Archana</a>=
; <a href=3D"mailto:openembedded-core@lists.openembedded.org">
openembedded-core@lists.openembedded.org</a><br>
<b>Subject: </b>Re: [OE-core][kirkstone][PATCH 1/1] python3-mako: upgrade 1=
.1.6 -&gt; 1.2.0</p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"border:solid #9C6500 1.0pt;padding:2.0pt 2.0pt 2.0pt 2.0pt">
<p class=3D"MsoNormal" style=3D"background:#FCFC03"><b><span style=3D"color=
:black">CAUTION: This email comes from a non Wind River email account!</spa=
n></b><span style=3D"color:black"><br>
</span><span style=3D"font-size:10.0pt;color:black">Do not click links or o=
pen attachments unless you recognize the sender and know the content is saf=
e.</span><o:p></o:p></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div>
<p class=3D"MsoNormal">On Wed, Nov 2, 2022 at 8:21 AM Narpat Mali &lt;<a hr=
ef=3D"mailto:narpat.mali@windriver.com">narpat.mali@windriver.com</a>&gt; w=
rote:<o:p></o:p></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0c=
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-right:0cm">
<div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">Hi Tim,</p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">&nbsp;</p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">Actually, our product is based on =93kirkstone=94 branch in which =
the current version of python3-mako is 1.1.6 version.</p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">The<b> CVE-2022-40023
</b>has been fixed in python3-mako 1.2.2 version and this is the patch avai=
lable on GitHub
<a href=3D"https://urldefense.com/v3/__https:/github.com/sqlalchemy/mako/co=
mmit/925760291d6efec64fda6e9dd1fd9cfbd5be068c__;!!AjveYdw8EvQ!cp5_at5LQwcAN=
2n-5SkkRsIMXCm-NnlpfsskzuKFjA9ZTJT-P6eRqeSaouMiXJlkvgqxIrLP0s3Y1nnqKl0H$" t=
arget=3D"_blank">
https://github.com/sqlalchemy/mako/commit/925760291d6efec64fda6e9dd1fd9cfbd=
5be068c</a></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">&nbsp;</p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">In
<b>master</b> branch python3-mako is already been upgraded to 1.2.2 version=
. We want the
<b>CVE-2022-40023 </b>fix to be available on <b>kirkstone</b> branch so, I =
have sent patch request to upgrade python3-mako from 1.1.6 -&gt; 1.2.0 , 1.=
2.0 -&gt; 1.2.1 , &amp; 1.2.1 -&gt; 1.2.2 version.</p>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">It is the 1.1.6 to 1.2.0 upgrade that adds new =93ch=
anges=94. So either you make a strong case that the changes do not break AB=
I or you backport a fix for the CVEs.<o:p></o:p></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0c=
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-right:0cm">
<div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">&nbsp;</p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">Have also found that the version 1.2.2 doesn=92t include any new f=
eature as below.</p>
<div>
<h3><span style=3D"font-size:15.5pt;font-family:&quot;Tahoma&quot;,sans-ser=
if">1.2.2</span><o:p></o:p></h3>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">Released: Mon Aug 29 2022</p>
<h4><span style=3D"font-family:&quot;Tahoma&quot;,sans-serif">bug</span><o:=
p></o:p></h4>
<ul type=3D"disc">
<li class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-=
alt:auto;mso-list:l0 level1 lfo1">
<code><span style=3D"font-size:10.0pt">[bug] [lexer]</span></code><strong><=
span style=3D"font-family:&quot;Calibri&quot;,sans-serif">&nbsp;</span></st=
rong><o:p></o:p></li></ul>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:36.0pt">
Fixed issue in lexer where the regexp used to match tags would not correctl=
y interpret quoted sections individually. While this parsing issue still pr=
oduced the same expected tag structure later on, the mis-handling of quoted=
 sections was also subject to a
 regexp crash if a tag had a large number of quotes within its quoted secti=
ons. Credit to Sebastian Chnelik for locating the issue.</p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:36.0pt">
As Mako templates inherently render and directly invoke arbitrary Python co=
de from the template source, it is&nbsp;<code><span style=3D"font-size:10.0=
pt">never</span></code>&nbsp;appropriate to create templates that contain u=
ntrusted input.</p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:36.0pt">
References:&nbsp;<a href=3D"https://urldefense.com/v3/__https:/github.com/s=
qlalchemy/mako/issues/366__;!!AjveYdw8EvQ!cp5_at5LQwcAN2n-5SkkRsIMXCm-Nnlpf=
sskzuKFjA9ZTJT-P6eRqeSaouMiXJlkvgqxIrLP0s3Y1ue7GW-n$" target=3D"_blank"><sp=
an class=3D"m-1127688351980422530heading4char"><span style=3D"font-size:12.=
0pt;color:windowtext;text-decoration:none">#366</span></span></a></p>
</div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">&nbsp;</p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">&nbsp;</p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">Shall I just backport this CVE-2022-40023 fix given in 1.2.2 versi=
on on python3-mako 1.1.6 version or what shall I do in this case ?</p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">&nbsp;</p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">Best Regards,</p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">Narpat</p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">&nbsp;</p>
</div>
<p class=3D"MsoNormal"><img border=3D"0" width=3D"457" height=3D"2" style=
=3D"width:4.7569in;height:.0208in" id=3D"Horizontal_x0020_Line_x0020_1" src=
=3D"cid:image001.png@01D8F53F.00B77F00"><o:p></o:p></p>
<div id=3D"m_-1127688351980422530divRplyFwdMsg">
<p class=3D"MsoNormal"><b><span style=3D"color:black">From:</span></b><span=
 style=3D"color:black"> Tim Orling &lt;<a href=3D"mailto:ticotimo@gmail.com=
" target=3D"_blank">ticotimo@gmail.com</a>&gt;<br>
<b>Sent:</b> Tuesday, November 1, 2022 8:47:47 PM<br>
<b>To:</b> Mali, Narpat &lt;<a href=3D"mailto:Narpat.Mali@windriver.com" ta=
rget=3D"_blank">Narpat.Mali@windriver.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">
openembedded-core@lists.openembedded.org</a> &lt;<a href=3D"mailto:openembe=
dded-core@lists.openembedded.org" target=3D"_blank">openembedded-core@lists=
.openembedded.org</a>&gt;; Polampalli, Archana &lt;<a href=3D"mailto:Archan=
a.Polampalli@windriver.com" target=3D"_blank">Archana.Polampalli@windriver.=
com</a>&gt;;
 G Pillai, Hari &lt;<a href=3D"mailto:Hari.GPillai@windriver.com" target=3D=
"_blank">Hari.GPillai@windriver.com</a>&gt;; Alexander Kanavin &lt;<a href=
=3D"mailto:alex@linutronix.de" target=3D"_blank">alex@linutronix.de</a>&gt;=
; Luca Ceresoli &lt;<a href=3D"mailto:luca.ceresoli@bootlin.com" target=3D"=
_blank">luca.ceresoli@bootlin.com</a>&gt;<br>
<b>Subject:</b> Re: [OE-core][kirkstone][PATCH 1/1] python3-mako: upgrade 1=
.1.6 -&gt; 1.2.0</span>
<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div style=3D"border:solid #9C6500 1.0pt;padding:2.0pt 2.0pt 2.0pt 2.0pt">
<p style=3D"line-height:12.0pt;background:#FFEB9C"><span style=3D"font-size=
:10.0pt;color:red">[Please note: This e-mail is from an EXTERNAL e-mail add=
ress]</span></p>
</div>
</div>
</div>
<div>
<div>
<div>
<div>
<div>
<p class=3D"MsoNormal">This would break stable policy as it includes new fe=
atures:<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><a href=3D"https://urldefense.com/v3/__https:/docs.m=
akotemplates.org/en/latest/changelog.html*change-1.2.0__;Iw!!AjveYdw8EvQ!dS=
MZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZAB=
i7HzfhJ$" target=3D"_blank">https://docs.makotemplates.org/en/latest/change=
log.html#change-1.2.0</a><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<h3>1.2.0<o:p></o:p></h3>
<p class=3D"MsoNormal">Released: Thu Mar 10 2022 <o:p></o:p></p>
<h4>changed<o:p></o:p></h4>
<ul type=3D"disc">
<li style=3D"mso-list:l2 level1 lfo2"><strong><span style=3D"font-family:&q=
uot;Calibri&quot;,sans-serif">[changed] [py3k]</span></strong>
</li></ul>
<p style=3D"margin-left:36.0pt">Corrected =93universal wheel=94 directive i=
n <code><span style=3D"font-size:10.0pt">setup.cfg</span></code> so that bu=
ilding a wheel does not target Python 2.</p>
<p style=3D"margin-left:36.0pt">References: <a href=3D"https://urldefense.c=
om/v3/__https:/github.com/sqlalchemy/mako/issues/351__;!!AjveYdw8EvQ!dSMZxn=
osWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABkYd7=
YO7$" target=3D"_blank">
#351</a><o:p></o:p></p>
<ul type=3D"disc">
<li style=3D"mso-list:l2 level1 lfo2"><strong><span style=3D"font-family:&q=
uot;Calibri&quot;,sans-serif">[changed] [py3k]</span></strong>
</li></ul>
<p style=3D"margin-left:36.0pt">The <code><span style=3D"font-size:10.0pt">=
bytestring_passthrough</span></code> template argument is removed, as this =
flag only applied to Python 2.<o:p></o:p></p>
<ul type=3D"disc">
<li style=3D"mso-list:l2 level1 lfo2"><strong><span style=3D"font-family:&q=
uot;Calibri&quot;,sans-serif">[changed] [py3k]</span></strong>
</li></ul>
<p style=3D"margin-left:36.0pt">With the removal of Python 2=92s <code><spa=
n style=3D"font-size:10.0pt">cStringIO</span></code>, Mako now uses its own=
 internal
<code><span style=3D"font-size:10.0pt">FastEncodingBuffer</span></code> exc=
lusively.<o:p></o:p></p>
<ul type=3D"disc">
<li style=3D"mso-list:l2 level1 lfo2"><strong><span style=3D"font-family:&q=
uot;Calibri&quot;,sans-serif">[changed] [py3k]</span></strong>
</li></ul>
<p style=3D"margin-left:36.0pt">Removed <code><span style=3D"font-size:10.0=
pt">disable_unicode</span></code> flag, that=92s no longer used in Python 3=
.<o:p></o:p></p>
<ul type=3D"disc">
<li style=3D"mso-list:l2 level1 lfo2"><strong><span style=3D"font-family:&q=
uot;Calibri&quot;,sans-serif">[changed]</span></strong>
</li></ul>
<p style=3D"margin-left:36.0pt">Refactored test utilities into <code><span =
style=3D"font-size:10.0pt">mako.testing</span></code> module. Removed
<code><span style=3D"font-size:10.0pt">unittest.TestCase</span></code> depe=
ndency in favor of
<code><span style=3D"font-size:10.0pt">pytest</span></code>.</p>
<p style=3D"margin-left:36.0pt">References: <a href=3D"https://urldefense.c=
om/v3/__https:/github.com/sqlalchemy/mako/issues/349__;!!AjveYdw8EvQ!dSMZxn=
osWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABkPlQ=
z9_$" target=3D"_blank">
#349</a><o:p></o:p></p>
<ul type=3D"disc">
<li style=3D"mso-list:l2 level1 lfo2"><strong><span style=3D"font-family:&q=
uot;Calibri&quot;,sans-serif">[changed] [setup]</span></strong>
</li></ul>
<p style=3D"margin-left:36.0pt">Replaced the use of <code><span style=3D"fo=
nt-size:10.0pt">pkg_resources</span></code> with the
<code><span style=3D"font-size:10.0pt">importlib</span></code> library. For=
 Python &lt; 3.8 the library
<code><span style=3D"font-size:10.0pt">importlib_metadata</span></code> is =
used.<o:p></o:p></p>
<ul type=3D"disc">
<li style=3D"mso-list:l2 level1 lfo2"><strong><span style=3D"font-family:&q=
uot;Calibri&quot;,sans-serif">[changed] [py3k]</span></strong>
</li></ul>
<p style=3D"margin-left:36.0pt">Removed support for Python 2 and Python 3.6=
. Mako now requires Python &gt;=3D 3.7.</p>
<h4>bug<o:p></o:p></h4>
<ul type=3D"disc">
<li style=3D"mso-list:l1 level1 lfo3"><strong><span style=3D"font-family:&q=
uot;Calibri&quot;,sans-serif">[bug] [py3k]</span></strong>
</li></ul>
<p style=3D"margin-left:36.0pt">Mako now performs exception chaining using =
<code><span style=3D"font-size:10.0pt">raise from</span></code>, correctly =
identifying underlying exception conditions when it raises its own exceptio=
ns. Pull request courtesy Ram Rachum.</p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div>
<p class=3D"MsoNormal">On Thu, Oct 27, 2022 at 1:38 AM Narpat Mali &lt;<a h=
ref=3D"mailto:narpat.mali@windriver.com" target=3D"_blank">narpat.mali@wind=
river.com</a>&gt; wrote:<o:p></o:p></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0c=
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-right:0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">License-Update: copyr=
ight years<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" =
target=3D"_blank">alex@linutronix.de</a>&gt;<br>
Signed-off-by: Luca Ceresoli &lt;<a href=3D"mailto:luca.ceresoli@bootlin.co=
m" target=3D"_blank">luca.ceresoli@bootlin.com</a>&gt;<br>
<br>
Upstream master commit:<br>
<a href=3D"https://urldefense.com/v3/__https:/git.openembedded.org/openembe=
dded-core/commit/?id=3Df273900e846b8ac416c9d579db32a08c2f34141e__;!!AjveYdw=
8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq=
79SSZABiU1UtWG$" target=3D"_blank">https://git.openembedded.org/openembedde=
d-core/commit/?id=3Df273900e846b8ac416c9d579db32a08c2f34141e</a><br>
<br>
Signed-off-by: Narpat Mali &lt;<a href=3D"mailto:narpat.mali@windriver.com"=
 target=3D"_blank">narpat.mali@windriver.com</a>&gt;<br>
---<br>
&nbsp;.../python/{<a href=3D"https://urldefense.com/v3/__http:/python3-mako=
_1.1.6.bb__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa=
09o0b7fl0FewZr1UlMEFq79SSZABqRMx25E$" target=3D"_blank">python3-mako_1.1.6.=
bb</a> =3D&gt;
<a href=3D"https://urldefense.com/v3/__http:/python3-mako_1.2.0.bb__;!!Ajve=
Ydw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlM=
EFq79SSZABtTOsCS_$" target=3D"_blank">
python3-mako_1.2.0.bb</a>} | 6 ++++--<br>
&nbsp;1 file changed, 4 insertions(+), 2 deletions(-)<br>
&nbsp;rename meta/recipes-devtools/python/{<a href=3D"https://urldefense.co=
m/v3/__http:/python3-mako_1.1.6.bb__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eK=
yaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABqRMx25E$" target=3D"_b=
lank">python3-mako_1.1.6.bb</a> =3D&gt;
<a href=3D"https://urldefense.com/v3/__http:/python3-mako_1.2.0.bb__;!!Ajve=
Ydw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlM=
EFq79SSZABtTOsCS_$" target=3D"_blank">
python3-mako_1.2.0.bb</a>} (59%)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"https://urldefense.com=
/v3/__http:/python3-mako_1.1.6.bb__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKy=
aZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABqRMx25E$" target=3D"_bl=
ank">python3-mako_1.1.6.bb</a> b/meta/recipes-devtools/python/<a href=3D"ht=
tps://urldefense.com/v3/__http:/python3-mako_1.2.0.bb__;!!AjveYdw8EvQ!dSMZx=
nosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABtTO=
sCS_$" target=3D"_blank">python3-mako_1.2.0.bb</a><br>
similarity index 59%<br>
rename from meta/recipes-devtools/python/<a href=3D"https://urldefense.com/=
v3/__http:/python3-mako_1.1.6.bb__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKya=
Z5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABqRMx25E$" target=3D"_bla=
nk">python3-mako_1.1.6.bb</a><br>
rename to meta/recipes-devtools/python/<a href=3D"https://urldefense.com/v3=
/__http:/python3-mako_1.2.0.bb__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5=
bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABtTOsCS_$" target=3D"_blank=
">python3-mako_1.2.0.bb</a><br>
index 71e5d96ba1..11e5f326bd 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"https://urldefense.com/v3/__h=
ttp:/python3-mako_1.1.6.bb__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKE=
rqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABqRMx25E$" target=3D"_blank">py=
thon3-mako_1.1.6.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"https://urldefense.com/v3/__h=
ttp:/python3-mako_1.2.0.bb__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKE=
rqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABtTOsCS_$" target=3D"_blank">py=
thon3-mako_1.2.0.bb</a><br>
@@ -2,16 +2,18 @@ SUMMARY =3D &quot;Templating library for Python&quot;<br>
&nbsp;HOMEPAGE =3D &quot;<a href=3D"https://urldefense.com/v3/__http:/www.m=
akotemplates.org/__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODy=
Q_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABgBvHIC8$" target=3D"_blank">http://www.=
makotemplates.org/</a>&quot;<br>
&nbsp;SECTION =3D &quot;devel/python&quot;<br>
&nbsp;LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D943eb67718222db21d44a4ef18=
36675f&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Db32291f107a8f1ea94c4a41e00=
a6a18d&quot;<br>
<br>
&nbsp;PYPI_PACKAGE =3D &quot;Mako&quot;<br>
<br>
&nbsp;inherit pypi python_setuptools_build_meta<br>
<br>
-SRC_URI[sha256sum] =3D &quot;4e9e345a41924a954251b95b4b28e14a301145b544901=
332e658907a7464b6b2&quot;<br>
+SRC_URI[sha256sum] =3D &quot;9a7c7e922b87db3686210cf49d5d767033a41d4010b28=
4e747682c92bddd8b39&quot;<br>
<br>
&nbsp;RDEPENDS:${PN} =3D &quot;${PYTHON_PN}-html \<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ${PYTHON_PN=
}-markupsafe \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;${PYTH=
ON_PN}-netclient \<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ${PYTHON_PN=
}-pygments \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;${PYTH=
ON_PN}-threading \<br>
&nbsp;&quot;<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
<br>
<o:p></o:p></p>
</blockquote>
</div>
</div>
</div>
</div>
</blockquote>
</div>
</div>
</div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:0cm;margin-right:0cm;mar=
gin-bottom:12.0pt;margin-left:4.8pt">
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#172593): <a href=3D"https://urldefense.com/v3/__https:/=
lists.openembedded.org/g/openembedded-core/message/172593__;!!AjveYdw8EvQ!c=
p5_at5LQwcAN2n-5SkkRsIMXCm-NnlpfsskzuKFjA9ZTJT-P6eRqeSaouMiXJlkvgqxIrLP0s3Y=
1lXqeEXU$" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/message/172593</a><br>
Mute This Topic: <a href=3D"https://urldefense.com/v3/__https:/lists.openem=
bedded.org/mt/94600007/924729__;!!AjveYdw8EvQ!cp5_at5LQwcAN2n-5SkkRsIMXCm-N=
nlpfsskzuKFjA9ZTJT-P6eRqeSaouMiXJlkvgqxIrLP0s3Y1lInCKnh$" target=3D"_blank"=
>
https://lists.openembedded.org/mt/94600007/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">
openembedded-core+owner@lists.openembedded.org</a><br>
Unsubscribe: <a href=3D"https://urldefense.com/v3/__https:/lists.openembedd=
ed.org/g/openembedded-core/unsub__;!!AjveYdw8EvQ!cp5_at5LQwcAN2n-5SkkRsIMXC=
m-NnlpfsskzuKFjA9ZTJT-P6eRqeSaouMiXJlkvgqxIrLP0s3Y1vrEiIBt$" target=3D"_bla=
nk">
https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"ma=
ilto:ticotimo@gmail.com" target=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DM4PR11MB555002770BA700300F9FBB96E4019DM4PR11MB5550namp_--

--_004_DM4PR11MB555002770BA700300F9FBB96E4019DM4PR11MB5550namp_
Content-Type: image/png; name="E0AA1A1C614040FEA636C5DCC686D665.png"
Content-Description: E0AA1A1C614040FEA636C5DCC686D665.png
Content-Disposition: inline; filename="E0AA1A1C614040FEA636C5DCC686D665.png";
	size=160; creation-date="Thu, 10 Nov 2022 14:30:21 GMT";
	modification-date="Thu, 10 Nov 2022 14:30:21 GMT"
Content-ID: <image001.png@01D8F53F.00B77F00>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAq0AAAADCAYAAAC51TYcAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAA1SURBVGhD7dYxDQAwDASx8CdVBEUQMKnULQx+
8EnmcHVuDwAAJPvTWpIkSVJga1oBACBXzwNm3TsdoNS1HgAAAABJRU5ErkJggg==

--_004_DM4PR11MB555002770BA700300F9FBB96E4019DM4PR11MB5550namp_--

