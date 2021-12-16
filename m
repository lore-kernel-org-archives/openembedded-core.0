Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6229C433F5
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 05:10:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6302.1639631400343329691
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 21:10:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=I8qnTA0Y;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=7984e022ba=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BG54gKU017107
	for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 21:09:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=hpv6jksVMR3qwsOD+TE6nBgXdVULCNoC9F04woM4bu4=;
 b=I8qnTA0Yaj14l5wx1U7V1J9jAFeMbmhSwFT4NGG213kkdaKKDrUfF0DhQcv/+K22J/K9
 0tihrY2QKREMRhbfLc1A/XCHCCO/6GG4GqIhkKd2p/2M/AUzXjaTTxRidze2zWVBrEug
 vfpnl8MO56yTp1cc9Xj0EiMQ6lLTDbwzHovdG9wEgjPvx7gWpHrX1ubodZuf4FOitUuh
 R98F8808Z4agb4FIs4oYjYaxJWP6gCttdyoEi//V8a348k8t4SdQSK3IhlNf/+FcjBab
 MMcUu7RPJaqGZOAfnBnBq9S42mpGMirb0MMNGxMlZ1gkuSPwXdbVfsU7I6D/auwJsKCh Rw==
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cxpyb1ses-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 21:09:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dpiedNlrYU8+gLfuaUlA0cg6apG5WunlN2WHxKqRepJslXavgfyWiXu3vgamJaxVq9bPpt+VEdKVKlRC1BuTwEOJHBom4+OAtdUa330aASPagznBkTYzPBhyv147TYjblT8f7YEgadekN5QmpNqPtXhTx4/isf0JUBFOCMLcWhoQsoPeEcoT9vSAAgn6cd7RI5OuFTuPQPjGMJOGKRcabZ8zLz0HPjxYAgAkgho6Dhcs7pgYBf54i8y5bzLoE+a9k7rV9u7sb7BdzSHKt//jFWgO6LhvKw8xDtUO8U+aGuHTSljCbvbnMSeH5W/5IuSttXoQjRxVYKZ/PVik7zOtvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hpv6jksVMR3qwsOD+TE6nBgXdVULCNoC9F04woM4bu4=;
 b=MJ8UQiOmrno0W7M+e/Jc3VRxPp6ym6mJLBWbBMdvk4dTFDT4LhIfJAP+iA12bwqGt/I/iM0KWaWBnaVZBgOLfY/m+mfzZNEus2fSciwsUjbCZ/TWwlDhc9g86XmlazYZxn83rWZaN5y8otQmoBHEYAJmVAngioPwJCkOE69/MlIh9/NLdUty3vW5PJrc+om6k6WAaPon3kb+EZpO0UhsgoGQTRUQ3N384CatBrtujy/SQtieecdLw4NoqMfFHlLr6/6p2/pnltJPmbnNgWelJy1NJ3evzPSktv4dVkwdexk2v5Kr9LkoBChKnqKX3dbUveR/uyVr7CQJMJFo2yNQkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO6PR11MB5665.namprd11.prod.outlook.com (2603:10b6:5:354::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.15; Thu, 16 Dec
 2021 05:09:55 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::e4bd:c128:9168:b142]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::e4bd:c128:9168:b142%3]) with mapi id 15.20.4778.018; Thu, 16 Dec 2021
 05:09:55 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][hardknott][PATCH] core-image-tiny-initramfs: delete
 populate_sdk task
Date: Wed, 15 Dec 2021 21:09:40 -0800
Message-Id: <20211216050940.91694-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0003.namprd21.prod.outlook.com
 (2603:10b6:a03:114::13) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 446630fb-6ada-4abf-49ca-08d9c0524c7e
