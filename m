Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5E71C433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 08:12:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.5905.1646122362005238864
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 00:12:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=j5nRsetq;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=005914fc81=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22188knU031910
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Mar 2022 08:12:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=ytIMnNhma9AqyYlDvOng8L23a7NEfjOmzs0u7fhBjng=;
 b=j5nRsetq25tpycAFwdDjJPMtkYL7aIS67y3uZSfqD5eMynQdoZNkhoBwQlYeQ0sapt8S
 4BUMhsCKIXhxixMqK6E5AWez1HhQ8+ChMluRBAgXppipP6N2AVCGKC9ZfSLd891DK030
 i4cb51PED3yEDw8K/MqI3Kw2Zo/ngUOjsiCuPN3U6AWoFziE93boJP4ELXW1HI5VSaHD
 +5SlmfAvJeaLhsEdKed6m2lnQq3fUtXRT/DFVQ5MI3YFxHsimXxLufElfV4eBJ/LYaDy
 UMGtTeUElUUhmny0nEK+fmBZlVNxj0hdb4PrGmC+mi6s3DxWI8LkCYPdKdzN5kWv2vwK 6g==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3egvnxgwmm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 08:12:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zfld/zTxc2n6h7wMxmnJUBE/kQqR4U07numj7UsRYNpxzY8UXjDIgLl0AHna5zsk3OpdoonFULxuHr1eWTD3401ZRHTCAFpmJlsJS3lkMAoLo/8hM5UgMGnGqSJ9ww90JNq4JHFXPLdygRu3E/I3csPjiKJDI+O1xfsGs0/IjKv4bvZJHnxHqHlj6gIotrF6WX99oSfpt8UytNTO7/ExzeZKNZjJY9E2MRECkXTL1L1XaeG0qt2BgzMiRPjU2imS2EkwT7wAC0VVX0UmgzLn8VCyAEfgUA/DxVMfMpxMlPVAogLB3k9dGlciJkSkuDzA3zG+e5f6TYidHNRqiFhqNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytIMnNhma9AqyYlDvOng8L23a7NEfjOmzs0u7fhBjng=;
 b=hMZbDbZSmCogykD+iNJ9w8XDCTAAYIp7MCJinYFXN5lIZuhAn8YO6PWufSZ5puYSLJHrpWFhcolinkT2HLdr5To0OKkC9Si9CLBxsYXv87c2KiqxMtQLjaWOWI1TboDtj3VO4URXQFtG9f1ztIGnpDDx0/JwSIc7rsnqhrG/W0WO+sIWlNrkGla5FPq4Z7/RGXE0xegva5wX7DzFVFdiND0zkectB1JFUivxWJFwMI92sVKlSLM/ovNGWJibAH9UYnMFx7REsRvSZvjZcnimS8GVMed73I4MSKQj+EphFnpU3lGFJqD13/t2+3Dbe6OE8X4cJxbrekW+fOjPz8KECA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by BL0PR11MB3410.namprd11.prod.outlook.com (2603:10b6:208:33::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.13; Tue, 1 Mar
 2022 08:12:35 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::f0d0:2344:b876:db97]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::f0d0:2344:b876:db97%7]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 08:12:34 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] multilib_global.bbclass: fix setting preferred
 version for canadian recipes
Date: Tue,  1 Mar 2022 16:12:18 +0800
Message-Id: <20220301081218.25469-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0027.namprd10.prod.outlook.com
 (2603:10b6:a03:255::32) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e673ca9-2732-4b4b-2b9f-08d9fb5b3d8e
