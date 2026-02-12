Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CB3CEE36B2
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 18:05:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.51612.1770919533717847416
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 10:05:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=efTnBuP3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6503562417=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C5B5P02177871
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 18:05:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=hwbC0TIV0vfI5t8zGgyUK0z3dc2FUHMVweK//UYKigQ=; b=
	efTnBuP3gfTvN3s1NJzGnf9Re0ICjfOXHAmcmJtSJ+W9qP//EraSLC5ZPTlnSELy
	P0GO2Qi+6hbz7rKD5STnKy/4lu0pIOXEJchu633jCjWdwVnY9U0DpbyBvqLvj3aP
	vJ07I+pAOVfNoSk0dXQyUrCU4GbjlVaQb1RIPOqk8FnsKrQCEpRIuLEFxxAdwpc8
	+vDT53+9GGEBWYstzJE3dA+sMVYiRGDfGVgJefdHuLS0442f/fjqqM/Hdu0oGYul
	Q1DcOpgj3ZPcwF6AQLzB4XmzWhDezHP51IIvD3uv+MzM7atAucJt+fsUkq45ORXa
	PJ9zyvPRPATaVVD0rOxZ+w==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012028.outbound.protection.outlook.com [40.93.195.28])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c5tkwph42-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Feb 2026 18:05:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vlPTyfCucglOdHHaJxt6/AN775gqcKzDXFsjDi4CTHtL8qsuqDp3diIazdO+sYWND+aIQDNtTSX1+tx3c8thWCeZO9LjYXneJ2dljMBFHei6TTNj2x+T1q2SEN1z+XGi3zJqWj8Gn6LbsHFkZX7t4KChNaRbpIk37/R6WKqwBdrwQ21yVfKfvJZh7FihJ6469e//qkP0YG7tyide3R7iXvgZ/qMSiucnbsxnWp4DNUkS2mk5+1v8xdSWCoHGdGqFsNgeSevnwhtyAn2Qet07cZHLP0n4zxtS3M2b9+PFvWyBO3vOIP3cCRmDTTneHnKGTTJ4L5kH59rs0zvem9R+TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hwbC0TIV0vfI5t8zGgyUK0z3dc2FUHMVweK//UYKigQ=;
 b=DG8CIyCgiwvcIrp8dS/awRMU6qNX4h8gjGnl3eoZ2mHLDyj+fmgJpz+uWC3gk9Kwv4FyemX1OaweZAREGRtDYUHotli5GtwBFCP146ADZR3TYh+0OEePaF7oSoNSAS73E5FGNJ6ddEL91PqjBtwEV89xeJimAWQR+JlJp+TM0FJdYM7aOx69suOvKTs2c2PjseiZoUWqB+XWQ1Mkw/Z761F7hUwUxOGEdZU5TwH7fvYKxQoDS/+Pz3CsKB2lY2BCJdZhE4sXUkhdLNkdb+mW01EP5OjdakHfPPsyYUbER+ygA+0MMeHsISQYr1/hxzDzDtCYf8h3+k5BX7l52SvJVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by CYYPR11MB8432.namprd11.prod.outlook.com (2603:10b6:930:be::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 18:05:30 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9587.013; Thu, 12 Feb 2026
 18:05:30 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, paul@pbarker.dev, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v6 04/14] linux-yocto: enable Rust support in kernel configuration