X-MS-TrafficTypeDiagnostic: CO6PR11MB5665:EE_
X-Microsoft-Antispam-PRVS: 
	<CO6PR11MB5665196A5E4A76779E463771ED779@CO6PR11MB5665.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tdeZq0bXTih24QwlMvB9wNTlXcMdtsGivW/Ih3NXmNQNhMHzLwtONtEsgvBW3oWXU6evql+PNYBN90r4mE3ESkSQV1V0HPVpEPc9qqWIBq9533elDBkQ5jZ8l1spu+C5nh4JPYS3avr9F5W/nmEiRkNtFMYDuq9FIZ3VRdDQXb6WnhM58m0stbWZD2hW8CfbwHV3CqBN1eJHizE2844HT3h5zBbJUHlNVM2aJUlkA2OrK1NUQSDVOZg21acSGw0NTFI/Lqpesb0Q4oGMXHj76AnOiPfV2YiEpHoBPtUjMwyb2t3rZh2oocH7OiYKbHDl0KpKRGepV2LOXfMWL2bTe0abbHjPabtDV1gWGlBnX/aq2MP+YsAThC1viPBcWfI6l+WpJEdGVhpZSENG8MlWrvysTq26iVPQ98Nn+RyjCbGwu+kLCBxNFmbIkMc2zLLxuBOLWawpllAiss9T6ZHUuF/4LHpTTpbE2Ur+yUQrZ3P7yIdt5Bp/dnvYDXQaK//DDvVzv7pr2uz1CLrpT7zzPh+zQdlS7KKIxjO8Dbe9nRpYpU7xYI0VcVWkg31CpWCutobx8SJIQ68wpfhyZTKb/uYJxbxlYYBt26UeIsxQMhOT7Mpu54Xw0bOWKok8Kx4EbTWXrUfGjGv7N1k38FySm5fCpwSVMXiAX1FlsIsgSjiEFSnks3zbcvOhBl3WENHmaX0NITUOcNdXKKfifdg2yg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4744005)(1076003)(66946007)(8676002)(66476007)(316002)(2906002)(36756003)(2616005)(38350700002)(5660300002)(52116002)(83380400001)(66556008)(38100700002)(6506007)(6486002)(186003)(26005)(86362001)(6916009)(8936002)(6512007)(508600001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?suPij8WAhBOvA2g9zqo8kMVbk76NW87/j5Jco6tOXwIxTfIyk1Da97H2m3qZ?=
 =?us-ascii?Q?0NO5bju1D7YQ3wAEYySh/boZgss21xRvJub4/THeoZvOTd/fWG81HwBX3yHH?=
 =?us-ascii?Q?8IAFTg0MGnumL2UHwfajTSXNHfpDEo673ybKyWSKZy/czXNXkq2nNmsyXuJq?=
 =?us-ascii?Q?0MtF71uY87DjYhpvjTwmIuKrQvv3ZE736Q3FuIZT/mg+Py1bS3dNX0TamPuK?=
 =?us-ascii?Q?caC/x5A2xw6wV5JIWIz5baNHpQkKuzdLDW+ysYUEn97ulgsPEB05Kilu9A7+?=
 =?us-ascii?Q?ACBbNzGugDo/tVvrC6NpAzq+uOora7FEpH/x/61DrdY/U8/URdQfGszHSUn2?=
 =?us-ascii?Q?0YIJNORKTdIKxh5Gejx3Mp3N8r0cZtb9RCD2fe83MNxStTTiYmL7ed37sc6B?=
 =?us-ascii?Q?p9NLqSCuInM0ncNt+0ScGZ1mOvGma/2LqBpQzzvjZY1hp1Jlo+lYbwyYXWnc?=
 =?us-ascii?Q?Rvi/UDKetnRhAPQBXqrkNjDImiAyNGGLObvuBYuk95eY3BxT81ekMEYR+2pt?=
 =?us-ascii?Q?e3YNrq/b1R0VmEHC7hzfZnO5cdhtBmqwkTOjmOD7znYTkPF2Cs72m4NrPjbN?=
 =?us-ascii?Q?H8+36b1zS1J2ttTU3HPTQGbgFj7J2IDT+Vwz3Vn1eTucSLXkUiBdRezhd9sl?=
 =?us-ascii?Q?Xyu3sCpqjyt/OK+TBCgqPfdXGYh2FiByWVgj3dIavjU20V2qbONDhYZb5Lf+?=
 =?us-ascii?Q?8/2mxUXVanbWFIcIO2kqqRGd5G0pTL0uOrrw+j3zqm78bKArEZn7yjAXFngy?=
 =?us-ascii?Q?PxY+TzfxxJuTMHd/RpZ1qqQx6Gr78HwsLREot8nVpkFydRrVbO6xQtu/rXIo?=
 =?us-ascii?Q?200IDDDKXKGSRADgxo2AxsULcgF0g2Hk6y0Diftp81FrdAVf/0wASOjqt4U+?=
 =?us-ascii?Q?8IS3PqwglQzV8abTm2hvq4+9Rg4N99ef7i8QOiSWh6ahEdYVW391NYW/XK+T?=
 =?us-ascii?Q?D90XFJxUFL8Usr3FC+oYWlxDRh/vU1S7apnvJ1uCkftZaPjKiLP0Qd9KoQy5?=
 =?us-ascii?Q?Z+cUlpJolbdPOspXyUhxZW9V5BbchgIwC9PRXKyPk1hwI83BNx8Q1kb8P0Oq?=
 =?us-ascii?Q?+hciBEh7/G/7IAkuZNUk+sbZm8JIPhoHlz7FqbDdQ9jGm1xFAxsUBnmHkPXe?=
 =?us-ascii?Q?4YAilveimPKlhTgu5XuRk9uv5y0r1TKofMgija5DFY57riAiK3juMWEuH6ys?=
 =?us-ascii?Q?cfKuTx/5L1Aj5ZGj1LdVgYT6s+zXvylNFu9F90QB630xBlYlNkDZMnA1PXjB?=
 =?us-ascii?Q?rBmnqQMerFZoclS/9ib0nQsspNwCKDWXXwvsMaQlnXenUFpceKIKkFVVeT+q?=
 =?us-ascii?Q?zrwzIZLBnYdE70IUzGBn3gjGVnVjqmXHoHOjC1TJoWxulxyHaEXErPaHACjc?=
 =?us-ascii?Q?wMqNJzWSkVoDpkKH9vTmY6D4yILkv+S9Sw423KsH/Yx8Im/K0IE9SJ9Jy2lj?=
 =?us-ascii?Q?SpjGX1hjvJ6cjZw+KoD/fQn9fch7byG8UzuAEuOWJo+RmFxfUk2sFocxm2zy?=
 =?us-ascii?Q?/XsxiMLxLD4Yk1Qw5I5NvgOZSpCYyLdkGaNdUfU0vWsCi/CFgizqsn3g7asg?=
 =?us-ascii?Q?iYopK0nIVmnoFgFxBPCIzCACdmCUXWv88aM9wNsmdgT4wnzVaLjj/SGnYQqz?=
 =?us-ascii?Q?jztluir3keLwzryOWm6QX9k=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 446630fb-6ada-4abf-49ca-08d9c0524c7e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 05:09:55.4718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 5LOJ5kWyr/u3qHavvjqqfKfhfipKKTk4XS3DTzWYiPvVoHOrilQx4s7cHGsR1Mqprrv13cbEEFA9FqoqEmSrbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5665
