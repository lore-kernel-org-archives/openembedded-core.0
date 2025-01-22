Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BBE2C02182
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 08:12:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.38360.1737533547531603488
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jan 2025 00:12:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=311712baff=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M5kfRW011852
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 00:12:27 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44aqjg89pu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 00:12:26 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50M8CQ6B029847;
	Wed, 22 Jan 2025 00:12:26 -0800
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44aqjg89pt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 00:12:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AqPwePMWhkxYJCJlzf6IhQuwFC9JiRY1e7egjLKHbLE04uZAN6tQO9yAqOLmjrODzLfI/m5WyvLfv3szJrjGGU+c4BOopwdKpf4MoVKslKdNRusXBoh3G+4Ok43Sl7SfY4tnntv/BWBIb2by6ufgv8UgSwACqZ6+g9xiJaTKiBwF/19jhKks3dc4SoYYkSwM7yqHs+tZyB0PcnN+unUebGbIMW4qUYfDZvFVK8m11PfY63RIrVvIP3lDs12f1orUJcOTzeStM/FDwcm6XPbrC2Mc5M5d0VOevQmzJYMYn1IVnZR+AAGIs/tPjq/lyqP6ppinbnb8vjfD0YJRfMwV+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qDOK3AjAnKKW9PmQmUPfLuc5TEB7Pf99cnQIBCcAvso=;
 b=nnrO42qMy1XufnV890NfrbOmTj3YJdUjrDXDaXAsmcwqYZlyWhqQfOEksZY6B5zHMPQSxx9125XdD4X1zlScIA0rjzQZWS4pR0q4EYQbimqlTAeo0GGNns/J3s5WsOazXFlv06R5bP7lY/sTgCuEDwiHcuVHJyCXl5bNH0eT4zmpVJg5rtKnnZwpcw/v90hGx4NF9Xk8yqjaCTbDTV3EVDXh2J3XrBpB/gDJk5K/HKUUHpHWvMiUyzOsSlnMnwHzNTrBmzeTpSxch8b6zaGzg9A6bliRrIhhabDVX8AD7wtd22C6bVHUParHe0YiOTBudaQ6Gdvuxp9ltTT9leWkQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by LV8PR11MB8463.namprd11.prod.outlook.com (2603:10b6:408:1ed::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Wed, 22 Jan
 2025 08:12:23 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%4]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 08:12:23 +0000
From: "Sadineni, Harish" <Harish.Sadineni@windriver.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>,
        "Kokkonda, Sundeep"
	<Sundeep.Kokkonda@windriver.com>,
        "Moodalappa, Shivaprasad"
	<Shivaprasad.Moodalappa@windriver.com>
Subject: Re: [OE-core] [PATCH V2 2/2] oeqa/sdk/context: fix for gtk3 test
 failure during do_testsdk
Thread-Topic: [OE-core] [PATCH V2 2/2] oeqa/sdk/context: fix for gtk3 test
 failure during do_testsdk
Thread-Index: AQHbaB1fla4YEHCzQEaOl4AeTvXpIrMhZG+AgAEUaZk=
Date: Wed, 22 Jan 2025 08:12:22 +0000
Message-ID: 
 <PH0PR11MB56580DED4998E0DAC2FAC9E2EFE12@PH0PR11MB5658.namprd11.prod.outlook.com>
References: <20250116134833.1838212-1-Harish.Sadineni@windriver.com>
 <20250116134833.1838212-2-Harish.Sadineni@windriver.com>
 <492E6C7B-D6ED-4D05-8FE6-AC9029521655@arm.com>
