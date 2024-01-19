Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA76EC4725D
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 15:09:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.24503.1705676988554702713
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jan 2024 07:09:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fZrF9ZYY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=174893ae64=yash.shinde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40JAU8Xb025621
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 07:09:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=3/tKLyUcn8JYi4nU6KRjMEGi7TGeggur/PfByqa357w=; b=
	fZrF9ZYYc+Unzg8VPr8zUSEm+sdttVhb/ywk4OjTSkTKytt3tcYRotLqCk3r/oX+
	TQbIjug45wKOBYIJuDmSjDGbswg8q/TDyAAghOd35gntIBZdIzjEVBlob1awYSwj
	ecx4VNBRLa6kQVVut40qo1PFxPFAO9nJ44GbWHiiWH9B6sbyubGBlJT1tc8lJMts
	KqYudm9Lczx2Y5N1T5ocNrhPWDt1myQ/BV1NGzih1r1u7oR1wqw9SKn8viwt6r8B
	WRbDZ4Sv7kV7wOU9emr1QA0q/ciV0zOr3pn7k9YwgeRpEWeoQ8Qdo39yleN8pOh5
	YsHmZruQIi3vPT0hFhMsPg==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vkpp46w0q-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 07:09:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iRfvGHhxcjkvPN8c8fzA5b5f36cCcPFsYBJWUjQBLN4M1wTBJtuP/9jifAntMXjfc65E+RwcZs/PV5GDLFpZgESz5ATYASr4+1QSDsMcmBgEoqSXjdLRtl/VOLnHLI/+VzvQxuKaKrpd4NyYaDr9J2LsWtO/iXEDNHvimzv461907/ojnhxVsg743/OtcG4QQAGZQDG7jQt2jRbaOY15dNnf3K81EhOzSigaCwWdwaj9YXB4fp50TwhuqGxtBBw2ysgMT1YKTN6lbOGAZE/fTnYvbSxSQLfHGPTxt107aO1/loAR0OtYnyDZXNO8/S/CU7ADd5khXr9lw0UDu5z6Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3/tKLyUcn8JYi4nU6KRjMEGi7TGeggur/PfByqa357w=;
 b=nyqF8ucHT85QmkRsHQf3DkwGUQTI6dcNPV4eBBTHhDDHZgnCCNEUXbqrBgt4nCEMGL689Z8D2UPOqw6NXaEQE/DeAvxjrpiEfdH46dfp/vZIwNvltENQYnJp6cd84lk/QwoBZzByrkdWwhreTwAmizZlqfNFw7z+9sdCRL5ypfI+EPJkPKG3S6xjQDF3r4MGsORxBjmDr/Bc5yinS8lKheJUOamGM5/E1z5fnc2MhF5Y1iM2VaIrgS45x8fU4HHFf6j924Uce5I5eViXzpBYn0Q/CPl7ce4U102nlfe1kqgO8O3TigGsLmcPO5l2B4dh9zLI194Bk/z48ZVSugvyYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DM4PR11MB6405.namprd11.prod.outlook.com (2603:10b6:8:b5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.26; Fri, 19 Jan
 2024 15:09:44 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107%4]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 15:09:43 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH v2 3/5] rust: Enable RUSTC_BOOTSTRAP to use nightly features during rust oe-selftest.
