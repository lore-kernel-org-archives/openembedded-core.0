Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE770C433F5
	for <webhook@archiver.kernel.org>; Tue, 21 Dec 2021 19:08:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.9828.1640113714885971052
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Dec 2021 11:08:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=s5Yt/FAx;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=79896d8bce=saul.wold@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BLIg09b012784
	for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Dec 2021 11:08:34 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=JypqDGPr9mxY9DENWQcivhR9fKnvkI1ZScf7n5jrMnI=;
 b=s5Yt/FAxGZOSmINrRQhQ66X2aw32NRzRttXcD5Ls7EmiN+UMsrSyJMj39v8rytQ3Yszi
 eFGSY+0+CcZUsCrHGuP4wS2AqIj9Cp86HR/WgF78syhzKljlF/EXAm262TnE0lUZNcHr
 qwg2hxyVNT8cErLyuXtuNg3xzEU8khOPoGvbjax7klN/gIgu2C+/LkB6sRQX+EHbF3Ht
 KjnKfLn2QdLhH7VrsGEHO1NOogY+JjpW4fFBnvEvE8oUtr/RKxkfUAvU770ytNAeA/zm
 B0zYujIPc6+JPoPoU3YAF3ByU9G33B5zCXAqBqccX+D3xDiFaCaK+LCtqPk9SaG6v8N8 wA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d2rdah7at-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Dec 2021 11:08:34 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1BLJ8XT2007646
	for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Dec 2021 11:08:33 -0800
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d2rdah7ap-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Dec 2021 11:08:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=axYZs/mOZhBHFMmPI2M07l4+6BpD5rdBFUf3toJYGytQKJeDG5xQlOt9/JoaJCm6Swwxe2AbIjdz9YPd9EbdlpGqrSi3sdAsLo272EWazcEx9SLLiwwRTjobkWDSgKqpwbEpQgZr6CLkCwVTSiwvdyfZY6MnK7wTyADjP8nAla4F1ttY+fdy1kThPq5j8+sVm8glwq1lB6Dp+CCOX28SEsBWh3Ad04T1Ss9W9514b199cE+FV8ZE1GvKlrHQOzA1aPOYe0K3TCmF84v+zQfs4FViTf52EgSEbNxyTfRMoXtLHhtdz04TMrtmxd3k2uzumRIj+vkntHFQrbOchmGCvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JypqDGPr9mxY9DENWQcivhR9fKnvkI1ZScf7n5jrMnI=;
 b=mcKo+5xNn8vqFBx3nYbAaqPkNUHjwthBsyHsJS3Tb6lGTvIN/hi3reHNQVTaKdjLD9x36cHviJQnmoPoib5FzBhKE39SEn5AJSAXqHvM+081GjxT+YKFd72NHGrRoqWeJoczlggbD6jEro9USSZnK3ep/OknfeYl+Fy34bIGqquKPwOaFGnXSsxvr4hd+X1XdoB/uSuSX9xKOE4pBksPs5KJULlAHMFPgACWE92Sf0ds8w1dOQL03B/OeGNeV1Ekqj+N5k8BGQytUcGQXGRoLFcAPUYZi+3SKBGgCYbffUn1vLT7TeiV8TnACcR3qQsQanx3w03QUiM+BWrPg33tWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MW5PR11MB5930.namprd11.prod.outlook.com (2603:10b6:303:1a1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.18; Tue, 21 Dec
 2021 19:08:32 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::119a:b2e5:c766:f43a]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::119a:b2e5:c766:f43a%5]) with mapi id 15.20.4801.020; Tue, 21 Dec 2021
 19:08:32 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org, JPEWhacker@gmail.com
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [PATCH 1/2] kernel: add -dbg package
Date: Tue, 21 Dec 2021 11:08:08 -0800
Message-Id: <20211221190809.89882-2-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211221190809.89882-1-saul.wold@windriver.com>
References: <20211221190809.89882-1-saul.wold@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0006.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::11) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd296457-691d-4ca2-f684-08d9c4b547b8
X-MS-TrafficTypeDiagnostic: MW5PR11MB5930:EE_
X-Microsoft-Antispam-PRVS: 
	<MW5PR11MB5930F018B2E0AF33EFD7C63EEE7C9@MW5PR11MB5930.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	62bPgtGAED0Y8c0lFNKrG4cC4IE7axNtLVFfDSzNWFbRi28h1sbdeiklzY7gexM6RvLNcVFwjTx3bp31ltS6wQCa1GN5Ggzybt7ao7NIZlIzHxA9OBWLQdSOo4ZdnSKj0fnaHKxLKGqck/SZwz6fE++2BshPsOr/Dk0ZmKXnWtzAtiVfkUgI1DPiiZLsPu5MXAvy8rKc5wNjqhFqSCrXvtTMmeFTwapD6W6PUTFXaIYxUCLRh3GjKbOBhpAPge1MBAqA7yp62vmVtDHUO+DhUXNI9BX+C8ZxsGx/AhHYg49AlOzUAD0Uj7iV7H8JHdG1J1VzfTXN8oLJ3mv/ZVf4WNNWkhktFypqHYdOfk5shslT0XDBIh+xemennuGayK5w0Da6ubMOl01C0AGpzCcpWEycgImaPnfPnOfUpmZDK5HZvBsUOqKi67hxg5s7iLdf67SV0lV2N7lk+UJCnDUmb00wCE3ogtWXHvKz3pARib2lfpoZp7TK2QZQOh4FF4ufn3oxDcSIVoVzsboNoaclvvjduKOjO7CRjGtxXV6RvXZJz/17OnbRCgU4hEdaJnX41cMO96DwA+wk8/7pEw8RKUL3yPnvvQR5VMhY0nooG7QIiSHLHB+0wWuTyYjQjWAJu2D0Q2HZ+tltPy7P9xc6rPip81D+naTuKrGWPIIlCm4/mI9cFpp7qR8JAAgA+tg88LwRhgAz5rwfUBtwoyG0Rg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66556008)(508600001)(86362001)(2906002)(6512007)(1076003)(316002)(52116002)(83380400001)(6506007)(66946007)(8936002)(36756003)(8676002)(38350700002)(2616005)(66476007)(107886003)(44832011)(4326008)(38100700002)(6666004)(26005)(6486002)(5660300002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sGQjk/PvZ8atAJ9z2a4L9NUIX17JW6gK2i+GvvL6Nk95FTHbFQzgY7mvlF+z?=
 =?us-ascii?Q?GIEETSh/vb9QCfv3cyOIEaZlew3nCk13yXr0+nyJTJXppbN7lm75XHhjQhQF?=
 =?us-ascii?Q?N0pzp6bHsZaPquYp0n/WdVsYOxMLOi8fFSP0OLa0wEmvmN6S/IwQYiQAjb4e?=
 =?us-ascii?Q?fH3NYSFfSc2owJ5wxzvoEaVBBzRgG54XE+y1+ugvrU3PfjqWpS17HbHo3bIR?=
 =?us-ascii?Q?3RFxK9ekuIecCC11kwtrLwVlBqo2EV7gJ+JaKXVcvL31GPY1bZiCE1kSZGXe?=
 =?us-ascii?Q?LRo7TlyndqnyBDwl+vTTRxeppLd8PQ6I0nDJUPGkJsczB1nF0rCpmkUAwojK?=
 =?us-ascii?Q?1wIB7DnznuGIhp9ge6tftd1FZzL9/jAOcQn3l1VjB45x2SEkm7egsB9+jAUl?=
 =?us-ascii?Q?FENDk+mQcxVLGRbyvO6Uk21b+F+6RsJRnu4uBsbSWjNnnWV1iufzq/eTdTtP?=
 =?us-ascii?Q?y0laygaieFIcTT/hREDvVednTQzIVBGxAb0WfNb0PSeREC+dl+MpOiB/d3+M?=
 =?us-ascii?Q?m+qbWZvwaoXT0H1nqx6erRZr93ssAZAVdu0vM6JYNLPcwQ/M9trgOC2cIcFg?=
 =?us-ascii?Q?sSXLRJgzVFVlnEkztW1HM6PBOqQvXqjTWIo5yp8ItcbsONNySZ5qaTKFY1bj?=
 =?us-ascii?Q?377gjkNhZiV2kE85gJyEvhhM76CxzoAEs+NjaAjJPGJE6WuySJgC/ZRQLWn0?=
 =?us-ascii?Q?94jeBAFr2O2m24o5E2WTDHm1VgrZqf+tAwT9pHwTOilB29ryxmSpieCUcmym?=
 =?us-ascii?Q?R4zqqlLMb0u8tny5fSj/IEdB5faJkyb8uXFxpQWBBeSEQVDYZlbzywxkJxCg?=
 =?us-ascii?Q?DJOx0YQCM1IfDQrwbeT9MDm58X1bhvsQ6Cg1xJHsWqoAmUmu5klFiGk8zG6t?=
 =?us-ascii?Q?9rGfXOuEIfovVlL+q6+qT/r/WuLIzee5kPuR1jvUmMpfIk2qcvkioM78xxMF?=
 =?us-ascii?Q?dJfftZDKou7oMlyZVgcKBfH5bmKUJRQpNhQDDbDnwUlAx1q+ZARkvAZLcRT5?=
 =?us-ascii?Q?YMZMvN0XbjtYDHj0Ux9X5SGVUo6CqGc4GWzKYRMQIuIFr3L9GnVpO+67ChjT?=
 =?us-ascii?Q?1C+CP9gSyJ9PyDS/zQ9ilCwLs2KH1n+8b/vff9g4uBdFEUB+UTWlqnqb5FNu?=
 =?us-ascii?Q?fuSsL5+45qlCVPZCSDfnG+5nda+n3zIFR5GlJ917q+DNNLO6YgE4Cp850cU5?=
 =?us-ascii?Q?O6V916s70ltulohqAF4K07YSh3TDeeFdmkFQG3ofAIApiBvqgFg+E/sWyFtz?=
 =?us-ascii?Q?hRaLmFmREqxttCg0cyKZpIk6CWG4/p2oEFaZVUKajwdMyd9Wz56a4HS7pvbU?=
 =?us-ascii?Q?Ef+cpB0QZOFyo8CEkbeLgk3na3kmkkaLVNQVUARYuKcmyr+cud5lXDQZlSFP?=
 =?us-ascii?Q?blF0g5WfikQz88wQCWzXBCilaVh9WIazQVJoMg5exQc2gll84rLyAtpYkbbM?=
 =?us-ascii?Q?/N4oRS4OO5llzkUYnOgbagLSkPTH16urob/lY1kxUP4H+CT6kYMj3b+ONKT9?=
 =?us-ascii?Q?1JRFCJh7zAXw+aHoAkV8kFfbLuBgGWn6i360L5lkXxV3EiR5UkeG2qQykve+?=
 =?us-ascii?Q?gDA4LIHRzy3caK8LfOLdq7UR1odErmaM4dExiuz+wbc845YMOg7lw7DX35DX?=
 =?us-ascii?Q?g3Od1ZA6WZziHc/yRG9nUdQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dd296457-691d-4ca2-f684-08d9c4b547b8
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 19:08:32.3364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 wSE9BOM6b2a1f+nSVCLvIDB5DxYq6A5iK4c4AgL1YShiLcRQ7V2MHWH5eTzzVgTmdVAcXfBRIXrYvKFPmfG26A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5930
X-Proofpoint-GUID: yiNTvCvXwRK2FzmY9Nt8IY4VpLkp20Au
X-Proofpoint-ORIG-GUID: 8M-elQzJygZsiKSnpi0KDdawoDGoHScx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-21_05,2021-12-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=774
 impostorscore=0 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112210094
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Dec 2021 19:08:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159930

Adding the dbg package allows the package bbclass to parse the
debug information which can then be used by the create_spdx bbclass

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 2d219cb5e5..bffe264380 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -625,7 +625,7 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
 
 # kernel-base becomes kernel-${KERNEL_VERSION}
 # kernel-image becomes kernel-image-${KERNEL_VERSION}
-PACKAGES = "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules"
+PACKAGES = "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules ${KERNEL_PACKAGE_NAME}-dbg"
 FILES:${PN} = ""
 FILES:${KERNEL_PACKAGE_NAME}-base = "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.order ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin.modinfo"
 FILES:${KERNEL_PACKAGE_NAME}-image = ""
-- 
2.31.1


