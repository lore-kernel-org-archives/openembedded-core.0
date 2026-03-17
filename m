Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7D76FB5EBD
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 05:17:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.69444.1773724654469932779
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 22:17:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=EegWnFLU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7536126150=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H4jQNg488802
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 05:17:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=vYnmClaXEtJ2OhStykAM
	JpCERuM2Gahr+vC+s/UmUng=; b=EegWnFLUSFmTgn9y10sVCHgmGnmeoIWqtabX
	++sPlGrQ8bJPvVQ1AdeM+SlyM3qWy9SAJGye5gAOWfuMmLlNItUD9LbKQYwzgSYI
	F1iGYL/pHnaXniMaSaQDouV5Gra9T5HywuwsRM6qnnFTiEa7czuZolQNCD1k6nZT
	IxkmJyv26TEUDkGT+qdAtrW7KGQaGlvdB8PCglixPR0UY5l0AVHxTXhpiPvBcvEW
	mypmMhy+5kEv+x03aToSVjmhSJaDy074NzWW/G2AJkOeNkiPt+sbT46KLfE5vhMl
	RhcuLI1Bueouc1eF1Qk0J06QT9QcyZdf9D3FIdOeWvmVlErxnQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010009.outbound.protection.outlook.com [52.101.61.9])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cvvvyk085-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 05:17:33 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i70r88ei17zGGc09fexH53SLihIDNXIXkSbv56y1r7G8Lw4iW0zp9fednGsWAv5QoofNIJzPP6Mj2S4tfOk5imlxULzQNwqK/KAWCYG6B6Aky4DcXHQDLHF40822+Cuah86tCFEn2cotS8cC2QeCjKj0o4a9EV33J7vCANUQ4sZ3JIgbEKhU145yqyCBzXFfRALCGTUoUbN4PXcOU2Cf/SL0clpa/ny83ZIlMRl7jxeXzoNiw5ilRNfcKPNba245s/MPOowmOmyS6vCbbZARe2g2rcXvxLoWx/HTapHiifXYCJj7QzBUfWOCZMV0O2COH3k5EsgNZpA/Gi+cGvUgSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vYnmClaXEtJ2OhStykAMJpCERuM2Gahr+vC+s/UmUng=;
 b=I3FPzx9uXdCQTedCLu1zK40kKu9NephnTMzuiZNTNxyHmGL8r35jcVylrYOK4VaBU65VF2FcC1sY8yMuktfgOUpmvOSXI7Qc+ntPZXPiZ4mVr7IMAa8Kv5WXrV2QvI1cMMYV/JFPYkCbPDu3cm6loy9tD/Chzi9BjYPrwuDmnc6xti+an12mflnecPFoo97TlOO4fEvT03RtCuarsXGchYsgEXCD0QcLQ/cKU6/gmDnE0VURKEDEJtzhppFx/2dKYy56oPax7xiM9EuHPqWaT/WwPJCOxjNGYWt74ryUPKz9oHg2BPtFzdOKe++kbVeRQNuZE5n9rDaghhxOh2yqxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CY8PR11MB7291.namprd11.prod.outlook.com (2603:10b6:930:9b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.17; Tue, 17 Mar
 2026 05:17:27 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9723.013; Tue, 17 Mar 2026
 05:17:27 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] systemd: fix configure option for dropping sysv support
