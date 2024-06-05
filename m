Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB61C27C52
	for <webhook@archiver.kernel.org>; Wed,  5 Jun 2024 07:18:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9332.1717571908121354111
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jun 2024 00:18:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6886a41135=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4557E1Ph028534
	for <openembedded-core@lists.openembedded.org>; Wed, 5 Jun 2024 07:18:27 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2041.outbound.protection.outlook.com [104.47.74.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yfruxbth0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 05 Jun 2024 07:18:27 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bkrGX0UQf1szp4uQzBCy0uLP14mbK8fIqC7rWVj+tglm5FSA8gUPmscSA9gQ/RdgKpqf7I1WLm9JYlLug688rMGe85rIRM2XMrzQwc5iL1Vc09g1avwHNNYIN0rQqGsHVBZ+tfmKTZXz6G+LSA4HjYJVoGpP3kSXwbW5v/0huzMKOD20SlvutoJwmfzraOzm8xk1HDK0hFpKlo/j9EgOem56QNvDKm7/E6QuYHtSa6scIQVncUqaP6gyHVaYFwKpEtZeGAH6VEydsxU429VoccOe4M/87ELF2IRoLS0TsSRkf0bZV/7QQBmaMs2BaDzOvBjWBC1IkB67TSMCsdTyHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wbs9ZMIwoTjRIQMBDYVsJMCRRDN0gfZ6n1Pu6e5y3BI=;
 b=mjH6wrvU8YuWTAvwm1/VWuv/wOEkP6D5PUHtjBSrxNDZY2Q6a2E4ff9EFwfjoVl6d8SMrGIUxypkGFgmCTXFLfbHMYihPv+LUivhkbCImD+oLHHpVyBaqcWEzUMd/GcNSoTaFddxAf5mVqPD2buHGUWoQ68AtHl07rbm60s4yt5EKdSv+qzqIlt2r5THzgDbLW2KtMf98+0G6x1L3tEkpSI5dIw2zeWLxw/bNGahgOuEDy6W92K7YeYGldNr6H7L0qiIo9/LlVDxJDZN6OqBRVsZ6bTLOQPqq4CatOIudrAE+c8coilLVP7uss4nlnzBILpP7CezNe8F6EejZ1Znlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by BL1PR11MB5288.namprd11.prod.outlook.com (2603:10b6:208:316::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.31; Wed, 5 Jun
 2024 07:18:22 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%4]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 07:18:21 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH] run-postinsts.service: Removed --no-reload to fix reload warning when users execute systemctl in the first boot.
Date: Wed,  5 Jun 2024 15:18:11 +0800
Message-Id: <20240605071811.591881-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0103.jpnprd01.prod.outlook.com
 (2603:1096:405:4::19) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|BL1PR11MB5288:EE_
