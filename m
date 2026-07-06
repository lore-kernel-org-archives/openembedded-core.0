Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 002A1C44500
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:00:01 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.83])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.154928.1783357198616161068
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 09:59:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=WjglB4dH;
 spf=pass (domain: navimatix.de, ip: 52.101.69.83, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YuCXwOcS7ZpBWMtkpCUQ4im2pupzxVu38h5jd2Xob5xnqGzfDuKcWCMNUdEDnqPRDfxK0pwUaHkIM2qVFpuCTZC4FINJ+C/gU+u/SaO8L0F9W7BvF2fNj3/BW7UJ8EHNF/GUdGRWbNOFRbV1XkooT1TCHwOtYoKn96P5J9Fkq1kdNss+vUqmBlST/t1RcmcrswYh/YTzxH9P+IjLcymZ4QIwxyjywvaJe1QPmeKrduGPXweNd1nxgpleoZLeh/HkeinFvpJy4o2gW/ffYQhm1K6kJhlh8cilnR/I+LU3UsNIl+O/sqepPlaP2JGvcykOCML/mbR0DParifZzj+K3JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WV8IX8FYlpqEebYymbmqaLdFhU1b9Qh7ZXWkJ3Ndg6I=;
 b=gRMzQE6jvAZVikws7FoFtkQoH6zI3BIRraZKgBxG6GHIYqbEKHNtiNPsHwxYin54jI8KH11M4a7U6gb8NYtz7vnf8xPNKm1DnkbHoQcmnWk1bJ2UA7w0svPasYgZ9SOQHpJ4Gh1eMh9DBk00uoR/q4CpINsq53aUTCeNPHxQtZG2KeVKS+kcig6bTsnduSf0wrZx1PHRzYR6JfQjP2axnjSM6S/eVe6lEVBhPxNwt4dxxOsZonIuBUtcKknvI77vMMBqUH5ikYmONnuT5TT2Zhtzjq7bGxYJ5EMZ+xb0sJKR8m36ilgoddOC9Cpbv0BXqehjVpoAPbXViR5IGwwyuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WV8IX8FYlpqEebYymbmqaLdFhU1b9Qh7ZXWkJ3Ndg6I=;
 b=WjglB4dHnaZTX/lt8JGnmdrxH4TMrgErWqUFbdJ9biaSSLbuw4KuKoeIT1ta41jaOfSV7+lFiMGY8PpBWopBX3ubNT+sGUAOEa7pZvtKiUL4IfQhpur8Vw/xDtA21c7ZPZ/i3bWgdJk46FLjIzihS3DdM0ptsJqFi5ZGCRTDwhQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by AMDPR01MB11651.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:719::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 6 Jul
 2026 16:59:55 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0181.008; Mon, 6 Jul 2026 16:59:55 +0000
Date: Mon, 6 Jul 2026 18:59:53 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH 4/4] systemd: Ship /srv with the package
Message-ID: <f5a84b83c1d675a4aae0b7b8c65209353820e887.1783357184.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
References: <5380f2caab9ad346667be7997955839e0825c8bc.1783357184.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5380f2caab9ad346667be7997955839e0825c8bc.1783357184.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE1P281CA0298.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8a::10) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|AMDPR01MB11651:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c7513ec-7336-4261-307a-08dedb80009c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	j5u0cQDYx50ZnyLNkZOCCel4OIZah+OUwr62+cd0kceiHukawZUZSI/VyoFIacCViT9Y12AGDPHykDa8MyC5BpETMLa0aepzss1W0pJ46S4wjez65KTj7sbxy401KJS2k3zasap+Ndsz1GutH0TwuXtcdv7pXtRVPh2uF1HE8QK8aF/rI+mzA1pgQTMUUuGYsfWqAD7uUjouobb7EJ3prjpsOeUDFViIB5p6vNYi8IRcCZ/KP2ZPouj2E0fNSeDw5571KoXFk5pOIrvpUCpUVP34HCHoY5OuKv6FO1tqDljV7KW52eNdJyatMrmhoz5+V3FhN4TWTl8FwCzVMdvgG6TjV5w5OVJuo+zgH0RlC8JTfXbJuSKhvn0EzIpSTwn+i0LOI5u83FFbh6W4yg0fgXJEnIVjg/ayiTNaV8BWsiXc8/BHaBRu/7MbWrhLxoskP7e6ilFacaV3LuzkIW6KQvfhj64lwMb3BslqfBXDYCTfaf87hakBG6zn6+l/iUB65BFt0qxGqeNzLqkarNt45EU4p2ReUYA3ShUJ/YZJQKkUaLG845Wt7SAnyxcdh2QL74o1fZcAs1jKqA3hpeX+36pjUCiG5XkNmnxG0mmzsSCLvCYUS/SeV20UuQsMipsqd5lLeErwI/spt+Y+iD6LA1KvBDR/q9ZPKPIvWn3ssik=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2EVbRTUznBo1wtt8xSWdaRrA+kywctuOarJnbiB/B1W6XUwq8e5bSO7kdDR6?=
 =?us-ascii?Q?V6Wnjro7jTHjkLMObPu3d+QpLAlhwiWLXEDD675qVzJlLdrExmiEp7EdOSHm?=
 =?us-ascii?Q?P4VzqCWARO/iwXDqs4hDqOH3iSsZyeKCqhCGWd0hbxg1TG5WrYJPF6L5wyPj?=
 =?us-ascii?Q?9Esf1x59DfJJ75L20wTtqLdDhnoFsde58np/FNMLNT9RSk5c8FDvRzFZh0sU?=
 =?us-ascii?Q?HoyMMSubX01iib1OJepzsS8kVG4lNapxejDx0DUHvwiEp3OkAQGlq1NLc7BQ?=
 =?us-ascii?Q?IiBx1MPWnWQGrdKZMeP5INswbxGL6sXX6i/xiqh5o/RtprbMRp2pTKT5Q3Zv?=
 =?us-ascii?Q?qSaqnuFZYbt8jSjeLyLZMzXWr/SNrxOUSppDhmXbZTEMh6qdHi5l078L6TSa?=
 =?us-ascii?Q?qhBm3wKGrX/hzYVctO10dBaxRVkUNVyBPsovrsPtFFZNuGrWYAoLplovINfr?=
 =?us-ascii?Q?EjwEyDxln75QeQw+3A3ByLXTacSnm8Dy0oZ2G4DmAg0Xz8JR8t0VU1xJorL4?=
 =?us-ascii?Q?E382MRxGKuojpGf7T/UrddmFBUC7oZw+zf+oIwUJed5kG8WJdPiA7rLBcdOt?=
 =?us-ascii?Q?LqytiY+fliuv51IP36YGk+zfex4vGyea0ZawFS/2/y5EGZh++0FvI7FKIVIH?=
 =?us-ascii?Q?Ol4NWAcFBOX8oNp/VLmkb+yurcH/Gzm0Ch/h13hrgi93X2e9lctoltKgY0L6?=
 =?us-ascii?Q?NecZZbkqpd13qTbUHetpW90TKVmPf9lWsiUOz7Y1DotztpypWEAt6CRqMsaP?=
 =?us-ascii?Q?X3HGdB1DCvA6Cx01AyxMkP8B6Bbuj3UcU5OH7ksqDBNrUc2DXs0rrhrnYj2K?=
 =?us-ascii?Q?pOv81gjQq8BRV5Zmk/ztqsNpbSu6bOqHd46XiU3Gio85WqxHGbh6svCB8KEE?=
 =?us-ascii?Q?HZGlcEqrS6YiowRIIqeZIR55z5j87V7YheMQaQKuwq2N/wwzvkDFqsJHnF33?=
 =?us-ascii?Q?OA/btn10F+HfvrwV+DPcvOtw/cCbqNQ4MII2d54bzpxM5QhonzAWcfIvtkJs?=
 =?us-ascii?Q?xYR7pkIKxyE4VC+yAyPNs9HqwDVkwE4AIgLZ0VsP7ovfvfpGnBLNHTEkhoIp?=
 =?us-ascii?Q?b43VeylsucbjrhmTqLWmhoPClxUfVcdDK21fZg2y6kJr4zwrojr3vEhPMbX+?=
 =?us-ascii?Q?gZ4hKkVOcjgzlfH8eMp4gxVbXJH3PMk4mgsiuDW9q/mNMFaCVTychnLTUxvp?=
 =?us-ascii?Q?JSq4z2O+NZtFTHyNM/jqdZCmGnB6yUCKMjOiWZndryFAKCbDNxZJOR2661uV?=
 =?us-ascii?Q?nf8Ngmy8xj6ZYfk3Smq4qQS0DtLF6nxOrcD4uRcxmju3xB0FiqmaZrv4tfuv?=
 =?us-ascii?Q?UoHPzfTSb3HGzTB2UM7ohj8R8zZi+4eKkHnRktyEOPI1lOr52PWEFzV1vtvy?=
 =?us-ascii?Q?giXOhIixptbZVaDOa/UuO8nAkZDGhynGRBORTUTkgriTRiH5FnfmmUq/lpQ7?=
 =?us-ascii?Q?fJ0NeD9ZWAj9vKKyfe6D40OUBr6akGeA6DkJyMMZUOfoG4KIvex1QIQBCSyJ?=
 =?us-ascii?Q?dlK+GNVby+91k4BN3qxZSE968vM0Evam3WdHaliPbZcL2k3R47AV1I/CmcY1?=
 =?us-ascii?Q?kC/JLD++e72XiZUrqT0lFhQC4Ux3whBBpVDfvjWawoSJn+HGLvRhGhHu/Wmk?=
 =?us-ascii?Q?N/CBTjr+Gu5oXF/MizmpqT4RmcubBIuuWttrW3jsAAByaaB3pu/lXLepM4rX?=
 =?us-ascii?Q?ivUFibfzWYyEPHYN4mXa409QGMbpGTq5/TchvkFpGwnz9GOBCN/OvTEDkbVS?=
 =?us-ascii?Q?9sZHFNPswzFt6sZoP4A8JxmPZ9u17oY=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c7513ec-7336-4261-307a-08dedb80009c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 16:59:54.9232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: As3vcGM0vkfy6wRk7METCxMP8NyPXsHrQYTGYBGIY6lO0+IdVRHvfHaxX+woPjtqKes912iuAbCi/AT/VRMirulLGLj6Wthw6AfeHlGiVew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR01MB11651
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:00:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240284

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

If *volatile-binds* gets removed from RDEPENDS, the /srv directory is not
part of the image, and tmpfiles tries to create it on boot, but fails on a
read-only rootfs:

systemd-tmpfiles: /srv does not exist and cannot be created as the file sys=
tem is read-only.

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-core/systemd/systemd_259.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_259.5.bb b/meta/recipes-core=
/systemd/systemd_259.5.bb
index 0fbfcaba42..447974373f 100644
--- a/meta/recipes-core/systemd/systemd_259.5.bb
+++ b/meta/recipes-core/systemd/systemd_259.5.bb
@@ -266,7 +266,7 @@ do_install() {
 			sed -i -e 's#/root#${ROOT_HOME}#g' ${D}${exec_prefix}/lib/sysusers.d/ba=
sic.conf
 		fi
 	fi
-	install -d ${D}/${base_sbindir}
+	install -d ${D}${base_sbindir} ${D}${servicedir}
=20
 	if ! ${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', 'tru=
e', 'false', d)}; then
 		# Remove the serial-getty generator and instead use explicit services
--=20
2.53.0


