Return-Path: <stefan.ghinea@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDD48CCF9E3
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 22:27:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3610.1762813647597083131
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Nov 2025 14:27:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=SWGjJXRu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=34091e87d6=stefan.ghinea@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AAKs7fv2683143
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 14:27:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=lCUbx5TPl540t8bxZd1W
	OUxOWTUfYHLPuuJAgJ7/E6o=; b=SWGjJXRuyyLijZUzTQkNwP1e5zz6F1NVG9QU
	QUHKV7auJ9aHUnq4EbUkJSt1bVS1hINT2+Yhd9lategrqRbQG2p1Pyq6CRtoE0zJ
	xSzLqgbbfCmMKyXkzGeATb1rUIXHerOg79JhCGvy//ZJtKE7LokQ33FmXylqyCKd
	K2LUCC01UmdRUXflCaEGjro3lUnY5pW+OEWzsReyp9I8LouCKufZXJhFEAqUH05x
	MC2u6CgYuO+kiUBejaDI62T8gvgp5m5slXMQYMk9w6+dlFtBy57QoqbBzR+hYIA3
	zO/Z5vXmLsF/jYB5RiNx0L2frpuR4H4CK5RYGytydFqApTC7Hw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012042.outbound.protection.outlook.com [52.101.43.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aa21328n3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 14:27:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OUIuikaRU7hg9OpZGH/rlCc4DVQwbmPq/C7tvJsuiORymb/cR6YgbzqNjo8ZVp6fnML1eaePWg4dVdscGm7d/xtS0v2xLSIvFtRfqk1BLd/0XbLMUt7dRENvOcLy4MdbG/teF/nx+MbiyvYlz2kxy4kH+CUFBuI6OZss1xzuxda4ksoqN0sgYfq4OJwYTfwVU/P3WjQ3REf0QBxVy+YVNQtpK3tdGcOehpv/BFlMUVk7WqU9kQPDUql42HWRkN5f/UiEoiDfDOrJkCj5V7oxWMZEXr7TGgsuuP3f8ZjOXQOtEsNt3ZpQuG2srdi4TqbdTHdUyQ2qMmLGB9vH/DqiuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lCUbx5TPl540t8bxZd1WOUxOWTUfYHLPuuJAgJ7/E6o=;
 b=GOnwOfjK7P8eXbCGjK2438HTwdWqVVRZV+BS6dh8ZQG137m3cS5VPebDchI/YmDrCFbHKThNQgR3s/NsAqzszgyNVU+HrUREtYM1tSPV4b9f0RWSSYOhmhuepF6aM4rnefO4SQJ3Q3zJmY/zAkpQAsvib9UBgJjDPVLG34k5UCGBdOQgxMOV28Rf4d9A2DzbMsMAq9UuI/6sDkJbbUeTT3j0ISmsvRpRWdLals56md7jR02Ut8m6UTdJ2WGBt4q9vNjR1c6urgjCiqeO04NV27LCJqDwHnA89huiYVkeT2kb3JIqb/TVAhtb2rgFZMsdrGUqZP2WQSa0NxtCYxA75A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA2PR11MB4986.namprd11.prod.outlook.com (2603:10b6:806:114::13)
 by MN2PR11MB4614.namprd11.prod.outlook.com (2603:10b6:208:268::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 22:27:24 +0000
Received: from SA2PR11MB4986.namprd11.prod.outlook.com
 ([fe80::6581:a16d:7069:9d62]) by SA2PR11MB4986.namprd11.prod.outlook.com
 ([fe80::6581:a16d:7069:9d62%3]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 22:27:24 +0000
From: Stefan Ghinea <stefan.ghinea@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH] rust-target-config: fix nativesdk-libstd-rs build with baremetal
Date: Tue, 11 Nov 2025 00:27:10 +0200
Message-ID: <20251110222710.904146-1-stefan.ghinea@windriver.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR04CA0116.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::14) To SJ0PR11MB4989.namprd11.prod.outlook.com
 (2603:10b6:a03:2d9::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR11MB4986:EE_|MN2PR11MB4614:EE_
X-MS-Office365-Filtering-Correlation-Id: 82d13617-4421-46f9-24bc-08de20a8520f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ZMV/XhE/fDpQf6DuTruMiDWvDAWqaMNlGiQlJ1ezw045sgllJlEyQFx38XyL?=
 =?us-ascii?Q?yOQ3VahdoVbTf2MO5M5HA55xnQw8wB3ZgI7Sd/0gF5kEMYrRaVkPxjUl4ar5?=
 =?us-ascii?Q?wZa6HiAxJu4gTyQwQ6/wOBGHdbeDo+JQN0VZmenUIUGGxnQstZWgfuRTAxVD?=
 =?us-ascii?Q?HpVVrQOT32Nt3s1AxvhUiBN5m50gXcfU/OMBGAfSAQl92qHE1Lje13j8dLhQ?=
 =?us-ascii?Q?dDI/ttoYX2aQdAXBukwjq/IlTn52AeE0M4ntsZRqnE8HFnrZv4ztH7Doo+Au?=
 =?us-ascii?Q?z4zklhhVlTnAy/MVCJ+/pVNlGpL8RP2ar0F0ILtMgAbO1xSpfg4m8EBldRLK?=
 =?us-ascii?Q?6jiBzg6wZ5ehBvI/a+WMzNVgJ7zTHkv+v+t+mExkMaCcgROFoZ85Uja+QLAR?=
 =?us-ascii?Q?pnzW335AxaUSp/mlHXDLteTX0t1gF+/RWiLmN4IMjbv9oDeUkWF5r7Q9/a+E?=
 =?us-ascii?Q?SYGX3onPqv5/HmW9wfGMYXFmvqpWEA2PHN7e5psNahJnachNw+NEgh1yQrU3?=
 =?us-ascii?Q?oieOjMwExa65JwQWe75jnIJq64JkjksiS8CBo5vA1untSKLOiv7jPLKrfZxJ?=
 =?us-ascii?Q?ZoACWi89n3HKF9kAUZtmx771sj8U4eNTAowhqsF874Ljt+mE5ZLrMgvNnIqr?=
 =?us-ascii?Q?wuSY1so5vaOyLoNqqDDQnZ29yIX9HgGBGHIEAP9PY/JvsWRDWKRE12klz17U?=
 =?us-ascii?Q?rwsXIAKC1N8my5jc+PXcAyPcwKN/QH8FNYnZCyK8PgkR/6nnVDhRlsPqupAW?=
 =?us-ascii?Q?l+RxKwZGpYqG8M65Bt4gb5Jkz3mJLk7Hge1F8YvM9u9yVh2on3lRJubOocuI?=
 =?us-ascii?Q?h7P709boBpe4kTv2vai3PEO2wervgRV3EGISt7CAfZeVwEz8RAVhVnF58vCQ?=
 =?us-ascii?Q?9oeeMb6enhrFTvY3fDkwRw8RdVfHz0o4m28MvfYvRPlYLF2DpRHi4lxDuWDE?=
 =?us-ascii?Q?yLPT193KHPmAn+ry1JZUHqAXCX82oJoIuH9S0q4ikOK0PqIv7Au4ocfAmzLm?=
 =?us-ascii?Q?6dUN7BJdSLp9SSptsuNQz5Vmhqcpqn3h+91VinLk3dPjbKp9CG4vUQxEUv9i?=
 =?us-ascii?Q?SV9sXdqKB6m2NFkKEQXoaWQ6dUhbjznvnLsK3zlhc6ZDl4/ucoV+QbHcDBN/?=
 =?us-ascii?Q?rBuTEFhYBdk6vw02yUWffqa3FvohN+2ebf1/MaTTnvClF+e7vJ6veSluzfbG?=
 =?us-ascii?Q?y7RWHmu9Foak6C3K3TPJTB4YThNwsUrLWEZrmIAouwZdbY/EVCEnUd9/TN2X?=
 =?us-ascii?Q?yh09lC9TJMK2gZxM1M7IospyC8tulAv7inST1s99R1MJwDBn/ABDMILs1iVO?=
 =?us-ascii?Q?htBs5Qbv4yIH6GJwqtLPFjRrrZcSa6ByFRb11hKKypn8vMQUwUAZ8wpiSpP7?=
 =?us-ascii?Q?Q2yaPuyywKRyc70dqs5otkAfKrmxv8irctwx7lMhRonMN/A2uOAXj9UdMQwM?=
 =?us-ascii?Q?MXikqXGIQZaRDTW9vSeXWAknR0CaX3FmWFBM7bfXdIixGQTaDwSSoyNhS8HL?=
 =?us-ascii?Q?SrxSyr952KAdApa2Iv6XE/fxGuchYtFkFJMx?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB4986.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WylBOyJhvAuJX+ONtI2i7xJQOWseKhZsc6biBMlHhCTcZ3zvfzaS9bgu56dx?=
 =?us-ascii?Q?R0vKwcvT7gYtXPhOXgR3XcIlKjUIWLe4uHNRiEz258mha3NmPkavbCBXX3bU?=
 =?us-ascii?Q?pZtg4Tam6xXqORWCN+TGYjo2ZhdiSqhi/9ANJh5jEW5p8PQP6aBE3xQCMIu2?=
 =?us-ascii?Q?pKY0YEHkhy2TG8YjcfZd/vMVzPlPmMbnUGvpoChJGTaMlnK2msSE0b7GVdPU?=
 =?us-ascii?Q?rh5yXhwjarI0aiUI/OWCZZh9EB/qBqK003O8oldz6QHOGurmeAJhOjrp+KtW?=
 =?us-ascii?Q?k/lq3YGlymEsMWDovc1emY/j+o+ibrrkW8KTF7+peLVC5ldXwwWdKPd/bN6J?=
 =?us-ascii?Q?mAqIS8RoHMJkRH6hnUpWsqLx7/sgM9hs0rhIsz4A8WZGJuLzi8JuMUjrRg/5?=
 =?us-ascii?Q?nkg5HWMxq8npi/MkjUY+BP6F3vA+uhS64TsKuBdltgW5PTpBpEPxwCAsL4n4?=
 =?us-ascii?Q?51jp/wInXqcyBdERvTmtpsRlmasXJNDp04z6HlcdnItXdKff6k05S4wo4VUP?=
 =?us-ascii?Q?HOq9tNnL9qpIkfW78NZqYBnAjSemCJZKMoOnS9RrJkf53Ajzlf6bXO4MS6/I?=
 =?us-ascii?Q?AZqBa32Ekd6pfHue9ejXqWUn3MNBevSgKYSWlWK0QoexbuR9cv5FMV2jn9+1?=
 =?us-ascii?Q?MSTOtejEINzMr+cLvjT7cFzivCue1DID//aqoKs/JswwJsCN6M5yEBFlHNH7?=
 =?us-ascii?Q?NDsh54guoBAHwDUUh3oV4wxJpm0WtNA94AcIX0RG4e5frT70+Eq6lLNu/4HT?=
 =?us-ascii?Q?S/2qOJDiIfAdp9DbWoUbjuFcE+fxrWnBOcC+TIJWaoRw5FoIUm11ukzytCSY?=
 =?us-ascii?Q?eHWgO/fueXUZOoPfxI4JcGTPCS1iJ7GbgaHGDSGrStydOvr8Ufih2J4x1uvf?=
 =?us-ascii?Q?gyx0/TVZ4wne2vadz/y3WQHSyxWP2cHyOQZX/2p00whGnZVEE71LQhtWTycV?=
 =?us-ascii?Q?8FMvc71od7AeteHyafOFQOLPPvDcXKXAfptZgfHwGmA3BkYvJh5iYDB4KwuD?=
 =?us-ascii?Q?z6RAXW8RaUwqL/rvElFYuaMS2xjexzz1YodR9Xi+qsv5H0ezNN+NZGIXIicu?=
 =?us-ascii?Q?IMroo102FN3SsFDxbwrF08ch6bSPGYZJtQO6HhdGKWoQFBnovPSSTcFTy5ei?=
 =?us-ascii?Q?rlScka8gkvKa1qB6cS4ILE91FQFtlDL7rtuHUIMjM3fnX2FxM0g1V0ny5lUv?=
 =?us-ascii?Q?4eEFik6Z0ShKJyzL35VcYSG7qOKK0S6lF6D2IQwNhIm3NIXk9N8PkTx9KCZB?=
 =?us-ascii?Q?Cvk+nZrJiYjdueOjLNsaP3nHCqGZx2YahjENsp8B041YawuP4Accp59hM3yU?=
 =?us-ascii?Q?qVgHTusI56RfQsVX9yZZyJ762NhIRwCw588f1MbagJbkX7BS8nRSe62bK9VK?=
 =?us-ascii?Q?UC5MGGQL8sNgCH0h/mqCu5Cx9yCmZWhaGi4OFGzbjkHOduA+1tyV9yrje8zq?=
 =?us-ascii?Q?Fb/TSVfWvVn+VELfJkRnIZ2c+jrI8N8KKvbFbKuou7/u2txJQTL+TdCL7ixE?=
 =?us-ascii?Q?yx66xAFgSU83J1p3GqnvnO923Y+o9hcADzf7G2GMnHWOmebv4sLsThFO3YCK?=
 =?us-ascii?Q?vC3iM3N32e1yTNJ1m/0BLeOjrJTYQo0XfKo3VMbDXjCzf+8q9ndK2AASvv3A?=
 =?us-ascii?Q?vw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82d13617-4421-46f9-24bc-08de20a8520f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4989.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 22:27:24.6728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cgl6aoM+51gGPxHjmS5TUrAOvtBZ4GyaVMEdEGMcFYEcPhcLKMEQry5/Vx9Peoz+NGIWitFtOpke/pPyBSPR016Ag35baJR4P818epkGlNY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4614
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE5MSBTYWx0ZWRfXztqUyIOUqLFB
 GyUcq5IGtY8Vu+FXEt65uJkAl+ddjUrpQNWrzC8a1V8khjvV1OmEYhWu1rp9Xrh9N+fVg6V5ZGU
 vVgPnc4x8q6Q4euT5PQHfrj7ZVubyNejr9/JkXZlZWbSzF/xyM5fSAYAxhq5LLvKT94N1b9LMoQ
 op/P5YiwjCN2aKZYjHhFxqJfhjWm+2wSNHTizIqLgWeTno0bcIc1N98Of6uoj6MlTJPYoBClMeh
 qEUAir15CEGX91hi/+2uRzCD7lHsQnZC87ymRCj72kdJj/8IYsw4HquqaCQKIDGsBKi7RjNo4Gl
 JkMoJjRPHvRltK5H5hFiHiXhcTc5KfPq6RStPFO+BPE5rkE2QiX9IrjE3FNamdN05KPDdDde0lT
 IsIe7R1aPrM6AMJgbbtBm0b2Swm/FQ==
X-Proofpoint-ORIG-GUID: u4i4ZKoaMn6Sw7ookLoO8LF40zHjTHsv
X-Authority-Analysis: v=2.4 cv=XPA9iAhE c=1 sm=1 tr=0 ts=691266cf cx=c_pps
 a=vwzr6GK/qOZR+/kkcyjBFA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8 a=_8Ye3f3KDwUttXRickYA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: u4i4ZKoaMn6Sw7ookLoO8LF40zHjTHsv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_07,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 22:27:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226140

From: Ovidiu Panait <ovidiu.panait@windriver.com>

If TCLIBC='baremetal' is set in local.conf, nativesdk-libstd-rs build fails
with:

| error[E0412]: cannot find type `c_char` in the crate root
|   --> /usr/src/debug/libstd-rs/1.75.0/rustc-1.75.0-src/vendor/libc/src/unix/mod.rs:56:29
|    |
| 6  | pub type c_schar = i8;
|    | ---------------------- similarly named type alias `c_schar` defined here
| ...
| 56 |         pub gr_name: *mut ::c_char,
|    |                             ^^^^^^

This happens because rust_gen_target() sets os="none" when TCLIBC is
'baremetal' - even for nativesdk targets. However, nativesdk packages are
built against glibc, so the correct 'os' value should be "linux".

Fix this by setting the os field based on {TARGET,HOST,BUILD}_OS variables,
as it is already done in rust_base_triple(), instead of relying on TCLIBC.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(master rev: 3eaf2cd5647585a1e6df03fc20e2753da27bb692) -- backport
Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
---
 meta/classes-recipe/rust-target-config.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index 1bd7626bd8..31b4bd9afd 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -329,6 +329,7 @@ def rust_gen_target(d, thing, wd, arch):
     sys = d.getVar('{}_SYS'.format(thing))
     prefix = d.getVar('{}_PREFIX'.format(thing))
     rustsys = d.getVar('RUST_{}_SYS'.format(thing))
+    os = d.getVar('{}_OS'.format(thing))
 
     abi = None
     cpu = "generic"
@@ -368,7 +369,7 @@ def rust_gen_target(d, thing, wd, arch):
     tspec['target-c-int-width'] = d.getVarFlag('TARGET_C_INT_WIDTH', arch_abi)
     tspec['target-endian'] = d.getVarFlag('TARGET_ENDIAN', arch_abi)
     tspec['arch'] = arch_to_rust_target_arch(rust_arch)
-    if "baremetal" in d.getVar('TCLIBC'):
+    if "elf" in os:
         tspec['os'] = "none"
     else:
         tspec['os'] = "linux"
-- 
2.34.1


