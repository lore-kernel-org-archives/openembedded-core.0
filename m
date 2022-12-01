Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5617C43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 03:56:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.34298.1669867007561095284
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Nov 2022 19:56:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=nczotx/y;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=933431e351=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B13sNDL025068
	for <openembedded-core@lists.openembedded.org>; Thu, 1 Dec 2022 03:56:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=WuUUoJt+su+4ZbFz/zPpuKB5Hpl9Dso5D2SNRedc5IA=;
 b=nczotx/ynpfFzM2exrxV3qttUtygRgrWE/qPO1XAsbRhWFUIIHKObHtC/u7fbS+6sPyZ
 jGSuo/YpFWWVv02PySxVjklq/SW0ALULb+76rYB46ezgEkkGPIaAqOuj3PZDuwrLrUc6
 rk9zTqJkV1wbt5ZQpTpb+JbhNYyR0kxeZt+gIsEqnB23z0K/EIDbm6C+pWTPzmyL3jQn
 HqiWpc/KVn2TkkpnaNS9paMG6A6SA4Gtm2bV+LCPqKreknBBHahp+GDbjyri9sgZ/N4z
 GyIEoK3cQ0Wjdv6TSmY961tCcscTqaGf4jaTQbvVArymXpDO5LaKzsql5mHqO9X6HMj/ /g== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m39sbv01p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 03:56:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Km50XjB04bZnLIovLdc4Ec4Fcmxh5IiW9vzKzr1nUP++obTVY3f9EukftmYBGhvVAgEbJTsvpUkcr5Y+NKafOY+mQsRYZH7gdyZOsWPLqd2FC7hOHZ8ih+FdH5s8Vtlp0Kwc2HYESGICySTPK13UQBqJ7vKBVa7ggtB1Qk9nUw2FxxLdeabB9mDJpaPquqjT57zEEnkCBuYEimajz3Dpp5MVWLKB0Nk9lOOXGHazRrei7T79bEkvmYwxUGkXnQpo/JW/BsYhe+x0i76s5ajkjoiUWr2MeSt7oCWETe2gpG7S7L6sEoqe59dcVcQAmfDMCiCtRhV531GxbR3dg0F2EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WuUUoJt+su+4ZbFz/zPpuKB5Hpl9Dso5D2SNRedc5IA=;
 b=YC/lY/ydvAFmpUTgUqy4drP75JLhNcodQu1XjJPor82r8zScWDEJ8T75Ftdn6tR9xneVCW838oBTZZJhG12ELA68J/ag579LsR29N84+mrqb14MimVcGMW6DRbfTu4+zchq6IwpRzM8W82u1pw7CclABPGVBgGjTGjLtwVW4K52OnARpyltYw9egxc/Bp9WQtyIfVtl6dPblSmCK3oYmveRKNYVeIVm4yIn66AnI03qBQMy+ydXKsuY7QdqHPL7D3DmNq/++nlx3NHXQ/EVRKCRF3aDMrLbtLFy4tv31u7h7McnqskWkW9JwOM6blq/0TEULPLg6M5Wz9QlMytmOMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ2PR11MB7548.namprd11.prod.outlook.com (2603:10b6:a03:4cd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Thu, 1 Dec
 2022 03:56:44 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::d8ac:d3b0:6765:63f7]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::d8ac:d3b0:6765:63f7%9]) with mapi id 15.20.5880.008; Thu, 1 Dec 2022
 03:56:44 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] bc: extend to nativesdk
