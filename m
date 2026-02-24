Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B84F9EA4FC7
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 01:47:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11062.1771897638549590171
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 17:47:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lgeTyV6h;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6515bcc28d=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O0kudF2844900
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 17:47:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=EpvzoNRXoPotHTN4VB19
	Tl5hIQCq/r7g5vCx8I1KnTo=; b=lgeTyV6hTiy4B8oWeCsoP3RzkatLF1+12Wxe
	baFbZp0pW1+lRvQeopHGZSIlzcsDbkyfsr+LBJQ7+nSwzn3hmUPla8Wa/lj0RCuL
	2LVVuyk3MS7gUETqCK+w+ERzDdc9uzHUxo65QdgIW+q973B77WxqA+EhHnB+vLDY
	voFyI56n9i6gFUpvX/+eb+AfFtymhWL483Hk7Pg5uhahXIvqzfcrbgqBpkmD5O0X
	ZfCOgEqT46hCwYTho3sJxnEC05VXjV5MdLdWzNbAqUAjQtw2Yx90bjBVF+OIn8GE
	rc4Cx7xlyl10F9LiG8utouIpxA/8OqVoXsSjfBtRfU/uCAO4CA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011042.outbound.protection.outlook.com [40.93.194.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cfd3k296j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 17:47:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tGV5jjLqh+YXyGkRrfH/T2eTCedLviFZXTzB0D52sQxGYdAKzBuotiWqJo8iHBfNUMnQBO0eLG1tZcQifpiCb5PgrgYE8exMYiWiW7kqS8Y23TXlu2m5x09Sr6Usj6spzdIuPD8+ogooyZBGhM1BjPHCgSU4/G62pgtXZoBVk/QUlCcf4gC1M6ouH1PrEg9hr2fQqhfryzDiKuEq1NV8nRHezncnV2cnV1mSOC8Msx/kn4b/t+D5iD74zdQrW0ARH8E8sQVkXJyg7wDv1VdsAXKIit0t6POtrDYb4XSEUwlxkjjp0iV+/R5awDxTw4OCBmOSynXHCgej4VTx4Y7VNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EpvzoNRXoPotHTN4VB19Tl5hIQCq/r7g5vCx8I1KnTo=;
 b=Z6eZbN9TMpndR3NwDCBs/BCoE3LcP/p28KwQlGM0izvXKiqu37L/tkgYGIn0n73Svaopus+SV8LdMHhhDdTw4fe8bqMloGbSxC9wvDo58+gQtMipoqeacUQ9EUtLc0wu9dUsoWeXfVnu9yVSeFSdzR+LPyAew8MnffmlF1wizdJqaqOMb9x1w+wYKWGnpUtGyZAhBWYyunxETSI5Vf4s/8BnnFLj4jdNsgfahPYJE7++R5daajZsoqjylDZKW+12zkUlz3Vr7xckIeCYs4s5Bsx5E0/alzkw1VQY6GwGPUD2UGtQHF32vZD1k9yAnKYJALoFxef2DSaPigQHeyaxGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by IA4PR11MB9393.namprd11.prod.outlook.com (2603:10b6:208:569::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Tue, 24 Feb
 2026 01:47:12 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 01:47:12 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] perl: upgrade from 5.40.2 to 5.42.0
Date: Tue, 24 Feb 2026 09:46:46 +0800
Message-Id: <20260224014646.3335672-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0098.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37a::18) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|IA4PR11MB9393:EE_
X-MS-Office365-Filtering-Correlation-Id: 760786fe-075b-443d-2380-08de7346a157
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?y2+lIWJL3txIP7TUG1ZjbkQodW5Y5c4nfhIVyBnjYUEhO867hAVSK0hvsffn?=
 =?us-ascii?Q?qPPOFV/8fnQ0fTxhlNJkYm+WVd/cwUtc8g4UIasuPom0aMgUizJqpzRN/spR?=
 =?us-ascii?Q?zGQpvIeoykukX1eZKoY0+tE8MzKrxJtwGK2UxXk3OD+jHBgDPjyq+dL7kLzA?=
 =?us-ascii?Q?L4rrci18H5kWDfRc/3Xeya6YOwxhYDydkk1oDvycMuBSKs9Vw+BiZOZvRuA+?=
 =?us-ascii?Q?lQNg57YY7Q5O8fJSCxbxH/Gb4C0dqBh4XVLzaQIyt4IXi3VbY5G0Cq2yWe9e?=
 =?us-ascii?Q?tIOtrYa+ZcLEmhmLri1a+81Evc1HWAVdrFfSDkefgsxFcE6W1+kiJjFPDG4Q?=
 =?us-ascii?Q?5UAejsNPss06mH/huBmpd+B2cF7jcE8fx21tyVef/tGfCf/w+wk4Xiv/kVgw?=
 =?us-ascii?Q?E+mKTuzfGl/c3hq+7RLQSxF7IKR49sRURtuEhzqTHOAEAX3L+rBmrCQgAIhn?=
 =?us-ascii?Q?HKq/RZrbLIiZAaTcSen8Ca2hReeh8rlUKWOj2kpY944q+2efTeyVTHWP9kK4?=
 =?us-ascii?Q?HCVtvvWdQt4+VtD/eBbJIOySy7PTpX634XkD9Ph/COWLzCSVh7CSnDc5jgJw?=
 =?us-ascii?Q?u0uMDrTKJ88ZQrvzvWH2KCKlHFezSsc7EqpkkGZ/4m2OxgDBeeP+mHiiD/SF?=
 =?us-ascii?Q?0naf/2x+aYX0wjwxHkpasbcUGQVWTgqdto/dK38ivNVM6tiAaSlAFQYAA9qZ?=
 =?us-ascii?Q?7nI1AS+vaEsZ42zOCqMJAo4EM3cjavYvQ+7upA6Yeku5MVR4H+CEPq9RCRV9?=
 =?us-ascii?Q?ND3g0NevROeZVjZYDPkg8au2oYeiHfY4CB5tV11G5u4bIIsUe8qvCYRs7+KB?=
 =?us-ascii?Q?kHAVh61Lg2tEsNztdhkDE0j0f6mDcLRC0J1asGBk8Ce5TMyy0W5JrT0/izWG?=
 =?us-ascii?Q?oXGHuR6U0FIGWwlCzmHqyhJNiJJY323kg5xA9/3lDQjiQp8xSNiW4PGX9513?=
 =?us-ascii?Q?Sb3biDFo/2ObiUHXOkPlkndmwB0Kgh0kVr4mLPm3tRbxwWVZMd+Fo9vKu+rn?=
 =?us-ascii?Q?mGB26/kYmI3173ORW4PvAnT0Anv/jaYFLAGUm3h2X0Cvt/DPOEJxpXB2LRlQ?=
 =?us-ascii?Q?7Rsd/2iBh66vvIqzXGnncIu7e0bA7KdVMSLgMxaMM+XWHXW7nyMe1wA2fqvJ?=
 =?us-ascii?Q?qaIXBnmQep17XbvuY1baYlP4pPk4RRZsvsOfvnxPfsSSefzGndYVLThT+kDx?=
 =?us-ascii?Q?adhU2VHxwQL9DNN78lzlzttybPElwP4XcFTa8PiYLO3TOrCg5cvwwVJUGFsO?=
 =?us-ascii?Q?v+gdmITJLOCRDLaC6lvsuy88Os49IFwnxdEX/c+MXZCqfiwEUvaLpYYVZywb?=
 =?us-ascii?Q?e1mn5A7tkv42LC26zPY3LogNKG4qN3sQADPea76dURksFQVm41V4i88x4mbO?=
 =?us-ascii?Q?5nxMTGJ3+cfE3U4+xJ5zK2Ti4Gmhsxc4a15BrN0Dgo9lzIiJoxzf9FviFdNT?=
 =?us-ascii?Q?eHmgfdPsQeKIpHI/tr96+DBZuycDukBNPXPrelyoTV0hjqMArrd3sDPSQhUi?=
 =?us-ascii?Q?rcWjxa7vr1ZAwpsOIG4kK7mx9gcJtztDsPOlK6Rkrqnp+ccpvZcPhU6q2AvQ?=
 =?us-ascii?Q?5f9g9SDx7e8X3UY4XOU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?e+hWXJFVbbWTMgP9Y6X3nKNHdiRaBZVetPO0U3grj+ejqPq+WOcMkALqMBiI?=
 =?us-ascii?Q?uQoLeOe7XCQGYkNi/EuX70jXdIAyI1AWz6Dr2Ph0wNO/v/65FfogPD4ZcgPg?=
 =?us-ascii?Q?LF2Xh57J4ZAl/DQWIUE8Si/9K7Q+NcVElJiwqgGizLhnpfNGXW9QJsMRoJso?=
 =?us-ascii?Q?nE/IZQQANUYvAm4j03LXq/gQRFMcfPpIPQiPbcnwpIbsqAv6oX1/e0lggpwY?=
 =?us-ascii?Q?RTvSI/WW3WVihbGrvsFzsSwCMONCr84VL8bDV4lz/AKNhOkdB54duOXCEoPm?=
 =?us-ascii?Q?IZP5nCLFV9YkICRlR+Iaidid4omIPVLvb/FUZrTvy9Oc4yK21v96VEv72MGJ?=
 =?us-ascii?Q?lkuQ22g2Y3cUBkhTnjSHf8UfHfoxga0bu69j0LdzUEOmYUXZ8nLzixxl1VkB?=
 =?us-ascii?Q?7zXp+4tM5IksMlddjT+2td/09u6Ezo3Lp+KXGaUkuM2lm+xb71QAsUY8eKRV?=
 =?us-ascii?Q?GEVfbPRmOHB5lp+MNybIFe0dB54nd9iDI38fV1HZ5Gz4llF5FgfuefourGY8?=
 =?us-ascii?Q?eHXLp2GYZPplEC5htqBtyyOnoyZyXjBDWzMX4DDQMfSuEchdnSI/Z4PWGSDQ?=
 =?us-ascii?Q?yNBHkZT738qLaPj+G/Fcfei03wCz/IAh7KJ4NFwcHo4U/sbIpQR5xR/UMPVh?=
 =?us-ascii?Q?txDL21dNcA80buVeKuWY+YC97QVPa3H7AuSguMhU9hNu8OSb+M03DkzwSBXJ?=
 =?us-ascii?Q?QBaU0uY3dwaMQE8htcrgC3TAQNtmcwGKRvmnhPXmFaM6j+CrCWG1SoMALW/W?=
 =?us-ascii?Q?IEkLrz5VQuCnO9w1i7zFgzktPctNPHUBa4RNjQXMks2PGX1rw3vqhLYYg0Hx?=
 =?us-ascii?Q?uyhGPpXvdWKRy3uVUWqMrS0UKZVIma+XyaX7Diz/V7PjxtYVkQdLC1bsPjz5?=
 =?us-ascii?Q?gxu415McCO9JMlLM9c5lFMaSZ/JB6cDcZC+4oqZzfK7oroi9Q0KjCyG9Za/6?=
 =?us-ascii?Q?FQ5Uep6a20rXIi686JW1/U9LELTbLK34vTCaSkcyI5ECfZdH3CPQoAhvrnJp?=
 =?us-ascii?Q?sEIUhSkVFMJf6hoe/WsFUeHqphSalyz82eKfSCI9nkq0VCxY8QTH8dhybJ3d?=
 =?us-ascii?Q?Md0ayDwY+mR4c3ZB6Npj0SZgr+EOP3/XFHEp0oQbXGLzi2Z+LPsmwo9jwjw8?=
 =?us-ascii?Q?cpHXzXAzeuXquuTYu5Snbp2Sr8RUjZJ2Py+iQCV3YZWW17DJZZzqrJTznvSC?=
 =?us-ascii?Q?vgF3gfypbaS1f/zvG6wOQ+N0xk6z9ETu9eJGHDEAq+20O57WZhmduE/DK9aY?=
 =?us-ascii?Q?H0M9CogcB4iD1ja4DPy61uTmMIm4WT3qT5hD5mAocNB2nxmGZ84N+aNWLDeK?=
 =?us-ascii?Q?g8+lCfBt9Hm1Q1E9Uy9KbiAxJKZoVIHkkC1oDlJJBt+DLPkbJsMRnaKUVsdE?=
 =?us-ascii?Q?NnP3Uh0MZvGIowh2u2ucuRyCdpPxzK0a2fA1YJW7YjFoNXMB9oKyLxFr5dwc?=
 =?us-ascii?Q?WWTta4WtMJxBLfSI/X/VAhlqTeH2wa0F6WBsXXzby7enB5njUKU4In2QOAqJ?=
 =?us-ascii?Q?JQUwkY6HqJTPZjORmFt94hvebEaIeJWw2z6vcNYAZz/+EnVS2mfEPF/wwK7H?=
 =?us-ascii?Q?QB7s43qeGTaUSwXYiHPaRUm3seKOtOMhp1/rq+H9d/AFHLdj58gbBn9gMIKN?=
 =?us-ascii?Q?YPPhKM8/rYMM8s8aHEzibR3JHXfoLA8VY+osTeE6uQ7+GmmTljWv8uLYQFSN?=
 =?us-ascii?Q?zd3cYXAL13dnOgnTBHJ17jMp7dizlSta4mbjHv9yrMAzy9bQ4ZFV8I9EldLX?=
 =?us-ascii?Q?QapGGaLljzq1buE+fmjiG9urTXr5b98=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 760786fe-075b-443d-2380-08de7346a157
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 01:47:12.6793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mrAjqBd//ZCgziiY+f6b7AY8J371Bxvtcdh2TPXf4xsxAXFc3MA5KzlpkYAEkNjy2WoCuYHsRaaMdjKG9Wot4yE2upmrOvoXbiMEU97Bdrg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9393
X-Proofpoint-GUID: z_H8scPpQdBgLyWikcPIM477p6sr0Ucc
X-Authority-Analysis: v=2.4 cv=Bo2QAIX5 c=1 sm=1 tr=0 ts=699d0322 cx=c_pps
 a=audpxvcsMtk9YILK9bmPfQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=_IEhM8lNAAAA:8
 a=t7CeM3EgAAAA:8 a=r7oYzMH5Ov2KxFcS6K4A:9 a=WN5SZLvFwbRUu1hQBHWk:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: z_H8scPpQdBgLyWikcPIM477p6sr0Ucc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAxNCBTYWx0ZWRfX1MoTVG+q4rS7
 eg0Y7uMGzPY7DPkKKicAffakady3jshHAtCWq5nhU/tko0iiJXkoW6MrNRh1/6VtQqtd/axebZj
 j9OgwdEiFkET4HyLf453zMamhN+Ywr7L6kM7cYIGVf2P46CZrYf4RAXJIMPs5fSMExV6MEqZ5Fy
 meOXEJgX0eoRzLVnGRWfezNMAoX/xf81RAaMFTr5/xy5+xYvumfGfHzXSRHtX2yKMPbQCMCTuzM
 XFsL40bjFiiBGFYAJNgDzqVQN3NlgBwqs3RE7jpMuMuVR5uh3hxfDOemYVLsusJ3vBL+9ofe4SZ
 NqpWf2ptX9ZJRp9n6yjAU1vVtSAgOQ+WoGQab6Vk1Nu7YiA7m5t5gI+XWXDxQ0SWsiAsl5EtFZC
 2lMTjjjImHE9I2iBj/1agCX7wEMpqBBvT+Y6qnZ4HaPh9no1hDkpBJmOSU3rBKbhZYlYW84ixvb
 MeeVcnal5HNaEy6CZ7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602240014
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 01:47:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231725

