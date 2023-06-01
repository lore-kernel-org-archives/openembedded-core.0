Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A7A2C7EE23
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 14:48:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.33806.1685630875404388463
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 07:47:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=QI9Z0frC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5516044bcd=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 351Els6T012102
	for <openembedded-core@lists.openembedded.org>; Thu, 1 Jun 2023 07:47:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=lWiX+WkDjXg8sLzlT0EffiFkGbx3hpUF18W5VQjtFWM=;
 b=QI9Z0frCh//hy0zi5KEmoYHsKV59GYFFM7hCB4bx3KJzxXISXsvDpvvBnc9FtMA6RIix
 9L5QqZ67r5kd9eqIjhMN7CqMKpFlwvFwaGgJ6P1kCYR6xgK6gTiG0wpyEVePfe4AR2sS
 +Npzv0bib8QiaijSjyyp5SsqVJqqeWdURq+B0ai2IFZFA7xQZ1oKvRGfAiq1KIKnFGeM
 T+lcXmoH2QI7uRIN9VuLOGmfyCwcalvaUnKC21ujdTri2ZJ2/AX5AlG8M6t4XlGPEbD/
 kpEfEUqiUpzsZ/X7Ev/kmWFPdYj0TNLpTlwJGN0wAiHWphtKmRLpNIi105Jo+ulhM+on ow== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2174.outbound.protection.outlook.com [104.47.73.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qud53cr4a-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 07:47:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LFhBWxBZg9UKNt2M3f+LymqsX3I6LHeEX8Tkm2NtO4XsdNTOOFsX3iqcbRmUb+lx4pKEm4fw3idjJbnCXXRTOTqrezaAq0qGfzXWHxOTs28QHrxVLCTSxwA8J+uzkB3Y580CET961w3M9GyG/IPcPVGUPm52E5vIMvXcNLP4RRH5bM+1Rm2yACjNLzuOl2bC3LwAVhiCAH3Pcaw7TMF1N49T965fdHbv9/XpQ6BL4Ci/R5TtE5dqM5hoInsgar/PHnRvzGOX47HDzAfSqxHMqmFEdW4zydQqKexIBfQv69hnMwdPLugLMJ8CcBrt5p0dRl2AytU5q7KyHyVPd6J7wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lWiX+WkDjXg8sLzlT0EffiFkGbx3hpUF18W5VQjtFWM=;
 b=EIRoSygDTh5qQPIOGC3gs/oyceLOm+ZMY2vR5VGZ2HKoOQtU486i96Q1ydjaarRBAzCBs1CT9g/BNbZbIuG7ooNhWV+CQ3yST/mTNOJUAsqTO2kZry14VCafTQBiqU/YOFqtWCmlIKtfAZCBAO6XH4vIqtXKuSo4ltLtrpky+hZ9+szgfkZHLnv1beLSF/wUb/bMcdegE3YRwptG0CLQ/aZdhP0g5yGe+BKfeeDTK4iLEg9Ni8wgN7NRqGayrDI2OARUsNeo5CMIBL+gmcR/jZArq0Y1MeIKYrZHsgxV+xR1IqezVx7LsQTxDtquWVEcHV4zGeoj69aGSi7S8UYB4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA0PR11MB4655.namprd11.prod.outlook.com (2603:10b6:806:9d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Thu, 1 Jun
 2023 14:47:53 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17%3]) with mapi id 15.20.6455.020; Thu, 1 Jun 2023
 14:47:53 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/2] Revert "libsdl2: disable SDL's own ccache"
Date: Thu,  1 Jun 2023 07:47:39 -0700
Message-Id: <20230601144739.1525861-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230601144739.1525861-1-Qi.Chen@windriver.com>
References: <20230601144739.1525861-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0017.namprd08.prod.outlook.com
 (2603:10b6:a03:100::30) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA0PR11MB4655:EE_
