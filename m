Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6410ECA5FD3
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 17:54:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12475.1768931677247177904
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 09:54:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=apDC6QxC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=548098e00b=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K4i75c3823849
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 09:54:37 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=DQqyLIP6r5DuXj6u8HBgcjE0zoaPxXTO2xQ2SFmbB1w=; b=
	apDC6QxCtf77Yvbp1gePho7oYHSokOG3C+dFbpKI1Rm1M1eoprycpmZpijZVtyQj
	HGYZ0asRhP9thIFcvPb/Qd2xpNkaIX2X01yold3RPbWb2hSmUP93CnnxpfenrLSS
	ExtgV86dS2DZKXQs0o02am8Yw4dc8aHRKoOfOZtOJMRwJ1vD4lx70FBgRRqBtIEk
	2sPoePmnU0wmj4eMh9h/yepWT6FA/CJAgNSscCawvMgxh1q9QkG4QtrI5fb9/rb7
	N1nZoy3jj0jcNBADQnXrAXoC3Wxuq6ZGQQnmOG/w/cSoTHh8t52c88iklETZdzHR
	W4vigI86KgDKEFFGkZbcDQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011064.outbound.protection.outlook.com [40.93.194.64])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4br6k1k663-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 09:54:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eMCW2QBMz+MjQpnKooIGrXhLnh+XjnemtZJv+bkb99SiHM8WVzmkh+8J5WhM9kEwmohp5Ck8XTiOEs1NYkiaxiP7MRWoma71C7QtcAFGPZ8ZOKgtBnnl5JkRbAfKMzOrROOJuryVfTz6Bru1g5ckhLMHI4Y1oMwsv7uWQsCe+c0hfr4bTbithVea+1UvLS8E1fi/DfBXuRzZzMMwgxhuYVx1vqGBLvwqNbsXiL6K9QmGF+R33cnqidyNqNpGlIcYbL1sBeKp43RhvAU1nlxCvRJP0F524daMWhhDnTN9JWI4dicUjdL/geo5v/nvv/uytLe6xxwfYH2QZWumuyGnWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQqyLIP6r5DuXj6u8HBgcjE0zoaPxXTO2xQ2SFmbB1w=;
 b=oALXQyFd1AvFtvXZBvat7KZDpDuEgopylh06/JR/YfJo11iD4FDeURYFo2dbubZLamIHxOaaF+MX9YdNoIaENwvGwDdOAW0i76h7g1Dkmk0RUijPWQbY+IOz0fhWDyJbttTQUUeTRxu5N6sgw7f5888B8XNroKS5x4rMQe4aGzfnJswtVLA/4Gi1/BTi8eV1v+FAI0LzJXbsNUrRvEUC77/GNDMYXJKVcT7BvC/W0DvZ82mtBa9blOJQEKUJQDXw/5+Y+UYfYr24eG0Dw4sF6l3h7CXmZY8I5tCYvjaFUe/y63QrR/ZmdUiJDO9yM4GZSxnbXXLbv0zxjv9ekyhwmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by BL1PR11MB6027.namprd11.prod.outlook.com (2603:10b6:208:392::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 17:54:34 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 17:54:34 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, alistair.francis@wdc.com,
        Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com,
        richard.purdie@linuxfoundation.org, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v3 13/16] module.bbclass: Prepare out-of-tree rust module compilation