Date: Wed, 30 Nov 2022 19:56:31 -0800
Message-Id: <20221201035631.82225-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0028.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::11) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SJ2PR11MB7548:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bf2aff4-9ab1-4979-4236-08dad3500ebf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zs7EwMNhhrvQglwdX+amNIyeeZRaf91CMCc1dHRS4+iBnZeAmiwZVkEhZapTGttQ3VCRRHPlqex4NjS6/X2rXh4etCJ606lzrUlUx1yJAr2wwIgQAfUUNchb7BCN1rISnityyPWrxOTDcJc6fAe06mAtvFl0ZIW0z6stL07c+tMnGXryextmdf51SEdVX02d0MvcT8X01Rf1LNbq26L2hqMJHPt+kz0LTQc5c0fl/u0fpPMV9NBnWYM08FPFOXIgMSM9SdtRY6BavDRnCMbqnINwWRzZn6wRUz30CqQZlsVJxvCPejANOb/PzG+3tAjk4faWCrwo2VGpl5pRuTpmrkng28jjnJOGS8Sr+mxWuSpmHA42u3NJwNVww2TVsLWlDEA9DccF+JK5kNKId/U2Zui4iMhCaO+WxPawTwRSX00JIc46ERsGactp/UGg9eVOOJ37FLk2QpWgKCMHOu2CpCx4XwBI8OgBpb6mVgerrL9CmDCOb9/gyYnx2Y7XbxiDX7CCa7Nfc6EK1GtXrmnfK+vw+pJCbLb9T8n0HkYMVTNoJhlar8JDXZkT7XVZfb6K1RKaPscMex4KVwo3VAD6348iA0ILkCxkeAWj+GhfQ6gEEp7WM4nRcJgQBACZvfXqFZ5HQiH17vf/OchaKOFhNxsFWwVQycbwpMjVBXTQeHtKy5K2VVDVDJqjaT0inqBr
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(346002)(376002)(39850400004)(366004)(451199015)(36756003)(2906002)(8936002)(5660300002)(66556008)(41300700001)(38350700002)(4744005)(83380400001)(38100700002)(86362001)(6486002)(66946007)(6916009)(2616005)(1076003)(478600001)(8676002)(316002)(66476007)(186003)(6666004)(6506007)(52116002)(6512007)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ffuL2mO/rcXd4f12VRPX/i77vj7pNrESryEVGUqpaeIOe4qgMnkUWYCQObAq?=
 =?us-ascii?Q?TSXnCxcjOOuZt9JqmnjUi1POhAXzHBgurcq1ajanzGlySgzZG4gwmPEwZcjc?=
 =?us-ascii?Q?RliOf6jmKnj5AOYpuKUf6HsOj+/No1I01gIVQ9/UhSrI+Hq+d1d3MJdaT1eb?=
 =?us-ascii?Q?xmkTUYOPXLpbKFeC+GHarWUAkfSkao2hO2sz7D65VEU1s7gSBBwx+ZIjTt6s?=
 =?us-ascii?Q?IY6pCai2WLAxH0+QAVuCG8L7tVxXl31c3eGlBQ7oML+ChB9uUdvjGfCHs1hY?=
 =?us-ascii?Q?FXwi688dQq5CyMcTcuiphVS2W1ckBDBNv+Pg9DtcHB0z7usdF8y24AXg8aNr?=
 =?us-ascii?Q?QaSU+HvaANBh9vMVfzvXq3gGc9sM/VzWWBxmEEHnFGI/m+vFi5UwMOvcPNLZ?=
 =?us-ascii?Q?4WdEdF/Q5FYb1c1d82FYSh6I4O9EErRnKumG4DesC1DC0NNIn7RXPQdIuZ7W?=
 =?us-ascii?Q?OXTThabFhefMZpJK4wZRUC14g01YwiWqdpV0e2FMREegWetupKiUMPWXQK+8?=
 =?us-ascii?Q?zcGjz4D/c70XAuIS7lA6KxPAyieRvj7GWhDYzlEUZ/iSulYVf8nx30OwLxqT?=
 =?us-ascii?Q?mx8y1l5OIu7RenAWXpbVru3fsGN0obA+m5UdWPg0lP4zHWT8fL9mX2ouTO3u?=
 =?us-ascii?Q?WxBINLzGlKKATCgUbTy7aJ9PBhr48IYIreNikXusoj3WTQ7wbL11L8dMUjSG?=
 =?us-ascii?Q?7x1Urkzdepa4iN57J5cl5faRIeMHT+hhRMvxlGrapJm1Z3gTKG4jfJB65fic?=
 =?us-ascii?Q?kTEDfdBMG8Y/+Zhu1MZVh1Yl7VJJuUVW6yT0+2q2UfHmjvtD9TwSmaauqS3d?=
 =?us-ascii?Q?/05gMJCEXG7vqu0df28ksu9krnDGwGrkGF1Ye1aEaUI64nYgYQRv7SPC+D/0?=
 =?us-ascii?Q?6j7+eTi65rLRNfeZ10fXk0FlN6QnR3cDFBA9FDVSXSn4pnHoVunN91Jgd8D7?=
 =?us-ascii?Q?KCsouna/8oYX0osK7y4TioM4PnrAdyLBJIjqpzLrkiG4IBen1dOHjW4slR8C?=
 =?us-ascii?Q?/04+/yJbC19nzU3wnq3RgCmfQIXSs5d4X/lVHNaH34pZzsmMCY2KxkK1/ccv?=
 =?us-ascii?Q?TlghpsgHj71OYqn+dQ1cULlLNUaaGEpmPtJwscaaVY81wAX3Uk00/s4YbanY?=
 =?us-ascii?Q?WDhOGApr2oq4vTK13uJBVUPlTINeg0H9RK1U/dcd8tFeRCYJ8t9h0FN+e2UK?=
 =?us-ascii?Q?hKkxMq+uYjVyI6D3rnfy0Kj9jvmfP/y1lBQ6KGjw2e5YeYA0Y+UAq5yBFC/L?=
 =?us-ascii?Q?hTF7hET0yDGyROjJGL/NlqlSx6JpxatnKXhsEirU9jNr3yI4Tf8S7+hjKN2W?=
 =?us-ascii?Q?0v1bPJgZfaMqJmCdN1fmnhscayYtyiX+7oFqKWzZsPgACBVS0LdCOGLI8d/D?=
 =?us-ascii?Q?CwZXUytEHruon5Folq4ao4cN78wfJd9hg3Spy1cLt6hF0Wcr1IaPi2Q/RDHH?=
 =?us-ascii?Q?FqZbHLh/5oK9Bbsa1FtVj+Fs1de5zW855RCU+EGDnViU4PlFhbydqNfJ9MfC?=
 =?us-ascii?Q?2OmYnnSUxSA0Mn/5QsGZowashgXxgNDyJDIK995ieZ/6QsJyNtuuXW29M2Tj?=
 =?us-ascii?Q?NSvmY4DzHa79KNXPzKWc6e2vlgT7oluYsmKfwsC/?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bf2aff4-9ab1-4979-4236-08dad3500ebf
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2022 03:56:44.0384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5LkW7M5vkJ7Kd0EJLvLi3MZsYfWEuoTmyLdS5msnqWhqmsluBFpkBg2i8hlwyKRbWTe7JWG7/Iu3PP1Lv+/ZhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7548
X-Proofpoint-GUID: KoPFf56e7_B3I7i6MX1J4N40QfjTTvtG
X-Proofpoint-ORIG-GUID: KoPFf56e7_B3I7i6MX1J4N40QfjTTvtG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-01_02,2022-11-30_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 malwarescore=0 spamscore=0 suspectscore=0 mlxlogscore=482 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212010024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 03:56:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174036

bc is needed for compiling kernel modules, more specifially
whenr running `make scripts prepare'.

In linux-yocto.inc, we have bc-native in DEPENDS. But we will
need nativesdk-bc in case we compile a kernel module inside
SDK.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/bc/bc_1.07.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/bc/bc_1.07.1.bb b/meta/recipes-extended/bc/bc_1.07.1.bb
index 178588f11b..819da6cda6 100644
--- a/meta/recipes-extended/bc/bc_1.07.1.bb
+++ b/meta/recipes-extended/bc/bc_1.07.1.bb
@@ -37,4 +37,4 @@ do_install_ptest() {
 ALTERNATIVE:${PN} = "bc dc"
 ALTERNATIVE_PRIORITY = "100"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.37.1


