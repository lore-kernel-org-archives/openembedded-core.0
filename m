Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51341F364AD
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 18:18:29 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.35])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.139369.1775758705533941477
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 11:18:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=RYcIIffp;
 spf=pass (domain: ti.com, ip: 40.93.201.35, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tX4kbEV8WbWrx7NP1iI+j7YOXSv0r2dOsMUNs6MbX/iTRIGoEmMFcZo3ZgEhEIN04gkkCBsmKYmZnKW98u3UdAFba8yr1oF+hOkGMvbL9wWkRhNeakJVHm+B42wwov20zbnWnjInMsSuayzLQ5i302ROapc2MBAr2g8qij+Q2ub7zgV2Xkztn/GOlAbYh7CyGjuv0Tmj8Lvq7E0qp7jFo7nQBJWICHlgGGcolnMWli0b5UPc+GQS7O1frTxrP2TKSVIvkn3O+FGLTxA9rSs7VR5XH+RMJkMnLyLP3xTnBxiXITuSFXulk67qXeicUpRDy7HVkmw6LGfvBp245AR0Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tUTZRL9uHfHx7ciVRZNlLeT4JwCZnRDTXo/Gg1oHEcA=;
 b=Cn0zVFqXUzugItbzGRsYZDex6ytQXezD+Z4a9pQc3KOsmUDu6tXsxLwLGX0FRlQMAxbccPuMaVuFyN9UA6WdPRCBb+ux2x+6vQSy6c0roMbWVEP/qGiIuRaJtX5iTuSL8vO5iMKWqH+k3S+rIvxReo1l07p45SdfdByZOUvphocz3/R21tDRUUuCxScD1l1g2sfTE0b6MMOr6OAWg6MEnqckp2uz3vBji/qcj8Eq9pmDqBZ5NoOtaqLzmvvrF5kw2uTIkDcbhIRNvoEBxh5BuWj9w4GMfa0ZPFgLsgH1W0+ApxFcVl8Coz657+y7VfMg0toXK1vLy5SI1RHffswsqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tUTZRL9uHfHx7ciVRZNlLeT4JwCZnRDTXo/Gg1oHEcA=;
 b=RYcIIffpypnsQ6EkgoR3Hvemd7EYOCnrmfaWI4D2GgPfi/eidVa24n5XQmEdVW1g/qK5zYyjmcbOnRkzfIEQqVIwMhTKQYxTJ+xryid6YzExhvIyFLt3NQOQiQu1k6bcVj+R2HWHKEDtgR2TU7H+ogwyT/o43KsAA90bgQ1Tn54=
Received: from SA1P222CA0183.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c4::7)
 by CH2PR10MB4182.namprd10.prod.outlook.com (2603:10b6:610:7a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Thu, 9 Apr
 2026 18:18:23 +0000
Received: from SN1PEPF00036F40.namprd05.prod.outlook.com
 (2603:10b6:806:3c4:cafe::93) by SA1P222CA0183.outlook.office365.com
 (2603:10b6:806:3c4::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.41 via Frontend Transport; Thu,
 9 Apr 2026 18:18:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF00036F40.mail.protection.outlook.com (10.167.248.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 18:18:21 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 13:18:20 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 13:18:20 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Apr 2026 13:18:20 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.39])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 639IIKfh031165;
	Thu, 9 Apr 2026 13:18:20 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 9 Apr 2026 13:18:20 -0500
Message-ID: <DHOTX915UE6T.XUMFWTDWBO2Y@ti.com>
CC: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"ross.burton@arm.com" <ross.burton@arm.com>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCH] systemd: fix unmerged-bin tainted message
From: Randolph Sapp <rs@ti.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"joerg.sommer@navimatix.de" <joerg.sommer@navimatix.de>, "rs@ti.com"
	<rs@ti.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260408195024.1874335-2-rs@ti.com>
 <adcqUntpjuEXPLyw@navimatix.de>
 <DB5PR02MB10213895DC73E4599A411B050EF582@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB10213895DC73E4599A411B050EF582@DB5PR02MB10213.eurprd02.prod.outlook.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F40:EE_|CH2PR10MB4182:EE_
