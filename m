Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 274F4ECAAA1
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 15:21:52 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.73])
 by mx.groups.io with SMTP id smtpd.web09.10441.1667229702450226088
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 08:21:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=pM9LRQ+a;
 spf=pass (domain: arm.com, ip: 40.107.104.73, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=bKJ7gH5lkFIF+L2UWhXcVsvJ0Wmj/1JM74O9HVyu2ND6Bp7yWb6IJBCb5cerALbokwz36R0Ky9xn3Lz2JKEfdAuhd/5neMOLmR60f68zZ0L8XrhArp/+R7b1umQbD0vH/H6GVLAi1rFvnJm6ijh5Uqu96ttqlDvlyFKF3AZoniLT68wEPDaA8eHJU9MPf67sxwvmgteiFp0Va1poAzGDQh5oRUaHUfs/S0XcnMlKfdUF9TyWoAyRfj8TYKUjeUkp4wselUMpGdN3FOXxs8jEPVvXqQrA4jxW0IGNyDkvJSOs2VYQgvaUyI06HV3ENYtOMvHw8YWLNbKOiXNAyWgong==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JjFwpT5hkc18EIx/76kLbBsd11Qy8Vxf34e5KpBb+Z8=;
 b=kQqfnoZrjKOZI89WDdY6yS12kvFNI39bXYAvUu5Rk/cLEnlaMETqdFJop7OwO1K3yfT4M4jbl9pB0LKLGlx8SDwGo5Fq3VIK0mc9XmL35rutvS1HnWNUPKyzkVGxhJB8lctxY+IxKX+5RF6cz6HN/cj/efiIrrx15drrlZy+AhNvovxg5rXGnQUBsimNHVM3HUdca2SxPCb7o4Igx6swfsYLjN4m8eKqAYLgtJTJgL5vt4jgf1H6IaFbsOr/lRH+4CmUCqWb7f7kCrqTMapSHo0vAw/EXmh26Xh0sDxQGI4aNEredz2EWhic+oT9XtnZ2FMLroZUNW9MF831Gm/DAw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JjFwpT5hkc18EIx/76kLbBsd11Qy8Vxf34e5KpBb+Z8=;
 b=pM9LRQ+a6eR6WC3rYTXTiXO6ef1mVcMwwhKbJWBBIy5+MSBn4oETW3SclNcxNEuqPjV81W8m3VsajXTDcJ68c1QN3bUJDrf/6jOWI9dF66ka/xSbjbSEZDSA6biAv1i3yB6Uxi1c1eVXQ4wJDbkL7mNRz3I9PsRvzzOx7MTmKy8=
Received: from AM7PR03CA0005.eurprd03.prod.outlook.com (2603:10a6:20b:130::15)
 by PR3PR08MB5836.eurprd08.prod.outlook.com (2603:10a6:102:8f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Mon, 31 Oct
 2022 15:21:38 +0000
Received: from AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::95) by AM7PR03CA0005.outlook.office365.com
 (2603:10a6:20b:130::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.14 via Frontend
 Transport; Mon, 31 Oct 2022 15:21:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT005.mail.protection.outlook.com (100.127.140.218) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.14 via Frontend Transport; Mon, 31 Oct 2022 15:21:38 +0000
Received: ("Tessian outbound f394866f3f2b:v130"); Mon, 31 Oct 2022 15:21:38 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3b61ec14041c4ff2
X-CR-MTA-TID: 64aa7808
Received: from 58c12b23d7ec.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id DEE304CF-B034-496D-8DC7-8B56065602A0.1;
	Mon, 31 Oct 2022 15:21:31 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 58c12b23d7ec.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 31 Oct 2022 15:21:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RRsxwORXcCb7+BO0CIptkAlhlg0+lffCQ6S+qNYDmyZ0Qd1ynSGMPyz8EN/dRux1rD5jg85hh7wsS+zzzYZgz9FOANKCcgnHkGEZlO2pHNKxnHx1jG25girREChOOAfvRZURBaKDNQeMK64M9DCKiF24humNlZ3GUSG/zBw1IiajyJTuDicG6daCmRUZRQCJsCYJ2XW4a5q4PPnz7EEfgcpqcFHABypbUg//Kf3JbQUB6RUaYAD/FUXqJXb4dnetf26rBebBlh4R/3BOWlnOKmEMdWXqjoSj+FE2ifJCCoX0Ge7I/cDqZiSCbRYRWC9v6crtXOJCAUN92ghQA8EUQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JjFwpT5hkc18EIx/76kLbBsd11Qy8Vxf34e5KpBb+Z8=;
 b=OCcBc16X3UuMJfNMRQmKjNpqF1b7h+8wWCH/QlAB+Qe6yZXRtjWwN8Vx9Q6moh18mxvnHRefsM1hCjAxjtpT1Ikt8cyg+SRGX/9DjC+VuHMMin3AYmpPfD4awegoAO4mJhmCauqEitnMwPT5d6BJMOJsR7/7apF9erZCLRzKwyaPm06Nf/to8e5AbQPjBeN2mxT1CG/s7ftJGE40yXR0JpS6KmK6c3SsM4qsGwD8mNbsDDjg2we1mzLwBf50WMmP1q8mJHF3/Hy/VAzCjQovJ+KmZsSIWa2JM8EKkj8cyHGoKlQea0Pd8KylGu6SJjgph3NXgoZDCsG6W/l9LzrjiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JjFwpT5hkc18EIx/76kLbBsd11Qy8Vxf34e5KpBb+Z8=;
 b=pM9LRQ+a6eR6WC3rYTXTiXO6ef1mVcMwwhKbJWBBIy5+MSBn4oETW3SclNcxNEuqPjV81W8m3VsajXTDcJ68c1QN3bUJDrf/6jOWI9dF66ka/xSbjbSEZDSA6biAv1i3yB6Uxi1c1eVXQ4wJDbkL7mNRz3I9PsRvzzOx7MTmKy8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV1PR08MB9938.eurprd08.prod.outlook.com (2603:10a6:150:87::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Mon, 31 Oct
 2022 15:21:29 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::52da:ac9d:e42d:8cc]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::52da:ac9d:e42d:8cc%5]) with mapi id 15.20.5769.019; Mon, 31 Oct 2022
 15:21:28 +0000
