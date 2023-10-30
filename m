Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BFC4C4332F
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 06:32:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.143214.1698647528659799000
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Oct 2023 23:32:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CL+IUa4z;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9667f6a100=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39U6K1fX007599
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 06:32:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=m5IuzKdfSj/hQxtbB7
	vzgxOoc1+SpQnkUCjGsZ3HanQ=; b=CL+IUa4zTdZX9GEqxz+Lfe8A3Kjohs+rug
	mXzPmDcE+laSHol9WPeFPyHoKUbpD3hQw1/wPM0WJ1FY4r1sSGrX3b/OPUtS2ykl
	tcb3pa7H3HEw7dBT1Nu/RJZFBgrLOufzPvdxmQEzqwr9vg5q3uXuJQyGu3kTRveO
	YkJvieiaw5thfY8c+7vRDCD6iE0013NH3auX9yxLn2DDNsqT1i8VSRMkT/HiuGKM
	iUJLFJRhm9Ce9LOTJ6JS/+jmh7HPrhuvoE0PaS4s2vYD5NxSMn734PuW0Cg9CMpU
	jQhLtRvVxmL6I7b5uuObiYS5pF5zX9uJJFolaWliNhM+cmgukQYw==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u0s969w63-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 06:32:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a6WUfjWyQ4J/udmWPFwZS21Oj00bb7nTwm4cP8Z1iwbYmTMQDxvNxp6CXWLoY1ZJ1xb9VHLpbr+VO2+sM1eckGomnsg2OfwAqzD/pzQWFWTUV/MD+m15SXCQzHnj6MDKzsAzv0iod3g4c6m84kg3pf0ViYvG/H8oRfA1Q9xOT1pqsW5HA0HTzLq4wC/7a2uLzqYLl2WG3148szQeworj2yTW2z03oupVbeto0fv7ViJUVpKcaQke3x3Qo19d6X4I+Px5I/pRJfTdlw5Qw58GHw5+TN02WyFdnnNs/Dd1FAbBoUN7JpDsO/bTJGtxj48JW//irEsAlhCxU71z2xg7bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m5IuzKdfSj/hQxtbB7vzgxOoc1+SpQnkUCjGsZ3HanQ=;
 b=Lu4i6w95VDquwO9nEirQ3UQhsLXELU9SWqG8YFhE9i00ri6m4LjWQbAw2jWsnBnkofP5kCDcHKPF0xUYGu6q2Jpn+kTuYFFbmh1A9UypVXa1lHtZeAaIXzMU0WRjPDFXMH3KWc4vNOC6fkHOnKXuN0naK6vN9BIkpPrMmozgFacrsKcuuDqwA5OCa0VbRC+YzGucUBaZ6Fi7MzpwOW0xSJhwPVRCeGWqSoAzn+sfKLD6JWvN91TyIuwlkKVR5gdOvZ5diXvfygMLaDDO1ylwxdl9VOlFKHiFMrV5EZUtZceFt8tf0m53rNhjA6Y3TUAes3dNFillzolyzfzAxD3gbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.26; Mon, 30 Oct
 2023 06:32:04 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::1ea8:e7e3:acc1:8eb6]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::1ea8:e7e3:acc1:8eb6%3]) with mapi id 15.20.6933.028; Mon, 30 Oct 2023
 06:32:04 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] kernel.bbclass: add preceding space in appendVar setting
Date: Mon, 30 Oct 2023 14:31:33 +0800
Message-Id: <20231030063133.887363-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0210.jpnprd01.prod.outlook.com
 (2603:1096:404:29::30) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS0PR11MB6541:EE_