In-Reply-To: <492E6C7B-D6ED-4D05-8FE6-AC9029521655@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5658:EE_|LV8PR11MB8463:EE_
x-ms-office365-filtering-correlation-id: b54a80a0-50a1-4a86-28d1-08dd3abc7f7b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|7053199007|38070700018|8096899003;
x-microsoft-antispam-message-info: 
 =?Windows-1252?Q?UIjyDGA9ULrepMup9PmSycj9BChxZNeQX7bjFKkFWPW16FJvxeCUqXHr?=
 =?Windows-1252?Q?pVs22cUJeoEH9JEg/KjgJJU2+1w6QGYjeqgUIalv27y2ap/hIs9XMuuz?=
 =?Windows-1252?Q?FLEKAkprqF4TR6skH+qF3e2drplKuwgZuSlOOa46BRZoIEriWQwKw5y1?=
 =?Windows-1252?Q?K0moI3Y6WmJDqqP0IHR3NK1E0J3apHV+01Bb2vpxP5tZC9RKznoKG1RT?=
 =?Windows-1252?Q?IhFbE814zH3Mn/HEkBGdUxZ/Pjeptd1PGN24wmfIa/hZJZ3HcjgeN6N7?=
 =?Windows-1252?Q?yp5HU7JfXrtwvhiaAjvB8kw6ikPnqR7zN39S3txioZ0w5R9OowHLbl0W?=
 =?Windows-1252?Q?nWqrquF8aPtgxDXS6O9jtEP8mphSmxPBrbnNpv7jQLXzDC2GRcrpt/aK?=
 =?Windows-1252?Q?DnKEICDdLaMtqGRKgrG0fUBiD7Ol9z+197Wc4d8wriRC+71L/sYmnURr?=
 =?Windows-1252?Q?l+86zK9ZznsrJl+hRO9IQjm6VG9ootEc0CYUb4el0nouq4vYdRjlwt3y?=
 =?Windows-1252?Q?psNQ2PfO0HwnnK6Veh8uKgHy2RQPvG0SF7df2PAvLSOeUG8lC7zovB+J?=
 =?Windows-1252?Q?HRwiGDETSRUzzaldQX37ejB/TBuv/vl84WcXyhaWfVTNopUZjwWjx9ks?=
 =?Windows-1252?Q?iJkHKzyC6iUwrhE2bNFxJz7D6Qg9/yf1ro/9xglWDWEfKUhklweoX6Dd?=
 =?Windows-1252?Q?lR3zu07XhHJHVxrutboGg9/JPbXJwaO4Ot0W1EA9lsB6M0tKRd46B8Le?=
 =?Windows-1252?Q?xs5IhnoCjiBlF20BFExg7LO1c+mv9f5qd0hJSs1AoANJY5WrmUJ+AC1H?=
 =?Windows-1252?Q?z8o0oUULddf+OeWnim9Fg87cVfETaE+L1j2grqINK93YtbIqE+gtzJP+?=
 =?Windows-1252?Q?dvaIxITMQQp8k8GQuJtpdL2f4Ic/GkV8V/pOi86cisv90HMrXmgBz4/+?=
 =?Windows-1252?Q?sPIvbJsG5W+7kFU1pV5cpifHHwN7pFk8WAe2L7LAx6tTkUls0zJ5JM+L?=
 =?Windows-1252?Q?vAk2jCJPjPRlmFIqSRaTurAcLCtmvDhswpgGC+oQsG4prWrqiN1sPBPG?=
 =?Windows-1252?Q?cvVO/xv1nss8DyWLBm5rhasXNpGMVX9sVTQkFQmSkw4n2Bd/UGd7+Fce?=
 =?Windows-1252?Q?vMy2LcTd4TwaJzEHzofHXXB6y32+gfRY/wg/XkczBLaOi818xDJzPb6S?=
 =?Windows-1252?Q?XrzS77lsPbLK1y3aSlJQ3QP7cxOmM9fntl2NnU+pRbVB1i/MOnWJaH5T?=
 =?Windows-1252?Q?aPiiXkjfLgBb4zZm85HdPcC1vx2kpVOz08d3eyM8Z3LmRL6WtD7mHjXh?=
 =?Windows-1252?Q?xY5iSxavrTV2yeR9U5NVYUpOnhFRvp94tBhw/JX+jHbST7QMWZchhPsQ?=
 =?Windows-1252?Q?NVmDg2wCpXMI3yf+61P/bWv9SZAukZTOUs1vBnIIUbnRToSRLyVnWP3u?=
 =?Windows-1252?Q?O0ObhkWm5A/eN/dQhPqEmWUwFrL4Z5NWCzV7sWqnJ5bxwIiUq3rjvU/M?=
 =?Windows-1252?Q?gd8wHxbOcooSgs0SGVkQqx+FakUgN7q4qEEL+Dh0zOFRt64RlIGpmr67?=
 =?Windows-1252?Q?W76gy0p84f6VKZ3j?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?6gU8rKBWTunXPSi7Q+Uoe7QwTB3prTUwA/LK0ABYpmj4zm9Ep4+GW9Tt?=
 =?Windows-1252?Q?55tm89eqKsSGppuuwuiDfeuQZjo2VLOcFspKLzVEg2jaB+b489clyJhY?=
 =?Windows-1252?Q?+KdxMDKmkb5GlsrG252oTA9Rnuo01l5lUdGFJLfZKxc4op7bV0YtzO0g?=
 =?Windows-1252?Q?hZKZaueWpExug7/xk0UE8ZBbW09xMPhm6iIvd7FwkZcGF5ho8RMWy3Yh?=
 =?Windows-1252?Q?N6U/2KetYvJnOya9PO9Lg7syEKYkUMsQn8v05FoAhlTtsPm5ndxHEEZS?=
 =?Windows-1252?Q?oWgZoMUiY3C9YJgZ0PK+7I6vVtGpdclKhZlSTZr+dV3ejs0Q8aTYkEgO?=
 =?Windows-1252?Q?8f7Eu+sEGC0j1ZaWgrG09QK2pnRouQQtiPXjmJwCm9mtsjeec5QDhlY7?=
 =?Windows-1252?Q?DqfV8wSEjlIaO2gMw6+xRzBgyLbAqLuI0IlljH+0MIeemzkr1tjQFxnN?=
 =?Windows-1252?Q?+rRyypl7RkbMUWlmW2h/I6UW1BFyYIos9+jl0Zb7Yw044n/emJTr/fJL?=
 =?Windows-1252?Q?K3mKNispWAwuKY0j8mgIXFTPQDd48oaOba4ZW23SgxnHDx6YuTuCz3mK?=
 =?Windows-1252?Q?Kk/xXWhhbDKMeGweWzerlC9t/vf0Gao8dJeLO832XYT2Z8tjnfBH2ezM?=
 =?Windows-1252?Q?DU5wlAcH1yp2KkcRF2ZrPqzfQYiAwVn5a2kluUaGAxHpit3Me35qY2t3?=
 =?Windows-1252?Q?58oPnX8UOGwEP/eeLtlc2BUnxGgX79Ed2jW7N6rXD62qip/KysOP0yy2?=
 =?Windows-1252?Q?NxukcdM18PXfSLtxoN7iY0cLSig2FCMwn7yMqsGBCE9MeJq0CZuetIWo?=
 =?Windows-1252?Q?xXmLbPNJiu7lniuqkNrPa8Dk37TGlVBAlTg39O+BJU/4+CpCBaAm3Z3s?=
 =?Windows-1252?Q?epJs5hGh2jWKqvZ8+W9BfbJ6DLhAY3CZdj1F111a99z5U/mgyBMjnme2?=
 =?Windows-1252?Q?i+fJ3d5IngmVvYkKa5E8a4yAVmPz7qbWKR9/khIaS6nWYcfaBaZJbSWn?=
 =?Windows-1252?Q?gKihh0qKsJN9QEYj/S0QSm5qNPqdaHmsJa8kO45eDMs2bCMeNGZGepDa?=
 =?Windows-1252?Q?OIgi3oiOT6K1Z0L2D6bp8sK3N3FgRel50jurltMQZllJgSWDuwL/UTeN?=
 =?Windows-1252?Q?oMMUYuOL/yTXgdp1IFrsTIV7wbrhPPXgh3KYrKysIpiZ1MuD2h20ZS0d?=
 =?Windows-1252?Q?Jh/tljlmhXHbUx6cDfFFsBIPxKy+MSl4Kn3TE9pQSAPufL5KsxxX1h1R?=
 =?Windows-1252?Q?YeTuo1SxQS/ArriCndCj5FVSkwnIduUI+NQaFYH+3TRoGoSxIZFECdjE?=
 =?Windows-1252?Q?9V/L84Vq/QdwWKGNiq5v1STpKIxDkMDzBYKy/UozwdIS0v2GlM5Nb8LF?=
 =?Windows-1252?Q?eELsRLuTOQSrTCa+AAXOhPqel9hNnwq2VCrrVYP2uiR4bzarrmZvi563?=
 =?Windows-1252?Q?8VHJvd8Uf381LhhPf7umuSNnjd97VEbVuGAZrO7btjCnyQzm1KcvoDH8?=
 =?Windows-1252?Q?H/LKrwMsVmxquGCAWAGDAFAm6p8cCNe2ZZuZxKu9S5Qud2lLZZ8aZhIo?=
 =?Windows-1252?Q?9ffINufrSSy+wkYQNfmcdd+YecUXwv1aorgIWm9ZHFYgq6+Gv6QURt+E?=
 =?Windows-1252?Q?YHzHWCZ6LLWqObGZf/d2svlrNXh8/1K4mXhQNqoiLL6CPkzNMGImBlqF?=
 =?Windows-1252?Q?pE2YEo9gbxX9gArNZCXYUNd3O3BaoD+Z2hpMazFvNBXbkqVo+khYnw?=
 =?Windows-1252?Q?=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR11MB56580DED4998E0DAC2FAC9E2EFE12PH0PR11MB5658namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b54a80a0-50a1-4a86-28d1-08dd3abc7f7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2025 08:12:22.3506
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E50zB4Rz27j0EgZ89ufJrxAe2NL5JTlNT8Gs8jiLXGk3mNxcFW6jCfYJWavPFjHfLMOXe4ppXXJQazhVhW6AIsVHfvxxDsO9gLPQcoNQky0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8463
X-Proofpoint-GUID: Jt3Swfwy8OSAMm1VA44onzl_VWKHqLnq
X-Proofpoint-ORIG-GUID: FBf5UDp9_t_zim5ujNpOZ9pIWvJp1afu
X-Authority-Analysis: v=2.4 cv=d7QPyQjE c=1 sm=1 tr=0 ts=6790a86a cx=c_pps a=gIIqiywzzXYl0XjYY6oQCA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=7CQSdrXTAAAA:8
 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=LVVdaqqDU9W9cF4QaU8A:9 a=pILNOxqGKmIA:10 a=Lix36iyx6i8CVir3:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=a-qgeE7W1pNrGK8U0ZQC:22 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_03,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501220058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 08:12:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210137