From: Ross Burton <Ross.Burton@arm.com>
CC: Openembedded Core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH][langdale] expat cve
Thread-Topic: [OE-core] [PATCH][langdale] expat cve
Thread-Index: AQHY7TxXmwGudhuGPEy9MZFWUFqf1a4onmAA
Date: Mon, 31 Oct 2022 15:21:28 +0000
Message-ID: <B7E781F2-5434-42CA-A712-1891BE5800EE@arm.com>
References: <20221031152024.156713-1-ross.burton@arm.com>
In-Reply-To: <20221031152024.156713-1-ross.burton@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV1PR08MB9938:EE_|AM7EUR03FT005:EE_|PR3PR08MB5836:EE_
X-MS-Office365-Filtering-Correlation-Id: 37b3f083-c036-49ac-1f16-08dabb539b22
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 qLwHhLG7eEngWgYm6qbZK+dMyXb9ZDD2/Wr1bwFxGM/MVT6QTP42Ztip7BlFE/+ivxpnEl5JD3VyQuXG0kFqthBX4XmU7Er2QCw/JvnRNaHH+AD86kHHcxMhdkHWbaVzs+i01wjwy19jImo6fkGogoBtnnwoDXW0yiA7SLfuyEgZKojCkBEwCJoJ87LI7HddlRC3PJKIzgQsY8eBS9E1OdYRnbpERAnUaBl0mbfYPNZImDQxkE+o8u9tBrlPBQx6IQyCaQ/g9cyW7vF/K7xQ3IZSDJaSVh6/9vGJXoOMTBBs8tiLRSwc5rpPwKqj6s3llN6o1fXbuWUidPJmogSV2jar0sxXoyhfPE0Wged3Z1YoqZ19pUZyZxJDO4l7pKJI6UKH/+hh7rbsj/hjgRqije04vfuWzVTjGLc07/ck5iMja1MzR5JxKIBWtyrEA+UQaql10gS+3y57twE8wZb+LOjAXcnHZVhNeDdmuLQdQF9JQwgg6WKmds20ePSIDWB5Jlupk6U0U5/kVw4sLDvxnC4B3oWsbznnHft9ZarD4SnvCu8iosWKgJbOStorjSDsAbl9w5ZcbaW4q/QY693dHH32XlKcgbMDkCQVWDg2yKLYA/ovRH1gKhsQHEn4Kzc+Iy1p9QyCGe602rDqcnkVDWygJI1XL4caOPL8CNSt8s+C1qNn21Bd1whb+sbRchqSvrNOa/wlQE7ZoL93GrGFcZFExoxfIqPgNCx17+uoTCZ07D0s8+7ceURyUYzDA9IomkE2QE/cXBp0Oe5nF1ch5CFRshwGeHFmQVIK2QpaOm0IwQ9TBzlPE4k6vVQxtXT2DaXpoX05uy9Qd0ex8ieFGQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(366004)(346002)(136003)(376002)(109986013)(451199015)(66899015)(2906002)(5660300002)(8936002)(41300700001)(66446008)(66476007)(4326008)(64756008)(66556008)(76116006)(8676002)(66946007)(91956017)(478600001)(38100700002)(966005)(33656002)(38070700005)(186003)(6512007)(26005)(6506007)(53546011)(36756003)(6486002)(2616005)(71200400001)(122000001)(316002)(86362001)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3B13C69887F3E049AC9A1190A34AC4D4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB9938
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b9146259-4122-4a9c-abac-08dabb53950d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6Ly/8viMYYQc5I5s6gIJ1XDci0fbevdQpoNDU3FfpClmz7rtkBVYNuY0OujoIykaXDCnHhzWOaDMyXFznaqkO7gX6SNBGS6KIKQyxiQ2Grng3eqFhgtXz2aEWBE3hvLH0rf/uuIldCyUvkIMa0wDnepDGFVwqc2c2lsva1WX7+h3SjKD/kZ2qbXGmGfieoM/KuFzXu30HmZARUESPFG2MDoHskMSfTikclEycPrsRbZoQ/wCZVLwYJ6HfaE4POH6MLDo3geBjrpkXfHa9VdHLIM8g/D+2sur/LLM2z7ytoQYS6QBb/uPRXP3rZjlUgS88gVZgAaeYcFv4CeeLJhh3ZAuVp3q5aWMem80dnCCLIQ3LSS4AqEKS3QcOG3stlAk2mI95Sl0II16AoI4Jdg8YKo5cBmhXKOsKgmsgpYrv6Zh1uc9498xfhFACYv0eA9VFyqJ3GPx07nHUPGRAgjR5U4hBkacXdXunbNHqOjhGgu2SHfqesD6/ctOVfNYtGDyWZW8bXRvYWUc23QCSLmCYNsZmohTDocROj9mfc2DndqhQtRPH2VUZ/3U5cFFS3XVVVmkHAG7WK2h2rqks3d9jAho0ipQAEhlx33nWHcONHR78mszFQKZ5RgeSWgzJBVl0zs7+Cxv3qRIAU7PxP0SfcT7+GtRguDQkqIx+yIYw/dfPazPR6CUwGqVk/LER8CxrWElOvKfz66udGrqvkgGvc6tMj2r/GJ3b40pWzj5HhtO68JG7hktiZ4aH84uJ8uSBNYsf04vfyFol+7fQCxbs5wKVZktgb23G1QYiQxwhVk=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(376002)(346002)(39860400002)(451199015)(109986013)(40470700004)(46966006)(36840700001)(53546011)(2616005)(82310400005)(186003)(356005)(40480700001)(8676002)(6506007)(4326008)(70586007)(70206006)(81166007)(40460700003)(33656002)(36756003)(316002)(5660300002)(8936002)(86362001)(41300700001)(26005)(6512007)(966005)(6486002)(83380400001)(66899015)(336012)(36860700001)(47076005)(2906002)(82740400003)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 15:21:38.5105
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37b3f083-c036-49ac-1f16-08dabb539b22
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5836
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 15:21:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172322