Date: Fri, 19 Jan 2024 07:09:05 -0800
Message-ID: <20240119150907.3840110-3-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240119150907.3840110-1-Yash.Shinde@windriver.com>
References: <20240119150907.3840110-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0044.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::19) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|DM4PR11MB6405:EE_
X-MS-Office365-Filtering-Correlation-Id: ba315bb1-4d75-466f-c896-08dc1900aa6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iulAjWxI5BHJBvMapbjIOZsmxtfQsdbZHsF0IJMnA7bRNiaFyiAPQeRlzyQCpJO5l+Bik5szBFPVPeWOYJpAgS/2uQDnsSJ3jTFhb+ldEdmJlmoObK2d5vih+/ahmqwD0PZ6+BRbmLhW8erTNY5mmnYYeXB/1f+7rMm29bdtOtkOixuKia/VlcAeyzb+d7EMNEpiQp3hjLjeuSlhLUSOKUlKJUmrcGpPKI1Dq/pYRdDB+aP2JcS+iAePgas1MDDJM9j8o+LaPPdjiFtflImQK0LbvfYFM4BJEdr9mvsUGIJdCTZMFiYxmWbLtywKenrs5CspD47Wst2N7VRujB2G3rPcU51c6dPT8QLCdxD+PsEFmJGCHMkZZ/+ygfFQBTtaWwTAmzWENd/GIk1fcTvR8tSVCHfbbQpq35Yxi3H96uTQoiaOjZAeBRdOcaABNqz3QG09Xc+XIKYRLSLN2vJR00Xic/crdl5n1cXA64/lT/qpQbYTO8Il5p+QXmf93inr28sOAY5XyVsZnEc//MsQR4WaPGhZOnd/s/eSrk/dOrmCvo+bpGXB7tzsLHkk9X07m8YI3kNDBjGwD1m6ztVPPdRhPXtP/z62Gam4eNLjNhk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(39850400004)(346002)(136003)(366004)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(26005)(1076003)(107886003)(478600001)(2616005)(38100700002)(41300700001)(8936002)(8676002)(66476007)(6916009)(316002)(5660300002)(2906002)(66946007)(66556008)(4326008)(6666004)(6506007)(9686003)(52116002)(6512007)(6486002)(36756003)(38350700005)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cRH8MbSqlgkfB3HoubPBuif/058KGKRgeOemle/4JlW6wv1XZd01cn+c2RT3?=
 =?us-ascii?Q?YviB4tuZOoKYPL9ovXk11KpnykBX0ATIRuqoPaX/Zc+Jzc6365Z16yZitPMx?=
 =?us-ascii?Q?hcdmDExKJNDb2FE0A+KklmzZRf8kXdhpTgGNXJbgIj5DnrpMbyUTjQz4PZVM?=
 =?us-ascii?Q?N/kjlNegGkht0HtzHKdkRo8zpzMP9RUglVq+DW6FqBTIMxCA0/D+sCLh5LHw?=
 =?us-ascii?Q?Htvw8Q5VKaDLJ9ZIEPErd0AjaA0f0NSqg3sTuAUJ2AllgNbfm78VqfifK/eu?=
 =?us-ascii?Q?Cm3l4UtUbX6FwlJQyCtk6vsg7m6an9N+YCtZvGfWCFWv6lkxB+pS3AwRGw+y?=
 =?us-ascii?Q?sRsZ/eu+E9gTYhvjgt6nXpRmb1AlkFnzg2xRGE+2KiqrXKupim0E04odmG01?=
 =?us-ascii?Q?GNBZbDOi+Z6wydat8D/Y4HcwLompcN9ATx7HK+h+G/kDhyffqrUzX2XhG4cl?=
 =?us-ascii?Q?zbv7qyUF1tV0xDFKWcWE6BX6Q3eW1xay3gpb2Oi3CtlgDHOgWG5WQh/rqdh8?=
 =?us-ascii?Q?pEc+J6BBq61i96XZQ7Y/aZXanvTZ02TK9Y9GrDM3jRZTSSMga9bu84crx9qk?=
 =?us-ascii?Q?6aUlbMEA/LqefbA+IzHCCC3/bJx9M4oH4Ljj3f2um8MoA4UeWa09fF1zGvZ9?=
 =?us-ascii?Q?kBMNnreqE1/sY88Q5b/QNurgkY9OsHutxOTfHVOqYbk4DTddRaImYBdphO5k?=
 =?us-ascii?Q?iK0Jsc/RUJH7D7VvKi6m1iJTSeVwln/HuaJxqLAWP24OPYsYZMxxQeyVinhG?=
 =?us-ascii?Q?QH2EkkBUdD0WbM0+/CnRORlPdRR+cA/sUmA6e0p/RfPxNwTJIqWM0Zcqazeb?=
 =?us-ascii?Q?kscNi94mOadb0sRovgyse0ltaRE9n2XtReGpllILtgatpIlB8RI+BBhggBOi?=
 =?us-ascii?Q?1/sMhw/zQcODLNfkTu2yuE4aaLPXsba/9/O+GIPzi6A/bN4QuurS2MFZEtRS?=
 =?us-ascii?Q?mW2JlHJRh3OP9MZLEvBM6DhI/xitXpPzzs8M96lrctMRpQlyEOK/y2zqUARJ?=
 =?us-ascii?Q?JuweFCRHhDpgoE2WmNFO8nDbWqyPfpzRqtM8o0/Yh1D/gzjnnAMM6LugWS0E?=
 =?us-ascii?Q?BaFKE5zTcMyH9unh/OE+kQGUO0V6UvhW+gFlTlD0c1rYL/GbuHPEr/YnN4qZ?=
 =?us-ascii?Q?qwfSPrF/0/2QhZjAI2M6Ceho5v9tc+XX3bCmkI2dhY2tTXUInHZvT/FNOOB6?=
 =?us-ascii?Q?JedB0fARskATlRq/wu7ETAFNJouygkpO52ODNKgj6+X4klT5re+oHrGRgPEr?=
 =?us-ascii?Q?T9V64MAlXg4xZPRhUayTnT5NpDhikw2hu3+2+IiEFKg4ouGhluqvzH3PwxgB?=
 =?us-ascii?Q?ZYAhFFqQGJ6WRsCsT6orNDPimJysj0LaM+9axwhyTIBj4aJ5ynJxrMXinDGd?=
 =?us-ascii?Q?w6ZThg/vR17nc1HvBXOdJa6xIdQSYD9Wp9eYYbMp9n1Zi8iVbBex4gaoLwnv?=
 =?us-ascii?Q?/8phUA9vLwAYwBzWBL0N+xTm6TkiFsxjjGxD9xbFdIGO7u012NRQL6Kh49z5?=
 =?us-ascii?Q?SM0ci7tfOfNV4IY6IsHUC7O+nht3IENl4PzaKiKHaXoZ6RU8F7NgQBeDF6bE?=
 =?us-ascii?Q?4MHDsessSdwvCngBzYapnGddaQAUnr+2SGjfIOLdLg0DbIane06qHUD74JBO?=
 =?us-ascii?Q?DQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba315bb1-4d75-466f-c896-08dc1900aa6e
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 15:09:43.1493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w9FsB+nqLiWp6gUtqtI8KeWkE255NkEnMLP9WKdFiMSVvboSQWjSRaMpXWXRLlx7IUu5eTJgjHTdl+JLjr56TWDRPdNV/Df0dvMXwIOP6Fk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6405
X-Proofpoint-GUID: teUvleA5V-iNKvyoAq2ijkRWOs3C7jae
X-Proofpoint-ORIG-GUID: teUvleA5V-iNKvyoAq2ijkRWOs3C7jae
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-19_08,2024-01-19_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401190083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 15:09:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194055

