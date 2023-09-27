Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D25DDE810BD
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 10:16:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.13962.1695809788248971852
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 03:16:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=sHM/NaMf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7634b29f18=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38R5fa6N028958
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 10:16:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=/BkHYtP5IFkxMqvbhz
	8hcI30HaYm6Y7LHlbeA2JegxI=; b=sHM/NaMf4DZoKbKrcKH4cnVwn16l7vYGWq
	/z6Meoi0vSYB7qTeTwaV1DiKOCjqpEME0YLap+SJ1wuGs6nRI+UmtCDqS9LSyFKH
	M6jRU4+ae2CDbECl2T5Q1liyJk6ar8Xjr4VuKtedM21bLR7EJ3P3oK81BMjCy09N
	pKYl4K6WHQZHR4BWrdn05FYiZL72GVJ/RTbODkG5/Ow6jhiOmQnD2PIGaQtwis3a
	xjFK1ffqCVWPEbG9L7PaNhVla4McjSeFfcwL52hGmI5xC7wASYmibGalahoyEdp8
	qamLvq4gJx2Cq9vdDGNfXq2e4MFFlS/IXshz8mE+v65B1bKFowyg==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t9q06bqwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 10:16:27 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y1lNXM0Ow3EKBMkTiNLKhG5QAVqRVErffcwlw/+aFOsMR423DOz4sFebSVM08T6iUvOUGIDkpuaU3a79taCp3JJ4bIqad9VoYM5MhYrv0nR/Ar/gUiOxQKGHy3v7VTdMtgiJK/vbJFmvcjuaMffYDfbYsg5XWt2W+LQQxkSUnKgol9il7SSE2++YzPa1p0NJwPZTjV77bLEY7q9COCcXJO5Id2PyiA36yU33vwtrV3xOpliIigCYzYhGG0cI2X7lNNIWnOUiZXF1Ka8NYmcQoMXtmsXGhTiMvu4XzJYVKISRJGpMqO+nQpd8rFExz2PiI/HMgHpVVOK31L0LrCVYWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/BkHYtP5IFkxMqvbhz8hcI30HaYm6Y7LHlbeA2JegxI=;
 b=UPNDi827QvIg1NqQdiHGRvuOgRosdnBVhH3F7Kmu03mwFhrB80uHomH9keYkt6UqS0Cg1hff2PSsv6pFsl8wcOYnKUXQx2D24oXrSgU7IVKqfV8cWRq12WS2L0wEx7YXVsYOdDNB+md2vrsLSfZ56fOQT9MikWwOVBbITa9UgV/fGb37Chu/QNPTlX5Hl5Y5N7h8+X7569Rn4rlombTrz0UC8/Amo2DXBDQ26a5AEkiifq2bVRo6FuYrCyfhxk5ak2FCoajd75qGu44SfBb1U5iqUA3wqbd2NmMz13zkChtwynUMGw/qAJcTvzdKBDJvGNTLfuyVOoX3k9iocIyciw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17)
 by CY5PR11MB6413.namprd11.prod.outlook.com (2603:10b6:930:37::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.21; Wed, 27 Sep
 2023 10:16:24 +0000
Received: from PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::6f95:6ed:cf39:91d]) by PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::6f95:6ed:cf39:91d%3]) with mapi id 15.20.6813.017; Wed, 27 Sep 2023
 10:16:24 +0000
