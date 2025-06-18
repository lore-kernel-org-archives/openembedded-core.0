Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF3AAC71157
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 12:52:26 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.30])
 by mx.groups.io with SMTP id smtpd.web11.6532.1750251139525404954
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 05:52:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=W7kMlwtx;
 spf=pass (domain: axis.com, ip: 52.101.69.30, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WKPzDBim5XrEt/V6ORL0dZfCT7OAX5JtPDQ48iMJXPkTRO834fHNrJzZ04oxS1BBv0/vLcu6d8Us503pnHjKedrwpUkvevEXlkcvNyDVdRFFZZf4EZ5HEjJbktb+YS0SHFeBgKH2Em3ZSS2EwwtLHcrFlguv9cf9ZnVPbb3SacCdFUeJ3JWHr2xUQBsUhbeBbKdVte+28dE6R69wq22oScafW0rxpnTa6mJ33dlttTMCFaUU+C1c7YWlBsu9BJKiCPkkVFe0SjkVaLraFB3TXPjnYqVo76PqmKITtSlM9qMnBN7q9v583/vNtGjHUYhi1t7jn/1mNmJX0DiIJV3E4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t1Zka74L4xmHP2BbEC8+apcYjE1OZa/YJHqAbL5y7WU=;
 b=JPBg5oEU1BlHRm7nIB1A5AJoquHLvBoCeI1fD3ZqfBGDZrLkFibejHM2yDnwBsnjmU6KQZVbwhxgZhhepjquNwTliS15d8A1+vJomRRa+6JnYh6HhYg32cFXmmsjvCX16pIClpIhsfaytMr4RJNQbt+DzgwUl3jLCwcbZSpR5IclIImMv0wxAZ6byNZ39GlVOpYm49X8TCcCALZuWNqgRaE9hK9Yz/Fg64v5Cns/v3gFzgOE4QGsc6shC09KhtEKtUMICwYm3eV+zTfBQPZp+03133gSY+Hti++XrgxHqTNerlAfFGVTjbDX5hbQGwJ0UAr3weQsSbLPwx/rMwr3xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t1Zka74L4xmHP2BbEC8+apcYjE1OZa/YJHqAbL5y7WU=;
 b=W7kMlwtx87SXEItIqKakNtXBPf30lRxuawI1yvCsD8E40ZEuiTrKAGOUmul56SWALxNZlhs2Ow+Omv2T9QXCzOo2iDXUToNNmd6dfg0Xjz3a9K8GjG1OdHAjeRXp07so2isda0l2eH3jU7PT/o36hSrvkyZKILn7gkz13I07hwE=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AS1PR02MB10347.eurprd02.prod.outlook.com (2603:10a6:20b:472::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Wed, 18 Jun
 2025 12:52:16 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%5]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 12:52:15 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "dmitry.baryshkov@oss.qualcomm.com" <dmitry.baryshkov@oss.qualcomm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v4 3/8] qemux86: drop duplicates with qemu.inc
Thread-Topic: [OE-core] [PATCH v4 3/8] qemux86: drop duplicates with qemu.inc
Thread-Index: AQHb4DXdSUHimKlN002LU1VEp3MFoLQI3n3w
Date: Wed, 18 Jun 2025 12:52:15 +0000
Message-ID: 
 <DB5PR02MB102133C566C13BE6F44D80629EF72A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20250618094550.1335521-1-dmitry.baryshkov@oss.qualcomm.com>
 <20250618094550.1335521-3-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250618094550.1335521-3-dmitry.baryshkov@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS1PR02MB10347:EE_
