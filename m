Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E36BEE49A0
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 02:14:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.8711.1692670481581571041
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 19:14:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CiGM3YDs;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75985cfad4=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37M1nNH7015920
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 19:14:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=IouCwIbmdzuiMLU87ugY+SQoi4obaqQYNzAwT5hcrJo=; b=
	CiGM3YDsb82COX1adOSw58tJ+8iOuGLoGBHZ/zwWBo0qCEg/lBwi1ONgfxIHSbqs
	SAWMYm8qO4XSNCY3w02SaqBCWuz6/5e0cMdWNO2P/vBxaL4bSy2IRKsCqdBItzog
	xFfMVOqCQoE5b7PzIx1fZgx14u2O0FxF9Me3qci17Cjn/I2oI22dkrlEAv2QKYCY
	TZmvCiaPFt37WQWQLFUT7kp263Zk6og5m2xzvDRhlKSRQ3uPQDlsJpZa0On6sy1d
	plubkyhbuarfj61CJs+yLuWiId7+dg5hFedphRwd5acalf5hxFbhVEMc+Ygan9Us
	KYCp3MJ3DH8ejMOt0KJ5Qg==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sjs0yt3c4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 19:14:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TqAAn1UIWP3wN5BRRdv85gCAj7BRPCXfd8j8CDVO8IaQ3fgtXEqfd+huN8/nHd0HxsPYw6Mb+aTSvEc/q+m6P/3A74m2q15eKJlflf2eavKZu4vSmWCGMtKqO++v1wgR5mELVak6JTUoGAJy6xwXtzzIyPvjpwBPWHByLL3/B3JOW7mZMQ6Cuc1sxMJYEc4Chd8o5H8HwJrWOS58L7vCaIO++QKFmhDYHP+6gsBYYt/5aHEJ9dwdcZ7JfnASXTSqt+ZC8sKZWqEctDhYMMYRq8voPEB8eiDErldWclMlNzAvxmZr6EvUIoS34pxtXYOLJgizyvuEg6T4V5QFFBBrpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IouCwIbmdzuiMLU87ugY+SQoi4obaqQYNzAwT5hcrJo=;
 b=hAMo33hvlIUnOf/M734AEHg0JdeueDmgk46KU8wN1gKWOEeQPpISz5QRVXREVrFrrylnhZRcBgcudRBLcb45jg2gZuAy2mSuhorxxc7dAcEOpL8oEXXWeVVtQwCc/HVDDlMlVko1AXeJS5fPZIhtXAshmyhif1QodTshsuZNGSBR0aqhdugmXFJN89oWmBk3ofrgI6U+zCb7zh+fwEA/fUrezX5gKsq3bcssYidQAE1dglUhogP1q0JjkaTYtH+XrmWewv+WmC5LJcHNqBbMXSeHeJelciKHdw2y91t+G1Or9720clp3ftLQRoukEhcwXyrI4EMSyMG++cS+yRArHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by CY8PR11MB7923.namprd11.prod.outlook.com (2603:10b6:930:7e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 02:14:39 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::1133:b6c0:3f07:84bc]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::1133:b6c0:3f07:84bc%7]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 02:14:39 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/2] cmake.bbclass: fix allarch override syntax
Date: Mon, 21 Aug 2023 19:14:26 -0700
Message-Id: <20230822021426.3203962-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230822021426.3203962-1-Qi.Chen@windriver.com>
References: <20230822021426.3203962-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0010.namprd10.prod.outlook.com
 (2603:10b6:a03:255::15) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|CY8PR11MB7923:EE_
