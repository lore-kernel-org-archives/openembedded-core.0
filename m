Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAEB6C83F12
	for <webhook@archiver.kernel.org>; Tue, 29 Aug 2023 07:33:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.12387.1693294435955305962
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Aug 2023 00:33:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=S+oHYjFd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=76053900ad=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37T4eqTZ025677
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Aug 2023 07:33:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=GEW816z2qLTeCHN5ej
	rQVgzpyMVV2oBrCR5qW4P+Wus=; b=S+oHYjFdLj01v9OlxfUah6dB9xeN2hEO3G
	6BfHeXDQiXEgyDTf1jAbRtE25c3N4FtFgpYpq2aIBpkcOaDwECWqpabRtMWhnby1
	eArbvSoyQqe5VW7zVL7AjIgg1xMNto8WM9oHV+CVgN8SaVRsLyPOrQRTvA6rTC4h
	NJJ6QM9e4TDzrs0dwC5kIsIGkcSdNsH7XkmPwDVcT+LoPLBRyatE4r6oz1PN4ybj
	HtkcFycBloFhdQzlhzBvuqvpUI6x8vdFyJx4n8BCkUGnhH2HZAIb7nKUCJhk97SC
	JXoiFWrGC4pgZZEEFI270tSyNPTuqJ1Y2dQPBJGr1u+sfFRaDeKw==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sq6kwjf5d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Aug 2023 07:33:54 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iVKd4UNDzrJatOUSVCc0MGfSrCv70BMNcEkq7Jzw6G7qBMBtGbmyHgi9RLtlqwnLwUpQf7WJ4vGjdh3n0koZIwcP++xrtgmUS13vwM/BCwoW2wNqAELVXrQR4c9iotPwTc0j1dDwG788xqBBjFo2876exIqRwOIu/yjjirXAVoqIrrSH8BiMzHU5OzyjuPZWyq9+yP6wWG7xDlmhAd/MzlD1bcOYwi+l2MWxDVF8cQhDw/dcUg9Bci+AzUPUd8WsLMJpLzBKFTbykjrWgDWNNwDYjwzqCi1eq+C85FBVybn/EKCACbXRUPWPAC71M2sb2XrTvPWuuUqFcxQZZ6jfew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GEW816z2qLTeCHN5ejrQVgzpyMVV2oBrCR5qW4P+Wus=;
 b=dkV8HJeD61xOe1v6kBa3czqOTTTARxTtV7zMWAEQuauTNEGkERVZVLUkvdIPs4uTPGvZ48n3aEDoJ5iMSDk5m58/DrQbkhqo3pEpz21Se6cs2RQlrzuvTDx7PbMfp6ILkw39SC0sAz2Cv85IobSAPlhQ9NquETQB6A9YiIv2RbY/PupmkPtUY1jA5m7ts8G5nTwgsyhzt1xF5a5HqocfB2NsINV4/CgLj7Pcq5CO1aU596GLOESrHFfU1h74yEBuyawQsxsHdSOB8kHccEUU7qnhCcqmk7uSBiZLA7tO75lk8TrwCnp50nxWSkwnjCGvcmPR8jdR/a9IlL1p5owUSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS7PR11MB7805.namprd11.prod.outlook.com (2603:10b6:8:ea::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Tue, 29 Aug
 2023 07:33:51 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::da88:58a3:bc6b:2e3d]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::da88:58a3:bc6b:2e3d%7]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 07:33:50 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] uninative.bbclass: sync to use UNINATIVE_STAGING_DIR