Date: Mon, 16 Mar 2026 22:17:16 -0700
Message-ID: <20260317051716.712441-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM6PR07CA0078.namprd07.prod.outlook.com
 (2603:10b6:5:337::11) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CY8PR11MB7291:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d4791e9-efce-4d2a-f1d4-08de83e47ab3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	xN92N+nKRmErKtBvrPgLSS9z9fAGrP0goec1SxdzYIT9EmeMoE1omMhtXmjXXdfCmoald0R0dO/H+Sxiuc0TUj2EQP1HIW56ckrgbvVOWmpRj06fTAktSqWzHoliCEh37WA77dOphazilTqweXpr2Si2ISYdhSscOEvSZf81Y8aPEZK6TMlMuGXiWF9HnJmEiUxwfZQYuf8cw/IuPIcNvwlJfGlBcAo9gUSR51AVAAb/Na8QmXHGeUKO4RYrBZqpF01SJzWlNOjPJlM8Z64iOzhGGmV9xNmaOvXC9cQonDd09GNmsSZjlTp/9gfnKgjC5B9AT570jmpaM0tYSkx/e31SXMMpNQt3jT/KR/syGsJVZCKv2+2+d3lYUUQltDJsFy2rYzSL2i/dp37sRbgsPQ2U1xj7pl1wamdJnW/sBGAy0zHr4JPNFo0b13rxugFdMzhCcdqQnEuPtaZ6SduKFLkCcC8QaTAVWP60DkkT/6eaTUdOhAyOb55TEqqjgGIQ4KiR0lZ7Xf45/hrgjdZpsljOYisLWrvPR7IPGIK9mNIbyrS3drKZnDu7QHbg6y7r/yVkebGdTFj9ogtZDu6tqbaptEGLtVW1eIsdhKYUGLRDR0/C6W2F1gMKh7Md2Dal0IBIxZMVl78dfzTlEEob/vEqw9jAhcoyJMtE2oqUo4YkHsUqp05IgXSACZt98zNVfm8s1CShu4yyZaEoGcTZ8EoGoMwOkDHYlI5fYDiUkXVXVUx4LT9xWa7/GvCs/cRf996FzUHh5gbzd8I4w8pp1cx1+XQeA1f6aFOJXsYOpDg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7EI3zXcfkxo91pe3cGJQD9cZEuB/cb5kVhPzuyzcp/0lrUG2PpGVfA6WDosE?=
 =?us-ascii?Q?pbKmEH/SN6G5m3iq9XbeWKz0jXUE4yNYV1lA1SKCsPxyNRkht6zMCtO/cbkl?=
 =?us-ascii?Q?Pz8whtdNEGwoLUmf3B2rXLJ9ZRINKjpXs1pWhv9mn8MUUUeHbtwDC/wUglNe?=
 =?us-ascii?Q?JQ2PWubwnKeF7LcT/01UaDC1LC/OdvEg0MpbEPWldR4sr2jypul8IhKieuV3?=
 =?us-ascii?Q?M+yKjiBtN/Gdr/joLfAl0x+RdUGSBzTT5L02AF5hIpLmG4eiDf2lPQ1PKFl0?=
 =?us-ascii?Q?qQYgCDw/PHFmlTLI5i9xxv8gIK14Lp+tytfkwbMQh0Y2MqsCtn2Ies1Xd+MK?=
 =?us-ascii?Q?fyAA28Oyz/vHEniol5D2UMaQpsls+muUg+Lkte3SyX/r0o2s5LuJKe3KBRaE?=
 =?us-ascii?Q?B+yF+T0T3/aIoMqw/kNbcpl0kw3mdt/2NPVz9+KlZlm2uzs0A4K44co8zPkC?=
 =?us-ascii?Q?MsqYMqjYBEjXIfoAVl1cqzm/N1Rnsy1HDXXOp30Rv2Z/ETcCj8Dcp6IbiGt7?=
 =?us-ascii?Q?BrnDkvgnhkoKRxa+lTFaQXN05gfItj4CCxnQYiYqU60qtnNdsmd5nsDEsquc?=
 =?us-ascii?Q?6avAEJlGknJKJR0sNP8sKz+UmhQLMGPcwkfbJ0hPnuy+QfzT4LPfBHgthJbe?=
 =?us-ascii?Q?UJOXd7sLYOia4epz1JrgVc6j32Kmmc8zFKOxgpGvJx9xJPSjKIXt4qsNdJYp?=
 =?us-ascii?Q?e50yWXe5Uwlwtd57ceoWebdPwhGyKvvnoCdRU1Srn0VCKZ9C4UmKVuZalCGH?=
 =?us-ascii?Q?zYSdKMdv8lcyTBb0I2LCSGxaYg+SEr9GRInAlTIbDt2qAxZJA7nHBJvP5LD2?=
 =?us-ascii?Q?l7uJ0HUeof9M/7HWaeABZxjpkCDMSqQABGP99OEWu7Pb5SrcTjm2olJt7k5j?=
 =?us-ascii?Q?7Nf4rI3z7SOocldygXUPom5HaEIpIbmgLmkuAi32OxuHYsY47fRB14T+0FX9?=
 =?us-ascii?Q?3LYILZOATV18TLTmKZjENYLBNfy1CVR/D1Jh18NRdHp3NaFHEzfeSzolAi98?=
 =?us-ascii?Q?RuVZvYQKH407/Ms4zO1R2pzr/3pSeT3rsSOepyKcMEFIw9cEfYmuhwheHjId?=
 =?us-ascii?Q?tywguOkBSiI11YF4mpXA6BX5S4/d8yP60a2opzIGqcJ+UZGOgAigQdoL0Z6J?=
 =?us-ascii?Q?gXnZY+yNuwSz9gUUi1xR0AEykWTrKJXD4TBQLrPYTORYWAHhDaQYS2SR9dTM?=
 =?us-ascii?Q?SmJPFVN9TFLAVB38f2VCNLdu1oJrjHVwLWYzYfYP9POsUXe+CU4G0mADF+ll?=
 =?us-ascii?Q?olAXyTAqF2zvtcR9b0VdjLuxydLnwjDK3lZ0ydA0oa5yT0UaKYhfIERZDKti?=
 =?us-ascii?Q?gDMfEMDOv6JyCoixhZZSYWWyyXLH6ylqc7dygDP/AHoL4HBnk5bABl701anQ?=
 =?us-ascii?Q?1IIe4Wu4HsyDPs1RU7ASeqKPxMQWFun/yjFZqL80+aXIel6Mt7aATAEPxRgE?=
 =?us-ascii?Q?XNp/aCVTjLZLUDaQFN6ZTz8Dft9h7Pc3n2tgW6ogtAMAIZtmjOBr70gg73iI?=
 =?us-ascii?Q?yp66VtJpHneCKYuGjUKlj2qZ+QpUouwa1aqrX05hQo+STMu8LO9a+Q2UV9Dg?=
 =?us-ascii?Q?aSqqnVlca+eScMXzcNIVDsbK4E0iOaLLf/s0oUqc8y3Fjh+WhKYWcrA8zauY?=
 =?us-ascii?Q?dwOcyqr5v80HjUP9+/G5rcjKxREZTImKR4RP5kf5G+AyjSdMkLVCAK5Y51xp?=
 =?us-ascii?Q?kOYyKGTGWe+vXrB7ODqoV4mfNqPQvX1hUCDojzRflngMovt2UowQFFQedzpz?=
 =?us-ascii?Q?67nekyA8Bg=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	Vkcde56gWw4ePog+rWibtMaVE9X9Bw3ttL9pxXE5Xxv5GV7wEgo6UPJuLmT935WffbiAVz0g5eVHcvKQas9ckWD8vePebU/gcFb/dRmOinmPMDB21lGTlz2UjxGFxQLZGluK476srgsgiYJiYB6pGis6G351UZYqP38XEHNFPLNj7bKHmzeZvOLN0R+L0jjK3gxQ0WGW5AcfGal2XuHJgk9JwQa0TSjMPjWZhvv0aaW5yLMfZfcuLXwTazLaIDnfGaPUALbcSJZsYX4DGNo7AYY+LwNA9sgxZe3NIAYEE20hBr99vIFfsiyIVx+3ZOlM6aLjuRwLUTpdWiCd4EZKCA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d4791e9-efce-4d2a-f1d4-08de83e47ab3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 05:17:26.9334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0GJowEsF3KLCyz3KQAdBO1Jft+qH6ln84eYtRUG3QR88TMyvNgF0fVo4lsWbYaJ266N4nU/SlaPaopaghrU62Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7291
