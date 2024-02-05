Return-Path: <chi.xu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5031C48291
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 06:10:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.57198.1707113415310878128
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Feb 2024 22:10:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=eLsXPdkC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=27653673ff=chi.xu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4155fD05002588
	for <openembedded-core@lists.openembedded.org>; Sun, 4 Feb 2024 22:10:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=55bbQZgAxL0eigvjAmRcB+wn74xWxLFMJ1PbMFxvK6Q=; b=
	eLsXPdkC3b3u6feriWDVcY6hsjUAPh+kNQZGxRW5Zxybkyr/bijqk9uWq1K8DqpX
	PT9QA0qhl+aqVhOovbKYFYASAxajAhyxhWDC+MGy7qQpLdcs7Da3j1/92LSaSEZQ
	2etBJcN3xjqDv721CE2jGCWo/eQM9G2guZ5v2GuPwOLoNCBG/8hXA8+tzrr7ErRl
	FshwAZHM/0xiLQ9H0PmHtqsZuVzpgM14srMLOU7OZyY5j44caIlB1iZZ+vc9/qU/
	g4cKKes3WAq8nF1OvtKb+eiwrj75XHrXVFuKzUz9zlB4H+XInB3PFT0Wv6MndpaV
	nxsbtkgRoyvrd+/umyi7gg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w1nvm161m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 22:10:14 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 4156AEcN004506;
	Sun, 4 Feb 2024 22:10:14 -0800
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w1nvm161k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 Feb 2024 22:10:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hPC6cgBApyodaMmoIk5N50Nieupnu8QJxz01YkDfL/NVaTXCsdyHXJ99WUmU6GoWxrh3Nqnr+U1gBznomfi/lnEVxPAOMQP1kkc0HSsOPVjZm8MIH2F7Kg7nwWIhWQ5WSq8Ax1VMqOh3yEA7Iy0LjNo3HOaPIFZWhD3nilmE2lTAvFiOpX+F88sguNHCf0Hx7vff2qT0B32dDfa8x2EQbEAVk9k4+6vOpvlCoamA/v9BCF2zUX63fHey7P24yHcV+E4ydZVGcBo60H2Y4HYzRHbKNngVdClKwqzPBq6unascBhOvuSAqv8+vR96lQlFb+TotXVq/lGRQUuNPB+Pblg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=55bbQZgAxL0eigvjAmRcB+wn74xWxLFMJ1PbMFxvK6Q=;
 b=FLUm3Y/cCmOP1GjCTIwhxXe8ilk2PXR/7FI5FnopICAvx7UPCyc/6TeWFOJhR2Mnw6ZGZKi6dEeUGTpXdCZ0rSJkJ2jfD2P4Vwc6XApCebrmWkpU+n8dKreR63DZGiMDw3ai/ADJrVwYxGce8mZ15E3T9gFqpvKuUoxLkiOX8MGgN0gfIYgffglFXFXj+XS5MHE933Pfe0rdbrLtg6f4ofE1pQNj3QV2eqzhBSpTDjXux0Km1jwoofqkdOlL4ovdFMiNIMssxiQLkm7/h75aiwV4a2VNhjh3u0wy9zw83HXSYu1v+ojmL/FBMnz2PVE+M11dDWWXd1cUAXCO+bfhYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5390.namprd11.prod.outlook.com (2603:10b6:5:395::13)
 by CY8PR11MB7059.namprd11.prod.outlook.com (2603:10b6:930:51::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.34; Mon, 5 Feb
 2024 06:10:10 +0000
Received: from DM4PR11MB5390.namprd11.prod.outlook.com
 ([fe80::6b2a:9f24:34d0:cd1d]) by DM4PR11MB5390.namprd11.prod.outlook.com
 ([fe80::6b2a:9f24:34d0:cd1d%4]) with mapi id 15.20.7249.032; Mon, 5 Feb 2024
 06:10:10 +0000
From: "Xu, Chi" <Chi.Xu@windriver.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v3] xz: Add ptest support
Thread-Topic: [OE-core] [PATCH v3] xz: Add ptest support
Thread-Index: AQHaVuc6RnxL5Ae4U02yIyvcExomDLD7Q+Tg
Date: Mon, 5 Feb 2024 06:10:09 +0000
Message-ID: 
 <DM4PR11MB5390667A281AA8148CD5A56A9A472@DM4PR11MB5390.namprd11.prod.outlook.com>
