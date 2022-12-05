Return-Path: <ovidiu.panait@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D52EC4321E
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 14:57:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.17085.1670252228796180352
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Dec 2022 06:57:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=93386eef5d=ovidiu.panait@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B5EH4kX025738
	for <openembedded-core@lists.openembedded.org>; Mon, 5 Dec 2022 06:57:08 -0800
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m86uqsa0r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 06:57:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QfBBHEoP7B0XvsJp2A/didTLa7QYAk+W93UVoyDTi4/99nFuIr9ouOxLe61MfvxGA6618dFadHhSeV5zJcjKmt+QaA/RZs2/HA4OnrOdQLFEE8iq5uo9MY4acRjC96GqIA7h3+afICPGSzkqzqNoUgX2vGkUIClty0YU2RN3WNxp5cMiJNfdyCBAotyi1XsWncUv+DnUvqxA6uwfXcLAMDh3NWISljDLWCGPzNU7aWq2tDrliaPthF83IB/ELsNdLZP+5sKTxZJ+KSC3INBXCQ6LC+JShzmjSB7S+34P97eRJa6xSll3tuw27veX+7Fi+W+d3mjb7pmWnxf0XvoJ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eumvweB0k+cWpl131VLqxeg/Z+vf5WEUjY7rHsX6OEw=;
 b=GgVqYz2EXHCHlu6Oz4kx+g1SnhYDUA5r6XtWhPt/PEk9788DcFcAVqOIW/oPF9iuIMT+1RJ9tKQu9PxIAHkMfrOwTPEK6EGWwtu6RVLs70e0DKTWNxJX9Z7GIAvGIb/yP8Us13LHZdNX4oq1hNxmSpxtZSlhJW3wBoT2qO9BKdNTQxI3PJpHgsmsf9aiG+58dFLHWjqNYXr/M9GfeP4Fjw838SPxrqNcSbWJLrRRujKxZa/0c3ev8rxCznhioz3ACB5cJMaGDLW+1n1qEHNw8v3DD8/bBqAWK/WKl7mojlIZB+s23fsOclxFUFuLWFhLZ2MQ7Kw108PKgF3XEz2Ufw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from DM4PR11MB5327.namprd11.prod.outlook.com (2603:10b6:5:392::22)
 by PH7PR11MB6330.namprd11.prod.outlook.com (2603:10b6:510:1fe::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.13; Mon, 5 Dec
 2022 14:57:05 +0000
Received: from DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::da82:93c2:307:df99]) by DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::da82:93c2:307:df99%7]) with mapi id 15.20.5880.014; Mon, 5 Dec 2022
 14:57:05 +0000
