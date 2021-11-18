Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CDE9C433F5
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 12:37:33 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.82])
 by mx.groups.io with SMTP id smtpd.web12.914.1637239050586062902
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 04:37:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=kQl+55qM;
 spf=pass (domain: weidmueller.com, ip: 40.107.14.82,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JU/mtf7XXoB9rGp7sjjjDc/FucH8HQmYXh+28fzQQUPVQledrwfn/jau9avBdPLUeuCV5huwQ2L/QbjkBYKra7ZKL6f70eQTegUac1d4CSRFZNwiKDWf5cd4NDTnSsrvpC5g05VCuCLeAiNgG1JbfA8Ce015jNY/0qim8R9+PsthQFYOezsHKUEKR+15RQDARLbv42JS36q3+1mODEBnyOSR53DTYHORWlAqf4U3HzG7Rt0zQBaS6nGyAqgI23cmmTvJlSmdr6C2KKyOnaVvvKtWxx+9RwPAHcDMpX867nIoe1gR85GPOSo3x/ZPWOCTd6SzfMYKKEbIAG9tM13NHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UpCjG1ANWJXkpPVcQ5RbLyidbkGVYFGfiwjbwi3wGNA=;
 b=ggtWQl6HHodUpEXJdcNIf3PKdyPlAJBOBJhX/2MvE9ABK+4vRIAM67Wpw6q0K/uo7zlY6JlE5DsZUcNJU7BG/pzYHLS1aZ5Zb1NdKdTWCO9/upGt9YeBxa5I5wY7jdyrSJAu0iDfm+OtKw4YngSulX2jHfANXaixr5AMSX6IQDIKF1kn1NBi3u35jfCag2/S30rdOiKvcLY+yPRol6wAMNoatT2NcRBB1lao0jZRDFZeK2VIUkLln1eV0pCHqda4mlFRnXdMFKjKttOwQ9/2dbmlaiLzs2Np2G6oNaOhtqzu4Bu/M4hYmU0FHUTPXYuqZlXE7pGOZqmj9ojEe2JlxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UpCjG1ANWJXkpPVcQ5RbLyidbkGVYFGfiwjbwi3wGNA=;
 b=kQl+55qM5FgXSRyCj+F1Ko/V31VptmhI0sjUqvRmcegYvyQdHCcsh+R8FmWKD4e6jr89yv6UdYP3ka/yUAPEq+OCr/3nKlLW3ef/BUxgayJnN1b1IFhNmZFlIXfaJWF1O5MtziAudOhhZrUys7XZJZ6t0mQhYzm5ztTKd5LYBk4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PAXPR08MB7003.eurprd08.prod.outlook.com (2603:10a6:102:202::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Thu, 18 Nov
 2021 12:37:27 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::45dd:11b5:8f4:981c]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::45dd:11b5:8f4:981c%7]) with mapi id 15.20.4713.021; Thu, 18 Nov 2021
 12:37:26 +0000
Message-ID: <22641487-a14a-5872-6b43-024aa136d7f7@weidmueller.com>
Date: Thu, 18 Nov 2021 13:37:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Content-Language: en-US
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Subject: Recommended structure of npm recipes
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 OE-core <openembedded-core@lists.openembedded.org>
CC: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>,
 "martin@mko.dev" <martin@mko.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P192CA0020.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::33) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from [192.168.178.36] (94.134.181.210) by
 AM6P192CA0020.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::33) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Thu, 18 Nov 2021 12:37:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8a8162b-8546-4724-8235-08d9aa902daa
