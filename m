Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F672C43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 13:21:57 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.136])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.174262.1783430514843032207
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 06:21:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=kNjwYsJL;
 spf=pass (domain: navimatix.de, ip: 40.107.162.136, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=veX7fIVGeH232DjhUeZ9e9GMTY3czUP2jRplXBL+g2qOYIMqSC+uEF38srFka8vrbgRl7s9+2frQSMknVzhFu3zivhW/ZxEX9wjXsyzOIjySvIvQhfI0eiB2coCNroDkGAWo46k3RsPf++d//DNrLNmzX+ms6CmN5fAa/7R6yGu6/QwbFGTiHh7tISwgrzMqr+sUr90xFB1KU9iZu5I0aiMkvJ51f1f+YFRaSu/q1tlXYsqh7PbNoUblt8VtP6ti6D1HGmhgC5D0/FU/34iNuwKZ9aGxWJKHb60QfGLdWXPmwjLBRxv+50+mfhMTkrueYJt8TvvRKnzzJt+nxYe9RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X/AwnFLdCjODik6hZ3JvGDsW0n6Cz5+YsFvdZi58epg=;
 b=pqMU7BeTInBoZVumcXc5BaJMgNBtpK+FIML46HSZuBCwbBX2HVxMEeWEiLhVrz7knT74/vJGo9FgHF1gaTKMMi2JBjQ5pgoZHQnpqzXPHhBFNj+kBE8+bv/1gptCR3YFpGbm/S7bPFekwJYb+NAELcC1tC+pFHFdgn7w633HgXqF422EbrFK+48lnJGgCKxinishZ7SF0evn3AasOtt2FkrfgKHOPLsNN22TdMLAoM3XuTnYNzzn2WgWYd/UGmhuO3Yqc+5kTfZes8aLRv0l1b60qoT1NgCmOMvMS3GdzWMx9+q0clb7PBSdAVd7S4tyFlWrSoF5PCUiNB6CBSfRMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X/AwnFLdCjODik6hZ3JvGDsW0n6Cz5+YsFvdZi58epg=;
 b=kNjwYsJL0w2LB+GiU0cESgUcIMUgnrliMkTDtQ/Gz7rHEGe8M3xfiI/E2LqtVkgp/Wl5LdRqyl2FQH3OQLMqMlBMuOQ6UFhheV1nY1RK/LFDZWd/MDRxuj6k7T2yY5GpORn3ShnvQhbWHP1JjNU/VhrMEoSTutq31vsPw30D3ng=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by PAXPR01MB9002.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:2b7::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Tue, 7 Jul
 2026 13:21:45 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0181.008; Tue, 7 Jul 2026 13:21:44 +0000
Date: Tue, 7 Jul 2026 15:21:42 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
CC: openembedded-core@lists.openembedded.org, 
	=?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH v2] systemd: Ship /srv with the package
