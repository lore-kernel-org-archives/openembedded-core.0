Return-Path: <mike.looijmans@topic.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E51AC48BDF
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:13 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.40])
 by mx.groups.io with SMTP id smtpd.web10.26573.1650872417938085090
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 00:40:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topic.nl header.s=selector2 header.b=yKmNtwgx;
 spf=pass (domain: topicproducts.com, ip: 40.107.8.40,
 mailfrom: mike.looijmans@topicproducts.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W3ANaTVUvBbSmcNZWaEUAwdcoFwHw+l1xImg6ZvCu9g=;
 b=yKmNtwgx7Sx0d4uEXhRrNet7McGdUB/gsbkFoXMr20OXvxjk2e5VbrjRC5Eq6mEqGaFiv8i3SU7a3mqk3VOKt4i0xx68CRX1ehPiVUaZQInwx4d3me6lMUTBntCyNzSQ4acxxLGCVhvMV+hd//+VnE+F2N9rAuJfqTBCnRHmJiWgNmxCvJFeyc7T3O56zArQ54v1a/etUx6f8SSvmrXSqpKciN/Dzil4sn6dAKl8+EMGi+EcfO56W0Tk1DAP6MrMR0KZ5h3LbS3R1lsaw4cG9dHaARMoy1tz6IKqcmMS3X4iB3i2Lg04s+/VhbXnGMbJGCpu3NI3DpY4ZNZNqdDR9Q==
Received: from SV0P279CA0043.NORP279.PROD.OUTLOOK.COM (2603:10a6:f10:13::12)
 by DB7PR04MB5099.eurprd04.prod.outlook.com (2603:10a6:10:18::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Mon, 25 Apr
 2022 07:40:14 +0000
Received: from HE1EUR01FT081.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:f10:13:cafe::35) by SV0P279CA0043.outlook.office365.com
 (2603:10a6:f10:13::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15 via Frontend
 Transport; Mon, 25 Apr 2022 07:40:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topicproducts.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
 designates 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com;
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 HE1EUR01FT081.mail.protection.outlook.com (10.152.1.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14 via Frontend Transport; Mon, 25 Apr 2022 07:40:13 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (104.47.13.50) by
 westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Mon, 25 Apr 2022 07:40:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DiUiGAOU1mbz9SVWboHLzzlWiSwrHI5lUJ6lpeiKBkyGn0wYfxMlBHlviWT7qRSwquoZbz2tNnmovhK0eqmYi+BDhFiV72cn4o/+4hxZUaXNXBSDV7L7q6QsQcuvaNrtQVSwEVbIq6e4VKCAlOZr4kkLLRHpR3mC7PT4RIK1/zGc6ZTDLe2y6AkiWmqAay7EgEiCb9HxUmh7aeeVekIjwbcYPfZuJZg1SsFytwTt6JgyRIwi/gHzFAIkS7oQ3yFgqQAhs+Hpwk+6pNg0O7ISdv5SoUuLoZg+BDGeW+1Q+useiKt4+wxNzZfooJl6pD7Md5nactj1GTkr8plxMDAcFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W6Vv3IxazNvrMDf6pYy3ilN3w74HeowtnTjOjLmpUDo=;
 b=JyuAseGJSWqZL4qRxK0ay+oxGoIYMeSy20RQZiKxfDLa7eyaQ+C1Sa0FSJFojCQhzKlZBwLhMJDU0nsJua1C0HXy+1UVcE/MpB3SwOKIpAOfB9Kx7bz1xu9OrECQpXGHma4HsgI3PW44WkQzl/5Z/WaMhbWnn0bglT4WiL+r0ILmnwh5GmIjSDbEzoO6G2eCzr/37L7oxU33+kRRtYpaJkIIJoP6kNQJ5A5oAf3WiVPWlh34bZyXHAPh5aN3mTeMtL7FJarNZgqg3RVPWwicvLNcZ3XxPysiC3rHTPehucYr0omNZYu2oZG28A9J4igdXqhXiPCNLoOLEQTpp6Yqcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topicproducts.com; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by AM6PR04MB5302.eurprd04.prod.outlook.com (2603:10a6:20b:7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Mon, 25 Apr
 2022 07:40:10 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::a161:7ac9:1e16:174a]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::a161:7ac9:1e16:174a%3]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 07:40:09 +0000
Message-ID: <ef4b958c-8310-4b40-f671-779558228550@topic.nl>
Date: Mon, 25 Apr 2022 09:40:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
To: openembedded-core@lists.openembedded.org
Content-Language: en-US
From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Git and pseudo
Organization: Topic
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: CWLP265CA0420.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:1b6::18) To DB8PR04MB6523.eurprd04.prod.outlook.com
 (2603:10a6:10:10f::26)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: a47ade3d-62cf-43bd-09ce-08da268ed55f
X-MS-TrafficTypeDiagnostic: 
	AM6PR04MB5302:EE_|HE1EUR01FT081:EE_|DB7PR04MB5099:EE_
X-Microsoft-Antispam-PRVS: 
	<DB7PR04MB5099E6814E634017BD85DF6B96F89@DB7PR04MB5099.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 YoF/XuR1Kp9ju154W6QXaHdQn95AGRA/u72K014hwkuzfpOnC5OHzW8V7Ae3R0MY3zZyftIRB1B+/X028aNOSH7yOdQ55rZlNTPowlrXxhvq/bF/ZvHxIYQ1+T+HUHqFfJjeQfeBE93bUTg4ImhH69Y3x2Dfu1B+i3lTt3PSDyTq6+Obcaf2FtE1ipjPdoINMAxiUdccbOq8P4YyOwcXu4Lz0FNbk5yvJXPef7vn3QitWnYbO0yHehzu8sBqhuG7RMbGcfj3iGJMEsaOEVnUT2ji9CLYxiPvQt0ZPPN45ozertdHWLh71BbvN2vgvqFLQKu/IcNXBTXgayL3g0+kG2bS9Atb3OO+a1JlAHXz2kj0D+CQjUxUpTebGvMCRr632iLmD6OcICDMfZJCzVT3k1tlqzEmVMRved8NZx8L1hDuvhiEpoPESwbxPVHY0+C76T8FQwolpySpP6TIMRLUr7XKxMW5aL390UQPL19677R1QdBnAIeiXw41EGbrDuy5/mvedjed7TwevQOAc+TUhhkZjPov28JwVnP67+hxM6WUHWxkqEg2ErevwtLMqhCt7IpBrbj7wvb9Sw4NyBxP8KVCK9bXy2r2FhnD3ydqPr9WyjoGCgg9lL35GMaXZePBRRDZIMJLRxassn1urc89gUKq0zWKWA0eqcSaGRzmXfZyjdIQ9ntQoXuAQnc4r6a9m8xQWUnsBf1srnwpNwOYjCnbNBrIa9Rsl2EYzKCh55l9e/ucrAXcmjbankffMnm28BezRBdaqGNxgnyrklYw7LLEGLNfLCXkR4bUE6iv/NTCXZMn6ZQ1OazTb8T39MLvPr4qZaBHufMva7z8hJcp+zoNLJIa2xOuk32RDaHYU74=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(396003)(376002)(136003)(346002)(39830400003)(366004)(66946007)(36756003)(31686004)(508600001)(52116002)(3480700007)(2906002)(66556008)(66476007)(6486002)(44832011)(8936002)(36916002)(6512007)(6916009)(316002)(6506007)(26005)(5660300002)(966005)(7116003)(2616005)(31696002)(42882007)(83170400001)(38350700002)(38100700002)(8676002)(186003)(83380400001)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5302
X-CodeTwo-MessageID: 
 67eb1189-d684-4318-8447-4ed48539c073.20220425074012@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
References: 
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.6812ddf4-d065-4e4e-ad42-c48d1bca155d@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.65eda1d8-3d07-4fbe-a1d1-669c533cd0a5@emailsignatures365.codetwo.com>
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 HE1EUR01FT081.eop-EUR01.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8cef95dc-57c8-477c-8f38-08da268ed338
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5tJ9bmn5Fe+BMwy/GMq/djPqgJjd+nhLr1Qwtk1SbgWcIrz7V66kQjZfes6BO3uc3n1KtrvnBGeP/qiJK3rnGzzjaNS4Wb36MJqVwRB9QJyOZV5A5KiRN02D43Na92YkKVqlH7JBihCCgfB2OZBrbR6UN2Qtx+afYUCTDjqnr87KwqzM9uu30RDBWx7ZqonDpqmGHFwrewo7Sd5ONZdK9qWP2w1UgVaUc/uxn2yo6s/ZB9jG3Cn2oBpyHjeU+VgP1DNZ4CviCqTiMvglqfNCoxlrd4vdXWSqovw/7VgFRQ2eF00kmACEw8jyFiQeh9+/wyulRT3sijBqorUBHMFlHRA1I6LOWUzTBP+BbvB8ozbZ5hTYZeMq7H0ZxfJMbpnwRPwLzw/WriIBGpjICZycxJ77XZ8H4XIL+eYMjEC7yH+WH+j0CNGDK2ApLecVt94gKY8ucR+emM1jT1WP6k0pCXsU/7YocCVn0XueHO2M1U/DfxrDv9JbtTEa5AoBoLozDScYvIBdatIw0F218NZhSVmP5EZEowB92hZyrjBuiUU4lPwOBK60J33QOcafZm4ehw8OCp7y3JvOfFR4yYPB1vT3m855q6T/Z4PnHe62B5PXFnHr/UikVSRnjuaWf/kr9YVjLsxA3YbVrXCjPdL3q9T8o15iML/KiyC+EV9FUOxFlqP6QkhplW5M+zDWnZohTkkXjaCXm7QuHrhKSHiJkAd+j0BIQv328gfabl+FrNgcYTq4NzT9QuYVzvUxkNxYJN2UZbYW27kbW+VzevM5zz7gsH1JYOBDzckcjaBbvGk=
X-Forefront-Antispam-Report: 
	CIP:13.93.42.39;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230001)(4636009)(39830400003)(396003)(346002)(376002)(136003)(46966006)(36840700001)(36916002)(2616005)(26005)(6506007)(6512007)(70586007)(8676002)(70206006)(31696002)(7596003)(508600001)(6916009)(316002)(6486002)(82310400005)(966005)(83170400001)(15974865002)(36860700001)(3480700007)(47076005)(336012)(186003)(356005)(7636003)(42882007)(83380400001)(2906002)(44832011)(7116003)(40480700001)(8936002)(31686004)(5660300002)(36756003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 07:40:13.2708
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a47ade3d-62cf-43bd-09ce-08da268ed55f
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[13.93.42.39];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR01FT081.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164810

Recently GIT got updated with a security fix:

https://github.blog/2022-04-12-git-security-vulnerability-announced/


The problem is that this causes all "git" tasks that run within pseudo=20
(most noticably, image recipes) to fail. In many repositories, we use:
git rev-parse --verify HEAD > /etc/revision

Or something similar to that. After the GIT update, this now fails with=20
an error like:

'''
fatal: unsafe repository ('/home/mike/repository/path' is owned by=20
someone else)
To add an exception for this directory, call:

 =C2=A0=C2=A0 =C2=A0git config --global --add safe.directory /home/mike/rep=
ository/path
'''

Apart from doing as it says, or even "git config --global --add=20
safe.directory '*'" anyone have a better idea, especially one that=20
prevents the system thinking I'm someone else (root in the case of pseudo).

--=20
Mike Looijmans


Met vriendelijke groet / kind regards,=0A=
=0A=
Mike Looijmans=0A=
System Expert=0A=
=0A=
=0A=
TOPIC Embedded Products B.V.=0A=
Materiaalweg 4, 5681 RJ Best=0A=
The Netherlands=0A=
=0A=
T: +31 (0) 499 33 69 69=0A=
E: mike.looijmans@topicproducts.com=0A=
W: www.topic.nl=0A=
=0A=
Please consider the environment before printing this e-mail=0A=

