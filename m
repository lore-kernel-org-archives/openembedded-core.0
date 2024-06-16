Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D8F3C41513
	for <webhook@archiver.kernel.org>; Sun, 16 Jun 2024 11:33:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.32042.1718537630288250984
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jun 2024 04:33:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6897d61437=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45GBQXCV011302
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Jun 2024 04:33:50 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ysafg0nhc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Jun 2024 04:33:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EMJ3b9jbMivheIigTbTaGrsqqgvkUWe37LUa+/5PRrAx16AKmEbzZpphfBnFlibaxC9iZwQvP1S4dBx19a77mVC60vq27QQNW9p7T7/ZwMD6BVFgneziJ8D2pvsPO6LFEj/rd4UO3DQ2JbWtO5S8TzzIyp0rwZ3UhEeeIk+t1UOhWLpoyyY+oWpsVt5a+ibLinoH7pK6Pl4fwkFcEV/zeyrXETFDaiMV4ebrkm02aYTTiIdTAGbWJXqg8iOXf+ftWFtAx/rVW+3sYyxfpX7KlmLB4ZxlKzkzjrvRvBjE+FzkmPZP95WHEZfD48NdQTpI7n14bUnu71NmZX3KWX0c3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o1cnm5DYl7vAXq2YBtir6PdZtiRbIXHbHDPBLEL4EXM=;
 b=Mt2/6rpU+UUh+4rutABRfOuk/AUEtKh9kYc/qf5Iqz6B22W8SoEBgVtlwBTF572uD/UizMV/RB7I8b5Q+T6sq7p7bL4pNXrD6tWcA2A8Qc9kxVfOSTAVxj5wtb2CQ79zUGabhqVdHc11yFJ0o8+rfbpVpwaWckRPlRs/AdIK1kiRdS2w1aAHTlUnRc7h29gZMqA5+OJt3XOURwWzpPAxHr5wD8golk+BQISrHnmEAM/0Thqd3g23X327NWdnKJ1tgG4eOedMOb1F1tFGj+bjxvSO9tjK7WFbJA9blT+7dHS17374r0oJI9bSyfFd9cLHfWnLaLQPXpwe547qgshptA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH0PR11MB5127.namprd11.prod.outlook.com (2603:10b6:510:3c::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.29; Sun, 16 Jun 2024 11:33:47 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.7677.029; Sun, 16 Jun 2024
 11:33:47 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] logrotate: upgrade 3.21.0 -> 3.22.0