X-MS-Office365-Filtering-Correlation-Id: a7625689-262a-43f0-2ebb-08db62af2d66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	K5N26Vy6N+I997ICWDQxsNwjdmbGHR+7eoEtejA00017NTMxO0iHjn4HCc+7fSEX/aB3OOO15gbvocTsvkg2tGHicgKCMdDVYIHcnJkoTAFSTk6WGNsU+omLu0egR4DO1r6u8sk6pWoGMcghbjfDer1UEVb14XOijJa8d3qp+FCETqN8uVwyk6gr+KJsfkpCyXVAP1brP2B3BHv3aIzdyF8hEGZB2bF/F2GZF8/jFwKjdHO1rYsQgh+4sgX02d1/kYGjoCrQL46t2ehPOIAE/yMMWTA7t9G8SrQkDZBRUh6e71M6qcyH584LnDZw4mqX/OdYjx92wigbN3A0tdy0lArPlmsXreLOm8gP/lQ4+zHZf+3l9D9Tejo1FZzEj+Yt7Iow81dkG/eexGNdRaysbVDjyQZZYrwmqG9TdUN9hdYgAF02Z2JPCbddeocttZUo2+W2+l5su06pIbv39J7SyJHpAxYDIOBB37G1ETB0L4zGfVMWbBs/RV2jWmdhn4PR4Fssjg69MmIDQKaLlCfnbknaxmyDWF9ki2yLzg9H+4Ye3pf3i8V2MFCstWqBVAXYfyrXBlgNCW8+604JwctgAWmFf84ER54YdxS8u35exgMmLm7DJZu308vldSSIsXyq
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(366004)(39850400004)(346002)(451199021)(9686003)(6506007)(6512007)(186003)(4744005)(2906002)(2616005)(26005)(478600001)(1076003)(83380400001)(86362001)(8936002)(41300700001)(6486002)(8676002)(38100700002)(38350700002)(36756003)(5660300002)(316002)(66946007)(6666004)(52116002)(66476007)(66556008)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TuXDjdciynmDPzSph92UEWw0nCnY8UXPQs/gY9zn8yYjgxyYWPvyaT/BhN8j?=
 =?us-ascii?Q?0k+gd6gdj6f8adzIvVVZnBunxRZOLNJlLrRYzdI1RKeBnbnd24N6m+HTbDKb?=
 =?us-ascii?Q?ip/DsOezOHstbyJh/05AvxecmwDbshyXyWlprpUnvwZmHA6ZM0hzILNYrtDS?=
 =?us-ascii?Q?VYPGlki9IgYAM09Afer1nUfhgsXYVlka5qLEt6/HK6I5DlHYM36lM5D/9hno?=
 =?us-ascii?Q?6ffllTCPJ7G47LSlUr3BqoK65CmXUFf4cmchkXtysdFdkUhMdFjRdMHG/LzL?=
 =?us-ascii?Q?UQra4FtPOMTawBDbXI0IJWUoMf1na9tih5CgCxrE3UB9/ZGdzlUXKDje5grg?=
 =?us-ascii?Q?bRaeoE95saFZvT6nZYZ5GyFdxXqZlBgVwLtFlvyFvo4IkNrzy3rdG0KGaCWJ?=
 =?us-ascii?Q?ZXbiHL9HfPELFd9Uv3ra9EjCjOXMQQedJfPm360vguqiAJQywiFKj6DcIowi?=
 =?us-ascii?Q?YzV3CBe9Q0VXxrcqvokSBHptjPlToEnwR0jUl2hWnPFXeO2habnSGWTurax/?=
 =?us-ascii?Q?ww83YtfA58sRHAScTj7t3rTah4JGe2h9GGIzEmANZyHeiKbxmi9n97ldWx9s?=
 =?us-ascii?Q?rRvO6GqZrUJNqWtuh6IKEHbn4kdB7NSZa13NlTpc9DrZNseqi6bYlBHd3X65?=
 =?us-ascii?Q?w7nr9M2X84ELbIARdxupqlXgEZEGMDl/F/gC1S/PYf9gXbV8djUKSgxw1RBe?=
 =?us-ascii?Q?wBGs6T4//kaQWVUIVvqFk8vDEZxznfa5DE5kOXf9M3sRb/nfbU5Dhz15Spiv?=
 =?us-ascii?Q?H9VdTjKMo9Ehzv+9HclMaC9ph2aJkN2o1bGA7jLPqdJP/nmWwRyay0LkiHAY?=
 =?us-ascii?Q?50C3my0kyH03QonSLJfnQAs7I3R9QkQ+BxVXz0c3quTUIZFN015y4VphSlJZ?=
 =?us-ascii?Q?QDUaCO/pxP3tdz6S+U+FrtCdcZwRyCO9ep9agQa5hbiLBE9UZYemVOflJu42?=
 =?us-ascii?Q?YcDVb6Dcmsb96+2aR19RtVzLZN2V3AXsAciCCwSZevZ76ih6uqiKL5/qW6Tf?=
 =?us-ascii?Q?eMwJepegyLRgLYOdWWHtBjvI0qbenw0aU6wVz/Ys8N6G5eFrnrIIMrSYqwbn?=
 =?us-ascii?Q?BLQhja2NucEPVU6M81v8Fq2s1Hc8694jzTyoifuNXpiKvJXUXe2Sw4KwoARA?=
 =?us-ascii?Q?WnhB9HLAS0E3cpLjJKhLWqR+fHgs+KFxaGiPfg8vSjqLzoA9yvDCIypRtQmj?=
 =?us-ascii?Q?viOI+s+2iN1mC69+wC85pWR+8pAgPVtEijLv25b7ZHxUIOM0nxBO59Xz0yPr?=
 =?us-ascii?Q?bJH3ugTFbdBonBMibaRoovANzXntIqk3UgxU/tkjePReSSujx/+4LrmOIgOh?=
 =?us-ascii?Q?jQ3+m1DxjekCQu4xyROCBGoPWAFI6ioR1leb39ilv7bJ3IjHrzlbWmgpwk7g?=
 =?us-ascii?Q?elJ7QJGtIhMP8vNOrQT6Lq23e5PQoxMfukKWnMIxsSTO0Ux9eDJUxfEjEcuL?=
 =?us-ascii?Q?9p+8BHiJpztRAt+qpzQThFDuXrWC5S7H3YAoykeMLR3bOyuTtCNkbCJRiUNS?=
 =?us-ascii?Q?amLYry0SAFPSMozO1XHVTvmSUsG5rH5wdGcY8JxRvnifO7lbjxndadrrX3I8?=
 =?us-ascii?Q?ac1KuEutnrGQoXwJQFPQ9nLmSxEhLOlgYwqV2NI9idfBKsfKf8OQdtOMiRST?=
 =?us-ascii?Q?JA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7625689-262a-43f0-2ebb-08db62af2d66
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 14:47:52.5408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3i6JlZjWyC6TKftBPQKhugvNmYndIvgqXe3GxWAd6UPO7/OgsTsLr7wEMk5X7WRiR5a6XwTR+2QPpwB69iQtSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4655
X-Proofpoint-GUID: sh78RSzM-GQvaJgqYdsrNQqqCGzDSLUC
X-Proofpoint-ORIG-GUID: sh78RSzM-GQvaJgqYdsrNQqqCGzDSLUC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-01_08,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=5 mlxlogscore=125 spamscore=5
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 mlxscore=5
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1011
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306010129
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 14:48:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182116

From: Chen Qi <Qi.Chen@windriver.com>

The reverted patch's purpose is to avoid libsdl2-native from
detecting ccache from host. Now that we have made cmake.bbclass
to not search the host paths, the original patch is no longer
needed.

This reverts commit 01472f512f45bdd319611871a21172216c74e29a.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.26.5.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.26.5.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.26.5.bb
index f8319a8f29..3274475da1 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.26.5.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.26.5.bb
@@ -47,7 +47,6 @@ EXTRA_OECMAKE = "-DSDL_OSS=OFF -DSDL_ESD=OFF -DSDL_ARTS=OFF \
                  -DSDL_X11_XRANDR=OFF \
                  -DSDL_X11_XSCRNSAVER=OFF \
                  -DSDL_X11_XSHAPE=OFF \
-                 -DSDL_CCACHE=OFF \
 "
 
 # opengl packageconfig factored out to make it easy for distros
-- 
2.40.0


