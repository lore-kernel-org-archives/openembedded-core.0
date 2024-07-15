Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73B27C2BD09
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 06:31:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.32160.1721025110479940185
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jul 2024 23:31:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7926c50979=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46F5BtK6004946
	for <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 23:31:50 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40bs3fs6tf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 23:31:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IBj+hlzHe5iC/RD/tvo2aMcOWPdR8I3+PF7OwPCES7JPtUkWahf33B6AOlIrH31Rt5uJDyC6rdjNNi7BaX8PsoQV6gvie8ZKrEKIClDbSDlaEnpY251kjPJDQMDuNJOMQEaWQASQjPwN79a/h1KehCvhKHOb26wzLJs1/87mDfu+TLM6IcQIvC9y00B05ZdhHEBypaRHRYl+RROocH4+4tU1vx6Hr949kOfCZPbKbSoW2Q0/nx+ZYSkIS4bjC4FU8u6AG2tT6KXBnlFf/62f/cBDMN4+sSQPeo3kE4P+HfPdIg+aO4V5eDT8fgzoQKrPNbP6hSy+fIvqpWP76CArig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2c5nfR8xa3QVoZiRvggnCZ/PnuLvrEb4zy980Q2eE2I=;
 b=hrrYnJjWHFk/9E936dwvQ3nLiAYR07Eit+8pGN33+y36241mQt0MDeLZKVySUviZaT4SekYzdwbCJc9BkE39Nrj/LZIwdcELlxoxBjfOjh0yxYUk0szLLj5fX6pjMN5DyxVBp3JjHPlHVxogZRPC0yZ+/LYr9DXIqeZeqzaX0RwgIXsSd4w41tWShc6duB3m/SgwxPweI3im1SwNmcsdDP2CmLQVZTurD4rF81o+/S897uKV9H6I0nQdM1QXX3/oVrOqlwQib3rkkzlvyrudR/11wtmDrT06AVv/+p/Ymx/eRPEQ2Cmno/+YCcfAnDXZOiBXMO0lKYGzS10zzPfNiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH8PR11MB6928.namprd11.prod.outlook.com (2603:10b6:510:224::12)
 by PH7PR11MB8478.namprd11.prod.outlook.com (2603:10b6:510:308::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Mon, 15 Jul
 2024 06:31:45 +0000
Received: from PH8PR11MB6928.namprd11.prod.outlook.com
 ([fe80::4f5d:1d96:e74c:2840]) by PH8PR11MB6928.namprd11.prod.outlook.com
 ([fe80::4f5d:1d96:e74c:2840%4]) with mapi id 15.20.7762.027; Mon, 15 Jul 2024
 06:31:44 +0000
From: "Song, Jiaying (CN)" <Jiaying.Song.CN@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Li, Changqing" <Changqing.Li@windriver.com>
Subject: Regarding the issue of adding a symbolic link from python to python3
Thread-Topic: Regarding the issue of adding a symbolic link from python to
 python3
Thread-Index: AQHa1n69EJnoG9oML0mODEZag1/G4w==
Date: Mon, 15 Jul 2024 06:31:44 +0000
Message-ID: 
 <PH8PR11MB69284EC66E641DB6521B904EB8A12@PH8PR11MB6928.namprd11.prod.outlook.com>
Accept-Language: en-AS, zh-CN, en-US
Content-Language: aa
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6928:EE_|PH7PR11MB8478:EE_
x-ms-office365-filtering-correlation-id: d1efbda2-87a0-404f-5686-08dca497cc00
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?rQ4hjB4gtUywVy0v2kLMcx6SO5SaqH66EO/1tXSAZLuGH2F/t9o07yXzoVfE?=
 =?us-ascii?Q?F1Xr3AgE8aO7M45iqUf250HK4/hfVQ69W3tK9FBryBIF0cnJ4ZALXiKIjuiv?=
 =?us-ascii?Q?c+TFlq2A9Y99bo3C3TtpLfjNIQM/h6AKvpTUOLhM5CG7mMB2vam0jcNEOBwa?=
 =?us-ascii?Q?sp9be5ndWrgRsFMNh78i/yqYl0relexVkx2BqZv+pwkK/N9pDwsiBnlQ9pIi?=
 =?us-ascii?Q?/zI/3hHEmaVKGwOyCvRk9SQocTbX+2xn4fypqMK0In3QO2sn4O9kBwFk9kzf?=
 =?us-ascii?Q?xFCP2LV90XpfF9lWHR8GMMhk5Awc8r/hl1fEEq67o8duYTiL/cOOyDwnjfdS?=
 =?us-ascii?Q?hxVD93oSPywlBwj/2WGd4cN1YD18QBfFCsLskKS0M09SFsrKLbCJHduhHHW8?=
 =?us-ascii?Q?mfkRfkGEvk1o3peS85NSW7xLaQEx+1hqAWZHkQbz6/8w46f/kG56dKpxxC0v?=
 =?us-ascii?Q?9rajXuAHeSLgZjVdF1/bbRF1stEEMsgU01Nnr+af5lPtN9YVS1k52wax3vzc?=
 =?us-ascii?Q?qPnczCutN9xMhXAG0/oJM8HV90VvmaFxpVtM9sQkgTH/N+uPUOxtxGsrP4I3?=
 =?us-ascii?Q?kC8Zr0hPNJhxjqVxOIxBIEnFosEAfwLTEaeMGRm99vd4NrK2ahhY/W6bAreO?=
 =?us-ascii?Q?q4IVw/liBmfvqDp5uToXPbKnlRnhlFSLSbSfLDW2fflQNQPchaoYDDL96SMg?=
 =?us-ascii?Q?VYt5xn/NHjgSH4g3dPfp36IhEmF2bzwgq02fShy0CVS2/GfH844HQdseDqYr?=
 =?us-ascii?Q?SWxZ1y8HN3onithc7fpiC8Eok8wefUjQcQFB8kL7/ucdm3rpllan8hjskjrv?=
 =?us-ascii?Q?SzcqJJBDaKKffiK18YCWAAPWexpWdB8JHVvg74IYy12kJZfqdOEQPxph/eXw?=
 =?us-ascii?Q?imSrJPT7t+cU9TsFRTp2WcvlFqjSrEUtEkDFiRSyJyPogGIS9JOAyMJ7T9GY?=
 =?us-ascii?Q?j814Yj+6ouYKGyWENmUUA4P5o8yuUrCj8VZDvdbFvXJIOqoc7Z65HlXjsl99?=
 =?us-ascii?Q?OT5xIcT7jgXT1ZcYwXm4oafkudpX0A7Rzig5U0ZcW+IAr19HchDRQDuyc3lu?=
 =?us-ascii?Q?qQuyayfMgRCMMN/1oKOVh+17qy+5M8kGphvxKgJPOiUTeI+owPybBPncpBLu?=
 =?us-ascii?Q?0etAJJfwEcHbKQ3cLhZdQVFtGi+NAchwQ0qnkW0q46XrPBAZ/iGsPTmzRtzU?=
 =?us-ascii?Q?v2sBG5Qp8qdSvGYLhGThUKtm2zZeZQHVgWpuNhfpEKWT8UY0OvU+ZH7EanVQ?=
 =?us-ascii?Q?hF6+TGvnEzO19JQpyE4+q14si3zTNjNEstnn7oPtpou5lUQJmP7I3jMfjnmS?=
 =?us-ascii?Q?jzA7xsnWF/yuZKhqUAbEV5zE2G+7u0XmggITgTJn8CLi4thclOLkrKo3jbSW?=
 =?us-ascii?Q?RUWuP38=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6928.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?9piMfWCFjHKq+N8ETYeSXP/EZsXAooU/dWqt9n97t5Q3wFRDYGdDNaZEMiAi?=
 =?us-ascii?Q?tnbkLtNPmh/7DD/ZlCS23Y/U8W9mVl8XJ8jwGBvm4Tt1t9Y3hC0ibG+lHgeb?=
 =?us-ascii?Q?S5pQRq98Wc2C2E+SM15fDibdd1zQU5ydNI+lYFcKZpSmN85BWd4jn8QBpfPj?=
 =?us-ascii?Q?EYGOYImaUR5bX2fijJoKKwTUgjmorZTwu3Ec/RwVpKIkZXglcuGTSupgd8M3?=
 =?us-ascii?Q?YlySkyoUF+2/kVvdFH/YUvK244wKOWeRefn04KVh/w6PP/wG5WOdc6oToiFa?=
 =?us-ascii?Q?4wQqfNjkwMEa4jRU0QaD3YJs0ropU/y/wNhjdPuEqzEo1C9MLWtBUJlO80iB?=
 =?us-ascii?Q?jazZQsfCttUEFWEuLYsXaAjKgLODOBu98hUvmXkfqw0IHesZW633dIw7J+Ru?=
 =?us-ascii?Q?FmR5jZqqCKUPUwNESjHTubXm/w3mJWaDPTuQjf7W8duk5nwOOpkshXGrEXIa?=
 =?us-ascii?Q?FA5Q0XOveZc7TXtmtU7K1aeYGgcwM8qS5OmjDnVgujHGE76fss/0B9yC3jye?=
 =?us-ascii?Q?kgnjMuenDAC1uvGn4B/FNJ0IB9qrvB39TZv3O6OK2d2+/7Cfd76CiV7j7/xA?=
 =?us-ascii?Q?kSNgj3P0eTVqB0b38Q/0iRYtQ6SnOJK58LuX2e3916+nTfbRgr5eHo4Dv3FL?=
 =?us-ascii?Q?yQmedyJGATErZgd8K6oeNWOBywXxvEokEmhmKADTAV6ArnQ8kHEchJ+iTkdP?=
 =?us-ascii?Q?0PHZOTUeVjifocZbSSj7rU4hUIG0Jh0NMrmp9lW/SFhfa3SpyG+15yLgxP13?=
 =?us-ascii?Q?JthatOP0njmrUwpsMN32vBIZo3fsrRbT+dSqNyllwQF79V2womixrvyCy/NA?=
 =?us-ascii?Q?u1gKKf67XJXWApSqf636RLC7z5OvtHiv2d7g44TJXCU/x53lbKAtSiONLCOj?=
 =?us-ascii?Q?GB8jqXA2BEIlvWQwWizAsk/wSh9cHfG1vhEyg3Pv9OxwPXVBrtNEV3twDYUd?=
 =?us-ascii?Q?xcjih/ydD+gPhwv7Kt6v6DNvQsARmPZCo9R4jkQpPQ1HaEGKHl3T6x1F+L3Y?=
 =?us-ascii?Q?Q6FRduJKXfUbha1Lc24BxF0KGh3rpirXVlbny/vj+dL91xfoWajJg1Eu4TCP?=
 =?us-ascii?Q?WRBLoCokZjcQRq3yCdKOFCsFcouWEjorXcMbjMj/8uQ8kJQIN0YtTn50TT5N?=
 =?us-ascii?Q?dg9kVBOLgnZXYiFAYGV6olY2kfCloMKM3ydGcThUDySCcgo4Awy8o2vGiJNH?=
 =?us-ascii?Q?Jlo3TMfqbPkeqOVh8DOD+zp4ZxNjlFdb0vk9GPQxCK9IZiUzmZzQCHnURxKw?=
 =?us-ascii?Q?tA88YgvZFqxg+dphGLz9vYTfH5rJbVN/YpWrz1o+4LJIwEewPPq6JropEoEC?=
 =?us-ascii?Q?4JMYz1oMdudmyvcQMIz6EJAZos4aq8wNpnO2fLhbI7ALT/K0jPtCO0AoEedE?=
 =?us-ascii?Q?YM5XqGyqynK51Vu8Mnl61GCX8j3zglMKm7OvlD2oVBrQbrJS8SsB1eqtd6uV?=
 =?us-ascii?Q?93FWydu51daMnO97arrKNbuS64sB9YMBlXgPtid6zh3BxlkRCnJuA8cnBS5I?=
 =?us-ascii?Q?aL7JdZOUadycHAm8g9h5HnW2ErQPyMmMGcpBC6alDHV2uL3t3Tb/8ZiSniHg?=
 =?us-ascii?Q?efo30MNrCnCRagxNYuPQ8ybSazmLpdgQK7OHdebUemuBjxHi+/gwXc6zHGe+?=
 =?us-ascii?Q?pA=3D=3D?=
Content-Type: multipart/mixed;
	boundary="_005_PH8PR11MB69284EC66E641DB6521B904EB8A12PH8PR11MB6928namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6928.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1efbda2-87a0-404f-5686-08dca497cc00
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2024 06:31:44.9292
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mBTPeK5Y5MKgMH20LdK2tLEeeuUD72Hg+emMBopmbkhHjioO4ojhdLu9k2609bXAGGGJWWHOlGr45XFdNKxwKQEDvhqeWIagn7ltuD/eK/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8478
X-Proofpoint-GUID: sAvpnUhm9GZAgC3mOsYeBuXWh6vwlMNc
X-Proofpoint-ORIG-GUID: sAvpnUhm9GZAgC3mOsYeBuXWh6vwlMNc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_03,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 mlxscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 adultscore=0 mlxlogscore=999 clxscore=1011 suspectscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407150050
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 06:31:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201898

--_005_PH8PR11MB69284EC66E641DB6521B904EB8A12PH8PR11MB6928namp_
Content-Type: multipart/alternative;
	boundary="_000_PH8PR11MB69284EC66E641DB6521B904EB8A12PH8PR11MB6928namp_"

--_000_PH8PR11MB69284EC66E641DB6521B904EB8A12PH8PR11MB6928namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

To resolve the issue where some shebang use /usr/bin/python, leading to the=
 interpreter not being recognized, I have added a symbolic link from /usr/b=
in/python to /usr/bin/python3. Currently, I have two modification plans but=
 am unsure if they are appropriate, so I would like to seek your advice:

1) Place the symbolic link in a separate package named python-is-python3. T=
o use it, add this package to IMAGE_INSTALL in conf/local.conf.
The advantage of this approach is its flexibility, as you can add it when n=
eeded.
Reference attachment: [PATCH] Add python-is-pyton3 package

