Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F6AC4332F
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 22:22:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.3463.1648765338468496789
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 15:22:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=M03dml/9;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=1089597e26=saul.wold@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22VLpsWH007504
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 22:22:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=+TzdI/hlg+eKnbZoKTjVYtJnRuvSIGAyrmZxw1cDDuc=;
 b=M03dml/9RKoRcxhnDEriqcr203hE8DTymtkwWeE6EobQfv1uRmy9yqxJm5qxPX2r1pNV
 0gKh2b1TD9L0egKXg/hSCzZghaEujVpFffGZMv2bvafL0CnLJrIdcAsw9FthAkHnkTNy
 FF17B7leathpEU74Y9yb9WKVBqgb3Kmn7IAJhrd9QpWYJ6TKZBwACyVhHHfrb04b3WFU
 lKXLTRYc/CPx9VCB/M3FdfiAo82iYIT+1oMJVQIOYSz+io/V2HH2UCGJGLuHz3OjukPG
 cnGQd/l2kxOzu4IR44+4W8qPWroPko6MoG4wsqi3k+x6F7ET132yGnTYH3H6COoqSuWW aA==
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3f1r2155f0-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 22:22:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nXjLPyHi1dOodCgxmnR/rsT6CIqgaIuYJ11k0qJD+4g2NSbTMyXnsCbvQ9FKLlFlMVxxR4DnoNmSX1ElFIB2I7Svj50NH8bndOFU/q89BSqNc+XfvzheAEVERDYBHSAyGkb1Rl+cn773H2GDwbyRyF03qQt8pMrUcwJx+7HsufLPdfeZlTrqF2issD9DRoNRUFJ57puzViNpzlnRhPCjD8FTBeYDuDJYtWR8UHmP6OeGxug1AS3YHasmYGM/u+W1JLlaHsrMuM6DoBx2foEzR7Pt0LrDDEt+ccoPhdMtPoaZgOwcaG6hE2GRarzdzpcv1Sfp/7w6Fs6JKQ0uBQ4dyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+TzdI/hlg+eKnbZoKTjVYtJnRuvSIGAyrmZxw1cDDuc=;
 b=gsBTLKR8B1itMppejdVuIz89ykliNwvhAJim4HYCXDJ3DD9BU9rMGN2bUgxu4BQdNyKm0H+MVMbZLnfQjT3e1ZrzCTU4j1n+q2l/q4bzv1Csy5T+CE4Gje0te1kMh+1XRcIhgoeg0YtbNtC7uRG2FW/eapAHWiQ+5dqYkj38025J8jXwqOGKLAdE5SLg2FoFljmUvXlMgjZU8hUe09B2J/A8FOOL+8TcE6AV0Ftx+AbJ5lUjJ2Yqbr6iUnki3Xy+mrQqfcwYvlhSN9eb3H7LPQ3AkyQqG0tKxi+9hq/e7H2peQRcamJYhLrt9pY2OrlBM/3+K2OFnQlvGdr/24UGVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by CO6PR11MB5571.namprd11.prod.outlook.com (2603:10b6:5:35f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.20; Thu, 31 Mar
 2022 22:22:16 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::e581:b741:b80d:c8a2]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::e581:b741:b80d:c8a2%4]) with mapi id 15.20.5123.021; Thu, 31 Mar 2022
 22:22:15 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [PATCH v2 3/3] depmodwrapper: Use nonarch_base_libdir for depmod.d