Date: Thu, 12 Feb 2026 10:04:23 -0800
Message-ID: <20260212180433.1825988-5-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260212180433.1825988-1-Harish.Sadineni@windriver.com>
References: <20260212180433.1825988-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0057.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::32) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|CYYPR11MB8432:EE_
X-MS-Office365-Filtering-Correlation-Id: 5aec4759-c09a-4f5d-9018-08de6a614eec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xwpalQ4PjzelnN8CrdzhrNP9Nga8RT3Y8nZMjTB+YmUEsyzjzJi7PIQ0UxIO?=
 =?us-ascii?Q?xWvXiU0FMeg7tkCkbaXTfBSj+23WKcRvAIyvbU8y1uJUdC/dw7uojLLLh74d?=
 =?us-ascii?Q?nc7wTI7rsmSYtVUggDouYV2u5H8H406CG5h2W4Yneq33gCJf7pN/x0zGRaiM?=
 =?us-ascii?Q?29hc3NN55ww3/mbmONVhpFtcOUOtZZCsRfrxVXV4+tLbqvYoaAPzUVzdPoEl?=
 =?us-ascii?Q?H6auVD9JUxNBa54CntcSARvPHY5Yp/jZSdSz1tYkShM+5RyehiN+4L6HYGaY?=
 =?us-ascii?Q?mHojv9QjSqPc4jo8UOtthr7O/k79HcYxqnkg2QTj37kb6lwwOpqJWZ1FcQlV?=
 =?us-ascii?Q?rJ92opawAT7Kp/mKL1Xi1x7i6ThD3aEX8R2u65iHxFrHsdzaflGdZOHirgy0?=
 =?us-ascii?Q?hah78UTExWdtfwQD5+IAXP5vFmx5VBhxzbpxudMy4HS3uhHZofgekN1VB3zK?=
 =?us-ascii?Q?bPk5yZ0K0qJINynbQlmwCXHzvXg3pOmttJKEa3BoXkiVsrDyMNzRAOSanMLr?=
 =?us-ascii?Q?n5fyyLCI0B5LQtCABHv6cCNzDC771gEjKVUBjcLcQfEcUsAPz6Yut3Cad4gw?=
 =?us-ascii?Q?TtXba7ZiiY38nCBvCgMhhEPU2ZNlCWFKj/JKTL9mTzXT1FFAKbfe77gJl1+J?=
 =?us-ascii?Q?YUh7Hg+HQZzdxyPuhRUoGMF7OVNKMuOcoaiCP1u+zCrKVcmdCznvLh9+AOvr?=
 =?us-ascii?Q?1HKN0gDOlUVJPkvDt1x+vaTr6lDll4PEEXTlauzSl0olU4Dgdr236zz8VvA0?=
 =?us-ascii?Q?MOZdOY96DBwxfM1KQsRwvH3E3ph0CyuCFXXv5XZHkH49bKlU99EpTc2WtFC1?=
 =?us-ascii?Q?whPcAhZz6GC8J/wvOE20EI/4c0nFLjTs0gIPmZ8JrSwxiky/avlSFzT35TyD?=
 =?us-ascii?Q?/koX15KUOcawJ4Ysiapyogp5pTRhYpr3oqDQMQOoZgXZzdVStw1XqRYEiQux?=
 =?us-ascii?Q?Uvw3hBhDOHOdmbJDqYgLm6Vyvpoyre374f1yWzDrb0zpsujZ3GOfyPOM3WM+?=
 =?us-ascii?Q?VfykVVOAPm3hqjxeJAfvLh6O/kEaxfJZ64/sg8G2EiRXpQg97KHVjXEu7Ygk?=
 =?us-ascii?Q?hQaRLVHKmN8XAnkXRV8qBgUlQ6JEy0tUPU+HMyuWC60IGHMwoMK1mMCQENVE?=
 =?us-ascii?Q?ht83Pfd/WyUZ4d/Oz2nHVLpR+9tJiwUj/GS08XnZgwcfvHNgNpmNmNLcGNsI?=
 =?us-ascii?Q?uL4LNVxbEMjs+NJpV5Qf2PYTrPYMIpkqODWOkQ1vm8T6Zi/emmHv0jYwq4W4?=
 =?us-ascii?Q?DVY4uP9WfrBbiYIGys4gEv5fKZI6XRZjN4SbgTMfNRRMbafbO1yoBlfLYwlk?=
 =?us-ascii?Q?GdMP71EVTlUjclaEfOOoG8OblBt6lKPuXXbtgfoTTpJNMmKiyakyBK6dTls3?=
 =?us-ascii?Q?jy3FmqwKVJ3rOyEle8mde3dRTyIkoXqa2n+N4np+dOzCCcSjQ7J4P3B4uO7a?=
 =?us-ascii?Q?fH6l4Pe+kN8JzvHPqwL3TSyzK4vF4YVLkdZUEe7vWMT5C0EYpz994TzxJGy6?=
 =?us-ascii?Q?eu34LJzZ067YMsjFhBpmCD3mO3ofgJ0BGCg53yWtUvLy1IvxYgHguHnGWVH4?=
 =?us-ascii?Q?7xsIlX8tzYBLVGnNxo2vnIoIXUGgsSUn/qHXypSZKarc5mdcIRsqWp/4aUKR?=
 =?us-ascii?Q?YH5g5r9r3vzlYN7PcfxbVk4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MaQP5dbbyvWCGVoJ6t+3pdJitdjM5MzgQHiuYRiiNyHCMUoAELuCu6WxIwI1?=
 =?us-ascii?Q?oyjQyEQ4Ygp8SKot7L1NQnbMML2KBfADe8XDreIYzkJclR3RQ95f9LN5BguL?=
 =?us-ascii?Q?u9xEXbji8s0AAX3QNcyDPeE8i/mDICtkhHuJLNjECW3p+KV4ky0WN6CvfxdP?=
 =?us-ascii?Q?i3wid3tJSQsQ6AXy80E0RfAjahjCxqJbhjl5LaRbiJ19PmiD3ZhCjZ/2fiFc?=
 =?us-ascii?Q?U84Ypbg+ZQAX3Fg5uKODHiXMPQsELucrecK45ezzcUeApbcvFFGtyi89BHHw?=
 =?us-ascii?Q?5SsGZRnvf/X/7We9dd+jMDJan9Eb47e85/klzFQhNaYmYHufckdiB4679Dlx?=
 =?us-ascii?Q?2nJ3om5wZRnGZrFS6N1x77U/poj9RoDqv01Ft+ItLG/XEVcunuGQalDy4bFn?=
 =?us-ascii?Q?KRBpWjyi8F0otn7ed2DgZpx5PBYfaOzjqHTcBIR9emrGQAtyztpPneURBH+N?=
 =?us-ascii?Q?5xv29yuLymILP3zub/5EpoY+ojlv86tZYauqnkSHrQs/T9JijLZ6aa8KEjWG?=
 =?us-ascii?Q?6WyEZiLotWhp12CIe4T4+i5aBP8kV/ejb3beWjSpYDMWBiAY8pM6lguYIC+5?=
 =?us-ascii?Q?Mfr0+Ttm6mX35p/pqflX1eRcoXhIIdn1wJpTG8QtY+1IfzlRhlppvGUR7gNj?=
 =?us-ascii?Q?MAMHzfn6SSSIuAqj5AWFgyFAqu1uWharv9+MbL4S7YOyjioQrcgDzz9lU5tV?=
 =?us-ascii?Q?FpFs4w+nS57zcyAeA0ymPhX7A+ja5d9U/rYQPleicuwur4L6+SOcAT0Ry1DQ?=
 =?us-ascii?Q?V8LGAdKeXjQHzqrZfIUM2a+BVc5BgO2wqakJzZl0OQaq75PgjW6zziTvDgUH?=
 =?us-ascii?Q?56wqO/JvBSAWALQfy3S7/y6TCnS9Txk0qTQGONDmgTp9YlFtq6Xnr5qqtDkL?=
 =?us-ascii?Q?O5rSv7i2SNDglOTxDUPCKXqHOpKKaPBNRHVhuzAnkuX/bsRZjIqzO12jODjr?=
 =?us-ascii?Q?e7VqmSrc8a4kC0YjlSKWeQlt/DTz8ambNsTUBFvSks+39LCoz0DUBWtPwLkz?=
 =?us-ascii?Q?SAyepjBnthI16nPc43onAACJ5ZzuMyg5FhiUFX0/A1rvNGnJUtUMoTtKQW05?=
 =?us-ascii?Q?WrT5mmBocVBMA8RCQX3QUk3r9B9B/wSOlaFMdkmPFOwjTxfeveVyMXAVwcQ6?=
 =?us-ascii?Q?LgrEXjnLwFS1E8uBlXr/fpPKAw7glRrzluXcBQ1IkG1fnVPD1zk8GPow24to?=
 =?us-ascii?Q?N2RpjSgmfOgywcsNxZx+/VWAe56psdWX2Ezzr/cu9mH+9FYPQZ6RSAfNhEfr?=
 =?us-ascii?Q?5Nec7fOTu6I1zUCrQ0yCDS7wadU5QLzkm+s6+QEGSTonzRCX12dAlp8rktay?=
 =?us-ascii?Q?bSujF6A+gt1qGKgDv1aLN7p2/K8XKCtn8EC5XI6MEgNeqoDOCF+HBM8RCZHJ?=
 =?us-ascii?Q?8mKWUqqFKh0JPmCO29Jk53Wd82UAMYF3gbpOJY9qaSYOrrn/WbpLqVqP1YDX?=
 =?us-ascii?Q?uSAJ+aW4k8lJDMGSt963JhzrUndFrItbAFckTbmPlI99iqXfQBYvIyUqY+ud?=
 =?us-ascii?Q?/TKmFrDGFWx0U11Mevg69nBUcLs2gpCbFKOcpCCMZtaoB9BJnhCaUFws+Xcw?=
 =?us-ascii?Q?hibOgryU42IfIeSwfsnozA0QA1VQZinjPAqFt1IQmXwiVEJxTtTCq1EUYmDK?=
 =?us-ascii?Q?TdhjdrgUxyuq0rufHIMGtQlS8UdHok46UNAcsXL7MxOfJHBWzsuFLKTuvtrg?=
 =?us-ascii?Q?X3S8CU911XeaiRlqB5D6AOAuHEp56QUayay+U0gTNg0WdtsWfW13vwF6CEs0?=
 =?us-ascii?Q?ZRbaMYkGk+hUv8+Rr3jTdrNDhry1/Zk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aec4759-c09a-4f5d-9018-08de6a614eec
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 18:05:30.3348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bJJHVL3eaBR7bt1qsUjLcb+r53xnW7L5w3eGOwMC2bo/fO139cMZDrW0h1Gw+Vo4XeSY5CA66+rXmX5drbcADfyo9sk07HPPqFYSSwiXXM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8432
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=bvBBxUai c=1 sm=1 tr=0 ts=698e166c cx=c_pps
 a=ueqEiCdEPg/1B0HMGLd3rg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=t7CeM3EgAAAA:8
 a=jmWgeBySreYrfzyKUjkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: yjNhb4cUu03cYLa44bjwTGcqdLveXKRf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDEzOSBTYWx0ZWRfX0noE2Z+9+OVs
 v4x5Cq7F5+4FVug65sIJii2NRB2YbTqtTEMXBsiYqVi6qLp/ZajbzTNCeOVSRUdzxGwtcarB3wh
 JahGNv6jz2/rpYMLgWD5HijAaffm0V6kAdCWye2f5DLwPZXC9vtOe1Fxs9uTB81mW/LHoYRU3uj
 +nmGF4whODkHLT80Hb4jM1dsmx0kp9tIe1sHMV+5alPowC1IM60/ocP7/SYzHqNRUNU/TPxFs9a
 xBu4wfPOTBQaY2NbQ8FiugujRmDmi6uPuYfmTZ4JaOH9LRvYhbIKNp/05E5uOEtFU+45bVepNMF
 b/pu5lMyQJE4Z37zkaX/+HRhbZxznNv94voPB6fpRilFH8sfyzkZ5phKDM/POa8owEbcvfOfe8s
 eJfWFqaxy0dOLvZfdU8Q3HXOAPIKb6sPGc+uhNuA34n0FO+zaJfDMHDQcepYjUDhq4qvoRlA3wN
 WnySx1MlWioHucvR2ew==
X-Proofpoint-ORIG-GUID: OWcqBRzWzXxlt_2zP9GqB7Cnog6fhUfr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120139
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 18:05:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231059

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Add support for building the Linux kernel with Rust enabled:

- Update `linux-yocto_${PV}.bb` to:
  - Append `features/kernel-rust/kernel-rust.scc` to `KERNEL_FEATURES`.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_6.18.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index cc3831f798..fee97748d9 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -77,3 +77,4 @@ KERNEL_FEATURES:append:powerpc64le = " arch/powerpc/powerpc-debug.scc"
 # Check again during next major version upgrade
 KERNEL_FEATURES:remove:riscv32 = "features/debug/debug-kernel.scc"
 INSANE_SKIP:kernel-vmlinux:qemuppc64 = "textrel"
+KERNEL_FEATURES:append = " ${@bb.utils.contains('KERNEL_RUST_SUPPORT', 'True', ' features/kernel-rust/kernel-rust.scc', '', d)}"
-- 
2.49.0


