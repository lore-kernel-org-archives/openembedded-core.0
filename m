Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABDD0F364B1
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 18:43:59 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.139874.1775760235973450634
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 11:43:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=MET87FNp;
 spf=pass (domain: ti.com, ip: 52.101.56.41, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pD0DXVW0A+HXWk/cx7BinB/Vnbi78rUE5jlv6WgIZ4D0hpLhOEapiG/8gnU3kjAhnsM7NT+6U1Po7EBn/SrqWjVBL1v6zpVwIeev1o0TL7Rw9t/mmXEo/aX7yiV9/EKJV5pb5TSj8qpS0gp6BrbIuLkgk9Le7Avb+lFCsCY87kSo/0SD9q2QNcpgrmhS3cXGh0FP/VHOx48EG+yCpUhsx3Zzk4jWPXOBHOUOhyZ6D010NN6f0/uTD8qV+Na8hnBPJcNGsLKD8w+KloYpDdhFdhROvL0lwYEuuOCaL6S6GeaHWhVjJrFTbl6L0GKN/wsDoh1O+v84U+KVm8EuumUZEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMKApxt6Za+MpA8pebcOMeJcWMexMYZdbgeZaDvNHng=;
 b=toQDLsBVwK+zlmrW97normBOe3iiFNMgxYaAbcOoPdfEzeX3TSFTQEwq5LlxyvVrYQSNrxjzua0Qv46Y/MB7OJN33C5xrnlvYqCflYCbmJTbDwX1T33eizPJwJH5pKug/GVSD7UVPHO4QknwUYp1z5e0lBnJaNQncoodpqQ9iAuRqyO6SnnO4sJp15zrZdHlZjOX1PcOWDspYL1WPhfF04bM5Zeqh6D42Ks3YNet+y0qYi36zKWQnfWNdfyuJGG1TyrBKIclSpd7e/G+9IAtrdQeBv8FvxpD0hZIs4xRjqukpEZXzeWK5N8NIJXhPbeT3fMA6dCROh6e9YkwWFyaBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMKApxt6Za+MpA8pebcOMeJcWMexMYZdbgeZaDvNHng=;
 b=MET87FNpsWpnjz6ONBkQB8JnCS9wovWnsv+ot8ziGNVzCOfAA6MJR1PDhF2b/3rh0KZDFBml799AqcqB51jhJnHNW/smWe5ACQQ4CoWC37ND/S+mIeNavdGw3TfI9pztQhGP1GCHD7Ne/ugajnDrkGgOz13DRkOTxahSQjwb2Ds=
Received: from SN7PR04CA0229.namprd04.prod.outlook.com (2603:10b6:806:127::24)
 by CY5PR10MB6141.namprd10.prod.outlook.com (2603:10b6:930:37::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Thu, 9 Apr
 2026 18:43:51 +0000
Received: from SN1PEPF0002636E.namprd02.prod.outlook.com
 (2603:10b6:806:127:cafe::92) by SN7PR04CA0229.outlook.office365.com
 (2603:10b6:806:127::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.42 via Frontend Transport; Thu,
 9 Apr 2026 18:43:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SN1PEPF0002636E.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 18:43:50 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 13:43:50 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 13:43:50 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Apr 2026 13:43:50 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.39])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 639IhoK23069073;
	Thu, 9 Apr 2026 13:43:50 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 9 Apr 2026 13:43:50 -0500
Message-ID: <DHOUGRY2C4M8.TNYH9AOQ1UCA@ti.com>
CC: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"ross.burton@arm.com" <ross.burton@arm.com>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCH] systemd: fix unmerged-bin tainted message
From: Randolph Sapp <rs@ti.com>
To: <rs@ti.com>, Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"joerg.sommer@navimatix.de" <joerg.sommer@navimatix.de>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260408195024.1874335-2-rs@ti.com>
 <adcqUntpjuEXPLyw@navimatix.de>
 <DB5PR02MB10213895DC73E4599A411B050EF582@DB5PR02MB10213.eurprd02.prod.outlook.com> <18A4C3228BFBCFA6.777565@lists.openembedded.org>