X-Proofpoint-ORIG-GUID: 7UUIBd-sYp8yNZszBe1ZX6PEdyseP4vS
X-Proofpoint-GUID: 7UUIBd-sYp8yNZszBe1ZX6PEdyseP4vS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_01,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=635
 lowpriorityscore=0 adultscore=0 phishscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 clxscore=1011
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112160029
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 05:10:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159772

Currently, if we do `bitbake core-image-tiny-initramfs' and then
install the generated SDK, the following error appears.

  tar: ./sysroots/core2-64-poky-linux/dev/console: Cannot mknod: Operation not permitted

The populate_sdk task does not make much sense for this recipe and
considering the fact the its SDK cannot be installed, we'd better just
delete the task.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/images/core-image-tiny-initramfs.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/images/core-image-tiny-initramfs.bb b/meta/recipes-core/images/core-image-tiny-initramfs.bb
index 47470849ed..66c73e4261 100644
--- a/meta/recipes-core/images/core-image-tiny-initramfs.bb
+++ b/meta/recipes-core/images/core-image-tiny-initramfs.bb
@@ -23,6 +23,8 @@ IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
 
 inherit core-image
 
+deltask do_populate_sdk
+
 IMAGE_ROOTFS_SIZE = "8192"
 IMAGE_ROOTFS_EXTRA_SPACE = "0"
 
-- 
2.33.0