2) Add the symbolic link directly to the python3-core package, so this modi=
fication will take effect as long as python3 is used.
Reference attachment: [PATCH] Add Python symbolic links into the Python3-co=
re package

A similar issue was resolved this way in Ubuntu 20.04:  https://askubuntu.c=
om/questions/1296790/python-is-python3-package-in-ubuntu-20-04-what-is-it-a=
nd-what-does-it-actually

If you have any other suggestions, I would appreciate it.

Thanks,
Jiaying.


--_000_PH8PR11MB69284EC66E641DB6521B904EB8A12PH8PR11MB6928namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"direction: ltr; text-align: left; text-indent: 0px; white-spa=
ce: pre-wrap; margin: 0px 0px 10.6667px; font-family: Aptos, Aptos_Embedded=
Font, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Hello,&nbsp;</div>
<div style=3D"direction: ltr; text-align: left; text-indent: 0px; white-spa=
ce: pre-wrap; margin: 0px 0px 10.6667px; font-family: Aptos, Aptos_Embedded=
Font, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
&nbsp;&nbsp;</div>
<div class=3D"elementToProof" style=3D"direction: ltr; text-align: left; te=
xt-indent: 0px; white-space: pre-wrap; margin: 0px 0px 10.6667px; font-fami=
ly: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
To resolve the issue where some shebang use /usr/bin/python, leading to the=
 interpreter not being recognized, I have added a symbolic link from /usr/b=