In-Reply-To: <18A4C3228BFBCFA6.777565@lists.openembedded.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636E:EE_|CY5PR10MB6141:EE_
X-MS-Office365-Filtering-Correlation-Id: 084b06ad-822c-43b3-a70e-08de9667f170
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	iCtQHQZR8iaBY1zOpWN718fDDK0LAZKiHyeO7sAN8WKFFKJREduMm4xO2KsSl9hq9EcwsFVw784Ug4uK0MXXkEISICpiNm+AHL6YZ+BXrKr8IbyBawQYfEU9R+Dldk8Mj6mBpXZO5amwDP77HdeRzWR/hM7JNoZV76ts+0ErY94jk9LXpX7CnC8/hpi4jgpxLLzXhkWhJOEGoOjiD3/WHeurAjhTW8vwJc0bkF6x1HxGyU2ksW0kAmWDpk1RwBdzrlFUpPnt1rPk39aFsXP72y9MzMCVpOqZWY31GtOHqzKv/lMThKCT/rs5co9ZPcOeIWTpLJE6T/5CMO7s+/gIOHVKfqQCAxdhV0vKY7KXvXNN/l6iDQvEL4eSEND3atpq4u55P0lBfzR8jjgW4JUP+lyYw90NfMj7hMuFvWBgm7+uVeIY9ZVCdcF8E+5BlpAe5gNgSe2GXGmtCGQ7dmgNAmpl7sImEqloz5tsXvX6nIhoGMLTzpIrDuG5q6lTLRkuJcciDkTx8YYMTW9IVOGNcq6xNaMga3Xmccl37JfHtZYvluc23PEX18VY+t77emgTN0z11vx2SkMO8qCJtI29hXE5H9kgvYQ9AT72VHgx3JmKpBIMaZIafaqpg091+IvWiVUg6KC2kKXThjcKcvROYdk3qSwJIpTMUzb+t3wpFYGVMIUODpf833lliEVh3nETuk5hCghlf1+QnxwC5CDPT7CtmMFKB99tQVaKWZIw8+G/3zENq0fjfQM9Us53Fxb6o5Hg4IfCoi5bKG0q1DgWJQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	P1etpemE50P+OyGwEupKKcO9wePFlQ6PxWt56JP4KMdN8rV3VDAzWWXlRb+bO5f2CI/fCNGOmlSrCXUGnSam/ywPpGdfcbSOzC72+HmWlsF7KhpN9knhyJ0Qgqudup+JuLCiR87phNvAEYWLDAtfrcmQgVDD9esPuKxbvOoGFHJapbWu/onCeTa762w5kYBzJ3v5Ao6+aini8WHbEM3dSZrgyvGA04TM8PWfW6+qFeAcDX+0JqiJxZ83SCN5jrv5vNpg0upOlALaBPcmr6Fi1dGF2Wx+/NNJ6h+55RQw4U0c+Um5UA7gK16EgKn6tbtsT0Tfzs19lD6gRW+5ZsBFnXf/QVgAHgqFoZon8+AmQLCHtE/gsKlfX98I7f3jYxl1t6R8n4tKNdBKEKjPvVb8azOcmu2G2sqfSARAwKtUTxdRNOzMHvoIGChhKqW+9tAR
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 18:43:50.8992
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 084b06ad-822c-43b3-a70e-08de9667f170
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002636E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6141
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 18:43:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234941

On Thu Apr 9, 2026 at 1:18 PM CDT, Randolph Sapp via lists.openembedded.org=
 wrote:
> On Thu Apr 9, 2026 at 2:49 AM CDT, Peter Kjellerstedt wrote:
>>> -----Original Message-----
>>> From: openembedded-core@lists.openembedded.org <openembedded-core@lists=
.openembedded.org> On Behalf Of J=C3=B6rg Sommer via lists.openembedded.org
>>> Sent: den 9 april 2026 06:31
>>> To: rs@ti.com
>>> Cc: richard.purdie@linuxfoundation.org; ross.burton@arm.com; mathieu.du=
bois-briand@bootlin.com; openembedded-core@lists.openembedded.org
>>> Subject: Re: [oe-core][PATCH] systemd: fix unmerged-bin tainted message
>>>=20
>>> Randolph Sapp via lists.openembedded.org schrieb am Mi 08. Apr, 14:50 (=
-0500):
>>> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>>> > index 84450386d9..29301534d2 100644
>>> > --- a/meta/conf/bitbake.conf
>>> > +++ b/meta/conf/bitbake.conf
>>> > @@ -22,7 +22,7 @@ root_prefix =3D "${@bb.utils.contains('DISTRO_FEATU=
RES', 'usrmerge', '${exec_prefi
>>> >
>>> >  # Base paths
>>> >  export base_bindir =3D "${root_prefix}/bin"
>>> > -export base_sbindir =3D "${root_prefix}/sbin"
>>> > +export base_sbindir =3D "${@bb.utils.contains('DISTRO_FEATURES', 'us=
rmerge', '${root_prefix}/bin', '${root_prefix}/sbin', d)}"
>>>=20
>>> Maybe:
>>>=20
>>> export base_sbindir =3D "${root_prefix}/${@bb.utils.contains('DISTRO_FE=
ATURES', 'usrmerge', 'bin', 'sbin', d)}"
>>>=20
>>> or
>>>=20
>>> export base_sbindir =3D "${@bb.utils.contains('DISTRO_FEATURES', 'usrme=
rge', '${base_bindir}', '${root_prefix}/sbin', d)}"
>>
>> This one. For the unlikely case that someone modifies base_bindir.
>>
>
> Fair enough. Any other comments about Richards proposal to remove the usr=
merge
> distro feature and merge that into the systemd distro feature?
>
> I personally think that a non-systemd environment could still benefit fro=
m
> mimicking a filesystem structure most distros currently ship, but that's =
just
> me.

Also suppose I should apply this to all sbin related variables in this file=
 to
keep everything consistent between the SDKs and the actual rootfs images.