Date: Tue, 29 Aug 2023 15:33:30 +0800
Message-Id: <20230829073330.2830577-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::10) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS7PR11MB7805:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ead2692-9f47-443b-8c42-08dba8624a0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5uHFoZIio7cbNghmpyMBLw+ZYT5lbq8DGDKABbx2sNEUKwrlVVpcrhxMJoFTNCYGOcdVKlm8FqQpMoYpkVqmsbSGSewxx3ixT9MOVV/9TWrmXzDq0wBvET9Hf3fbI4ARE7oqUXdCSWn913D3ABD+5WaiEcz9RHTwmfI8GhP10B/qwA4LM2dyoEFQv7biGhxR3VkgQ0lO87Fgk36VRG3vAgYSPYyPQAoHiKMduA/mVaeGCSNk+e+zFyAjUqbUTZLy79OKqtSPL4c7dDfn63D+Y2pKWBj11OH4FbDkStoZxt3Ef+H++VUB6yXgFvO1mCZ6sOWX2VRvcYyUZzDiWhhsKtt1Ice8MrJYrE6dtIanLYX+gASgVtCIOOTzQIww6jTIgc0Gk3h5+fCCP+FYDngAuKWMmVfD7AZU2yVBOnsQuTT7TxL7IAG8ReobnucZY1q+Etl2tLuOb/JQKizFQD6FyLK4m0zHa1p5sJFCAgyBbIskAR/YX6GAW3x6VphAkDT9GB+YvYMHmnL7XFk3UM0ycAzE0eLPJDiyYlk0iMY+wjXduvDy7FAfRNvITAS87ncO7DDLn43QOh8uivlvzfJ6mx14WS+J1PzFljnu36ArPclu07MlFbl0fCw0nnp7mN3C
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(39850400004)(136003)(366004)(186009)(1800799009)(451199024)(6486002)(9686003)(6506007)(6512007)(6666004)(36756003)(86362001)(38100700002)(38350700002)(1076003)(2616005)(2906002)(66946007)(83380400001)(26005)(52116002)(478600001)(66476007)(5660300002)(66556008)(8936002)(41300700001)(6916009)(316002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?935A/Cm1TtGtltiOur6tPCyIxFhX5vBebAQJL2xm13/mgFzbkV5R5BPGcjUM?=
 =?us-ascii?Q?rqCIPo+ymQJ+TYc5chfqADMNfesKSs1KGuTER0DAkp+b7eeYoDRDvIu0qgnw?=
 =?us-ascii?Q?zqEahF9ebKw0Ftm3x2nYSwbbo1stEKppCJKbwJ/nxf6cPmnIm5TA58zULeLN?=
 =?us-ascii?Q?zOFkxQnVL36WXMR5Szm2AIoqY1Xpl7un3rSh5mIs67z3D/sXIJeP830aKDik?=
 =?us-ascii?Q?lN8vSxG/S+OQo/TfWWgi7PL4uZtWEACedx4zaBIROpXrLNLCIRXjkqWEtOyr?=
 =?us-ascii?Q?30uId/DnjHIOhmwk54vT6vaYR/j0CfoBUhX4uTUYqFQwh4m3t5Ry06naBo3t?=
 =?us-ascii?Q?a9jHVTRhmXdEqToAY7hBFNtTW90spm0/xgII08HvVe1Yx726IVA8ozLDMTVU?=
 =?us-ascii?Q?IeCXzPDhE82sKAliuo1OpShjlKPE7Dg+9as6H9zUR7CifxTlBPmhNfqjSlea?=
 =?us-ascii?Q?pY51dDB/bBPyRNd7bRERFFjeBkEU0j4s9rj0dIY8H2IT1fklBaOsThQilGlg?=
 =?us-ascii?Q?ijfPA8Gv3RuqP2e9mrlAxFDYnkp+Gf80u5JTTWyeaE2/nQGtTTj5GrBOVnn1?=
 =?us-ascii?Q?UwD9KxZPXTtFHDkjstROOeO+Gd6JGUCccO+rRn9Je7pOEYOCu/dQqH/nml/s?=
 =?us-ascii?Q?x6Z2iAPlEW/NL+RDIKIU6bUtyqi4eDUkx532U8JIMvE2+1ODYsq/rEceBE0O?=
 =?us-ascii?Q?zYRoy4om7FmsULhiVHhC0Z2/EIWgOqDFP6J8z+YZW7T5fgv0xoYIm4jFBPH9?=
 =?us-ascii?Q?U0M2COWjkIj5PqNydGtsLPHxmb2OoMFrcBAQQorZTX7dvENwM6CsKTAMiYfl?=
 =?us-ascii?Q?Ng/+fXqOK+pRL9t0YujUx33G851eofcNGoRTjFeZad8t3moRMR9xU607DZ4M?=
 =?us-ascii?Q?JR7g8VGzFqAzaLreNFJpyOd9pvxGym4VNPGC6C24l2F8V537ToUM+HHyRdK2?=
 =?us-ascii?Q?i82hL2K6GNCi/ubKM/RxuDIM2fydNwDyMp9v6GlPIkXQexmTNwlFH3pYgxx6?=
 =?us-ascii?Q?tMGAyTMCRVupoK7EYpyk9XQqpaQL3Aa8rBVKnXFA6HnWdfkBuSytcboe4zh7?=
 =?us-ascii?Q?Yd1UxFqUIhi2EIVcEfSfkEWpi5OJjO9ReL1l++OSlpHY8It6TpL9/eWMTkHt?=
 =?us-ascii?Q?C2O2BMgbhGH8EysB4a24yWI9LMRp/j/pGzewRVJWWcw27WTGisvw80W+RBHU?=
 =?us-ascii?Q?LA4HMI1eVWCxTmKK2g9j2XY5LrORsYt1L4i4KyzI1CJsOkm+yRnxZxZWXyyi?=
 =?us-ascii?Q?BCiMcC9/dkcaVkxfhy9w+bPKmy8ArrZcWEERDginkV7ZPkFGNLPKlLaplwbA?=
 =?us-ascii?Q?ZkQz14yi5neqePK7cHVKe41XT5yDqFV/ZRCI4QturKsS2766BqagP4A3NLok?=
 =?us-ascii?Q?XE7VvAMRo65TxWrSTe33JAiUJoGJ7s3kXGhRQGm3FydLXKA8SuELbKw/2NCd?=
 =?us-ascii?Q?ks2PJTylf0okNa5bNaFP0wdDPzrG0Drw9TlmTS1vOXikv8HyKb8omc11Bghl?=
 =?us-ascii?Q?PtgYChiKLmNP1G0I+zjZXPKq1P4vSuONRt6XiXrdnrRqRQHLkcXqlWy4T6wy?=
 =?us-ascii?Q?Cco3Bq0ZJkYL0+sRGP9mtoMSFJdR0Fd+17G2leOj?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ead2692-9f47-443b-8c42-08dba8624a0f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 07:33:50.9263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XDGrRh+vDAhRPkFCq4tkIb2cK2sGgHpO796tFo6BXDj+MNtHZQ/TdLr+8Y8Q0PeK07HSigwqbXu4t6JQBGC57Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7805
X-Proofpoint-GUID: jpFt2_VarxfA7xKTCM9bu0JJNCYMJHux
X-Proofpoint-ORIG-GUID: jpFt2_VarxfA7xKTCM9bu0JJNCYMJHux
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_04,2023-08-28_04,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=693 priorityscore=1501 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2308290064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Aug 2023 07:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186850

From: Chen Qi <Qi.Chen@windriver.com>

All other places in this bbclass are using ${UNINATIVE_STAGING_DIR}-uninative,
we should sync to use that too, although UNINATIVE_STAGING_DIR's default
value is STAGING_DIR.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes-global/uninative.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/uninative.bbclass b/meta/classes-global/uninative.bbclass
index 366f7ac793..9630726f33 100644
--- a/meta/classes-global/uninative.bbclass
+++ b/meta/classes-global/uninative.bbclass
@@ -146,7 +146,7 @@ def enable_uninative(d):
         d.appendVar("BUILD_LDFLAGS", " -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=${UNINATIVE_LOADER}")
         d.appendVarFlag("BUILD_LDFLAGS", "vardepvalueexclude", "| -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=${UNINATIVE_LOADER}")
         d.appendVarFlag("BUILD_LDFLAGS", "vardepsexclude", "UNINATIVE_LOADER")
-        d.prependVar("PATH", "${STAGING_DIR}-uninative/${BUILD_ARCH}-linux${bindir_native}:")
+        d.prependVar("PATH", "${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux${bindir_native}:")
 
 python uninative_changeinterp () {
     import subprocess
-- 
2.34.1


