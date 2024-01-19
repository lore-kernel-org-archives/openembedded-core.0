Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D34AC4725D
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 13:44:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.22313.1705671859858801805
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jan 2024 05:44:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cWNQXb6E;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=174893ae64=yash.shinde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40JCeC5B016563
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 05:44:19 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=tLe/Fh3IldcIiKhkti
	MhWzvgUMWF5t7FgVBKQCidzDs=; b=cWNQXb6Emdu8d8pm19926hVbUL68/JIBha
	P8N0N+3SF+/tX5E9vaVDb+BNDrWqWz7/VLG/ukKsmW78cIDBU15YjjPCIt41SiiC
	25Q8lMSAD+Ddv1e84D6CeuyxAZ8DYU4FX3zeWPjjL3CLSH2MaWh8hA7sU+qITH6u
	I0Shl1nUyuPyuNW20QmfZBkdrFxALem3nZcTQNsfPoXo9odRnjv/6kljef9b8XjT
	AOCvY2X9aFBN3g8ZSNO5jh7oCQVC+o60sfFQ2xdtJZ/yrGmscOelyjdQvB88CHc9
	Y7Q+TwpclJw2Ha79VsgxVnex9kSDpUm3do6okRKsLKs0ERDh1kug==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vkpp46tgq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 05:44:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QyRZHANeelVZseH8bA4Np+wRM0fbGYOM4Jyd+C0cRqUDenfwya09wqMEpJ0dMQSs/mddCCt+5vacxLKu2BGGdpFxEu/fiAHGBcQVww0TjzIiSUIgHJl/6EmWpSKUq5HYyQtunczUpufEOzc4Glr/u4DWkWsQWeIIkAsGO5ZfKsapKjnY5j7CVLRaQm3o9boHusAkxHQf0+NpCyMe9WUtcAuogOearcoL+yoKRUgxMkTxnA+y12LGag7usnnO2yRJAd75sOII+LCPvEq3146l6RBTGeNshxkPEpEOoE4Vd4QS9DRPWWvLDMcvyLyG1TQ5p4oPudK8lqRa1/Aq1AUNGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tLe/Fh3IldcIiKhktiMhWzvgUMWF5t7FgVBKQCidzDs=;
 b=cbX5b+EGIMk9Ndcx2Yk8BP2AFfawpg2bc2vMN0YL4dHb+JZQR6N3fwABhw+qKi+Zf8qmGcRgJwbxsohO2JqLx0jfjsc8gfjFL8XdbLwLHhlz8fjEKmsHDsfR+HrcxJOH2P2QwuslvPe6poD6lPzJzOJHYVxDiwMkQ92iL206qhKXFREQq7vgqJRY7Zw/vmd0R1g88YiRIA9/3AlfRk9p1dtQeQ8ig91J5mmtlVI/3DuBUs+1HsCNe3bb0ojlD1EgItQ2+wjnZwusgbqcfrc0lIw0I4qOzb30HlT5k10Fypw5OMdxPj+IeDMnYHYJQIBblxHvHQ8jEooriMKAE/a2eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by SA1PR11MB8279.namprd11.prod.outlook.com (2603:10b6:806:25c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 13:44:15 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107%4]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 13:44:15 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH 1/5] rust: Fetch cargo from rust-snapshot dir.
Date: Fri, 19 Jan 2024 05:43:48 -0800
Message-ID: <20240119134352.3163178-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CYZPR14CA0008.namprd14.prod.outlook.com
 (2603:10b6:930:8f::26) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|SA1PR11MB8279:EE_