Ignore this :)

> On 31 Oct 2022, at 15:20, Ross Burton via lists.openembedded.org <ross.bu=
rton=3Darm.com@lists.openembedded.org> wrote:
>=20
> ---
> .../expat/expat/CVE-2022-43680.patch          | 33 +++++++++++++++++++
> meta/recipes-core/expat/expat_2.4.9.bb        |  1 +
> 2 files changed, 34 insertions(+)
> create mode 100644 meta/recipes-core/expat/expat/CVE-2022-43680.patch
>=20
> diff --git a/meta/recipes-core/expat/expat/CVE-2022-43680.patch b/meta/re=
cipes-core/expat/expat/CVE-2022-43680.patch
> new file mode 100644
> index 00000000000..76c55edc768
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2022-43680.patch
> @@ -0,0 +1,33 @@
> +CVE: CVE-2022-43680
> +Upstream-Status: Backport [5290462a7ea1278a8d5c0d5b2860d4e244f997e4]
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +
> +From 5290462a7ea1278a8d5c0d5b2860d4e244f997e4 Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Tue, 20 Sep 2022 02:44:34 +0200
> +Subject: [PATCH] lib: Fix overeager DTD destruction in
> + XML_ExternalEntityParserCreate
> +
> +---
> + expat/lib/xmlparse.c | 8 ++++++++
> + 1 file changed, 8 insertions(+)
> +
> +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> +index aacd6e7fc..57bf103cc 100644
> +--- a/lib/xmlparse.c
> ++++ b/lib/xmlparse.c
> +@@ -1068,6 +1068,14 @@ parserCreate(const XML_Char *encodingName,
> +   parserInit(parser, encodingName);
> +=20
> +   if (encodingName && ! parser->m_protocolEncodingName) {
> ++    if (dtd) {
> ++      // We need to stop the upcoming call to XML_ParserFree from happi=
ly
> ++      // destroying parser->m_dtd because the DTD is shared with the pa=
rent
> ++      // parser and the only guard that keeps XML_ParserFree from destr=
oying
> ++      // parser->m_dtd is parser->m_isParamEntity but it will be set to
> ++      // XML_TRUE only later in XML_ExternalEntityParserCreate (or not =
at all).
> ++      parser->m_dtd =3D NULL;
> ++    }
> +     XML_ParserFree(parser);
> +     return NULL;
> +   }
> diff --git a/meta/recipes-core/expat/expat_2.4.9.bb b/meta/recipes-core/e=
xpat/expat_2.4.9.bb
> index 9561edd84fc..bad1a96fdee 100644
> --- a/meta/recipes-core/expat/expat_2.4.9.bb
> +++ b/meta/recipes-core/expat/expat_2.4.9.bb
> @@ -9,6 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7b3b078238d090=
1d3b339289117cb7fb"
> VERSION_TAG =3D "${@d.getVar('PV').replace('.', '_')}"
>=20
> SRC_URI =3D "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar=
.bz2  \
> +           file://CVE-2022-43680.patch \
>            file://run-ptest \
>            "
>=20
> --=20
> 2.34.1
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172320): https://lists.openembedded.org/g/openembedde=
d-core/message/172320
> Mute This Topic: https://lists.openembedded.org/mt/94687680/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


