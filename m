Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3332FC5479D
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 15:29:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.26744.1673450941350325924
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 07:29:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=hXfOAF6I;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=037548e3f3=saul.wold@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30BCKkQj006870
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 15:29:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=495FBYYT7sRyfHVeu9mKbIoFriPjlxBGg+zF9FZqUIg=;
 b=hXfOAF6IcN2yBydELtZRgdfLW28cAFMd8M1Zx2GVmfbmqx2smHoofn+Fs8AfYs7Gg3ja
 debvb7Ega5A+9BcISvp8UWydi3sAxV1Z1bLqLHCkj4goGo5tWu/ScoH1RMESgigrgwo9
 t/TGBA2Wdtdrr2PgYnTOzxCAN5rYJRfPwuXUd/IVcyFtFW45djxKYHjXF3mUXE4oG1aL
 Svzb9ADNVNRYt35TIAZmydvKq/7V23xsrRmsLOHG3xPwlxqkHCFV2OrpcmVhXomeBHtH
 qsgqCX0REURf2XtZDCSHOGiv/ETxkoHtkQc5AoAp0gnWopgWDuzsu05Oz6hTnUmZGQHS Cw== 
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2043.outbound.protection.outlook.com [104.47.51.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n1k61gh82-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 15:29:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PwgRrKndwPdP1SkLHCzAY6kESMTm3m3oK52gYwfLUkIOPFgxwqTpPnaUChPlUCd1eZVZvIIAq6ecNfC82pvRFO6zacANB4SgUn+FG3Ea5V8YKQl7AyV1qtJfaDm/+HRBiwF7GAMEZmVWNdGCtvDU3qxKD40pNAn3MRCovICM7TwTZX2BsT7RJZaMLOGkTwssm00s6YahMvea2Ez1Awsm7zdhoqRPj5jexFu3CoscTTvM3fZhGT/f90mfHCWDHw7mpUOfpP5dEhHbkL+d2LZnpYqircifQ1V7fhE1jSyLHNxyMxxNhSGNV9AbGlS5yx8Z0FOyT7NXa1fxxVb7U5RlIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=495FBYYT7sRyfHVeu9mKbIoFriPjlxBGg+zF9FZqUIg=;
 b=D2LDzz8+fCFUO4S6+5kTRkcu36azPUyJ1liMVbDN7VY9PaTzWZYNWCwS9ufDxQsLwuuGjxxH/7Q8/fEkcLNfKqVkyg+8Ex3KoQui4AgKS5K0iq20nMNo4xhSZO2BN1SQTyPp3UkWitM/fCxE+1A9xCzI9i2i2Q62Ii8JXVj7HWi8ZA69xV3Bp8mPcaqVrS0cQPbHexUuwjfyU51yPvVQ7K26kYjiroNs+PiYRhUKAUHlw2kmw4EqddEP3wYQjirOsPbbHQFtsiwSTEmuPLl59DwTv96kR10/ip0zo3OaeehCYK+pQ4rg7FIMaCt3dNMsoRkjGldnOO7lt/QZg4iXrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN0PR11MB6035.namprd11.prod.outlook.com (2603:10b6:208:376::13)
 by CH3PR11MB7276.namprd11.prod.outlook.com (2603:10b6:610:14b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 15:28:57 +0000
Received: from MN0PR11MB6035.namprd11.prod.outlook.com
 ([fe80::f606:748d:1395:815f]) by MN0PR11MB6035.namprd11.prod.outlook.com
 ([fe80::f606:748d:1395:815f%9]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 15:28:57 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] at: Change where files are modified
Date: Wed, 11 Jan 2023 07:28:41 -0800
Message-Id: <20230111152841.2307746-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW2PR2101CA0010.namprd21.prod.outlook.com
 (2603:10b6:302:1::23) To MN0PR11MB6035.namprd11.prod.outlook.com
 (2603:10b6:208:376::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6035:EE_|CH3PR11MB7276:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dab11ed-2fd9-448a-aac3-08daf3e88e38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7zvZDRdvqyiO6H1oyrO8Yen5UpLRyZyy5OPACz2Ec/r1U0p3i5zuofkgCnzB0XR4d9pKcvTzxupr8n3kHsikA7cdYAVeI4VCkk/18l1miCT5FFXKA4tiTvbiugQ8cyR0P9OppjprpXZvuxC0UAF8eRaaBywRvJE5NdR9snzSFn7Pf3lxqRT0vxJwFdHP3klxGzBcCXqTyeVqDF3E0POa4ofniwQf41jxljz0+TtRkwcQyotdLR6JR51Sa5dJwWYXVib1F32orJ3IThKq85pRq4nJXl2tVASI9HbFWglBL7bF7oZystJKwhaHiDKL9WptNqHSLsf3X4zyKNMbyE7z1M3jEQ5oJPbHNPvmZn0H16w5FGv+XaVjk0LCjzzV6OFD8YvBpErQmcyfAkVvQx9gqL9KJXhDS6fRBA+Pbt71u6loRMQKKH3u7LuekvNZeazG9buZb6nL2rc+MydYWjxjns4Q5BH7VJtxpvDQkapETESRNm7OlPiGVR4ykWGvmdmpscmRAmZvnKCaEFGnJDbh4QkUJW5GDb0nxuinXE5qdlU/tF2nC+exkORM9UfpsdRS7Ax6YwylgKV1l6fstymRzyTeBsOKc0cqqBpkEjIidd8rum0keqWQ9xcjysPVO8QTm6YmPLy3cbG4oMilOsW5yd1XBjSPEfg+R6b1p6RH4qwvL9ZMkZZZ2/gYy/EWfK3fKb7ICTigP7F77BlnjflvPA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6035.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(396003)(366004)(39850400004)(451199015)(41300700001)(1076003)(316002)(2616005)(66946007)(66476007)(6916009)(36756003)(66556008)(8676002)(83380400001)(86362001)(5660300002)(38350700002)(8936002)(38100700002)(4744005)(44832011)(2906002)(6506007)(6486002)(186003)(478600001)(52116002)(6512007)(26005)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+l+cJ/QERFwqsA8KGqaE/jR8Em9vRZGRYJo876pgQ0W9q3HsC9XaksJL28e9?=
 =?us-ascii?Q?oML6aQUnTKbNzdbxuiNvNlufUtCMAyjcCyLaSguQfCJcpxhPE0HCuQ9adzCE?=
 =?us-ascii?Q?VI3C3WBE1iAjfNtiBrUmmdJZcIIURADTw3OklUqNgW4go18yjosCbtQOPplM?=
 =?us-ascii?Q?gGkhP4/TAnqaFAnwWw4oyHH9BOb2xRf8z0jlXjQxEOYrEAMbI1PPbgX6oYi5?=
 =?us-ascii?Q?oBUHtVl1SzOXeY+w8Sgx5XZj/iwSmf4kNmaHGzmI8Fy/kwVFlIO2rPdjfHSl?=
 =?us-ascii?Q?n7JYq4ET30f6c5QqTsI3ldzzrm9t+B9hMqslyh3qYOnTb7NaMBp4CD11NgrP?=
 =?us-ascii?Q?yFWgFvi/3bqh8T+QqR3TVWYHDwexbAlwK+hLj12Nehc3wuMLTXCbNx8PtvyB?=
 =?us-ascii?Q?Qfy1xWSbDlJ2f7yH6/jLU83AqF7754IgjAxxM9dzBNKpCDITx+rgJ4R2SyuV?=
 =?us-ascii?Q?Bg4v4kDZjCbnVunGt+aaagr+4lm82kv1q+9c/RJt1nQKi0KWmJpvLz3uejMZ?=
 =?us-ascii?Q?LLd0mnb8sVLhqjQQoplbsv4AC/MZN99A39/T4gbD6j8xLooIBcopvCZNrAM2?=
 =?us-ascii?Q?maWHCn6p31OE1wvUAOc0SvjQg/T2/8PFnmjDtV2//rK6R6oBEc+S0yTiRU02?=
 =?us-ascii?Q?NSB8tnOsOUGitR7HUrqCAWAWqPH4J54J3W82pLAujQBUq1baLoe4iwx5F7pM?=
 =?us-ascii?Q?Csg0HrIF8uPua8zB2J3sB8zsx+e4yGLRCNGRqo3sU16WZcJnKIwqkjd0GNwC?=
 =?us-ascii?Q?KyyDxOnEBoG24plsdAKEarzfmpJ19pr31K6r/pzmgf/+ZfCCNbSXjhwzqx5x?=
 =?us-ascii?Q?i6WumoHMZouHUAiAQ1B0l3jOfBuco8zsoBMHZaFvIn/eFbuvNz1gbQnLWmOW?=
 =?us-ascii?Q?3aRxvpiajaWTgSpMWMlxtPT0IAkiVZPgki8NvIp2mn785cMuajkpqevAUEzj?=
 =?us-ascii?Q?cxKKfYeMJLg/5j1eahr6W+Iy8X+09kd7W5nmrm0lzFGd3oy0PXdYI5HHKayX?=
 =?us-ascii?Q?QNGZOBGLH1N7dfxgwVtjycjyOxFPh7A9MBpY5DtuIKVuOva9zlcH9iybp0cD?=
 =?us-ascii?Q?GXrcpO3YS9XtUcmov7QacLmEwi6zTulYZuO4Zafi683u3UygMJRvVYUmjbH5?=
 =?us-ascii?Q?luBTr5w7s4PVljgvxHEj88CgSK0PzggAWI4ZSPM/rJ/uf+h8sX+b7PDXd/SL?=
 =?us-ascii?Q?PJHjBF9TgSiXCmNTcXPgqYVZMv3LeVloyniJztl0dcGD2rZONiPSV1/fwPpq?=
 =?us-ascii?Q?ELukSq30fkSrnH1UCgDOmV4st+VLZfh/vGEfYaovFZModkzAWjmKKz77+1/T?=
 =?us-ascii?Q?6foGXS1n7L/RTqCs3D5nMeK68Q0c+l0I+YuayQU5POCk/ex5j+vuzmIB+Lg3?=
 =?us-ascii?Q?PECR3M5/JsbIBIMYvIYAu3Ov3NlfVHKQLOinGLp18kTbHkWWOCqG7NQNOISt?=
 =?us-ascii?Q?Lp1f+jJX9WLtd7Uq6ZXg/QgLpOOPqFpyDRY+axrYxpXpgmYFO+9NYvRVK79Z?=
 =?us-ascii?Q?imr3VaTmW0xIbYsq+iEH3ixKWZm2zXajZjkx5RWPE1IXnNqeY0bM9hlk//HD?=
 =?us-ascii?Q?hvVTwyEyP0x2BriSpQd05kcsqn3Nsw7OA4Plo5CFbVjFC2KKgV0BA84XInV3?=
 =?us-ascii?Q?fQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dab11ed-2fd9-448a-aac3-08daf3e88e38
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6035.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 15:28:57.2730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i/0ikGG75LVzYtXnkqbF/68dhFP59ARpOwkJL2JRHiOS159eTxlMiUdpyVdiSYlxF/JLoRRfv65r2eu/IihQPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7276
X-Proofpoint-GUID: Lex0lS_uZUArCiTGK9llA9ZYP69tFMJp
X-Proofpoint-ORIG-GUID: Lex0lS_uZUArCiTGK9llA9ZYP69tFMJp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-11_07,2023-01-11_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 mlxlogscore=695 clxscore=1011
 priorityscore=1501 phishscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301110113
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 15:29:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175753

The create_spdx code relies on patched code, if files are changed
or added during the do_configure phase they will be missed by the
create_spdx process. So we need to ensure files modifications/additions
happen in the do_patch phase.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/recipes-extended/at/at_3.2.5.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/at/at_3.2.5.bb b/meta/recipes-extended/at/at_3.2.5.bb
index 87a436173f1..45700366e0f 100644
--- a/meta/recipes-extended/at/at_3.2.5.bb
+++ b/meta/recipes-extended/at/at_3.2.5.bb
@@ -52,8 +52,12 @@ INITSCRIPT_PARAMS = "defaults"
 
 SYSTEMD_SERVICE:${PN} = "atd.service"
 
-do_configure:prepend() {
-	cp -f ${WORKDIR}/posixtm.[ch] ${S}
+do_patch:append() {
+    bb.build.exec_func('copy_posix_files', d)
+}
+
+copy_posix_files() {
+    cp -f ${WORKDIR}/posixtm.[ch] ${S}
 }
 
 do_install () {
-- 
2.25.1