X-MS-Office365-Filtering-Correlation-Id: bbd8761b-aa1c-4345-4727-08dbd911ee4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ucJqwK+xeRvmX8WyGeh4Ar5UVTyQNg53I5tatZxoUVaGgo7sLhT+VaubklPD77ABFtCJdsdYZ9F8XM6YoVOGbUDmBI1c54DnBXODDj9qHl6qooMdN2MgJ/+B5sy3jMP9bBWelExfDp2sPYrpuD5UF6kVuNvhL7jeeDWp+isgFeAatYiZALzbqtNMdNSsFoMmOnur6STXrLpSTj9NTcwRxKk6tiRBFyJzsgFKKC70UqsXqWl7mCxXF79G/G955mGVmenX+5CxX1dB6i4GNXkgvQIf3saFPGzKD87LfEZku6OJqohLaQO7SDkcjkMu0eu9/9+D34PM4v+wGahkI0XFkAD9MXcZ85qWF+Oi+DzLiPWX0g33MSLNFmE+AQe/6avN8K0ARr0o3oehXuA5uH/vGUlzzbJ91rrAPv+nty3V6cUze3l1JBnDy7p4Aqyg42IaYk+XJyHANQQPFRFlpb5W9CtNrU9FvBdTYzkShvkJcFA57jr1Hr1c525QS5YX17D+xN2G/p1brZ/5hdFPYRNq4xTNZtmy/57kDyfqd8zpObFj1OEfa6w5bxqt2dL8j5VeUupGtR6jgpbwjXv4GDKDTRmzT5WX0vAgny/2u4V1+FfVAzrJ4hV2zqsLYXrz/vKq
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(346002)(136003)(396003)(376002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(36756003)(26005)(1076003)(83380400001)(5660300002)(6666004)(6512007)(9686003)(6506007)(52116002)(2616005)(8676002)(8936002)(66556008)(66476007)(316002)(41300700001)(6916009)(66946007)(86362001)(38350700005)(478600001)(38100700002)(6486002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Uqi7WxuwINxoSuKDWUlgt++slkOEclGQSj52b1vJSuGc7TkDvp4uwmgNdxV+?=
 =?us-ascii?Q?ME6X7PI7KOvgazPS4RvVCvzPahJKHxFddhIB6564B6glVtC1YQZwONJCRRmq?=
 =?us-ascii?Q?q7/itbL8f+ik7iCJ+0Twn+o11OtEp00sXrRaJALmmjLQ66ClRY45yfpo/c24?=
 =?us-ascii?Q?rVFR3JTsd7kYFWxXAbLyNWpkYmwgAG7pJZpNetSYFn/mUNbgGSswNDJT2mAs?=
 =?us-ascii?Q?cahYDvq24WTKB86QRcXY0sxpUt7nc/VMrvkkSvFzXZ+ja4fiAg1o7SZKfoSa?=
 =?us-ascii?Q?+iehkfKnwD6xFmitdD9AxNUuASoCy511AibfU12mM34Z4jTa59XZXH8J2JWG?=
 =?us-ascii?Q?xl25B0kpkxDoHJNls2AnvLAxUBncRqXn6/X0EQ3FkL/i+0VYvBvBxzTFSA96?=
 =?us-ascii?Q?ErjmRUpL2oLnbk80G3gUhmYvKoD5vfNyTE8pHYrWUxo1N03R4ecpBTshlFyK?=
 =?us-ascii?Q?PWJc6Xl08Rp8QyKV/WDI2/duADuaudcL/VmHS6vw9F9l9LS/NrrXlokI00AY?=
 =?us-ascii?Q?jhPLmnGeZ7/oGFP1GSXiL2VvhuXnwmMA3pDK9ptujI/v0hkiZZpOTtnYu+JX?=
 =?us-ascii?Q?/krHWbxPUd6+PIiL+1BLreSetwKqruTx01W7/AjaIt1aN+fgjRfjsdGrnY5w?=
 =?us-ascii?Q?kXxlQ+T7UcD/btbLnO2jMG7rXLojOZFbK/XwYbdqcaWrKjtWqya/4gT7a4Ke?=
 =?us-ascii?Q?KoH//ywtVZ68XokTipHinNtS/kA7UcD0kG2JonMEVVh3g+osS5f27Bea083j?=
 =?us-ascii?Q?kKFp8uSBhluczNBwlc5D29/j9JIJAy+impZTHQAvw4iw6x6vLdz54OVEJLwb?=
 =?us-ascii?Q?Qb1LgzKkDJKRWbLVI8QtGy2/2HGZG5hD80DYgjgSYwIixMvrnlNcenoNEpps?=
 =?us-ascii?Q?zB+0tK8vhFccBumYPGrjguX1jTciB0j4uDSfwEFpVra8tiGTXngzzuvHXj14?=
 =?us-ascii?Q?ski2lOiiVMdmJ+XQ8wu1dpdHJrzBmEGMkA158a9hL6GXvL5cQp01H+EPZYKh?=
 =?us-ascii?Q?OKF4S31FJidnJ2tyqJNBAiUMpn1aJQjF0V43VJHPT7STsdA4AeXRxn3DdPQy?=
 =?us-ascii?Q?qAkEGW11jkLlHHpMxQjc8Y8+bgUe3KPYJVtw6b4PthIrFtmK9rUViPfH71tr?=
 =?us-ascii?Q?/+Gv3U7gDGa4ICkYjKvjJlu8osS8TVz9sRH0lOC6KNtoBnGsAAPNGLFE0PfN?=
 =?us-ascii?Q?pFRdgVMsj84zryfPB4cjtyu2YTmu+kbnZ8zAwBb0u83Z+psm2JTaV0+Z/uNc?=
 =?us-ascii?Q?J60KzdEFTiKczIA3sLvvsMXis3o/c5NxvcdzASdjK+0P5k6n82e1Krgdx0fa?=
 =?us-ascii?Q?y7OcClJKzj/eFtTzGGHxfOe9ROzV9AeV6XWYPZsqjJGD24hkAhIV9Uxx/2ft?=
 =?us-ascii?Q?pBY/20PMfiWX2gY+OtqRj4q5KH+oyxI4E3cKYjwy/Ti5T9GbSqrcEJZCZwLL?=
 =?us-ascii?Q?Q7p5TQTxnpdrLTJYdr6Nr2hvFdf8rt90pMQGGcHPuaytc//9E6Z1XnpkUfZJ?=
 =?us-ascii?Q?KpN15M3gcLRZffzA7ooA08yVbb6J4/Mlt/lpNPdA6nibWsQd2sKBkhC/6ktB?=
 =?us-ascii?Q?Mk+zds0wSQqJq6VOTPMFPN2Vdszo/Yhuh2NKoPLO?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbd8761b-aa1c-4345-4727-08dbd911ee4a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 06:32:04.1522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f7wnOhKn+CfIzFNaEup1nyroUJvjum6GzT/qh5vD8YyXwP+vKEMftg4U81dq4ECv2dFGOwxaCAaoz/3nCixMmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6541
X-Proofpoint-ORIG-GUID: BOUhFVbmB2TmQkchWpCW06cmkjp1--Nt
X-Proofpoint-GUID: BOUhFVbmB2TmQkchWpCW06cmkjp1--Nt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-30_04,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 mlxlogscore=730 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310240000 definitions=main-2310300047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 06:32:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189791

From: Chen Qi <Qi.Chen@windriver.com>

The appendVar setting should have a preceding space, otherwise, when
KERNEL_MODULE_SPLIT is set to "0", we'll sometimes get dependency error
due to lacking of space.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes-recipe/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 2ec9ea2091..5eee87fee9 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -111,7 +111,7 @@ python __anonymous () {
             d.appendVar('RDEPENDS:%s-image' % kname, ' %s-modules (= ${EXTENDPKGV})' % kname)
             d.appendVar('RDEPENDS:%s-image-%s' % (kname, typelower), ' %s-modules-${KERNEL_VERSION_PKG_NAME} (= ${EXTENDPKGV})' % kname)
             d.setVar('PKG:%s-modules' % kname, '%s-modules-${KERNEL_VERSION_PKG_NAME}' % kname)
-            d.appendVar('RPROVIDES:%s-modules' % kname, '%s-modules-${KERNEL_VERSION_PKG_NAME}' % kname)
+            d.appendVar('RPROVIDES:%s-modules' % kname, ' %s-modules-${KERNEL_VERSION_PKG_NAME}' % kname)
 
         d.setVar('PKG:%s-image-%s' % (kname,typelower), '%s-image-%s-${KERNEL_VERSION_PKG_NAME}' % (kname, typelower))
         d.setVar('ALLOW_EMPTY:%s-image-%s' % (kname, typelower), '1')
-- 
2.34.1


