Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C942DD2628A
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 18:31:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13357.1768933903984713990
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 10:31:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JsE8dkKI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=548098e00b=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K5l4vU2987979
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 18:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=JJrNqodWE9dyJ+OIo4LC/HoBNcwN316le+KBjoZwfrE=; b=
	JsE8dkKIK6RPAb5hpR0Qfj7HXfBYscflu+nxmMyVCLZxQjPVGrQ8kiw9tX20ZqiI
	zuWDzQxu+++qYyyvIY11vmr7uGJ3EYucYquOIIK0akxyXm8g2UJeMlUXS+YQ2FV+
	l4FCqYo0PpubjtaWzaxvkBOphlsB1Y30ZmXPp8iWL+4PeqeZ+CNoWQMk6nAU9E8h
	EVO//yu+7WNHNpU3of3F85xaSeoNS8LLMZ7AFtwkLeyZnjAv3SdjZPuNqHfZc9I0
	/9lMu9jHp33YMELbD0hsH5nPL08LGSQNaCljM+OKIJt6a8FjL95uSUJ4XlJICC/D
	/sCRzYsgEeVGN0ngpFYfzQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010035.outbound.protection.outlook.com [52.101.201.35])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bqymukh03-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 18:31:42 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g8fM3xj7Htfg9mMcjZaujyaP/2It3pY7Yd9+tTx/wT9uCf1sAlDUzQAmO0AqKFGegMYBXA5snUCGTtOEZKZkB1FR3jK+WL6lKLGXXG5qowwZmCpWPNbCxaFl/IGTBeUBxZMwA/V1kHOGkk+RAWAObyjLqga57jswC+aRi6JnLZbrvOaM/YGiAs2IJGOdylQ7xbnDLZ4uxv+mRC6Y3R9BRDVJ/5MnPIqfoAn1FzVgX4Rp0qIxExtdfPegqZWhKEpOV1HX4fPp2vPXd/w1bx7JdknUCdw96e/ldb9fT6ZRNnDaNCMclxWn7j+gMlqOzYjFzsMwv5+WX4Rw545g4ELP3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJrNqodWE9dyJ+OIo4LC/HoBNcwN316le+KBjoZwfrE=;
 b=PlrSqRoFziC+Ue++afML4GU0pdU3s2muj0uYrQQgoDhEL1TAFLPXRPQYgTyMdqVlu6x8fxNEZj/ahIu+esVS192GeGX8uAkCIHQw87GSuT3/Hm1eYI75totpocIADxdmWuPbOcu0QntFgLSqokH4ttb3Umkkt976ose1vX7GXHM5zU2B7Bg/Pq8j5nHqizWo0SqQ1z0OJrlYxFGxix+pw8dbsYd8UFAq1/LybWn+Smiv0NRcDAyxIs7LROHF/HAooxVlDF4M7bcIuH8SrMcZniAZxiOWd2UxDcR2OcnrcRlh3HxcipjE/eHoOWviMTZGRhUFdIRK/0e1iaqZ58hZmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MN2PR11MB4741.namprd11.prod.outlook.com (2603:10b6:208:26a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 18:31:37 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 18:31:37 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, alistair.francis@wdc.com,
        Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com,
        richard.purdie@linuxfoundation.org, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v4 12/16] kernel.bbclass: Export artifacts needed for out-of-tree Rust compilation
