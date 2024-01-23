Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05349C48277
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 08:10:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7164.1705997439158293482
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jan 2024 00:10:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=YA2wsCOq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=175275645d=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40MCfXe6020788
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 08:10:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=9jEFAkIRa/VIJDtfCKOlkCy+socHCN9jVBNMQ/gGKms=; b=
	YA2wsCOqGvdhyR9WLn/LTbQsVCxd02gBbP6HEuv4YZ/w8Lrvh/+zFZolTsahumhb
	Z3gKe2IrqGlCuG2EcRQR9jQfG7rUwijWRnyIka59Da7CZXItr1ZoKV8mPYP/0FIj
	aITLH34GY7obHTP3nc6DQDeDIM3Matz4g5V04uBGtpAkVw2ATYBvE+svaunoSGNR
	0mzorf67/QRV+9LPe4nEKw03V1wkLRQsiQEu6kZk4LPLbRzIYXExXem00hScZ4Hh
	U/Pun2rN/jaQ//qGBW8dk2K+BTDtUo0WSLwPpho9N0ClkIiqVSmH6y3Rp7XpGiIq
	qVFSS70CVXMyw+04e/0m8A==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vr3cyk5sr-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 08:10:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gib1jWWAIWZQHsE0vriWfdDDlOMCgBpkTGFJ3RyrlfxkCxQSWp6UOlqlfb4a5US/qaCl98aqxJ/+U0OLArM4cJUyEXxJJ/wU5hoNeikozPO4tmcWak/iCaAfzPJawdMhA1DyJu260//xABl+sveeLq24qROvk+wcpMBi/2sOl4jQYfM0oiBRtKd27WGMMWXpE4V8LEOP8MzReKXTty67AYU83IsNPZkIDpovzjjLA3ffyh3piJNEhns2Gsk5xG1T9eMfXgQZFv3fyH/v/0LDLV+Bv8RUhCy37N06j30/gRsAJagKedNPgmTsdiK73bv7cBnxEDrsei1Xl37O115FPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9jEFAkIRa/VIJDtfCKOlkCy+socHCN9jVBNMQ/gGKms=;
 b=fd+rA42qr1vqCRhYceIoIVEpXCXIS0hsgVl0VRJJfz73Yad5DV4fFagdyhlD5dehlO9sf2aZyj/irbPSIZ9dCNUaxbK6+aRiQdTWKXHj5ChH+xId+41vm0/iuMiLvNFGaRuBVDHtZe8n3vuyR2Q3bTRT35UlJiHw/POdQBG8+l1FafD/Hauq/g3kK3riZTHxB3tbfbJxqiWkonzktn9VQb8XhTTWB7Y3X61I85cwA8UMrO4RJYrF6ORRYCyeW16mwoMSEhjHppRNCtC6tXpWeyF4eIBNzGftUWB9bsEj/VCWGUHRE0IkmQiaeOuRK8jSaArDQdriYAxyT4DsPkBYXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CH3PR11MB8344.namprd11.prod.outlook.com (2603:10b6:610:17f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Tue, 23 Jan
 2024 08:10:36 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107%4]) with mapi id 15.20.7202.033; Tue, 23 Jan 2024
 08:10:36 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH v3 3/7] rust: Enable RUSTC_BOOTSTRAP to use nightly features during rust oe-selftest.