Date: Sun, 16 Jun 2024 19:33:36 +0800
Message-Id: <20240616113337.607564-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0199.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::17) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH0PR11MB5127:EE_
X-MS-Office365-Filtering-Correlation-Id: c3b5b31b-d453-4ea2-0155-08dc8df82f9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|52116011|376011|1800799021|366013|38350700011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?x3LTzP+zAr6HUFxKNEkrtDoF0rxhoTYhDDIFeRHJOXxi7anckFrw8rnMO9Fp?=
 =?us-ascii?Q?5Gz3xzq7thALRTEnoQH30NBXNqCqNnFM6TyFu4rP48QNxs8n+7jNVNX1clVP?=
 =?us-ascii?Q?qQod4jca9yBhDKxwu9mPUSGA8b+hLG4qUWjMxriz8s0WebeAobuhomMzoqBg?=
 =?us-ascii?Q?xIQ7ycYWbi5HAqUyWns8TGbe4dkMEbeyUKZO463jXVQp68K6lQvuELN6bfI8?=
 =?us-ascii?Q?rNBAmG5EDrupjq4ke9KCYqDKWKCKktBe2h1kTb0+GV/NZ0YsHOkDIYn+EdwQ?=
 =?us-ascii?Q?R5K8r9sGw9OA6z/PNcQMXr3/skaxzqM5ks5kRvAsUaXbqRw71uQ7nNiegK9y?=
 =?us-ascii?Q?M5svz+pXOulIr3AUkTq5DDoerZtzSCIy9RMVYvkSj6bKeC0ifylGEhZ9mwi3?=
 =?us-ascii?Q?THRumVt9AK8Cu/bj6kxl5SKlspqYbv2ap0/eOzMJ3dX/P/porLxclNegtKoU?=
 =?us-ascii?Q?s8R1E8xeOSnq3veYink264oKu6caNOHCQp4Pnk1CHVLgs4UNuCDAPTcUzLfx?=
 =?us-ascii?Q?rPK4TCPzjr6kPSrJKZxfPiqt6vCcgrwZdFaEo06pppDAWWrgHpdIzfVNXFXs?=
 =?us-ascii?Q?WUxmYdF+ad6nY4+s3Zetmwr9ZLiPATElkdwb6BnVo2ZZs+5OT+cMazvXXbtr?=
 =?us-ascii?Q?uigqchVEGm/TETGCqEuHbqj/5+K2ENaaW8R3trCpICwjHpM1VrOA2lBkZMWD?=
 =?us-ascii?Q?ZmEu1xL9MGzTGOG9utEu+rUTxehDO+qcVZRmKcsG3qlc/tu5ElNIz8TZA1eA?=
 =?us-ascii?Q?dGB/poFdgDTGBbDDuMPDGTku2Wm2ZGdyEyY9T1opUU2L08DKvhVCGRiGZjFY?=
 =?us-ascii?Q?ICf2UDc7bb9lGvXMjEW9Gc9nDkPeqU4qBr6D0macXLIx90Jpb1zJl7bR+bRJ?=
 =?us-ascii?Q?/yfONRIGiTfSyfSkN5kxBZ5aivOFYn3Jdre2VbqI5alswDU0p6r2uDD4G5DC?=
 =?us-ascii?Q?YRExlcc8jA1UAgEg0lNNMnoUuEh4OyGSzrej6rHt8Gimdhd1Dfp5Q1OImqRa?=
 =?us-ascii?Q?QRhPdmJgI540rdJOCV3ubaisq5jeT0kQolMt9wwVL/en6MUI61IDaN8TZ4DY?=
 =?us-ascii?Q?NJG/uBey9pr5tt2d/V9n/0NLmjzzffVPqcvl1C0nJruGrHWrdKx6Dr4YC4z1?=
 =?us-ascii?Q?z0Vo+9orYF1GEHITNoA3WMHjsl+ZHg3D1r97ZPKTjx3EKLVJrjHAbIlaKwhL?=
 =?us-ascii?Q?jiHJrZNzL7tgCFordA40SOBx+RkuU3PcHryXx7zOyEBMjS41DL9t3EhrCdNy?=
 =?us-ascii?Q?aofdcJsvA0o9JPJ/TLi8aY2bTIRuHg6TD3PcVaJ4HI4jWVjCJMnBlo13B2Ac?=
 =?us-ascii?Q?/vRYugJ6gTJjWOS2HInlsznD?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(52116011)(376011)(1800799021)(366013)(38350700011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9KZ6q2Js6ISuPBC4PGq7O/nZgp5+pHtWZxoKWaJJ6bM/eDUnmUdVVOIIV6wa?=
 =?us-ascii?Q?jd72imOnqf27+YS5qxhW1GLS0Quh81emV/1AJbiCU9hUddoxyUALAn+wl5/s?=
 =?us-ascii?Q?HrTVQVjqhDKrakYGBibvzOB1N30YphwTFl3Xxt+Pz03+UBp45Ro5t07nP9LI?=
 =?us-ascii?Q?m9pKddiKoAuMu8bc8JzNjCLgcHlj/86tzB9h8yxEmDYfZnQvq/32U6bKX9S9?=
 =?us-ascii?Q?syjzeV21g5AKFzlwYa1jg9aMjnehQiGRqzcXqZ/OHLlkwIwB4o2G1cVQvv7l?=
 =?us-ascii?Q?yF1you/qqCRGDEFbE6k7/Gm8Z+dyKw+afZ9+0Vd4nhcn2k4cdmLe5+49SF2m?=
 =?us-ascii?Q?F4pyNvj2dcD1Re8njBGieuCoh8sakuVK3DaGVkHYxOmSPhano17pwLfGcPhe?=
 =?us-ascii?Q?pzUZNNsyjwGJTO1QnpzEqGAehu3sf6WBAAaDMjN2R074eVTetSJ0qPAfWdeH?=
 =?us-ascii?Q?4GIMUIb5MCTPZmlV48U88+klmeQv3R8wS8KotrLG256Y5FMdXucN2P3E6RJN?=
 =?us-ascii?Q?47JlOUgQNSMXctyxyHyadnUUD/06W1iKcOoSnMEINttNILLUG5VQbax4bEnn?=
 =?us-ascii?Q?UWJO7PSzbWK7WBPTrF+EKSZa3spAhxeCtBTOoJ8uFqTXL3Dk7+DHsK36cq56?=
 =?us-ascii?Q?e6VzE93v8GLzNlkU9uMikNP9/gM8YTbA8UHH2O2Bb2T3UE0vUWSZG6pCT5SD?=
 =?us-ascii?Q?7y9qCzzzlxmz1tMvWlo8cVf8JTG7QFXF6qpU/W0JDsXHutqdZtIanqr2PTwY?=
 =?us-ascii?Q?xj6o1k9PBXGZYh/XMRp/n8++32oRuami1/oPxRFdgwX4CMUi8FjxbjXeu6Dd?=
 =?us-ascii?Q?CaTY/f0BqrRxG6pqudiwSjoTVHjT58VJhKz8R/qbFzpBZZDWGO9jf1peA2Sv?=
 =?us-ascii?Q?ugb8K/W8ZfXGmjWbOLUi8nxN7R54j547JvKQ63csVUs38yTgLSistcgYJVGx?=
 =?us-ascii?Q?GQAV1CGbqrhtIdDNnk74jClXfxuOcJ5rt3JfWvG/ncEshSbOMJdIZjogWn7S?=
 =?us-ascii?Q?K5NktHkNdvyDi+U0z7638Ge3Ohlb6sFh6e4cNDXo5btkiUKLAWGPVYf655cp?=
 =?us-ascii?Q?fcRcJpD3RQFWcIxdUf3tpFD5b7MwMyH/9a54o3f+09a8PHJfEzw4NY9P8a5m?=
 =?us-ascii?Q?WE4cOMDBVCSwYRV32VgWTFlVOE5+eP0TjfMdUitHlCkuK5YcefkcynIJ6Ny7?=
 =?us-ascii?Q?uSNvC7rS6Cs2U5vNwsL2glBrc6bUYdEuga7esc6A3rIl21EGa9ubUFqiBZY3?=
 =?us-ascii?Q?Lzs8QqBvk0Ku8hKJRiDh9XB7jFL+yNCmswqm3FZU3GVrMSxd1zMnzDuNn39z?=
 =?us-ascii?Q?hsnQZ24rd73cEvtOTbUdtBlEWXcTuDLB7oS0koPiQQpKnsZNZ2iaqi9DYgHW?=
 =?us-ascii?Q?GC0DEwEsBM0R3WgOOBVgUp2D8iMri9vxb08GZpfD3VMP+X2HtKymleGgdaRz?=
 =?us-ascii?Q?Kn4Aj+kfMmNJZYChURhDTmcFUBaC24IGJjvdiVTG9FaRQyfYAdO5Ob5k4Cy7?=
 =?us-ascii?Q?gT9JP4/i4t1zrN6is9vwWO7KrpQdIZHPgdUv2FzzomVDaLyBCL+B5luxcH+g?=
 =?us-ascii?Q?zTtQ/GRYcEQo6bAZgE2SlWXKP5/NczpkxrGJgdn+?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3b5b31b-d453-4ea2-0155-08dc8df82f9f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2024 11:33:47.1653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 72vNGVbKecXYMD0GhZzm86T1OZyW+4MH8xc/ySxbpSIuiLchUakZ1lH0AXnNaOWeYzAIpBI/Rxm7TcsvfMOZ6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5127
X-Proofpoint-GUID: -Lp32hbkBpSchxQCc6sxX7qQDDvULgtx
X-Proofpoint-ORIG-GUID: -Lp32hbkBpSchxQCc6sxX7qQDDvULgtx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-16_10,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 suspectscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.21.0-2405170001
 definitions=main-2406160091
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Jun 2024 11:33:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200774

ChangeLog:
https://github.com/logrotate/logrotate/releases/tag/3.22.0

 * fix calculations for time differences
 * fix extension for zip compression
 * fix omitted copy for logs with mail and rotate 0
 * fix wrongly skipping copy with copytruncate and compress
 * fix ambiguities between mode, UID and GID parsing when not specifying
   all options
 * fix hang when encountering a named pipe
 * on prerotate failure logs are preserved instead of rotated
 * in case a configuration file was skipped due to unsafe permissions
   the exit status after rotattion will be 1
 * the state is no longer written to non-regular files
 * the systemd timer now correctly utilizes load distribution
 * add dateformat specifier %z for timezone offsets
 * change default mode for created olddir directories to 0755
 * support quoted user and group names in su, create, and createolddir

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../logrotate/{logrotate_3.21.0.bb => logrotate_3.22.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/logrotate/{logrotate_3.21.0.bb => logrotate_3.22.0.bb} (98%)

diff --git a/meta/recipes-extended/logrotate/logrotate_3.21.0.bb b/meta/recipes-extended/logrotate/logrotate_3.22.0.bb
similarity index 98%
rename from meta/recipes-extended/logrotate/logrotate_3.21.0.bb
rename to meta/recipes-extended/logrotate/logrotate_3.22.0.bb
index 10a6149abc..ac14f30051 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.21.0.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.22.0.bb
@@ -14,7 +14,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.xz \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "8fa12015e3b8415c121fc9c0ca53aa872f7b0702f543afda7e32b6c4900f6516"
+SRC_URI[sha256sum] = "42b4080ee99c9fb6a7d12d8e787637d057a635194e25971997eebbe8d5e57618"
 
 CVE_STATUS_GROUPS = "CVE_STATUS_RECIPE"
 CVE_STATUS_RECIPE = "CVE-2011-1548 CVE-2011-1549 CVE-2011-1550"
-- 
2.25.1