License-Update: Update copies of GPL to match recent FSF changes

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/perl/{perl_5.40.2.bb => perl_5.42.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/perl/{perl_5.40.2.bb => perl_5.42.0.bb} (99%)

diff --git a/meta/recipes-devtools/perl/perl_5.40.2.bb b/meta/recipes-devtools/perl/perl_5.42.0.bb
similarity index 99%
rename from meta/recipes-devtools/perl/perl_5.40.2.bb
rename to meta/recipes-devtools/perl/perl_5.42.0.bb
index 2225dc202b..a154bbc0a9 100644
--- a/meta/recipes-devtools/perl/perl_5.40.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.42.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.perl.org/"
 DESCRIPTION = "Perl is a highly capable, feature-rich programming language"
 SECTION = "devel"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-LIC_FILES_CHKSUM = "file://Copying;md5=5b122a36d0f6dc55279a0ebc69f3c60b \
+LIC_FILES_CHKSUM = "file://Copying;md5=8f7dd0873e59530abbb36503972afcdb \
                     file://Artistic;md5=71a4d5d9acc18c0952a6df2218bb68da \
                     "
 
@@ -24,7 +24,7 @@ SRC_URI:append:class-target = " \
            file://encodefix.patch \
 "
 
-SRC_URI[perl.sha256sum] = "10d4647cfbb543a7f9ae3e5f6851ec49305232ea7621aed24c7cfbb0bef4b70d"
+SRC_URI[perl.sha256sum] = "e093ef184d7f9a1b9797e2465296f55510adb6dab8842b0c3ed53329663096dc"
 
 B = "${WORKDIR}/perl-${PV}-build"
 
-- 
2.34.1


