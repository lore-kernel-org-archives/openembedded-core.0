Return-Path: <emkan@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C001C3DA6F
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 14:08:06 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.138])
 by mx.groups.io with SMTP id smtpd.web10.11820.1692886079678444284
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 07:08:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=UPc6i6N9;
 spf=pass (domain: prevas.dk, ip: 40.107.6.138, mailfrom: emil.andersen@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C+1imtGscD9wqNarrnj1GTBMiEcDlmz99uOmmGQ2SUrrsj5PYT1Xe/6DwUdzXRrGG46A+2DPQX5l/iHbdmgkAsLrqSudW9FLfpTyGdIxrwDb85pi4T9g313rMzjqBqjbM0X2dcGeM/itUBa4DYisAYVl/YswHe1Qt/2rYGnLd0/bIbKUvZ/nUmQjxrOgFBntrfbv6nZCcRS9MD7jfQZQWm41Gutlbx/L2d2QrktkhbI1flho3MjhJZSIQqt3uF5j0jPA7fNkfISY/RZRTPU4C0pYddY/XjpV1hJLQbCxMTfvDuJjov6OL7XVs6pdsE4N0c0Gt5PaWIO2Q9Bh85e2BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rkg481ktBcPJXE4T9+ygZzOIrUoxDhWqlan/TQeuZyg=;
 b=Vqpt4jqIR4+cHLsNX4Ca9nSS+lR4lYmNEAYjX7wYcpZUfbW2+HXqILeZZlN9snUPBfjtDQt/M3QBg3MNdqp+92S1foyXkgiw4B1XxvYHZmTWuHz+4uyOML60YCYCxJRdmvYGW7QtEGdFvZpYp4GI2O8DJLtfiUbN0V6kALnJTKv2Lh9fcMstJizl86tKoQA8cHyl6DyeeQz0TJXl5UqIWulNydWa6bfbOtHLYmUYzxuLB/pX8PwDE5K5niVJnDP29BIzr7U2tw//IET+4f2JeyDeJTCWlAinWMK8gTBlzC7pC4fwZ48GgX1csHPrcn2e9f1Uljv1Y8cfqxRX5lHlGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rkg481ktBcPJXE4T9+ygZzOIrUoxDhWqlan/TQeuZyg=;
 b=UPc6i6N9K8+5wvRbvJIP+XZ0hqckmRKbtCswiM6P3eGp+09+INtulujxSd/jwPPy8JanCbG1lA+NSMnNzl43opu7xoc6+0aZV+YUONJudDsbiVuIcfLaGrXZcFRvjMSUUfztdXpRhmQymPgnLyKg4PkH0yoq3rd6w4R6yKZuskU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB9PR10MB4571.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:1fe::24)
 by AS1PR10MB5263.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4a3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 14:07:55 +0000