X-MS-Office365-Filtering-Correlation-Id: 4935adb3-4d92-49cb-cf7d-08dc18f4ba14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7hj7H8x44QwS40wTJNxk5m3zPw1g3On+HdewSRDKWuyfqJLny1xIvQNngeF4miA2eUJ+fNrqtHDSLXE8GYKfKOsNAYXy0xBtknVxfKZ1XJlUSuqm4sbH1wSSKaY/7Hm6G7b6OqOEZiQT5k4lxu2P8KZzBuS7mOGN2GiSg7S3kOqUc3BH+QxWvihK9+Zgo5k3zhTIfNie+3tyOG+/C29vNIR/j0V+t6GDF1+1nAMOA7Y/Oh/HIpG5TawOZq3cj3ksKUooCCZfDVmITrDeDS1T6QzucGrdsur920gcZi2j9XnG3AYJcsR/qppKQHnviN3KygMlt7PT+J2M8PPM3hhngvBHIKbw/jFgqgpcm+M2KzMO48g/Hm8CAURFgtskDwvWT59tPl5dCzrnKTwSEjGx0h5qfEAGo5MPyu4k8tC8ooJi0JMoo2nV82hEK6BCJOJBga4zFlirvOfN7//Av4rXcXwbKBz189zSHoZUDVN8kD55zYjUgplYJ2AL1Y5VtdZfa/0R/1qjQG6/bNDqstZqpSbC1NNXkJSIPiVqeWBOQZyqmxzG3Ftc89WyA0jFayPzhRrU0prWtISkh3mZoHEOm0gYprjvWesA8A/jN9ZjAkggUQ2JJEhcV5nW5Ns/p3yqGS4NS0tVnvFHCMk8bxhFZA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(136003)(366004)(346002)(376002)(396003)(230173577357003)(230273577357003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(38100700002)(966005)(66476007)(66946007)(66556008)(6506007)(6486002)(316002)(6916009)(83380400001)(1076003)(2906002)(478600001)(26005)(8936002)(4326008)(86362001)(52116002)(6512007)(5660300002)(9686003)(107886003)(8676002)(2616005)(6666004)(41300700001)(36756003)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8ue/qs7VFf3iEfZMBfHz9glE0oYRyG0rGi0yHBARqxe/tVQUEMNeawpxbQ6Y?=
 =?us-ascii?Q?6XYzkg2cHP+dZ3CnieWc3zdEOB76RgLec7DqQxZ7jIJ/asjqF42xocBpSXtg?=
 =?us-ascii?Q?yu1YdtuRka2P15pIHy+OjFwQno7XIYaSPnUVe/QSMK7VsWd0JdsUmw0ptg0g?=
 =?us-ascii?Q?H3muPyB4Qb7QrMGOhBXwMQrUKmYXSn9PfC8UolnWNs7AILEDiF+gZjDc/Qc6?=
 =?us-ascii?Q?WlbWpUGceGd7O85CdT5HeN81w9LFHEs0FeGu+9QUz2dWrW8lNToloMdVVA4i?=
 =?us-ascii?Q?6Pl4ckqdTqb4eTBjcYuli4r+nxY/N3Pcm7bpY9Vuh9+z6NjkNxAUMrcZtGMp?=
 =?us-ascii?Q?CkW40NMuIQHtJ1Ufmukaoemr32ahp2jJ9qc2Olj4mYIPwSn9ZyClm4do8Yvz?=
 =?us-ascii?Q?PIvAxESBaFcnLlSQVOGkPF3OdnzQeFf9C1lk5Cz1iEH/V/2Mdpg7qguSoHQB?=
 =?us-ascii?Q?4rqe1dT3kL3yQqDI7z7fao4DoKzwLxujPN214BddFwt2a1TM0dl2AWqTQ052?=
 =?us-ascii?Q?9uDsTa3gGw0vX4Vnq3vgPhUNDFsv0t5qiEXGvxJBwnJY2SMSzbyQOu8bFCyQ?=
 =?us-ascii?Q?bWPMuPb9r1j21ZiacVGMIxHM8SCrAvyS/q4DH3+D58YDx8+n1DHuvHZp4/s1?=
 =?us-ascii?Q?lty0s3o37PHO0fX1lQA9vWcSMZ9NRaR9b8APaksHON+axKY6AlnoAdn0hIOV?=
 =?us-ascii?Q?sxW4yMSGHXtyHTf9hwtdAyjLXs40Ln7H/0n8cMdcKBqe/PA2nK9+2XBi/DU7?=
 =?us-ascii?Q?SnC+zbXlJE13Kj1RsPjuhFfWdVv/rz23MWEuQ6jpDesj6uJJKx8ho+8zANv9?=
 =?us-ascii?Q?2oOYVcoBD06FxxaTxZZ0MbsdkkCHeftX7To4RxntoHXzpV3M/oFs5QlytFyD?=
 =?us-ascii?Q?lDByU/PG4mzgHud3aLxVNOu4gutnjzmzfQR9JX8u6YdCRBRukoMAUJoJdN2g?=
 =?us-ascii?Q?XPemMnzC0LFO1jC0bn8LJphSwbAzsE1HVto2Q7hDuGnOohA7I67nyUPDf/0/?=
 =?us-ascii?Q?dXjCWKK5yQULxD0bva40isjItYlJAOiW2S2MTSKgyNSuNu0TmTi6eyAeVTsH?=
 =?us-ascii?Q?hwIlkkkR5+gSpZdCkVyUqDd0jLwnnlQIzqRe48oPKU5+nwvWCJKFuN3bXWjl?=
 =?us-ascii?Q?OdmKI+9s4lDGwvPWMRoxXxYQhwIK2a97glX1TLsJ2E+APnRMLrmiUx2Ffiv5?=
 =?us-ascii?Q?dfU4bOsG6wolg1NlS/K8X3MJ/fAqgGi1aTO/qEeGD9bYU3bM/O5z5Ihsq1MO?=
 =?us-ascii?Q?rfqiXJSc3uw5ZtImg7qVMpo616cl/ocMY7kGK8kuZ942OARhyexUIMZ1PhlE?=
 =?us-ascii?Q?d0yJSjrSDdWTgPB7BYQduK65wh3e0/BTINb/8eq7btirmC3QsPdR24EDUtEk?=
 =?us-ascii?Q?vPr+Wq1u8ka1Uug1cWWejQYKODpO3pDd7NklBlhrgILP7RWE57WpKdTHzFOL?=
 =?us-ascii?Q?IDD2/+MbYreeix4or3H5VPEvmssun/i4h4en1s8yF8+3uVMu/Kycn0I2SgDe?=
 =?us-ascii?Q?wSneVB2TcRXRaPdrOcgJQ2WHWqDKUu9JhS+KSmjWSf5omUYaXjmZUHFkoZ3H?=
 =?us-ascii?Q?lbmF5Du+8C0ne/BpVyYfivruZcK7baINQX+8snGeI8Yt2legm41IZkTlGG2a?=
 =?us-ascii?Q?Lg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4935adb3-4d92-49cb-cf7d-08dc18f4ba14
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 13:44:15.4273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZLvE0y7f9pd+S6lBWx1AcqgMqM1XxBWy9dNOlcOFx+Z1K8FVbJ5HAvOzeANqg/kham67pnAU1gnmAvI35izktqLNWwFKom5RhKl4BnPJtUw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8279
X-Proofpoint-GUID: -vtxNfYZGaFyYgnFj1Bajq6Kp8iSrLwY
X-Proofpoint-ORIG-GUID: -vtxNfYZGaFyYgnFj1Bajq6Kp8iSrLwY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-19_08,2024-01-19_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 phishscore=0 mlxlogscore=670 suspectscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401190072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 13:44:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194044