References: <20240126054820.1656852-1-chi.xu@windriver.com>
 <202402032123190b2cce93@mail.local>
In-Reply-To: <202402032123190b2cce93@mail.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5390:EE_|CY8PR11MB7059:EE_
x-ms-office365-filtering-correlation-id: 3cf3259b-1013-4732-13f2-08dc26111ba4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 aG7HRTsRK4iHAHz9StfnVBsx5YqPCeDCDM8SJlEY4O1RfpFEVxlviPm3hu979rGgGf2xSi4EevwVrn0E0Z5ODFCh9JfSKcaCrfhtbYQTOvRb2d8e6pW3KsjStN9DrJ34hR4XIv3c57IA6kp9xiz7omKbSG2v0ls4HkowKSoaMGqHegj3TOCKYBM/K/QRvgQpP9dMnlM3tbr7IB3Uh/B4jsUBStxzdA3Lw9dgW4zTlBXsyy7eIYQqmuUHoqtOQ/Sczj8KQh4eGQM8lGSgyLe06orpxRt+3GlhdmJq5fJnikC+cluzJt0bY06e00auXDX5XflUu2aNg9MfTYT7rWRSB8PXyWi/s+h/3P/o0G/1FV63mZCuVDJQYTh6F0pPsV+l+Tiuahc3nx+sgXI3mshTAeUW6aRRmWmmY8ug4drIn5bhte7PRgf8ZRwTFUB5Vf6W8E5Bw9i/K5bvMcyAanWf8nEj413tASDtU9c1fFiqxI4TZOB1JsJ8Q+JkumyLpNZ/Ojqq6HTHgKFzUUj5rM3I6eYoBrlLN/4lademueT8/sCNOvKWqovG26RZ38OpRtfmZQ4++xDAldj82kUBn1FP6oqBD0lnC6M5zvsVUehmIaPCV1MEdJs/RSBflC4Aff7gFVY8s6bx4Z8TPyp7PbDV/Q==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5390.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(39850400004)(346002)(396003)(366004)(230273577357003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(66899024)(5660300002)(2906002)(33656002)(64756008)(316002)(66946007)(66446008)(66476007)(66556008)(76116006)(6916009)(52536014)(8936002)(4326008)(8676002)(38070700009)(41300700001)(6506007)(7696005)(53546011)(71200400001)(9686003)(122000001)(55016003)(83380400001)(26005)(86362001)(38100700002)(478600001)(966005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?wurDKsOy1zfui3bsVsjcQ35IHJlQ3F5dw3fJbHf5g2eZIOFO3142Px7SlAbd?=
 =?us-ascii?Q?OXw2bZpr0UKnfe7AXOddsdl9mB8+C2OTmNEWWBrNx+uUZWv9NTJIxMsPVhav?=
 =?us-ascii?Q?djtwoCvEhWPRoVtyGPa8UIYIRJDJ0LzBoWW1zHlb0ZSKrQQCAEes9Gnr0c+T?=
 =?us-ascii?Q?lMvfAlsguzbmx5m7gH7vmtmINCFU6apdKqy9uaNdR0o5dhQnam3mrL7lKD0T?=
 =?us-ascii?Q?nKf2ecHALAEztHKmnVGEsm+AtsM4GJM2XeEjI5AQnyunHRNcyW74TRjcL/VY?=
 =?us-ascii?Q?OF7n9Z5WCdxzU6DZUyDvhi3VGhj20Q8GGG4029FJRC/cep7j26F+uWvvKm2J?=
 =?us-ascii?Q?OGwA6H5VIy1Bx6+vmLrofF85iPJWtJckLvrevgdXRJPouRt0D1SUMbQA/r6e?=
 =?us-ascii?Q?n7Jlb82a4J+HBPx/DvOS8GyN8OPkAgvDVE4tokGzpzsXga810bNJNbHYyz6E?=
 =?us-ascii?Q?g/EGLeSHbPK0GZmsMbfrj8KSWJu6eZJOFwQDFKcClmdC9TbSUY54o/nfNxdm?=
 =?us-ascii?Q?FEvDHh+7/dsq9KuLiBcPeb5VkRKb8Cx6MmVFpOfGNWrglJquZANmzDghw7Mq?=
 =?us-ascii?Q?48e74BwXMEkg9SzW177xPSZM+LyWhRU97Edv4uvllXzFH77W2UKpV8o9nlip?=
 =?us-ascii?Q?rgQO4nZxawh31lV9hudXYgBeiXPoJHvRXCh3hBeL6OcZPK7Z84Cjip9momB+?=
 =?us-ascii?Q?MonP5PxMpttrTMJSQNB4PAGp98JOToDKK9su0GjT/p/ZiA7ReEtJ++9yzdrj?=
 =?us-ascii?Q?TJCyTUdonNrXTJwUL0ZoDsWNA0QXU9yL3KTL8IruD1A7AcwmoRP9gKsiYYLU?=
 =?us-ascii?Q?nrpK5n8ygRR9uAzFlxvmBX4fXhU+RERZothO60cR1AnUA5aGcRPCAWWQkInq?=
 =?us-ascii?Q?aAeRPQu4mYz4brIkfreNShqPiJDaN4SY0RS/vWN2W/5S4md22zi1i/6jZcKc?=
 =?us-ascii?Q?SuQuWrIyATI8bGfzsq+vfvRcYcXNgq7mGPR/nWMd2CgE4sTuG5GfrLZ7ZvBV?=
 =?us-ascii?Q?s2rFtYJG97L9N5bVlzFORT5RMyEgz+ySD5JIoPDouW0Q0BJAenhkuSg1gJhT?=
 =?us-ascii?Q?GFVJpwscwL8fZIeGqI4mEn0XJlciMPynC4SPoZcj3pC3TxwdmepzDU76cZsg?=
 =?us-ascii?Q?un8h+KkWpg7NFDmZrqVPoPNFaqEx94tp7mKI3mGfDIdSu5Ua8f1MbOIFDzW8?=
 =?us-ascii?Q?aomPQ6R5NJU0Ekgt0H2YKWHhwI2KzN/gJ+QWBcm2sMLc+Oktcp4Gc2bAvrpN?=
 =?us-ascii?Q?0u7QVSiwy3UH3dJ6nctRGRX1KSUdzzfukIswKbWKy2fle815rTCxEqVgmFj9?=
 =?us-ascii?Q?H1jRCUn0KegNOnyR7lW1mbdo1F56aIySxydimvTh7ZG1b8qpV7Gh75nvJPL5?=
 =?us-ascii?Q?xHkLlzjEFzgtB2e8MU9LAkHA0yVmgUrkJipfgPxpGl9NGf3XHUkpXi8GZIEJ?=
 =?us-ascii?Q?G/gG4Vuzl2HplXYKESk3W7kIc1+eWa2sMZROp3Sq+vIAdTKQy119FjIa9IWF?=
 =?us-ascii?Q?qfTJLTKM3vmpUktBdkCj1s5J/cz0BYAPYPsG4pxjHO5vGc86miKj5/3n2HiR?=
 =?us-ascii?Q?oVx6NXXqhtT2/e5ZROm/dRowJV5HEnZC2aFJJnIh?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5390.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cf3259b-1013-4732-13f2-08dc26111ba4
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2024 06:10:09.9238
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NfuYpupp31aiPPSDJd7xQrArdWUjaIcRBO4Whs3RKVLQmFD1YF7RX6bR2LZzZniDHJ3KergXM3M1Mbrj54zdEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7059
X-Proofpoint-GUID: vKILegzsH-857rdDTI7YW3M4A5eaD2Lh
X-Proofpoint-ORIG-GUID: rrtQPOP_iP3tEmyKT4AX53g5eAqnocIq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-05_02,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 clxscore=1011 impostorscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402050046
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 06:10:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194916

Hello,

I'm checking this issue, but can not reproduce it on my host now.
I tried to build and rebuild xz-ptest on ubuntu 20.04 and ubuntu 22.04,=20
xz-ptest-5.4.5-r0.core2_64.rpm are same.=20
Do you have any suggestions?

Ubuntu 20.04
root@localhost:/root$ git clone git://git.yoctoproject.org/poky
root@localhost:/root/poky$ cd poky
root@localhost:/root/poky$ source oe-init-build-env
root@localhost:/root/poky/build$ bitbake xz
root@localhost:/root/poky/build$ ls -l tmp/work/core2-64-poky-linux/xz/5.4.=
5/deploy-rpms/core2_64/xz-ptest-5.4.5-r0.core2_64.rpm
-rw-r--r-- 2 root root 162489 Feb  5 13:27 tmp/work/core2-64-poky-linux/xz/=
5.4.5/deploy-rpms/core2_64/xz-ptest-5.4.5-r0.core2_64.rpm
root@localhost:/root/poky/build$ md5sum tmp/work/core2-64-poky-linux/xz/5.4=
.5/deploy-rpms/core2_64/xz-ptest-5.4.5-r0.core2_64.rpm
b26fd0014d1c23f6e3d9bf8704137b82  tmp/work/core2-64-poky-linux/xz/5.4.5/dep=
loy-rpms/core2_64/xz-ptest-5.4.5-r0.core2_64.rpm
root@localhost:/root/poky/build$ bitbake -c cleansstate xz
root@localhost:/root/poky/build$ ls -l tmp/work/core2-64-poky-linux/xz/5.4.=
5/deploy-rpms/core2_64/xz-ptest-5.4.5-r0.core2_64.rpm
-rw-r--r-- 2 root root 162489 Feb  5 13:32 tmp/work/core2-64-poky-linux/xz/=
5.4.5/deploy-rpms/core2_64/xz-ptest-5.4.5-r0.core2_64.rpm
root@localhost:/root/poky/build$ md5sum tmp/work/core2-64-poky-linux/xz/5.4=
.5/deploy-rpms/core2_64/xz-ptest-5.4.5-r0.core2_64.rpm
b26fd0014d1c23f6e3d9bf8704137b82  tmp/work/core2-64-poky-linux/xz/5.4.5/dep=
loy-rpms/core2_64/xz-ptest-5.4.5-r0.core2_64.rpm

Ubuntu 22.04
root@localhost:/root/poky/build$ ls -l tmp/work/core2-64-poky-linux/xz/5.4.=
5/deploy-rpms/core2_64/xz-ptest-5.4.5-r0.core2_64.rpm
-rw-r--r-- 2 root root 162489 Feb  5 13:56 tmp/work/core2-64-poky-linux/xz/=
5.4.5/deploy-rpms/core2_64/xz-ptest-5.4.5-r0.core2_64.rpm
root@localhost:/root/poky/build$ md5sum tmp/work/core2-64-poky-linux/xz/5.4=
.5/deploy-rpms/core2_64/xz-ptest-5.4.5-r0.core2_64.rpm
b26fd0014d1c23f6e3d9bf8704137b82  tmp/work/core2-64-poky-linux/xz/5.4.5/dep=
loy-rpms/core2_64/xz-ptest-5.4.5-r0.core2_64.rpm
root@localhost:/root/poky/build$ bitbake -c cleansstate xz
root@localhost:/root/poky/build$ ls -l tmp/work/core2-64-poky-linux/xz/5.4.=
5/deploy-rpms/core2_64/xz-ptest-5.4.5-r0.core2_64.rpm
-rw-r--r-- 2 root root 162489 Feb  5 13:59 tmp/work/core2-64-poky-linux/xz/=
5.4.5/deploy-rpms/core2_64/xz-ptest-5.4.5-r0.core2_64.rpm
root@localhost:/root/poky/build$ md5sum tmp/work/core2-64-poky-linux/xz/5.4=
.5/deploy-rpms/core2_64/xz-ptest-5.4.5-r0.core2_64.rpm
b26fd0014d1c23f6e3d9bf8704137b82  tmp/work/core2-64-poky-linux/xz/5.4.5/dep=
loy-rpms/core2_64/xz-ptest-5.4.5-r0.core2_64.rpm

Thanks,
Chi

> -----Original Message-----
> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Sent: Sunday, February 4, 2024 5:23 AM
> To: Xu, Chi <Chi.Xu@windriver.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH v3] xz: Add ptest support
>=20
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d
> know the content is safe.
>=20
> Hello,
>=20
> I've had a reproducibility failure:
>=20
> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20240203-
> fdpg888c/packages/diff-html/
>=20
> On 26/01/2024 13:48:20+0800, Chi Xu wrote:
> > There are two types of cases: executables and POSIX shell scripts.
> > All test cases PASS.
> > Add xz-ptest to PTESTS_FAST because test duration less than 30s on
> > qemux86-64.
> >
> > root@qemux86-64:~# ptest-runner xz
> > START: ptest-runner
> > 2024-01-26T03:32
> > BEGIN: /usr/lib/xz/ptest
> > =3D=3D=3D test_bcj_exact_size.c =3D=3D=3D
> > PASS: test_exact_size
> > PASS: test_empty_block
> > ---
> > =3D=3D=3D END =3D=3D=3D
> > ...
> > =3D=3D=3D test_vli.c =3D=3D=3D
> > PASS: test_lzma_vli_size
> > PASS: test_lzma_vli_encode
> > PASS: test_lzma_vli_decode
> > ---
> > =3D=3D=3D END =3D=3D=3D
> > PASS: test_files.sh
> > PASS: test_scripts.sh
> > PASS: test_compress.sh
> > DURATION: 18
> > END: /usr/lib/xz/ptest
> > 2024-01-26T03:33
> > STOP: ptest-runner
> > TOTAL: 1 FAIL: 0
> >
> > Signed-off-by: Xu, Chi <chi.xu@windriver.com>
> > ---
> >  .../distro/include/ptest-packagelists.inc     |  1 +
> >  meta/recipes-extended/xz/xz/run-ptest         | 26 +++++++++++++++++
> >  meta/recipes-extended/xz/xz_5.4.5.bb          | 28 +++++++++++++++++--
> >  3 files changed, 53 insertions(+), 2 deletions(-)  create mode 100644
> > meta/recipes-extended/xz/xz/run-ptest
> >
> > diff --git a/meta/conf/distro/include/ptest-packagelists.inc
> > b/meta/conf/distro/include/ptest-packagelists.inc
> > index a1643c5548..68a3f63a6a 100644
> > --- a/meta/conf/distro/include/ptest-packagelists.inc
> > +++ b/meta/conf/distro/include/ptest-packagelists.inc
> > @@ -77,6 +77,7 @@ PTESTS_FAST =3D "\
> >      sed \
> >      slang \
> >      wayland \
> > +    xz \
> >      zlib \
> >      libexif \
> >  "
> > diff --git a/meta/recipes-extended/xz/xz/run-ptest
> > b/meta/recipes-extended/xz/xz/run-ptest
> > new file mode 100644
> > index 0000000000..cc8ba92016
> > --- /dev/null
> > +++ b/meta/recipes-extended/xz/xz/run-ptest
> > @@ -0,0 +1,26 @@
> > +#!/bin/bash
> > +
> > +ptestdir=3D$(dirname "$(readlink -f "$0")") cd "$ptestdir"/tests ||
> > +exit
> > +
> > +# executables test cases
> > +tests_exec=3D$(file $(ls test_*) | grep "ELF" | awk -F: '{print $1}')
> > +for i in ${tests_exec}; do
> > +    ./$i
> > +done
> > +
> > +# POSIX shell script test cases
> > +export srcdir=3D${ptestdir}/tests
> > +test_shell=3D"test_files.sh test_scripts.sh test_compress.sh"
> > +for j in ${test_shell}; do
> > +    if [ $j =3D=3D "test_compress.sh" ]; then
> > +        ./$j create_compress_files
> > +    else
> > +        ./$j
> > +    fi
> > +    if [ $? -eq 0 ]; then
> > +        echo "PASS: $j"
> > +    else
> > +        echo "FAIL: $j"
> > +    fi
> > +done
> > diff --git a/meta/recipes-extended/xz/xz_5.4.5.bb
> > b/meta/recipes-extended/xz/xz_5.4.5.bb
> > index 09eade8be0..0f0849c3e5 100644
> > --- a/meta/recipes-extended/xz/xz_5.4.5.bb
> > +++ b/meta/recipes-extended/xz/xz_5.4.5.bb
> > @@ -24,13 +24,15 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dc8ea84ebe7b93cce676b54355dc6b2c0 \
> >
> file://lib/getopt.c;endline=3D23;md5=3D2069b0ee710572c03bb3114e4532cd84 \
> >                      "
> >
> > -SRC_URI =3D "https://tukaani.org/xz/xz-${PV}.tar.gz"
> > +SRC_URI =3D "https://tukaani.org/xz/xz-${PV}.tar.gz \
> > +           ${@bb.utils.contains('PTEST_ENABLED', '1', 'file://run-ptes=
t', '', d)} \
> > +          "
> >  SRC_URI[sha256sum] =3D
> "135c90b934aee8fbc0d467de87a05cb70d627da36abe518c357a873709e5b7d
> 6"
> >  UPSTREAM_CHECK_REGEX =3D "xz-(?P<pver>\d+(\.\d+)+)\.tar"
> >
> >  CACHED_CONFIGUREVARS +=3D "gl_cv_posix_shell=3D/bin/sh"
> >
> > -inherit autotools gettext
> > +inherit autotools gettext ptest
> >
> >  PACKAGES =3D+ "liblzma"
> >
> > @@ -42,3 +44,25 @@ ALTERNATIVE:${PN} =3D "xz xzcat unxz \
> >                       lzma lzcat unlzma"
> >
> >  BBCLASSEXTEND =3D "native nativesdk"
> > +
> > +RDEPENDS:${PN}-ptest +=3D "bash file"
> > +
> > +do_compile_ptest() {
> > +        oe_runmake check TESTS=3D
> > +}
> > +
> > +do_install_ptest () {
> > +    install -d ${D}${PTEST_PATH}/tests
> > +    find ${B}/tests/.libs -type f -executable -exec cp {}
> ${D}${PTEST_PATH}/tests \;
> > +    cp ${B}/config.h ${D}${PTEST_PATH}
> > +    for i in files xzgrep_expected_output test_files.sh test_scripts.s=
h
> test_compress.sh; do
> > +        cp -r ${S}/tests/$i ${D}${PTEST_PATH}/tests
> > +    done
> > +    mkdir -p ${D}${PTEST_PATH}/src/xz
> > +    ln -s ${bindir}/xz ${D}${PTEST_PATH}/src/xz/xz
> > +    mkdir -p ${D}${PTEST_PATH}/src/xzdec
> > +    ln -s ${bindir}/xzdec ${D}${PTEST_PATH}/src/xzdec/xzdec
> > +    mkdir -p ${D}${PTEST_PATH}/src/scripts
> > +    ln -s ${bindir}/xzdiff ${D}${PTEST_PATH}/src/scripts/xzdiff
> > +    ln -s ${bindir}/xzgrep ${D}${PTEST_PATH}/src/scripts/xzgrep
> > +}
> > --
> > 2.25.1
> >
>=20
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#194345):
> > https://lists.openembedded.org/g/openembedded-core/message/194345
> > Mute This Topic: https://lists.openembedded.org/mt/103971280/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-
> core/unsub
> > [alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>=20
>=20
> --
> Alexandre Belloni, co-owner and COO, Bootlin Embedded Linux and Kernel
> engineering https://bootlin.com

