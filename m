Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6FC2C54E5D
	for <webhook@archiver.kernel.org>; Tue, 12 Mar 2024 16:34:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1051.1710261238693598258
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Mar 2024 09:33:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=iLhl20Fl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3801c4d08c=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42CBorq4007627
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 09:33:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=paSvBvTqGIHfrXoKba
	/lYZHz3Vnt8CgWAbFcwHfJKQI=; b=iLhl20Fl5ykZrtkw6F3ApXZl0DAfCO1jO+
	1p2yU62r8hNv1NtITa9TUHoUnNmKnxIXITR4bQm/+t6Rl2YKVjDbRDn/cJkqMe2I
	xOpUn/oFOEsG/BYJ2zEtss38D7KkmPNOhsO3GDezvFSUMcOAtx36PnImDZ6tf2jt
	EeXTW8Hn+gqxh6Ciks6dl/E/fIRj3+pWGmLpnYZWQXlSvCIwV8NxKKeuCZUqfobb
	5ibhOSw4ek9rM6IP990t8c76NpVrqRlUHNIPm/rylni2LNa4vl597cVkunqs9ox5
	NjbmxMLsI9elLoUPZfilCKeeiTRH+K7Pv0Dv1Lqx8jsSc4TiLmAA==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wrr5manfc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 09:33:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ibhYjTMgPRPu0GqYCDfEAyPuvCdP4XzuMokvqqaHz0VAwFtaGOHUhs6zA/AYwbO6//NZaaKoKXO5HTH7OEOKnPOKElnDyvin/mO+5Lw3+yujDsBqv9hthabMbPLObCJE3q0GgDzLReRNczVzKXEaqMjvpnjjhpz2RrUCMCS0/GgRN6JM2ui83PDgnKq+LSVTmvjCCLOxOtPUme+7OkQ34xObPeDPoAWoyF1r4Od34RcivgmsgN+BfHIj5XaL0cBRnlh0hbX5qiNHSer6t/TVudpD1+rZ3+wv/bGZu8XDjknnmZCc5lL3jtfkJ816F9RQXh5fH80Swg0+idJ/mm1G5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=paSvBvTqGIHfrXoKba/lYZHz3Vnt8CgWAbFcwHfJKQI=;
 b=lkVKnxf72REWZF9M9Szin2yiNX+TcW1Mkoypc7GDvTwUxo3MHGb0iG5h2mF96vSkfIv7gF1sRnLJraGb3/UMiJIyclimvmgqpuy1576arYi7BgIxJyckZB8CWGCrSbGq+ulQ2FOrQ2s1biZi1CSoQK3wRXROqkSbdg/2Wd1z8TfEu1CfmO8g/6lgydKomi4UXMxyvFbYclG9zM1oW3RHHrcdjrwJQ56SM6QvbHrlUceT8IbzgnVtc6qk+3kJ9Z38XOTnjyLGT5bYEUNlmwPMuFrlZ2txPKOXCTZna9JrPymKEHsJcH5c5oRX2xcpEyCfhWahbfPM52jCOp7RQ23H7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA1PR11MB6394.namprd11.prod.outlook.com (2603:10b6:208:3ad::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.16; Tue, 12 Mar
 2024 16:33:52 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6748:b2ea:d62a:9d0f]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6748:b2ea:d62a:9d0f%4]) with mapi id 15.20.7386.015; Tue, 12 Mar 2024
 16:33:51 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com
Subject: [PATCH] gcc: Oe-selftest failure analysis - fix for tcl errors
Date: Tue, 12 Mar 2024 09:33:25 -0700
Message-ID: <20240312163325.2075838-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0154.namprd03.prod.outlook.com
 (2603:10b6:a03:338::9) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|IA1PR11MB6394:EE_