Date: Tue, 20 Jan 2026 09:52:43 -0800
Message-ID: <20260120175246.2052341-14-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260120175246.2052341-1-Harish.Sadineni@windriver.com>
References: <20260120175246.2052341-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0289.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::24) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|BL1PR11MB6027:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c4dc9e5-eda0-4241-026d-08de584cf8a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VdMk5A4xM17oOUuvqacESgKoEwOEIjCdOe638rV7vAvG8WEslpmIcALN8Xio?=
 =?us-ascii?Q?Iy5hkIKQ0Fsqpx5CyJyzCLDdh08kbhEljg1wbFoH5ijXlCKruu51FA/fGnew?=
 =?us-ascii?Q?JEiee7WxOJ8jrt9IrGbVMIi4OBjGIOfR2p28iqQj6blTBOBQCBFOM6FO0Dp5?=
 =?us-ascii?Q?NBaZbugDN/5eN7dTwoQfnD0rpPfdw4ZHI8ltqDOIgFpfnuNkPzswi5i3aRzu?=
 =?us-ascii?Q?wQPEDw7O4Gqi1M6RzY7BYgoCLfAX8C6N1kBR+Nbxk7HKRLaykquF/RNEs4op?=
 =?us-ascii?Q?GiyhKEcIOdhGb+TCy24XgnKzWVaB25thwz5nnJjeq4hhamM2i0vKIgfH2nT0?=
 =?us-ascii?Q?pYmytjVmG9IOLBBbrnwafI+bYKNpXvdxLOFMQjIJJhy7pJRB1cVlr14McllY?=
 =?us-ascii?Q?USVW6f8+vOpQTG5k3WZ41OARsHwgWUmnHAmhVzmp+phE2kjw8Dhb/YoMjydt?=
 =?us-ascii?Q?nHzrz9wBte++gLzos3PZV0c8C2yrYKGGqGsAwTCBQhBRTmFjJHzHXLr4wU30?=
 =?us-ascii?Q?dwmSug4A7qDdHZugB6jYk+TfeqKYFmtRUx/Cz11z+UwhZ+s4GkMyx0zF82qE?=
 =?us-ascii?Q?9g2rUzxQUlBuBEb9Gz/cV3w+BuzLtevqUMul3OG2XBnJMpbM/Hno7FtHLNBU?=
 =?us-ascii?Q?FhyRGwIVS81kOCeLr5Io5YYHXNcv3s78AQA681huHzt0T4BOskH3amSGWA3p?=
 =?us-ascii?Q?6LxD27hd073d7oHOWfB3kXLElQ1H2K7hFcuLxpid40ZbeWLRzbbe2ImnaiAh?=
 =?us-ascii?Q?bfGjzNMI+I7RqodhKKAm08Uf0qsIBtxEdmao/wyv/VARYBDg2EaZHvvkkeO1?=
 =?us-ascii?Q?U8pI7GW/Tn2sQYng3UCMbWWMZVZd7CU1mlb5DzjO9rg2bu/DhCgxnKh5UFck?=
 =?us-ascii?Q?2gJPvFfRvB4fC0UkTkc3P0sFqp/Cq15Kqcl8/E90XwAmFBvoo1cDHr1EAeyt?=
 =?us-ascii?Q?EdnqtpqJJakR/ltsbRG7BM2h2OrsO7RpjfpN1utQ9DTVIkB/CFrF2bTJJR3e?=
 =?us-ascii?Q?+moNduaYxAFSPYGBjf0S4d8sWLxORHbFQA83qfin7dS3X8FnbrbLIUdnaHHw?=
 =?us-ascii?Q?VL8cB4FE+vEyk8vyUiTsde9+8w+zOHWyzPB7ViRkzyj4AXZtuKV67YGpAb8R?=
 =?us-ascii?Q?yaGZ5/cwGTT4ANaBrRSbzLFVC0qyk9oewOgGWRkQzY6j2T2HRC6yUqifw0iJ?=
 =?us-ascii?Q?AV5u99ZmwOBz+ERPX9R5mSDJSKv/jIgMusi/d25o2XV5oaOdFq0mktQnKP+4?=
 =?us-ascii?Q?/p0MsQWLlpPtltby+LPT4EqN3K+hlX6ExkG96go1XtyBqoe1jr9z9Rndjgsa?=
 =?us-ascii?Q?59vLf0mnehGv90DmtJB3aDfvtRFh2DvFPFqGzZTVxGduo/OPHi9dRetErZpM?=
 =?us-ascii?Q?0tr6D78ZpLDdzO1+Gb7X72hS1nh/HROa+IfTNpacHDuPF5mudbRzhf+lH+Fe?=
 =?us-ascii?Q?yvQSbWCHPwO55Mg9TzbjsDwf43tgqF8Jib+A6PnzQn6RfL2CUFsA+Ae8x74t?=
 =?us-ascii?Q?EtFTaeBo+f9EhP7GqQrnUrdgFe97+pT75njM9aMKDMaQtj5qmM1CE1MDLXcK?=
 =?us-ascii?Q?bT/JX+NFA9/Ogh3X60KM1bD8X+VYc1nWzGcjUZT5+dViEbVWswZCtn7Np+sA?=
 =?us-ascii?Q?jYMXhlCGxVDquUTXX9xWIl0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?adXrvqmwUAPYQ/4MSL/HSIpDI+x31+E1LK7MffyAOZCpsn2a6UfcGa9h51ue?=
 =?us-ascii?Q?CIU/Nw5kjX6HJo7rwRgzUhjPQjla7RM0XaunuQy49XRcHOgOHyMU1t79mPex?=
 =?us-ascii?Q?NxfdI/J1LQJSPQDc8HHpQ7Gl4spMaEVZGam5vg4W4HVXXobttt+IpsH0fmzr?=
 =?us-ascii?Q?DgO+dAu/trJncvIeF3NhDYDgM1oAInW7LPYwMbIPGXyUY58D2yGbl1Q+tJGk?=
 =?us-ascii?Q?46bNrcMWimkmNEV0K8jc854mbuYOEensz3osu6kkjgh7Uv6oQe2C9aB05tJl?=
 =?us-ascii?Q?O/tbJZuxgqhTdJQNaKUUmsCL6JATrM4sNsyrdqeMU6fP0TO9dgh22fRgfA3O?=
 =?us-ascii?Q?vwTvVDiNKzxJMlfn2EEehPyGQMvKSFgzNVqW82Xc2vapgBEdXQYacsSnus9E?=
 =?us-ascii?Q?rWPuhMaeFipEBhHudeskhZM0GbGIPkn440DqNyheE3qY6LYQyFgmEvy+eD8c?=
 =?us-ascii?Q?+m9iGxo7x4FB0UDZVNcNsZc2LZOlZB0Q/xqRAWCQ1XiwKyd5CgbqcAeabff1?=
 =?us-ascii?Q?sCfrtPjkVdvli4GahhMP4aqN4+N3XsrqQhzA7HTIm1+z7BFdy2QDWFF/SYRL?=
 =?us-ascii?Q?pyU2Eb3e7DP3+vgLLr49TD29fePUxtfeyJp1Skfyw+fe8bT5VA/j+7X0qtJb?=
 =?us-ascii?Q?DUJlIzA8puWir7f7WkfuJIoPiavSjHFBLF4bJh9O4//00XtaJpV3TSn/4hDR?=
 =?us-ascii?Q?/dJbKHuk7V0HEixAq7C2H/BZsXIdrz+fkiWAim7IiWdLUlu2LEmexAsjeTf9?=
 =?us-ascii?Q?liOdaAiehA0g5jfKyk5xuui+0vPmLTI24RPcRHiOlVzuBoInJeeT4kqwceZY?=
 =?us-ascii?Q?kdozf5LYrulbYaHaVkNZValiHK17IhFdcfhOCIe9IclrPAMvHkjCp6/oPvPT?=
 =?us-ascii?Q?/9o1QNBX/yOfWo1H/KkEWFJrr620XzyubwmwblbI8UQZC4Pt0g4592jXmdWo?=
 =?us-ascii?Q?D5FLhPeUfTtPTAlo6p9Hrs+VqSY0AtT2UNdwi9qTboRvSfxUkxL0ZIqMxtRa?=
 =?us-ascii?Q?cBXN6tPpN8qzIcczOzTdyRhGrSR/kgn6gir2jaZI0qxuzk3ezdppPE3nFyA8?=
 =?us-ascii?Q?03mgCNcQKQ4hgUxzNXTXUXiptQqNHFbclvVtM1KQahZT8H1PHE8zYl1k8dhS?=
 =?us-ascii?Q?LsZbiQp5Fq9aF1SZ8X4PaQaWCTCGCmRDpPMusTxktxx9EMvs1m7n2cjncdoB?=
 =?us-ascii?Q?jMwEyUlL8VE7gEYRutanNjQp/py4X2578wV12BTKXhj0o9cYluRQmnq6XdiC?=
 =?us-ascii?Q?61c1rWmT0WyazcOyLXbsDIPVMrKHNqVP2IoozFpGUwvcMQ1iOCl1yVTU9+VL?=
 =?us-ascii?Q?TBoRKFgkWD/aqO2E3PtKmx7LIOkdNeySDo7K/4M+PuFu33ClYQ9TH4+FvUDZ?=
 =?us-ascii?Q?kXqzDNPWplCxS8J3DYaEqp7zBTjiztkEpN3P0hGM9nP0Wz0zMLFoReZP9UrP?=
 =?us-ascii?Q?HxLPSy5Um4VKzL/rvypF2t7e/UGKLO4v4874dhmKj+zq3+OQy9KpQbOvLrAr?=
 =?us-ascii?Q?NuduJgN50XlXNXHNyM1GJ8Em4q+bAH+WIatPoqnyQiq3bMzrlTJAX0glan7b?=
 =?us-ascii?Q?d4trGZVKEqfik4092dnoudFZdEsJOOwqLudhwpgtj2XSa0/PWskLm497PKBq?=
 =?us-ascii?Q?D/TPFfKq/6ETcNAKahvCg/1TW7YhWpGpZaHm+2WU8PVBk7EXeJfUP5vlaGt3?=
 =?us-ascii?Q?S0iKZfLKcQzEXGnqHghoLjtlZyUlRxTiGTifN3g9INU8uOtjYVdLIV+fYJjd?=
 =?us-ascii?Q?ISskxfzWw32cAXwDUGGEmGByj58xDuw=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c4dc9e5-eda0-4241-026d-08de584cf8a8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 17:54:34.7267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sTVq8iwiO4yVYVQ8XcAfUhUX97vBm4vgfmYFUdZqJ8RXLmKtD8STMxZPxOyONzPqC1mZ88OEmLsIrMI6qC+tW5HUa5LOSaZSOPOBRYXZkDk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6027
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: FXd5FRJXsANg9QHQ6taDuXLsOeaqw5RT
X-Proofpoint-ORIG-GUID: fuiaach67ZhiirgA_2xsWEyzl_1b2HvI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE0OSBTYWx0ZWRfX+VQSJfkuk/ng
 w9ND6ET7m9C9X5I1KsbkSEt7Uqh0F/v4RpSBuloFj1MqmzlK//E8tXf3Nxcr7f8AUhezom7R95/
 3tovxT6ErPR3uCxofQ5GfjgOUVb0QTp2j/QKu8DYxMFIVfGMjf56qwgMPqZ1HsP1juzPT2JP8v2
 A76Ams1XprSRVauBjaUYAiGOugiYF1TlU1iNYVnva80/NTtuooMfLTAOmHt5mHNAkZjmiLtzUmR
 /tNl4LDAxBo6JNbHIywTJAK4BihZbPUfEz8QNXaaf48ZM9P/d+FmsfueqkxFO/jbDLSahWiEBza
 VE+32zsKpmoVWiywUTi42X3C6AFjo5SlOHeKaazBw6fk01CtGoo2HHXo8c0ZxzM+b5XCkxEWnzc
 +4yGMSW46dfZbKpYqW5ALFk4Yw0P1/8T5iDg4U0QtnA14FB3TOK2Si3Bm+9amFBfLa1Ht4CZauG
 yrMNU2nxWbVHpQ4fLQw==