Date: Tue, 20 Jan 2026 10:29:43 -0800
Message-ID: <20260120182947.857242-13-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260120182947.857242-1-Harish.Sadineni@windriver.com>
References: <20260120182947.857242-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0146.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::31) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|MN2PR11MB4741:EE_
X-MS-Office365-Filtering-Correlation-Id: e9207d1a-8b9a-4055-3e55-08de58522536
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?sUDy5SfJ6ddRZsTa5JUhSLkfEpAwbcuk9grlDEmx29tVdhSSew/UpVR7E6f+?=
 =?us-ascii?Q?RFXeCRAiDfcknWYLrsmtkxsP9//LfXuEUrKtj8vY6WgqWhqFtqfnoKwWoAJT?=
 =?us-ascii?Q?gVTwmGzA70xpEJrmnt2SjIveXS+XVBh3V2X2ZfEiZ/uzN90MdL0AuEu30RIu?=
 =?us-ascii?Q?Kj70X/k2dl1iTyeCuh4bIr8NMbcbD8eLjZPAVOl6EwCgO8R6I0hA6BGmBhTf?=
 =?us-ascii?Q?PcrUi9fJ2SuFoZlbKPTH6b1A1NitQ9lmiQf6CYaicNNm4GUdTF+crD7ZD1ya?=
 =?us-ascii?Q?Tpj1oJoN2zv1L4R4EPArQzsjKZY4V+Xk82Ww4nD4Y9R9sqCZ7tUdV256jF7F?=
 =?us-ascii?Q?NWJPYe9HlHT69YYQcQMfaSXF6eSNhBRU8XuXeZwQ1h3iKzSJpayv25Jo4GFc?=
 =?us-ascii?Q?raxhE9zKjCr9uSAnseqoPUCZPBy+A2qBwIw10SLtEuOmxh0Bw7YNsuk3t/2L?=
 =?us-ascii?Q?ZSZclaIe5Qw5i/ickiA3BNQH+UjiBAquLi4g/HxGWWvBJ/7XG9Jg4wlfI30U?=
 =?us-ascii?Q?yndg+djTwzDoXmc93fuy6ZilHURNJYqNYs9qEfrsvy3M7hYZVvX7uz7JbX0e?=
 =?us-ascii?Q?DXbNSbJniVuZMF0iEhfHKPc/7CugRU+EFfKO2suguQYUeE32dcEvzzV/CA98?=
 =?us-ascii?Q?dsDpo5ajHM9w9zwGPRISLIJ8AbqNoirC538ZSlRBRZfU4oW9tQumwmpqDsGs?=
 =?us-ascii?Q?p8EeLd+x6a4iMasVmsxxMcIsqg1js6oEHkz7huHbJPObvoPToG0Byog9nJnd?=
 =?us-ascii?Q?A/xvwOmbswQI0kx3K1qqE0Kbxhe744K7MPmAvGOYT9OlTIqd5sFWU2jg7QHi?=
 =?us-ascii?Q?Bs0TL4AevHmgOL90Sia3r5F5qHCKqoS9MBbl0q3J9R5NbGA6NVw8nljHLgOK?=
 =?us-ascii?Q?K/Eq4ZWsH78FGZcig/g+Bl/itTX8KoFdh5vqgYo0bvqMUfVaoH9ylHYHaihG?=
 =?us-ascii?Q?iKdevTMj5vBLgwdSbrygLSXMaKu/KfJ9TtDO36h63rueb7ngtA+4ffWnM3TO?=
 =?us-ascii?Q?PGLTIQNEqO86kYh1XWdLwgxfgbXq1Zt76sN8C3TytPyB6BHiHCD/qQZu7jr5?=
 =?us-ascii?Q?37BtkOf8v2H6TlPtYzOrIjFCOPf8NpwBu5OyFs6a5mOEZvkRfCcjwk4t/6qp?=
 =?us-ascii?Q?PjYZJOFvKoQ74uuF8dHAElAHrlDgt6EjYFp5E7HCJ//RBzskt0sqAsBSkXxt?=
 =?us-ascii?Q?+MZFQqIvrvEMX+D1+HNEh3kPayeedXphJaA5bt6+blgSR6jdrdrDXnOZy+cN?=
 =?us-ascii?Q?Vat4PTvgJMIfa2yNF0ekE4AEbbabsS4dJp2lyFEGQgI0oM7I0hABRIjOHx8D?=
 =?us-ascii?Q?581yi0eBMCwlNtRzCJN7FQhZnjcrQc5YDo75H6AMUILeWLOQFjiT1yNkQWI3?=
 =?us-ascii?Q?wHGc7ocO9CtCgSKIBeeK8ogQJX9/d5wgFujetAugNBa6pDiO8oOH+8s3GFbt?=
 =?us-ascii?Q?eOWRKU7BadocMu229W5Ff9JmjRIuX4maEcooW2bAzQNvckhjqWWVl50lSx+s?=
 =?us-ascii?Q?DpugybDVF1pr8Iceb38m1KCweGdU/ur0sOUbcvkIF0dPQ46QTrOD7NkRd+H0?=
 =?us-ascii?Q?Js3OWAGMOR3rnq6uxKNTHpuynmxdWCdjSwCZRuujEGdJSkpx8sFVPtyALRSK?=
 =?us-ascii?Q?CCvrwSx5YZvKY/6qIEJ0M8k=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?p/m1ebSd9h8zzhw2wvQKQy0MSH4M/nOMuEtK+vEozwERNxXnO9P7DPhwWg/w?=
 =?us-ascii?Q?g4QUZWIsRA2+eXf1Ce3lT8HfD4+DLpYA18XaXq/d2VZqF5jHffmWTfEpfpU0?=
 =?us-ascii?Q?VBGHJiGrcSynHdO+0yTBpJYzlybyVCiTurwqkRpw7IfTYAPDtMxph+Kuq5jg?=
 =?us-ascii?Q?zwX5U2SnEMTCGmJ786sXUnqSENNCNZrz+d6hJkF0DkldZG23qHhsthb1r9gp?=
 =?us-ascii?Q?wXjn1N/7DaobkKxc5R/lheePewPLkyndJrRPd+AiYPiAt0Gv2Ga8st/46ubI?=
 =?us-ascii?Q?OJQbrpknljjk1H3ZQf/oGSbtRkngen8/5apGOl5/LeWpvzyzdFo5n5cpQJeQ?=
 =?us-ascii?Q?0TditQelcNPUuMqdh0z7bllGLy0DX3CTYBSXtIhmKouGrItwXDTZxLjScD+q?=
 =?us-ascii?Q?zheb4HBYsnTh3U+rvGrQ2iiGviz6l8gz1Yqdex43q+ySYf+fFLBzomQvIHOU?=
 =?us-ascii?Q?bIl+5F9bTmd7mOoldSaQUMXNm9E2Q8gZWWNgoYdI4pF+fypYQJN0HKsgsp3H?=
 =?us-ascii?Q?6Xsl7KwH0qUmjcZ690YNYv9gLxyec2HTLY58bUtuW7GZbAFDQmSk/sUuSKT6?=
 =?us-ascii?Q?dkPVU5Opp83pR00AbzzLnwqyXwirQELvkphxW2gYzlaDHt10O37UtxlwWyHt?=
 =?us-ascii?Q?bOdzhP4ZD3lytz+4xUxWeTP9kCKh6iQJqSJC1JyZtlkQiY/z+LMZonLlrlPR?=
 =?us-ascii?Q?lMyfxrB1asuQScaWf7mPYbxQPbOG1krxX11wG637fZp/fPKNNXXwTQgfQkvP?=
 =?us-ascii?Q?9OG7R4yEnz7d09AncF4mMVGg6sEXav1MuywQFj5RSNPdh2ni+yaexnDani5l?=
 =?us-ascii?Q?LIl9K1XRAZcyYoQyPqggdzFecXYKOuvpf2asxn1kLRqkN85zogSCw/as5n31?=
 =?us-ascii?Q?mfer7OQgbpuFKqfmZiJB0Ww4j7bj5Q9Xv9bxtkB3FtE0rqhwkBhQN1oRXjWd?=
 =?us-ascii?Q?3G40GPvGhUIrGza6Vmn9tmXNE2vR/s51nphgnjpEnJlDxXF2lALQzLZSScBO?=
 =?us-ascii?Q?9OfWHbjtq4owk+ZHIPe/U8Bl4e/a9T2RYaKAnrX5BpJ7Aksqa8iw0zAhILXP?=
 =?us-ascii?Q?osb7wKACHFBjUp/71sriTHcHsBCBIjn/34nhqpMi6t9gZyq/VmJuZyg+ejEW?=
 =?us-ascii?Q?6NZon1ztmNr50ksNwZ2u6dYQE2b4WpTj5C62UhdMKb2X8/FIY39qfWjNPBkd?=
 =?us-ascii?Q?yDlMwY8/5AgFv4szKDisHfSoYs3w0EYa35rUjnPPJZq2HuWWnxtCn4LZUgwE?=
 =?us-ascii?Q?ZK9+EX2dKaB9I9Mw9A/qukrGwdRU4KvmiWGsD1IZIZP1z1PVP8TZDuhoyoX6?=
 =?us-ascii?Q?nfAJXOlw0D8tnawsegvXTX5blTMeeBAE/gAXLeTkrCC0vQa/OKJH0lOnphiG?=
 =?us-ascii?Q?mxgqVcfPiCTpRgLa2Jt798zzclujFObeDQp6RngDSvMceqdTCCiHkiREV4vd?=
 =?us-ascii?Q?rWHCA9A6QNZPGl9VFdbTjhIgBivEjHEpsqktKfrcziBaE9RuceDWL7xiOwNp?=
 =?us-ascii?Q?fNXT05vGvEq/l/M9kFeAxWnvZbBMQENp+VcJGbue/nn/UlOpE8Jqzo0HWKkl?=
 =?us-ascii?Q?Z3JMNZP1Y7t8Rb/UmtDMi2RFfGd1nOucmXHpgjXKT1ruNvK1emXjZHQTbA5R?=
 =?us-ascii?Q?UvtXCsOi/ZFTCJEQAIVmYiqq8yoWEncYqkDesEyDDdCQTdjwY+4gp9mCTxae?=
 =?us-ascii?Q?2LO69n8pcx3gWLK5bowRGVU3nzpOuVpLCpsETa5ltaytIx6yA1BWll/5s2Fr?=
 =?us-ascii?Q?LwKamEq5RiRNnQZL8QkQ8inF52kfbww=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9207d1a-8b9a-4055-3e55-08de58522536
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 18:31:36.9433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1H5mDMaG9NgJT8SsuHnvuqO1qJ36r3jGjT4eq0cAE+dtPLYugkcrvUXx33tp6Zj2+Ag+mZaBJIrebA5gOH4dy8KQQNqfVKAnXfCxm+ox7s4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4741
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=AqDjHe9P c=1 sm=1 tr=0 ts=696fca0e cx=c_pps
 a=gTn3qzDU66SAkKtIq75K5w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=AXdspKuNlVAGVjIo0CMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: YXaRtxTXwFhy2P3kYmX-cmEtCK1YQ3QO