--_000_PH0PR11MB56580DED4998E0DAC2FAC9E2EFE12PH0PR11MB5658namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>>Can you give more context as to how this fails?  The current code does a =
substring match so it=92s not clear >>how this breaks,

When building with bitbake lib32-core-image-sato for multilib, lib32 packag=
es are generated. After populating the SDK, when running testsdk, the gtk+3=
 test should be skipped if the gtk package is not present.

For example, when running "bitbake lib32-core-image-sato -c testsdk" testin=
g the following environments:

sdk_env for environment-setup-armv7at2hf-neon-pokymllib32-linux-gnueabi:
/home/poky/build/tmp/work/qemuarm64-pokymllib32-linux-gnueabi/lib32-core-im=
age-sato/1.0/testimage-sdk/environment-setup-armv7at2hf-neon-pokymllib32-li=
nux-gnueabi

sdk_env for environment-setup-cortexa57-poky-linux:
/home/poky/build/tmp/work/qemuarm64-pokymllib32-linux-gnueabi/lib32-core-im=
age-sato/1.0/testimage-sdk/environment-setup-cortexa57-poky-linux

if ('ml' + ml) in self.sdk_env:
   pkg =3D ml + '-' + pkg

This code looks if mllib32 present in sdk_env. However, when testing with e=
nvironment-setup-cortexa57-poky-linux, the code looks for the lib32-gtk+3 p=
ackage instead of gtk+3 package due to mllib32 string is present in sdk_env=
. As a result, it incorrectly identifies the package as present, causing th=
e test not to be skipped. This leads to an error during test execution.

 >>and why the AB doesn=92t fail when it should be exercising multilib SDKs=
 already

