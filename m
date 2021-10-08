Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23C6AC433EF
	for <webhook@archiver.kernel.org>; Fri,  8 Oct 2021 07:49:00 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.50])
 by mx.groups.io with SMTP id smtpd.web09.6082.1633679338556585943
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Oct 2021 00:48:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=KpA9t6Uu;
 spf=pass (domain: weidmueller.com, ip: 40.107.0.50,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eYU+bb4pnsaeZS3yfqt3C3gJ/S86gNRkOGSgkogBYFN5mY+a8aO5comfa1TK1jvMTnKzKF7maI5rW2cR2b0+lP81giLFz8zoiITlyVY797I4qw87sNHN5HPf1S/V+5sA2cM+PCllCK+HW6VtUkFhVbEnxYiOFgiOhROP/9u2De3UinNOADqSfd3pmMiiH5ZUc9gzT9nmGmELtWnCkDpsq2sTldGkVXq0+Hqa95egweD/A3rI564z7HNqiDvR7GivPG0Qn66tjZVzc0qyXMjDfTo579rRUzd65U+EfoBsUtAHQkW1kvlkT8Vkzu8MZvjutH839HblTJsPDFlS8x67nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SGNTYJ1VWbmVm5OMy6onSJcbUlmJfySOYtd67R799Vo=;
 b=YZV6xNGZa5YaOlqvL8XJJDy4IurLJMOg9dpYpW9NXQXEmc8dtUo9jWzqSPVJ7WHH3t/KcHqKai3fKhreGWQViPROkGNecJEswR/7IjcRS6tRN22D63hJ3RJO4fzxt3hVdBz21GVi5gbFpgX/UGAPT/WfXvofCttw3B2QW2nXrHoL25wemgX/9m4DMiVLHFFbKMr0omMUh7x9wRD2Vly2HMD7e1xKUHj8QJ1cYvEdMdgqSGpsDRHoWxl7HrUsBBYqGASQfwwU+MeI4A7lBBObYyw0ELNaC60vhps9Jbkuna2+UxE8z6x7k7E7Twj0lxRFP3ZXPxp2PHe4+KaYH5s4yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SGNTYJ1VWbmVm5OMy6onSJcbUlmJfySOYtd67R799Vo=;
 b=KpA9t6UuBlf7wFoEyfx+wNA939uUuqYWuBcXkwsPXeLWlcLbpf+GIvLMESo6EIVjCgu4n93OYfy8M0gPaeq1LFfwzH0FxIpmfDpkcBF7vpFn3u7Ig4tZOzR5dI4X356Q+OxoAZ+Vwl7tfuE0z7eIa9pSDdm8i+Ug8HNayCfh0+0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PA4PR08MB6127.eurprd08.prod.outlook.com (2603:10a6:102:f3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Fri, 8 Oct
 2021 07:48:53 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0%3]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 07:48:53 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH v2 03/12] recipetool: Skip common source files in
 guess_license
Date: Fri,  8 Oct 2021 09:48:26 +0200
Message-ID: 
 <20211008074835.10320-3-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: 
 <20211008074835.10320-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: 
 <20211008074835.10320-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::9) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (94.134.181.155) by
 FR3P281CA0051.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::9) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.4 via Frontend
 Transport; Fri, 8 Oct 2021 07:48:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 933be43d-da71-4302-5caf-08d98a3012ed