Date: Thu, 31 Mar 2022 15:21:53 -0700
Message-Id: <20220331222153.76037-3-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220331222153.76037-1-saul.wold@windriver.com>
References: <20220331222153.76037-1-saul.wold@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0026.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::39) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c7b037b-1311-4137-7bc7-08da1364e92d
X-MS-TrafficTypeDiagnostic: CO6PR11MB5571:EE_
X-Microsoft-Antispam-PRVS: 
	<CO6PR11MB55713567B621C4BF95CA79BEEEE19@CO6PR11MB5571.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EsIAFLMe0/zaWNEccIwfEcNvZiEx2s9qJczToxDa4nZkRQuPesRILQ8vw14Lkr5NgWMDC4Q/WP9kycHUZu51qLD1gJU5GVZf/6RibjZfarqvzbc+tkbCNobHDSKLUimLfdZLQx2XdidUR2WG6sub8b9JXsxjXFTVoIvjhIc2BveBQRNjYMVTkaO9TSF1/xb3OlrVWOxssmSdyvoJB5j0+fs7UQ3GTtPtToGzgOnuaYCd3mqqcBXhYPL8MfueOnDYDWmfmtzY0sSI2n5ijVPuQxMj7HMSyiXz0MDRrEB+rYITa/DQmmV8jGj8jstpd11OKrWJiaaWUXW/c/0W90rRziUSw+s19AJN78UhXs9PRl5aByP9ELVG6Oboz0BzEVaioH08gSQdD9JFmMMFE+ej1Ua+7Uxr307EGaVhqhe5IPUsrykPj2JouST+5EKwCU6PHKpt0BK0Q4sELvzjqbEfo6u9xHz6tX5LhrhcEq6gL6r+1/RdPNp8oqlHN3xy2+MW1f/Atb4CIcaKZzE+sqNRVdjSQjiSVqF6gDvey9/aOmWytj8x+D1kXV5VYlSfT/aZepiOWnvf3/2RbzdhwYDUFLOWHQdzXXGFCDp5Zg+4leqw00JSeepPchUqJncDTITaQK/DhNkb0irEoudjKAEPT6aBTZMj225wFcNVkU385N8Owikpn/+cYsn091WZmSY7egSrL9X7n3I2D824IFs32g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(1076003)(2616005)(6506007)(6666004)(107886003)(5660300002)(44832011)(8936002)(38100700002)(38350700002)(186003)(26005)(6486002)(86362001)(6512007)(508600001)(36756003)(316002)(6916009)(66556008)(66946007)(66476007)(2906002)(83380400001)(52116002)(8676002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xW4ylpnCydzTeP8vyZdDMeSJHebdPshWamgz2r+sBaypIXLlfQTiluwklY2g?=
 =?us-ascii?Q?78yXVcymVsQyi+KKmjIfz07zWEXtwHpyy7rC3ZR4t2lHsjQzu6A46YTBp5Hr?=
 =?us-ascii?Q?po34l43LMmboX3Napqs94ShSV91JmAbHNIDKD2NPiCZ6aqFBuPWsSn30LXEb?=
 =?us-ascii?Q?m66serdADbt+GEp14Noji0AQiO+lozRGa629jPf7cwuX4w4CGTLlba1iPwfd?=
 =?us-ascii?Q?H8PqW25vy6KTWlxWDDpq+68UCHC74Kn9GbjYwPdvT/0hdESpCekBc5g4fr9o?=
 =?us-ascii?Q?uKiBSwdWR0L4Dht6Jy2hEkmLLN80mrkzOwaFgJDll8/4InMMLnSfEofBauAa?=
 =?us-ascii?Q?TiLg+rmG4DqGzexabd8fIbHc9KS7B0SZUWQ2nBHdBt6cIAoIzIaDjWK01+tq?=
 =?us-ascii?Q?hT0geToDMHUSWyOAmA1iBGDg+WOVwYsHgD5iFvi8GqqlOaV8knpqvMOPU6dG?=
 =?us-ascii?Q?psb2KO8MixlljLcSIbpmamafRfWu27HvwJWdhDUjiQx7/psGbJ08wmII3pQT?=
 =?us-ascii?Q?tSLJTRc+8BArSWwIhMsRPD9IMD9fp1/dRse3LOLDCSWFrc8xO7014w3ICxuS?=
 =?us-ascii?Q?U/UhUFfuQ+G2CNlG7eQWnEk/cojqb8b7pWOHthRKXlHdNku6NR6S8l/+i33B?=
 =?us-ascii?Q?iLu2VNs7tfg6kKo+69vhnl9Nb5nsfQaiLooZ/m5Szq1XUO12GC0gRE+ezrK4?=
 =?us-ascii?Q?dZj19Bl+3xh3FrbtpKJJt4MgqQ4VH5GfP5xK6yhfkYVphN13XOxb0GsYcZ8G?=
 =?us-ascii?Q?quKSpEs00qMMrvcumyshcD2R5/qq4IT1fpWwNRx/RBIgf26elj9p8frgkaqg?=
 =?us-ascii?Q?Z7oY0HmYOv2qgvXHiySk6dXnD1NAOME4KKSKYfEgtLItY+GVyF5/UXGo18Pw?=
 =?us-ascii?Q?n/3XO6Q4IN0vac3ohWp6KelWbTlaMPclb6D2fTHREH5tyK5xmZtWfLFXl7wI?=
 =?us-ascii?Q?VtNbt5c6sbOYVL54yr90P84588YbgBRa/yGyIIKtGWr2QQFbfY9apc1fiCg3?=
 =?us-ascii?Q?a4e4mYsXDH/bUF4kxrwBDZg+rXi4XehiHfFtvlc47u5iDiBiIQhkpW+ZnTzC?=
 =?us-ascii?Q?lmKyfUgZ4fPtRh0z3L3GoI9iAsvDtirKUDscp/Von8b4b80mIjVDjURzdJgl?=
 =?us-ascii?Q?3bKrIgIazRTxT+dpcPfgLaej8wrXrJob6SlCXlE83OehyHIfgBqIxRmOQZhR?=
 =?us-ascii?Q?ROj1Cn99fmiGHR3c1S8hQf9Wb82gpSqOCT56N86xrCRw6bBJGhEsVJqv7YSv?=
 =?us-ascii?Q?fMVvuUyx0QDT+922U7iTyjId5uti8Mka6N9jQ6g62M+NR25daEQhUJSzdnvY?=
 =?us-ascii?Q?ZqD+PYIPTkfoz62kJorIPQEmqU7rLB53XkCzQ9HKRO+M0cS9LkzB7CyaR7d/?=
 =?us-ascii?Q?9HRyFJJXGySEaZiaFaoT+u3l2O6vF8Zzz8odAzkJ8XoYxDzmlJPqIC/XLTpy?=
 =?us-ascii?Q?STC0DkqCKz8fZkUSJrOQpPA21E9UxV7mtubFE4DBzu9MAuMJ/w8aFVTHO/fk?=
 =?us-ascii?Q?ig+Z57J/Cy2GQL0SIvOwnAEsHLjtAnrIFq/Rct3xllhHc+VYtQK1S0Sd4cxk?=
 =?us-ascii?Q?V4LbiZna3XyNb8OqTf4E9wxGXpGNWWovM+BlxEmBOXY5zFTji/uvMWrgKLo7?=
 =?us-ascii?Q?uRAVxxyp0k4uIPhFrR2bYjrfLac+4kJKVWU/zWlirSBHwhjDeq708aXy6E81?=
 =?us-ascii?Q?yBEiBPwyz4r/DvTt7bxFjlf/lRFEUN0kh8DKZ6O+9YYjHAbHqtVDM5tzni0t?=
 =?us-ascii?Q?3LW76GovpjEueP0Ki8UpJYpXRXTXhj4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2c7b037b-1311-4137-7bc7-08da1364e92d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 22:22:15.7325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 R+ybTqAAxeKvdbnrt0IS44ih3E/EJcRmfz7oJhywSpPYyPBpuFFAIdrnjbWtQoCEhQGGrkNeru5Ie7vfzbVQUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5571
X-Proofpoint-ORIG-GUID: qgIMFHVOGGqh0CPRTNSdA7YnfIoUAqT9
X-Proofpoint-GUID: qgIMFHVOGGqh0CPRTNSdA7YnfIoUAqT9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-31_06,2022-03-31_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=679 mlxscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203310115
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 22:22:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163874

This ensure that when depmod-native runs we can find the correct
exclude.conf information, in this case adding .debug to ignore
the .debug kernell modules. The kmod utilities like depmod can use
either /etc/depmod.d or /lib/depmod.d. The kmod recipe is installing
the existing search.conf to /lib/depmod.d (nonarch_base_lib)

When the busybox modutils are used, /lib/depmod.d is not used, so
it's safe add the exclude.conf file to /lib/depmod.d.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
index 04fc14a6d21..65068f02df8 100644
--- a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
+++ b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
@@ -30,11 +30,16 @@ if [ -r "${PKGDATA_DIR}/kernel-depmod/kernel-abiversion" ]; then
     kernelabi=\$(cat "${PKGDATA_DIR}/kernel-depmod/kernel-abiversion")
 fi
 
+if [ ! -e "\3${nonarch_base_libdir}/depmod.d/exclude.conf" ]; then
+    mkdir -p "\$3${nonarch_base_libdir}/depmod.d"
+    echo "exclude .debug" > "\$3${nonarch_base_libdir}/depmod.d/exclude.conf"
+fi
+
 if [ ! -r ${PKGDATA_DIR}/kernel-depmod/System.map-\$4 ] || [ "\$kernelabi" != "\$4" ]; then
     echo "Unable to read: ${PKGDATA_DIR}/kernel-depmod/System.map-\$4" >&2
-    exec env depmod -C "\$3${sysconfdir}/depmod.d" "\$1" "\$2" "\$3" "\$4"
+    exec env depmod -C "\$3${nonarch_base_libdir}/depmod.d" "\$1" "\$2" "\$3" "\$4"
 else
-    exec env depmod -C "\$3${sysconfdir}/depmod.d" "\$1" "\$2" "\$3" -F "${PKGDATA_DIR}/kernel-depmod/System.map-\$4" "\$4"
+    exec env depmod -C "\$3${nonarch_base_libdir}/depmod.d" "\$1" "\$2" "\$3" -F "${PKGDATA_DIR}/kernel-depmod/System.map-\$4" "\$4"
 fi
 EOF
 	chmod +x ${D}${bindir_crossscripts}/depmodwrapper
-- 
2.31.1