Received: from DB9PR10MB4571.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3887:6849:a8a9:72f6]) by DB9PR10MB4571.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3887:6849:a8a9:72f6%7]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 14:07:55 +0000
From: Emil Kronborg Andersen <emkan@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Emil Kronborg Andersen <emkan@prevas.dk>
Subject: [meta-oe][PATCH 0/3] add missing CVE_PRODUCT
Date: Thu, 24 Aug 2023 16:07:44 +0200
Message-ID: <20230824140747.45594-1-emkan@prevas.dk>
X-Mailer: git-send-email 2.41.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0070.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::29) To DB9PR10MB4571.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:1fe::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB4571:EE_|AS1PR10MB5263:EE_
X-MS-Office365-Filtering-Correlation-Id: 97a04bab-ed66-4ea9-b54d-08dba4ab8360
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2zaR3tQNgzJrUHkSpKxM8UcN2+qLTzd+UzOHHQHaSwHfxH/70RAlUJW8HYcruQx2Dr+n1AyF9Usdrra/jvlnHdbS9GRHYQD8PoteHZ6hVWhHvU10bkimGcM+tWJ8lDS+0CTnJNLxjI04uMXAzbRIYW5a743vjilz7uYAVx/na+xXPcUmfizO66P48dZ9BU0gDYbFaSHUMxoyc69mOY80yA7nGvg/kwQ6bu4JGARUtQqm7mB6C+xT28YnKNgNv/KdWkwnO6IHmy6XBBjRH2EXkF6EQgwVGb9p1wKYcy99flafDBRC0tEoeZLCRwXu/hM4WxXZeUfaseUlEnTk7qw4GT+BYcdydE+34MTS4xnEFdcmXJfq5uwfXOyhFWQnVhk5uiKKOyVL3jJ/NHp5oS+OZyas66x89uJS5P7BsIhKXV6Slwwpi3Tt6kJHgaXrB8cMbvFgOb+HIRkqVczN2052oNSWR4lwJD4hfK6SYOAX/D1NdZdOswM8e1fprqW6IZL7UUUftVH+VUoAh2if87m7nu0eWPbYm7g9XaW9fCEOgQQrEluTiyZPkoYRrlNELq+gYWNG9N59yqhticT7mQZM0dQ9cMcr5aO4NPbWFZQrd8JrFKh09dEZinCiTxc7vp25
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB4571.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(366004)(376002)(39850400004)(396003)(451199024)(186009)(1800799009)(66946007)(66476007)(66556008)(6916009)(316002)(478600001)(38350700002)(26005)(6666004)(38100700002)(41300700001)(52116002)(6486002)(6512007)(2906002)(6506007)(8976002)(4326008)(8676002)(8936002)(1076003)(2616005)(107886003)(5660300002)(36756003)(4744005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uVYKWq8NvgabkyAPJl3NFpF+1mvBei86tFF/AlqptCu7Gjj9q7RsND6Skxci?=
 =?us-ascii?Q?DXpre5cujAiY8KqmBeylB/rasxhIGSk7DT27fDE0KL6XCm9A/6S1cNIKUjvt?=
 =?us-ascii?Q?iKJuE3NVsGLfDEQblMmRcLoFoAj3Fa4jiFhH+EUBUzF5CFlfsIUpgqlt36Ld?=
 =?us-ascii?Q?yDhoC2LFIQdkYP7qf+UqmBGSgZB7qJfPWrCF/ISOWeQvZUpVLW+fN3QafOKK?=
 =?us-ascii?Q?N1w8O4eFnTJ6s4GVtwUDRSsTDKnWj6m5A0wgadSCkuILUrSeee6ggAKX3JIO?=
 =?us-ascii?Q?G/SSNnfEpmySpOuLJpcQzGhRfrOYjz9WNSuRsXcZM4FnYLsXPt8Q8ybkqUPJ?=
 =?us-ascii?Q?8qZ3C3HLKUgEMUxp8cjVEVkBwh+7pNu2LatYu9EQr9fwGalmWvDbhW5VHCeS?=
 =?us-ascii?Q?7I0+lJ2WBg5xEa5dNWJp3bQcjCmosmnanHyUjm3gKLd8fm2r5/jcG3FIjgKJ?=
 =?us-ascii?Q?QTghHV5n0yaJ74Acq2a6QGZ9j1v+f124xCaSZyQabm9pBp4sTEELf5uA/m4l?=
 =?us-ascii?Q?PuPoOBMW3u+auLnCnI+8bOMgu4IxASoirDiMUSDAY+qnPkMUTGi5rB5nG1Fo?=
 =?us-ascii?Q?kim/Ekyr6TYYIbT3e+eM+MD4k5+YQ/gJaLsgUTIJdgyEZWLK+/hiZHahevFF?=
 =?us-ascii?Q?61Dyp6jR2rjEysUuGBxDWap10yMB5bhuXGCV9gG8yoLw8imzJJ/k5mmxajvI?=
 =?us-ascii?Q?0vOp5TWSRRDV3rWckoFw0/TnAFCjY9ZreAALH+Ki8tGI7Xq43ACQWLe3Jabh?=
 =?us-ascii?Q?HjInKAU4cWRSklm/1hIcd+UBPR6NVdwAx10uX+LPhQcXo4jjetgZ4xjGGICn?=
 =?us-ascii?Q?MKUBNxUOD+syz5q6QfB7aPkPtJdpd8L7jHW0VtJUrWV6Lb9kFqIzKHX+RUKI?=
 =?us-ascii?Q?6mGHI3gOCMQYJqt81w9xGuQxnyFtabG02Sr0I7HCjRmV9sj3KsWUUQB0Cq1d?=
 =?us-ascii?Q?zbFxJJMXGdmzDwacp13il/MbPQa4eDf+9zmkeDwmRf0HzhJHkFWoHOTcG65E?=
 =?us-ascii?Q?RouHa55cfXQ5gvDvkm+WMKfzBkYVfzcf6Yb1rY1TzwpEqi43o0Hwr6O3wGHn?=
 =?us-ascii?Q?3igNGhL3yehkzTSCcEQZXnolWoynvYfrpRMNCgZzLNDTFK3sb22iRHo0JGpG?=
 =?us-ascii?Q?5kAdIywTLt1dFnQFppLUEZfAeCgczM2JwTKtIl9ytbESG1m+k+CknpKqewhc?=
 =?us-ascii?Q?2OoO15pzpnP9iw9p89MDS2l2EsyViZ4IcQKh3jklvi1VVfyVdcg5quY29Mal?=
 =?us-ascii?Q?nCEkyDxgmMN4qatkWsDxC/Nq2dzDBniAYL1HxiYuK75NIooYtT33QUXaO0zH?=
 =?us-ascii?Q?IEEwyZczO0/Vwrs8RSaX1IupiTQOyLtaSiAGm+qowxhA8ecSWBDOjVC16dS0?=
 =?us-ascii?Q?3d8Q+YECuG/jBMrlXc5LH4pfvbVJg68JrhXwUM1Q8QgXxt3caOCV01aM4LUS?=
 =?us-ascii?Q?4h+kivZBiMqeN6Ac55XNIfKWb1gOJA56SW7Qoy4NwUZDImIyr7U2cwGwG9MS?=
 =?us-ascii?Q?kNXn9p1c8YPWLpP2laG/v5KLkzfyO7BftOS0k731puqGSucZN/FY9iuQ+6fC?=
 =?us-ascii?Q?46kAednoMCdslvIsnYmPEEiHlXpSQCmUoCSmR/EE3qRLc2dudJFuRIzJZ1hw?=
 =?us-ascii?Q?QA=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 97a04bab-ed66-4ea9-b54d-08dba4ab8360
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB4571.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 14:07:55.5380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Swc7xnHvHlRObJRhkUYKVYVKC1REW8P6Do4nYR07hrNI7eiRt/xm3LoafmrymevPhjNic02ANA26g3Pcf7d9sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5263
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 14:08:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186663

Some recipes does not have 'CVE_PRODUCT' set, and will thus pass a check
against the NIST database with 0 CVEs, even though there could be
several.

Emil Kronborg Andersen (3):
  libopus: add CVE_PRODUCT
  lcms: add CVE_PRODUCT
  snappy: add CVE_PRODUCT

 meta-oe/recipes-extended/snappy/snappy_1.1.9.bb   | 2 ++
 meta-oe/recipes-multimedia/libopus/libopus_1.4.bb | 2 ++
 meta-oe/recipes-support/lcms/lcms_2.15.bb         | 2 ++
 3 files changed, 6 insertions(+)

--=20
2.41.0


