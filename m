Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F306EFCE2A
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 17:44:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24359.1772646260302683897
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 09:44:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QRyOwMUu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7523672f62=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624EHLfX2960433
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Mar 2026 17:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=NwgnCuty17uTHhUfVoCmfuXde0r180ExWZdswjYJrYI=; b=
	QRyOwMUusHyhDK0OkyjjpP+EwV49dyafGbUCQXfdpScaHCrkPXIWbiCrOtzzWdTQ
	OwQvBB8P9nIDCQWmBOWyuXkfCmlMxIhz6hw89uMoBKxkK5MUO+CTZjVMucLbjkEk
	j7gEjNdl57x8rmrwojOU+H97kc1IZkz+EKoRGfkw/MXdVKjsrOV03AGRXJvsJ0Fk
	grOpFJ5rdJnU7/VcDBe63Z2QoHmZoH3BHC0rOtfQGLecTOHZeQrRVsKwf5bxhblx
	xB3SXSl/oU9qNgO/+xWOgfpBP0YpclxlAZ+9ik266bWkQ9QSUvoLkM/H1RgNnSOA
	PxBY1GO0DqEu0zo2/twCXg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010004.outbound.protection.outlook.com [52.101.56.4])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cknjvnj1t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 17:44:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HvlwbYIbA+OY3GDPHXhdqqiKF1i6uQgu0anzeiVO0VhWVKmtYqQsFWtK5rnpnv0JCw/ykNVu7mbx7wdYH0P9qXacS1GL+Le9e0wtTzrijp2/EtNw9IRrX30DfRxvHv2YgaehSanScQvER4W5FR2p74M+TWBNoZZwkDRKlksp3NELHmY5N0SdtJa9dpTuUvjUDzU0MDTvOG4RMG3RncRUPM3+SWJX7eDilU9h0jZ3HlzSDEyws4ouUGLygVJCzvw5wTT54oMDSmsvGRgPsH2mwTSuKmhy2dPNfKtllsM5nEdELcCMfu1zQICnfP+eV5ztPIYndyIUC5uTqxS95rPCGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NwgnCuty17uTHhUfVoCmfuXde0r180ExWZdswjYJrYI=;
 b=oxOnCW4rIR8sKxj+Br7lohVZE+V8dFL8ajXy7ibctWhLO8+GthDgLAAiX1gMw8fuBboJjdRbJ+zeZAEGlhR8LAcpqj2bCoB7SCgCTHlpUh84jSQdP+5lZCfMdQPq21zCpFVgchILDBduvoBnHrYcczqANgGODVHC5v7/Zbhp13CYgMaed6rfwM1xg6ptKVAgnNWv9mQEZ1u6QMgIpe2ZuL7/r11FmEXtRqs5Fh0XzLbGX6/Y7CImaMHvJy9tXbLGLP1ulk//dxtez8BY+aTa+OmlEzbeNcJz44hWQ/XuSZmnkRIIRRRBzhgqqtHIFNMNhB5qwZF/qfkiTB5kHA1VGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA1PR11MB8100.namprd11.prod.outlook.com (2603:10b6:208:445::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Wed, 4 Mar
 2026 17:44:17 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 17:44:17 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        paul@pbarker.dev, yoann.congal@smile.fr
Subject: [PATCH v7 09/14] selftest/cases/runtime_test: Add test for Linux Rust sample
Date: Wed,  4 Mar 2026 09:43:19 -0800
Message-ID: <20260304174324.1186644-10-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260304174324.1186644-1-Harish.Sadineni@windriver.com>
References: <20260304174324.1186644-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0158.namprd05.prod.outlook.com
 (2603:10b6:a03:339::13) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|IA1PR11MB8100:EE_
