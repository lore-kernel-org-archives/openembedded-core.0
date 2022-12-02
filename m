Return-Path: <shin.matsunaga@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A0BC4332F
	for <webhook@archiver.kernel.org>; Fri,  2 Dec 2022 09:55:50 +0000 (UTC)
Received: from esa13.fujitsucc.c3s2.iphmx.com (esa13.fujitsucc.c3s2.iphmx.com [68.232.156.96])
 by mx.groups.io with SMTP id smtpd.web10.71342.1669974942953775916
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Dec 2022 01:55:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=AFPalmzY;
 spf=pass (domain: fujitsu.com, ip: 68.232.156.96, mailfrom: shin.matsunaga@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1669974943; x=1701510943;
  h=from:to:subject:date:message-id:mime-version;
  bh=c48jpv3AyUYaZuWt0XeEqpCFEYZlYbfrpK66JFiZTKo=;
  b=AFPalmzY1OJRBRdAnN+fHTbz0t3SISAVw2OtgRoDBgaUQ+7cbe2ay4/w
   sfSlhlv3J7Ty/2PLRgH9pVgd1x0z0SdutPboZ33BfmzKHWLIWo/DCH56q
   Lqop9yMhTGjNEQ47bPbG2NW+W6ppZ9rvwZz3hY0HegOpvKPcZjojTStoW
   Bu0Sh/YMnwT6Q6XywxPbgv01h3+v5BC4i8UCiTo1JpF/CtOkyQN0C/E68
   f3a97K9VszSH5Qldu1sPjdWh1F8pA+WgO9qlfdxmgZFC8ulZtQOWAmX/T
   GA3iBjh50klkCp2J1HjuuvUq1ZH/czRaiQjJ4jEAqav+vl946ZyOVwmwb
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="71227888"
X-IronPort-AV: E=Sophos;i="5.96,212,1665414000"; 
   d="scan'208,217";a="71227888"
Received: from mail-os0jpn01lp2105.outbound.protection.outlook.com (HELO JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.105])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2022 18:55:40 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NkDMmPcQTuKHkwELrGyJhstr4RDkk07JAIDTG/Iqn0z87H9PzqN2BZtkhv1B+Me4ayLCkqf10I8rdCWsMLjlBdBCNSOrJOHNfrFoyudY6EA9204NfmV6aD2t5iOtmD++cqK61RinkDjanCuTvD2N1BYE+OrKllrYl8tM+DZLxRcWCx2pOijh9vQdpMDcXfs44LdPyzD7iMGxsHg1WECRCatikOFIqbzSHJqunMq/kDF3+MRBOOTTEeTMw3CHuWbODcVHh6TXtowwtbCG+JlTQ1Bg7zWF96uzfwVaaKkhUpJRYIjdaT08uQt30gBIXOaUihLP/w5dkEvRPuuT5ik5cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0fynnk/MBidzsLAb9vLT/Dp9uNwfVelzaUvT6AmrVoI=;
 b=BPFLC2r+ALQg2A7c+1a8HhR6W4uwGh1zMF2hXBVMNdGdjTYYtEEWJu3IXobpVQ6cMuMZR76YETvHP7eLfjKTBU7Qzb1dwzIQ2AFeQFT/l3mhyRoalUDwR12Ufv0mCsVPrzdRc+/lzgn7PvBvrwl6fttC3g2Ni/YZv64zHOJSKIbqV4Rr3lBh2i9sdFrx/qWPxuUbegfcsMiSPPT6/7yu2YuiwCa6AXDHwioAEmlid+S94i6BLk/S+Jl6y7bjqAd9G/8Zc3vCCQR6YVbkDLWsaTWjGlWCpHwhpeXrafdHFB7hDxrX/0Fx3+QQxgrpyWHKkkVFNDHHEBQky89rr9Mfng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TY2PR01MB3289.jpnprd01.prod.outlook.com (2603:1096:404:75::15)
 by OS3PR01MB9270.jpnprd01.prod.outlook.com (2603:1096:604:1ce::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Fri, 2 Dec
 2022 09:55:37 +0000
Received: from TY2PR01MB3289.jpnprd01.prod.outlook.com
 ([fe80::bb24:562f:6259:c74]) by TY2PR01MB3289.jpnprd01.prod.outlook.com
 ([fe80::bb24:562f:6259:c74%7]) with mapi id 15.20.5857.023; Fri, 2 Dec 2022
 09:55:37 +0000
From: "Shinji Matsunaga (Fujitsu)" <shin.matsunaga@fujitsu.com>
To: "'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
Subject: About the judgment result of the CVE check tool
Thread-Topic: About the judgment result of the CVE check tool
Thread-Index: AdkGNAcaw2dpxGWXQ8+TyGNamp7HZQ==
Date: Fri, 2 Dec 2022 09:55:37 +0000
Message-ID: 
 <TY2PR01MB328952DEF46146B2AF44F25292179@TY2PR01MB3289.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=true;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2022-12-02T09:46:27Z;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED?;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ActionId=d6b06deb-3c7c-4a8e-bbc2-b85503d2c381;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PR01MB3289:EE_|OS3PR01MB9270:EE_
x-ms-office365-filtering-correlation-id: 4ede619c-0339-4abd-4d1c-08dad44b5cf3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 SXrsGO2Rz6lD6nzPyPVdeKd3vDzxVQCk6tH57ktD/fhduI3zCUUHc7Z/29+XnQZr/0Z7lBa60GIdRl0UWSJjv/Eg92Tg2FKcVgp6tligNBApd9cacU/9hCIGV/kBeveaGRsFbdglEa2TN8Wqwi1vsv/eM4HPpd4QMv4zu+TO2WEo9NDRy5NG6rTKa5wx1QWeuXB26TTUoNR5eI5KkBXsbK5yurHpg1KpB3fbol73H53cZ2ULcrIqgZcT338yOM4L/ASUZYwLrfk1x37TvHC+Dibmsrf0ZFlf9ZWIonkaWOcL7myj07kgDjTkt2fEGwjhMsjXwxNGOiWQJdpXW1fLy+mNS7DLEIXGrsIzROAhMYf7MZsAgq2s3KFKCptpAJ/iHTG9Exy7Gr3rvDSimDtNhDb9lhKOBInAIJSqZdTusCwR6uEjOL12DCQeFS7/NHehuSWRtzfme6Ib7ziz6bw8H/Zk8EG0mXRm+AZqNkeXc/yVGKyyrBbZUUNj3zVZnT/JogaLbknUPamVMOL/nAW0bg+JrXP887y/clLXv0Z8d4sMq5A940yKIIDvHfjeaCI8/ejuMHHOJ2VCyaJvh5fGh5ifkkibRm5P0khg/L1LrFfH4nk5NyYul6mDiHb3h8TmUeD6cHeZUyzvCKYxPah3lXkgXJoEToFEeV8TEt+2wnhx00tJI1YRVi/PHLllRbKAV2FbctVvehjh8JtCo0A9NNNkYt7juSzxZ732nfP/b+X5ZJNypE1DpMTKAtWdrxEhwYfiSE00Pz0DHajgwmaUbg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3289.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(366004)(396003)(39860400002)(346002)(451199015)(1590799012)(85182001)(966005)(71200400001)(6506007)(478600001)(122000001)(38100700002)(66946007)(7696005)(9686003)(66476007)(64756008)(166002)(33656002)(8676002)(26005)(76116006)(66446008)(66556008)(82960400001)(316002)(6916009)(86362001)(52536014)(55016003)(38070700005)(4744005)(8936002)(5660300002)(41300700001)(186003)(83380400001)(2906002)(1580799009)(491001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-2022-jp?B?eDJlWDA5aTYrUlgwdmw2UGwrS09lcnhncGp0d0JsdWltaXpJTW1PVUZt?=
 =?iso-2022-jp?B?S3dlY3ByQ09lK3VneDMxQzNzZ2tRTnFJRUhhNVN3YXZ1NStvczJUbW9t?=
 =?iso-2022-jp?B?cXpVNkNja0NwdFh5UGZiMHBWN0wzbzBQbFI0YzAxZU5IbE1qTThaa1ZC?=
 =?iso-2022-jp?B?RGlWR09GSmVlOFlmV1I5MEVVVytOZGpzQ1F6UFZaYytxSXpUVGVUOWRX?=
 =?iso-2022-jp?B?R2tyM2NnMkVZL0I4aVpuS3JWcjUvNDN6bkdId2tBb3djRzRsYXBva2RZ?=
 =?iso-2022-jp?B?NFV0VWl5MTF3dkxFNFk3cHN4K3BxVEtVTkRsbGZpc3dIWkRVY2xnb0Rv?=
 =?iso-2022-jp?B?Q2hodGxiQTJzVmhibDVMODIwcU12WTYxcDFaZjBmaG5FTHJ4MnJDWFhG?=
 =?iso-2022-jp?B?OVF6UmNhNkI2cE9QbXlDd1dITGlIVnZGZmF4dHYydDErdi9YQVkxdXVI?=
 =?iso-2022-jp?B?WjF6b2MrUzFYNCtKU1V3bWtmWlpPOU5mR0V4Qm52V2RlaERJL042ZFQ4?=
 =?iso-2022-jp?B?eUErTDVFcDBGdW4xUU1YaEhvSWxpcnlDL0pDTzFITnJ5NUpJRGRoRVAw?=
 =?iso-2022-jp?B?dlZYdUtxOVVPQ09kNW9UbGIwMjAvUXI4UjFTS1lkc3l3WEJodEx2TGxS?=
 =?iso-2022-jp?B?THpuUTRKbmp0ajlLZHdRL1ZrYUpTSzIrOXZzUS9UL25TQm9MOGJVcHpn?=
 =?iso-2022-jp?B?cERnaUdrbTJRbGRSYW84OTJrbm1naXlzY0xIaXNYejNNUTdERk94aEJK?=
 =?iso-2022-jp?B?bS91QWRqR0s1bjJPNlpmem90YzdBYWZJaWxpWkxwNksybUVibFVoTU1p?=
 =?iso-2022-jp?B?Z0RDNnhqb0RlK1BBMnJWRFppeGtrb0loMWNON2dndTJOZ1dZcjBvMUQ1?=
 =?iso-2022-jp?B?TkxPU25XVVppcVpwSEl2Vk9ERnZ6Q1NwOHR5R3hmWHZWNHRNSHJyc0do?=
 =?iso-2022-jp?B?bHB4Q0w1VmJxVU45VTI3MjR2by9PWTh0dnVFeHNqQ3NsTmdlR1o2ZVlw?=
 =?iso-2022-jp?B?QWRnM01ZM2ozdXhIMlpVVE51SUcxdDg3bGFFYVowNnlxN0E3ang3MENT?=
 =?iso-2022-jp?B?cFU1aDM3OE1yb0RXVzhoZEpZOTBxU0dqb3ZNV2ptUDVONzhETnI2a25V?=
 =?iso-2022-jp?B?ZzFwZm1YSjREWG10Qnlhckg1RTkzRlEwNkpxdWQwRzcwUnVtbkdQSzBI?=
 =?iso-2022-jp?B?ejAwdFJsTzBsWFIwcndmR09vb1d6YXBudGhqWFZzS2ZCVjFPZmpBNUJu?=
 =?iso-2022-jp?B?Q1pSRUFsamdZWTkvYlRjclQ3Z1VGNEZwZWhhNWZPaGRjNklNTlZjNzBv?=
 =?iso-2022-jp?B?MGhjSlE4M2JRMG1XYWlwNjZuaGZIMXBtMEx3eW5KeURycUIwSXpYTXFZ?=
 =?iso-2022-jp?B?c0hybTdjMXBRSjZHbXNLdGIzMmpNcjRJMlpjemxTMEZsc1MwV21GcXVq?=
 =?iso-2022-jp?B?R0tlNnhncUUvY0ExemIwUUw2Tk1JVzZUbHR6ZnovU3hVY0hzOUpYWFZ1?=
 =?iso-2022-jp?B?dkg4QmJhSHQ3dm04TWhqMFVvK1kxblJZM3gycGxQcGx0em9HelA4WGJS?=
 =?iso-2022-jp?B?cEYzWHNsMDFRNkE1bjF3VXMyc2lmNjhNVEZsZEFCRkoxdGwyamNNd0F2?=
 =?iso-2022-jp?B?N3BWNmpLYzVLY1FjZFdmOW5yRXVvYWNLOXFOUXZmRUZxYXlpVk5UY3hM?=
 =?iso-2022-jp?B?Q0dSdTNMY1YrT0k4cHFGTTduaHNRSC85ekRBWDg3d0NQbWtrVFkzeC9j?=
 =?iso-2022-jp?B?VzAzeWRKbmg1MElHcHBiNkFYY1VSRDJ1U0daMkVkYXF5cE9BUXY4Mm9h?=
 =?iso-2022-jp?B?Vzl0ME51a1ZyMmVCa3ZoLzFVNTNYQ0hkMnJXWGVESGlkM2pxZzlSZ0tY?=
 =?iso-2022-jp?B?UmxPYjA0QnE3RHFwVm92Ulp5ZVNMMm9BWmtSOGs4dGNSK1dDWjBVYjVp?=
 =?iso-2022-jp?B?TCs1VHpnRWVqWE5lNHdweHNPdldZWEoyUUlydTM4L2FyWXFwbkl4SHI1?=
 =?iso-2022-jp?B?TlIybjFQenp4ZGE0SGhwVkVleGFVY0loUUdVMU5uT0d4blRRTDRQQ2s5?=
 =?iso-2022-jp?B?S2sveC9jMDE4VDhLdGdDa3F6TG16ZHBaQzlpNVZjSGdPbi91bUpUZnk1?=
 =?iso-2022-jp?B?U2xNcm1OaGx0OWFyMlF0RThLL05CV09oK0Fkc3c4dnVQbEtFTU54MTZr?=
 =?iso-2022-jp?B?QjdaTEJuM1ZEem1DRFJaYWpYS1NWUmxpc0pDKzFyZnpZK0N4Q1hGd1Ez?=
 =?iso-2022-jp?B?OWQ2bDViZXphbzQrYzh1QjRqYzNxZTRWRldRREFkR0NsYjF6Yi96SllZ?=
 =?iso-2022-jp?B?NDVRN1Mwak54N3VZTkxZYTNkS1JJOVZENnc9PQ==?=
Content-Type: multipart/alternative;
	boundary="_000_TY2PR01MB328952DEF46146B2AF44F25292179TY2PR01MB3289jpnp_"
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	26FDtXlwH9hRO9I0cNPhqA/IWEGBqI2kjvrxT0y0hWCVJ0P62ObPNPjJlDkKS9fT0u9o/RFFNruIE2QkPiCQ12oVIZtRpmjFLzPXtz6YqR9jJNAcL+DKSxqxnuj1UD7/pXG+baAV17dzRry1vicIp882B3aI1L+vG4cP6UlXivPGeuCFIyTqx5R5xi5tFjcCzoLhoTLN/I7893qdHYy6SOhaGzQwS7BUwjB3qb0EDisyB6o1wLc+9n5dueykTIYGWzWcIIRYkBBV85kBixyzjy8I1NQQI/oTYIHjvbZ48GqscQ2cSu/pqHmm6gE6qlL/V1pucZiRgwP83e+mO5dCrdQK/CWJXkEjJ6WhI2RoDPAvKhgg8Qyj59bg1Ksha7ajLMs/KSWY5GfkNAVGjjZhSRSQsCEVcdcs2XSMhQiu6T0t13DJIVd6btco+l4gpJTaskGopzkGiKXzXeqr+OFtQmAFYhR96aOiuyh5YZn6kHKTJHIiapSEn734qOZmgF0C1Ar44jS9inyJHVpoqMvJD1Y6rR8aAm8iohXAX7YQfWEctbRBOkthqTLUqkSWxelJBSCO3GgQpOzpCE4LJ61hkVWceODSyXSmBKsFJc6+ghKVOAgPsi8HHrG40IgDbK31r1CENqIiPh6wj6gvdeuFOSEKlSPBQ7vXFXocmFscNB7czwrTRbfy+49g9MgjvthagdsmG4L2pJ6layEUIPSi1Xxyz7Ydod13MIE5gTYYoTfCIGqN3IN2KGyuwNwENnEMqBeRI7gxYDeWtPgRTdWchg3P2w/p8xymbUjowFhVfMg=
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3289.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ede619c-0339-4abd-4d1c-08dad44b5cf3
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2022 09:55:37.2962
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ejm3QM8QY/gdIie2tjA0C7r0mgIXGWaoYKhmK0RS33ue8H3PE1io0KfUigb6Paykgzn8gJu59NT9Rz5omwHb4P7h3UdYwhDIOuYyZVNaTkI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9270
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Dec 2022 09:55:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174231

--_000_TY2PR01MB328952DEF46146B2AF44F25292179TY2PR01MB3289jpnp_
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Hi, I'm Shinji.

I have a question about the judgment result of the CVE check tool.

If the version of the package "pv" cannot be compared to the version retrie=
ved from NVD("version_start" or "version_end"),
there is a vulnerability for which the judgment result is "Patched".(e.g. C=
VE-2020-15117)

If you can't compare versions, I think it should be judged as "Unpatched"
Why does the CVE check tool judge "Patched"?

Examples of judgment results:

=1B$B!!=1B(BLAYER: meta-qti-base-prop
=1B$B!!=1B(BPACKAGE NAME: synergy
=1B$B!!=1B(BPACKAGE VERSION: git
=1B$B!!=1B(BCVE: CVE-2020-15117
=1B$B!!=1B(BCVE STATUS: Patched

Examples of logs:

"WARNING: synergy: Failed to compare git < 1.12.0 for CVE-2020-15117"

log output location:

=1B$B!!=1B(Bhttps://github.com/openembedded/openembedded-core/blob/master/m=
eta/classes/cve-check.bbclass#L346


=1B$BIY;NDL=1B(B(=1B$B3t=1B(B) ISS=1B$B;vK\=1B(B
Linux=1B$B%=3D%U%H%&%'%";v6HIt=1B(B =1B$B%"%W%i%$%"%s%95;=3DQIt=1B(B
=1B$B>>1J=1B(B =1B$B?5;J=1B(B / Matsunaga Shinji
e-mail=1B$B!'=1B(Bshin.matsunaga@fujitsu.com<mailto:shin.matsunaga@fujitsu.=
com>


--_000_TY2PR01MB328952DEF46146B2AF44F25292179TY2PR01MB3289jpnp_
Content-Type: text/html; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-2022-=
jp">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:=1B$B^b%4%7%C%/=1B(B;
	panose-1:2 11 4 0 0 0 0 0 0 0;}
@font-face
	{font-family:"=1B$B#M#S=1B(B =1B$B#P%4%7%C%/=1B(B";
	panose-1:2 11 6 0 7 2 5 8 2 4;}
@font-face
	{font-family:"\@=1B$B#M#S=1B(B =1B$B#P%4%7%C%/=1B(B";}
@font-face
	{font-family:"\@=1B$B^b%4%7%C%/=1B(B";
	panose-1:2 11 4 0 0 0 0 0 0 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0mm;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:=1B$B^b%4%7%C%/=1B(B;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.17
	{mso-style-type:personal-compose;
	font-family:=1B$B^b%4%7%C%/=1B(B;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:=1B$B^b%4%7%C%/=1B(B;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:99.25pt 30.0mm 30.0mm 30.0mm;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026">
<v:textbox inset=3D"5.85pt,.7pt,5.85pt,.7pt" />
</o:shapedefaults></xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"JA" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word;text-justify-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">Hi, =
I'm Shinji.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">I ha=
ve a question about the judgment result of the CVE check tool.<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">If t=
he version of the package &quot;pv&quot; cannot be compared to the version =
retrieved from NVD(&quot;version_start&quot; or &quot;version_end&quot;),<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">ther=
e is a vulnerability for which the judgment result is &quot;Patched&quot;.(=
e.g. CVE-2020-15117)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">If y=
ou can't compare versions, I think it should be judged as &quot;Unpatched&q=
uot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">Why =
does the CVE check tool judge &quot;Patched&quot;?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">Exam=
ples of judgment results:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">=1B$B!!=1B(B<span l=
ang=3D"EN-US">LAYER: meta-qti-base-prop<o:p></o:p></span></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">=1B$B!!=1B(B<span l=
ang=3D"EN-US">PACKAGE NAME: synergy<o:p></o:p></span></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">=1B$B!!=1B(B<span l=
ang=3D"EN-US">PACKAGE VERSION: git<o:p></o:p></span></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">=1B$B!!=1B(B<span l=
ang=3D"EN-US">CVE: CVE-2020-15117
<o:p></o:p></span></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">=1B$B!!=1B(B<span l=
ang=3D"EN-US">CVE STATUS: Patched<o:p></o:p></span></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">Exam=
ples of logs:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">&quo=
t;WARNING: synergy: Failed to compare git &lt; 1.12.0 for CVE-2020-15117&qu=
ot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">log =
output location:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">=1B$B!!=1B(B<span l=
ang=3D"EN-US"><a href=3D"https://github.com/openembedded/openembedded-core/=
blob/master/meta/classes/cve-check.bbclass#L346">https://github.com/openemb=
edded/openembedded-core/blob/master/meta/classes/cve-check.bbclass#L346</a>=
<o:p></o:p></span></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span style=
=3D"font-size:11.0pt">=1B$BIY;NDL=1B(B<span lang=3D"EN-US">(</span>=1B$B3t=
=1B(B<span lang=3D"EN-US">) ISS</span>=1B$B;vK\=1B(B<span lang=3D"EN-US"><o=
:p></o:p></span></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"font-size:11.0pt">Linux</span><span style=3D"font-size:=
11.0pt">=1B$B%=3D%U%H%&%'%";v6HIt=1B(B =1B$B%"%W%i%$%"%s%95;=3DQIt=1B(B<spa=
n lang=3D"EN-US"><o:p></o:p></span></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span style=
=3D"font-size:11.0pt">=1B$B>>1J=1B(B =1B$B?5;J=1B(B<span lang=3D"EN-US"> / =
Matsunaga Shinji<o:p></o:p></span></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">e-mail</span>=1B$B!'=1B(B<span =
lang=3D"EN-US" style=3D"font-size:11.0pt"><a href=3D"mailto:shin.matsunaga@=
fujitsu.com"><span style=3D"color:#0563C1">shin.matsunaga@fujitsu.com</span=
></a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_TY2PR01MB328952DEF46146B2AF44F25292179TY2PR01MB3289jpnp_--

