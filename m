Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B22E2D3CCA5
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 02:19:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27182.1768443579963141043
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 18:19:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UM4EMOgM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54750d28e2=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F1s6j52482569
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 02:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=y3bm3bspcMfw6OkWearP0tvZaOo0GS260JitV0Yq2SI=; b=UM4EMOgMDIgz
	dSzUONvqzgTqYVmtdBJi3PVy7j/un34qBTj5RhfWNJKJDtpMxQZV5qqm1XI+Qlew
	gS5Vd41U5LiJ7zaPlrey4YJq2plQh/FFoiV45NHIUy6p69jWVFmJ3gd4bu74JOur
	q6zpZKACt0AVgna8oLPVfwaHRk/lBuAm8sQqlvAspaAznYc0dZEpPwiQWVwUpi6q
	YifeoljkxthGhfIU7BlKXyI0Mrz3CF1Uv2/2sIGJKL6VpX0Tc5AbOWuX0NgWv0Ia
	wXjjtn8jOISlcEZUTvf90mU+QN9uif40cwCXY/zFBobM4ppoTGSYGL88+UNNo0q+
	RDqGAsZknw==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011068.outbound.protection.outlook.com [40.93.194.68])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkbytnd9s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 02:19:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=COmJnxtR1ECb52QRPO61Hrkuvk196m/8+Zwq7o4YEMQcQKT0A/TOunvvJd9+fNOmguJEseFYfy/sgLp85xpn821VjMprPVr+FJQY++yc0etm+qF/KQP7wIhwyu2c2IwZRRqzpSjYNv+k1PsAGINn2v5ozVJ7AizSvmPbTQs05eqkLOo8CZ53vHr4CRA4EFbEgvql9g3lSWUSfvkMpAXa/Tb7cauZUY8mwJ6HcwKAQb3GjsEL9hbY200Fsy/OGBlaGCFqwG1OZFqof2EqXb8I9h2fL9XDtBo29zIJy2e8Ht09DsVmNM00DSKM09yhWd0RvYK00XZ0kYXnfx9I93M4Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y3bm3bspcMfw6OkWearP0tvZaOo0GS260JitV0Yq2SI=;
 b=sUTPT5fmYkg9tuKQ1fswH37OZQ4d5m9fB6Z8Tj8QmmTvo4Tii75M2xRB6lRJZOrIMJpMuIXNI87lGORbCrGzAuG8hlLdR0/m6JW6UpGte73A1ZGrqOOViYNiZy+a4oVfP9wQ3A/WtiIeYPjk00t2vyELA+kQeKAyVJe5JePswJNRLcNek6dA6VLSxu5gbiukcR4whoZSH9zsdx98Xn0GdY89ZqGkr4uAONFJPYHrO7pmTtsH+fyIwZE0QEpD8Ce7oqpvJUddHKfHc1aXUdJer7DNnloYpsNElWJJmyogee/gGiGtB530fLsl2oixNyIdQgOVoinPGfXmdlgwptZ4CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA1PR11MB7130.namprd11.prod.outlook.com (2603:10b6:806:29f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 02:19:36 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 02:19:36 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/2] systemd: add shell-profile-dropins PACKAGECONFIG