in/python to /usr/bin/python3. Currently, I have two modification plans but=
 am unsure if they are appropriate,
 so I would like to seek your advice:&nbsp;</div>
<div style=3D"direction: ltr; text-align: left; text-indent: 0px; white-spa=
ce: pre-wrap; margin: 0px 0px 10.6667px; font-family: Aptos, Aptos_Embedded=
Font, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
&nbsp;&nbsp;</div>
<div style=3D"direction: ltr; text-align: left; text-indent: 0px; white-spa=
ce: pre-wrap; margin: 0px 0px 10.6667px; font-family: Aptos, Aptos_Embedded=
Font, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
1) Place the symbolic link in a separate package named python-is-python3. T=
o use it, add this package to IMAGE_INSTALL in conf/local.conf. &nbsp;</div=
>
<div style=3D"direction: ltr; text-align: left; text-indent: 0px; white-spa=
ce: pre-wrap; margin: 0px 0px 10.6667px; font-family: Aptos, Aptos_Embedded=
Font, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
The advantage of this approach is its flexibility, as you can add it when n=
eeded.&nbsp;</div>
<div style=3D"direction: ltr; text-align: left; text-indent: 0px; white-spa=
ce: pre-wrap; margin: 0px 0px 10.6667px; font-family: Aptos, Aptos_Embedded=
Font, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Reference attachment: [PATCH] Add python-is-pyton3 package&nbsp;</div>
<div style=3D"direction: ltr; text-align: left; text-indent: 0px; white-spa=
ce: pre-wrap; margin: 0px 0px 10.6667px; font-family: Aptos, Aptos_Embedded=
Font, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
&nbsp;&nbsp;</div>
<div style=3D"direction: ltr; text-align: left; text-indent: 0px; white-spa=
ce: pre-wrap; margin: 0px 0px 10.6667px; font-family: Aptos, Aptos_Embedded=
Font, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
2) Add the symbolic link directly to the python3-core package, so this modi=
fication will take effect as long as python3 is used.&nbsp;</div>
<div style=3D"direction: ltr; text-align: left; text-indent: 0px; white-spa=
ce: pre-wrap; margin: 0px 0px 10.6667px; font-family: Aptos, Aptos_Embedded=
Font, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Reference attachment: [PATCH] Add Python symbolic links into the Python3-co=
re package&nbsp;</div>
<div style=3D"direction: ltr; text-align: left; text-indent: 0px; white-spa=
ce: pre-wrap; margin: 0px 0px 10.6667px; font-family: Aptos, Aptos_Embedded=
Font, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
&nbsp;&nbsp;</div>
<div class=3D"elementToProof" style=3D"direction: ltr; text-align: left; te=
xt-indent: 0px; white-space: pre-wrap; margin: 0px 0px 10.6667px; font-fami=
ly: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, san=
s-serif; font-size: 12pt;">
<span style=3D"color: rgb(0, 0, 0);">A similar issue was resolved this way =
in Ubuntu 20.04: &nbsp;</span><span style=3D"color: rgb(70, 120, 134);"><u>=
<a href=3D"https://askubuntu.com/questions/1296790/python-is-python3-packag=
e-in-ubuntu-20-04-what-is-it-and-what-does-it-actually" target=3D"_blank" i=
d=3D"OWA47d3a630-1eee-f5b2-67a7-ea8d6692171d" class=3D"Hyperlink SCXW235096=
707 BCX0 OWAAutoLink" rel=3D"noreferrer noopener" style=3D"color: rgb(70, 1=
20, 134); margin: 0px;">https://askubuntu.com/questions/1296790/python-is-p=
ython3-package-in-ubuntu-20-04-what-is-it-and-what-does-it-actually</a></u>=
</span><span style=3D"color: rgb(0, 0, 0);">
 &nbsp;</span></div>
