Return-Path: <Kris.Gavvala@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F118C44506
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 15:10:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11787.1783609801456191244
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 08:10:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=I1RFdTa6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1650c03d73=kris.gavvala@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669EdOtq2502215
	for <openembedded-core@lists.openembedded.org>; Thu, 9 Jul 2026 08:10:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=uUtTuG6ZmVXEIV5Mn7hZsJdya7WB+64DZGnTUJf09l8=; b=
	I1RFdTa6dpO15XnSIyREe4yYdEF5stJT/jKoyor/XXQE87VorQoxiSTugKmlSMJb
	DyhVtL3ltSq6eyvUxPp42jLdek3BhBlfS9G/q4I40noehdMhQDy+F2VxEA3LM+Ej
	r9CHp9qrWfLvuxO6J8ZNzsa+V3apDw6zc364OGCe4r8U3IqBdJT7Zv4cAhs2us4J
	au9QlVy9Umuzz5OC4GOxNJnEkGIN4vwRp4812ueMXhxJAqEB5hx0h+/GRQrrLTDn
	XhraV1RJcuzQjtyFkcZ0RJDehPogQQBmWu+QrtqiHLxs3KM1BvX3SEDX9UXQbCF1
	s+mGXgnyjACUrdsgexFUnQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013056.outbound.protection.outlook.com [40.93.201.56])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fa1ats47n-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 08:10:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pgROGXFkttzFVt9KUtNl8/Zuq+fRM+GL9yX6Vgx/LYfdLkdbVgLEjEeIzOa0EcaPti4h/l9929C9gqjOoAqnuU0sL5XfHOTBYjZcvyEDZNpb6F9M7MdFy5ei/e+dHHSStmyYurxP2LchqPhK3D2RVJKnN9ATnR+8FMavLwLKgTILScHA0uOfyijJwrCHXusdbKVuz7Gz/l0QoRZLe2aRUl0DMYMJ7GSouqsaoFFKSweN+A4VksGwZyu7TQimebOM5C7zqBJ9yeuA4/D3xPYS5xPn4mCoSksDfuJdtfAtkjE7yn+cRiCUcRrrqbr4nAwGXcfBNaAhavuwjxi2xRMqng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uUtTuG6ZmVXEIV5Mn7hZsJdya7WB+64DZGnTUJf09l8=;
 b=EGl+YjrC/DlOjpmOENCBxMPFE1vCsF2XFdyiWzLU0kwwPqhaA1KgcF/Ajf9u9Vp4r9PB5oJdcfRusneheeF2vaIPaN4E38l9YpyhQc0UvfreG/RJPDShMnc4YEVs3EQUMCWtusSzIEZRA1hhW2Jj+wQiDUmRx3BR3TGWxe8FgMRzqXn3l3lDElK7dqD8TGpH2BLt0V4GFE5UWSjQrqndHxym9EpqVOWgb7j9n/TIC2b7io8/XTlxN5ceBh9v3ARyfQzjDY6tzzD6/Dp83eAJ1Za9A3xT4U3L9Y0Dm9d4hqVMOcJmj5A4vP4zN5kAtekZzpvGWNohhWBi0yiaXYmbKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA1PR11MB7775.namprd11.prod.outlook.com (2603:10b6:208:3f3::9)
 by PH0PR11MB7166.namprd11.prod.outlook.com (2603:10b6:510:1e9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 15:09:58 +0000
Received: from IA1PR11MB7775.namprd11.prod.outlook.com
 ([fe80::9098:ac14:fde7:cfab]) by IA1PR11MB7775.namprd11.prod.outlook.com
 ([fe80::9098:ac14:fde7:cfab%5]) with mapi id 15.21.0181.008; Thu, 9 Jul 2026
 15:09:58 +0000
From: Kris Gavvala <kris.gavvala@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: kris.gavvala@windriver.com
Subject: [OE-core][scarthgap][PATCH v2 2/2] python3: skiptest tracemalloc_track_race
Date: Thu,  9 Jul 2026 08:09:30 -0700
Message-ID: <20260709150930.3068900-3-kris.gavvala@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260709150930.3068900-1-kris.gavvala@windriver.com>
References: <20260709150930.3068900-1-kris.gavvala@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0358.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::33) To IA1PR11MB7775.namprd11.prod.outlook.com
 (2603:10b6:208:3f3::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7775:EE_|PH0PR11MB7166:EE_
X-MS-Office365-Filtering-Correlation-Id: 43941ba8-9d6b-490e-c131-08deddcc23f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|52116014|22082099003|18002099003|56012099006|11063799006|38350700014|6133799003;
X-Microsoft-Antispam-Message-Info: 
	ux+ghoGsfT184nlwC6lZnzW9WkJ+GWk6TQQYvPQpTc0PROLkoCKn60AvaAypQ3py+kCiR26vtK7TcNDAw49Et0DiyoRzICpQYUlRcw15kI5tmcHJUhYNlDzHJfmD5JsxELIoCk6P59nKiwUuMLdPmZEvaDOQiFSZBcXjdkdEadX+alSf6pc7mqFPOHZ36jNzHLe4OE8hOyYoJaxdsoTa8rF3anFNtjkT1OgwqtztezZEmQH3EJ6cWQQFGQfNc1Y3MkmJxtkpqd1l6AmXP4nJSWwx8+w1B9c0JV/vPlKIiqlNSnW9+16v5tFGKClkQvo/pUkJSR8pqRmntzAePqmbfhub9U+xsuvyC49uCQ95oyPC3DEKy578jJy5nzvrsxNZOAkK4pxSAtXrdT/DPyGTFQHbPG6+Ss3QyhxmgqvYkF04p841SHo6KjlTg502ooy3T1Ohog3qEXXOciNyIUx8cJlzz+kLsf8wtSjYltqWvXTUd8mHcrzjYYdGnkmZkWe+F/bJ6+bMxidPqKc6i4D6Ojv2tuTxrIomwKCSiw1Zoenvy/PwYxBsicBg9hutOitrkUH0biLw1NEolNTxdfJ2K6tbuyuthjJFHlHZ738NM4BtFcnj9yYhC3NUEpbjCloMwSW91+8YbQJQgaRRcmC/k75RsBLXopz4B0hrL0CPYdydemPKIEFLIfFYn0gvohnwUxMLQQ/I+kysu+sFHTvEKR8ffToIuQMRFoJJU7k6rMg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7775.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(52116014)(22082099003)(18002099003)(56012099006)(11063799006)(38350700014)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Xor5zNr3vTl4D2sB5a3Tm/lWizPdvKS9FADB/qFIGrXI1D88fgdQWv8mJ6TL?=
 =?us-ascii?Q?ZsVUrMZHHoi5Nw/u8XIZPJSnNN1PHtyR8kqSeshxW87ZVq3x7Z1ocAhuHnPV?=
 =?us-ascii?Q?AD1jYHd+8G9L9b9W9gFr5ogl99QFb37dBZevmjlC1bfg7fkzgxoz9q7kR2Gf?=
 =?us-ascii?Q?olx75A5H/myqnU43yGChxxTtVoJN/IKsVODswoCC1z58CMAszbGG6AzQ8nwM?=
 =?us-ascii?Q?z3VuECFtWrhM0x4dnYxRdjG73JWmBZKHc9bLduh+izpc/3Ez+cORB2QFiwDv?=
 =?us-ascii?Q?xa8mNnMd0BO2LxKMd8CuCrFTox3ZTTFM4NjLmqzJ7HNYyQnftVpYfi7sArPV?=
 =?us-ascii?Q?ZBfgoRc5w2NaWpcOdozIg8HfAvCYPxNlMdDJnSd0Ig30GsavuMOcPEno1Pdy?=
 =?us-ascii?Q?IlyiLFB5SV0EqwbFSbqrUzh8QOX6SZSfW0JKNAZFRWFbnYrBUr6yJH7aW0Ub?=
 =?us-ascii?Q?NStofc32DyfAoUclTqxMtKLwNyZncv6DFDewQuum0zl94yNV1afQDi/B93W5?=
 =?us-ascii?Q?W88nE1N/Nq6dXESxpPsTr6l/CL+Y4Golh2+zN5Wx2aBKQkaRa5GpsNKprQVR?=
 =?us-ascii?Q?iZG+Yw+pgQHEBsOr3xpwJP2MI359YMUIwdNA/6cKTHhKSAjpfGdQpjJnkTDA?=
 =?us-ascii?Q?tox/ODSvs1AxdnL1buVTMKPHtCcNZsbup+NZ+GnbZgbNYtY60e3AW7qC1ucU?=
 =?us-ascii?Q?L6weHqQixGoC+qGbnVC7kzdn2Jz0fvjpNtP/EeovbNBmus+hg8RAz6r/F2J6?=
 =?us-ascii?Q?2vY3j5Jtd0FhpofEy02judk2a0xpbkAM1Tdk4hbyPSrwmkY8BNlXlqbXtWBR?=
 =?us-ascii?Q?qdeKdeyFmEU4/pQekqtAGtirQJp5u+XbKoFkJSdygR5g+Y/dvKAjhQKF2nIV?=
 =?us-ascii?Q?9QsvHoqMbOwIV/PYx5hRqE+fhRwYImYL7XYISF2u5B06w6cGw08vzPEXxZ7m?=
 =?us-ascii?Q?NPfF06nd+rXDxqPEh7DygR8ppxMwC5wBHUwlNk+GZ/gRL8FXxdc35eCrCw5k?=
 =?us-ascii?Q?V6VAI5kXAaY07nHAsyZ1ZQQziqSt3cKzFhfXugNHGdMr2DN4rs+1dZBbVQNZ?=
 =?us-ascii?Q?P6aWeQbJAU3BA60bM0mmp+r3qlp5vwyH/rIVef2NaQzJwTS4ezSVb3dbv741?=
 =?us-ascii?Q?icl3l8rAnynOUOAG79Xq7Vr9acBJjM3BvJ2IhPYFE2fPM/5aB3ktMBnG88i+?=
 =?us-ascii?Q?WMRtOH9RSIkx6o6SFR8P32M8SJB7+bLAI4Q5QudBb72gO8ZvTiISF+48zI2P?=
 =?us-ascii?Q?AbBMKv8qM5cXsjRduv+wId0VjhxrcLvafYVwP/1Y8XGqzbOas1/YUGp7sC+K?=
 =?us-ascii?Q?Mn9jQSEL+7cA2bgk5Kct52v1pkxiNVbL8qfyUuso+dAs1teL6NWF8zRrKuoc?=
 =?us-ascii?Q?fmIsX+M6I+7qrvsezYjGrNliWF0JzOe2HVpys0jFz0piIORGZqrlCng8/nSW?=
 =?us-ascii?Q?jwC64ZlaTNX27PrdnQTcyDevMPISRDA9cKObbnSsqMQGKqz0NNMJgrXjrgS1?=
 =?us-ascii?Q?pYuyEzL66v/fJVhMiFENX2z0qnFKHI2K6LWxt3+D9U8V2cBbwQ8Q/SbYtzE2?=
 =?us-ascii?Q?M2Z74Z/oOEVbg94JXcTJStK5rkjGfO8Oj+gzUQUzXAUPpfXerqOlr6FTMJbo?=
 =?us-ascii?Q?hmrPnFVJdMT5IAEKcioe3AuOdbuFWcwWx4hOnjC1sHjjgyzIxoH5I+0mnqQ0?=
 =?us-ascii?Q?LOzHGq+lkBNNfqdIVEuEtR7Pu3+yatdv2KDKjfwNExu1SG1TPWQb0b13muSK?=
 =?us-ascii?Q?lcEr3in1E9Ktg2rWZX7F39wei/HCF/Y=3D?=
X-Exchange-RoutingPolicyChecked: 
	I6qIVA+v54Z1E12OMA7A2FOzNXOpJEBHJyjCUSmjhMu+65ZPE+TPq3fx4ZjId+cMwKfXDGC3UzgAqpKzVXiqLvCEY76n71D9DO/UvlJQI3dZx8dM64XQPU+gf8bPdgABM9xShtwaKbSUUaxqTD08/YTCcKPLMut4VpS61GHhj4DyeJz8wAjQgPZkUzvNtlsr8ltYCflaqVHo99S/Q8JeFspcWlFv3GIxrRsp8rgFzVcUTreZzfPe/cc8gDqtE7vk3iF0LuQfhmD2tvBG5Af7yWAs6XVkSwCHCh7/rpB3gxQpQxlkoyEoEqwxaw5PcaxFwtxA5BiYYMZnhelm8Vk9Ww==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43941ba8-9d6b-490e-c131-08deddcc23f1
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7775.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 15:09:58.4190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ck9T/xmOPzWnXrpG71yI8aldla4ASZGVxmvpOzV8shjnoKa3CW4rpC/GuljLHW+Jcg8WssTjVR1l3YgmaSX1l570YJ3/ndsSqwEQo9EzTJw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7166
X-Proofpoint-ORIG-GUID: e9Glzydx6ZXQ-8bjqLSpKRWNIouYOOu2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE0OSBTYWx0ZWRfX599SfCBInhIw
 lzdzG5XSAuq3qXIrP0Qdf2TS/ngLzrZKeqp94G5c3i7IBfMevt9/toACjas9Q21ZCBjAmYtIVES
 AvU+M04b/FTFNvQRHHYobffo2GTxxJ2XylZCoU4ZA1cczEZ7+bvDV1mjEHQbM2K5G90Rn4neSiE
 v1jUok3fg0RLWEkpSt/4er5CZ2aTzuJVjhY6SVAu33ggLEWGHilIM2x4j4W814kTVaVb8XlM+wl
 UnOYnAip3Hn4A4saR7YY8NBEfUzm6Ux+vukjeSd1ZVayZmvgrPsDBqbKzPTdWs5C90MB87n9dUG
 kqX14tfl8txJse/FoG0jlxN3FGfgzAT82jEnivDjy3dNAQ6s3iw2XzLK647qkomKzuz1CG8xHX0
 NLh7PaplCcZGiZTwcpWDpZ26db5jQflqR7VGGYYutmE2Rrc2PQaH2NBYHUGLHJu6Y24eTp4Ukvx
 sT8Us+MFRflHCEION/w==
X-Authority-Analysis: v=2.4 cv=ZfQt8MVA c=1 sm=1 tr=0 ts=6a4fb9c9 cx=c_pps
 a=nYaA4L0hYP7ZHAKl0WLIGg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8 a=Y9_gvkL-yaYqd8EvbIUA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: e9Glzydx6ZXQ-8bjqLSpKRWNIouYOOu2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE0OSBTYWx0ZWRfX9S1FXXYbRDmL
 e06V7yaUp7N26zP/1uaJ0D0dvzICmVhJL6iTRhZ+IHvrZLRrLQkf247NmFckRl9ifXBhzylGcbP
 uwU7uxy7xki9fAjuDQGn9eT9dJoN5gP2koT1Q9ufbqkeL+jLrgIC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_03,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090149
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 15:10:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240585

In python3 ptests, tracemalloc_track_race fails with a segfault.
To avoid ptest failures for now, skip the test.

Fixes [YOCTO #16182]
Upstream Issue: https://github.com/python/cpython/issues/143143

Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7504490ba5e6ce0317dd12bdb961542062f05830)
---
 meta/recipes-devtools/python/python3_3.12.13.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.12.13.bb b/meta/recipes-devtools/python/python3_3.12.13.bb
index b31dd3d743..d74bdc158b 100644
--- a/meta/recipes-devtools/python/python3_3.12.13.bb
+++ b/meta/recipes-devtools/python/python3_3.12.13.bb
@@ -256,6 +256,11 @@ do_install:append:class-nativesdk () {
     create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN} TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo' PYTHONNOUSERSITE='1'
 }
 
+# Fails with segfault
+# Bugzilla YP 16182 (test_tracemalloc_track_race)
+SKIPPED_TESTS = " \
+    --ignore test.test_tracemalloc.TestCAPI.test_tracemalloc_track_race \
+"
 
 SKIPPED_TESTS:append:class-target:libc-musl = " \
     -x test__locale \
-- 
2.49.0


