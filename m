Return-Path: <Ghanshyam.BanaitSanjay@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB2B7C79F80
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 09:53:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10440.1788515625637356447
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 02:53:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=QWOSv41Y;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=37078d05f9=ghanshyam.banaitsanjay@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684650mc629682
	for <openembedded-core@lists.openembedded.org>; Fri, 4 Sep 2026 09:53:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=x0tlLUKx9/U3F1hMnZ/g
	X/wQ2JzTkTQdrXAD4HHDrwk=; b=QWOSv41YOuyKo761Ag/2p23EbOPTJGdA5RW2
	Xs76KywjXQ3hdbyi4wmBfvXTB8/r/Hs0tuWWozs2k2RXmnRgZisjNEbVuoz8T+e9
	BwRPKCcnG5/BiKRj0QzRTDVE+1B5zcbiL18TxTixyP8EpmtlxFuh7Evo9rfcMqw6
	tYuygbtfAiJBsqDIKDGTSkQBbs+hbPmjoBMnEndJGX2Z2otZJnT42VTFYFqo/+rQ
	V15AVLmfsxPSZTwzEaMPbNHEOn8VJucYbxIfSuiWCh0/ZkUT90glrodRVRPxSeuH
	AIwq+TNH2RvD81VYTPKuHw4MsgX7uNB/bXn7B1V0sRcedNEmkA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023072.outbound.protection.outlook.com [40.93.201.72])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gf5q0j5qs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 09:53:44 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ikDYsSVFQ2vmSlY7CDHdg8tkpRRvpro6ATTv6LFtFdiGD4oYyufo+sQTsQbPcwwnlW15ONYiNYl6Wvz29cCh3uUjUrFU1hGoxVlTxUE1d3BofYfZpgjpoYbNkPxyF4uk3WNDwjbXWJmdukdMG+HgrbWjo7oceYPEEQi6lNkcfyB43DrPjFTkDnFi8iVRWlfpF7S+oZTyqclvrmiVsfwhQWMJtf7fdsbyVPQZg9l6ytup6vRtN+SXdfgvUFayc2eL66ACZ8iEMRX0KvbYgks5z7bo4kDdFEE+Vfepl7VH/bvTHobmOrr44tQ+Ompc9vqlBPXe61KjDtvnfyrV0560Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x0tlLUKx9/U3F1hMnZ/gX/wQ2JzTkTQdrXAD4HHDrwk=;
 b=SMoS1kBi0YVRPXjKTWESTNnD1edzq3zbLvTVgYkCIlda8KyowVcYcgIFGBWDmkGGmjvFjYxJ2tAHCq0fINcT0OrGh/mPe0T9bGylWyOTWrCcHhwnLOTGSJWbLmg1jQSe18vBxyjyVVlPMsRNQUOjT8+I1BDTld1O4rdriHdJ17Rx6vZnC6fTxNE7FH5ZUDRHmBRBhnpeP8+RPgplJ94tE7uCvMwNnBBkEqvdzjTmZEf+wuKPdELRRsBo3dAuXL5qCUw4pqMt2CIr3eakbjqodGZv8KRDV9Wen4oNv9EC0u+Vx6xD9vcAdrOW9jWP+hJjMLvxfD1TytMx4qJlju5B/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ5PPF57F27BA08.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::82b) by PH0PR11MB5126.namprd11.prod.outlook.com
 (2603:10b6:510:3a::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 09:53:41 +0000
Received: from SJ5PPF57F27BA08.namprd11.prod.outlook.com
 ([fe80::68e:cafc:75a:3e02]) by SJ5PPF57F27BA08.namprd11.prod.outlook.com
 ([fe80::68e:cafc:75a:3e02%8]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 09:53:41 +0000
From: Ghanshyam Banait <Ghanshyam.BanaitSanjay@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH] wget: fix CVE-2026-16599
Date: Fri,  4 Sep 2026 15:23:18 +0530
Message-Id: <20260904095318.2626527-1-Ghanshyam.BanaitSanjay@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset=yes
X-ClientProxiedBy: SE2P216CA0144.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c8::17) To SJ5PPF57F27BA08.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::82b)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF57F27BA08:EE_|PH0PR11MB5126:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b4d0070-c273-4cb3-07fe-08df0a6a6645
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|23010399003|1800799024|366016|38350700014|10067099003|11063799006|5023799004|18002099003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info: 
	2OdfaA/P/n1x7FvWThPYo856lmHBaeI+7Yk9NzUd94Dm7bnN6MYst/+zDPQrSlTmUMn2zmIzGt7Rnvf6bIeyPv3z4JUNLL4jJR/MFEBKUMOMcm0pWq28ayfxTOJKNDH8UCzPoiuLg0Dq2N/y/4YtGIG2cpQhCJ8tF0RhsPJlt8L3Y9ubYklWg36PesumJe32OVPx1Aq3zrbI3E2TR/I2+r+Q203A0dWHpEDwEKOSk2PehHPBu3OBKXWlh//glC7omrUzs3zkXoK1MG96+3oTV5POPsJDAFGGZ+hYn2WGzu/8lV7Kf09bRJUBL49aneiVIhh20CrLSIo0cWFvgbBTvt6v4D+IEnC5XTCuIwncq7/9R1BPxRCuEL4/SMoHpqoZCqNL+q8T1mgqry2PYKgzVECufj8lato7Aon1rkC0q0HpJCJwLj9B/bTx6h/iISP0v4yC10bCO37fBojKQ9E54nkKKDijGFaZ3aj/ysSBwjISEWCChaPgZCmXfxhomuxPqVrKAr/rJaT22iR4UNVXkiNhPZMSzDBKp9s/3YYVVgGPYmH7WVzcqi4nN++kt7dWwtlMSV5NU8UtBUkDZLP376E11y9Vgl5Qnad5yI69KOtmGayALP/HORmp16qG5jeGtB7j7UGeGaXhSS1+wJy4QoJRnEExzt7p3XAE/C55wvMauk3BLXxAGCEsR0aDg60v3x/1gfzwYDww/rdk/LSBccXb8VMGYHhxQG20WGaMnfE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ5PPF57F27BA08.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(23010399003)(1800799024)(366016)(38350700014)(10067099003)(11063799006)(5023799004)(18002099003)(56012099006)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wuxRsETQIr/dn8HeJhwVKedjB47UF7j1VCeaakiQUf9mYiOBWnxQfC00Khev?=
 =?us-ascii?Q?aEhujRMQRSWxeT+3bVJPqeGJaidPdpBdmZS5hEh7A6hi+prj14+Huet222QS?=
 =?us-ascii?Q?X4INM3pnwulCFh0Npr/EdqpLu0RkuINNy4UOfknEYQXAP3DyY80mF+qj4ZsK?=
 =?us-ascii?Q?swTG93dRsy4mf8URlMngNFa44abpaemgafqDvVTmW3adflmwauQ+qIQgbwse?=
 =?us-ascii?Q?0KOC+dw7wmEzpNMbJe91G8929f2ZYC1Ssf1UpWLD2PJTCk3Z2qpOWtVkuUqi?=
 =?us-ascii?Q?8R6rAnBpWJNjrWrbCZp9zp3JcSmf4FzTocwUzQVRjZMrHIL0hbcpfgncQzaJ?=
 =?us-ascii?Q?VII5Mt3xQQxZnV3QdU5yj7GjSXfAb0co8IcnCJhP7I8e/A9FhmEdjbWAOAwE?=
 =?us-ascii?Q?WVUtG+dCXZZw0y4Py5o6RzT+WmBsRGwNfrwAgK78sxm//MDHukZGvsqK2tg8?=
 =?us-ascii?Q?lC9pwvv0IJYH4CK477JyAA0v5rk0Y/y0e56d1/ZFLE2j4RhqHnw77nQHQGMO?=
 =?us-ascii?Q?tPWUxPU9AXXNfIEPHATi7u8XNELwXVeTZCbAMy/ixqU6fGQuEgbkRdRpNHX3?=
 =?us-ascii?Q?RZIv/FZq34cW/xbiqstfINIZbueg8h/SI0rcauHpCNTHFdmPVO9HA/w57GDf?=
 =?us-ascii?Q?Di8F4ujMUV7twTdikZw2vn3X3kajZngSZat54eW4IyuQiRLeMjw62zlu8TDM?=
 =?us-ascii?Q?sSFgTzX6xWkE9L+N/SaKR3Iq4/2TbKgiJdjzXsjXUIwqXvifkAmdGWJ3Wpr2?=
 =?us-ascii?Q?aIaQGvSvqTtq1udQtQgs9G7AdhIjev86nZOW1ezGDbWnXfE7RYash7ENRGnr?=
 =?us-ascii?Q?Ut0Uz0JKtE1ET6Bt+ajP056X1jR5k8UNNXwZAgIwaygyHIBAbnPMkTQJIhxO?=
 =?us-ascii?Q?h5y3PNgEd1NM2QjDWy9K2aie1Qwe4IPudjKSYdlVatx8IhpC9Qftpyq1XfqX?=
 =?us-ascii?Q?3Wx44+qoA6c0DOfiH9IBLQLa9IjIf5BpIokpeJowtMDtyRj4IfLnrl3INGrx?=
 =?us-ascii?Q?tb12re9PwC9oeVx06nrejGY50o5kMmlzRZjT5Rx0YTmIIQbDGiGwuIXuQ+S+?=
 =?us-ascii?Q?hLzoRYN7KGwTcARbRaI75WXpIQsYS/PfHDKZ3IkQgpMIzf6gIRo+3hy39RJu?=
 =?us-ascii?Q?yZd+XdimVGiVewUWki39JB/Fw1qw059AXBhVuLIL/h+vlwcUR0oobKhhSvuQ?=
 =?us-ascii?Q?CwwgFytH9eqDvXidmKNNMGHNiIxjCmilKhPNKuGcBG6f2NZrANAbfFkYrgD/?=
 =?us-ascii?Q?j9A1YhtWzv13+9E508KD6zKb93nPOfELp8EyXV+F7/PO7xlEUEvhrgzNtwGX?=
 =?us-ascii?Q?e2Qr/jStpJv9F7j19XTN6atHi6fn9XThysIia2Pa5BQLjKOIOcZMHiZyGbxH?=
 =?us-ascii?Q?ArInJVkcPzgbIkoZ3TdTKuDA73MqLLuhu/0+XTmqUywtDJrrah8uhCLwS6On?=
 =?us-ascii?Q?78lVFkHK6uxVTa8n7YJVwv0k+OvDE8/OIyxzDRLcEs57P+IRVz2adJyeIEGJ?=
 =?us-ascii?Q?ytdtpKU+6kFPzm+1ok0DIaPJSWSjKuHn2isSkp/JRDSVKQIDyV2b+c1wLChA?=
 =?us-ascii?Q?p/fGXaAXN+3OEa3v2KKgWX3yxB/Y8aeLRPAlr9l2zj2U6sOKp58eWE3Mqzx0?=
 =?us-ascii?Q?Uze4MaCwHsGoOz+CI55Ns1ctWW+25DV19QXh8YbaBNS2yfyus/9VckGSfF3K?=
 =?us-ascii?Q?GgO5+j6fw8UpPB99srHbwwBateHc3OstMjURpMNM2yZfYZoH5EoJsqzeXT1W?=
 =?us-ascii?Q?hQX2mxAf6yB3GBYPgVtsTAY0O2o5qmJkwShCLMvDpwTzyK9H3bFg?=
