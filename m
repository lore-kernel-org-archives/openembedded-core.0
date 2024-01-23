Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C914C47DDB
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 13:18:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.11920.1706015933728871067
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jan 2024 05:18:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Rduw6jqO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=175275645d=yash.shinde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40NBrA8c022359
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 05:18:53 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=9jEFAkIRa/VIJDtfCKOlkCy+socHCN9jVBNMQ/gGKms=; b=
	Rduw6jqOOrlwbZlKMR42usSqLbvAxs7y+0IkdeAq7XHhYK1RGCfV3CTV8P5+3QAx
	tmRxCRf1xCLFIJVsqx9Y3TkUgKtyR8D72XVT8CDYaFesppzVBcYls8I2PadnkTTS
	wYzQoB+kkY+y5+80AWKxrN1COjN9We6gvmvhzRB4dIJ2STbPwQSoXLpfPxHbNKgL
	oAfuJ0q44mHi4gUUZVjYEACOm9/2Z/72IagaePwYVC3O/eu5Iyv4mkAIIROUqlxo
	SHS9Cosbgu0tPzOfy9DXSr6obxw23DRXzuutMOFDshfqhqBg1NmZLQzjKlTyV2du
	2Xr7Sq19v83NFOmjnFGsEg==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vrejku1fw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 05:18:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oz8Wi7Kz/mKlBoNoBlZY0nABDKZA2rO+30hFEKy5JE7UlgqxHLU7c2lmn1fU6WjXeW7Yk4Lgb89xAS7cREoancQXw98gc9hJN58YC7fD0OZSXkpgFJ3f7Gokl43OR18jZlCuFolm67MnXxs8I3reL7NVNTzynZZ8Zle/1gK409G1G3vA7O1H/W0OWV5NaZ4YwBzLo7W45F1ca5NZ1fiVYTB0n/iwjvv0o8reeZbD1NL7IAuZH8F70saKex4yT6Qeb3k/A1VW6Ct4f3Jqe8N/LEvqVWyECY6g9fxns7pTWiDSYVSq7efAGOeAEt9zxKSKct3cjFb+hVPFHJISCZr6AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9jEFAkIRa/VIJDtfCKOlkCy+socHCN9jVBNMQ/gGKms=;
 b=jjy23VWqpCiLqyzs8Va5IkBaa7f2qYQ9dIr4W1kHwiutBYWvTKSRTkyfrLblaE8GdpkWqYVvNzxFuZhHRSxORQLM/uBkaQS+2f2pMLXwsJeeIGfPEDuzGl1r8TFUVG89qa1xE3P7LAV8S+mMsdxtFULuBgUpVPASQuGSYQwS7bDPNLDHgYiP0R/9xO3TXbg36r9ZphZQRmU/tKL/Z+eL0WtVu48c4ZTwNigmabFY89O9/LcUlHKY2TqvvWNG8840zh/2AD1w2Ad9kdiLNIEux+A9Uqy5VYGIJ521aiNWZ9ou2KrP+A4iP1XKgot2FeEgLpQLkJJ4ZAOfZAvXMOS/1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DM6PR11MB4530.namprd11.prod.outlook.com (2603:10b6:5:2a4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Tue, 23 Jan
 2024 13:18:51 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107%4]) with mapi id 15.20.7202.033; Tue, 23 Jan 2024
 13:18:51 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH v3 3/7] rust: Enable RUSTC_BOOTSTRAP to use nightly features during rust oe-selftest.