X-MS-TrafficTypeDiagnostic: PAXPR08MB7003:
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB7003F8B7D72DCC6EDE4FFB5FD79B9@PAXPR08MB7003.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pFJBb8wOhUCftl1GcVZXml41ELZEh6UA65Rk2gaUJWuuDSIvUdXgdyTapoj1vgPWFMeE9yHLt7gNGIE0FVGlRbt9IVIP+3ldQerkzTvDX+c3wq7vQus/QO2lEtjcWVWlXP+OLQNnbibWf+dmi3Uez3ZUuKEnIxartgCPYfar+RtbZLsSp4S3EY7RiGgIN9hIb+YapS2k3umJy0TMqqViQqYFq2hqg0WB9+xZSpHqErmoA6tzcbdx8WC7btsfKU+EAfdNaCfeJwH08JXCMMaCnUkUEukIcbrV7tUxz/jUXwH4S+dzy1rP0NWZTpWGoaK4VUoIgQLhD51Mc8p16noWKJTqCGHKrnFrehXscewLxixA0/h7xW7Oo0YEWxgl2FrJosLdeTfQ2ngC95VX24Fx0cw8KZhZFOm+JXrjn8JsOEVlaCE5xNU13CHzVU2/i805A8Q3EM39rTs5kMx7P2rTt8BQcEYmqm5yWW1aE03DrMUK0/KfRc0HPiBlY4X5XUubgfGCAloBKdeK+eAGJWRU2OpvDdQnaU9dHwB4xRVXWjjykSqxMhiWA+BpEdDxDm+6zCKAFPVAJKDNxU2XAZeFql5ijFXsU6PlTyWz9LyXarVt75DzwAqoh13d0ev3599EPUY2vcaYwqrX3ryiy9nj8mmm/WTueoA1Rt4PBloR57cMSN6HEI6zlqXThQc1HBrQvFHlT1algclmfUGladXw6Yu7eYt0Ze0Sbn0OQ7bknQdS0imtSmpI5z+MLNdB6Ol6SS1+T1e8T+uSg/cywJ6fwQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(26005)(16576012)(36756003)(66946007)(508600001)(110136005)(54906003)(31686004)(31696002)(66574015)(66556008)(52116002)(2906002)(38350700002)(5660300002)(6666004)(316002)(86362001)(4326008)(66476007)(2616005)(6486002)(956004)(186003)(8676002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2S7r+uTAo+WaeSoooNKMMeWuzFgzWzd10Ur8I7gob4kxfAzL0b6fSyx39dUF?=
 =?us-ascii?Q?TkTmeIaZ1O1gpv/4Tib2sPmYUPTv3z1rAw37ucwOJYDvesnKH8e8vOLbwhFa?=
 =?us-ascii?Q?tq0pRuxuYtctUx0r4nVFidGriMyDesIlzaho3diSoTGN3iBRgy/djCayJWlD?=
 =?us-ascii?Q?1uHM7BiE3alYog/P6Ymy/rQ2yxBrmzpbL0qnSyaWxeSfedo1IH3agQrJq1Xy?=
 =?us-ascii?Q?Y6c7tVFWTITcWBDMGd3zgQsQXU9hMVDyVBnp4pCdWT/olRHiBEUfcrl86H8J?=
 =?us-ascii?Q?rksUmdJcSH+GDktIb63SzyMrVioLVb9qkf+UR5O4p60KBKp9Lx3+p9i1fRUq?=
 =?us-ascii?Q?ZpPVRgZgpgwJVFsNMGkdWPZs5pP9vdj6MAL3LiF06aVTUb7gcXHeXmOp0Uh/?=
 =?us-ascii?Q?IhwWLXNSsKmYcGGIPzhGaNrcpGI0xff/gmCAiAEy2Jy445ks6ygUSYPM4iQF?=
 =?us-ascii?Q?ATx2IL6tTEvwSphkoy9emmBjlmBoCCRJg9SOqj0hACIMyK1Jxzr5/FJnpTNg?=
 =?us-ascii?Q?KmCEFzwJ4YWiotYzIBKz6AkyXnW2SkdXbrE6On0Btm/0w88mfph9XaB/VAEt?=
 =?us-ascii?Q?bPVQX+sCzxFoo3Fpb44v/1FVqbQMYBpDQFXZ2reoALwN42hdlLhz/PdTSMT3?=
 =?us-ascii?Q?iQRb7+0AXtujdt/L59Bd8hdLWoyAVIOVfhp3cXWL1ZPdwieMIYal4tXoYoDZ?=
 =?us-ascii?Q?+G1bx6NJH+bvpPQaEgzs5ZlmVTjFjs0hFXT/uXzlZ4IHzJQez1YNve9Rr55f?=
 =?us-ascii?Q?39wEmSiQ7td5LMIt82IXCfFc1P3uW30Tu19LfT52ZI0cadlUP7CDJCLbCUrT?=
 =?us-ascii?Q?LID5j898IgqBJnuGy1fu2M6WXFxG11VIFHLUMAFDR9Sq522JUrOahObMa9m7?=
 =?us-ascii?Q?Z/XmqX9any2I4DcQfjBzORPoUF50F41dsuTdfqzo/HxU4TML7HtcX4dshJ08?=
 =?us-ascii?Q?a0ewGOKR6zZzMmqJeqLVMx8B2av2esajQYv0WbbnSL7icspja0PHlrxbr8w4?=
 =?us-ascii?Q?eMa3X1bNJ0Ynb5lSgNiAQdjzd862ovzPY03UXFKl6z7ibq/I1GTwAk7Csqu3?=
 =?us-ascii?Q?nElBLU8EBMjKBNG7NoW/K45jHEVRBsSgFPC1rHPhnoEgO8Fzvqr7Mqbdol1o?=
 =?us-ascii?Q?hw+rdD8OfMQbfToMNliLj7pMySY/QdNRX6MjVQEruqw7vdPeiHcSMkwh5kbL?=
 =?us-ascii?Q?uoTYkqymK4yuof68b4TjjNsUW5KsHn4nwmiR86Xl/cWpRVSvZk/9MLG1rKVq?=
 =?us-ascii?Q?Jx1SOMjspMF/ADg7bBt1lAh7ufxOE+S9gSMmVzHCliFJadM/ga6nCnehzOZ7?=
 =?us-ascii?Q?XTwYLABarx6PRnlpohKiRXkndJaUAg3l8vgXGfg0yA+kmCRUv736g0U8XjrQ?=
 =?us-ascii?Q?IVdXwGzESeOSGYg3zqnbXuPfi7eq3txOFZXehLz8aN7Zr4TmdM4My2CMriS2?=
 =?us-ascii?Q?NoUlbIT3eNnrjsulMZGS4O1K70tyLUqqziTz2ki3NWX5lQZyRQ7pJkcPLtxM?=
 =?us-ascii?Q?es3NzPmV5W2Ez+hDMmgDGFZc63voipRnhT9bCJeNahRcfTdxnfoNqfZqJX3r?=
 =?us-ascii?Q?QxQCnhIac2wXHPw8scHdf2+/wBadAmQpVQHMXoTxS8mtR0zAlmS0rNu2CRfa?=
 =?us-ascii?Q?lIe8mQelYjPv6xBAarE/JMY=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e8a8162b-8546-4724-8235-08d9aa902daa
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 12:37:26.8663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 huvGaCROle/HlXlFMojZfZBJoV8BoRvLiYgdZcR4eWxHx8t9EgvzsgPfY1bK+YsQn05Ujmd7a1Yy5IceHtG6gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7003
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Nov 2021 12:37:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158477

Hi,

I would like to get some opinions from the OE experts regarding the=20
recommended structure of npm recipes. I have test different solutions=20
but need some advice.

npm could be used to build a web browser application or a Node.js=20
application:
1) A build of a *web browser application* with npm generates code for a=20
web browser. This code is architecture independent and doesn=E2=80=99t need=
=20
Node.js at runtime. The build may need compiled native binary=20
dependencies during build time. Thereby the native binary dependencies=20
are built before the build of source code itself. The source code of the=20
binaries is part of the dependencies.
2) A build of a *Node.js application* with npm generates code for=20
Node.js. This code is often architecture independent and need Node.js at=20
runtime. The build and/or the runtime may need compiled native binary=20
dependencies during build time and/or target binary dependencies during=20
runtime. Thereby the native binary dependencies are built before the=20
build of the source code itself and the target binary dependencies are=20
built afterwards. A Node.js application without target binary=20
dependencies is target independent.