X-Exchange-RoutingPolicyChecked: 
	ochrF5767O2eW4zEOoOrfVYD+GaBRus+5p9NPWBa7vNU23OUdH69m7iVkMx7YMkWt7FJGjypOA+TRyZCJRDor7gAEiW83ALZAEqZ44ipy+inyWNdv9iPmO2+wPr+Wh9Hbnuk+gHc63Pe9VY6NYa3CXastIVueB7I+fqyuTYC2q4H0nwfXBQpAg+g4kONCHG9JinggY55WTrifsITMdXNXB/O0FzIXvvYxGBo9I+RzRonLq7v7Xg5e/bAcFBRbrBW2KdtPgU0pg8FU0Kn7gl/wHDxCtvooZkenaaMqNgEbrgGMsIWzkQmZgwJc3mMMoqriqKsapzm0ZHXPkJmwhLVGA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b4d0070-c273-4cb3-07fe-08df0a6a6645
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF57F27BA08.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 09:53:41.1172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0n9d8INQ8NqBu1ersPnIhKToi2WezAIysqr1KYCyBh+/I3GEIQvOrDQKseZ5r14JGYqJKoT1bTD+vmzeNsQF6JSPhJg6c+3nYieDSPHgEvuF3kjdNTCTM3tZE65F9W44
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5126
X-Authority-Analysis: v=2.4 cv=Po6jqQM3 c=1 sm=1 tr=0 ts=6a9a9528 cx=c_pps
 a=a9BdPFFbNpLpmASqG3lITg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=WN52PlUurRMA:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=PYnjg3YJAAAA:8 a=p0WdMEafAAAA:8 a=t7CeM3EgAAAA:8 a=zdLnC9K7CA7n3Skcb2gA:9
 a=3ZKOabzyN94A:10 a=xE34mhsjmDcA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: JugX5eKl6WlAenpqEfyNfeLEImOxRCE-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA4OSBTYWx0ZWRfX0NNl4GiZdQcy
 k1n/whJlBKmHYbAm7lVApXVXLxYslOuWkMTFQ7OYwg5bUTcwqJMMeF35+ND78NnWC3FwMhsKYhI
 BhUvAvM1zgFNxYb1LLoCcO9EY6mC9fo1f+q4M3O9dR1lKKSiceaL
