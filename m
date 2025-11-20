Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8B30CF887F
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 15:27:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36875.1763652427363106337
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Nov 2025 07:27:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bfn6/WvH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=341909d004=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AKBF2kQ4183297
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 07:27:07 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=ayNLniGbmiJ1LpZX9z6JEM2wyrcEG/vfBxhdhRPHgvw=; b=
	bfn6/WvHkElDS1CUq68Vh2UC0tl2EgxvObabBvApAr8MwVItwqX795ZYCHIE9zd7
	tkadJbHMkIFT017RwnbD4/JFubXfYjhKNqOFT/qCJeysMUTUJgNf+IxrK7gQ7IXr
	3V/PY/meg6JsrqaYi/laJP3i2Gki8kW7oE1i2dG1GM5mPVY2ZHpITxu6A+6IXHPf
	sEiVjHhZoNlSvdUJcq+Lw7t3hXPERf4smrL3daNTzIiJazYshsgDmMezFr6b7jzT
	nLEkjCitsSkvLOBLTQ+hQXOA5Tt4AROBYQ6k61h7x8CVb15Z6Kq2Z8hcUDV9CSD8
	Kp6ve9b2TSnshbxZuiwXdg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010060.outbound.protection.outlook.com [52.101.85.60])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aeswjecsw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 07:27:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RnFKse/nH7PYn/gEZq2TTQV3KmVlhswIuyqeF8lKwkxSBmT8GIU50yEGGeCVgH6jYkTnnVInzoV3gRxbVQ9tLJl2lzGc19bWSx7HQRVXFGzfI869Rlayzj79j/X2cpSQhI8WlfJZHWZISngvmyFllZzt2D8QwdIBS1Z35z871OPAGIIuXHPhNb9sxnimsNZ0rTDN04Uyv2odeaDIduOgAjAKdglc6Qnn83P6TjUH/BwBEOIVNm8uwSBGJHIj9yJ/ye/n+kbU86E5QeyyiQml85OdbVQ+jrYKLEvfseRt+8dmQaHPePYEhwxW7qi8YAtE7fd1q0xN08sFLNWyoJ3xsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ayNLniGbmiJ1LpZX9z6JEM2wyrcEG/vfBxhdhRPHgvw=;
 b=gZtDk7NKhJTP3vdU3HLjNsRe06UhIlWby2w1RuokhOsW70o4fzE0ob3KApwBQ6NLyRuJ7qj2+35XVz0yrEOfGVbpIzv2qrPCfvW3gK8B1Vh5RixNX9DszTaqaXq34d0Igw08pNrhUoycG1QphdFap136zqyymGUXMW7GZ9KG0mt/pVR2tzmoAz7i7Q4AbGUmJHssUb/BbkfnOhq3aodD7JA02y/u7pWK/WjJWMLegUJ2CjFk74X0OtEcQMIRF2PRUx8ZtDsHw2YpRW5XyjNwcMjzBDZK/o50WXywHknRln/wat3FfUX5ZUYFTOFjP49nit+kMtHwWzHX24amwQxdAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MN2PR11MB4760.namprd11.prod.outlook.com (2603:10b6:208:266::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 15:27:04 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 15:27:04 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH RFC v4 03/11] rust: install Rust library sources for 'make rustavailable' support
Date: Thu, 20 Nov 2025 07:26:41 -0800
Message-ID: <20251120152649.1128685-4-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251120152649.1128685-1-Harish.Sadineni@windriver.com>
References: <20251120152649.1128685-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0161.namprd03.prod.outlook.com
 (2603:10b6:a03:338::16) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|MN2PR11MB4760:EE_