From: Ovidiu Panait <ovidiu.panait@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] kernel.bbclass: remove empty module directories to prevent QA issues
Date: Mon,  5 Dec 2022 16:56:49 +0200
Message-Id: <20221205145649.1284692-1-ovidiu.panait@eng.windriver.com>
X-Mailer: git-send-email 2.38.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR08CA0136.eurprd08.prod.outlook.com
 (2603:10a6:800:d5::14) To DM4PR11MB5327.namprd11.prod.outlook.com
 (2603:10b6:5:392::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5327:EE_|PH7PR11MB6330:EE_
X-MS-Office365-Filtering-Correlation-Id: af0dba10-043f-4703-fe10-08dad6d0f99a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DHyhyV6DV4OXEHrEZRqSUe8HMCbSoZuMSvZoIXKmiunQq+oNXwmipHUouh7Fnfkfn1agT+VRscgDZGGY+g/Ti0AZSlbxGeHBnT3rzesuEIa22y5s4A8XGG3WEIOutGTRsSbvRKVsemHxRvnFz1jyBtSxjUAdtkcrQ7hdehscFPOu++Vc92ef9X8Lb28yPeXDzcfn1NYAFXrsfVTUhwBGr/lVwXZzlj8YAJiU+dpkCIlgKrQ0j+aSSCD1Znjvr+zAphPBt0NSXXn948W43bYAxQBLpjh/nNUzJ4ItFW0vARXnH/zQ8QTdFRLbuB0YuWUZ6jMI6tMn3f45vMOaqgS71+XG1A0AsTJi2VuO9Do8nSDOB1TLpUWN93+2G9sLocpYMrz2SdLEfSMo3Q7fgyoXEjCuBb88SUnHtAclD8oks0uyi4imhUv0b0d+Zrdl82/IvFuObj52Q91XxwjoDomLAqRbGFlRVxQI0k7GdUMKkaZRxuivjRw6H4DELQ7IQVO1jB6U7UyC5C1H9TYHDuuDib39mXe+RgaC3MIgc7w8LK25sIdvAohw8utsLpYxwOAHpDevgaikusADkPgxuQql1BrTNlH42Rp7iz1AtgYE2fSXP4T2iyhqg4hCZPDM4g1C/GfJF0EO4JJfoeH5TmC32WpjDaK+vWVq39DZOwvCBjqAVNpSeCQ8c1l7Bd13f9EX
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5327.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(376002)(366004)(396003)(136003)(346002)(451199015)(2906002)(44832011)(5660300002)(38100700002)(83170400001)(38350700002)(83380400001)(26005)(6512007)(1076003)(186003)(478600001)(6506007)(6666004)(6916009)(6486002)(52116002)(8676002)(316002)(66476007)(8936002)(41300700001)(66556008)(2616005)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kLIRJANomA4tHBVTkh2fv8HUotTX8p3tjBamP9cMzS0PB8xh9GnBNskPIVGG?=
 =?us-ascii?Q?VJfAe0D0A679xpojaPdqg5hJ1mAsLz6bYHngf8qJQCq/rphdNHUNnqwSHk2q?=
 =?us-ascii?Q?y6H5DrsM7frCg7tM2feMflD/qzl9ENK4PYBY58QHnHx8OFzLoUJMp40dCmxo?=
 =?us-ascii?Q?n8bAUuRknT6hofz+XGxsKpU4nW/hnRiLe+aCGBdgPdOfcmtDkE/+cYBIl5sK?=
 =?us-ascii?Q?oxVZ/qpzbg5+q15jgvNwAHJo/cjVZAUBy65A5nPwqfLHoUQspZzgSM4d9mPB?=
 =?us-ascii?Q?wRSzvuZp16zHzy3etvdGA7GJCSvC75DfCQJvFA0py8XBB+ZPJ1wiNUHpAIVp?=
 =?us-ascii?Q?2dEsOQ1icQe2tS3Sc9HG4mQG7/MpQmQLl8a/WaSI9HxTKkRiYU/cRbEfJA/0?=
 =?us-ascii?Q?VT9xJ3FagmT6lJO1bjzU4UqkJ79AHxxdYdFrgwova1ahFPBLLeCbBTv+kKQ3?=
 =?us-ascii?Q?1fxYr9sB3yXPK0csMUrHy7Aq3vF6wBzxZjYqdUteTqMvh9zPM806L+leDPYz?=
 =?us-ascii?Q?+vTm8VQ4dxAzcNI9g9qTzA+LgivaBlwMq1b7RHlX+Uz4Eh0ijD7jvEUwuGQ0?=
 =?us-ascii?Q?fVX1lXn1nVZw2q5hgMaPEDhiv+jdcLb1Hu+Byq8bUk88i212SBb7A8fLTHHX?=
 =?us-ascii?Q?P0N/y+DL5t7VMvv2n7IMDPpu5enCV+rzuWui4MWHUwQ/QJRxuyUawtEatxJv?=
 =?us-ascii?Q?pbFNl1DwlLejWhBdkehsUizsTparbi21bH8O5rlve5zGkSFTnDzdCraKywOU?=
 =?us-ascii?Q?LkdKCj6IXgBanihOetdw59XRGZqPhhGe4Nj5dfwVyZispfsJ05VykmOii2Eh?=
 =?us-ascii?Q?dIWuPSYWznreviK0qon8nI62WBduJ4OWkG1V2cQYaMdRRHPJHp6tOe5mqy/L?=
 =?us-ascii?Q?Mwiqg+1TAzCh+HqK3dWTAL2hhTlfmfviY+8yPX1JEsi38ZjwOMS7uONHTKDv?=
 =?us-ascii?Q?X1vY2dGwwkfBrVE+9WV0E8BtA2MmH8o5rQMHPHmu00ECKkuQB7sigRnq8swh?=
 =?us-ascii?Q?Tpm/U8VUhCm4AS21a2z60QC2342Lw2+i/DkzpKRE43ShkfxfVe731CT+exlX?=
 =?us-ascii?Q?W6J/I7rVEf9TYVHaEkbBs7MqXX2hCq9ko3EZ924n1zvTGVg6L0DGL6sLN7Rn?=
 =?us-ascii?Q?yFzpMJqkykM4B1iw+d2ibUwAjtFvJhZvk8RzFOYvauzsMed8L8D1NG3ttvVF?=
 =?us-ascii?Q?dY1xcOoRtZyb0CTh7EPS9sfyZF1qYN3Ms7yApqB5WzioanIaJ/G0zyYTgasA?=
 =?us-ascii?Q?gLWg+2f4R85YS2h4KcjziEvbNK2WdHscC7Y42fKv7C8bSAkPK/aXhGrUEufu?=
 =?us-ascii?Q?3v/w2PaxZ01I7RjFHR2CpJzz4WyqpB0v0YcHaXr7+0Bky1dZcwhWVfU6x/Oo?=
 =?us-ascii?Q?j0NRU/51jar/cz8SATk6eNO9sRImXWoKcKwNEC8iXRYK64Ojjk18BrdeCkkM?=
 =?us-ascii?Q?Awu3C2Gf0zC4EUTG/Fs22L/5/aFWz7Ml2rtNeVbj0K8LK9RH16jS9i00Q418?=
 =?us-ascii?Q?PvTOfifKa+E+1qaucw8cTSX38F0CrOGXju9ibrKb2CCjhy4PMUVpnjI+4KUZ?=
 =?us-ascii?Q?M68RmJ4bei+cNev7vaKwOMiGvZsGHLNTkQRmwCeFQp6UEFZnlo9FgxCc0c6W?=
 =?us-ascii?Q?rg=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af0dba10-043f-4703-fe10-08dad6d0f99a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5327.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 14:57:05.7915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 92G30tnB9r0x/DMaXkfK/X/oJFCkTcHii1HT1CzW4jFBrLx2Gt/6Tg3mRFTPkV2XxOA77or2e/fPiB+gP2QldZ4PtK0o0XQCe7aBYsUTTOg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6330
X-Proofpoint-ORIG-GUID: ni9F1G5RyIF_wpJyGVI-zrdgyIkVrqiA
X-Proofpoint-GUID: ni9F1G5RyIF_wpJyGVI-zrdgyIkVrqiA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-05_01,2022-12-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1011
 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212050123
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 14:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174291

From: Ovidiu Panait <ovidiu.panait@windriver.com>

Currently, allyesconfig test runs for x86_64 fail with:
ERROR: linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0 do_package:
QA Issue: linux-yocto: Files/directories were installed but not shipped in any
package:
  /lib/modules/5.19.17/kernel/drivers/nvdimm

With CONFIG_NVDIMM_TEST_BUILD=m, an empty nvdimm directory is created during
modules_install, which triggers the QA issue.

Extend kernel_do_install() to also remove inner empty directories that might
get created by modules_install.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 meta/classes-recipe/kernel.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 3f6b40907f..553e17bb4e 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -450,8 +450,8 @@ kernel_do_install() {
 		oe_runmake DEPMOD=echo MODLIB=${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION} INSTALL_FW_PATH=${D}${nonarch_base_libdir}/firmware modules_install
 		rm "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
 		rm "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source"
-		# If the kernel/ directory is empty remove it to prevent QA issues
-		rmdir --ignore-fail-on-non-empty "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel"
+		# Remove empty module directories to prevent QA issues
+		find "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel" -type d -empty -delete
 	else
 		bbnote "no modules to install"
 	fi
-- 
2.38.1