X-MS-Office365-Filtering-Correlation-Id: c686921d-86e1-4457-3d0e-08dba2b589a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kSEr5vS0PrYC2TPdzQHE6JpeLA61WdAp+L1lnxjAB9aqDXxTELa4k3JQ+hP7i1nUbJtDAUHUCdaa+FDXIu58hjTFe1CxbH9LKIfKd+rd+Wx6TxiM75+G2U7kWyJh49/idxNnyxgk+YoDYeW2ZBvY6mBEfzxztWMF/0uHafNXR9OM+n2qQ4xxCbGq42ghYAOYitEescqrlyKxRbXgi/iGSvv2y6IqJtPd4fT0sAymdv/aiXaZh9WvANFyQ8NoyKf23v2W4Ell9Dm5tUMMSzRCJ9JAb7+tlagTc4Nv8benEfmKc6oIgBhK8osXyrauPE9V9uHganagwd1YmiVAWqmMJ5n9DiAnIidv7+t2MFiildTQ2o0lnC36Drt1ElzX1rDwvQo8TZSGuuNKfIHOtIXEElC0VBPQbqaxbIGIB6IrCklOenwP0/aTk/IgKPfY+Mi46Fv6U6/Gn4MqTmZuB1eK+9JPeHYbQVNZON8Ul+l2a34UsbuxPic1++QX4KkvsZsoNpX36AY3t8NdSJ0HNSV1+2LjrW9MVd3zCMbVBwhYoTGa96keqRWe0UTweFrGD5zLVLMNClU5FttSgyRb/M2tU8PM7SBEDOf3NEBhzj7ldHPyByLEkrf5gNbD4tzkwH3M
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(39850400004)(376002)(366004)(396003)(451199024)(1800799009)(186009)(66556008)(8676002)(1076003)(2616005)(26005)(6666004)(6486002)(9686003)(52116002)(6506007)(83380400001)(5660300002)(8936002)(2906002)(6512007)(41300700001)(66946007)(478600001)(316002)(66476007)(6916009)(38100700002)(38350700002)(36756003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JXCBL8u40ciXPVyxoomzgCA42RzJsd5pZqjkb/+oqodnq+M0kV/b3FkJGRnB?=
 =?us-ascii?Q?yIodNoXrFPUaubyDoabOX5Eb7HId6aMLKtc9vLbpXxx+V4M2QE3WY5wwmK6g?=
 =?us-ascii?Q?qUgkvLDc2CJDuK6wanCZNiy/WMhCjwDEAl29MNkeOzed00EfzRK1qe1chFeo?=
 =?us-ascii?Q?x+yufXfd+y6UJlWT05YZ1Lz2LsrsECbPVHpS3KM0lDkT3fxAbgOUoVmqq3PK?=
 =?us-ascii?Q?d8MkQQR6r/z7EHfBsA2Vn9AG+h/No8//U/rMVvOppR+EqPORfzRwm5fLejZc?=
 =?us-ascii?Q?D9X6DHwfzw5lqHrx0mlxK9rlm5m+wLIXlV77DTcz/Nn23KYmf5xmu5a3D38E?=
 =?us-ascii?Q?Mc7VncBHYcc0r/a/llCYrOkkSCP8TDgMcI09tUNzIzJug2YFhECTdso2HmoD?=
 =?us-ascii?Q?+DfMbWLYirqdw5BCB3SIyjwOBbzeYSoliCGAQ7hZCMnRqpu9dovMCdicxrS1?=
 =?us-ascii?Q?h5p2ZMxkzyr5dJYzWo28K3jwqKcf9jJFjUuo2ScrnG5bUcEyqy1JZVObDS19?=
 =?us-ascii?Q?XrFkIzkp00egwFyMAzGTlBzOU7msjb+PKvTE91f8+kXmAcYFf4GxfPJzhLJx?=
 =?us-ascii?Q?mjWYK97Q/8LmO5MIKRQV9XOzpJ7QTHAaGAJxjSdwjp8IxLrSa/nD59bp5ILq?=
 =?us-ascii?Q?uOgtIRe499DP77pJF1Ccu/0iMOdhb5HjuoEk53xx+MIqgAH/oNigcBHv4MLg?=
 =?us-ascii?Q?2FkmhTNAMIuy0UHEgmxQwTTYauPJUIsKLCoivA+Jdo3EYW2oR1YEkb/U/ah0?=
 =?us-ascii?Q?UiDROC7sKiyAjXVwPcoh0pFn8fUVHcxrQUQc/08BWyaNgILgI4+6ef6jgn9V?=
 =?us-ascii?Q?ayAObMxtntRnW+mPMv/sxTmgPz/FsxUdlpbYiVBLf8IE8i+bJCzMVfJbNYsv?=
 =?us-ascii?Q?QEs1cRbyeE69k+h7di56YvoPZP8eZgLqRcgnbLBYhgj6zTxx0TyYIvzEU0I4?=
 =?us-ascii?Q?cPKzGwXL7U8UYcBJBvWLxFEvtcV+V9o2SQth3KFnAoF/sPORhwhqGrqluF06?=
 =?us-ascii?Q?ws4Xjwv8XORCleFVOLjIDYMCJFFi2kY2BSlpFzQEqF4uVoPXcJzMzeyta6Yv?=
 =?us-ascii?Q?ygx+Q3X3yEFYHlLIapzYXlzc1TYlZvvZIYV/voEgYxyvBNoE2dwcyvlocnJW?=
 =?us-ascii?Q?qplxAE13NpgSUofsLeTGW0quIvzkBcZU1JWwBz/8BbgHt+lEA2wc8ksuWeNH?=
 =?us-ascii?Q?4pWElcAEN6CskKNpBBXjvO/L4wy5WzCEjDg7KEBt08ONmERY/SibD8Pnxy7q?=
 =?us-ascii?Q?zdANeS0DcjlOvtQ7q/qzs6drTKm/Zpwzsfbx/RDmwo0SgJ/dn8MG5D6P+JPi?=
 =?us-ascii?Q?O59klB+AziwtwX1+r1KhzJMAJo/HZT+dPCVb3xFtrEOresnoov1FERhaNfuE?=
 =?us-ascii?Q?iWiuIttQpgKsE56DST+6Jubk/adHoyX90V4hyHbWEcT0YzNc2WD2xnGpm0Dq?=
 =?us-ascii?Q?HSHc+wmqx1acAPue8Tclh/idrrERH1W2VUi4j1fik4ofBpgaoSC/6/e8IDNQ?=
 =?us-ascii?Q?iLRoMWbIQpS1QOzoOZjEmJuiDKpB8FEz4ofdhWn1SQeBOaz0R7CE4tjftAGI?=
 =?us-ascii?Q?O7H+jphUJtVQsWwjb2HUmRLV+3fDT0LyozCMO03hYW5u2Hl/SO9CVY8TWNiL?=
 =?us-ascii?Q?Fg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c686921d-86e1-4457-3d0e-08dba2b589a2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 02:14:38.7728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yuZ2W3JN1f+GH8tmigQD4y07GbphC/5s6H9fqG8TG69SEATPwr0NoG9AyRzpOkOsgeQYHaSiK5CvUTp50k6i6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7923
X-Proofpoint-GUID: IzZZXvhG7fbLh7EGdq0M3gOp0z_nFJdq
X-Proofpoint-ORIG-GUID: IzZZXvhG7fbLh7EGdq0M3gOp0z_nFJdq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-21_13,2023-08-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 mlxscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=786
 spamscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2306200000
 definitions=main-2308220016
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 02:14:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186490

From: Chen Qi <Qi.Chen@windriver.com>

The override syntax should be ":allarch" instead of "_allarch".

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes-recipe/cmake.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmake.bbclass
index 0dda104a69..ea836d5c0d 100644
--- a/meta/classes-recipe/cmake.bbclass
+++ b/meta/classes-recipe/cmake.bbclass
@@ -51,10 +51,10 @@ OECMAKE_CXX_COMPILER ?= "${@oecmake_map_compiler('CXX', d)[0]}"
 OECMAKE_CXX_COMPILER_LAUNCHER ?= "${@oecmake_map_compiler('CXX', d)[1]}"
 
 # clear compiler vars for allarch to avoid sig hash difference
-OECMAKE_C_COMPILER_allarch = ""
-OECMAKE_C_COMPILER_LAUNCHER_allarch = ""
-OECMAKE_CXX_COMPILER_allarch = ""
-OECMAKE_CXX_COMPILER_LAUNCHER_allarch = ""
+OECMAKE_C_COMPILER:allarch = ""
+OECMAKE_C_COMPILER_LAUNCHER:allarch = ""
+OECMAKE_CXX_COMPILER:allarch = ""
+OECMAKE_CXX_COMPILER_LAUNCHER:allarch = ""
 
 OECMAKE_RPATH ?= ""
 OECMAKE_PERLNATIVE_DIR ??= ""
-- 
2.40.0