X-Proofpoint-ORIG-GUID: BWxTCH-II6peLS8Yf8qaeBifa09h_Ayj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE1NCBTYWx0ZWRfX7vJqFpXbJhRm
 QxWQT33/zgARnJrOVEk/OkoVTwrlRkSrI3TRkYVosZ7TtjtedVT+tVz/41Jkc0QqBYZQR+JN+Gt
 zeB4yD85+5nspXyC0KtqywBhdpTeVWKwEPlYq+TFJkHiPCNigGrtIbFN6pt3Z5UeiKyrtOSlKq2
 b2h/C/9BH2+6OVWr0MlVx7ewArmNE+4Bd6Sa59XsighVV2UId6apfjslDzwn9QbRNm1IDyw2bFY
 491jSuALZMOvHC79hSEEUSYKB3pXlznTIkbbskMYopMxGILFEZajWOyqbzN3RA2KF8lm7W85Ixo
 NtMT7JzzXbdjvieePhOL3X3G44hjSzTG9E+fTpMQozuY7czCOQyT8C3JRdCgxoHGV7ZuHFTSeU5
 cW0gsMZZ41y44ei+cjveYWN6IErgKBvEBl9Bj7fouXABSFd9OaWdsQ8lg0xrilUZvIMm6+4Vip3
 Zr5LMyrxOfV4LenEfQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_05,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200154
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 18:31:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229779

