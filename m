Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B232C47DDB
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 13:19:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.11787.1706015943829163263
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jan 2024 05:19:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bjDSyUcs;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=175275645d=yash.shinde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40N9KU5n027469
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 05:19:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=9hiupUaIFvmDLdCuM3V5IiQ+mfwNdd5lWAHcv7Ylkws=; b=
	bjDSyUcsNVJHLLsAT1UPSxzSu3+6pEj9ezAnTZCu0rCLW5PPrUF1FgNbtaZsb4CE
	fYMleaUiphYXlSFXOZ96NZUM47tvfmi7XLXtjG9lojLuvpbELqz+RNlv8G2itQS/
	BrNDgG8tb1IK18gWUmGaKxYFPH7cvxkuL5giKMjSe/OAc90YWiqyxurGUHh/Sq94
	HqMSL/j4leLunIHqv5EF+kwtfcxsIjmSjTT14mjLXOKZS88Xdmn0p1gXjlJtWPrF
	+MVvLbCkwygZAzGM4EDU25siJZRh6g668Bxy5SqzwRFG5HZmLa5L1qQEl9YFd90R
	edo5YdsUD9c3S9IdCIM1EA==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vrejku1g8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 05:19:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IyPZuyeN5d3MKfU5FDwWH1mc57AU0selYCGMZEMNZxBn/Z9eZuQRDgvjeBaGMsjlcC/HKuxNcfVV3fYw/Mu+2nZ5fbblKPrVAXsFlNRmlzRcXR4KfE8nBN5wqH92ahw/FfQqHLscfYVxw1lYVgJhfKOah728m6pubAPd7WP+uk5PRGpnQHeqBcrkOw7rvbCABH1hTKhiVC9wwXjevaJ3ABDqyiOb+HxA06IC+Vo1+fMZwVgJrp7Van9OO/Mpj0m4E8cHH3vVMvD1q+LXEQemdG/JvihCRWnV04ANR5UhueDxBMr7yqtPj4ZiWjklkiH0/q30+lPo+9n+ExyeJN1xcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9hiupUaIFvmDLdCuM3V5IiQ+mfwNdd5lWAHcv7Ylkws=;
 b=oNrwXjEwk6CVU73B5czDVtLakel/jAdeXYPHN5xLt4hXc9hYdx2W32Jc3SBCeZ8xujJxMHE9xRM+TjRs/q2lnXeIxJMFLZKrbdZxlsMDTZh1I0wZWf7YlMa7TwY1/iQN2MRfYIpLhObbl9IuY30i1EKfhCiIMepv8zzd1rF4o8y7ph+koYrkLX0SVTyMW8QjZk+hcF2oJLQWxIt7okoUd06kaCPrieiZwxswB64dCxSMmdsD5EVouOfpdh/m89C8hKqrXbXNBAecE4beCDXI3dD3GHQj7LjKb5b7OBnd49bio+C8pzg1v4jzH3NdxSJz2nvHYz7LBFGC7fKLLZdpzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DM6PR11MB4530.namprd11.prod.outlook.com (2603:10b6:5:2a4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Tue, 23 Jan
 2024 13:19:01 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107%4]) with mapi id 15.20.7202.033; Tue, 23 Jan 2024
 13:19:01 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH v3 7/7] rust: Enable rust oe-selftest.
