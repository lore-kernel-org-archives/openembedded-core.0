Return-Path: <zhe.he@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0C63C32771
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 08:08:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.26141.1664179711446308329
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Sep 2022 01:08:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=o1KvDiP8;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=62686aa93d=zhe.he@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28Q7tUgs012167
	for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Sep 2022 01:08:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=CHDx0BSJJ6EbI8WCYCpfrSFH3IWJk3xWsCq0jxEAzaU=;
 b=o1KvDiP8+0Due27qg3ThubNZ4FCJQAKgbCekQZaSVjsqLCcRCmLn1H244nHFB53FUv9t
 WuQewM5ivwsPrKkZ+G0r6e9n+Q12zCY4R4VSqdPNc5Mbz5KvUjI8h0rV5Q8mcCKYrf4V
 AxUzEvLFxBB5K275xe92nWOnpmZhGIr2eKmUfub/hgoDqo+Vc0w6w4bV90SHVv720Oge
 wBQbNhdqhN/hxWybm543msk87eWV7R0WHVUD+OzUJE75RuH+eZG3wRdZf1x5PUI3bxgI
 IZYQXKpYcRqpupmJxYa75geJAJ6aT+Y9A/g5jZETzXd7JRKNIEex8E6xkXumj4x3AWdq SA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jt1dk94a4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Sep 2022 01:08:31 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28Q88UVx007980
	for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Sep 2022 01:08:30 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jt1dk94a0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Sep 2022 01:08:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ha78qomCwxzBMW/hTuKGCKX4/sEitUZz7Z02+AeHFaJHEuWDR8WgtJf/A6yOEb141BNq6sGJ2Sa+wt/rUbE0j1iRlqrUws2mfWNVqk4Tk+g8pab5hIz0cQ6RRAxWVzNfEmRpCs4FwFduvxviFbFVF3ZzrGXU+ulXDQlk/xz19bJPf6gIZ0rXmfxrQAM2Qv60dbsGcAQygwuBdYsRc7aJzyJs7qRkQpeAQUp5fPk1wrk3ukuVaxmWeWh5qfCGMhgeZMXLnKh2oYU28rGxqk6fICEL/ol0wRAKzoZxJpAgWyoZaStTwmfTc9W+G2YtpQ8Tlo3LI31inSkzU9IB40/7Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CHDx0BSJJ6EbI8WCYCpfrSFH3IWJk3xWsCq0jxEAzaU=;
 b=og0An4F/uyQobNsdfpH630VFkUgd/Y+tOLYjDMppWjSm0rC2PaAlWNfxBXQP2SzUYo5p68EnY2szlo9NK4APNedcLh2GNG/+uVRnnxSmNn4tkxKy/OBoHqrBmYmHTcHaNoEpLbB/Fq0Agh8tkLIB65+S/YUmH5oxOSIpwpGlWdFzMIIr4AMzHuh22VASfTxw0Yy2MLf6duibViE27pio9CRKw9MsUwZFgUswa3lEPF/vWMh9J9dGxU1gxi7iVBq52uZdCnx93kaaepccYSlxuq7pWOVUFFrrl54qfCMhO66broGwiWqzf05791EI15rutOBlzlnckehvUAEK7lhkqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by SJ0PR11MB5937.namprd11.prod.outlook.com (2603:10b6:a03:42c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 08:08:27 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::2572:6bb3:3214:81f8]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::2572:6bb3:3214:81f8%10]) with mapi id 15.20.5654.025; Mon, 26 Sep
 2022 08:08:27 +0000
From: He Zhe <zhe.he@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, jonathan.rajotte-julien@efficios.com
Subject: [OE-core][PATCH] lttng-tools: Disable on qemuriscv32
Date: Mon, 26 Sep 2022 16:08:07 +0800
Message-Id: <20220926080807.1625573-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0001.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::7)
 To MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1358:EE_|SJ0PR11MB5937:EE_