X-MS-Office365-Filtering-Correlation-Id: d085e8fc-7ca4-4630-1be5-08dc42b2336f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7YzvRFnZ3F6gN5lj1CVSGDAZZHeH/GyNMKko1/+IEOO/JbcPo6RwteCGJgHxgUAg297jusZsq3TI4eOuQrJxTWPTf7+/qUKVlzjzY803T+2wGaj/6XTtYTzrCAS8edDuw1D68PLXEsM+8Pd6sKLs4Jb1Bhf0NVK2X9f2mOJPkSFbRxm358vVLX9kS7Q1GLm15DH1PRSYBt+nntUTxdgO8fiK/KCb6E3Scr9ST1I960ikDBochzi2drjhB8ghCc2+SQsHBqlXQ1av5Tx1Oi+ru0PN+C2eX5TrPIkKf3hTQcNdIb94iqKPEf1ULNWXEv5UXFHbP3OUq1fT++JK6RbA8bo0AB+v/m/90HV2Urwe+fsw5yczgwNCT+HZXlNxlCDpJUCPb9jSN9hqXq3Qq0fIT/SBdWXVVTlYTR6g1ckmE7drqkbE5LALif7DQICe9D5NJ1tVSTtPoUNBPtY17WAdj892yv8Z8hUXIQ7Wbx/QIJY+eu+nuBxAipLfL7t1Jl/Zl8l/mZh28fIK0/zaJztpgUU4Nl4y7Q79/qIX5VNIyMwALpjOrQi7Y9BB+zRkb2nV9q9F1DyW+b9R2C1g6C3ZJRlbtm1xL26N6395Qppxv5BhxmE2ag9I4Esh5+9O5LIjLOB5V+uqc8VzE0F64Q49anfFFJz4tNXghGwBivX+SC8t2gES1HPc7PgDZRHdKpFI+8euoSilve3vPRdKw8kXa6p5aUEDSlcNqkj0vZl+PjY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(1800799015)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OgKN9V8+XE/+e/wO1db0kYXXvPxdu/7+w4KrS3pkzYDIIipKcOPftpiDkduv?=
 =?us-ascii?Q?gEYgl/xzLc3C/K1yL4cFOHJl1fIuMcNT9tDJipWeOfpsL2NImoMeyLZlUUwV?=
 =?us-ascii?Q?aS72gtdi0nQvJn912pKPC4kGYh4vWCBV26l5pdkka1c9VScyz45MN72tRs5o?=
 =?us-ascii?Q?DBAAMRZzuAVjTi7zwzza/8yyU9h9QfpZLBd8tkWrR24guTH1EbyeQWFnZr/W?=
 =?us-ascii?Q?GzXBWRTN4R44VPNeF32/fq8r9zAc0iq3L4KeZLzKIrSwyvp72i6gEgy/VYVS?=
 =?us-ascii?Q?W4w0XdKMAy0+23oi0e8VHbaLUjAnpDf8j4DJuHL0NOt473qfOXJ4Vj+dRNcV?=
 =?us-ascii?Q?bEIsPp0sLmsyDrGDFSSKQrDvoRDg+DXvGm6zWbcEOmdeln+o+Bbn9MXJ5Xnp?=
 =?us-ascii?Q?W58rkxgv43WeWviHduMWZTCW4IN1SwbflA+Ap+Ls00+6GMlGxJfgh8koZkx3?=
 =?us-ascii?Q?cMYs4LAclIvc5mOnH2zwacyYuxXtv3sMCAecfynHK6CGX/f4DbEBQ6nuT19V?=
 =?us-ascii?Q?Dso9z+zo2tF3rBHcT4AK+sOlOHo5oTab/vjQlxao1Fs0lu04NRm1bQtzUSyP?=
 =?us-ascii?Q?jDuVNjv2orNQLr/yGdbcwOSC7+VdMLsWzq7v6tLOX3pKDqgfy2Uu6XGj8c+V?=
 =?us-ascii?Q?YpI+sib4uGX384M74splqKikkkcAxcQxsRG8V9bSr8wEdmcX3Q/Y0OqctaNu?=
 =?us-ascii?Q?XjrsSkIpd4eDPrljtq+MFPivDLxqZrAwLDt7F38VDs9TJGPSP9UaJeeNS0sl?=
 =?us-ascii?Q?qj7OT1KT1WvZc5Csims7Ovk/IDk9nL6kAKEQ3THY1KPmvNbBGZRHGAiKprtH?=
 =?us-ascii?Q?ncKSrsCwlJrgzZqDDYlteT8CLmpEvQ+RAjo73GvcACcvymcis6XdQxxRGN9A?=
 =?us-ascii?Q?m9efPbBsxVFTcXSxXfEHmW9E8z/iwFG6WqJGDibpbnzQueiP3E62Si3dCldt?=
 =?us-ascii?Q?4ih0uV3HMaOCXgQFcRc7IRaqrJB0IGJTxPUrnePT778G+az9FkaITTbcu6F0?=
 =?us-ascii?Q?SRXnLlExLh9NZ6/atrzaMVaMu6b1sdc4zgU9X1v03f4rW+9mQZ80CK933Z0W?=
 =?us-ascii?Q?GYViOouFonn5AORdT/4kAcsuhLLXzQAo8PLvt9N6Z67fAC1/WxWd2YXn6Gw6?=
 =?us-ascii?Q?MeZE2r/dOWRTuuQofytdH/xMvNapFTqFnOaGFKsmFJtnGuFIFS6sH4zEF3I+?=
 =?us-ascii?Q?30lFE7Je2B4C+800BVNNtiRGml+LOYgqefUQ3R0CKGpycZEoFR92BuDVGpp7?=
 =?us-ascii?Q?Pz+N81Shh2rvmSJ2/72e7JEhfrYOrfgN0YNa+gNaHhvG9Eipj2mZlNPNlocr?=
 =?us-ascii?Q?7iKP19t/SRLqayIA0l3d7/L6bpLXRh8+njjB+KGcoTdUz4ARzK6SLO7KpvXq?=
 =?us-ascii?Q?qtDURx8LJVQLj43MfFQzGJNMs56tObfbB7HAiJdFdTxBTBfO+wD//0sZYPZw?=
 =?us-ascii?Q?zh+i+Zzg8Z6crrEheC3KeoMPS12B1CwH7JkJpEwXt6eaGNQ08e0jR0CWsplF?=
 =?us-ascii?Q?QjKLThh8K17445mgxAlqx5tBFdmqLRfnMVVml+K3AUFDxTvXtYJ+zv4fArEx?=
 =?us-ascii?Q?GQyBKarmPRef6OscHDTg0q+xoKEDFhDuQIJ+igj0Yfm/p+LLV4JEhN6ho7II?=
 =?us-ascii?Q?2w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d085e8fc-7ca4-4630-1be5-08dc42b2336f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 16:33:51.6192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H9kSWJt4wBBHNOu5I8UUTqITViROuw7OF5lOEmBr4A+HyE9PS7z5L0T/MLgwmImj3nEeYh/CKmzPukYWw+tcQ0duQ4VPmit81rtGdvEK/d4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6394