Date: Thu, 15 Jan 2026 10:19:18 +0800
Message-Id: <20260115021918.1926514-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260115021918.1926514-1-Qi.Chen@windriver.com>
References: <20260115021918.1926514-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0001.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::9) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA1PR11MB7130:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bfe1735-5dca-48e1-ed63-08de53dc877d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/ObQ1BC9xL3Pn2FWbrxfYSk21985Xey+eXF3zdm69MakCZmDfas6jpal+ZBK?=
 =?us-ascii?Q?5phMEkOdJDF3Hb4R05B5J+EW0wOY496J3O5/PYfSTjEavjS1NKTKVUYOvQP1?=
 =?us-ascii?Q?HBFioR+71dxyZpyyDo6sxOtZcNFvAMn4LR1Eu2lEg6BlTIWn/kDyxDgpJj9N?=
 =?us-ascii?Q?KbueLocI3xl0LaSyaLm1n6skxPsxOTWnS7bs1DwXk4v3VdM5sSAnHvUskT/O?=
 =?us-ascii?Q?OCcOQvUIIkzT4vwqxqt8/NoG9hei/sctx++iSFDASsuwNE6F4HSrkmcIBZmZ?=
 =?us-ascii?Q?pOAWKyzXHGdSpBUprAsZ6eZ3PF54zRnCvTFO0zG2mUH81DPs5xG1RFIUo3Za?=
 =?us-ascii?Q?vObhnabh3t3qcdnOiY9/Gj1Xqgb4u9mi3aFDCR6YAnTH/Lofr0BwWnbXs2Gi?=
 =?us-ascii?Q?WaXS8dBccFlZl4RQU0xSC1MXg+A/oqkEtJqOYyMuJwmVAglEv1rj07KHBgiI?=
 =?us-ascii?Q?a2vRVDexqfsDhdw9+FJiq3Roeqh0HtA0ZR9Q1fNoqVOfpi550SJ5w+hbHy9i?=
 =?us-ascii?Q?jGCW3fVjt1NDquM0CWPGMSILkLVi4X/8/heKYlrL28NyGrMrATLsa/hJ6lXa?=
 =?us-ascii?Q?WvBp9jgg4fd8ZpVNcvq7ccUIV4K7FAJJXd8eE3CGzfYV0GBz/DQyxal+1Mvv?=
 =?us-ascii?Q?2BCB9nCpTbTpnIbGw4nsaVDijK4IzJKRzLUU+wwoAZxv67oigOnKO8tsWRj0?=
 =?us-ascii?Q?LFkUDA9Zl1ZGhpUNNaFnYZorD/REylynpySqsPVkECZnH18jLTk/+u0X1uSn?=
 =?us-ascii?Q?owvtxOr1TeBMDXsQu3JiyxtQHahUn1lB0WqCP8EPA5x87P71g9FSeNl4dPnG?=
 =?us-ascii?Q?yG4QfxJ8mdVwzzlEwPJwyp1bpUiSvBGHSlLESh1SLEDcq2S/hiQuKYz0jWys?=
 =?us-ascii?Q?kDxWUOVdc/yh4womg7HOCYQKt2ue6RCtVUZ35OPZ5/OL0mMTPCu9DCINYVtM?=
 =?us-ascii?Q?5q3JKGL/hfdtKV5PnHn1s7HSeKXEoZIpgH4Gf1zAE1tfSGsQAdHSAN3vpMlR?=
 =?us-ascii?Q?ZPmd4o1GG9yG41Zv2p4ZAn+UFW26YbjEhP75eiq5u2/5xvkN0ZZt2TZn16W1?=
 =?us-ascii?Q?o6Ey/9zigB04CKXiDP5prYyVVDGRD6hwswzUQ/+PosebFydn9i1hjzi1gHHK?=
 =?us-ascii?Q?L5DFWFsfwbJiU/qBuakk5QR8LiWve7DXrIkH5+oPI+OaqvEx08Tm71PKBt1o?=
 =?us-ascii?Q?dwwQmEl6sdwuM8XLKnI+a0Zkq0Ikb+RomQlDojgrhXUqy5dH/AF0J69Tg6Nq?=
 =?us-ascii?Q?i9z9+x4PIDceMMkmc0Ns+oy7mxOoC+dAMdtKqs/sE8W2WDKEUbb1lQvOXwJg?=
 =?us-ascii?Q?TuG2bmFUU0k1J1tShiSmd0wG/IBCVCywBjzIllMzfmsWyVMsdugC4cwHh6Yg?=
 =?us-ascii?Q?QEYrhnmpZTuAOLqPFHeWi7xDJXmLpxXemYucfMLM4K3IKAuEFrUAVoKlxUMR?=
 =?us-ascii?Q?VlD3alKFF3JMStt6RAPiXl40+E/hFyd492y0OwgrP2QOsKtyECFsG+zthyrP?=
 =?us-ascii?Q?zjUn6OabBT7Nx62YMlpIQmoPYNRQEnBS6rzLooB1LJlWhtRBzEJMmmnOkwnu?=
 =?us-ascii?Q?x8q0G624380YBzRVl99i/55QL7BPFLTv6AzyeVEtiUoGGokqt9B7KVPfB8EA?=
 =?us-ascii?Q?BGmYbSsI/MiyulzqBbWtqSQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?babxBDzGacPorI1yG2XCzbwtgxewmuysQ4VlvoT41V56dCd7kKfSHmk+Be3/?=
 =?us-ascii?Q?1oBLRv213cxzdqlTBt1j96qzSbq0xssmu5TJ/st3Rllu4tVv9HaBk29exp4I?=
 =?us-ascii?Q?fIqqRXlGu/LjDq4H952bMx9liZzyk5BHH9zmsGj4h+LJivhDWr1Pia4GOwv/?=
 =?us-ascii?Q?BW935qmxEWDH/zBDqje7n+2jHfJL/D1ZLAQJlhoMVWg50cAGsH/s8PjPMX2D?=
 =?us-ascii?Q?r0u6atJv6XdVARWFneyU7TLL87sRhSR/43l37ofq4PEfEZ7k96diZ3xC4xoj?=
 =?us-ascii?Q?j9AcZOQa24A6Qkdu4FWPfiq/tpIB6cwrIvyWK2cbGjpyhInJ2sJvuzvd0fY1?=
 =?us-ascii?Q?2y/CllX3kYp34xGOsF51bPbrMjQd3E1cLdXD4f3aX9nVW1mHHB1b2QsWvjyj?=
 =?us-ascii?Q?pE1aw5Nl5Iatsz/lOPfsTT8jGm5VKJExH+GdTeex1hNhYRgNEQ7911iMstN9?=
 =?us-ascii?Q?NXFS/mPX/N+/Fys1H0rPoNQ3XmDoOm/qUP0I06LRqyqTYTJ5ZMfMrcW+cRlA?=
 =?us-ascii?Q?hQqCC6s5B6dmVuGhsuni+Ppr+R2AZcMzAKZOfHSIXsNazRmJw0o7OXaAoHdf?=
 =?us-ascii?Q?q2TQhvtQhwUijy0FiRd9Lf1ubiIHZ3ceI/UjR5POCFGzGqMYmvtth0bqVQAN?=
 =?us-ascii?Q?BKlkCBDKZglX9MTV2jRrDGH/a+c/t+5SKthLSbQJ4MFCVSvy6Xtas8Z+NWER?=
 =?us-ascii?Q?ooQLOu3+8l6H+teb86foUAs5alo1F2sEJVrFLtkLqzi8k+IMfnQ9YT3/uhHk?=
 =?us-ascii?Q?cPtj8HUA40b6OOKPlSc0px4FKblXXvrqFFfn85HuuqxOqNO+TYal5bJ+wIN3?=
 =?us-ascii?Q?hi9VF2hG7EPsCz5fsQch5dJXzhC21GR7RyZn/2yP932LntksjG+duA7nFass?=
 =?us-ascii?Q?3WnWl9NZIzt26gNeByU1+5mX8cbR8ARtGJgHnnVJQcBOtf2JZE75TeF/b5q6?=
 =?us-ascii?Q?eeh7QYq6LGozuNWuXhDiBLCyihrGaULqla/J8sBF1XWpVKruKdxGdK5hNFir?=
 =?us-ascii?Q?UYjk8raYrY175qlYxf0ksybV9HwJalRemZO+GvnjDdkYm+Sn7G1g/GJk29Pe?=
 =?us-ascii?Q?9Q6gypRnnzp16ZbQeuG/Cp/RuDTfZvUeSbW6yNEwi5XyJRCQs3fEUvuIFuLk?=
 =?us-ascii?Q?eczKAFsIOA9UwoVUeGfGqfDfDaGpfCsezGbeeWFqUJn/E5V6AbitUqId5svu?=
 =?us-ascii?Q?LZp2JO2tDMVOt1555+IBYr1UH9psZehg2pYD26yLbpFmi913YfBvBIa9Gu1h?=
 =?us-ascii?Q?RNj3ndPOdlCXtVyYA/z0e0UJGdy4ejG9KmqO8vdJQYTLZUBzwBfTUYYWfJgh?=
 =?us-ascii?Q?bvqG1TmPbK5751YWqqR+5DghsspXoFgDRKKQpYX/0oVWXp4Z1Ee2xCt0IUWC?=
 =?us-ascii?Q?8I4+YaYntXR0kUrwkIkxQatvUz+MWBl0N3Ftkz4SfaeSFvM0ATB9I9QAoczg?=
 =?us-ascii?Q?31+rGIMRLEViNNw3w4hZzlSSONQeDdl5iXyvwiShGIaKIbxqK/+EspYQmw/7?=
 =?us-ascii?Q?/ShaIxtUF46Rk2yDlF+Iy38LI37VqS0dVyy6Wt4mkLO29jQ1jM7yri6wvv1E?=
 =?us-ascii?Q?UGX6qXq/8uVtaDnUSIHQ7RadcDYk6noOZr5SEbeKywzInE2CMb5RDZ5XVKSE?=
 =?us-ascii?Q?wObvShiPdNruHw7tYrKb1gFadkogRcCT3dLcDGqLGvj196MJwxKojxbMXS99?=
 =?us-ascii?Q?Oj1r6xTc6KISqj9HrFJ78HflFvhRrlXoXQQCfWRYzQGDhOjxT0WdxFRIUcng?=
 =?us-ascii?Q?O5zCuAVVBg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bfe1735-5dca-48e1-ed63-08de53dc877d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 02:19:36.5949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D/GrMiO7SvGfFT0OW2Wvz3OKfoCngIK5Ty6aWFHjOF7nGNHLqPFhz/ijCdMi8ZpT1ngaHfC7dg96JzT+G0tWbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7130