X-MS-Office365-Filtering-Correlation-Id: f92282ea-7d52-488b-a161-08da9f964a5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6qgVOtQQZxGiiBiUxXp/pj04kbxVxr8jrsrQOFGcU/xssJCsL7y97WDmfeqmH1u+sX+dAtsuWOqFl8GX/FYJDqGrdhbtiae+X9HfOWZiUpqwDk8bmoXvTQPoD6w+2WtWiUBlIYjHM8wGrPriEaW9Tc1AuYTq6cgcoT+8ltvhef7mb4q383cuVxW0wTjlFXXGYNbHpE7WBsc/VINJiqn2IZynz7uSNftTHjFpxG8Tjwd1dPo3y9fhxOhvogtXX5PexHnWdXUVtsgazykneL9KIqi+rBYOhakYIbCnDvRHmCuTMmvDCMLsw8GyXIS4wpvrANQmXtvXTvOB404Sbc7huzaW4SwL9m8Y12yZD0f3x+0LvXoFIcDr1z0QgB9snqa1JPksMNKrTJ/WvV6Et78f1QEo3qsy3lb5j79MueyW/7eRaH4CrcAbhykkLbLalFp69jMDxkJGa6/a4/fh4pSjRNgwoYcSsjGX6CjAO9z+JiF88pJC3P+814X7losPWUbnmoYAra8mXK+1yxoFc6QaHR1iQX9Ty7Ii+LasvQhSQuSvpxhaTspCV9KOXjzMUBp/NKHDOVUEqciLox2XqcB2ZhB3g76DvoN7jeSIaqNl5IHFzFQ38rl2tgAwofVZY8htO9EX05MDhvOn579CupI+nBPKshIJRoXcQmw8DBu7rMur7n1ro89QL5IhBrM4QS8pd834QEmxe0fqigJidzpkH4l/56AE0TWVt4+8dEWdXHEyH1JYs3RDR83Su9ViuWrnRp5roPdc0jVb+oFzL3UGU8IreeuUYsqtLBWY7fS/R9dXco9x1SIeYp1wAf0DOI7Tvn+DnsdL4u/acFHfX9rMtQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1358.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(346002)(366004)(39850400004)(396003)(451199015)(66946007)(66556008)(66476007)(8936002)(5660300002)(36756003)(2906002)(38350700002)(38100700002)(86362001)(186003)(6506007)(478600001)(52116002)(26005)(2616005)(6486002)(1076003)(6666004)(41300700001)(83380400001)(6512007)(8676002)(4326008)(316002)(966005)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bt4Vd4X9blbkJrlWGWEI2C9GmAG/qK8P7YTyKmnrW949JnsOtPGNR+vgjlxL?=
 =?us-ascii?Q?WesvjtZJKuwMd5zIkOatWgLGBUCDD/nuw8pGOZCbC4Dcfyz80AMpsuYLPnFp?=
 =?us-ascii?Q?qAw4QMp/K7KUiOdOMAvYMXZPFpXwj50LPFGL7/tXqI5uCVDg7aQzOIZaq1L8?=
 =?us-ascii?Q?KTbjWRQ+JG1ZhRgrPxf/rFFBgbArdrKl97eSbMTDsMS1AXL6yglX1BByyx5j?=
 =?us-ascii?Q?5hpOtraoLA9h/tKZ09IRCIhUp3ykYarpNRxfxh8+KwgFf1PgTzpm/Py5sala?=
 =?us-ascii?Q?Z9ahUVx1Chf6m7VFnh7fBVljNxUzaPrx7L+8e1Lli4XtpbdYjNAsoveIHUf+?=
 =?us-ascii?Q?WnfJXsWj/vbTRw5HgoLYhKLoNCbJ81DYAOHLehL7KWr410X0Cc3tl63Rdo0H?=
 =?us-ascii?Q?obZznmwS/3BuL+ZSL/lVCHzE2uvlb0yavmTiVRnxuSaNIvOFmdJIUZu7jWKp?=
 =?us-ascii?Q?apJOpuxTkukkvE2kQ94FlsEGEqm4qO8cq0s4FUkEMJObVrGL2oCSOYcZL8Hc?=
 =?us-ascii?Q?BOnOBLPouOaZLhZu7oDoy6fFRo70jf04UrvhxI0+rCuwQWKZ6Z1GPP42Hg67?=
 =?us-ascii?Q?8W3AaTF7Qaj5oD36JtEOEsxfvCYas1oDZUPlkFeZsOdFb8IqlwAJleJAbAOK?=
 =?us-ascii?Q?VL/FqL33dnFFNzqGkYMw4pwLiAO18gmHiMx8IU01s0v886CJCb7q8HXirzsy?=
 =?us-ascii?Q?aczC1iSsikXG0KvV4FZZiaEr9VFLPVPlllFxuaEvpSxt/3dIkv2yAzBYYeY9?=
 =?us-ascii?Q?JWRm6yvSObw7PKuM08plFA5lwWo/w/Klbs9cqdjajKQsYxNDLf9A5bFegv94?=
 =?us-ascii?Q?mLgH2cc1sVjNRjCbgvntDJREd5kAfXEK4j1KLXdT8uaG9fCYjpf54f36PEwO?=
 =?us-ascii?Q?OmJaDiVgdlmvEmRNPgDhtgwllyeTdQQ6wz3A0JxA9nk9l43T0cDGPV2W3sKi?=
 =?us-ascii?Q?Ep/iDldn9/jgFpF0x3+lOXddp3IrYNkZrIFnfVFq/HNRhNXQtD5w/JYG4Mk/?=
 =?us-ascii?Q?2dmbmruSn+y9TkqSQFAud9coHQXfz0HHWtNFr5SOzcVcnv2zI7onHMixDHLJ?=
 =?us-ascii?Q?URq5QHcZ2mEe7S11+r+juUzaYdVusFj9d0aLyXP7zCxMA0VToWV/ExPajbfW?=
 =?us-ascii?Q?pNt9eTYdQaCX0sZexmNa7+xhEap/LjqqaVEpmlR04oUJX2vyZ0nKrVbyqgJ0?=
 =?us-ascii?Q?1hl9N9b4tqnu09t8ull532v1/E30Bt1qVVB+HOB5/6c1QqAo9efsK7RZr9t7?=
 =?us-ascii?Q?tsoZjgf+WSV8erSZwD/peb4R8+2YPwjAhX9OIUBJo9xQHV8Ppf/wz/LEiR90?=
 =?us-ascii?Q?QNyOKlHyue3BdUnM/Wk43ZAENuRlt/YYSv/wP3p4TO/Kd0sLSy67ebQP24OY?=
 =?us-ascii?Q?vzNIQWmcmo9LqrzzfrqziXaqJ4L/qdcglFbQ3ahLpcA0TNZ9eeA0O0unN4dJ?=
 =?us-ascii?Q?GVa2QSofc9heVJkp9pbmKKsnDRH7Y1bT0TXEl4auTaLp6cDG9xc01Iet0wf3?=
 =?us-ascii?Q?V4K/hpmcXT7x1chIBEe9kVoKSP9FE8d9eN9tAyccnj3wHx+rpmZlrVZlgvrY?=
 =?us-ascii?Q?lkVJSeQEeBxVVoy8A2ADn1qccvvcAJR2JcRzkJHq?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f92282ea-7d52-488b-a161-08da9f964a5a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 08:08:27.1304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 CronO43f0n6iK2/tU9GvUndwtHJTxbOcMAm4Sw3J+SV/DEem7+3JIIjwa7NVx/I+WlrNum13LwozAOF18yPzkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5937