May be in AutoBuilder we will not check for lib32-core-image-sato, this mig=
ht be reason why it doesn't fail .

thanks,
Harish

________________________________
From: Ross Burton <Ross.Burton@arm.com>
Sent: Tuesday, January 21, 2025 9:07 PM
To: Sadineni, Harish <Harish.Sadineni@windriver.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>; MacLeod, Randy <Randy.MacLeod@windriver.com>; Kokkonda, Sunde=
ep <Sundeep.Kokkonda@windriver.com>; Moodalappa, Shivaprasad <Shivaprasad.M=
oodalappa@windriver.com>
Subject: Re: [OE-core] [PATCH V2 2/2] oeqa/sdk/context: fix for gtk3 test f=
ailure during do_testsdk

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On 16 Jan 2025, at 13:48, Sadineni, Harish via lists.openembedded.org <Hari=
sh.Sadineni=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>
> The do_testsdk for lib32-core-image-sato aborts with below error:
> configure: error: Package requirements (gtk+-3.0) were not met:
> No package 'gtk+-3.0' found
> Consider adjusting the PKG_CONFIG_PATH environment variable if you instal=
led software in a non-standard prefix.
>
> This cuases due to an absolute path name in 'sdk_env', which is now strip=
ped to have only the environment name.

Can you give more context as to how this fails?  The current code does a su=
bstring match so it=92s not clear how this breaks, and why the AB doesn=92t=
 fail when it should be exercising multilib SDKs already.

