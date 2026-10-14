Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4D69C3DA7A
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 17:18:08 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19633.1791998282650976442
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 10:18:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=dfyTF3Y9;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=dfyTF3Y9;
 spf=pass (domain: arm.com, ip: 52.101.65.32, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=WmkEYrCCWk+SaEcqxZOrw4B3VgsNqBElYIP56i9WwkQANowsxB7mRuGxSY+5MnHZw+GVJ7Y3/RnCVtD1f0h2kdPj1cmYJEuNDOWIjROyNZjJJxlNVFkOmny0DGuCokBuzjtqnp9DhnlcqFZ7ZHUTyPkVdfJd+VPdyRnJ6Zy6bnaY70W8x3NvMzwrB7ouwnznknfW3/1cEauS0WSP+d/wqYsUoXa9d30IT64/8tfVXM+FjB48O0PRq8mSSDAOqhTZy+oxZfIvhsOc0xAQr+KmJ8NT+o93OLsgA23uJaG3ek44SzsAHhiejE+V/1GOwteqaGE/neOkFLspqdKC0LIGIg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wS/e7dO6I/KMr7aIA5B/4JYWTjiy+CISCKk3k5C3Xk4=;
 b=UvXOldiOCGFBI8N1W1prGXr1ZsihTKMObkRPNtAx+D+QxFUVxtGu2BD13QHmU7GFNgaFTqqEs0D+kJiVQaNzcRK+QPagzRlf4o1BH23ENJM1vFG5v8PWI4U3KnFIq6V3xuqwznMy2U3sfixwbbmFUq/z9YtOtHOMEd5t/BU80q5GBmMCHqUuROXJ6LSeDjYOMqDiSsqB4AFGmrYCSg3zbIRheZoxDqv2hY0Azs7T+JP2vUGFKc95MqmB43CGedJ79V9JqfcaV4BdMSVLUnrkHUX7HXIQ9xMj8QihPz2wptzQIsMxatTn0sSOuu9dAGXrA7fzYee9sbDkchAkpf+0Mw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wS/e7dO6I/KMr7aIA5B/4JYWTjiy+CISCKk3k5C3Xk4=;
 b=dfyTF3Y9uMssErlmgyynHO+O+A3sPxU4tVJA97E6/ImsCsexp4Pwxtu0osyvvFNzPnPD4np1cYiZnYawFM75JmTMAQ3+agsXzqr4E4wxaYiT8CNDf7vieb+7C4diQuFYHRiHPQJdFAWXgDmAXcgHPcxdYwv/zgTnqLXmYgWb4Lc=
Received: from PR1P264CA0068.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:2cc::6)
 by GV1PR08MB8741.eurprd08.prod.outlook.com (2603:10a6:150:85::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 17:17:54 +0000
Received: from MI3PEPF00008494.eurprd03.prod.outlook.com
 (2603:10a6:102:2cc:cafe::4e) by PR1P264CA0068.outlook.office365.com
 (2603:10a6:102:2cc::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Wed, 14
 Oct 2026 17:17:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 MI3PEPF00008494.mail.protection.outlook.com (10.167.240.155) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.6
 via Frontend Transport; Wed, 14 Oct 2026 17:17:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nasQoqTfftE7Duuzlni/ODg4RLmyuIgJ2a5NY7tFh/+4AvzfRPm2D1vaLI1jxqHrodSnaOT+RO/LORKB8SeEtzA1uJe+EDp9jk2+2qPFSFSAwwEyZIk1BvzBOMPOnuEtS6IYFqpOKH2Ltod+7lRRw3UKPriT0cNXbDuRojaU3YsCbYTxh3qxTvK3Bmo+xmqcrJyDY6+q3DX1mmTjJmdwe/0TGKdfwuvgDvfpt7MG6ce8NNXcf9YKTUTovso6SVbLq7lk9+7iWLvrPdJKtdrYzPWY9HS/RG1bu3QW3f69IZsdsngSDurPokIgkjwiRf8VDvz+5EkIbly2B7Hy3lLAZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wS/e7dO6I/KMr7aIA5B/4JYWTjiy+CISCKk3k5C3Xk4=;
 b=W1J3yQi2VknzCLj+WNwG3RJG6KTSCAucJvguWPbuAk8bsVzw6mn99bneOfr1UM+zRL7Xl9E740eOgH3RYlNt35cbzqoLuooxQqQzslRAbXy8YUYaegbxfh5EUuzrvz4wn34QbBd7Hw32eXiGBK5Y5IERf6AttxAC5XwiKjaLn/DjEIyTTxkNisSnkmGB494G5y4oz0yB9l92SN65lWO5GweDAAFZqsmKojGdBm3BaP+NqjrY9Okik09lWp8eJAwaDR/46YLEapjsetyuakEQDcs7++xdwXGLO7SQoiXS8FXyG/0IUHF4Xc34SOKNeO+n7ajEDG/k9rE0Ebp9M4ioNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wS/e7dO6I/KMr7aIA5B/4JYWTjiy+CISCKk3k5C3Xk4=;
 b=dfyTF3Y9uMssErlmgyynHO+O+A3sPxU4tVJA97E6/ImsCsexp4Pwxtu0osyvvFNzPnPD4np1cYiZnYawFM75JmTMAQ3+agsXzqr4E4wxaYiT8CNDf7vieb+7C4diQuFYHRiHPQJdFAWXgDmAXcgHPcxdYwv/zgTnqLXmYgWb4Lc=
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com (2603:10a6:20b:5a9::13)
 by AS8PR08MB6310.eurprd08.prod.outlook.com (2603:10a6:20b:292::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.7; Wed, 14 Oct
 2026 17:17:20 +0000
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb]) by AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb%5]) with mapi id 15.21.0522.011; Wed, 14 Oct 2026
 17:17:20 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>,
	"vanusuri@mvista.com" <vanusuri@mvista.com>