x-ms-office365-filtering-correlation-id: 2e2ee138-3445-42a3-e7cc-08ddae66f3f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?EV/5SDbz2L+sgxqlhTr0ZiztuT/8CGX/gqpBuG147+8ySq4GgIXeJTzSxpjn?=
 =?us-ascii?Q?RWztMZQbrlDvTtiGwmevsBG+QUPVbKK58Lt1O+jNBj4Xm+v8qogsSvmNXRzj?=
 =?us-ascii?Q?hc2xc70WZD11VpZ6gjEMjKhmYxW6ob9bNCI4+ES0h9fTR49p0lcDb4rbr3HN?=
 =?us-ascii?Q?6s2X2b9ppxKBdKGqZDZXFSEGqvAYJut6tgr4MBmg/FEmrCDz5RCO88G5e391?=
 =?us-ascii?Q?qhtVzbrnk0KUcHtsGQMcfB+LBuqvplPK8MiYQXd8EQAwgBWsAk3Um+gT287b?=
 =?us-ascii?Q?oTaZLFR/eOE6UPt4AUTvfq4kJuvbtkVAFKjSVsmUAS08z66/etnHHdzU0N1X?=
 =?us-ascii?Q?EDthNUxCS6IWJPtZwgRQFutJ2hMZClcMJ4JC8D3zzqPAssTQuGB5FEIYcGPF?=
 =?us-ascii?Q?v2uGydGufG1o5aLtvN6FGli3NMNMVdmsv/kR4IwyCpeVJudC61QMb12sqn0H?=
 =?us-ascii?Q?cNF9Vj9eK19PH+wf2ze6II58KDDZSu+Jn3gdqVwRrQERwinUpEobPCUP28Ik?=
 =?us-ascii?Q?Og8dqrXcFPIzlQQmYfMa7uyY8HiNyEF5Y+qmBVVK0buU/WyGsOpsvFOvbemS?=
 =?us-ascii?Q?HmfwTJcFHGqyJ8b8diyGbQ2YevZx4Y4w/kZT1yukM/uL+HpiDLksx1XVTDWN?=
 =?us-ascii?Q?lu91ElsvB6C3HhYabRFtOBLQoOBtlb2skZhpj8UIvafni7asFNjuy9J0LT/y?=
 =?us-ascii?Q?mrMQapyggnPLx+KuqHzx2Wp8R5GGUzI5d679il2Hwb8QXVsELgjZ+EC6sE0S?=
 =?us-ascii?Q?JHknPneBrJTTuyQdYgbT5czPqppuH1PEl2Yivsdsf2k3cxJqZ6TnZFzsozo1?=
 =?us-ascii?Q?Zqs9vnhBUXYI1FwJFof53MQpAzxP3TDEg7jrGq4pL4LIzueQVZ7Eb1r+1WqQ?=
 =?us-ascii?Q?Xykettuiab8LPlVTXyoQXRLdpySzzhpRJUvDOcfsqATRP/XDquty3xsimCpI?=
 =?us-ascii?Q?Rw7kZTOTtVAg7GSoMyPcX3sIMC7I72O7cQlTZowvXsHld2OqXRzaZxvFMvqG?=
 =?us-ascii?Q?2PoZ1ObZFP0UxSbP8guxUsD/xucKmEUc8NxrMOvJOdRX8xSV+cwkElcFyq92?=
 =?us-ascii?Q?MkPrSxQQ+4hmgEUrMrUYczdVEcRYS0F2iyoC2A/Yiuqtj1k002oQRnjKtNBc?=
 =?us-ascii?Q?ChHw3pwPpvNDHDTCEBvT/lAEqstMuWfj3RqaHbbnHsSxPVz+JrToD4Bff3An?=
 =?us-ascii?Q?o1CEi8Tt1gVQM6votvvPSNNe58+U2ofORfFIP1tTFjBKRm+AsUAx1PMCJpsI?=
 =?us-ascii?Q?7+9dSyBvBeHcfobW2daxMR24ooHXEL0WEpoOmR/ybfZv3LBIwUoCYJJE3tGb?=
 =?us-ascii?Q?WJNPx+XSdHH2tYIzh8q7Me/ohV+/emMvooyjNrSSOjk0dkGkAR9dllRoc8Sn?=
 =?us-ascii?Q?1G1odHGQf8hyCWiY/kth/jTZyrL3Fj7lOfBMvMfWw/Y66qwxwTbmdPjqDNxC?=
 =?us-ascii?Q?Tp8HTOcKetbBV46Y/B/LABLSdA0145vYWBBOvUEPlFmOq5YxjM3+AA=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?aKK30UFvFLqRX3NVw3Bddw73gxsW2w5S35nvl0I+oTyLzbm7YSee0b55nThb?=
 =?us-ascii?Q?kR3UteWWUSfIDLERNjOXa1mTnG97fhaEB0uGA+hZmAmCpE+sDnJyBvi8bTJ7?=
 =?us-ascii?Q?oJbDYpPOJxzw6XICNDl8TpWCgSuL4XJvrHPMGh+kWtpstoR5RmFUXCZlKctd?=
 =?us-ascii?Q?uE6s19C/5FjJQGGjkV0ICH+QwnVRQD7YafKAaEmKa/GKIhJ1Uv2J4tbPv3rM?=
 =?us-ascii?Q?uGrsup8h3+gPd8D5BfOBvo+xk8Kg8WhEhbBY4B+XHH3GU3/m7d0keC9U9eYT?=
 =?us-ascii?Q?hmoKV1AdFIKymig7G1qvBtKWjlI6ipVwTonUdeGTV7pe7quSx/6XwkbvO+3r?=
 =?us-ascii?Q?5bwIPmh7GE4giGG0N0mRAA4kvkj5uI74GmZF531Cccjnf+r5/8hHEGyBFDWG?=
 =?us-ascii?Q?6EFsElnE0Klm/BCe3v42egB0eYw9En81hlZ0ARivuIy+w7rj30hyJoUnXZ2U?=
 =?us-ascii?Q?ZPBGczi+Wzva5nNOcBDzIXvr77R9Stv/nA/ZSQrQBQr3L90RiwSQw9BH/M+L?=
 =?us-ascii?Q?BN0h0vGR0KO9n0HWy0CggTyHukFHVMiiExym7Vv4TD3BRemoP41aVWmGU4aN?=
 =?us-ascii?Q?bTn3kr5+iZ9lUMrtqf5HC7prC8oAy5c4ENbIXVVWM1sglA2R3TeFfMEHmeAW?=
 =?us-ascii?Q?jaOlcXS3XfGHeomp7Zrd8biwnATpxe66yJG+4//hVzWXIkq5IsOYJwReQK6q?=
 =?us-ascii?Q?GTOof0WuxllMFHh1y+8CXSyXuxbywvTGPKPLScsXDgQeGNyuLpdgS9YxmONW?=
 =?us-ascii?Q?LdOzmpKEKbVVmyYcLZEMiw2k3Cfgv17+WyJ0SHtmQw/B++T7GsiJnm216JX0?=
 =?us-ascii?Q?oWeHvHiGgp24aDyLqH4rl73Kp6qMjXOEW52N0Ny0j6fxnGUuOeDnjR/L7jCs?=
 =?us-ascii?Q?TnndUGpw6rFJlOu+WQiGsMXbf/URrvwOOipCGVr5ri0Z7nYB+YSJC42Oh0Fv?=
 =?us-ascii?Q?OZ3L134ijLBRm4yFr1/HwtS82s8qjp250TDnVAUJQ8K9wj2H8rQ8K8S+WoKo?=
 =?us-ascii?Q?aFrOyyjYJsocLyV6wviZf3zRVf8F85EOFvAe3GUCAWWpHegUjXe8NT8wJys3?=
 =?us-ascii?Q?2AnVCAq0e1R6NYd9UdhFcAyItJ2IgDMANpDtknhbU3750T1Lr4uhKJkdYcPv?=
 =?us-ascii?Q?MK9IQDLMaAIgiovSdb2unO17DvZ4ZK/ssIR2U25F+IlDrx9c5eUPcQgl4JkO?=
 =?us-ascii?Q?dLex0tk5Dp9QJKNVADkmvqbsYhhftoG8rBr232g2N4kLkENBNEWjgTsq7x9E?=
 =?us-ascii?Q?m4tbwXyiPFTsmLkrnBAigIgqXQHqYROxpFqDSt/J4q92bl00ogmEog4FmP7a?=
 =?us-ascii?Q?48NHY0qj97nSSK+wNOX4zs6cssHuh2g52x83uXvES91uloK5UWHCTHNZfmR2?=
 =?us-ascii?Q?HzOk9DaVrM5OxqpKXpPD80NXysd/TG9dWZtSbAFRCvfzRy1XgL10ovGunSYO?=
 =?us-ascii?Q?vnVFsHMvuT7GYOpgFkVU1tLaLtqhhrbmijDll2h+BmYxywSKyOcJbPkstZ8Y?=
 =?us-ascii?Q?HdUiZcxZG3WPHa/9i0Fs6c2Q8E1wzcR+17GgynBA9ztOdKK5gi2xuQD60SfW?=
 =?us-ascii?Q?D9K8fF2KE1VuKLWrw64=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e2ee138-3445-42a3-e7cc-08ddae66f3f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2025 12:52:15.8936
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ei45tYmdlkNrTJj8GkgLmwzMwPK7IAq1IHVQ2hcWk5xF3ERclcQzkQUd4bzcVFb1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR02MB10347
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 12:52:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219007

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Dmitry Baryshkov via lists.openembedded.org
> Sent: den 18 juni 2025 11:46
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH v4 3/8] qemux86: drop duplicates with qemu.inc
>=20
> qemu.inc already includes PREFERRED_PROVIDER values for xserver and GL
> libraries. Drop the same values being set in the machine config.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