Message-ID: <76dba8591b62c041134533386e80d1ed8c04a9fe.1783430496.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
References: <DJS5E22GVH5B.13AM4AQJRI639@bootlin.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <DJS5E22GVH5B.13AM4AQJRI639@bootlin.com>
X-ClientProxiedBy: BE1P281CA0128.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7a::18) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|PAXPR01MB9002:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c558e27-bc71-4b9e-fd84-08dedc2ab00d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	j6oWiMNjMG9+jSFtm/BlQnLhhDeprMIierp0ryleOcxXimhD/wqmUviGe4n67ejOOU37Vb525+OsCvbSyacd9se03Ps+3e810RHlxa1jLzJ0j24sld4QGuo0VlizozM58923WRqDL1jq+oxrNNmB4qOlEBhCtzDE/5zSxI5W30KbMsLgHXnqP5Wn4nWGUsdjpx8xcIZdTSAaIuUqWnKOcIO61sYIm17kLjm7X3y8O/fyUuW0xu1hTbfAwviV71SPjBOUd4sxSBYQsYXQIzzO8/VnW/DB3yUaBsYb/t6AlK67PSuuAeLz/pOJARyM/v82AfReXVVHxP4ytdTbmFdlukieEJufxCPsziafM4a3Z4dRwXrgiH1Um2WGnp2IkbSCWs+i3D6Hqo4OvGe0/UatCQrhDfZeIZTr50UiMtfTIb0d8sceaTbepb4oXjUiVeMXuJ+Qs3klLAx30ttZ1qPN9M3XIyrRwf5Zw7mjMoWBYyLREO6KFspUVrs17wSD8R3LjWzVOQOQbUEJAA0BCJBjFy+Tyoh/L9HxQ+hkRYKJjlD2m+WcQeT63yJhHXo2CvAFl/UJYzAPT9/HUwunDL4hZgwNLxvcgJzfAZrwG79xqiSw5uSS6GVBj9lD8o03SrTad/bl56sXZezf7pWOwYNq5zed9qiYq72uE8SQe2Hl4oM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WKz8CUTolDLpng7Tl85FPxl+dGmzTjvUFshq0iRPCvrZbDq5JiMi6x3i3tyI?=
 =?us-ascii?Q?nmdpiUT0Zb8UHuQZPYjulGOuHPepgZjqle8UZLhRw3gQe6trhDHgcP/NqfhM?=
 =?us-ascii?Q?wW/MIv3sJzIF2R4LlAQrcZcOViUGe2OSAgxD3HYevQSAPNshnr5YTIQXy972?=
 =?us-ascii?Q?pPSmqMI+RdPPAz0LT8VpFjOtyrk86SCXfgLpLvCebaNkE+pe7aZnLTUHdM5O?=
 =?us-ascii?Q?yMzgzXqyXjE4QBXDMekJpWce+zckybGvpqRURYWMiorupuTlsh68P/MzF1kM?=
 =?us-ascii?Q?FrpxmyQBLdx0Ca0lKg30JpdPJJ/vCGIQpX4FX24zlAVWdK2hwoNgktduWcTs?=
 =?us-ascii?Q?wW7CvZTJkBrbpvmzc8sD6tcfpUlR9MkBq+qGycONjDsv0mssNLYeOprwYi7l?=
 =?us-ascii?Q?e3qdWRKb+0jLA+ibB0WDX2pMltMQ4cMR+JWBAzGbq1r+ewfM7cotJfys7Z4c?=
 =?us-ascii?Q?lZbuS+uTBRQ8cx+c35Cto7lzLjvjikOsI7sPdezS0LBNnKZXr2VRgAeAGxw/?=
 =?us-ascii?Q?eo58cXAsmor7byd1iiUunySFzTrpImQfJp5FgGR6E6CsSG/qWcwLZF2oWpvW?=
 =?us-ascii?Q?bFaLjumxtOQbu0n1U+kscQGqjJeNH9Xr7mCMTHKJkT3rZxnf60DodvHJE3jE?=
 =?us-ascii?Q?0dN5+pQ1gcKpcdqQi2xqUtThOKVO9In6g98EOwW232Z4KRPrjmNGDa9fYTMW?=
 =?us-ascii?Q?qvO7ae2jm1q/SxVqv5l1vcKMDS4LMk4R5Ts+UC6ayXWRaOYzYQSecjV+e3a6?=
 =?us-ascii?Q?6bg7UNpmv99f6Csu1+OVPFfKVNcf1gCstAZG9ysv6LWCbXe1hXzESOnffyQg?=
 =?us-ascii?Q?ziTB/NJliIUs3Bv/lrBtzZQcul1VtEQTqzPSvchQcXQOKmL9trpcoMEnf/Ka?=
 =?us-ascii?Q?SFb1Jn5Y+MYoCX1FVhpWsLigfzIKkETDI11WJv0VArZ0zL0XMB1BvEuqOly+?=
 =?us-ascii?Q?rGRsGB6oRSSQ+RdXWV1jQcNjzO2HT7DbsR4ZCcRIUR2aKf60Te0LZnDP22xk?=
 =?us-ascii?Q?oQIlxXxfYxjIoT/l7Trh6IPuk8q+QOKlrIP9D646TrGjhYWcGMlur1QkpETb?=
 =?us-ascii?Q?tbbirnndCqCKbTcs+WW13Ygb5w+2RhhXhei3YIN/AD5Rniu1UN2ku/anl5lj?=
 =?us-ascii?Q?EzPxEczdGbo6GvGJo0y3Uki/KMEiS6uddQMEMMyWwDUkzwGeAFflXLrgh8c6?=
 =?us-ascii?Q?sLk6wDul2Mx8VscUY+MJ/kU3ZbkqLxgG99EXEDV3/e4JA3igO/RFT0zMlSwN?=
 =?us-ascii?Q?ilYkHV0pwgdC9bj/zMpbNAK02OTOJs6q3AKg4KyS5r4ph4XAehcPebcgP592?=
 =?us-ascii?Q?EgnuW6J1L92MKJ5SqTydtXIWsxXDsYAzn00yqPUjjJSucKZRd3qNkZIOR+nV?=
 =?us-ascii?Q?uDFRRCLWHdEs5d/CR8HlVPRDS7v1NrIcEPhGfwGr/Jmsd9D75JFI2sA3r8Wr?=
 =?us-ascii?Q?QGnl4z4pYcY/7opQia8+NRC0/Tk5g8XdQVPAcK0UVu5Xz8pDFCAj/akUs6TR?=
 =?us-ascii?Q?WJ0mMR4zSfjlZunk65+/hULoe2mBQNAZPE43cJS4UAtE26vIVYlV0bQGwr5k?=
 =?us-ascii?Q?MsMLIa65eYTqwDIpofQu5wWMDLpce+So/6Fp95QDFVP7W5oseCsSPz9u5KdB?=
 =?us-ascii?Q?A8Kyf3dyzMRmf9VW5swTifiAm8S/aoxsMwT0fIHyKgLRNYalMrltY3DupH8R?=
 =?us-ascii?Q?YLse9kWFXeNlrosfZVImegmbqJVzF1hG+yBV5dsT6AHwSEAsI6Y+j00R8F30?=
 =?us-ascii?Q?ZHXXcMYkcwB83653l6nUjwcbm6e0zpE=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c558e27-bc71-4b9e-fd84-08dedc2ab00d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 13:21:44.1018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jg/+Y3PiNHeSYDl0d9Wjmwz6mZWiOLznQz3mXGsqBsL3dofLen35kx8KYszPrzpvHrb8mYPAq0p6qQqufaqRDeOoIQLx450TVWj/z0AA13c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR01MB9002
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 13:21:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240385

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

If *volatile-binds* gets removed from RDEPENDS, the /srv directory is not
part of the image, and tmpfiles tries to create it on boot, but fails on a
read-only rootfs:

systemd-tmpfiles: /srv does not exist and cannot be created as the file sys=
tem is read-only.

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-core/systemd/systemd_259.5.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_259.5.bb b/meta/recipes-core=
/systemd/systemd_259.5.bb
index 0fbfcaba42..27722f97bb 100644
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
@@ -719,6 +719,7 @@ FILES:${PN} =3D " ${base_bindir}/* \
                 ${exec_prefix}/lib/environment.d \
                 ${exec_prefix}/lib/nvpcr \
                 ${exec_prefix}/lib/pcrlock.d \
+                ${servicedir} \
                 ${localstatedir} \
                 ${nonarch_libdir}/modprobe.d/systemd.conf \
                 ${nonarch_libdir}/modprobe.d/README \
--=20
2.53.0