X-Proofpoint-ORIG-GUID: JugX5eKl6WlAenpqEfyNfeLEImOxRCE-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA4OSBTYWx0ZWRfXynOLkm+adXs+
 M/hrHV73HF7OZnxjLngOX/t95BA5bZQ9zv07bwgIYkl1KuEA6H2Xl4v3qv2DyZmaNq1LASDgn/W
 scMN6bLf8qZ30doyP+oY0hfqTCNEsN8n0MiybiOb4FCSWdqItczPHgeMduBhYnmNmyc7AKZgW+j
 pZYarOUR1V7soZ2DJKG4voihU6JNzJ8Du9UeLDsVUWvdmUydxRYC/C+OlF3B2DToBTlNTHFSekK
 wRGAzk0nKA+b2473N8euyfqf+S+HP6Al5pK0/VBztYnHdCpsX+AiDF4QNcG0ht5dsw/bwin9W3j
 FHLOr2DNSJlJRrNkWHLxbrsmTMcKkAPhakPr5SElpdAbZrB8Ko/nkPsX1E+Sizl17eQfxyr14qW
 uvXz5Oj5W6UVPtHZuokwHqmEP1ciVg4nFjgyAmwM0n+jgqfYSJgUKsh+9EkQnUXP8JYkVOaz94P
 NzLshhA5XeBP94VJAVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040089
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 684650mc629682
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 09:53:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245087