X-Authority-Analysis: v=2.4 cv=ApHjHe9P c=1 sm=1 tr=0 ts=696fc15c cx=c_pps
 a=cAYAfY5XwGGlFG+HVYY7CQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=7FkU8PZzVy809Xrk7IwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_05,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200149
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 17:54:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229760

From: Yoann Congal <yoann.congal@smile.fr>

Conditioned to the "rust-linux" DISTRO_FEATURES:
* Add dependency to rust-native
* Remap ${S} in compiled output to avoid buildpath errors

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/module.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes-recipe/module.bbclass b/meta/classes-recipe/module.bbclass
index 4948e995c5..7dbd4194d1 100644
--- a/meta/classes-recipe/module.bbclass
+++ b/meta/classes-recipe/module.bbclass
@@ -87,3 +87,11 @@ EXPORT_FUNCTIONS do_compile do_install
 KERNEL_MODULES_META_PACKAGE = "${PN}"
 FILES:${PN} = ""
 ALLOW_EMPTY:${PN} = "1"
+
+# Rust module support
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'rust-native', '', d)}"
+
+RUST_DEBUG_REMAP ?= "--remap-path-prefix=${S}=${TARGET_DBGSRC_DIR}"
+KRUSTFLAGS:append = " ${RUST_DEBUG_REMAP}"
+EXTRA_OEMAKE:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', \
+                                             ' KRUSTFLAGS="${KRUSTFLAGS}"', '',d)}"
-- 
2.49.0