Date: Tue, 23 Jan 2024 05:16:29 -0800
Message-ID: <20240123131633.641012-3-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240123131633.641012-1-Yash.Shinde@windriver.com>
References: <20240123131633.641012-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0145.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::30) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|DM6PR11MB4530:EE_
X-MS-Office365-Filtering-Correlation-Id: 35046558-ba5a-4451-67ae-08dc1c15d734
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zPGgFR6LfCqf0cMwz+FLRxBA43YsfxpFDH38GpUtgP3nlQ1xDJr3riWTZBM3oKqFLVXTytp3zKfjn+CJ6fHgcdZGjfvOjmgfWEkWZTcBbVhmhDzvKawImrWmj4WuHw9N4tLHzndkSWPcYnhRcRIa33qxtlBny/8QpGjLLCutcqfZ35xCrxqbUUIyQ7EMgiv9hjRmN07Vd7XCDj/GPrJGQ2htVykd8H0SW6xAlBnwxNJdTX29t/sdq/MfawTJWC1PtlFmtkfNzjR8iC8qkCGi5nSThO9l66hSAGkHeie0UN32QNuLubNOfxhLQpAaubE7h04US6P8RhGYB5XCqtKFJrCF5Gz25JpbfhY4sWP8GD8qdiEpyDAlDOu/BbaBfhQXmYzJ/fKluCbtN7Ln55UbqOS+HOfXfmg0gsFCNnUwkjTUNTIFU2A/DunF+Gr6jZUfO8kG70xOIMnCDANx45HoGxAHnF6iRJV2lzu7k2Pd5K7FgTrhvkjU1fd0jg1pslrXkc6DD6s//aTXrmGgcUir9NXGbUGTHEbqQtc31HaGAhC3LizHfzljHxI1Z+qOVtx/41KtHm4UtNzJeUUFqhjviVahsfaJ6JYMdmSUr1ohNMw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39850400004)(366004)(396003)(136003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(2906002)(6512007)(9686003)(26005)(86362001)(2616005)(4326008)(8936002)(478600001)(8676002)(41300700001)(38350700005)(107886003)(36756003)(38100700002)(66556008)(66946007)(66476007)(1076003)(316002)(6916009)(5660300002)(52116002)(6666004)(6486002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?t4gtUavPAzF+stmoasJFWreGjPtjak2dSb1XN4BweV5vkfJMZUdcDy+0iJLv?=
 =?us-ascii?Q?Vld7nN8DHVLyeB5SJJTPx7Wz+W1Y8zyQ3Z2avoJLrAazebmmEzDDgtowbk3S?=
 =?us-ascii?Q?vDFJz34RTn3g56JD6Hi6DLb3bD/+7TtvMzuP8f7knepSpQR2IzXI0rVpkq9Z?=
 =?us-ascii?Q?6jB6VKTGhVUEKSZHKZYm2wXWmMheC2+UQqGAHpilNGR6/HSF0+ds7ylZYig7?=
 =?us-ascii?Q?eNwHaKv2D4rAuBJLxGQ3So1B654ytGagixBvbbZy108qAPkJubApg0RvNtzb?=
 =?us-ascii?Q?/TIjzCWUkyY/sDyma84cte5c3RSTHV1mYenkdopesGYwI+QFOcMyWJYINnGS?=
 =?us-ascii?Q?krpnXj/cIuXZWaNBbm/QGJ8Gz5rbew0v4zKXi+/Sei3AkdSEzD3KokNKFod6?=
 =?us-ascii?Q?dN0fpIzW3fA/PT1vgtMRcpW+JfMS+cvcKmBQb6onuaewCOUTwSOOgzhY/bB7?=
 =?us-ascii?Q?HF5lDHa7JtzJNZ9eRCKjo8kjk5YLYrsqu0rs4ou9J3kT9k5hsogt9iMlNbjt?=
 =?us-ascii?Q?y3/Xh6pZSdmbyZMF1GmcxHA++U+//2+iewSnYXwqxoZtvCq/RNn0Cgu6HUWe?=
 =?us-ascii?Q?tF3vu3jr3APWornEqqkXEW/v4OO6iZeuRALoBBgsZ/32KwU1nuTJ0KpwGE6+?=
 =?us-ascii?Q?OtJypXCY5kNcaZNJIjgXKGkqT4o2u4rdjih8IoMXV0gfAA2rXtivKMQiEraA?=
 =?us-ascii?Q?/c/6AKeK+HYi1oY9F51OjjYA7RhFkrNNYF98ItbrXRRhr99t7QByhIRDboDB?=
 =?us-ascii?Q?sK9PdSESSXPdsQ7ohtoPFb9Xs0cjbK4gVP3a64U2p/PVIqEd4HuCxuNk341o?=
 =?us-ascii?Q?BAO8I33o0G8Q2sIomDSc7mQQbqDFDo9ffwjlVg8UFTxELvTDfcK12zgTqlJR?=
 =?us-ascii?Q?EYAK7chSNLwzXyG/zggqPngR0shQSdLIQmRfTCSAaQ0Fz0r8gPe74VHNIuCs?=
 =?us-ascii?Q?WrQtqWGubgyG/+g8WUMbgVjtISvUji9WgWa8AOxYs3p+txfVyr1C64vaX+9n?=
 =?us-ascii?Q?y1CsfO+I7GMcvK8pCKBNE5YqpaRn6rZLeSfz4NAN1xGKA3se/XS9DIxu6PPW?=
 =?us-ascii?Q?+49EVCqJusBQVYBpP4HM5dkNffdgrVCPeX9VzK0sh/+MTv3uCSfn0OYEUvqZ?=
 =?us-ascii?Q?zGURe0oJWMfsVqRpIE9A8ouL/4sWnOWfJ5d/GVRa6OwsQPYiqZao2sNntTc0?=
 =?us-ascii?Q?xB9noM45398ztAiNrHG9uN7Mf5aldMikW+QfHj/0/9OTJ8onzMnR431OLq+p?=
 =?us-ascii?Q?N790yvhpsfy3FvWeKH/99lthOU8S748CJrQbgE2JvbKMRvtbJg+VsHX/qvC9?=
 =?us-ascii?Q?UiJsAQRzKA2f+obxyiQQGyFKgutXGOAmcgx6AG9aK16pTUVJjeEW170an0d5?=
 =?us-ascii?Q?IwmKtzfX2Or6wnvbYPNX/3epZr5kP7EfejjdwuROTIBplaOXt6y1KAUeeQYv?=
 =?us-ascii?Q?nuYzDnX5rp9tDBdHGPZOoi+zr1FNBa02xeZQtE+fOI6mHEvGbWKF7PQqx3Cw?=
 =?us-ascii?Q?ylSX4x1h3gYmMKqC1Favgr455om9ohchOTxAyBt2BYh9e4rHVd2aLwOjr1Iu?=
 =?us-ascii?Q?8TpzQ10P+Ib6NqbPFO0tWiYpoB7y7k4O4ICEDKfMJ9C2l1F8XWyXCz/XdOuX?=
 =?us-ascii?Q?BQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35046558-ba5a-4451-67ae-08dc1c15d734
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 13:18:51.2673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kd9JF5TTeuBXyrcGt+cls4bKtl/AgpVwEKQ7X2MN97SshJA5Zel4nljFkqlG2QXj7VHjuNJz9katVdzCkDdlauuXta3wnT+LJlviGCmNrXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4530
X-Proofpoint-ORIG-GUID: R7JzrNWH2-gq3rfRIiOqQwz4zqQMvqg7
X-Proofpoint-GUID: R7JzrNWH2-gq3rfRIiOqQwz4zqQMvqg7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-23_06,2024-01-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0
 impostorscore=0 spamscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401230096
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 13:18:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194230

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