X-Proofpoint-GUID: pMpO5ChfxGxg4Q8iT1IMfX6As4w6ugd2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDAxMSBTYWx0ZWRfX5Sc4aPzWHEaT
 Jx8481/G6NGYMO0RSZzEXgeDL2Rw8o4LcFFiik74o/N3AxdF0oB5xiV6tK9MSZjw0ZvjWCF0rQj
 SvApPGsHHcvYMjbaqDE0k4mCkV6UFygSyiLoPvRqPHUmhVKa2zyYC76F8uO6eTMOJrs5hYTtvgx
 2s22eya3Rq7zY+9Q/LEZ1Hk7uT5yXMWGCNItSmiEkCBUH6w+9klafvttAHW7vOVkUTINfZmq4AM
 ws3aQdVlHBN43R1m+Pu7A9ZaCR02AYhNqXNLqES/yBhsrBC1wYZa/NABaVH1cHB1zKObuf2bWGX
 R482fW0/mHL61hal8ZGOpAbnkLNSbzH1UvUwCj7G1uRG1r/EPMh/A8cM3VXiop1MjswYn0I2/oH
 4Gju2+9z30giI5Rt2A+RxMX3KK5blX3+BGr+UbSMYXvl7Q1I/1N+MkVNz+ncASykVCBqPs6+kO/
 wpaLLwBFGt+8Z6MKsCA==