From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kalappa@windriver.com,
        Naveen.Gowda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [[PATCH] binutils: stable 2.41 branch updates
Date: Wed, 27 Sep 2023 03:16:06 -0700
Message-Id: <20230927101606.407457-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::34) To PH7PR11MB6449.namprd11.prod.outlook.com
 (2603:10b6:510:1f7::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6449:EE_|CY5PR11MB6413:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e42e51a-dad7-4d3c-8638-08dbbf42cdd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aW6wznbNBah7T357Yxydac7gRUgf/iwIc8fF4eWewaexeS2C6YWPbdIXmkaAGOkdRif2eglW8S9PlOGdd8LKT3Bw3n6AElbLY39bmvUuWicC0yPbBJFMvnWZIfk2u/DxxfbrcPxcOm0tQ+5oPZPL99iootH0dRr0a/oPJxFV8OtIag2/c8onDgeBhbp1qw/sK5IszlnT/43YOsatnMIZ4qa7TEEX4+pjSWPb+Ls9+Atk09Ak42+z+5PwtrIRuCt62WqVhGBES0zk/6ZCkxcUdgSwmqgHwlp9NfsR9PqA2otRMVJKkWIV8TRgGQym5x+zUZslnlnsHE3DDH09UEHzl8zlKKFUhhxd2NwZsw4C6LYbW9tKEJAipO6hZkCNfQakVshcH3bPfqmWK1Y4JQb09EH5Iw+e1ruUzmYOg0rnYBx6BZGDcFFlQ1WfUIKnTUGF7457THSMrXLGzb9CPtLXIQw9pVQ95TQRXZehTQpI7VxyLwyh6zLPOswUgPCGYHxMQ4gjL/Q3MMZ0B8add5tlwhV5xMxNigSVIyPnWeXzv/mfiCJuozvsazF023NpD0rtb0vqsVXA4QSoEhPyeMu9igRLo7dxz/Tk9ANI3XXDZQ6GcxfkCSliPV6QGCD0EXuO
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6449.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(366004)(39850400004)(376002)(346002)(230922051799003)(451199024)(1800799009)(186009)(107886003)(8936002)(1076003)(5660300002)(2616005)(6512007)(66556008)(41300700001)(83380400001)(26005)(6666004)(66476007)(6506007)(52116002)(6916009)(478600001)(316002)(66946007)(15650500001)(8676002)(6486002)(4326008)(2906002)(38350700002)(38100700002)(36756003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8YS+v1n+GVhgeqMAwzTzZZvLD+f3Fh68BAxmIdOuBhyx2x8UeYCsE4tnQ+c0?=
 =?us-ascii?Q?1oHyErdxhWCAdYpEuFMjnhr6ueZRnpgS+545654OVXD0E4C6tIb1nxxbAAR4?=
 =?us-ascii?Q?PXKxHeBfKyPxoVL6TKMd+zbwzPsoY2XD1iAK7i1Neah3LSlBIzunnfCya+YH?=
 =?us-ascii?Q?ytKqyx7DQI9V94c6Fj9fTLozDL/vlULXGOuYO24+cUgJ3vipCI6DmPCD9C+6?=
 =?us-ascii?Q?LEe6g9+OBzFIt8+yboAIkGlZRvQAmq0fPFF1zMIRKNHFtcghx1rYrHvmsr1Q?=
 =?us-ascii?Q?TcRlMYrLiInmTeclyafFkJhteSTB6DWj2dgLzhWpoiTOj6nwQEiFLTZtK+Zy?=
 =?us-ascii?Q?MWjS+F3RKOv/uzfaMWgc4xpjl7eQEGwj6uA3RV3YDxnth7BmcelOH5DR7dT+?=
 =?us-ascii?Q?AbN6r11uFfQlsat4cl24fcw15u1D24N1M6oLiEk94MVAieUYDs3zGbBiRRqe?=
 =?us-ascii?Q?ifRDRXuJPyDiAvMVlk6fyY0IL1wsaby+k/VliabAQSEqrJL2TqTp5pPGaZQ1?=
 =?us-ascii?Q?UcUXdfBvXp6Ks2bIcjZ/0CM2ZwuSFzQu7jXSk9cVwiGyqySSsD3GakobWQRz?=
 =?us-ascii?Q?edZqwdVFe5I8D1FBRbSQQfetx2rbXpk8yxgYqANEelT82RpenRflKc+K/iPz?=
 =?us-ascii?Q?z56YlFWYnCC5ptbG8O9kLdajjZ7dcqEpK6cjvcNknZIxx8w6UH55keOyVDMQ?=
 =?us-ascii?Q?XkJ4/X0J/l3yx59zP2RF9UrWlRT3SRGnEpRftvrDSR/vNJKW5Hbu87qNaC9G?=
 =?us-ascii?Q?2VoWH2ud182XhDZexv1GTNbA/azjmdjM5bEf3wphSu8/wZHhAaihEoK9Tv1x?=
 =?us-ascii?Q?yhX+a+hZKyIQN9Hg/Ll4AaGFQfFQB5EALBxIuhK8+VVzTH1UKgIZEbVbl+W4?=
 =?us-ascii?Q?xNW2DzRhlgWLAhsqieWdp9AYMSqyGm3dD2QRPnToZewOm646CFyhYdJDv4xK?=
 =?us-ascii?Q?IAH5yLUBE3kJQr9Ef+J3D1RczTnHjKzDn3eKuyRg1ZZVPVpq4ONHQ8fGNTPw?=
 =?us-ascii?Q?iinhWduXIdP1k3vMGV0j1VsfXFOh4/UPD1ePrCiPlzfy9p/L0zwT4vsmPMu/?=
 =?us-ascii?Q?Z1j2QqGFM3oFZUOPMhUtETItTXhbWAIuu8ziXVFTqOv5DV4HprtBu7YJWf8j?=
 =?us-ascii?Q?WD2Yqhh9t6UH/P3xRmctMS99jbGkCfpYP3aoxO+7NNokdsUI0X0SqaUiUwxw?=
 =?us-ascii?Q?ce65ij9e09YqjTOFFcMjb4TUMM1xTna09s25LX23P14Q339sAnkKNh29MqbI?=
 =?us-ascii?Q?Z3nUpTvSaGQMI03qsc1jstaZSPys5KSfJbMV+3wd9F4HoX0h2MFqXMe2UNc6?=
 =?us-ascii?Q?e/mNRqmIGbX1uzQA+M/P4W7gpxlmsv7XihANWQ1aL3RZLqEnf5xS3xie8wrp?=
 =?us-ascii?Q?9/4IH+u+Eak86si9qUnwmR79Lf5BiZmmEkINM91FQXIjvz25SP7aKB/9GF7r?=
 =?us-ascii?Q?SeeSGmL9+BUfUYgVcKBJqglmTp956zabLcuJunAouiH7q+uBf5/1RT98uqqe?=
 =?us-ascii?Q?j0xrLv8sqbicXwjmvD+hWMRwz7zr+Zx0lbj2ccU7nhouWZyi3EG6W/mcQja7?=
 =?us-ascii?Q?Nw0+91qVqEhHzJJJgDl8x3Jw5baWHGWfX4Zj5cI+JX7b+MSA35V5TGPoRku+?=
 =?us-ascii?Q?Mw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e42e51a-dad7-4d3c-8638-08dbbf42cdd3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6449.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 10:16:24.6042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oBg3QrAXCShxBVVEJ/+MGyyNH/phwyyyq+vmD6xfPy9dHe6g7a+9n8tlVyBVaf3DjGBuY7bPqmUf4zm1CgXOA6la9EUtXv/NapwjfHtNlas=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6413
X-Proofpoint-GUID: jEIThr1Bx9Hs9jLbXiBz7F2E9tcAJoh1
X-Proofpoint-ORIG-GUID: jEIThr1Bx9Hs9jLbXiBz7F2E9tcAJoh1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-27_05,2023-09-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 phishscore=0 mlxlogscore=427 mlxscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2309270084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 10:16:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188298

Below commits on binutils-2.41 stable branch are updated.
cb4c3555ac4 (HEAD -> binutils-2_41-branch, origin/binutils-2_41-branch) Automatic date update in version.in
6ffa5a420a0 aarch64: Remove unused function
b6f6a3ecd15 x86: restrict prefix use with .insn VEX/XOP/EVEX
60834ae1eb7 PR30794, PowerPC gold: internal error in add_output_section_to_load
951a6945b44 Updated Russian translation for the bfd directory
226f2e6b924 PR30724, cygwin ld performance regression since 014a602b86
8c05bf16a51 PR30697, ppc32 mix of local-dynamic and global-dynamic TLS
31b78cc9917 gas: rework timestamp preservation on doc/asconfig.texi

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 meta/recipes-devtools/binutils/binutils-2.41.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.41.inc b/meta/recipes-devtools/binutils/binutils-2.41.inc
index 7ab2926570..b4934c02a8 100644
--- a/meta/recipes-devtools/binutils/binutils-2.41.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.41.inc
@@ -18,7 +18,7 @@ SRCBRANCH ?= "binutils-2_41-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV ?= "fd3cc73ee4a84df3ace3c0e470250a957e7d3468"
+SRCREV ?= "cb4c3555ac4cf8aaf0935cb6e4b09e6882436d21"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.39.0