Date: Tue, 23 Jan 2024 00:10:02 -0800
Message-ID: <20240123081006.3310715-3-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240123081006.3310715-1-Yash.Shinde@windriver.com>
References: <20240123081006.3310715-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::20) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|CH3PR11MB8344:EE_
X-MS-Office365-Filtering-Correlation-Id: 55ac56ee-76d1-422b-8fe9-08dc1beac7b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Zc8VGXUPFWeO8t2B7HpUF9T5POUIToEWqqrWPyIQyXWYQviVdsYKdfDoCU0TFAJGi4B/jMzpdjDDC6MOSMKlNuswEYrC562rrix3LeIC+fkFN7dGscOL/Hm+yUubZ0MLtw2HjyUTqNd9b/m/QMFv204QF+nm0WIyfmwW4wOsa1OsSPgWBEtNJKuC3ne8PL4CvPxzDYRaB/WcRm5iRUhRP8cX5rcPl1SeC17kC9fun0FdTW4Ly0qe35k6XE4v014qVe8BxUu03i+VtYQU8JUOkJsoyhHCh8BC/eTTOgIFdW0Lr8Bm16GoR//CpnTU1ZgjMH1EI3npLhvmaDzV/69Lv9gZ0d/89wXzZqoMiXt0WtXJbNYDq6rxdjOkRMMALxD4QJYJ9Tm9CF7qFaPrh3tBM748/hSYhsBqxD57+GI7r5jObDHKu3WnrQY4IRGS+/h2KjyQtoUTKLRr+nqWI9bM8eq53pwGyTg/P7yN0LPPzG0RP32Q0nJ/ZYrGjFM0oiiz59qMAzqD4WLh+FH9rGqouxsnvaiz1IOszGnwUeWZlKXoEoTwdVTB50UTUOowFcJonld1MHAzUzOpGh98MfNd+m5DMOX/luD4QE7wXNfv56c=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39850400004)(396003)(366004)(136003)(376002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(66476007)(316002)(66946007)(66556008)(6916009)(6486002)(9686003)(52116002)(6512007)(6666004)(6506007)(5660300002)(8676002)(26005)(1076003)(2616005)(8936002)(2906002)(38100700002)(4326008)(478600001)(36756003)(38350700005)(41300700001)(86362001)(107886003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?P42OCurfUS3OjJnyO4TLMkt9zgJUHOmV0l4xwQog3/wpp5/w4OXt9j47ojw6?=
 =?us-ascii?Q?qJdlC6V/ZrzJgSogVLcJqoOyckKfF44XIrgeXLdUJ8SCa3lFpEqzYpMbWpVk?=
 =?us-ascii?Q?5xxgBwbt/kf80Xk7WjeTjJlr1I2ZWcT3yQhGvDJRO7L+V8StyU0066AnlgFT?=
 =?us-ascii?Q?nKhIvMgF/4cylMmu6TgRAUPZX+o2DIMeViNXC2b4i1tEO+4LBT4aeTe3GM9Q?=
 =?us-ascii?Q?1nle3cyBgvpUCR/A4LTQo93qQ4FC6GYq7EZABGFW+rtxLzjxnYTcHqMOvbUf?=
 =?us-ascii?Q?jsSbx9r7JHpLxFThPW9D84/r2dCe9WUrcWjDxFetSffIcw9U9QIcJZ1BLMjS?=
 =?us-ascii?Q?y+KF/VbygPH+6ZzDKwtGp/gbky3K1mwftWLLyDUGcmFvoT5s2BoEfIYeMRet?=
 =?us-ascii?Q?UWbkLvVUTsuTSRSyVpLDhkzeA/5r0qDHqrP7UNWuHxLlTPNdc3iuk2hfh2Ks?=
 =?us-ascii?Q?PKfpu4s5B9U45WR7h70Sx6yUx+iqnjXkYQM81wn2HEDkI0QDdu+ruXkW5Dny?=
 =?us-ascii?Q?NwLZOVZS391VW1l4UTSOUH3AWRlbk2eFb41Agh0z76UAqqTOXaTbOwUwqUVV?=
 =?us-ascii?Q?wm7OJvyY2mgvuFmktO9k1MHKOY71p2N96eq8lH++fEPZH+x30UN4vCB6PWCr?=
 =?us-ascii?Q?HkpAEu16tEmj8eXJGdkCYKXACF9/uP0XJVnQfIlz378B0gAjkrk4ivghqcEp?=
 =?us-ascii?Q?vG4AyWV96t1vc4TXA6ftjmjSE+s5zUmCzm+E9vSdB6J8eNQPtbN7ZGa2Nxx8?=
 =?us-ascii?Q?R5Gfqxtsz8qfbhxCQsp6w/UClPWB6/UVGpMIClWPNF+NW5EZtqUaIZ92Ex3P?=
 =?us-ascii?Q?F3i0yKDP+Hte2B6Krx+y7YsPrXxIcoai9336MRxA3aAzlUPKp6Vu5r/nzezN?=
 =?us-ascii?Q?Xl3mZZSiiOp1myBocAOL/0cHmuFnyvroro2aWe2Xhej9lxegwXskHl0H8qQa?=
 =?us-ascii?Q?H5mhIT7BsLFYB23ZkYJQzi66zRlI7YTUiXVz6tTrwmpYScz7Kx5Q7OpnNo9P?=
 =?us-ascii?Q?EmgNRduNTqSbXUPzr4tNAbqcbogvTdrtgjSmbUf/wXe8kOrw2QLDRir/EPdS?=
 =?us-ascii?Q?aHYV+P5ItP2pBdJaMV7PKVa8sEvN68RjSxdLlzK1jkO1QAgtALpA/5Qa5d8O?=
 =?us-ascii?Q?2CPR17UPNCKBO748czZHUoUEZrGprin+tkfHcZ+DLwyVV4QC39d9XoibdlRa?=
 =?us-ascii?Q?9JYXEiPkES4h8Uq1dUi4YryGQZE7f9kAoWZ7BAtZya72CiyCPAOqCK9wId/e?=
 =?us-ascii?Q?5TeYQ8srCg0Wx+X4IiGozqiNzTD6ePDiyV+Pxi/ihzSEB78hj3Ntbj44Pxw3?=
 =?us-ascii?Q?ExZCCOGhkNSTFt5cCqlo2PYrvnXIg3pmLjkzESzD6Gkx+GI1ELLM+jcdnYjG?=
 =?us-ascii?Q?YeIW2df3sy8zm9ssU6L4kbvp8klvhsh/PSFIuEAMeb5xYywtXYxzxEZoUz70?=
 =?us-ascii?Q?/4W4SyPgwFXGOYvZ5GffUNkCPQLBHzF6owy6IR+hZbpPHzqkCgAKCGpPWTa0?=
 =?us-ascii?Q?Z7JNrPEi6CiUDsQawOixzdzdNAQJ2mWHIO0xULM13Q+a9VygVBkyx5fZ1nlk?=
 =?us-ascii?Q?4XOWaVf/PHHLo9D3ZOvFJZvrrsjLtAd1+48ibR6cTrp61SaQ8Buv464fbxJ4?=
 =?us-ascii?Q?1Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55ac56ee-76d1-422b-8fe9-08dc1beac7b5
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 08:10:36.7700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1FA+1HSBWxuJCT0g35sQVbAoiopAW+V8bTXZ3QPZ38VsBWcn8NL+GC5R6rYELBPtFvOpL6gVi5tQd8/sL2o8mYKpFPtPw43g4ewGexX2BqM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8344
X-Proofpoint-GUID: 9fmJl-61rwB4KMD84fbVtVhWYnnyq6_2
X-Proofpoint-ORIG-GUID: 9fmJl-61rwB4KMD84fbVtVhWYnnyq6_2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-23_02,2024-01-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 clxscore=1015 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401230058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 08:10:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194208

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