<div class=3D"elementToProof" style=3D"direction: ltr; text-align: left; te=
xt-indent: 0px; white-space: pre-wrap; margin: 0px 0px 10.6667px; font-fami=
ly: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"direction: ltr; text-align: left; te=
xt-indent: 0px; white-space: pre-wrap; margin: 0px 0px 10.6667px; font-fami=
ly: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
If you have any other suggestions, I would appreciate it. </div>
<div class=3D"elementToProof" style=3D"direction: ltr; text-align: left; te=
xt-indent: 0px; white-space: pre-wrap; margin: 0px 0px 10.6667px; font-fami=
ly: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"direction: ltr; text-align: left; te=
xt-indent: 0px; white-space: pre-wrap; margin: 0px 0px 10.6667px; font-fami=
ly: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Thanks,</div>
<div class=3D"elementToProof" style=3D"direction: ltr; text-align: left; te=
xt-indent: 0px; white-space: pre-wrap; margin: 0px 0px 10.6667px; font-fami=
ly: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Jiaying.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
</body>
</html>

--_000_PH8PR11MB69284EC66E641DB6521B904EB8A12PH8PR11MB6928namp_--

--_005_PH8PR11MB69284EC66E641DB6521B904EB8A12PH8PR11MB6928namp_
Content-Type: message/rfc822
Content-Disposition: attachment;
	creation-date="Mon, 15 Jul 2024 06:21:30 GMT";
	modification-date="Mon, 15 Jul 2024 06:23:01 GMT"

Received: from IA0PR11MB8353.namprd11.prod.outlook.com (2603:10b6:208:489::20)
 by PH8PR11MB6928.namprd11.prod.outlook.com with HTTPS; Mon, 15 Jul 2024
 01:57:54 +0000