X-MS-Office365-Filtering-Correlation-Id: bb1cab82-248e-4f18-223f-08de7a15a854
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	0IvcDZFtPTk/x4Apho+xlPPTT/SiU2lQeXSGR00Dzgjb/Dc96Q4u/3Cb802Pl74fgJM6BH6gokoAN/ZRrS02f3E990rk6yUiGlnBeZuVWaFITIfUN4w33wohsODntqshD6uq/AT553xfHT39M8Ja0lrMO7y/Z2/REn/7s9GGF1iDY7kzdj/RGutOytJ4vio8LMlv6AlT3SmxgPweGvK/fFiE2xdbP15HXJPQTVqgV6zVgxHJxncaVyOCU78h6XMhScErWV1wLbj73HM5Dnq85CTqAut38pg3CTcPqaDeZVaECd9r9d1D8q1tbGwPDjy5Uu7zVlY4qSc9jIB+ibP/rXPBbPNzR+ID1MBXfcVYJE8qPl/GH93eHqJnqqvn/vJPt/72tIFDPQzgEDGUiCX6mmV8W3qQY5R+LBSOeVVKWZRLeTj2iOjkPIwddp/QAKzVkhRjzJtpiIlq0alHNJdxslqbH0l6EsOq8FqHbeScL0N1/dsp0Fdp8SHM6wSyqb4n0Uekww07a3bZlyKwzAS0veauRM2JDQP+GN1HDhZu7YXcA71UcJ35S2Qvx6XnKqPdv/7WEE9VeGiJL84V2XD+YRWA+hOJqKWpni6dQ5vQNCHCAUhuYIO6jIsLI6Vc8FI9Ts2x/VxkSQIiTJPIelABVllq6hs+A+PJlLZ4ESti3SvSNbL/p1oNwHRLii0iYYdDN7ScIuJ7kHBRbizDGrwlQd0WpXRLA4Gi8k4eQskTFhqgsVhw7l6GcLtaHK84a7w254l8H/SIQ7ffLPUIsTBdgZ1G3YfJSCNp6DhV4HQsaQk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YUg5scec2PGwzi07Wpofssuy6A82bTGzztsGD4r39dIpHQV5mui5CT/MXjB/?=
 =?us-ascii?Q?cUG2M9/0sxvBRzcyBirbSsRqXBUGYLeOxYc8ohU6nd4JhMrg0EJTLIukSnq3?=
 =?us-ascii?Q?h0t37YFML7L3S/VjDw6utoFL15OK4wivPACQAyi8CxU3yz5HvNRJ//oLSRU8?=
 =?us-ascii?Q?bbUylRemn57kb9F6Ju4VpPNMF7UxUWk82/HQRBC94g7JI/you04Wy56qDiuS?=
 =?us-ascii?Q?SEp3fClITuLz9av/5WhFLO6NOLRdusGb5Cx3C6T1yTk4Ea+HODCxOtfKuCuc?=
 =?us-ascii?Q?dtOlYj5L2OeB9QzLCodFaR9WNvRFSP7rAkcmGj82tRqwaVo0p2isx4RJmsbz?=
 =?us-ascii?Q?IHXkd4/lwKxWpVZVL2iJ3m3WCacffAjPCmD997fVTsxQ3XEuVTzfMZh3/JEf?=
 =?us-ascii?Q?z4JDOVzEabL2JFMuxHdr75amWgBPhOKoAI3etoIB+lm0UvjOD6943eW1X3/P?=
 =?us-ascii?Q?sLpsa5XHxU6Qang/0A8ErLEByQr4hK6AS4e7YSmeAntXr+7cWqFLXEo0q9LW?=
 =?us-ascii?Q?V20ueafAK7xEvi4LZGKJ0eOxwivm7RvZfLZu9Mo6PjYhFe/PNt4GhxIlT9Q4?=
 =?us-ascii?Q?/6rm6zJgVlMOdhGTxgtGD0aFNDIfaMq1RZXcsMLEHDetStACfi1aoCavzYj/?=
 =?us-ascii?Q?3OjbYGqhMyGABq8u7NoJDzPyPG8aTJ5AZXt9Um3O0W3sihfUJGlkrcegUKel?=
 =?us-ascii?Q?BsBpoqThISM84aceIwrmXEfiZ2scSL1fCVyvJhm/owlmz9Gz1WP3LQX+JjQa?=
 =?us-ascii?Q?Qg03jvl0LK9ojuLaQqSmkW77GDwOUd92PVYgoIrQaWMSABhUc+Y2Te9FqbF4?=
 =?us-ascii?Q?CdX6A+HLHP9dTSxx39hzhgIzlYVTIVeuYYuC6v+WoxT74taX8SNHydyysODG?=
 =?us-ascii?Q?3n6Q8evzbzP8x3Fi5MWwqs8xSTfj/8yNdOAjb4AApIed8VPbLvpz0FXKxXPX?=
 =?us-ascii?Q?usHn6BP3YBJikIaVHBlfuhSyKLn78hMMIf6P/Qp7ALm7S2SF5rw4mpOsSlvB?=
 =?us-ascii?Q?aOxWudX8TN5sHhRGKgBU8qp4cUByAQoz2bE94VGLbT72UWPm3Az9VsThN+ZR?=
 =?us-ascii?Q?LMP1U2IoWc36ylqEKkqxP13Bm9B/y3B4L/5JcgbaozuA901XG+aRlK19WuLE?=
 =?us-ascii?Q?YkCdSRIQEiPxZmoM/kPPRzRwdHl90yn0VIFLvcEOe3rpXXWE+aV1c7rVlh5K?=
 =?us-ascii?Q?riAIjYhM8J0dt1RjeZWQ48HhLGNbeork0mrhRbUdepf6hjO12TxGjDTfePHy?=
 =?us-ascii?Q?U5ap5JdRtfGZQAxNpYhE0okIoGt+LHBEbxl/6LC3QaxMD2QlFB0foT32Q0BL?=
 =?us-ascii?Q?IdNhGEuwnUFNj67FTMvWxJCEJ1DCiAWrL7lXHgqqdkg23tXYp08bURvmBoR3?=
 =?us-ascii?Q?oRcgnz2AMx6ZwcX8h2/NqcmzgBMdg/F6nGn5R0UHm9DlT5JnOj579XoExt+L?=
 =?us-ascii?Q?gNh9ar7RnQU0C8qr74NycmKCTNK77g1QkDI1aI2b3VUaMfb4RBqyxAs768Sg?=
 =?us-ascii?Q?rWm8eXbjch+lty7hRgxny99i+BYJvHN3ubLywQir8amrYOS3Z1Z5NzYoeqa/?=
 =?us-ascii?Q?nJivaCB9uLCzNZ5a9aPpwhEt8wCdP9UPeql2umKXzWQ+Et/Xq4+fm5gsO56u?=
 =?us-ascii?Q?rIJfRdiZMoqg8EBvBXM+NwyaLl8h4FKBDFe84taTWHvM8Xw5kcygs6p9obLt?=
 =?us-ascii?Q?ePGa+Z31FBk3CMkN0r1gReGqsnH3EPTNcf71wCurC3AdHU6qRM3v5dmTWyjL?=
 =?us-ascii?Q?H7nuRI5ad2qdzftWJDVOEocAWdlEEpw=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb1cab82-248e-4f18-223f-08de7a15a854
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 17:44:17.0976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w4qJX0CT2wJv8FrtOpZSuJ3XcnLhlA4p5A3nqyKe3b4pKTRVvxxGzC5fiZ74CdmzLUWDV614qqAbuuk4nHx3VYP7NNL2yrZVfj2kaGzQ8js=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8100
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 6RgVyWZSQG-Ja65tvlEIAuE_6SKe7LDG
X-Proofpoint-ORIG-GUID: CU1PeJJo2z0PJkzW16Mel40cyYKIQcgF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE0NCBTYWx0ZWRfXyUDykn1MvQvx
 E+q6Zdmk7C62IyKs1B3EPnC9vUsxnS8MbK6E/qFCLdywJFQFjkEwZuEsldRcKOjcr+VUP2eHs0y
 n6spS4bVb/oDR73x7L6CwyH/HD3CVY96io1/qMldV+mPZ+nFp+9klyEpc4sj6owD0y4tDYmMhR8
 FQtDes3eRpzztKsWap4pAvySH2kJamlqyXblVft42Hb3IxV69108Ppk4k1Rh2uRIcjad1wpwqk9
 DhaRO6idbHWxgyKxuCURq7YEq9dK+4RBPE3q9cYfVTk+1fcvMZr0RMUVyqNvcbT+qDuiPPjII9g
 r1mO4r+y+uagEKhkPqFPVM9cm+IgJ3rKyJfcmDiZ58sEVuEWzAaoxG4DP74ex9p2USHTkm35tlu
 5Gc1Pl+YQFDRZHo7EiBR+3lSrc3+TeEwcwViZZu9vE2R2TKlw9g845hEmzrY+OazXFiKk7KwcUX
 Mn7C9Ll9Ww+invB2www==