Date: Tue, 23 Jan 2024 05:16:33 -0800
Message-ID: <20240123131633.641012-7-Yash.Shinde@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: de498923-ab81-41fe-8ae9-08dc1c15dd30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tGjwUPv+XSh/sYVKHywQeeV9hOF3VNnt4WfVWNDQw/UZYTPsjZt8lpSJgqjirDAVU4odFoqVNygJcq5fGsUGuwm524Y9FKtTTc7lHvNFcBdXK0qWC7/R3oPIqkYXcl8+5pW67stFbuXVorjcUldxG4hfqdFNz5w07alCqKg8VdQyTAMJs7hNzdBgJ9J2gx7iHpVC4hyp1RSBk2cQVFxt4nV0RksFpQ1PK8yHdknfuhxwao5Ivr98jCapX7OyA5WVWo2ST85mGnIGkbTNN7DaNzGSihzhUZ0CChMDiM6KneTZhh90cWhewE52xdhwhI4P7K0qssBhxmtEM5XKdPpO8Gz8/Oe0toAlSrK1DvfIsPn274Co/883gAa+AI0rCEKFd6WNkCsDmX4w6G+IVIRgw0Jm58A8UlWrTqM9Ok5k/BE/jsaHThbb5Ht6Pe8HmM2ua4Covc5V1caAC3xZqGJFp9zevfzqFZrkDF4kJJqqrcRm6D9z83TidJbZtSHkKmNtb2PaPKlEaVao6sNfR4VmWJyJCheIEkjJMPwobWn81zstOUsv8I8BzJ/lSqPfdzUAtmTlPPDy1jNrQqLM2JUuTO/II9wcmGpJzmv6GDc5xZM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39850400004)(366004)(396003)(136003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(2906002)(6512007)(9686003)(26005)(86362001)(2616005)(4326008)(8936002)(478600001)(8676002)(41300700001)(38350700005)(107886003)(36756003)(38100700002)(83380400001)(66556008)(66946007)(66476007)(1076003)(316002)(6916009)(5660300002)(52116002)(6666004)(966005)(6486002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NzADBCZZxTrYA7rxsU8ZUS9OWp5g+f7DBGWiIpf7MIn4SbyMKLxA7fAyAvt6?=
 =?us-ascii?Q?aPlzsWPeR+3FkrpJMuKAOryhyv1dH80oL6g5FDRhjUPXg/NpOgO41PXpfZnu?=
 =?us-ascii?Q?oDH0w9MVGLzCCR7mBqu2opzhyjF14JVK+OZXkk6IIeWXZ/gDr6Ax7B5HqwMS?=
 =?us-ascii?Q?bHcNsWgnzda0V3nFlhh9bGNuW1j8HyFez9OIHuMxH9t1JUy8FfCF5YWflqZO?=
 =?us-ascii?Q?flRvPqWPjDtbHhNsNhVY0g3ANLO6WF5OsQT58ilocyON1zNNvHxuxi/PfN4F?=
 =?us-ascii?Q?Xg/0JMpAwr5dXkCICzDnUEpfcLNGye1BNOXTJPGTPC9TtSC/kdmEK6CV9nEk?=
 =?us-ascii?Q?GtlHy0zTg2gDj0l5Ve1dRlU1JAafQNzd1a3zkDiFST32gQz+Mu1XCEgxVTbA?=
 =?us-ascii?Q?ZI9NefokWhCYYC5z25fJxXi6liySVtrROQzLlK3bmIX9RMfa0WBO7LLmoUpJ?=
 =?us-ascii?Q?n5nwia6dXiVzqrhyb6dW6mlsKb7IuP46rBIbCRg0zDsv/ciluj83ZKNQytnP?=
 =?us-ascii?Q?x9nED0lNWyRtiPl+fBpz41coBk3dlGdb2dlrAyYCpkOm3tKzZHQW5oh9FDci?=
 =?us-ascii?Q?8duHuh18wNJxS3gF2iaaCwkRez+7rqhUX/kWCp3cuapHifEE+gNDFyeNqD1E?=
 =?us-ascii?Q?4lDrXj7aLj4kTxSh6oqbNrgldAYeLWvWntj9rRbdsq2mS9P+f6wqIjETy1HW?=
 =?us-ascii?Q?0cniVyq6N7a7M1kr2skQDSClgY6kkiKhj+mFFn1FlbGFyYHkBz70fZDWlFhW?=
 =?us-ascii?Q?kRQe+9IkEdtx4Fm79xBwn3n05QX0CF4xRYQA1NR48LglL/RwGQoK0t0QbwJG?=
 =?us-ascii?Q?AzVwIFBbR2zB/3Al8N9fr4iDyMZLHTd7HBHWZy9HTdxLhXa36sSItdBBGTu/?=
 =?us-ascii?Q?iYwVymSlRzLWoxOs/QfoQ563OxSAm/EnNJOY1ycgLZTJ0nY5pEGrfqGe56SF?=
 =?us-ascii?Q?+ycD0bYjL5FvWL7BBpSf55P41foN/0UqMX044UrzfvrBrlmIrrXpsyexx5HB?=
 =?us-ascii?Q?rrDdCJl6tDusCPRsTDAnz9u3/TOjS3Xn8wQ18GjmmuIA66m2AlEx+j7g2tta?=
 =?us-ascii?Q?4Fkk48SiB8iO+8X60HyHCZgm5zULA5T9xWxnay8+sPTNGvGWtvGtTemS+R2x?=
 =?us-ascii?Q?/p7CpiTlCqYlW31Trs7NJpwv9vlko+seVYd3sh6kB9nhI5cufwavFJNYo+hN?=
 =?us-ascii?Q?244wuD0RRcijQJc3RObi2FexucsVS1mbLCF5njpZMnJcR8MlBDF6EqeAKxqG?=
 =?us-ascii?Q?vh3YXeMI7EIXOjNPPW0gcmqpj+783tnh9LOabmsss6ERSuS1hO6oilKLr05b?=
 =?us-ascii?Q?4q3rUkEEfemDpDMnuTDLNhR14l4VoCDldAydFmN9nbYfsd9zyVmld/x1ys+2?=
 =?us-ascii?Q?UWl5QQQ4fB5P1qXbMg+eguMCsgI9ETzJ7DmgEmQj+ynCyj5PvEw5a6fW+1GD?=
 =?us-ascii?Q?TT24JetAWfHIxNeeeAVsm9j2CarjEIqDFCWCRVI0Mv3sqoPEW19FYV0EpZjr?=
 =?us-ascii?Q?cjAvO9qYCZxvq4qkShRS/9iMYs6iFYlszp3ks9MLwIKNnfbv+JEiSDDyv3Y/?=
 =?us-ascii?Q?+fXiNse29S5LxyBtNkauHit0WAtMGCuPlQuSFnGgotob0Yrb8I23kYpvjdBq?=
 =?us-ascii?Q?Xg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de498923-ab81-41fe-8ae9-08dc1c15dd30
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 13:19:01.3049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g4ayLZNNBRXnbPBj6dvV6dtuubivr645PLDmZM3xsyt4iH9wyq6a5QKmR9xja2TDuqTOZKpd5OtYuhKCG2sDmEhvycQ6Jow90uNkfK7IX4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4530
X-Proofpoint-ORIG-GUID: 5Ua9W6ow_TeNPI_4PmESKRmQG1m8ivSR
X-Proofpoint-GUID: 5Ua9W6ow_TeNPI_4PmESKRmQG1m8ivSR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-23_06,2024-01-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0
 impostorscore=0 spamscore=0 malwarescore=0 mlxlogscore=924 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401230096
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 13:19:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194234

From: Yash Shinde <Yash.Shinde@windriver.com>

* Enable rust oe-selftest.

* Include the dependent patches for rust oe-selftest in
  meta/recipes-devtools/rust/rust-source.inc

* Disable rust oe-selftest for mips32 target (Rust upstream has classified it into tier 3 target,
  for which the Rust project does not build or test automatically) as it is unstable with rust tests.
  https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-3

* The testing is done on arm32, arm64, mips64, x86 and  x86_64 targets.

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/lib/oeqa/selftest/cases/rust.py       | 7 ++++++-
 meta/recipes-devtools/rust/rust-source.inc | 4 ++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index 0ec2e422f9..b451d00b37 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -40,7 +40,12 @@ def parse_results(filename):
 class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
     def test_rust(self, *args, **kwargs):
         # Disable Rust Oe-selftest
-        self.skipTest("The Rust Oe-selftest is disabled.")
+        #self.skipTest("The Rust Oe-selftest is disabled.")
+
+        # Skip mips32 target since it is unstable with rust tests
+        machine = get_bb_var('MACHINE')
+        if machine == "qemumips":
+            self.skipTest("The mips32 target is skipped for Rust Oe-selftest.")
 
         # build remote-test-server before image build
         recipe = "rust"
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 83a0dbc15f..e02829e6b3 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -10,6 +10,10 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0004-musl-Define-O_LARGEFILE-for-riscv32.patch;patchdir=${RUSTSRC} \
             file://0005-musl-Define-SOCK_SEQPACKET-in-common-place.patch;patchdir=${RUSTSRC} \
             file://0001-Revert-Map-source-absolute-paths-to-OUT_DIR-as-relat.patch;patchdir=${RUSTSRC} \
+            file://cargo-path.patch;patchdir=${RUSTSRC} \
+            file://custom-target-cfg.patch;patchdir=${RUSTSRC} \
+            file://rustc-bootstrap.patch;patchdir=${RUSTSRC} \
+            file://target-build-value.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "b98c09d968529212fb29eec7d6d3e9bdaa869810679b7fb86a1ca69469d75f5e"
 
-- 
2.43.0