X-Proofpoint-ORIG-GUID: 0FnwxEcjNy-PDcx549V9FOTTiFRgWDoR
X-Proofpoint-GUID: 0FnwxEcjNy-PDcx549V9FOTTiFRgWDoR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-12_10,2024-03-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 bulkscore=0 mlxlogscore=827
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403120125
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 16:34:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196998

From: Harish Sadineni <Harish.Sadineni@windriver.com>

gcc testsuite unable to read the value of variable $do-what-limit and causing below tcl errors.
ERROR: can't read "do": no such variable
    while executing
"set do_what $do-what-limit"

To fix this, quote the variable using braces, as in ${do-what-limit}.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 .../gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-OE.patch       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-OE.patch b/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-OE.patch
index c405d8d484..e4d57c27ef 100644
--- a/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-OE.patch
+++ b/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-OE.patch
@@ -80,8 +80,8 @@ index 9d79b9402e9..e0e5cbb1af8 100644
 +        # Demote run tests to $do-what-limit if set
 +	switch $do_what {
 +	    run {
-+    	        set do_what $do-what-limit
-+  		set dg-do-what $do-what-limit
++    	        set do_what ${do-what-limit}
++  		set dg-do-what ${do-what-limit}
 +	    }
 +        }
 +    }
-- 
2.43.0