From: Yoann Congal <yoann.congal@smile.fr>

Publish artifacts from kernel compilation to allow out-of-tree Rust
compilation:
* scripts/target.json: target definition: architecture, ABI, compiler
  options, ...
* rust/: the crates compiled by the kernel available to
  out-of-tree-modules

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel.bbclass | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 30a10b0801..dfb8604a68 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -632,6 +632,24 @@ do_shared_workdir () {
 		cp -r scripts/gcc-plugins ${kerneldir}/scripts
 	fi
 
+	if ${@bb.utils.contains("DISTRO_FEATURES", "rust-kernel", "true", "false", d)}; then
+		# Copy target.json file needed for out-of-tree rust modules
+		if [ -e scripts/target.json ]; then
+			bbnote "Copying scripts/target.json"
+			mkdir -p ${kerneldir}/scripts
+			cp scripts/target.json ${kerneldir}/scripts
+		else
+			bbwarn "scripts/target.json not found in compiled kernel. Out-of-tree rust modules will fail to build."
+		fi
+
+		# Copy rust/ needed by out-of-tree module (firstly for the core rust crate)
+		if [ -e rust/ ]; then
+			bbnote "Copying rust/"
+			cp -r rust ${kerneldir}/
+		else
+			bbwarn "rust/ not found in compiled kernel. Out-of-tree rust modules will fail to build."
+		fi
+	fi
 }
 
 # We don't need to stage anything, not the modules/firmware since those would clash with linux-firmware
-- 
2.49.0