Received: from CH0PR13CA0011.namprd13.prod.outlook.com (2603:10b6:610:b1::16)
 by IA0PR11MB8353.namprd11.prod.outlook.com (2603:10b6:208:489::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.25; Mon, 15 Jul
 2024 01:57:50 +0000
Received: from DS2PEPF00003442.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::92) by CH0PR13CA0011.outlook.office365.com
 (2603:10b6:610:b1::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.13 via Frontend
 Transport; Mon, 15 Jul 2024 01:57:50 +0000
Authentication-Results: spf=pass (sender IP is 147.11.82.252)
 smtp.mailfrom=windriver.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=windriver.com;
Received-SPF: Pass (protection.outlook.com: domain of windriver.com designates
 147.11.82.252 as permitted sender) receiver=protection.outlook.com;
 client-ip=147.11.82.252; helo=prod-webmail.windriver.com; pr=C
Received: from prod-webmail.windriver.com (147.11.82.252) by
 DS2PEPF00003442.mail.protection.outlook.com (10.167.17.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Mon, 15 Jul 2024 01:57:49 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 14 Jul 2024 18:57:49 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Sun, 14 Jul 2024 18:57:48 -0700
From: <jiaying.song.cn@windriver.com>
To: <jiaying.song.cn@windriver.com>
Subject: [PATCH] Add python-is-python3 package
Date: Mon, 15 Jul 2024 09:57:47 +0800
Message-ID: <20240715015747.613992-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Return-Path: Jiaying.Song.CN@windriver.com
Content-Type: text/plain
X-OrganizationHeadersPreserved: ala-exchng01.corp.ad.wrs.com
X-MS-Exchange-Organization-ExpirationStartTime: 15 Jul 2024 01:57:49.8089
 (UTC)
X-MS-Exchange-Organization-ExpirationStartTimeReason: OriginalSubmit
X-MS-Exchange-Organization-ExpirationInterval: 1:00:00:00.0000000
X-MS-Exchange-Organization-ExpirationIntervalReason: OriginalSubmit
X-MS-Exchange-Organization-Network-Message-Id: 
 20f2a9d6-1491-4b2e-fbd0-08dca47187e6
X-EOPAttributedMessage: 0
X-MS-Exchange-Organization-MessageDirectionality: Originating
X-MS-Exchange-Organization-SCL: -1
X-CrossPremisesHeadersPromoted: DS2PEPF00003442.namprd04.prod.outlook.com
X-CrossPremisesHeadersFiltered: DS2PEPF00003442.namprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: 
 DS2PEPF00003442:EE_|IA0PR11MB8353:EE_|PH8PR11MB6928:EE_
X-MS-Exchange-Organization-AuthSource: ala-exchng01.corp.ad.wrs.com
X-MS-Exchange-Organization-AuthAs: Anonymous
X-OriginatorOrg: windriver.com
X-MS-Office365-Filtering-Correlation-Id: 20f2a9d6-1491-4b2e-fbd0-08dca47187e6
X-MS-Exchange-Organization-BypassClutter: True
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|12012899012;
X-Forefront-Antispam-Report: 
 CIP:147.11.82.252;CTRY:US;LANG:en;SCL:-1;SRV:;IPV:NLI;SFV:NSPM;H:prod-webmail.windriver.com;PTR:ala-exchng01.wrs.com;CAT:NONE;SFS:(13230040)(82310400026)(12012899012);DIR:INB;
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 01:57:49.7151
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20f2a9d6-1491-4b2e-fbd0-08dca47187e6
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=8ddb2873-a1ad-4a18-ae4e-4644631433be;Ip=[147.11.82.252];Helo=[prod-webmail.windriver.com]
X-MS-Exchange-CrossTenant-AuthSource: ala-exchng01.corp.ad.wrs.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8353
X-MS-Exchange-Transport-EndToEndLatency: 00:00:04.9352785
X-MS-Exchange-Processed-By-BccFoldering: 15.20.7762.027
X-Microsoft-Antispam-Mailbox-Delivery: 
 ucf:0;jmr:0;auth:0;dest:I;ENG:(910001)(944506478)(944626604)(920097)(930097)(140003);
X-Microsoft-Antispam-Message-Info: 
 =?iso-8859-1?Q?ihICXZXFM1SIrjwzlSFzlv31s0WL2saTYJmRswAkb0s/pOXstZYEk8y8mm?=
 =?iso-8859-1?Q?nCoSMVzM2vAh3NXI2+4yxS1vI4I2V5vFxnk2pctTTUs4t2TOni8VsUrgRF?=
 =?iso-8859-1?Q?Ve3YKZ6vwCghhkEmwQChxW7yywd3qwRUuJ41ZPM9s5I2CHK2bP32k4nFpn?=
 =?iso-8859-1?Q?d6hIYVFSRjM3Yqjbq176kxuyT5MOd7glj3QcnzJ1RlubjvHbbY5e4lvYcJ?=
 =?iso-8859-1?Q?bTVAgtc4AHXZ+Dh3z8u2VOoEiS7JENO7N5tErYt3C5zoC2sh1bhSq+XNS7?=
 =?iso-8859-1?Q?cBzhJaEQqAOWBJsGUslMxC8p6pBYVOmo3/0acC65DIpO7cFonvjE0gHDNw?=
 =?iso-8859-1?Q?gZXGtKBWqr3mrYgUyCTGZunT0Bc+Z2Zg1VxwxZI0Ds7ITcvsSULIckd/SZ?=
 =?iso-8859-1?Q?E0T/6VE8HO6baE+h3Y2JLCWBSmeB95SWkp/l35+2mBWMaq7RJkK9PATe+5?=
 =?iso-8859-1?Q?P5ZxhiSHriujxhmIEw65z8/TEhCRsL1s5WQGLJwt0/iNOf6ZCupDuWTFGl?=
 =?iso-8859-1?Q?yoB6HMeiEktspaYdH2o10GMJxM1FifD6AaqSyQXspKIsC/idRNDg8e4IGb?=
 =?iso-8859-1?Q?yxbJ07yt9UasbzEY7gh7v7s5ROhlXAhTHvCNcTMmsN2RdRYBK0cfPwzL/p?=
 =?iso-8859-1?Q?mKQgCKcPbAlIuvRLMf/OY8xAyPjlimeiPWfv1e08Px8zMgjX0a0KQ84Wq/?=
 =?iso-8859-1?Q?q23GgVYgGSZ4WHa05Nr9pvZdLhcSUfBQ3sjSg8rxyJLs5weOB2LRCX2jfi?=
 =?iso-8859-1?Q?ssNrtwFYP2coVSOJMLTgoxaqPs8gBHJyfONNGhvPAmj2MSQvLZ8M71EbnS?=
 =?iso-8859-1?Q?Pw6O/0NBQicUXYTbhIX4Ukz13hmGqkj2a0bnvjGELip4KBDjq0SIXbQ73n?=
 =?iso-8859-1?Q?aYQx/LorsUiVQ96vBF2v0hSuhqc/0XwEBZy1uZsk63F+pjVpQOcJC4UbjY?=
 =?iso-8859-1?Q?hjzlzxqfx5H23rGldWGPq8ZpTzRxzQk3UBYT8yosZiL2CWxPK367hsOxig?=
 =?iso-8859-1?Q?06L1vDcZjPp75Ni8cp+sDc8Md+OI7DDBizoVUNjNHEU8+tOMaNNgmIVznt?=
 =?iso-8859-1?Q?J6kIYoq4Rd+nEgmIsNPqbNvsgUlCSD5FSPl1zTy9aoPuMUBeS5viGVkdQm?=
 =?iso-8859-1?Q?P6NTo1yjG/XBtbeGAnoR28kJQlNav7CHIPAxmirjR57ALLdiEpXggdbxKB?=
 =?iso-8859-1?Q?DYlmsdDD/17gm9uTT6juaTxTVUJ/Nse1uqaHpQdWt7yceIPCu2eb0U2vL8?=
 =?iso-8859-1?Q?nXkC1apUu4LeB6JD0SIVvWFmL5IIUQWipI/6Db5XcddkScNI3OqE7lFIbz?=
 =?iso-8859-1?Q?7x5cmUT/ZMR49mtOiejReF4AXQ9dRkNNlzXEhNkEwYQgnNdDP4hoMfwLsK?=
 =?iso-8859-1?Q?jmxlM32EC2xAUTbTidSSeLYsnaWMDf1EqLG6dctBrecF5Og1wnmoI7n6x9?=
 =?iso-8859-1?Q?wHHMdseT30ZW8W9WupKLFdrUq9TGrdpfGbvBMC8OREwgU9BW6ArOXQCjA7?=
 =?iso-8859-1?Q?ElWO/rFVuWeIUOvxkwPfX8VBpvBtqnkF9hN2cvKkdXGhJxTxLQdFcAElhE?=
 =?iso-8859-1?Q?niCZJpWsuof0jH5degGAuSvHgbS9ufL/sWYWSlv78yoy0ey1qFm32eiqHn?=
 =?iso-8859-1?Q?JcSbZ+3IsTc5Ii9AzU3XDf5YT27bJDb+WfSW5NAXRilpe/cDjVDVTpZJQL?=
 =?iso-8859-1?Q?3DHE2XgCHJMDcCznKTvzcNUFnKClxkgkldmfcGxlgTeQNKavFRPObvxelm?=
 =?iso-8859-1?Q?1U1kmaYxLeZgM52w9vJr1Z5VJpAlTcOS8RmwLbMiySY/4jinXjcWus11eJ?=
 =?iso-8859-1?Q?EXsb2hUveJSTU0b8PMl2K2OmPt1KOcJlejCzwPVZWFHXNI1l9tcxzUHWfz?=
 =?iso-8859-1?Q?mbvHzoJWcf9HJO1ghBWTEqgolSaOe3CSd3srQCb7Xqw6l70OcHC78DmSxk?=
 =?iso-8859-1?Q?TVURq86T/ufzYFpgp4gZftNhYPHQw6wu+4+QtRggPnJzRk3fYS4I8qDnGI?=
 =?iso-8859-1?Q?ZIHBytNJG8CIt6SfHMz9KHRgzGtJbv7amZLrRWlLF2WQQqedUatj3BJBo9?=
 =?iso-8859-1?Q?fG7DQnZWf4wOxj9Ge/J2FCrsyw+MCTPsgPpF/HBsYodS5vOFKg0hVBWBaV?=
 =?iso-8859-1?Q?Pd8i5pz1HSfFTbh7bvhH1gJs5DH3dJbhe970kPVEH3H4BXG8HeyDCKeKdT?=
 =?iso-8859-1?Q?56T8DmFZ/9ORC6f2L2aq7/5DGYeoU0bttCjGNd1z2FJXhA=3D=3D?=
MIME-Version: 1.0

From: Jiaying Song <jiaying.song.cn@windriver.com>

The /usr/bin/python cannot find the correct Python interpreter, so a
symbolic link is added to point it to the Python3 interpreter.

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 meta/recipes-devtools/python/python3_3.12.4.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.12.4.bb b/meta/recipes-devtools/python/python3_3.12.4.bb
index 0cb84b91b4..af15c6f4ac 100644
--- a/meta/recipes-devtools/python/python3_3.12.4.bb
+++ b/meta/recipes-devtools/python/python3_3.12.4.bb
@@ -163,6 +163,7 @@ do_install:prepend() {
 
 do_install:append:class-target() {
         oe_multilib_header python${PYTHON_MAJMIN}/pyconfig.h
+        ln -sf ${bindir}/python3 ${D}${bindir}/python
 }
 
 do_install:append:class-native() {
@@ -424,9 +425,10 @@ FILES:${PN}-idle += "${bindir}/idle3 ${bindir}/idle${PYTHON_MAJMIN}"
 RPROVIDES:${PN}-venv += "${MLPREFIX}python3-pyvenv"
 
 # package libpython3
-PACKAGES =+ "libpython3 libpython3-staticdev"
+PACKAGES =+ "libpython3 libpython3-staticdev python-is-python3"
 FILES:libpython3 = "${libdir}/libpython*.so.*"
 FILES:libpython3-staticdev += "${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}-*/libpython${PYTHON_MAJMIN}.a"
+FILES:python-is-python3 += "${bindir}/python"
 INSANE_SKIP:${PN}-dev += "dev-elf"
 INSANE_SKIP:${PN}-ptest = "dev-deps"
 
-- 
2.34.1


--_005_PH8PR11MB69284EC66E641DB6521B904EB8A12PH8PR11MB6928namp_
Content-Type: message/rfc822
Content-Disposition: attachment;
	creation-date="Mon, 15 Jul 2024 06:21:31 GMT";
	modification-date="Mon, 15 Jul 2024 06:23:01 GMT"

Received: from IA1PR11MB8224.namprd11.prod.outlook.com (2603:10b6:208:44f::21)
 by PH8PR11MB6928.namprd11.prod.outlook.com with HTTPS; Mon, 15 Jul 2024
 02:18:57 +0000
Received: from MN0PR02CA0013.namprd02.prod.outlook.com (2603:10b6:208:530::27)
 by IA1PR11MB8224.namprd11.prod.outlook.com (2603:10b6:208:44f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Mon, 15 Jul
 2024 02:18:53 +0000
Received: from BL02EPF0001A0FA.namprd03.prod.outlook.com
 (2603:10b6:208:530:cafe::cc) by MN0PR02CA0013.outlook.office365.com
 (2603:10b6:208:530::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28 via Frontend
 Transport; Mon, 15 Jul 2024 02:18:53 +0000
Authentication-Results: spf=pass (sender IP is 147.11.82.252)
 smtp.mailfrom=windriver.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=windriver.com;
Received-SPF: Pass (protection.outlook.com: domain of windriver.com designates
 147.11.82.252 as permitted sender) receiver=protection.outlook.com;
 client-ip=147.11.82.252; helo=prod-webmail.windriver.com; pr=C
Received: from prod-webmail.windriver.com (147.11.82.252) by
 BL02EPF0001A0FA.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Mon, 15 Jul 2024 02:18:52 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 14 Jul 2024 19:18:51 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Sun, 14 Jul 2024 19:18:50 -0700
From: <jiaying.song.cn@windriver.com>
To: <jiaying.song.cn@windriver.com>
Subject: [PATCH] Add Python symbolic links into the Python3-core package
Date: Mon, 15 Jul 2024 10:18:50 +0800
Message-ID: <20240715021850.668140-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Return-Path: Jiaying.Song.CN@windriver.com
Content-Type: text/plain
X-OrganizationHeadersPreserved: ala-exchng01.corp.ad.wrs.com
X-MS-Exchange-Organization-ExpirationStartTime: 15 Jul 2024 02:18:52.8182
 (UTC)
X-MS-Exchange-Organization-ExpirationStartTimeReason: OriginalSubmit
X-MS-Exchange-Organization-ExpirationInterval: 1:00:00:00.0000000
X-MS-Exchange-Organization-ExpirationIntervalReason: OriginalSubmit
X-MS-Exchange-Organization-Network-Message-Id: 
 1e46382d-7936-4e79-e928-08dca47478b6
X-EOPAttributedMessage: 0
X-MS-Exchange-Organization-MessageDirectionality: Originating
X-MS-Exchange-Organization-SCL: -1
X-CrossPremisesHeadersPromoted: BL02EPF0001A0FA.namprd03.prod.outlook.com
X-CrossPremisesHeadersFiltered: BL02EPF0001A0FA.namprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: 
 BL02EPF0001A0FA:EE_|IA1PR11MB8224:EE_|PH8PR11MB6928:EE_
X-MS-Exchange-Organization-AuthSource: ala-exchng01.corp.ad.wrs.com
X-MS-Exchange-Organization-AuthAs: Anonymous
X-OriginatorOrg: windriver.com
X-MS-Office365-Filtering-Correlation-Id: 1e46382d-7936-4e79-e928-08dca47478b6
X-MS-Exchange-Organization-BypassClutter: True
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|12012899012;
X-Forefront-Antispam-Report: 
 CIP:147.11.82.252;CTRY:US;LANG:en;SCL:-1;SRV:;IPV:NLI;SFV:NSPM;H:prod-webmail.windriver.com;PTR:ala-exchng01.wrs.com;CAT:NONE;SFS:(13230040)(82310400026)(12012899012);DIR:INB;
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 02:18:52.6776
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e46382d-7936-4e79-e928-08dca47478b6
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=8ddb2873-a1ad-4a18-ae4e-4644631433be;Ip=[147.11.82.252];Helo=[prod-webmail.windriver.com]
X-MS-Exchange-CrossTenant-AuthSource: ala-exchng01.corp.ad.wrs.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8224
X-MS-Exchange-Transport-EndToEndLatency: 00:00:04.8794033
X-MS-Exchange-Processed-By-BccFoldering: 15.20.7762.027
X-Microsoft-Antispam-Mailbox-Delivery: 
 ucf:0;jmr:0;auth:0;dest:I;ENG:(910001)(944506478)(944626604)(920097)(930097)(140003);
X-Microsoft-Antispam-Message-Info: 
 =?iso-8859-1?Q?/pc3HEZ7ryOfTHt9ipYLXCyjfA1WWAy1kmGu+98EeTaAJv7wz28VSVX21b?=
 =?iso-8859-1?Q?YKMXQqQZIJK/m5f53Jh8oOvc5f3kFR9hnC0OXwAClShIUosggTNkV7VdB1?=
 =?iso-8859-1?Q?oCeMBD9QiMAFfnea039CaHtuW33YWU88LNUGACiC9fLXF2LyjfeaWCkAMx?=
 =?iso-8859-1?Q?e/0zKTB38RHluxxvXG444LK2TD6Kq6P7BAUCZJa2EFLwXY3KgdzNvbtZgo?=
 =?iso-8859-1?Q?9EiU1GOF1D874i+bzEjicmOdAY+x8JF5DmYLGF/zKY93FfMPA1bPonWYkI?=
 =?iso-8859-1?Q?4ihYNkSU6oTOH2lvHkXjTpvGLbCtifIw12VEHlNgw+7JD2R7l7s00mVsd1?=
 =?iso-8859-1?Q?IR+zz6IxBApkvwY6OVmRatUWTfr0ZisZmcx9LbVrCmgIOj/w0l+Xm/zx+D?=
 =?iso-8859-1?Q?vsID096jYscGvlqvaeoxsFRfBgr2Hv0aBuJ9ljbMJkJsh3S26g5E8jG1dS?=
 =?iso-8859-1?Q?f/0M5BrFOOdzPEi/S+ViIGmKF8NYpdA+ukxJjh0N0RQkvRgsqUy86V5Sj+?=
 =?iso-8859-1?Q?CtCsj/ZktzcZlVgp1hoCnhYU+DkuqyTfxIMA1XY8JxF2NdQOKb3HjS/rlR?=
 =?iso-8859-1?Q?4ncFzN2304zmFft+3iokGTrp2/TS1ZO3Ea79+8a7RMRN0Wwdfd1LQ39ZHQ?=
 =?iso-8859-1?Q?4k0cY8DVjQ0z56NUra6pHTOl1AqODJzszd4l1t02zsUNNLkzdoj2k3zHGU?=
 =?iso-8859-1?Q?SgxHuZA4bmsgLzE+5lUlm3IhZm/GImIyu7Rd3nUPjHxlCwSiNB2jIJY0kU?=
 =?iso-8859-1?Q?osTibhoQEfvUCkHqZbyAypcFl2vXNq6E1PAjZnWE3DflJUoUGPZLFOQahd?=
 =?iso-8859-1?Q?//x3LfoXThi9fQ4T6cyi26Hel4vq0KySmuZAb5TiZYEK3Zkdfpu6KVA/sz?=
 =?iso-8859-1?Q?hdD7SjCDod2Qlfdo1LBgk7KnMzXgT8bKjIaB87k2RYpvnMCTbNo4uhsfaF?=
 =?iso-8859-1?Q?/rYGvc7Z2hu5xCMIpss1kSFgUk1Sc3tdPz24jUbdKk4PX1LZ+bOoa6Lkp3?=
 =?iso-8859-1?Q?zNBwkfl+wepXfxRjCCYOgFltTYnqtojRAkTHfwiM/ibG2eOAtsE8gdAQ7M?=
 =?iso-8859-1?Q?8IUPdAaRSJk3h58Cv5G0z+D4llfdL5dUuU/wSwnRK3Y8TlwZ+VGm6i+xfl?=
 =?iso-8859-1?Q?YirwXaqAavtJZDE8wN4J0Qra5bEgkp+hd+fSZndE16zyBe9bykmP6eT5gB?=
 =?iso-8859-1?Q?I0s5yTJUCMjgfEIDP7MJ6ZoLceN9uiGX3NP/blqdLjWPh8GzTh/9FGTqOK?=
 =?iso-8859-1?Q?GiZaqRr5BrD0R8hKzt3ge79sXIkRCAmi1VUG3gvutxCr/SNSl+2EmPic79?=
 =?iso-8859-1?Q?hJLbOmoOzML4q+qqwyhAo50LyXspFbRi9tlAn3hZjPf31rX74VcOHs37RI?=
 =?iso-8859-1?Q?uDxM1y9+sKSQ2ZqIA2KZHlUq+ZGBYv29FxxpSHSma7eWPqMMfQZVuXT6VX?=
 =?iso-8859-1?Q?OkdiEl4T5FyNvCIYveZK2cG0yhzPv8l6Ac8jWl2TWRBgTb+Xg6orf25xJA?=
 =?iso-8859-1?Q?zevb2MNpeBxDeuiQu3ooAyU7vFy0kSqT18zoh3JKMcKAg9nGN1VBUAtPaK?=
 =?iso-8859-1?Q?XNjBosYl45kLPPAxTfS9/pfqEecoLDVKSUJglLbPqFV9ttccGSZ8K7JI0w?=
 =?iso-8859-1?Q?nxALtgZGoyWYvLE74d6KIuG6ilHyQ8ARwkMvc2TwoOMXhkkzLXcznJ4oE9?=
 =?iso-8859-1?Q?YWEt8S6prfgSrH4WZ77cTrXsZrRcJGOK5QTGNrjTYs6WGMyCvJZTMr8crd?=
 =?iso-8859-1?Q?AYAJAlA9Ux637S2NCRmV5VW41mj3VrDAXWEUly8N0MXeJwTGaKEG9Ac6hd?=
 =?iso-8859-1?Q?zkLU5sggRvcxIdYSllmgeef34I2HPDyrQ5YekXW2W/3Hq7Li7yLThYQvjL?=
 =?iso-8859-1?Q?RhZm7z3VsqpHv4/6rusF8yxAbGuKFA1K7J+quMv99mh3Znu/D39/SDHkKu?=
 =?iso-8859-1?Q?o817SYdnmVz58wYZE6NN4KgeaXy2sWUmXPbdOabgEeuueqEQwXpi0mZXWu?=
 =?iso-8859-1?Q?w4qTWKFQphHrk1wcKnc6kXuHL8T4n5KtWIPBkPQAXl1BxnufWe4yS4DhvI?=
 =?iso-8859-1?Q?0OBkV7FUluJRfNHONVnBe48nqp4DujxIZsD5Q8+5/eoP0Nf2OvtwK6l0/j?=
 =?iso-8859-1?Q?5njBsHQgDtFzKXpJxQg/6oqdclpXbd4bL0ue8U/XnFxW3FQ/pjw0pm77+x?=
 =?iso-8859-1?Q?HfIRJLNLYqUaB1W8TplQ5suA/POu7w5Kw+ucszoIp6PGmA=3D=3D?=
MIME-Version: 1.0

From: Jiaying Song <jiaying.song.cn@windriver.com>

The /usr/bin/python cannot find the correct Python interpreter, so a symbolic link is added to point it to the Python3 interpreter.

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 meta/recipes-devtools/python/python3/python3-manifest.json | 1 +
 meta/recipes-devtools/python/python3_3.12.4.bb             | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 46092d4004..f9259e1450 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -220,6 +220,7 @@
         "files": [
             "${bindir}/python${PYTHON_MAJMIN}",
             "${bindir}/python${PYTHON_MAJMIN}.real",
+            "${bindir}/python",
             "${bindir}/python3",
             "${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h",
             "${libdir}/python${PYTHON_MAJMIN}/UserDict.py",
diff --git a/meta/recipes-devtools/python/python3_3.12.4.bb b/meta/recipes-devtools/python/python3_3.12.4.bb
index 0cb84b91b4..5af5e66457 100644
--- a/meta/recipes-devtools/python/python3_3.12.4.bb
+++ b/meta/recipes-devtools/python/python3_3.12.4.bb
@@ -163,6 +163,7 @@ do_install:prepend() {
 
 do_install:append:class-target() {
         oe_multilib_header python${PYTHON_MAJMIN}/pyconfig.h
+        ln -sf ${bindir}/python3 ${D}${bindir}/python
 }
 
 do_install:append:class-native() {
-- 
2.34.1


--_005_PH8PR11MB69284EC66E641DB6521B904EB8A12PH8PR11MB6928namp_--