Subject: Re: [OE-core][patch] python3: upgrade 3.14.7 -> 3.14.8
Thread-Topic: [OE-core][patch] python3: upgrade 3.14.7 -> 3.14.8
Thread-Index: AQHdVwOq0F6jJlZMqUakWhdNdSrGZLb07/yAgAg8NYCAACV3gA==
Date: Wed, 14 Oct 2026 17:17:20 +0000
Message-ID: <60CE1C5A-B892-472C-8F35-848E8D0C4791@arm.com>
References: <20261008090135.1485765-1-vanusuri@mvista.com>
 <DM070UI0TERG.1A3WINVYE19HJ@bootlin.com>
 <7E3E512D-59C7-42EF-896C-257A336EFB0D@arm.com>
In-Reply-To: <7E3E512D-59C7-42EF-896C-257A336EFB0D@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS8PR08MB9410:EE_|AS8PR08MB6310:EE_|MI3PEPF00008494:EE_|GV1PR08MB8741:EE_
X-MS-Office365-Filtering-Correlation-Id: 130c478c-e9f3-4cec-ea0e-08df2a1714eb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|10067099003|22082099003|18002099003|11063799006|4143699003|261009223027099003|38070700021|56012099006;
X-Microsoft-Antispam-Message-Info-Original: 
 +dJqOzVnGvV+5Zdet3ms6SVO5eyc7lZb7iMkrdAnmAfKtZox1+2vc6FjF0xhZLALtHj/rpUMyZ9uaam8jDYLUhunaUtAvqSA56X0i1hwjwMkqRaFbisXSmTbewUoqfuUnB9CPitYmP4HkepDvly61DLZp1OMXEukJ/keXfSlorM7rFaXWtCX9DJonVDN/0pFl4QAO84D9ZjIV4P+0uVu9mRykoB/Yj07WFVVqQ87vdS19uOYra4aeonYKT6uvtCJlfBTk1/ZT5uQnMLlMLi52k9X2BlWj0lRGAfSpl8frJkmuwHj9VJdHCJ0HHkfXZIXkd+Dj29cWbOfiSPB5YysIIWXo3ZNsfYODz/jdxIEAeeTyOew0ItE7L7epQwWSaUC5t+jtC/NWs4IgROgkupSVgXlScfO8E0V/e8wAHjP990/Aid9jeGFymx9mI9F+DxXSadt1pzhhizuTbxXkRJRKOkHP6y3XWh1LBxzSWAYR/cVeL3E6FFCYZAI+FrMmTbCkmXoHOFhir9q4V3beTMUXlj9knNbLtskayspWpL3KMBMtws3wOSHVg1Y2Z6rw/qTpxeKCtyj01YBl5WEmvlLtcid56C60w59HlXBxGcYlDeKDD5/QkB0yHWqmSMXo7w5LDqzqCxaxUqlLhZWkTFHPHj7PlfoKNwWrMbJv8I+0iZtmngKKblVzCPxhjarLpTmB2rpIeY1pDTfFYcpj3/UEBnZtDEmi5wGrMZbxVqP1zk=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB9410.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(22082099003)(18002099003)(11063799006)(4143699003)(261009223027099003)(38070700021)(56012099006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C4CDF89A594C4C419CA5218B217C0583@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 yshEwo5mc9aRFonsiU02bRvnP0wRlPnbMgnn44EUxiC9/T3Iuux2BduHiawDJeXfKOA53EK1Yu43bl7mhqJviA/uDrlTcaPtvS29F2NeUsXKisRNAtfzneUcthp8oYBVHnLvCuCEjWm0Nwx4j7G7YdZz6kTWLx3yaw+RGLB9S3B8qUZHRZMt7uCUrw+/dkNSzkrOlxM0xIG9drcRzYUgS+tYSYuYYWZtoDWyiH3G4imM5vaNlTtAm9cEK6i80iHI/Q9SMpsCbWhN9Q8ApFTjK3SKC6+wpsVoh2ecKbDK+quFFp2fBwDC+9+FZB359zuidiyLEVX283y+5ejolOvSSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6310
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 MI3PEPF00008494.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a2e0131a-d2de-4f21-9c5e-08df2a170184
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|35042699022|1800799024|14060799003|10067099003|22082099003|18002099003|13003099007|4143699003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	4yZeC7BT9WzlycfmQaRKvIVWMPjG+tDXE9FAVxKGbfG3Wzk8rud3M5GNodSHnsYbrUBLLbWXkqbVJfrrjl2xrtk1nODSejI6o8eFsg08I7vN7S0jdtoG77RTUBPfbyETe2OtRz+U6xwT3zwmqZogwBWjgcwcwmAdpYc8vC45WUZdIpCxb+B4J89HiP2iuUqHn4Lht222pU6yNdDCvNDhosVYIXCQ/QqUnzhj01hFjdv2yQwhP+WpxgZyTlhmAxdJTCl2r4ecVezYnM65jUq3UtgkbbZNYwbLzg4hVgQunRjMSm6BNn0rLTk4s3jkegseP9xyl/2IUcpDJCxci21rPcC4/XrpmXxGgbWhpYxizGQx7zeFsi/ry4pH0i0Vvlix+rvojfW2XWKe1KlaHEKnNuey32v0fWF2G9jqGKnPzbuvLvyNXTv3acwn+AZk83jvdzLRXrnoFldq0KkR8vUL4uG+6+XNPmPnbYU4TbKXpiG/Tgo20YcqCWgWcBCb2ALU0846uopFc/8sx7/CnpUAb5R32ZEB64dqyQxhR9KzPvqj+9yjEcBsIlqKYUqvILlPNmZyt0D0yESA0Vu0CPMBg/CUFXM3yLri1okRRyXt81RFTtb3pRxEtxJ0YvwQPOdike5wBgJoQQvij2rzFAl3Vbz1WXS359FQxz9iCx/jssEHAyWDFxv7YLSGRYhUHEQk7uydovGUIeaLtshB+Y8zhw==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(35042699022)(1800799024)(14060799003)(10067099003)(22082099003)(18002099003)(13003099007)(4143699003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	d3jekXGtNbMfBBsAdQnOPM5Uk63iO9CeNxXcn/dQ/dphU2clw2ub4G1DZU+rl+gk2mn0yhCKsyUkj/NK6+J083+s0zJp+zSJd6EZF4XhH7/9zklXJPtxMddZrTZzJZrdGs8GMOAXFENr41icrLmSFrX8COq2vgtUtt0lOMR+rrSSrxhjclmPmfRCCeLT0lMDwvlHVclySVcL8ZgRg3brcHg8nny5c0G0yv5RceD3IiS/hzGsnO8lOduWdjxeNZtDlfXF1o6ccHHQxUqSMYWo1a05Fyp6npbQi22ALlKnFgjk+B5rUiVDxIIOwONibIepj2c0dMZLHo7L9bvasP/eoqam2tJtc6YiIW9a9ycCfOlYi1o8ZWyiRcgj5Ktv3M35ll84sPAYBBpIdvPg/6RmNICDohipUGHce1kwIuAyWdcLnvNWTpB26iAGWzqcGNcP
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 17:17:53.1701
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 130c478c-e9f3-4cec-ea0e-08df2a1714eb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MI3PEPF00008494.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8741
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 17:18:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247792

On 14 Oct 2026, at 16:03, Ross Burton via lists.openembedded.org <ross.burt=
on=3Darm.com@lists.openembedded.org> wrote:
>> Are you willing to investigate this further? We need to understand if
>> the test is failing because an issue in python code or because of a
>> dependency we are using in oe-core.
>=20
> This is probably related to some libedit fixes that merged upstream, in a=
n attempt to fix tests that were failing when libedit was being used:
>=20
> https://github.com/python/cpython/commit/e87da800b6103fd890841688da48e41e=
211be7b9

I replicated and filed https://github.com/python/cpython/issues/159424 upst=
ream.

Ross=