X-Proofpoint-GUID: Nk5Q_BPQFy-31mx5GTd2JL8E8nQGZPh6
X-Proofpoint-ORIG-GUID: 9CTVnRFzLwEsLBz9eCaeHVl7FWWrIE-q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_06,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=537 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209260051
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Sep 2022 08:08:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171052

lttng-tools requires SYS_ppoll and SYS_pselect6 which are not supported on
riscv32. This has been confirmed by lttng-tools upstream.
https://github.com/lttng/lttng-tools/pull/162

It's also turned off for riscv32 in meta-riscv.
https://github.com/riscv/meta-riscv/blob/master/conf/layer.conf

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 meta/recipes-kernel/lttng/lttng-platforms.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/lttng/lttng-platforms.inc b/meta/recipes-kernel/lttng/lttng-platforms.inc
index 933c65d85d..98b13b194c 100644
--- a/meta/recipes-kernel/lttng/lttng-platforms.inc
+++ b/meta/recipes-kernel/lttng/lttng-platforms.inc
@@ -15,3 +15,7 @@ LTTNGUST:arc = ""
 
 COMPATIBLE_HOST:arc:pn-lttng-ust = "null"
 
+# Whether the platform supports lttng-tools
+# lttng-tools requires SYS_ppoll and SYS_pselect6 which are not supported on riscv32.
+# It's also turned off for riscv32 in meta-riscv. See https://github.com/riscv/meta-riscv/blob/master/conf/layer.conf
+COMPATIBLE_HOST:qemuriscv32:pn-lttng-tools = "null"
-- 
2.25.1