X-Authority-Analysis: v=2.4 cv=P/g3RyAu c=1 sm=1 tr=0 ts=69a86f73 cx=c_pps
 a=5+b0Cb5m1vs/r/JsbObUdA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=iGHA9ds3AAAA:8
 a=t7CeM3EgAAAA:8 a=p_vdLtrgfc09iYJXKugA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040144
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 17:44:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232425

From: Yoann Congal <yoann.congal@smile.fr>

This new case tests that the rust_mininal sample inside the kernel source
tree is buildable and works properly: check that the module can be
loaded and that it prints correctly.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 27 ++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index d58ffa80f5..6b7cd45684 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -481,3 +481,30 @@ IMAGE_INSTALL:append = " systemtap-runtime"
                 cmd = "crosstap -r root@192.168.7.2 -s %s/process/ syscalls_by_pid.stp" % systemtap_examples
                 result = runCmd(cmd)
                 self.assertEqual(0, result.status, 'crosstap  syscalls_by_pid returned a non 0 status:%s' % result.output)
+@OETestTag("runqemu")
+class RustKernel(OESelftestTestCase):
+        @classmethod
+        def setUpClass(cls):
+            super(RustKernel, cls).setUpClass()
+            cls.image = "core-image-minimal"
+
+        def test_kernel_rust_sample(self):
+            import textwrap
+            self.write_config(textwrap.dedent("""
+                KERNEL_RUST_SUPPORT = 'True'
+                KERNEL_EXTRA_FEATURES:append = ' features/kernel-sample/kernel-rust-sample.scc'
+                CORE_IMAGE_EXTRA_INSTALL += "kernel-module-rust-minimal"
+            """))
+            bitbake(self.image)
+
+            with runqemu(self.image, runqemuparams = "nographic") as qemu:
+                qemu.run_serial("dmesg -c > /dev/null")
+                status, _ = qemu.run_serial("modprobe rust_minimal")
+                #Disable status check due to intermittent failures on armhost/qemuarm64.
+                #The module loads successfully, but qemu.run_serial() occasionally
+                #returns an incorrect status.
+                #Bug report: https://bugzilla.yoctoproject.org/show_bug.cgi?id=16189
+                #self.assertEqual(status, 1, "Loading rust_minimal module failed!")
+                _, output = qemu.run_serial("dmesg")
+                self.logger.debug(f"rust_minimal dmesg output:\n" + textwrap.indent(output, "  "))
+                self.assertIn("Rust minimal sample", output, "Kernel Rust sample expected output not found in dmesg")
-- 
2.49.0