X-Authority-Analysis: v=2.4 cv=E4XAZKdl c=1 sm=1 tr=0 ts=69b8e3ed cx=c_pps
 a=28cfJ68vbCdGklxr1LbY0A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=onKhm8YT7e4VJaemFlIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA0MyBTYWx0ZWRfX1aGOcaJ4jTvO
 DHx3MPWrDt9evmW9ojcPIo67Ntr3Cz30o1Ed6UXKRu0NoC6ppSPc5f3WpIyj5JjeBIsbMYjrRRK
 RomuiAkAK0qvJDMny5XVrxajMJPT+TBLtRQ9d5R2q4j1xyPaMCYI9D7yRNuCtiPAlUgIp8KTO50
 ITeSkhd/94xLRWNZCzggPeHL+zNH1alJ6677GRJV2U0YYQwdPeqrfzVspvFwG2DzVjDiZZk4fCc
 Oex0m9+eDpXuED6ZaOHBpa3xN4qsBfy/z93wzucclh/y8ayoDIJ0D8GjNPtPQekAuQousph/sZo
 VlQcSo9gJy3YWkj+fXM+Xoyws5JbzrraB8HmwHhti7XFD14Hqi70gwAUn7JOygiQc/opi2OXbwN
 YZqpJWvmTwD474tk/BtqWgnTMT7S25OQRiFeg/gVtzU5hNDlxQoZDT+WcNXVZn/vUH+C/vQ0F/s
 eRP3bLS+2+gLiOIMOJg==
X-Proofpoint-GUID: gZwDaPW-F-P-zWxkqmuIWMCaYbgqnf-y
X-Proofpoint-ORIG-GUID: gZwDaPW-F-P-zWxkqmuIWMCaYbgqnf-y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170043
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 05:17:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233296

From: Chen Qi <Qi.Chen@windriver.com>

Add three extra configuration options to make our systemd stop
supporting sysvinit. Without these three options, we'll have in
config.h:

  build/config.h:#define HAVE_SYSV_RC_LOCAL 1
  build/config.h:#define HAVE_SYSV_COMPAT 1

The HAVE_SYSV_RC_LOCAL makes /etc/rc.local work as the rc-local.service
is still installed. And the HAVE_SYSV_COMPAT means /etc/rcX.d is still
supported.

With this fix, we have:

  build/config.h:#define HAVE_SYSV_RC_LOCAL 0
  build/config.h:#define HAVE_SYSV_COMPAT 0

Note that these three options need to be dropped when systemd is
upgraded to v260.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd_259.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_259.3.bb b/meta/recipes-core/systemd/systemd_259.3.bb
index bcb8fe3d9c..6bc71c923f 100644
--- a/meta/recipes-core/systemd/systemd_259.3.bb
+++ b/meta/recipes-core/systemd/systemd_259.3.bb
@@ -222,6 +222,9 @@ EXTRA_OEMESON += "-Dnobody-user=nobody \
                   -Ddbus=disabled \
                   -Dtests=false \
                   -Dlibc=${TCLIBC} \
+                  -Drc-local='' \
+                  -Dsysvinit-path='' \
+                  -Dsysvrcnd-path='' \
                   "
 
 # Hardcode target binary paths to avoid using paths from sysroot or worse
-- 
2.49.0


