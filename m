Return-Path: <luca.fancellu@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D055BC4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 13:22:26 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.88])
 by mx.groups.io with SMTP id smtpd.web11.13347.1699449738690636432
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 05:22:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ft5L55jI;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ft5L55jI;
 spf=pass (domain: arm.com, ip: 40.107.104.88, mailfrom: luca.fancellu@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=A7nVkwEzVipvi9W7NlDtraJbEexH4nwYomZh+jKSYNGWPQ8eJgPZSp+w9bHVjn0RETNidRIYq2nndqneYMOvm/JabEkRhFqN6lFGsaKFmCo0XMM7X16Imi2Q4fCZxORHXHUB526+jKmR0JQO0/oTSvcCraxtu+/HY8fq2pAy6mKEjs1cX89FParm32P7ka8gCbbrMPO+NzNJ2X1NmsHQejviBg35EEcVNgwl3iu+6loyIEuXX6ugFgR8PFqCfuc7F1iDEZrha10BY01aKa2+0VxhLnWMiBLlHOl3z/nQ0OXlqglvO2cTnOLoBDn5f68T3o6XxpzWmJZ1+kL2wJdvMg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PzX+CXycOF2dGlHkYdjrSeItY85ft5qYE2mjrxJTxxc=;
 b=QnGuYJAWcRdzhTiUdmim/rZ7rBqeGRp+WojEgRuHfDUeYorl85zd58/mJWn9rJAXjrkW4Jloktt7ZD07DbpWMgFBWSst6gfSOw9D7dLGppLNNnhvxLpre6H819d2np6Ed90TEW35bfZpw03H6ha5JCw+4onO3J9VyTXhc146uaPDbufGOt1Tg05tev56LAfZkNlEBoxLj5ktYr25+VDIbgJumqqlwvSu6MoarZuUqeOpIQSWdhges04FBq2RGbCP0d7sPZ4QdP5PJGLCntYGR9mBK7lUq1emrAVpbev4+Jwji+qLYGjZXXea1fRKLW9lCVlk24d2MkCXDI5e470Z9A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PzX+CXycOF2dGlHkYdjrSeItY85ft5qYE2mjrxJTxxc=;
 b=ft5L55jImvivPAFDtZzNhk2yrpcLy6kA4kg21ZxIHRFn1hZRxAOyjD+F58k2NNDRQGwaUow15FUK4OJpiPIPfUKHnHJaLxz2SgWGAI+bw/pckZ+PUy4Gd4MIgByHxJc7de78lQiZGk3uDQJA0Zyj2/UqETDm8q/GFFX2RTddpng=
Received: from DB9PR01CA0015.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::20) by PAWPR08MB9758.eurprd08.prod.outlook.com
 (2603:10a6:102:2e2::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.27; Wed, 8 Nov
 2023 13:22:15 +0000
Received: from DU6PEPF0000952A.eurprd02.prod.outlook.com
 (2603:10a6:10:1d8:cafe::44) by DB9PR01CA0015.outlook.office365.com
 (2603:10a6:10:1d8::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18 via Frontend
 Transport; Wed, 8 Nov 2023 13:22:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000952A.mail.protection.outlook.com (10.167.8.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.16 via Frontend Transport; Wed, 8 Nov 2023 13:22:15 +0000
Received: ("Tessian outbound 20615a7e7970:v228"); Wed, 08 Nov 2023 13:22:15 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 858072137c5008a9
X-CR-MTA-TID: 64aa7808
Received: from 8e94c1a61635.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8AE13749-5262-4444-9D6F-39FDDB50A229.1;
	Wed, 08 Nov 2023 13:22:08 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8e94c1a61635.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 08 Nov 2023 13:22:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XCqm6inEKOsiQqqe1LOotC8lkOeBSvTlTUQ7YaT8PmXMby9XqYx4t3G0rC//wyumEnrC+xj8iGm6GsCwXWSHqQ6JNEjUbEnFENIdIEBqaNwjY2FBBkSuNj/uZO8GaK/kcZbeO/D2vaC3GRwjoffLsuyOwPYjxhJ5gUxaHHHDPFANzCFassXCRLraTURFbU0VAhbZE+DGKlUvrrNKGTvXa5kwxMADuaE7ZIWO+j0yltUiEXMABHpysmLLMTz3VtwOO+3xTzFzfC6KMvj2CLZJlml3kGR2JZOsK1vojztduj+2fiup9W7B07zorchFGFGX9BwEAsmVOgAiA4/IrwmsBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PzX+CXycOF2dGlHkYdjrSeItY85ft5qYE2mjrxJTxxc=;
 b=MzYsqie0caACTWfX0ItZ6+/il4Tigum6snUy1EQiD5pM7uhVpEeBk+E71gZRsbmgEmpKut58zKsGw4ba8QDOyKx+fgwpPdN+5LfucQeg6J86vhA9j9DECm5RlTZ0nFUaatISldVh8je2Q8r8CXGFCnypq/I31XBeuZKHoiO5ICHPLPj41LT+TR6W3q6rRbYvxkLG47DgVjCfISRr0b8zAI/5BwweXGEMFBsY9MyCcsUWHO0FVrnPFWUFfOzbLs9xfhepvkLacPPXRFWG38ndMqYIT4Daqq9KD+JuZWFYxetAFCLwz8icxmVw3rATvgjmnYnxUsXiSjV3Ml910y4U/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PzX+CXycOF2dGlHkYdjrSeItY85ft5qYE2mjrxJTxxc=;
 b=ft5L55jImvivPAFDtZzNhk2yrpcLy6kA4kg21ZxIHRFn1hZRxAOyjD+F58k2NNDRQGwaUow15FUK4OJpiPIPfUKHnHJaLxz2SgWGAI+bw/pckZ+PUy4Gd4MIgByHxJc7de78lQiZGk3uDQJA0Zyj2/UqETDm8q/GFFX2RTddpng=
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by GV1PR08MB8667.eurprd08.prod.outlook.com (2603:10a6:150:85::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 13:22:06 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::76e6:a7e1:1592:866]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::76e6:a7e1:1592:866%3]) with mapi id 15.20.6954.028; Wed, 8 Nov 2023
 13:22:05 +0000
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Diego Sueiro <Diego.Sueiro@arm.com>, Rahul Singh <Rahul.Singh@arm.com>
Subject: Re: [OE-core] [PATCH] oeqa,ssh: Handle SSHCall timeout error code
Thread-Topic: [OE-core] [PATCH] oeqa,ssh: Handle SSHCall timeout error code
Thread-Index: AQHaEjs4HuAPHMZePUu6qEylYoqY5bBwaJ+A
Date: Wed, 8 Nov 2023 13:22:05 +0000
Message-ID: <06CD96EF-2DAD-4DC1-A0D9-E8DA3F2FAB65@arm.com>
References: <20231108110839.3599139-1-luca.fancellu@arm.com>
In-Reply-To: <20231108110839.3599139-1-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM6PR08MB3749:EE_|GV1PR08MB8667:EE_|DU6PEPF0000952A:EE_|PAWPR08MB9758:EE_
X-MS-Office365-Filtering-Correlation-Id: d8005b6b-d4f5-4726-4633-08dbe05db9a4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 iC60jU8gChcqP+9skQzrkcGZo/cVYKiq544GHi/fJL2hCueanz37P11QsMoaTI6qXbmpzcTxi3MUaKQli7Deu036CVp86lh/9otlCpqeQtVdb4bYHKooMvS+p9D73Sc0M4Kq7u3wLQzs2ISA5GPpjdKSKfKcXCz1SNduz8n4HcsEA2lxVvu9uHRnoTiMXbQXAhuxIho884HWbfWKd9AWSphbp1IkaYAvwcRonqCZRJChMFHlwEy8CLIu0x60ItXfgIS1xDn5iv9SuxbRx+VWFcU5XlhsPaWe5UNKCOozmE9JR/Lnb89dfm0UW+9KlFaq9prTYqawo01V8Pm3Ei1wi0/LKxy+/kW8bwZiBFPigJ9v5/g8ovFWfwnE7TMnZbgliFTn0S4W47inh8CxOSxITZBWdZ78jEy73nBdbBMgQt2iy9XYspkRN9adTuLgr8ey3J5zK8pPl9y+e9x3qMrlXnweM9o0nktY6y6wzftDXt+Mj9ONRCuAAZkDgAnvcexpWaE4dz7psBYvpaSnliP7N8E9ejSVpdyYtg8XFRgvCXz7g03DV7iw258Z21U9KYucKp1W9GTqioF1owxx1ikycCGoxOWtV9mC3ZRPNnX7/WZCR8OWuXxETvKn8HEUGdROY6XWFjvw9tG5yoBg7pAxdA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(346002)(136003)(39860400002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(41300700001)(6512007)(478600001)(6506007)(6486002)(53546011)(2616005)(71200400001)(26005)(8936002)(4744005)(54906003)(8676002)(5660300002)(76116006)(2906002)(64756008)(6916009)(66476007)(91956017)(66946007)(316002)(66446008)(66556008)(38100700002)(4326008)(122000001)(86362001)(36756003)(38070700009)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <09A03FF26D8153478F2A7FFAFF6C3CB2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8667
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000952A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5fefeda7-61bb-4ff5-41a5-08dbe05db3f0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vaaD8EWJo+bzRtNzq6kMDjCPzeJV+xUBIbVBQKJPzmlb50yKwBOuDsv43ZqdpkWbQLwqHZAhy+Ac+RABqRbFWQ8feTNZIFDOG1EsG8yIoKVPyuI1ufSjtdDbBM/4cYmVKZO/9+nm2dhzVo7iCNx2En2EHP0hiIreHU+BRPkgvlU6lYHQxC+VcdkccvWCgS6iKm1N6vR/lImZaW2BKV8pofB2wQgJQzSharafRRCHul7b3T39ueFTyV9qjTg4Gbct6Bnvxj5OK/F6zYnTwY5LmQvzIqCBBfFx2Dd+Rjwx/2t3Ikp0t64tB4r8rfidVR7ou+tAnY4YAEYCz0ED8qWHuqTVUN458N2SoF78vaNCNPbCaxxXXcgsozSZ9YQAs0gwSbIb6lUUVBG0/40hVrUwY7PJE64MWGCoESWRPvCZpJxqWgMbCMPRO7lTLdKgKe+wy9yxfgF2ZnTNGftjCF11/m/pUSCzEvqBj8G2jHfIRDo34FQJ8xNEAt0qyCgOvGA6mkwOTovV4f4COOJvInGZjgDbw2PYcj9HyuTQiQ45w7U5Pz6al/ydg9DKn/ELZcVs/XLx0zBXl7AaJgHTIn+qzdLg8Bq67QXnS4oeUab3ZAQZERHVAz06f8YS4wMeFuewrVsEwAJPgaY6lcx3eKXKh7dzNZhUUe1l5sJy9ZsAweo20nEh/AmMpKAMiOctb2KIDuKVjjp6sqN15UHSg4kyItO6wtWSFH2w1Za3e0GrHCDaIH8BIFOFJBXAydAXy0ft
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(346002)(136003)(39860400002)(230922051799003)(64100799003)(82310400011)(1800799009)(186009)(451199024)(46966006)(40470700004)(36840700001)(41300700001)(356005)(81166007)(8676002)(8936002)(2906002)(82740400003)(336012)(70586007)(47076005)(4326008)(54906003)(6916009)(316002)(33656002)(53546011)(26005)(70206006)(2616005)(36860700001)(6506007)(5660300002)(86362001)(40480700001)(40460700003)(36756003)(478600001)(6486002)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 13:22:15.4188
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8005b6b-d4f5-4726-4633-08dbe05db9a4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000952A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9758
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 13:22:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190324



> On 8 Nov 2023, at 11:08, luca fancellu via lists.openembedded.org <luca.f=
ancellu=3Darm.com@lists.openembedded.org> wrote:
>=20
> The current code in ssh.py is terminating the ssh process that
> does not finish its computation in a given timeout (when timeout
> is passed), the SSHCall function is returning the process error
> code.
>=20
> The Openssl ssh before version 8.6_p1 is returning 0 when it is
> terminated, from commit 8a9520836e71830f4fccca066dba73fea3d16bda
> onwards (version >=3D 8.6_p1) ssh is returning 255 instead.
>=20
> So for version of ssh older than 8.6_p1 when the SSHCall time out,
> the return code will be 0, meaning success, which is wrong.
>=20
> Fix this issue checking if the process has timeout (hence it's been
> terminated) and checking if the returned code is 0, in that case
> set it to 255 to advertise that an error occurred.
>=20
> Add a test case exercising the timeout in the SSHTest, test_ssh
> test function.
>=20
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---

Sorry, seems that I pushed twice this patch, ignore this.

Cheers,
Luca