X-MS-Office365-Filtering-Correlation-Id: 90be2eef-ec72-46f8-51a8-08de2849425f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ylkykQkV1zx08sQ7VUM8BvkJs6F5VzxLSTNE8Fyn4WHG1ixn/I5tPfJpNhGv?=
 =?us-ascii?Q?4CLDvEm8wf2mGB7x3gsDbZPYSSED9urEORbYW2sZC9fW4LGHoUfOEq/pvlgX?=
 =?us-ascii?Q?PBXaMh4rF+7OgmKH390z6CZfYlnvWGpS4ECKMvJBAeMv5HOObwwRD11/H/89?=
 =?us-ascii?Q?Wjom7ILuZHl1gIuu0CUbGrxuHS/RMpqjNuke1O7miCDbOrK1fwmnJrREvXJ1?=
 =?us-ascii?Q?oduNrJUKwzeuz3LW5hvgKxXpTK8L8cW8iUonrmYA4NY5r6CxoUe/t0QavfWo?=
 =?us-ascii?Q?tATUB4Mv7yC8q6UI6Nc3NR2jlXzmlNlx1Gn7UsNsiP35TT7toZcHH27AJhos?=
 =?us-ascii?Q?2lKx/lxtyt3tU9LKDTnbJJmKFtdpxNa/pMZqXBvkTM8HlJqTOGERZLPCorAo?=
 =?us-ascii?Q?1BwyIv0MK9wzazNYiVB+NQdjXaCZTskxmNZuQZCpkUaDngm9FsH7immsVJOk?=
 =?us-ascii?Q?YympqKjokSTXtVjg55y79s92mkzjKXGSNrFlSCSlEebJm/EB/lNztDKk7Qa5?=
 =?us-ascii?Q?Jz6ZM2Fdhv8QNDuK/iJne+WRdEeQzMW8aM2Xx2LtjRlRf4DYOyG+lhiV+2Ka?=
 =?us-ascii?Q?XLS4cIfl4JmsJtoFwU7iItZ21cdI4wr2mBrPXocJKYagltgxh9X3eUicloNE?=
 =?us-ascii?Q?NvKfiuFhg/fUoqkSh3/eLzJnrbSLojulz3Hhm+RiHaAgjqL5IQ2EjEngwrA+?=
 =?us-ascii?Q?hsuGq37Qfl3Mta4vEYSq/GKD9AYNZ9YVPSylvnI2kjcyFzwDGkIhWX7KH9vN?=
 =?us-ascii?Q?7UYkVnBaSDDM/Gw31aKVLBnUTijz6vljHesfYw6LK0ByJnXudrCYvcB0OQfT?=
 =?us-ascii?Q?RlZTp0lyk2BmmbWBWmHpiSwtVuU3ya7gyBtzw/IWrumaxjR/JfkCbUj+/6pT?=
 =?us-ascii?Q?XTFw/xZISdcpBpDFKleroA7fKTstle2Q1dT0QvLvAGNrOPEIT4cG0pOlVc/H?=
 =?us-ascii?Q?3jbQ1w0hQmU8F52Rc4KgXnqWUtO0OhwjjZCkovkfWNhi+qM5LnkRzEQ05NG2?=
 =?us-ascii?Q?rORdgwwWT5GBVGmZL66cIFR4JmsmOHSeAZ8Jkaqd+zLnMusZCnsiUM3Rq/mD?=
 =?us-ascii?Q?SqaTXxJq0/8QL1VaIX2kypl7vBAw/OKjkZuX39XV45ZVhk3lRvu8LXYQ1SBx?=
 =?us-ascii?Q?xxeSkI6WVtRpDpaUxXjhITw6m3VTboOCumlkzHdzJ+LUw2qBLHZXPVkVGO3/?=
 =?us-ascii?Q?pth256ql3D+2/XT/M3nQtJJZ7d9soIUu7sDp25e+VS89BeSryG0Fc2Febp2X?=
 =?us-ascii?Q?1zHokav+TdIkY9WEPakPpsfi1ApExs/WE1/FodoVFH6/9BVkfsCHEl+x2pl7?=
 =?us-ascii?Q?QjePd8KXP+MuGUtrvFQZfw4MP9DMWRRH/56eQrUTWlJQXj2AYJ/rQzHDU4F6?=
 =?us-ascii?Q?5htWv1dHv8I67QFUrQaLFAyPwNCB/NPwYR6/ySLMC/oroB4vreZz/br2b2D0?=
 =?us-ascii?Q?v7aIrnxNqEAIHvG4BxsqHSN5O3q/giwnHYTfk9dZcLYWo+NNslv4JD4SEP52?=
 =?us-ascii?Q?bkzqmI1Wkc3LH6GHYfjf/7cYMe3zVopihSbg?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PPQqp9COH1bp59503zaGH3K71gc0nv7alBDLzkDLz6r8MsMOeW9p8tbLCrrD?=
 =?us-ascii?Q?PTBK7eu/O1VmHmoWM1feJ3goML0w6CrGPJspumUvxkXkR9Biw/feHnnUB4u+?=
 =?us-ascii?Q?a2Dy5qTfa5AsNrGAVqu7oEpEgozH82b+3MX1grmJc9rHfUepKHGBVFB2hkGs?=
 =?us-ascii?Q?uOfQv4VmsihQVSUfyoj0hae7wfhuMBH9pLb8Euz4tIDAZLsRQI5c15ViGpWF?=
 =?us-ascii?Q?me0XzNBa4JdCCJ9mtRtGoqhJzHYq9Fn9Fyn4YBgfuhR4ndT1R6STNyS+3sdH?=
 =?us-ascii?Q?+F1Dxa6RE5YOVb2pwuOhPLhmb1hs74d9j/qhoFF9gnCkyjupv7IwrIxf5P2/?=
 =?us-ascii?Q?HYLuP+IN9UJWS7PcTZv9cbEUnCbKjMuTmIuyYnom2hT/iq33NteYQq6ClPel?=
 =?us-ascii?Q?cHF9UTJbbJOGHnVzLJ1EbRXn6xBZAF2IbcGN1BvjFPFRgqRFqZvoKsDdsqPj?=
 =?us-ascii?Q?QFf2hKd1thQGuzfsVJgD44Bsp2oe99I/5gUcKZY+PydlKymiYLWK4Od9AJ+c?=
 =?us-ascii?Q?VMLy8/Ll2aVTLbUN2eaTsYlhpuiXN+EIwgPRRgCfkImtDcCHAbDNBrK9/pCo?=
 =?us-ascii?Q?v/Mdg6s5T7I7JeI3FHh6mMVf6TzMeAnNQg8owiLk6TIvnbO98ES7noOx8DgT?=
 =?us-ascii?Q?E/d+G/7WCQW3yg6RTtEsbmd/1uO0Wlc+lSNZFptThGdUiJP3bR+uBxO0jvh+?=
 =?us-ascii?Q?8hkTCVR2sevhwB09myw9OfAIurlpKuLW/GPfd3sJk7pXnsFJAMFMcV4Yk3ga?=
 =?us-ascii?Q?7Mwp1Fv8RJUEldzSgpZ8m7Cva63jj2DV0Cw4BJas83HV2aVu65iJRSufN3o4?=
 =?us-ascii?Q?h7modF4Y4mJRyKfHcK908+mkmcjkahc4nXyNpZmxSxyzLlG9ng8pG3x4XKqz?=
 =?us-ascii?Q?HQKI0LLbSISWBp/v0zRNh0YjWdUwH1jaea6skx+66nKLkONaxi/iol7K9Mz6?=
 =?us-ascii?Q?BhJD+Xf75Os0mVtJWjdIvJoPMwuX6rU8Uk/9zcyZ2RTg9lMFwzCOGMjRkurh?=
 =?us-ascii?Q?8sw9CfIkquwbHoQmgp1ePgV+szRU3Pyan73fZFS1gzCz48KrsQO1loDUEvSk?=
 =?us-ascii?Q?rz0hXTNUpR0Zt6yhbYLzOd5IwE9texBLnOfYRs65pVgAx/TCPbB1xJDPBIX7?=
 =?us-ascii?Q?PyOi1Yh8ht0DLTxhfUtiEIWoHmu6Fw8t5kcJHlAnIeTnO7JO7F5zJKaxMdQ7?=
 =?us-ascii?Q?SGFEDJ8o99uKrxpvclWky8GurP3QPHLCVROX254dBcu2fnYVsfAMF7DK+/ZG?=
 =?us-ascii?Q?475Bf/o0BNyygej4/CBqM4DArTQZBd+GUvXtrdgyRmgSV6urpmlUeSAlMAPy?=
 =?us-ascii?Q?c4PL2zKbd8V7O9slbegxMXqchfmSV8VKp2xEM7ahMCLBhO5ayWXwOjHsap4J?=
 =?us-ascii?Q?zIEMjhFK7CnQLYB1T+GNbcoSB7ItZzlnrEtCgkblNW9b/OZA3KZZzwiqeoLw?=
 =?us-ascii?Q?IcJn4+eNKF9c3Dy7fTTVRA9KiV8/O4tOJtAywC3h7o4Fs0iMp4/QSNsh6/zo?=
 =?us-ascii?Q?34p6Olj+5Lk2ZR7pns3s+2E0RVRB1MdnTWQtGBUnScoS/FmrlaiKd9W74ysp?=
 =?us-ascii?Q?TogsKca8EGskuCW/7wp39zJQ+WEem7/VI97XqzOk9H/g7vk+Jm3rOaZ1gcbc?=
 =?us-ascii?Q?h6D4u/udjBDTAZVSZXumNJ8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90be2eef-ec72-46f8-51a8-08de2849425f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 15:27:04.5293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IG+UJaCvdZGwVxJXWvmEFNKzK63KBHymd1X3qewxc4PiWLS/a6+J3pxz8PPbgFnhoBwXO9Qjji1nE1bVWYQNZ97/WSAyQsZqD5bkdCla0mg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4760
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=BqiQAIX5 c=1 sm=1 tr=0 ts=691f334a cx=c_pps
 a=tP1g6Cq6k527JP85+VkTLg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=QeMy5WPdU9dpobuweN8A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: d_HV5Isem8Opft81GOUKMm3YrECc_NXs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDEwMSBTYWx0ZWRfX0bbkfcPZYsMU
 6lKqv2QS/jSwj05VP0zkukcHpcyDylTQLhQuTe9MalYsbLQkWnoq/WIsEtbD7nXgKyDvJnRQa1W
 R6pGMPjG5sGXmjSnj/u9bu31QBd90hH1SttARM7i7hVWWCwmhZZsleQtxtsrWuzqUUgz7b8+XcP
 cEhL884Nih2EHodsb8iBmNMQLYtZWUVGjUHn9nBJ3KN9kse7XfoH9Kar1WcW7kuByA1xez09vpG
 4C/V/SwPeVJ8EGnjP/HEJqmanuh+F80+CYHF1QT4j0LbvZB0TYZqY/RENMSgPMtzY3PM31a5ubw
 rOG1DZT9m3m/euGajtNfaxgHokX97Kpa2IfPXl59DT20VXt2vMGC/jxFV/UXDI6NgwaReIWKOEe
 T9gehc95pyJ62CxIk2uH4DCQ2SadrQ==