A build of a npm application consists of four build steps and every step=20
is optional:
1) Build the native dependencies (npm rebuild --arch=3D${BUILD_ARCH})
2) Build the source code (npm run-script build)
3) Run tests (npm run-script test)
4) Build the target dependencies (npm rebuild --arch=3D${TARGET_ARCH})

I see four possible solutions:
1) Build the native binaries and source code via a target or allarch=20
recipe inside extra tasks.
2) Build the native binaries and source code via a native recipe and=20
transfer its output via native sysroot or image directory to a target or=20
allarch recipe as input.
3) Build all native dependencies via a native recipe and use its=20
node_modules directory inside a target or allarch recipe.
4) Only build the native binary dependencies via a single native recipe=20
or individual native recipes and use the node_modules from these native=20
packages inside a target or allarch recipe.

I don't like the solution 1) because it repeats every step for every=20
target arch. The solution 2) is strange because the target recipe=20
doesn=E2=80=99t depends on the source code itself. The solution 3) is bad=20
because it leads to native recipes that only copy dependencies into the=20
sysroot. In both solutions every dependency change leads to rebuild of=20
two recipes. I prefer the solution 4) but it leads to more code inside=20
the recipe tool because it has to identify binary dependencies and have=20
to remove this dependencies and its sub dependencies. On the other side=20
this npm packages could need target specific patches and a specific=20
recipe could simplify this process.

Regards
   Stefan