The subject and commit message for this and the next commit should be=20
updated to reflect that the duplicates are in default-providers.inc=20
rather than qemu.inc.

//Peter

> ---
>  meta/conf/machine/qemux86.conf | 6 ------
>  1 file changed, 6 deletions(-)
>=20
> diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.c=
onf
> index 1e072e1ae285..51f080bd2a51 100644
> --- a/meta/conf/machine/qemux86.conf
> +++ b/meta/conf/machine/qemux86.conf
> @@ -2,12 +2,6 @@
>  #@NAME: QEMU x86 machine
>  #@DESCRIPTION: Machine configuration for running an x86 system on QEMU
>=20
> -PREFERRED_PROVIDER_virtual/xserver ?=3D "xserver-xorg"
> -PREFERRED_PROVIDER_virtual/libgl ?=3D "mesa"
> -PREFERRED_PROVIDER_virtual/libgles1 ?=3D "mesa"
> -PREFERRED_PROVIDER_virtual/libgles2 ?=3D "mesa"
> -PREFERRED_PROVIDER_virtual/libgles3 ?=3D "mesa"
> -
>  require conf/machine/include/qemu.inc
>  DEFAULTTUNE ?=3D "core2-32"
>  require conf/machine/include/x86/tune-corei7.inc
> --
> 2.39.5