X-MS-TrafficTypeDiagnostic: BL0PR11MB3410:EE_
X-Microsoft-Antispam-PRVS: 
	<BL0PR11MB3410DDD704802D5391F348C4ED029@BL0PR11MB3410.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zh/F2c+eEijXOalsVnMGXjJStJ4OwszvcokPO4Twz23+XIR2MsqmmMgktZ181RJYqLdXShd7tFNP40pDxH7IDIv/oE1r2LdWRT/r1ot5uCBUszwuVDLIxdbxVkrORSW9G+K/Df3eokTS3qz6f/FjSbiPcu82Q9Jm3d5wrBlMkpt7P5sso1UOle0M1AXbBWFxYuyLJf80K4qsG7HJmfX2WLhPLkxLWsT106k/3dV6LiQo1LCITpPmViuK4m7IaSAy/hV8al+HPb0sFScGv4qpUqKM6HaAT+TfbWMm5rZORQCE+jQmJAMTH+mkoMrbUoPHEH1fAw3cKMIRFrQumNNcFZ8eZ1hVXoJ3GLJTpvtJtOd18+OvFbe5w0EoFs5GyvQvqkjYmEVFvgzQZXbS0BG8Anur2VPFQg/Z8Ab5DsfmMzq6WyaqIH2RVQ3cWdg3rBvUAfZx/B5Uh7/8snriCt0vL1XewzR6naP4Rlj2CXgt1IyYkDhgoNN2olYNbQHFbU2t7WuA9XeTflb0ThjRcoRAumEsudx/b/erlExadFUwxRcGCgUSLoBb9gxqY0MpMi2IUM8V1TXx0E2OklL1behrUO82yAjRg/hcTV7PWYy/Nyay1msOX0m6xKpUpC9UuoWTdB5ABWH3ZmUS54g6PTwIftBPaEUeTVu3irbjPZ6L7Jvp1Uk6cmlgmpON/0N/saWRFuxAl0wo8LUQn577Nvm98w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(508600001)(6916009)(26005)(1076003)(6486002)(6666004)(5660300002)(8936002)(86362001)(316002)(8676002)(66946007)(66556008)(66476007)(6506007)(6512007)(52116002)(38100700002)(38350700002)(2906002)(2616005)(186003)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3FpOae8zA/wpnYMFHechUpXlmradUa79DfamNKz80oKkUaSCUI9IZaNhNnqE?=
 =?us-ascii?Q?jXduqL/5Do7TWix2WDIrxAUB9Jqbpmwy7pPp+WukGLz26LvktD1nvgQIpOf0?=
 =?us-ascii?Q?DQU66Gdzg5psMISl+1hoG/aWMjaMMxiG84LArmYCqVS26Egye5qFjq3gVt+d?=
 =?us-ascii?Q?/2hYCc/oZ4wFeAiHp6l0UuWmZUsr7AUW5vR9Cg+emFTiqDqMEgVWf4uxviL3?=
 =?us-ascii?Q?EgxgHmr1vx7oKG1as3uRvwYCuZ1jXIWzr1Or0lImqJo0MYqjmVeaS2uVqXsf?=
 =?us-ascii?Q?LNy5N3Br8/Ykh9NbrhdesOcrUoTGV6uvkzjbueI3vJD1/KcoJYEQBEh6w42q?=
 =?us-ascii?Q?oqLlfjsqTXHb7LkfoAbKjvQ/gBxXwLjpQy6ePxuxzO4x8F7SyFhZzvsctEqZ?=
 =?us-ascii?Q?nWM80MQQtHohQBNdiXDCGHULMXpQnf+Qd/PFYe39b8tVD+DR9I5as0w9mEdJ?=
 =?us-ascii?Q?8Wy0MBu/G7iWm2EoZho+Oc8H3x+WFeL9eSinxkpJFy8iYm6sjDvvaX8+YcI9?=
 =?us-ascii?Q?q6lnUg+mQZ0l7HlZJZz3+icPghLiQC3FHCgbQlObiF3GrfP9qUFERoWSeWWj?=
 =?us-ascii?Q?YkM6v67G7vdV8PHTV+5f9CZT+A6U3seJwFCs192bBlZcx9y8Q6LGJG3zIANI?=
 =?us-ascii?Q?g0jZzDgNb3iHI1BVk7qDeM+KJ2Ep45nBPmjylB7ctLphCSSHYGTnlwrgZdFT?=
 =?us-ascii?Q?jROM+fx+8xOeA6I/a9ruLkslwdr2I/Bcp5LPVYsSC5N94BpiSiiASlUrne0s?=
 =?us-ascii?Q?Uw9HeeZSe4hKl3Sx9Obhds4m5aAwYPjwP55fnF6JeMw13fnSmH52Mzfq4vhG?=
 =?us-ascii?Q?o639apBxxz47Im0VZHVGv3x5m1FiMuSzPK79QrNsmcQRdLAWAXdyuquFPOuv?=
 =?us-ascii?Q?1/ODJ4Z/a/MPAfkqO3M0qbBYwhirT5s5Q4DxdNz+UocRqbjUpjE20cUzKyp4?=
 =?us-ascii?Q?EkSPftagQAePXzKgax9U0Usq1VJiB7daKuAjtJD99fzVqQM86acH4Hg5SRel?=
 =?us-ascii?Q?Zy2yQhDjxzcfUAhWXeGVYTqv4nicfLbovcA/V2PIQUJoAyoHglZhnma7UJ30?=
 =?us-ascii?Q?kz4A0+5KBltYhCJDJzUoAVHXPxaAq9Xs3Pdr+kyvpGQQ1yz3zIEnUeRN3t0F?=
 =?us-ascii?Q?NuBfAZkIZW4TTyjKDNCT8wqF2mdn27D1MG1f3Xi6s8OM4vsmxgulap8twICr?=
 =?us-ascii?Q?S71i7QqdJ+WqKfvQrXfFw8/UJtNz4jDVdDwb4EOAGytWzL6NCrN/1a3E2vyQ?=
 =?us-ascii?Q?g+XGIZto9WyfK2x1im7MhMMkKnfXqOD7Y1ZgPtO6KDBcJy5DiFK/8Z2dg3LX?=
 =?us-ascii?Q?n5RV6rLeK+sDQj0bp3lsvKTIBfXC5tPPQLXbIoczg09vBS2oJuLGAqeth7Z/?=
 =?us-ascii?Q?1PSQlgKtj6A9EQu4NU+sKBKC3VEEx+ft+rkSiHOKdaKIROTUaUZTrnmn9Zlk?=
 =?us-ascii?Q?nn6G9FjSofq+3zX22vKx1wGf33nEYK6/En02tYsNpTNMGTKFKXA75f30We1r?=
 =?us-ascii?Q?AumhBjM6zy8YtGyWFq4PU52fo/47Zokb9TMSICwRFUeiupigWwaWRrc9dt8V?=
 =?us-ascii?Q?XnXs4/dM6bqhjWQs0rcazm/DV2/1V8g1bnEKyp+jOrZPgvHT3dBOxysPp47Y?=
 =?us-ascii?Q?BtxEDIF14qQdujA6xHQVbhE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1e673ca9-2732-4b4b-2b9f-08d9fb5b3d8e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 08:12:34.5937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 wPhVlaidF4VIekV4Czgn3Z4IL5V8O8DscR5lVTGfA5hXEMrpC9Pk+TUiMTBfN4xcE7PgSa9ugL+pngau9TzqRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3410