Cheers,
Ross

--_000_PH0PR11MB56580DED4998E0DAC2FAC9E2EFE12PH0PR11MB5658namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&gt;&gt;Can you give more context as to how this fails?&nbsp; The current c=
ode does a substring match so it=92s not clear &gt;&gt;how this breaks,<br>
<br>
When building with bitbake lib32-core-image-sato for multilib, lib32 packag=
es are generated. After populating the SDK, when running testsdk, the gtk+3=
 test should be skipped if the gtk package is not present.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
For example, when running &quot;bitbake lib32-core-image-sato -c testsdk&qu=
ot; testing the following environments:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
sdk_env for environment-setup-armv7at2hf-neon-pokymllib32-linux-gnueabi:</d=
iv>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
/home/poky/build/tmp/work/qemuarm64-pokymllib32-linux-gnueabi/lib32-core-im=
age-sato/1.0/testimage-sdk/environment-setup-armv7at2hf-neon-pokymllib32-li=
nux-gnueabi</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
sdk_env for environment-setup-cortexa57-poky-linux:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
/home/poky/build/tmp/work/qemuarm64-pokymllib32-linux-gnueabi/lib32-core-im=
age-sato/1.0/testimage-sdk/environment-setup-cortexa57-poky-linux</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
if ('ml' + ml) in self.sdk_env:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp;pkg =3D ml + '-' + pkg</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
This code looks if mllib32 present in sdk_env. However, when testing with e=
nvironment-setup-cortexa57-poky-linux, the code looks for the lib32-gtk+3 p=
ackage instead of gtk+3 package due to mllib32 string is present in sdk_env=
. As a result, it incorrectly identifies
 the package as present, causing the test not to be skipped. This leads to =
an error during test execution.<br>
<br>
&nbsp;&gt;&gt;and why the AB doesn=92t fail when it should be exercising mu=
ltilib SDKs already<br>
<br>
May be in AutoBuilder we will not check for lib32-core-image-sato, this mig=
ht be reason why it doesn't fail .<br>
<br>
thanks,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Harish</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Ross Burton &lt;Ross.=
Burton@arm.com&gt;<br>
<b>Sent:</b> Tuesday, January 21, 2025 9:07 PM<br>
<b>To:</b> Sadineni, Harish &lt;Harish.Sadineni@windriver.com&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;; MacLeod, Randy &lt;Randy.MacLeod@windriver.com&g=
t;; Kokkonda, Sundeep &lt;Sundeep.Kokkonda@windriver.com&gt;; Moodalappa, S=
hivaprasad &lt;Shivaprasad.Moodalappa@windriver.com&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH V2 2/2] oeqa/sdk/context: fix for gtk3=
 test failure during do_testsdk</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On 16 Jan 2025, at 13:48, Sadineni, Harish via lists.openembedded.org &lt;H=
arish.Sadineni=3Dwindriver.com@lists.openembedded.org&gt; wrote:<br>
&gt;<br>
&gt; From: Harish Sadineni &lt;Harish.Sadineni@windriver.com&gt;<br>
&gt;<br>
&gt; The do_testsdk for lib32-core-image-sato aborts with below error:<br>
&gt; configure: error: Package requirements (gtk+-3.0) were not met:<br>
&gt; No package 'gtk+-3.0' found<br>
&gt; Consider adjusting the PKG_CONFIG_PATH environment variable if you ins=
talled software in a non-standard prefix.<br>
&gt;<br>
&gt; This cuases due to an absolute path name in 'sdk_env', which is now st=
ripped to have only the environment name.<br>
<br>
Can you give more context as to how this fails?&nbsp; The current code does=
 a substring match so it=92s not clear how this breaks, and why the AB does=
n=92t fail when it should be exercising multilib SDKs already.<br>
<br>
Cheers,<br>
Ross<br>
</div>
</span></font></div>
</body>
</html>

--_000_PH0PR11MB56580DED4998E0DAC2FAC9E2EFE12PH0PR11MB5658namp_--