X-MS-TrafficTypeDiagnostic: PA4PR08MB6127:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PA4PR08MB6127E686C35F74126AA0F06FD7B29@PA4PR08MB6127.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3gGQ2w2YUYOk3tUNbB4GUF6QtN5cPqJorr/AXVTabNZAf/X5riRaYhuNMUIGNbejGB883V8XJCYRJVG84pLtj1/WINkhFxvJy0+2xpZ15JPIvaIl0TZJOvIhmhLzf0gHnEIEyjVG8q4udCzDquJNDPHvATjV8OmgvCbriMxI5uRSWPDSzpNiUa3ERmNbk07YyKK/vTAtXs9YYP448u9rHCtHi7NI+bDtybOoDooVree1A/aFQgX9oExoEj3rObQ0aoipTGQJkY1uAMXOh5jg1dRqXAh4RJkhO1CuSzanNKRSLOT4QDZ3xA2+AxVbWfa+LqKVLmkKueLnNBYdtiWUb07ACI8e54nQksdC52wPNrG65vcJXs3jkGwM7Hw5RbelSKTBeAfk1eIjPVWk4C3aJsrL8cjcHhrqcEoGMzB3ECh2sTHJbqT5tPQxmM2KoMEwlFN0Rqbzp4sC+iHwcruFugrZ96LzEp1GNTTNRczBqGMT9xjYjyJRMXX9e01aBkRu32ltze3K2W5fx55Nq4twIQ+S8n2skK/XHXt0FprzXZPrcSj9GAGFjPV4/LfVEpxASnVM1NYPJh7/eIctvcFiTUKfQUsFZcKe2N9CxXlJZknldGXCq2+e+UInSQ+Cgr/ane3ILBvnFP+aRdQO0jtRUTftWzN+PqakGwsTbvETEz5DT+eY06seIM7vWYjqfJ4KOecA9xuWHLclrA7tE9pUDg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52116002)(186003)(7696005)(5660300002)(26005)(316002)(8936002)(107886003)(86362001)(8676002)(508600001)(66946007)(6486002)(4326008)(36756003)(66556008)(1076003)(66476007)(2616005)(2906002)(6666004)(956004)(38100700002)(38350700002)(4744005)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fkDvn8PrJ7omWuNmoZKpYe+SBO0zHwuI7eUCztGQdMTDmEkUOT2QcrdZbKTZ?=
 =?us-ascii?Q?J3Q78J7yLXmtiJjYb6tH4x9LGKY13C5HIH140hKpD16EEPA57jJlKn7HiTip?=
 =?us-ascii?Q?K3zZgOQz7YgbUG85hP2cgS5D0ALAj8PfXWUWBOnAxTteTjTvklYmuOg7ZLdu?=
 =?us-ascii?Q?bROiUcEyyrt+KRupTJREqR8c6Q/q9WRA6h+Huw+xcF4FupNmoTJLHSQt63Hm?=
 =?us-ascii?Q?XADzZULT3FDy3SGp0Cd0mn3BjV/YHIg62odpkeVzSFkld9EcIEoE9zg0H5Yw?=
 =?us-ascii?Q?UALlByOl7S7t1ovMssDAvqyi6eG3vFH0rMhYISOj4sAUQTlHsDAEA0MIqxL2?=
 =?us-ascii?Q?AgYr/IWkwI2yAA6SSP06seCWgaE27/EsfSfNtUavL4TEr5casuYWRMG/dYC1?=
 =?us-ascii?Q?tD00DQxrUwrAQqGjYxqm3ny8YoFb9NXMt5Gdij9htQBb5xHiurY/WCxt1yO1?=
 =?us-ascii?Q?XmArdSHUzRV4SVEoBxFfUQwUmgK9vHjZK2Ezx5mOFJXZuOBfRMGzONaQBRP2?=
 =?us-ascii?Q?7+m6PPVT3g8bkhgGYm9qyMrV5YhdAiMtby76FWnHvPirnsozXCkdksD7dHPD?=
 =?us-ascii?Q?PktcEsIl8KxHWGNCwjuX8dgp06BHYo83oYKDoeVZ0atF499UcU9fkLQD1PrP?=
 =?us-ascii?Q?y0+t7ZZvOyVdwtDKgZztgty4CDeMac5J5988Y5AgFYr4Nh2uSIdIoITEX1Wq?=
 =?us-ascii?Q?n9PKNwprjA+Q5NFCS4BtBbukHDC9/172l9mRY8pLBI25doVew+OVVzmNjWoA?=
 =?us-ascii?Q?z0M/QEGL+1o3kY3XdIRJ9rWxRcJzjt1tc/HcK3FLb7wwv5jVQQ3iiVP/kxUk?=
 =?us-ascii?Q?ytMXnU8FIpNcIh75YJjSb96osYpfB/YGRrK/wJbufQEq7Fs5iGbjX89/UCVd?=
 =?us-ascii?Q?fPKcMfBGzsmFkvaw3LpNXoHGq62pI85prT1Wa1s6UnZ2nKicdQQ6LBbw1mrP?=
 =?us-ascii?Q?OG4B57KAI8+19DxAHumfKCxlQDtms0KtqZO1120ex4e/oes9eNZXH7NBh004?=
 =?us-ascii?Q?g2LwZpMmGRHTMdiIQGTYxXhfnQoywF3aRXcvKJfZy/OhDm6z+BeZqgSQ7wd/?=
 =?us-ascii?Q?FlxNctg7ymAhurbBVXLkjxrPFeKyLLO/UU/9JMvG74DO3jW+sIQa+2HKFCVB?=
 =?us-ascii?Q?6TxEUHC7SCx1PBQs+YvCEFzmQcs35oLVU6/MjFk7KWLtfyevcp+Z9ZawwVpl?=
 =?us-ascii?Q?mBNkAqhK9vJEyZ5XI9QTwNc7hmmJ1Ol0fzekaKvZWgbw725K12SL6lwBUt4N?=
 =?us-ascii?Q?QHRN1+IgtBysvsuWGWAbg9i/9ZScU/AYniDROlxOJJrNQhgv8s/CrfrSqCoq?=
 =?us-ascii?Q?CzI8mELppY3ukeCAaosEzG2J?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 933be43d-da71-4302-5caf-08d98a3012ed
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 07:48:53.1200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 HQmBL2Kt5+tkyeKHf+dZRFV1/Ws6dD65VrYMLEXKOJp0DBoq7Dheb8xTe/dCeacn24F2noTsxYH7fFAhRRbzgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6127
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Oct 2021 07:49:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156763

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

(no changes since v1)

 scripts/lib/recipetool/create.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/crea=
te.py
index e88a4253da..83cf25d9b7 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -1114,6 +1114,8 @@ def guess_license(srctree, d):
     licfiles =3D []
     for root, dirs, files in os.walk(srctree):
         for fn in files:
+            if fn.endswith(".html") or fn.endswith(".js") or fn.endswith("=
.json") or fn.endswith(".svg") or fn.endswith(".ts"):
+                continue
             for spec in licspecs:
                 if fnmatch.fnmatch(fn, spec):
                     fullpath =3D os.path.join(root, fn)
--=20
2.20.1