X-MS-Office365-Filtering-Correlation-Id: 9574ba49-6f9e-4a84-dfe5-08de966461de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	fVDeF49jBBIt7Mo7HwWxMcJ+zPxLUveK8y/5kU2LRz9S2z3/zL/vLBLZnbDBjFldoJXBp913/pgalXI6Sxv7eV+OAsHGC7XJ6Gc5hVVtbgf8IrNOaLrwBfux2npu5+aNKAL57MWcjAzSn0IGbGclb6HRjOyphJYyCv04IeOvh8Cq2XHFDO3fT5aVyM03msBxqUYqkyvsIG4GpuffCSXQbnttRe3XF9Xg7VfHbQYSis/NyJKDGLBW3oZe9voAIR/z+6vDRbMMahz4OzMyfuKpEuB5n4uL+T2ddo9/wwgJffr4hqn3FtkRzarW4x+O8Ekx3I95I7VWSte0uH4bb9pD6C1xKxH2UIReVoZE85QrHHmOPC1lRctKEoCj0/ezV8SRfTvvalTgZ7nK+Zb3FsZ6r8dpn9qZ0ForF+LyLJVPeqQacb3kHtpmnLsHgaXHcKLXSd/40ECHD1KmoUVYPa8sPml+KbAvSeuLx47xHHqq6PjLq9macwRQHctRN2NrvbFBffFdAdKHhnJFCC/XSIGrjHD4a0KrnXMj87gy1JcZlNML9Dy3dvvnf4ec2dNX9L3fMwmnm2qtqexQ7oQNwhS3QKzNueUfyxCOXJhhNQWbCzFdhaXIlrSgFR/RWQ6iSl5dwm7yahKeGGqk4GTPHvTC6b4YUUaeyh5LXQ/wkQXyPmyITggomdQ7rS3OxW+Hb2gjg1A5N6RFJXRmajqmq2D9WnMgfp/TFfBBjGg4WOmfynk735aN6NuSQeNWeYePg8wZYUko+dZC956NDenoes/cYA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	0l72WHxkQ9od5d58hU47vFHOvA2B3j7eWqvOQ67zxEbsCoWR1rm65BmpdDqXG8rueX2tzr703i9z7mC5dWqA7pE37G+NJSnrsp63qXLYZplrP3N9hXah5dP4wQ0ESv4SKyHD6nblGByXKzaUz5rb9rUHuRuEbnVPYeBfXdEpTPvCOzpWzUquQya2WbwXBL2sIq7MYZKNLIDPumlW8jia+zrVLwus5rzDwCHlbWS73TTmfPSbDtFg6EKRrvVWrQM8cl8UUFBqAQ+QRij91g7en7aBs4fNPalnZbea/MkBO+12I4xGPXtfp35yDrRxP4m0uf33cGL4B3t00IsJnz7Gx+raKEsRDNDKsORGPxRk+VR+bxJq5HF36/jsrD4OtWPGR1N2VstbQDii8GwCpzhU1Y9F8b9c7Ujn+NbsLly+oyh22Ky5GB4WeMjJChQurEuc
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 18:18:21.5376
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9574ba49-6f9e-4a84-dfe5-08de966461de
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF00036F40.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4182
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 18:18:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234940

On Thu Apr 9, 2026 at 2:49 AM CDT, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.=
openembedded.org> On Behalf Of J=C3=B6rg Sommer via lists.openembedded.org
>> Sent: den 9 april 2026 06:31
>> To: rs@ti.com
>> Cc: richard.purdie@linuxfoundation.org; ross.burton@arm.com; mathieu.dub=
ois-briand@bootlin.com; openembedded-core@lists.openembedded.org
>> Subject: Re: [oe-core][PATCH] systemd: fix unmerged-bin tainted message
>>=20
>> Randolph Sapp via lists.openembedded.org schrieb am Mi 08. Apr, 14:50 (-=
0500):
>> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> > index 84450386d9..29301534d2 100644
>> > --- a/meta/conf/bitbake.conf
>> > +++ b/meta/conf/bitbake.conf
>> > @@ -22,7 +22,7 @@ root_prefix =3D "${@bb.utils.contains('DISTRO_FEATUR=
ES', 'usrmerge', '${exec_prefi
>> >
>> >  # Base paths
>> >  export base_bindir =3D "${root_prefix}/bin"
>> > -export base_sbindir =3D "${root_prefix}/sbin"
>> > +export base_sbindir =3D "${@bb.utils.contains('DISTRO_FEATURES', 'usr=
merge', '${root_prefix}/bin', '${root_prefix}/sbin', d)}"
>>=20
>> Maybe:
>>=20
>> export base_sbindir =3D "${root_prefix}/${@bb.utils.contains('DISTRO_FEA=
TURES', 'usrmerge', 'bin', 'sbin', d)}"
>>=20
>> or
>>=20
>> export base_sbindir =3D "${@bb.utils.contains('DISTRO_FEATURES', 'usrmer=
ge', '${base_bindir}', '${root_prefix}/sbin', d)}"
>
> This one. For the unlikely case that someone modifies base_bindir.
>

Fair enough. Any other comments about Richards proposal to remove the usrme=
rge
distro feature and merge that into the systemd distro feature?

I personally think that a non-systemd environment could still benefit from
mimicking a filesystem structure most distros currently ship, but that's ju=
st
me.