X-Proofpoint-ORIG-GUID: UmE8cPlyzXME-4V_yM6SzYhy-wrbI5Cp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_05,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511200101
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 15:27:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226626

From: Harish Sadineni <Harish.Sadineni@windriver.com>

The `make rustavailable` process (1) expects the Rust standard library source files (e.g., `lib.rs`)
to be present in the `library/` directory under `rustlib/src/rust/`.

This patch ensures the required sources are available by:
- Copying the `library/` directory from the Rust source tree into `${TMPDIR}/work-shared/rust`
  during the snapshot setup.
- Installing the `library/` directory into `${SDKPATHNATIVE}/usr/lib/rustlib/src/rust` for the
  `nativesdk` class, making them available in them available in sdk

1) See the kernel tree for Documentation/rust/quick-start.rst in the section: Requirements: Building

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/rust/quick-start.rst#n145

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/rust/rust_1.90.0.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust_1.90.0.bb b/meta/recipes-devtools/rust/rust_1.90.0.bb
index e7f3985332..f4cd2b923e 100644
--- a/meta/recipes-devtools/rust/rust_1.90.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.90.0.bb
@@ -63,6 +63,16 @@ do_rust_setup_snapshot () {
         done
     fi
 }
+
+do_rust_setup_snapshot:append:class-native () {
+   if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true', 'false', d)}; then
+         if [ ! -d "${TMPDIR}/work-shared/rust" ]; then
+                mkdir -p ${TMPDIR}/work-shared/rust
+                cp -r ${RUSTSRC}/library ${TMPDIR}/work-shared/rust/.
+         fi
+   fi
+}
+
 addtask rust_setup_snapshot after do_unpack before do_configure
 addtask do_test_compile after do_configure do_rust_gen_targets
 do_rust_setup_snapshot[dirs] += "${WORKDIR}/rust-snapshot"
@@ -314,6 +324,13 @@ rust_do_install:class-nativesdk() {
 	export CARGO_TARGET_${RUST_HOST_TRIPLE}_RUNNER="\$OECORE_NATIVE_SYSROOT/lib/${SDKLOADER}"
 	export CC_$RUST_HOST_CC="${CCACHE}${HOST_PREFIX}gcc"
 	EOF
+    
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true', 'false', d)}; then
+           if [ ! -d ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust ]; then
+                mkdir -p ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust
+                cp -r --no-preserve=ownership  ${S}/library ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust/
+           fi
+    fi
 }
 
 FILES:${PN} += "${base_prefix}/environment-setup.d"
-- 
2.49.0


