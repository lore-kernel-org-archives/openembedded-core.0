Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CBA1EEA840
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 18:11:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52116.1770919889669820939
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 10:11:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hCU7pmT+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6503562417=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C6cZ3o3235562
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 10:11:29 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=SAodaKRB6u7D+bweNNWOKx+qgsF2S1prcbumrvOxVuY=; b=
	hCU7pmT+IuXsKDNczZeaZ04fsl9RzyzU5xJ6YU58lyK9I2kk5gvv4Jikk8YIVTZ8
	Lw33L0k1aWca600gQOHov+Qkud6m3+tU5K483EvyjonUXgZWKYuwCdD/daBO4JRH
	DcjCR+cWStj8OEu97qJJGnBOj2WgCiBNd2zYh1lSPzz9eflMt5bn34jfEopftUTu
	yQDuT5qSl92XMlGM6VZNbyXJkO7/DxCVbuAs9yig2BRPVmEF22Tt3cDPcQlbQZ8b
	Wt7Jk35/qtabarYAoFvajXfy2TqEYdboxjo7pq2zYGi7aCfzIVKp7/F2cucSVSh3
	gDnErEHAFNBQp1PNWKMSKg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010036.outbound.protection.outlook.com [52.101.56.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c61j4xauh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Feb 2026 10:11:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sRecPZvVsUD6IraHtpt2CYOVWLZLL+jmLwgHinnv+pvh7EuApznMv67iZgDZOxey0RpeXlNvU1W1VOG3/gqE36fM0A/EJ1jgnCPHZ/H5YYMKsAf5ea1bPOSlu0ZLVsjabB4XdkXTsqidQFIbyZbXmBvTlDlSf+sgCTiLtDhljDKXwS7qwOB+STyERrJjCWcBa/aeZ1fNa/2Epuh+MEkJ/kVdQSNcyQ+TM9FU4IrgGO6uzSNwx5S8ZJIcwHuRw8+vIdAeV8n6M8DBkpwTg+KM+ml7gFHKJX7HUrDYRQvBx1Mub2xbh7H0KaC/gk1VYB5b0qfMt7nRKKWRZL8IYN0mmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SAodaKRB6u7D+bweNNWOKx+qgsF2S1prcbumrvOxVuY=;
 b=R4DQ4dM64Wjyo9J2zA4xNMJWIMbCuHoFX3anpOPYhwBgh3cjR1bwgkz5uELJuS34+IL7jC1hz8ZzDS3sGv/d6U61Xs6h/w4jsK2ZGoxzf0LZFIkwqZV2m9UNKic4QuG4BXvREwZ89GVl3my3YtIGI0BHYOSAOY5wLhzwQPX8Ops5s/EtJUChUzMntxmKLwQa1UCINZ3UVvUa/72cCq6bAwRn10U3/g6ISxSzgojftUqsyQDCEGYKDDJfCRj+uF3GTIfxvJ23qP2NuTmnd0B5+cDFesmSw/EEAo0jambothQZxbC6phuD2JEqrxxgPfz+qEHsvIwNc5b8Sv9nth01sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH8PR11MB6928.namprd11.prod.outlook.com (2603:10b6:510:224::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 18:11:26 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9587.013; Thu, 12 Feb 2026
 18:11:26 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, paul@pbarker.dev, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v6 09/14] selftest/cases/runtime_test: Add test for Linux Rust sample
Date: Thu, 12 Feb 2026 10:10:34 -0800
Message-ID: <20260212181039.1826154-5-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260212181039.1826154-1-Harish.Sadineni@windriver.com>
References: <20260212181039.1826154-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0017.namprd21.prod.outlook.com
 (2603:10b6:a03:114::27) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|PH8PR11MB6928:EE_
X-MS-Office365-Filtering-Correlation-Id: 95ec525d-f617-4c0a-c740-08de6a62234e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?WWfylpMRyYYPn3kPHnVlnKXAnW0AnKWRyjhAx3ZTFi9srhEhaTXkMRiuLlEn?=
 =?us-ascii?Q?3q3y3b4a12uY9d3HjEgezBsoULWtVaGhoXhy/Zx2ujrquYRogDIo/bi8h6b2?=
 =?us-ascii?Q?G3Dy/HSNAL5/QgYolJXGEhpVBVMC/C1ifkl6mwe8/JwbW75ZUDJG0zbHYf+f?=
 =?us-ascii?Q?KAsjEswL5VysxCerj234Eex8B85a66bJFC3YsUnZOW23O3jDt2jizobcKF8J?=
 =?us-ascii?Q?+I8vdIGx2/hHIeFCoX0sFp/vNuI3y+qpHgLBNYDu5ELv9lF1S1OXuqFLFY9r?=
 =?us-ascii?Q?Y67ruiIUSvIhml0EoNYkQCjcQ60p/PQF/RL4o+Auux+OyPclFk9oObJ7uQJL?=
 =?us-ascii?Q?+x7zvjD/2WUCkr6RW238ULgaYFTY2L58ojWtSxBsm2GqKZkzoasFBZFdagcN?=
 =?us-ascii?Q?N1mZhjG6S7DX1/P2JyHMsA8FGn9FX8waoWQiZqGKBTvc41cft/yIQl97ei/S?=
 =?us-ascii?Q?u0OqtX8vCiLj1l14cs0qyFlKSilOKyvSz+/uH5orT/mCW1DlzMj0bF0ucXBI?=
 =?us-ascii?Q?QjO4I1Q83Fw4HbpnoJmcH92iuM6EoJRG9YjrO4gJhHQ3Po8PJ1xazpns1I2q?=
 =?us-ascii?Q?U8A3V+hkyUfi5N7l2OhhpXL6f6sb7lyftHj+FwzWM53cu108Actl5l3/h3sH?=
 =?us-ascii?Q?NJAH/vlAAmKirdAMIvtSiraxMdwOchZor9EKM42akSQDMVBKJNdO8TeUo1xn?=
 =?us-ascii?Q?TomeYy3Ih0Ws2U5GMZGvE+mLkCSEs/2tt8DBtnwNePLy3Tr0ssH30D0VLgW+?=
 =?us-ascii?Q?0lSywmZJ/6c791oNC6ONeanIAupmDPkVEsafg+hNYB6Om3pb27uWvgSTNO/5?=
 =?us-ascii?Q?CE8jJuhwNJ+c3Xli2FWHfpWWyRtirfWIntteL/tY1zFVXEPt8AKGLpQ3/c60?=
 =?us-ascii?Q?VbXlK/OtmHixaOLiOj3VQm7t82LW6Zx3KhPZW61UZm1i1CXU2DjRwUnC4CGH?=
 =?us-ascii?Q?c3aAU4AIlHTmAqzAc+cTG0pbHoRrlkG9ITVryqFGcgL/AbZMTXhO7XqBGi/E?=
 =?us-ascii?Q?uxI0c47DUGLKMVcTFUUt7y823kK04Kuu/UfGFG/80oBIeI1rTgu2ioWuajw4?=
 =?us-ascii?Q?EKPSAZmCJ4Ig5sJpyq+1sB/TCEEc++6EL1wwmlDqjSBrOgUGxqkcMKD4hpzG?=
 =?us-ascii?Q?a63I3q3tZWUARfhZ9+e2ewf76IY7fED59mIevbPETurPe8CtzIe0/qbRxSoU?=
 =?us-ascii?Q?qGouaZAX8eoWU+ji5I3mizTJhHsuefmEL8D72/1hhl/KEGf7LLyADlHfY5iw?=
 =?us-ascii?Q?gosQ2nnYk4rgVViydWJl0yAuWor5r0bGF01IVJlQkkaOW/BdKUE2EpSJ7oNj?=
 =?us-ascii?Q?YhpceKQQ+PHzfwNeuv1CvPY0kd41btWAzx3u6fBGeW2nRwJW8BvTzDXfcaSJ?=
 =?us-ascii?Q?b1b/ZsDi3mwp3PaH/0p429MfcZAfyL69c7vNbP8+GF826oNrJSWsQrJbswUq?=
 =?us-ascii?Q?hkzesIq3QoP67pWTIeFNRQarFDbb1Rv6ypOByLhdRdeqAgorDWplXkmGz+dn?=
 =?us-ascii?Q?ViRxZULljKqqYCGu0bA+zF/Wrk/x0W05co0DQSnFqfDui/Vv/ap3on8FhIHr?=
 =?us-ascii?Q?g797ubYX31dstjBgAu8nx2nlw7Fye8gISBpJyQoeOZG7h6HR9QJ9TlnB93v9?=
 =?us-ascii?Q?hOhIQH5F0z7fzqiadgGqc+U=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bNM6tMlS0r1S8/YqPNPacs4AM6YMwP/ZgJ1oHGGO76ja6NEQ2+CIMlJbNB/8?=
 =?us-ascii?Q?XvXZ/P4D2agkdj7Hqab2y4ChwxegRlKRed6y2qDdjHgJeAQGJVeGmS9X9s3w?=
 =?us-ascii?Q?JPBJxye8/XxFtII+pyzp0xofcau7BzPib6AHNDX9qHGle3w3Sw2qG76SHvuC?=
 =?us-ascii?Q?VM4WYT+6DVX9nyD5ricj0K4JkzbboFg8b45ZutWgIb/yGiYt8iTXTUAWMcPh?=
 =?us-ascii?Q?R7YfBvFePImsVzBTWDDAq7BEUjoFoKrNg9XIk0Zu7pKczKsc74YkwtFznH6z?=
 =?us-ascii?Q?I3GOaIZi+F8Jx4RweXmv3eOWqvgKXbOgqTp18f6bJ2bQA7ZGXC4/0M67uTpg?=
 =?us-ascii?Q?EcrdCspbNbr1WqZb+uATzSXV0KCFklCrR9BdNWwz98pJIogygffnRzd2NdLE?=
 =?us-ascii?Q?4TYxSLfE01WTmMYyGS8UtUAKSeeqaA8/Xam+rxuCVBfdBOx/RWmsnIjHjq4K?=
 =?us-ascii?Q?fSlNl9Cj61jsLBmy+tQUmq/Rlm/YfKWynFkdP2i0mdRig3MYZlciBHARBiZM?=
 =?us-ascii?Q?ZwXDJsnHm8WNGZO02LFGrfMq+i24B58W9IwlUmj9dz5yhZrYGSY1rEMNT5P0?=
 =?us-ascii?Q?O3ft58+CAEtIuRYVOPXctDKMJ7s/UOvDBiauv5qaKa3XX9zG1vXRUq6WnfHp?=
 =?us-ascii?Q?I0Gp3ySg0QbV569fdy393T7fYqJz0oNvph/KxKIpuRa/b7Ezs1s6Cj7r6lOR?=
 =?us-ascii?Q?9hb9pBMdJkBfcQAKrSugoGKydFzSosnt0rHlJbCJQTct50Oy4rsoTSZseJMp?=
 =?us-ascii?Q?OarAEmFl5feoklzH5iHAyWQys8NePgZPxu+COEuUEyBYtnE6OExJpOuXXLny?=
 =?us-ascii?Q?aO7yL0bCHdMqQpwSVzUrje49wRwqLTCjyujgG+48nd58dY7N4BI366dmIvDm?=
 =?us-ascii?Q?x2HRlyHQjnXH5OWE3WJmsulWtsjCjgCbY8udncMLP/t2zBAC/FW/HYxvabS1?=
 =?us-ascii?Q?ed6xBaJAPZ3xFlKqhQXcXsWX2veCDy/kg2w8ZQ5QMv7tWen75FZB7ZbrEXHz?=
 =?us-ascii?Q?mcUH8Ei8zMCfQ74JqMeGsAicUgVYzWp1L/80jXZLfox1lGE6D6iToyJSe45m?=
 =?us-ascii?Q?spJABA6UPSt5Ptz7qVdzNUNJ/AqUkD9GlnLQprUCkBq9jnOH6cNRoiFiYmhv?=
 =?us-ascii?Q?fD+PzCLd/vQSE3CJzY+2oONjqUwOnx+6zCW3xf40NNG7nLS82Y3WD7opF5kR?=
 =?us-ascii?Q?K+vXEeuniYAY/y/QolQPlV8Yp/Z6laxTx20MxmxqB9r6/GpGHH/wNa+kPrHD?=
 =?us-ascii?Q?+kyJaIW8lcE69SREg3y2utFPN6Oi/oKpl9RKiWr671iloTBYP0JvX70SR2EQ?=
 =?us-ascii?Q?xJ/9ZnaWK5XXRREaKZQK7SHJ8mvOiHTOBsxW6tnGsGXcDV926mK0MMXxijMn?=
 =?us-ascii?Q?eMzplV64LKILUIWsl/SIZH48UPM2s8B1hNYpfu2acgTEq5JaObU2z7/Zj7vQ?=
 =?us-ascii?Q?/0x4mhH9AMytCTcFrNsnCTxWp5ukdQUYgfVCZT2p7sRZmjIJ/uaya6R5ob/T?=
 =?us-ascii?Q?43ePJzrNGB0wxpFIO1VVN72w5vaYrLvh1xOYvbEtoVJZRjdkREsDnr8uWPkn?=
 =?us-ascii?Q?WCtvqPhrOs1HyDp6Yh5aVbAMSNUF3clexxkSv5bg0v+RRpN9yChdw5VsnfLs?=
 =?us-ascii?Q?grLeE3ohF1b7YZ7YsJfgdUckDBsFaps1lj5imaMRIDm+k1oRP3ws2mHETn2z?=
 =?us-ascii?Q?cHlc1a6Rg/C22zpUJhc0SBhPzZliPe3IWMYo34t8wAAFySJde3y0dVa53Owi?=
 =?us-ascii?Q?qPsmTU9GP+dhEGwstPHaAvuhvD3JaJI=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95ec525d-f617-4c0a-c740-08de6a62234e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 18:11:26.5834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TqLfVvCqj2Rev3KB8hKVw5AJTfFx6xFyejbjhpc3nD2cEJ0C8fZdJ9RwJtfr0JkDmF8YAwxuKjrVTaY5XAGC4pBXVuSgk+hdo0fNHdWgRUk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6928
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=Wb0BqkhX c=1 sm=1 tr=0 ts=698e17d1 cx=c_pps
 a=tl4IwOQKiBOeKWF7Rad3dg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=t7CeM3EgAAAA:8
 a=p_vdLtrgfc09iYJXKugA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: SnqqFy2zCPRHJJhxS9b1FHMNn31rIF7a
X-Proofpoint-GUID: _JEI8TyAvg-9yYV1ey4SpLBg1qtLYiTN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDE0MCBTYWx0ZWRfX2PCKReiZ0WY1
 TBd9gtj9bpOXyd0UDlOe9XqLKJFbT20W6VVbEFcoop1luMksW7CsplsEGqrAemnU9M5MmZ/tTDR
 LU3yq4TLICLmwe7zeuutgz56s+F0tzHlEKWfYLgWyRKFJNPNGWw1DtyA2B0tlo2dzmVNyGcaiF4
 zZBHKraEgXkTsOcY8bGd5xwQ+VW2DIiZ3gFEnHqclkQWkCE+PkPRBP1Ff2CveAQKwLCJ6x2Kkr/
 xnF4IFjiCkkGpvZkn1HkQ1bTgh4Rr1X6lRVjQAn8x8L68cPiHPIBII8jr29YGvzjH5cdvPK/0N/
 5jJhATlgs8tqxj2XOuIs3yD9Ml2v/BM4v5oURGc08+jU6ewcZL7mnNUEXv0G98TI4nejTJpgYpw
 ChD7+2iSfI7QizzHI8yQ+LUSNSQS0mXAiWNM3Vjj3/7FvJYNd9PzqBBfB9g2YJsee97oLc8UChF
 4+EKm69jUSBx31ZMtKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120140
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 18:11:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231065

From: Yoann Congal <yoann.congal@smile.fr>

This new case tests that the rust_mininal sample inside the kernel source
tree is buildable and works properly: check that the module can be
loaded and that it prints correctly.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 23 ++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index d58ffa80f5..fe9783e81d 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -481,3 +481,26 @@ IMAGE_INSTALL:append = " systemtap-runtime"
                 cmd = "crosstap -r root@192.168.7.2 -s %s/process/ syscalls_by_pid.stp" % systemtap_examples
                 result = runCmd(cmd)
                 self.assertEqual(0, result.status, 'crosstap  syscalls_by_pid returned a non 0 status:%s' % result.output)
+@OETestTag("runqemu")
+class RustKernel(OESelftestTestCase):
+        @classmethod
+        def setUpClass(cls):
+            super(RustKernel, cls).setUpClass()
+            cls.image = "core-image-minimal"
+
+        def test_kernel_rust_sample(self):
+            import textwrap
+            self.write_config(textwrap.dedent("""
+                KERNEL_RUST_SUPPORT = 'True'
+                KERNEL_EXTRA_FEATURES:append = ' features/kernel-sample/kernel-rust-sample.scc'
+                CORE_IMAGE_EXTRA_INSTALL += "kernel-module-rust-minimal"
+            """))
+            bitbake(self.image)
+
+            with runqemu(self.image, runqemuparams = "nographic") as qemu:
+                qemu.run_serial("dmesg -c > /dev/null")
+                status, _ = qemu.run_serial("modprobe rust_minimal")
+                self.assertEqual(status, 1, "Loading rust_minimal module failed!")
+                _, output = qemu.run_serial("dmesg")
+                self.logger.debug(f"rust_minimal dmesg output:\n" + textwrap.indent(output, "  "))
+                self.assertIn("Rust minimal sample", output, "Kernel Rust sample expected output not found in dmesg")
-- 
2.49.0