From: Yash Shinde <Yash.Shinde@windriver.com>

Fixes: error: the option `Z` is only accepted on the nightly compiler

When rust.channel is set to either beta or stable, we can't use
nightly features on bootstrap without RUSTC_BOOTSTRAP.
Set RUSTC_BOOTSTRAP=1 to use nightly features on stable or beta.

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../rust/files/rustc-bootstrap.patch          | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/rustc-bootstrap.patch

diff --git a/meta/recipes-devtools/rust/files/rustc-bootstrap.patch b/meta/recipes-devtools/rust/files/rustc-bootstrap.patch
new file mode 100644
index 0000000000..406fc610bb
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/rustc-bootstrap.patch
@@ -0,0 +1,21 @@
+When rust.channel is set to either beta or stable, we can't use
+nightly features on bootstrap without RUSTC_BOOTSTRAP. Set RUSTC_BOOTSTRAP=1
+to use nightly features on stable or beta.
+
+Upstream-Status: Backport [https://github.com/rust-lang/rust/pull/119619/commits/8aa7dd06f6e50621dc10f9f9490681be8a45876f]
+
+Signed-off-by: onur-ozkan <work@onurozkan.dev>
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+---
+diff --git a/src/bootstrap/synthetic_targets.rs b/ src/bootstrap/synthetic_targets.rs
+index d2c65b740da..45baf56f46b 100644
+--- a/src/bootstrap/synthetic_targets.rs
++++ b/src/bootstrap/synthetic_targets.rs
+@@ -59,6 +59,7 @@ fn create_synthetic_target(
+     let mut cmd = Command::new(builder.rustc(compiler));
+     cmd.arg("--target").arg(base.rustc_target_arg());
+     cmd.args(["-Zunstable-options", "--print", "target-spec-json"]);
++    cmd.env("RUSTC_BOOTSTRAP", "1");
+     cmd.stdout(Stdio::piped());
+
+     let output = cmd.spawn().unwrap().wait_with_output().unwrap();
-- 
2.43.0