From: Yash Shinde <Yash.Shinde@windriver.com>

Fixes: Exception: no cargo executable found at
       `${B}/rustc-1.74.1-src/build/x86_64-unknown-linux-gnu/stage0/bin/cargo`

Fix the cargo binary path error on oe-selftest and path set to rust-snapshot dir.

Patch sent to upstream- https://github.com/rust-lang/rust/pull/120125

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../rust/files/cargo-path.patch               | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/cargo-path.patch

diff --git a/meta/recipes-devtools/rust/files/cargo-path.patch b/meta/recipes-devtools/rust/files/cargo-path.patch
new file mode 100644
index 0000000000..547df353d2
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/cargo-path.patch
@@ -0,0 +1,37 @@
+Fix the cargo binary path error and ensure that it is fetched 
+during rustc bootstrap in rust oe-selftest. 
+
+======================================================================
+ERROR: test_cargoflags (bootstrap_test.BuildBootstrap)
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "/home/build-st/tmp/work/cortexa57-poky-linux/rust/1.74.1/rustc-1.74.1-src/src/bootstrap/bootstrap_test.py", line 157, in test_cargoflags
+    args, _ = self.build_args(env={"CARGOFLAGS": "--timings"})
+  File "/home/build-st/tmp/work/cortexa57-poky-linux/rust/1.74.1/rustc-1.74.1-src/src/bootstrap/bootstrap_test.py", line 154, in build_args
+    return build.build_bootstrap_cmd(env), env
+  File "/home/build-st/tmp/work/cortexa57-poky-linux/rust/1.74.1/rustc-1.74.1-src/src/bootstrap/bootstrap.py", line 960, in build_bootstrap_cmd
+    raise Exception("no cargo executable found at `{}`".format(
+Exception: no cargo executable found at `/home/build-st/tmp/work/cortexa57-poky-linux/rust/1.74.1/rustc-1.74.1-src/build/x86_64-unknown-linux-gnu/stage0/bin/cargo`
+
+Upstream-Status: Submitted [https://github.com/rust-lang/rust/pull/120125]
+
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+---
+diff --git a/src/bootstrap/bootstrap.py b/src/bootstrap/bootstrap.py
+--- a/src/bootstrap/bootstrap.py
++++ b/src/bootstrap/bootstrap.py
+@@ -954,9 +954,11 @@
+         if deny_warnings:
+             env["RUSTFLAGS"] += " -Dwarnings"
+
+-        env["PATH"] = os.path.join(self.bin_root(), "bin") + \
+-            os.pathsep + env["PATH"]
+-        if not os.path.isfile(self.cargo()):
++        cargo_bin_path = os.path.join(self.bin_root(), "bin", "cargo")
++        if not os.path.isfile(cargo_bin_path):
++            cargo_bin_path = os.getenv("RUST_TARGET_PATH") + "rust-snapshot/bin/cargo"
++            env["PATH"] = os.path.dirname(cargo_bin_path) + os.pathsep + env["PATH"]
++        else:
+             raise Exception("no cargo executable found at `{}`".format(
+                 self.cargo()))
+         args = [self.cargo(), "build", "--manifest-path",
-- 
2.43.0


