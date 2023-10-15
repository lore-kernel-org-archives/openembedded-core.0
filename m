Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C696FCDB488
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 14:58:47 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.45])
 by mx.groups.io with SMTP id smtpd.web11.94695.1697381916061748557
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 07:58:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=bPwSWqKX;
 spf=pass (domain: welotec.com, ip: 40.107.8.45, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lrZU7oxXJkiMW8ZY3w1YKCMONSECRarOPERVyPwshqvoS7Um5XIUtu67iT2HLwIrj1KLq8VbOIAKVD11mCZUH3DZ368Xnri8r5ayeGb4jCfSjHznuD1KzmmSPYztwb35jTl+NhBTA2Vdld48EoBxEmjHecarEX0EACniGkuybMcLRC8tPijw5sBbQiSQXxMmZwJeP7LGq/ZmyBqDjmuHKHgxBFwXE0dHL0Pgco9n74I/eem0kVewpP43KKZjao1ckvI81eBAJsxdWQm9og3RiR0IMOqM/pxXEO1rFI5Be5a0ff+wO3sH2y66wCPc6l6Qe7Cyqjp07ZyZUsV9X1wqPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pCHrGgRW8Gp1h1gb1SRnmIAa/LM7Qk5jOvHDwzHCbk=;
 b=ASrjW69zITZ+6F91krTty4xNHEPuOOww+7ph6dKifIAG/qFnlINnOqzjEhHU3yHOfvtJoYD9bfPM+lOdrSk3smj9uwsPVo2qyIO94wq3tKVB/X8IcmEz6jUSrgMiO5YnJitHa7XIkk81HmmINHEOBkYFSA0F+7QZ3a767VWVTYEzfIe71ooSmJfDSzR+bikdrU+UqchDr+9EgkKOMPbYEdrFgOqgPgZctbjsi04bnCU+SgszB/VI86bOU9ZobySui3p9tlbMfGcDj77D2Ja+frV7g5175mzv4EtM28R8nlUr46pMTEfK/kToab8zp81byllPQpRSnEKvhpgs3lfLPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pCHrGgRW8Gp1h1gb1SRnmIAa/LM7Qk5jOvHDwzHCbk=;
 b=bPwSWqKX9uoXrYvzJrm1EGhpiCVpatV4O0qKtHHDuqyO1xti+n+hTeHfuu6bmVCCXGx8Xb89NtOK9+xOCuyqqnaNt13WAww/9Aw9KpC9g2nK2bofzZXAQ/ceezgjQdnGq9aUYybUizKFc4UqETw+QaBU4hWDRRKDiN9T0GgF0xVOD+j94ZCiYBKQhOKhaNpdSrNeRpuzXrzWrfAgGi/rC8lyZE06HgC3xlJGjzEjCzMXsoLXPG0M0Np8cvjX/j4k4Pt4UKjRLwclXt2H7FGc+jj8xaDtd2ey9xjBXEi9qNJSYRl0hPzz0xXufNhG92+7oSc/++NNJEXeipJ7A/u7Dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by PA4PR04MB7613.eurprd04.prod.outlook.com (2603:10a6:102:eb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.47; Sun, 15 Oct
 2023 14:58:36 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 14:58:36 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 08/11] sstatesig.py: fix hash calculation for timestamp
Date: Sun, 15 Oct 2023 16:57:46 +0200
Message-ID: <20231015145749.69995-8-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015145749.69995-1-p.lobacz@welotec.com>
References: <20231015145749.69995-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR2P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::12) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|PA4PR04MB7613:EE_
X-MS-Office365-Filtering-Correlation-Id: 98e2d6c9-e987-45b9-a618-08dbcd8f3519
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3/ys63AGkoG3eox55kP7LzmhL+XQkQVrujY9rQQ6tvg679LNbBhMNpAHRtREnfgNOTnASSB6oHAbqthtX+RKOzISCA1/g41/vz46HF/w3sehjoAIGxE5t2L/UqdceX2uUn8u9LYf9dvRtaaEb+xnfVo4LlcliYGUP/CaPBOxpk3Krwb8jP7OmnaW7z1ajpPAFCf2IGLGZDu+ps5i9mpcllBqbx5CvreW88H8jQzee2fW+ecmGMSRdG86J/8BaF/UgEmZiIOS8w4G4eWSS6hsbMwwcJ4VdcbwLNs9b7AI3BAr8iXizuh1JO5q4kUZ8HSTAIk8rRRNrvc6Tcx5L58DXs0rfKFrkU7jz3aEG7bpoUZGiSUQW/k0CfHru17XQ4iZ7FPe6e0s1W7myE114yc2eUfRp4k7BUBuNrh2eBf0U4O7ECYrgEHzMCy/vUc8si8FJ0y7DeRc5mEP6bSYhdEKnGg9fDBsMXnAQ3GXQz4tBYUMQ0iPUd5q0F6LYVC2SjTl8CMeisJJnCaq2tWoG0HMvw/MxjFsRYYy5NMqYuGZkrR/2vGpxVhp7cpR/3P+zkaIoC3XG4x6nkp80azDUQmEVZdPgPWwtqqRC9MGZ1su3MyeV1SUD5+o+ggnEEhOVS21
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39830400003)(346002)(366004)(136003)(376002)(396003)(1800799009)(186009)(64100799003)(451199024)(478600001)(41300700001)(6916009)(316002)(66946007)(66556008)(66476007)(6486002)(4326008)(8676002)(8936002)(38350700005)(5660300002)(6506007)(52116002)(38100700002)(86362001)(6512007)(2616005)(107886003)(26005)(36756003)(83380400001)(6666004)(1076003)(2906002)(66574015)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UiH82Y2yj1FrZaGiOzGktxN+/560velW+01oNljE1b8Y9MwobItgB4GRelS/?=
 =?us-ascii?Q?ZpMaDgG6R/9Zx9rIswB+ok2N9RiUcaIvEve+fN41kQcssJYUYnnKUsIS+Z0d?=
 =?us-ascii?Q?3GoX6GOjO5cu8vyClO7FpNNA3W5N3Mby4jFQzYn8Zx0Y6WImUhge3pU0TulC?=
 =?us-ascii?Q?V1/zXz3fokguMd07WSIEal9+edp2ZxHMKmlwwpCytYYdNj61YWcdvR4t/eYO?=
 =?us-ascii?Q?mI/JSyiO9ye0DtM++0IaXPkZmeo09G7rYABNgbHjoODq+CPolfbqVvjDdB0H?=
 =?us-ascii?Q?PcB68p9eKvIDrh1nKnqQzKlbvUABiru7IdaFz0imKj/V3eAC+uAiD/mbTyz0?=
 =?us-ascii?Q?sTZ+qez8yYxk3Sbm+aAQ7jYJzguqSvHBLfHeUFGc9oniVBgp/0t9cDkkmx6D?=
 =?us-ascii?Q?SkJShgl7zusF/BwcsIDzO/WNNzxFlJQXk/tANWo1h0qtNp28WtDJz8DD2oNk?=
 =?us-ascii?Q?mzWfvdxtA78MNhPf8X9mShHhKJtDLk5YA3e+qEUKbaWFIWOTu29bNruQ8xQ1?=
 =?us-ascii?Q?SzaEoHL8b8vAQQK5Uy3lJNtJuz/FV47c35F2K8LNOqm0dET1ZgEkP0r7tDi7?=
 =?us-ascii?Q?QTs7AfBX9ekMgxQmGbcXoHjICkiQwCgfHXAsnvGOdhQzwtBQhTBus/qq2zZf?=
 =?us-ascii?Q?AoeBlNgxaz4p67xgBIe1yGyQdGd4OCVf1hNdq090uMJcc5mYoWRq0Nqk+UtK?=
 =?us-ascii?Q?6jQ23Tvjyqgx/FCP80PpDhpigYSyKZja76CWqa/4DyKxQYqAepzCx2v1eZEX?=
 =?us-ascii?Q?U2QpWdamkgBzBmC4Loz56TrSsaGzrSZwvGn2OGYILVSsS7yA8qe0Hi9COQiy?=
 =?us-ascii?Q?YJiVTWxma2Equ47ndbqDRUmLqt6kZxkIsOGa21ddVip7nnMvewZORSlj516e?=
 =?us-ascii?Q?iEPOpJZRwCVR+kqedqJ9evz4yW6INxi386J3aC94UVLVMOTS2l/o/Ejo3yR6?=
 =?us-ascii?Q?Rm9WJnS81R5kmpp49cuSq0ode5fotCqtdywyyrKuqRxsIVwMkVmdaf5faRvy?=
 =?us-ascii?Q?SIWplpFhuF/aQis10Jnosc+Amyx69KSyz0iUMxMlKS0hwUPtgJxlJgHGY1xP?=
 =?us-ascii?Q?Zhf448SGDm5m0JHUbIVDWOtkbNVH2BQiY1tvuX7sNECuVmwv6kKX+IYoE1yb?=
 =?us-ascii?Q?+Pi+qr821GOnONJeMV0eyC1V66o2pvGcCbi4V1aYIPtyO+wKyTl/aNwSGfU2?=
 =?us-ascii?Q?P1MX+7F3srVgweHMjPR55oCQKw7EE/NavyJ96WDt7HgPARcFIFAEGgdEhDXB?=
 =?us-ascii?Q?S0J4bhPjJwu+oSlCOJt052XAGnEtj9vQqgu4dOxubBdO5YzpQRUU1Lmi8iLV?=
 =?us-ascii?Q?l4ZgAC48U/2pX9q1X8wVRdTIZ/8idXlIHipu4ylufiiTsVrmdoxsINq3KlYx?=
 =?us-ascii?Q?cNLDhcBSuBHEJOH5P+MnTsJEnfV1qJXeOV5jugPT4+OEXgLyyGr/KCJSBbzb?=
 =?us-ascii?Q?OC++5C87WUEB5epWPzQBFNY7EVwRAFItIseaXz9GxI+itwj8yNVZFbF4sq/I?=
 =?us-ascii?Q?RKx4mzoa+nhz/POujwzMBetd1aVrkfzuC0WXvQQp8UQZD8cSgoBOCQVVS5zS?=
 =?us-ascii?Q?LeoUe99YX5dBx+gCHugixVx+29aj1w9ccidvsm0T?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98e2d6c9-e987-45b9-a618-08dbcd8f3519
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 14:58:35.9666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MdLcX8JI85vNZFCndbQmh2q1VnWXhOUaZU2mTGiunvDC33zIdsyHQqdTbfsDYUzdPYyyHz8SvwgkBfp9BX0aBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7613
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 14:58:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189152

Passing timestamp as an integer was losing precision, which led
to problems with badly recreated sstate cache.

Passing it as floating point number fixes the issue.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/lib/oe/sstatesig.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 5bf1697e72..f1f9de253d 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -604,7 +604,7 @@ def OEOuthashBasic(path, sigfile, task, d):
                         raise Exception(msg).with_traceback(e.__traceback_=
_)
=20
                 if include_timestamps:
-                    update_hash(" %10d" % s.st_mtime)
+                    update_hash(" %f" % s.st_mtime)
=20
                 update_hash(" ")
                 if stat.S_ISBLK(s.st_mode) or stat.S_ISCHR(s.st_mode):
--=20
2.42.0