X-Authority-Analysis: v=2.4 cv=b66/I9Gx c=1 sm=1 tr=0 ts=69684eba cx=c_pps
 a=850PSMRYHTBgLER2XRwgFA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=nv23E9fyAAAA:8 a=t7CeM3EgAAAA:8 a=9LcN3TwNd8VEk6B22I4A:9
 a=ehkDpipTsgk7cDPTKqUC:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: pMpO5ChfxGxg4Q8iT1IMfX6As4w6ugd2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_01,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150011
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 02:19:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229380

From: Chen Qi <Qi.Chen@windriver.com>

New version of systemd introduces dropins in /etc/profile.d. This
is usually OK for most cases. But in case of using minicom to connect
to the machine, there will be unnecessary output every time you type
a command.

This is because the /etc/profile.d/80-systemd-osc-context.sh[1] is setting
PS0 with OSC 3008 standard[2]. If a terminal (e.g., minicom) cannot
deal with this OSC 3008 standard, it will just output the whole contents.
This is quite annoying.

So add a new PACKAGECONFIG, shell-profile-dropins, to allow users a choice
to disable such behavior.

[1] https://github.com/systemd/systemd/commit/dadbb34919abd3fefeb5b8ccc9794da9398a2503
[2] https://uapi-group.org/specifications/specs/osc_context/

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd_258.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_258.1.bb b/meta/recipes-core/systemd/systemd_258.1.bb
index 41f1e756cb..7c6f6c65dd 100644
--- a/meta/recipes-core/systemd/systemd_258.1.bb
+++ b/meta/recipes-core/systemd/systemd_258.1.bb
@@ -84,6 +84,7 @@ PACKAGECONFIG ??= " \
     resolved \
     serial-getty-generator \
     set-time-epoch \
+    shell-profile-dropins \
     sysusers \
     timedated \
     timesyncd \
@@ -197,6 +198,7 @@ PACKAGECONFIG[resolved] = "-Dresolve=true,-Dresolve=false"
 PACKAGECONFIG[rfkill] = "-Drfkill=true,-Drfkill=false"
 PACKAGECONFIG[seccomp] = "-Dseccomp=enabled,-Dseccomp=disabled,libseccomp"
 PACKAGECONFIG[selinux] = "-Dselinux=enabled,-Dselinux=disabled,libselinux,initscripts-sushell"
+PACKAGECONFIG[shell-profile-dropins] = ",-Dshellprofiledir=no"
 PACKAGECONFIG[smack] = "-Dsmack=true,-Dsmack=false"
 PACKAGECONFIG[sysext] = "-Dsysext=true, -Dsysext=false"
 PACKAGECONFIG[sysusers] = "-Dsysusers=true,-Dsysusers=false"
-- 
2.34.1