X-MS-Office365-Filtering-Correlation-Id: b51726ea-ef56-4061-54b9-08dc852fae78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|1800799015|366007|52116005|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CFjScU2PCp7A6Zes+6pMJ1WngYrHUpxHvipLM+omvNw10zK1pQlMZzUiPNyY?=
 =?us-ascii?Q?I5Oj0sFjTt+OlOZMNpXzWa2i01S8GmP0xbcwibYHAUL8P+TIGogg+kipFjOD?=
 =?us-ascii?Q?QlCGKN7zWbEHavzKqeRRC8MG063N14xMYBK+o892+vO3kN3Pu1VGw755LDqO?=
 =?us-ascii?Q?saRzyHr5nUPTm4h+rdpbF3xKhm4dKU9GrgpcXw41zJH7GEZw4xIGQOBbNUGF?=
 =?us-ascii?Q?NDrdruNDdpg6lK1hOlOURUgrsjGFOSxlDEeOKgVp1/ybNGuXOm5S9WSzOKB+?=
 =?us-ascii?Q?MTFlZcK2a1dL9Xl0tYm2SjhwsuJuSHF6msim0ScXVBYBoqegIl6cIcnaCsRD?=
 =?us-ascii?Q?ct2GrI4xJ4i0PLzgrtPJOC/+PrdmKuKiAFnW1HJ9UJDDUjblmN8hvIMgexTR?=
 =?us-ascii?Q?xIaCfVo+sYCnMKM70Wh9lED61zCFRgfZXQKBy29DEPRgviuo8RcxrnF2hFCj?=
 =?us-ascii?Q?lcacSStxt/vFDuyP0G0cPI2PGgnbDjDhFEQD7nvjluvaq05ktN9Y/0kXJ7dV?=
 =?us-ascii?Q?dKWOzZva3lRY7LSs+0KyZtSpU5KGLN+1odkITQNvFCxQjpLMiYAi9vPfGuD9?=
 =?us-ascii?Q?Ph+cdSaZ5AV9vlbz2dxPrqjkVLEFBueNKm6O8L4tswsDeOyfxYUDkniJtE92?=
 =?us-ascii?Q?WovfylOm4sF0nHhVs8Y5jXRsmWvPJpuqr1uB11/aZ65PytZEYD/zqchL+Gyg?=
 =?us-ascii?Q?LE2giMhgYnVjbsO+zUcTOK2DTGFzlfmRaSx83Yp3lZEb6E2vEwheu16r8Lmt?=
 =?us-ascii?Q?ITwMvKi9hRnYn9E7UrkmDiLwc1Y42o0Qk0MGeQ1B1XlS1vufLagXFFSofYxd?=
 =?us-ascii?Q?Jjt4ImzSmbcNC36Y5lHzZ/ExltFDc6qG+oYmru83tZ+d5ZtuS8exOnrSHhQ6?=
 =?us-ascii?Q?UWmVt8rKGjLt7KoXvjn+sKx6k5U+z3Be0OkdPcYU93aag4ZGIzRjGSjADslv?=
 =?us-ascii?Q?vqE6DPoZOZraOqSlmVazrnx03SQpY/ATl35vMtpb+Uz975rW3o+n20Arw5j7?=
 =?us-ascii?Q?+T9xcLhavXrr0bMVcY5lhhmpFnITuTiY32SWK5Lzwllp2JP2zZRS0hruaLXF?=
 =?us-ascii?Q?ITcYTlpPMU1b1BhQzlZSEB8S+faVE4Fv3DoQ6TOVzb5BYBEN/gPp3MJmTDaD?=
 =?us-ascii?Q?7OqtcaT4W3cmx/CqKAqI8On8adXnccgW8lZkcUI2bgR9VXfsI0D5cwRuoDol?=
 =?us-ascii?Q?BXQGNzPJJzwbkM0kp0y1Ifm3LBw44fq+awqJLq0Gjb6fH+GgkjB5bE3OvI3s?=
 =?us-ascii?Q?J/qDEZGze2qiUGzqPi3xMqaQ+nFnbW0JuUTxtNl2BcUjoeSzWIHtqE1sDFCb?=
 =?us-ascii?Q?3PKKgYxATSk0EVwOGj86Z8llVsBG8b3X/Lzhpy3y2RRXDQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(52116005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EaMiYrKweiAMZo2RA8O6Pygu4UYemmvfN5ZorVLuoqi5mWfCgZWrozhLiLX1?=
 =?us-ascii?Q?whXOVflUvAChoNOgRv1ZwVs8bitT31YQgG6FZbye47sL863/mu7Ia6BKrOCY?=
 =?us-ascii?Q?W4QR9g4knrgAtjYmqHxgoAMtgO/gKL5j2VMlFGtiHX/wic1IaOEJ3Umh4wvJ?=
 =?us-ascii?Q?NvVNlNZlvkmlr1AtmYInbhcY304OcPmMgQmHVg4b6li1nNpMH2Fu+cuYkq6Z?=
 =?us-ascii?Q?sMr4FLzsbjeCKb94hfQfYeeXLAJOdjwFC+peLzulz+rXhnBIahdZRI4nDrPp?=
 =?us-ascii?Q?JSXS0svdhkljQkflUdymFMhvnQhuEnfUmYWq/+7nHEQeprCegL/lILszVRQ6?=
 =?us-ascii?Q?ApV5vC5aRLjOr+mM3dzTxMBHHxdeM0Ft81GJOIG+qFVv9aWbzeoj9OyrmmT9?=
 =?us-ascii?Q?u4CqN31RSj58XENluzEjn/MbbUdQaL3ZnauEB4f8gQ5EvAXu2b8nxFmdeLem?=
 =?us-ascii?Q?d7LM3zLa+xJWGepHWETZkEu7rSqKdswdKaDGBlxLqOq3HNkXe1ugwl+MLVf3?=
 =?us-ascii?Q?FOp2ttQBZViaL9eFT63cON3y2SF1uiMAQv7p7JonARAlKBTQaOOTZIU/jHR4?=
 =?us-ascii?Q?kh3+Pkm5hTsI3X3BBvTbWbSBfqxccNEewha1xvTUKmnGdf72SqFRE2iznne1?=
 =?us-ascii?Q?6GNd7/92zMzWRCf7SBBEzn/eudPIWIxbq5MengsIp3/+3SBAzDkFMQRpCM7I?=
 =?us-ascii?Q?R0MMp3fOI9hxAptGfpXiEayMwlcMboiTDjjS0wFLCamuJlUBiJ1mHyJXaWW6?=
 =?us-ascii?Q?QU7Ol5gZ3nz5OInaR3iLCSwh6dt5Hb+JrLH8utU+NTzTEWCc3afk/9iHniGw?=
 =?us-ascii?Q?rkrt6I+twiUnyzyTclE3EgpurkwmxzogeL0E0RgC/BiE/no1XKZL6XUShe4/?=
 =?us-ascii?Q?0cIlpYh7k7Yf8OFitEV/Ea6Xx+tVNGb833Pb67KQgcunFHU6uNlUy+cdQ76f?=
 =?us-ascii?Q?MbdixYYmONC6HcaQFSJx6qSA0VOTVfXzmbrUOLShpdS208fjYGNq6Q+8yJre?=
 =?us-ascii?Q?KsJeWPDHdXPdukr4wAm6VewBSJSX0bHUgDZmoStXyl9+197N9+WSUleL/HTb?=
 =?us-ascii?Q?ogA+s2AAtS27b+7ZbrNtPwrlU3TgMwgmcaVHf/zOlt02yedyxM5gyyr2fCX3?=
 =?us-ascii?Q?fJQ1zULwWdRFxmmy2VX5c82VYSHIWLr55PW8R1cGuAr8sULJmH3jPCcHqKyb?=
 =?us-ascii?Q?N+pRn6PDkZdPUPZ0qyk4ZpXmbBfuYXuSK2yJ1z9ZbzKrw9BiclMeeAtuQtLq?=
 =?us-ascii?Q?8oy1om4l5Si1/2wIzuO7HzrxQ1UhCcLmp1qhiMs7VRPOQZ3qRYzt7riR8IHN?=
 =?us-ascii?Q?EljX27eNMGbMhtuZOqxvL2MohMEHxGdkX9SMGPxrS17BF41MbkK7Jx9YtamR?=
 =?us-ascii?Q?EQL8BhziUMK2xWK3dZ2p17ZIOVm0yw02YfOFm/Cl9JoQppzWEh41NYRC9fCi?=
 =?us-ascii?Q?jl533WwUpakjG36KWDiHMpJLcdGH8Mal6JW/Bt3tGXiXnNHI8iOTL4NuGzX4?=
 =?us-ascii?Q?xV2pQgl8jzbZOTQOjQoohGA4Q6cSOTjFB02qgErCSeg6f9Xh0wFulbF9jM4O?=
 =?us-ascii?Q?lYfZQ/SB5agG6CEWFgNpXnoX3MF4xWhbTTmNTtgIlv8mlV3PlDDv+zb8prDy?=
 =?us-ascii?Q?aw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b51726ea-ef56-4061-54b9-08dc852fae78
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 07:18:21.9592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eywDEXz0m1FWpUg4phkf+MNicgRXojBgyQK19ZAFDsK5AEyoBS7Qb4aqTChmhkwShLU8sJkJ0V4UL9THALQjXqmQAxljHoCSoNyZCeZgWzU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5288
X-Proofpoint-ORIG-GUID: Jsq-ka17Bhd-mxSsa7yMQhpjULRJcyPt
X-Proofpoint-GUID: Jsq-ka17Bhd-mxSsa7yMQhpjULRJcyPt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_11,2024-06-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=984 adultscore=0
 bulkscore=0 spamscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406050053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jun 2024 07:18:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200357

From: Lei Maohui <leimaohui@fujitsu.com>

This warning is because after systemd has been upgraded to 255, reloading units operation is needed even when "enable/disable" units by systemctl.

(From OE-Core rev: 28a7064403f2433ef3cb4d52b03dd73437f2d665)

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../run-postinsts/run-postinsts/run-postinsts.service           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service
index b6b81d5c1a..1ce19abcaf 100644
--- a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service
@@ -7,7 +7,7 @@ Before=sysinit.target
 [Service]
 Type=oneshot
 ExecStart=#SBINDIR#/run-postinsts
-ExecStartPost=#BASE_BINDIR#/systemctl --no-reload disable run-postinsts.service
+ExecStartPost=#BASE_BINDIR#/systemctl disable run-postinsts.service
 RemainAfterExit=yes
 TimeoutSec=0
 
-- 
2.34.1