GNU wget is vulnerable to denial of service in its FTP OPIE/S-KEY authent=
ication functionality.
The server-supplied sequence number from the FTP challenge line is used a=
s an iteration count for
an MD5 key-derivation loop without any upper bound validation. A maliciou=
s FTP server or a network
attacker positioned to intercept FTP traffic can send a crafted OPIE chal=
lenge with a sequence number
near INT_MAX, causing wget to perform up to approximately 2.1 billion MD5=
 computations and suspend for some time.
The --timeout option does not mitigate this because it applies only to ne=
twork I/O, not CPU computation.
This issue was fixed in commit e9697d98e7249b0f68a6be040a4f3dcc5bc101fa

Reference:
https://nvd.nist.gov/vuln/detail/cve-2026-16599

Backport the patch to fix CVE-2026-16599.
https://gitlab.com/gnuwget/wget/-/commit/e9697d98e7249b0f68a6be040a4f3dcc=
5bc101fa

Signed-off-by: Ghanshyam Banait <Ghanshyam.BanaitSanjay@windriver.com>
---
 .../wget/wget/CVE-2026-16599.patch            | 68 +++++++++++++++++++
 meta/recipes-extended/wget/wget_1.25.0.bb     |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-16599.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2026-16599.patch b/meta/=
recipes-extended/wget/wget/CVE-2026-16599.patch
new file mode 100644
index 0000000000..fbe8c0566c
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-16599.patch
@@ -0,0 +1,68 @@
+From e9697d98e7249b0f68a6be040a4f3dcc5bc101fa Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Tim=3D20R=3DC3=3DBChsen?=3D <tim.ruehsen@gmx.de>
+Date: Sat, 20 Jun 2026 14:39:54 +0200
+Subject: [PATCH] Fix server-controlled unbounded MD5 loop in FTP OPIE
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+* src/ftp-basic.c (ftp_login): Limit the skey sequence to 9999.
+
+Report:
+wget accepts an unbounded server-controlled integer as the iteration
+count for its OPIE/S-KEY MD5 key-derivation loop. No upper bound is
+enforced on the sequence number supplied by the server in the FTP
+challenge line. The value is passed directly to skey_response() as a
+loop counter, causing wget to perform up to ~2.1 billion full MD5
+computations before responding to the authentication challenge.
+
+Reported-by: Micha=C5=82 Majchrowicz and Marcin Wyczechowski
+
+CVE: CVE-2026-16599
+
+Upstream-Status: Backport [https://gitlab.com/gnuwget/wget/-/commit/e969=
7d98e7249b0f68a6be040a4f3dcc5bc101fa]
+
+Signed-off-by: Ghanshyam Banait <Ghanshyam.BanaitSanjay@windriver.com>
+---
+ src/ftp-basic.c | 15 +++++++++++----
+ 1 file changed, 11 insertions(+), 4 deletions(-)
+
+diff --git a/src/ftp-basic.c b/src/ftp-basic.c
+index 0f4bb821..af38a69a 100644
+--- a/src/ftp-basic.c
++++ b/src/ftp-basic.c
+@@ -204,12 +204,11 @@ ftp_login (int csock, const char *acc, const char =
*pass)
+       "331 s/key ",
+       "331 opiekey "
+     };
+-    size_t i;
+     const char *seed =3D NULL;
+=20
+-    for (i =3D 0; i < countof (skey_head); i++)
++    for (size_t i =3D 0; i < countof (skey_head); i++)
+       {
+-        int l =3D strlen (skey_head[i]);
++        size_t l =3D strlen (skey_head[i]);
+         if (0 =3D=3D c_strncasecmp (skey_head[i], respline, l))
+           {
+             seed =3D respline + l;
+@@ -222,7 +221,15 @@ ftp_login (int csock, const char *acc, const char *=
pass)
+=20
+         /* Extract the sequence from SEED.  */
+         for (; c_isdigit (*seed); seed++)
+-          skey_sequence =3D 10 * skey_sequence + *seed - '0';
++          {
++            skey_sequence =3D 10 * skey_sequence + *seed - '0';
++            if (skey_sequence > 9999)
++              {
++                xfree (respline);
++                return FTPLOGREFUSED;
++              }
++          }
++
+         if (*seed =3D=3D ' ')
+           ++seed;
+         else
+--=20
+GitLab
+
diff --git a/meta/recipes-extended/wget/wget_1.25.0.bb b/meta/recipes-ext=
ended/wget/wget_1.25.0.bb
index dc4903429b..95845d695a 100644
--- a/meta/recipes-extended/wget/wget_1.25.0.bb
+++ b/meta/recipes-extended/wget/wget_1.25.0.bb
@@ -21,6 +21,7 @@ SRC_URI =3D "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://CVE-2026-58471.patch \
            file://CVE-2026-58472.patch \
            file://CVE-2026-58472-regression.patch \
+           file://CVE-2026-16599.patch \
            "
=20
 SRC_URI[sha256sum] =3D "766e48423e79359ea31e41db9e5c289675947a7fcf2efdce=
db726ac9d0da3784"
--=20
2.40.0