X-Proofpoint-GUID: e4_jLrGDLHlGBhSvF_BMFbx_lxvlkRaB
X-Proofpoint-ORIG-GUID: e4_jLrGDLHlGBhSvF_BMFbx_lxvlkRaB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-28_10,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 mlxlogscore=828 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203010039
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 08:12:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162531

Currently the TRANSLATED_TARGET_ARCH is not changed when trying
to set preferred version for canadian recipes.

e.g.
```
bitbake core-image-minimal -c populate_sdk -e > env
grep ^PREFERRED_VERSION_gcc-cross-canadian env
```
The result is:
"""
PREFERRED_VERSION_gcc-cross-canadian-x86-64="11.%"
"""

We need to explictly change DEFAULTTUNE to ensure TRANSLATED_TARGET_ARCH is
changed when trying to set the preferred version for multilib version of
the canadian recipes.

e.g.
```
bitbake core-image-minimal -c populate_sdk -e > env
grep ^PREFERRED_VERSION_gcc-cross-canadian env
```
The result is:
"""
PREFERRED_VERSION_gcc-cross-canadian-i686="11.%"
PREFERRED_VERSION_gcc-cross-canadian-x86-64="11.%"
"""

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/multilib_global.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib_global.bbclass
index dae015cdaf..c77ca58997 100644
--- a/meta/classes/multilib_global.bbclass
+++ b/meta/classes/multilib_global.bbclass
@@ -39,6 +39,9 @@ def preferred_ml_updates(d):
                     override = ":virtclass-multilib-" + p
                     localdata.setVar("OVERRIDES", localdata.getVar("OVERRIDES", False) + override)
                     if "-canadian-" in pkg:
+                        newtune = localdata.getVar("DEFAULTTUNE:" + "virtclass-multilib-" + p, False)
+                        if newtune:
+                            localdata.setVar("DEFAULTTUNE", newtune)
                         newname = localdata.expand(v)
                     else:
                         newname = localdata.expand(v).replace(version_str, version_str + p + '-')
-- 
2.17.1


