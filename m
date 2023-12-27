Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF656C46CD4
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 11:02:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.99576.1703674925135446947
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Dec 2023 03:02:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=qLbqlwtk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0725661e42=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BR7fJRR027608
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 03:02:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-type
	:content-transfer-encoding:mime-version; s=PPS06212021; bh=kn+Qb
	XXMUdnwe7DdOCqS7MwtFNMIQux/dOUMx92N7CM=; b=qLbqlwtkXZxihCBN+zzPu
	4eCR7SqV6iYgmCjCuDiQgXHCqLAEtpGPk6DxpdDHWch+/4vTy+QK7XavqBeY2RtB
	kY8Cd265YWQATUC3t19mAJI9ybSltHVbqINUJx7AHqxLmvc+8O9Z+4i3WmU/MqKL
	oZO/VP4koVBWothJGvaKL1TQ+HwT9IMFU+ClDcXRu2rzktDe8U3F+NXTOfFL635D
	j6S2UTLQYm+YtzM1PMOKYJDHyPpnBYv1DnlK8KRv1/b/HQaNTR/py+wmASE9tVgu
	EqS0oFtb0Qzc+NpuKmw76eRYWGQp2afEenNiDCkpgFmXbtk/P8uUxZqsfUnxVBnG
	g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v5uq4jy6r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 03:02:04 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3BRB23eb022208
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 03:02:03 -0800
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v5uq4jy6p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Dec 2023 03:02:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TryZkBqAXHWLWjIXgu9lLZ6HZ3mVtoBUt36K1345/NE6r+WBilhQweYiZVDeIIdC08GJNMcvfancdm9XPC+RnZ48WxEmFlEQ4pBKDO2L8UVaOoQuTPgR/60a5hV/7sYhNho3wIggVNA80PJIvORATl//nbMYM7aRlVid/fqsJYvmPWFfs0H0WzgxopqdTvzZknkYeEgWI9ShInLrlVY9ya7NWZyuAasVin3dCpXnkyFChpZrlnymkmbAeR3BSXoO8TFjTWgbyyxNB28hfX9ndafZC2VYAjFELf5GH7uvhbFxFhB5gI0ZhzO2QI/eCHhsFZeLs0tOBwXlXf6CSY0JJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kn+QbXXMUdnwe7DdOCqS7MwtFNMIQux/dOUMx92N7CM=;
 b=auHJSu0hhh7Przyug4EyHVBtTPYQsh5BbJgNfmYlXbQVxnMTf+BLkML+iADhyiUXlCfVCa5yCIMfReL4yHzLiChxZn7o95PFMdUpWGG2TG1sdN4t4rLQLm/PQIU7nIhvFQwsXb03yw2bbKBaiF9Onj/ZSNj2keSYAiVPcZm+tyVS+zHsLBJ+gL0OFgouCT77aMcwlNazXiIWGmk7lO/vtiCC3wSvgIA5qvohwdiemz1yBcDBOWvCCYrGhCj7CJpB/TpgovTmbkudppjlGyFOkZkhhG5dFF2+As7cV6g/zkIBcuVbTEhHxHP0vrB41ltxGf1AQoOUlVdXdUb1mDq63Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17)
 by MW4PR11MB5912.namprd11.prod.outlook.com (2603:10b6:303:18a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Wed, 27 Dec
 2023 11:01:59 +0000
Received: from PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::d722:19c4:2468:6024]) by PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::d722:19c4:2468:6024%5]) with mapi id 15.20.7113.027; Wed, 27 Dec 2023
 11:01:59 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        steve@sakoman.com, Harish.Sadineni@windriver.com
Subject: [nanbield][patch] rust: Fix CVE-2023-40030
Date: Wed, 27 Dec 2023 03:01:33 -0800
Message-ID: <20231227110140.2245865-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.42.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: BYAPR11CA0102.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::43) To PH7PR11MB6449.namprd11.prod.outlook.com
 (2603:10b6:510:1f7::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6449:EE_|MW4PR11MB5912:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b579f62-55e5-42e6-88c6-08dc06cb3f48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9OZWz8nG0uVeGptovhLFJIC/WoX4ZYWhVI4oOgKyh+H7lrwev96IvAM2RUKvXreBnvx+PNEidm8g/XFdgANVwX6WlKk36YYRFvGg+bSvitWIQoL6rBNGyCZHC0Ek3tUz4U77clO//tt8YsnORyAZqaV/97eTNTg1KxSAWAoM6r/lOICwNN9Oc0macX+JgL/w/moM+5XEYywDHS27IbTV+jBbmnB7hgVagfpMSTGPeguJY/49gaxIssKli3JiqebXdQrI0tL0qvxJbes3yudJkSe74HFFSLl1rPtRRgKDOYwm6fqfyk3bXOfQl/3jWQ2cTdMH3v/OOdFsrlwwiumAwwN7wmj6VPcnpeqobXZkrGPdZsLy2qm5V7rPw08V47/PMjVCKF1cB+Icy9kmxECTrXhiEiCP1eDlHUHcN91ycTgKKvuh+nhcfoxeuz0ok/ZPjBVdZtqkoo/LQBvS916/vGxMtQ60KJqTr/sd9biPjmeMx3yyd/NMpmY4gW+Spol2CU3F5cx5xY4W7huwYd0N0bgIP1mgaXmJg7q9IiCopB9pFyGh2gsFV380hiFYwMe27LxfzGzt5Yzbm/jHA/IpBZ+PFAfDpi+i443LwJ3T1cIRfqf+FWkrhAgn65iOnO8FgN+lJ/aODc72/DTlfNfP8w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6449.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(346002)(39850400004)(366004)(396003)(230922051799003)(230273577357003)(230173577357003)(64100799003)(451199024)(1800799012)(186009)(83380400001)(36756003)(41300700001)(38100700002)(5660300002)(86362001)(6916009)(8936002)(66556008)(66476007)(4326008)(8676002)(316002)(66946007)(966005)(2616005)(6512007)(107886003)(1076003)(6506007)(26005)(478600001)(30864003)(2906002)(52116002)(6666004)(9686003)(6486002)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R0R2eTVxbjJyWXUxK1Q5Q1lpeC9VRHppRTc4by9ONGdoR252S0tnRnpPWEIw?=
 =?utf-8?B?MnhvaEtRekpxRzlQUHU4cUlBeDRoQkR2ZXF1TjJtT0ZzNlRERXdWZlBSSXBX?=
 =?utf-8?B?UVh0MlVhWU9RZjV1R0psdnBKZlZQYzdzN1d1TWVnMlJTRUpNTjBhUkg4V0ZB?=
 =?utf-8?B?UERab2xLRlp5OU9yU3p0TWZIMFRSZ3hyaWc2NnFsSEYwc0ZKTG9YUm5NTWpL?=
 =?utf-8?B?Uks4emN6ekU0eW01TzFSQUxZZDdpa1R2dVpON0FTSXFEbHltSlVxT2Y5UjNH?=
 =?utf-8?B?Nitka3RYVmFYQjc1OHlFZnp6Nk9oSDBpWVFmc1RuWVpUN09Vc29LTXIydnQ2?=
 =?utf-8?B?Wk9lalhjLzBSd0tTSXYvYWVGbzlIL1lOUzQzdUNJZjAxUEtjNW1VSnk2RVMy?=
 =?utf-8?B?R0RQM3NoNVNtay9laHVzallmTFVTb2VrS1hXT2ZSSmN1RHJJUVB1RldYOTVL?=
 =?utf-8?B?Q3NNUENIZ2dVYlRQWWpueDRESXpLRDZlenJuV3VTdURMYUs5RExNOWFGd3o5?=
 =?utf-8?B?aHFqUWNsdGIwcFlqcXcvK3FUZ01Ia2hRdzJ5dFdRYW1QMG1jRm9CTDJLUHNL?=
 =?utf-8?B?M0VTTzBNb1p5WTRsdUo2YzZBWjZNSVBBMFY5T2VZUHA5K3grcjRoL2phNndy?=
 =?utf-8?B?UERGSHdyNzE5TUlYQW5jeVJ6YzhiMmFNdmQ3WXpNWkhBVW93bVAwbVV1NkVD?=
 =?utf-8?B?YXN5ZzUyTnF4VDdVNFh4RlpMWG9lQzMrbVltSStaeDZFbmZiWFNJU0owa3NZ?=
 =?utf-8?B?aXp0Y25tS2ZxRXo0c1hvWkVybTYrcllHdUQ3Y2FyRHdnbkZUSndnNUR1UGt3?=
 =?utf-8?B?VUNBbTRMV2d6UTB5NGhXTG5YQm5tQ2JxODhrQmZaR3FHWlFCRitqSkJQWVMw?=
 =?utf-8?B?UWdGRWxpUVBrUno4eW9iUWRDWmRrRjhXRlZYZlJ3ZDB5VmFVaXM4RW9oTDZx?=
 =?utf-8?B?Mno3SXpoZTRad3dPT0hJWWg0RXpwTlp6Y1Fkb1JsMEVtNHhOUml6OFI5T2RU?=
 =?utf-8?B?VWVUdDR3aUJJb21WNlBadmh0UG93TWdHdHdrdWd0TFhVVXlBSDdiSEJkYXJ3?=
 =?utf-8?B?M0xsWkd6UHlRWEQ2ZWFyenkrZmdwUkxHWnl4ajRTc1Via0REZm1weFJET005?=
 =?utf-8?B?VFRobVlmQzNCcVpoNEQvN1l6c3FqTGpJV1JubG5ZRHZ6SDBnT2doczhUV1hE?=
 =?utf-8?B?alo2dVRTL1YyY0pyYjhoYXlLN2orNDRLKzVCRmZFUHgrcjc3dWZhajlDakE5?=
 =?utf-8?B?MDhUL1lGYUxKdnQ1TWxGdktpUFk5R3JJczVmbnJvUXV4Wk9wckRJQTROY0J4?=
 =?utf-8?B?dUJCYzNyeVg4aW5GSFdRMENoeHE0MHJhQ1pPQlNPSU5KSU5iRUF4OEljMnBT?=
 =?utf-8?B?RWNjTHpiNU9ObWNKalRJL1FzOTNCK1QvcXNMUGR1WStTaEV3WW9QSnMva0ln?=
 =?utf-8?B?alNFK1BMRVVnc1RjbUdKVGliL2hIU1NJdjJldzN4Z0d2WTV3c1J5RXlGSFhZ?=
 =?utf-8?B?R0F0RW9KaXFZNkM2YnpVdEFKay9JY1JhVWs1RExJajJTeDh0bDFTSCt6Wkox?=
 =?utf-8?B?RWR1SGFBb1FtZTdYalRucDBXYUw3ZzJwalM0aVhKeWNmbjFGd0xSRWxlb0RC?=
 =?utf-8?B?eXcydldFT3h0aHpsVHQ2SnU2UzJrVWorMGU5RTFzampzdmI0bXlnR1N3Wldp?=
 =?utf-8?B?OU0rcWQxUkx0bjYvVUh5QXlNQVFTcTNEVUhLWS9ZT2RJeGpYOWluTXZJUlVt?=
 =?utf-8?B?VHRYQTJFdUVmRUFOMGU0Y1hmb1pQeVN0ZFN3clVUUjhnUnBENTk0dmN5cWxz?=
 =?utf-8?B?S0FKV1pGb3lyYm1KTWpnejdEUGZkdVRENzliYzVYcHFlaVdBSkU3aFlSU1lS?=
 =?utf-8?B?K1V6aDY0Yk5CZUkzSWJ3MEM1dTlYWUJBVXhOdVNTZmdFTlFjckhyNytGU09w?=
 =?utf-8?B?TXpESFhYMkpMb2tvZEkxOGExakJveXkvWDRGL0dOSWtHSTVlb25JQVpWWjVI?=
 =?utf-8?B?Q3F2QVBhdTVaM1JEVW9DWVZNOWhXOWhSc09tQjdLSHIxZVA3ZGlpVVUrNllB?=
 =?utf-8?B?ZDlRYXQxeEl5ODU2SlRySnJ6UzJHcUdGRUJHRkUxL2RhdkNJbnFFUnhlRXBn?=
 =?utf-8?B?Z0Uwa1ZWbHhqNXhpb2w5a0NpcHoyQ1dOSHBZVW41VmVmY0F6WExHZUhGUWVi?=
 =?utf-8?B?M1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b579f62-55e5-42e6-88c6-08dc06cb3f48
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6449.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2023 11:01:59.1257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZjXle9OW9lToPY4heTVmJLuw7D/9dTPa0sNyt0p/l7TRL0HkU7rRojEekTv7OTcBSp4g7z8to7qwdYTbh/w+fYkZSpZF6gem+tM9xOvFfi0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5912
X-Proofpoint-GUID: SSX_LDDjWQDXq2t4AtyJ_XJmI32jUla1
X-Proofpoint-ORIG-GUID: lzevh1eaacTEceK0ybwFKkWDH6D2g0_P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312270081
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3BR7fJRR027608
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 11:02:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192934

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

CVE:CVE-2023-40030

This converts the feature name validation check from a warning to an erro=
r

Upstream-Status: Backport from https://github.com/rust-lang/cargo/commit/=
9835622853f08be9a4b58ebe29dcec8f43b64b33

Reference: https://nvd.nist.gov/vuln/detail/CVE-2023-40030

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 .../rust/files/0002-CVE-2023-40030.patch      | 412 ++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |   1 +
 2 files changed, 413 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/0002-CVE-2023-40030.=
patch

diff --git a/meta/recipes-devtools/rust/files/0002-CVE-2023-40030.patch b=
/meta/recipes-devtools/rust/files/0002-CVE-2023-40030.patch
new file mode 100644
index 0000000000..bf9b251226
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/0002-CVE-2023-40030.patch
@@ -0,0 +1,412 @@
+Author: Eric Huss <eric@huss.org>
+Date:   Sun Jun 11 12:52:25 2023 -0700
+
+    Convert valid feature name warning to an error.
+
+Upstream-Status: Backport [https://github.com/rust-lang/cargo/commit/983=
5622853f08be9a4b58ebe29dcec8f43b64b33]
+CVE: CVE-2023-40030
+Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
+
+diff --git a/src/tools/cargo/crates/resolver-tests/src/lib.rs b/src/tool=
s/cargo/crates/resolver-tests/src/lib.rs
+index 01d9b5e6d..ab34e8663 100644
+--- a/src/tools/cargo/crates/resolver-tests/src/lib.rs
++++ b/src/tools/cargo/crates/resolver-tests/src/lib.rs
+@@ -179,7 +179,6 @@ pub fn resolve_with_config_raw(
+         used: HashSet::new(),
+     };
+     let summary =3D Summary::new(
+-        config,
+         pkg_id("root"),
+         deps,
+         &BTreeMap::new(),
+@@ -581,7 +580,6 @@ pub fn pkg_dep<T: ToPkgId>(name: T, dep: Vec<Depende=
ncy>) -> Summary {
+         None
+     };
+     Summary::new(
+-        &Config::default().unwrap(),
+         name.to_pkgid(),
+         dep,
+         &BTreeMap::new(),
+@@ -610,7 +608,6 @@ pub fn pkg_loc(name: &str, loc: &str) -> Summary {
+         None
+     };
+     Summary::new(
+-        &Config::default().unwrap(),
+         pkg_id_loc(name, loc),
+         Vec::new(),
+         &BTreeMap::new(),
+@@ -625,7 +622,6 @@ pub fn remove_dep(sum: &Summary, ind: usize) -> Summ=
ary {
+     deps.remove(ind);
+     // note: more things will need to be copied over in the future, but=
 it works for now.
+     Summary::new(
+-        &Config::default().unwrap(),
+         sum.package_id(),
+         deps,
+         &BTreeMap::new(),
+diff --git a/src/tools/cargo/src/cargo/core/resolver/version_prefs.rs b/=
src/tools/cargo/src/cargo/core/resolver/version_prefs.rs
+index 002f11ff8..bf26d0498 100644
+--- a/src/tools/cargo/src/cargo/core/resolver/version_prefs.rs
++++ b/src/tools/cargo/src/cargo/core/resolver/version_prefs.rs
+@@ -73,7 +73,6 @@ impl VersionPreferences {
+ mod test {
+     use super::*;
+     use crate::core::SourceId;
+-    use crate::util::Config;
+     use std::collections::BTreeMap;
+
+     fn pkgid(name: &str, version: &str) -> PackageId {
+@@ -90,9 +89,8 @@ mod test {
+
+     fn summ(name: &str, version: &str) -> Summary {
+         let pkg_id =3D pkgid(name, version);
+-        let config =3D Config::default().unwrap();
+         let features =3D BTreeMap::new();
+-        Summary::new(&config, pkg_id, Vec::new(), &features, None::<&St=
ring>).unwrap()
++        Summary::new(pkg_id, Vec::new(), &features, None::<&String>).un=
wrap()
+     }
+
+     fn describe(summaries: &Vec<Summary>) -> String {
+
+diff --git a/src/tools/cargo/src/cargo/core/summary.rs b/src/tools/cargo=
/src/cargo/core/summary.rs
+index 2535c4482..1883df33b 100644
+--- a/src/tools/cargo/src/cargo/core/summary.rs
++++ b/src/tools/cargo/src/cargo/core/summary.rs
+@@ -1,6 +1,6 @@
+ use crate::core::{Dependency, PackageId, SourceId};
+ use crate::util::interning::InternedString;
+-use crate::util::{CargoResult, Config};
++use crate::util::CargoResult;
+ use anyhow::bail;
+ use semver::Version;
+ use std::collections::{BTreeMap, HashMap, HashSet};
+@@ -30,7 +30,6 @@ struct Inner {
+=20
+ impl Summary {
+     pub fn new(
+-        config: &Config,
+         pkg_id: PackageId,
+         dependencies: Vec<Dependency>,
+         features: &BTreeMap<InternedString, Vec<InternedString>>,
+@@ -49,7 +48,7 @@ impl Summary {
+                 )
+             }
+         }
+-        let feature_map =3D build_feature_map(config, pkg_id, features,=
 &dependencies)?;
++        let feature_map =3D build_feature_map(pkg_id, features, &depend=
encies)?;
+         Ok(Summary {
+             inner: Rc::new(Inner {
+                 package_id: pkg_id,
+@@ -140,7 +139,6 @@ impl Hash for Summary {
+ /// Checks features for errors, bailing out a CargoResult:Err if invali=
d,
+ /// and creates FeatureValues for each feature.
+ fn build_feature_map(
+-    config: &Config,
+     pkg_id: PackageId,
+     features: &BTreeMap<InternedString, Vec<InternedString>>,
+     dependencies: &[Dependency],
+@@ -204,7 +202,7 @@ fn build_feature_map(
+                 feature
+             );
+         }
+-        validate_feature_name(config, pkg_id, feature)?;
++        validate_feature_name(pkg_id, feature)?;
+         for fv in fvs {
+             // Find data for the referenced dependency...
+             let dep_data =3D {
+@@ -431,33 +429,63 @@ impl fmt::Display for FeatureValue {
+=20
+ pub type FeatureMap =3D BTreeMap<InternedString, Vec<FeatureValue>>;
+=20
+-fn validate_feature_name(config: &Config, pkg_id: PackageId, name: &str=
) -> CargoResult<()> {
++fn validate_feature_name(pkg_id: PackageId, name: &str) -> CargoResult<=
()> {
+     let mut chars =3D name.chars();
+-    const FUTURE: &str =3D "This was previously accepted but is being p=
hased out; \
+-        it will become a hard error in a future release.\n\
+-        For more information, see issue #8813 <https://github.com/rust-=
lang/cargo/issues/8813>, \
+-        and please leave a comment if this will be a problem for your p=
roject.";
+     if let Some(ch) =3D chars.next() {
+         if !(unicode_xid::UnicodeXID::is_xid_start(ch) || ch =3D=3D '_'=
 || ch.is_digit(10)) {
+-            config.shell().warn(&format!(
++            bail!(
+                 "invalid character `{}` in feature `{}` in package {}, =
\
+                 the first character must be a Unicode XID start charact=
er or digit \
+-                (most letters or `_` or `0` to `9`)\n\
+-                {}",
+-                ch, name, pkg_id, FUTURE
+-            ))?;
++                (most letters or `_` or `0` to `9`)",
++                ch,
++                name,
++                pkg_id
++            );
+         }
+     }
+     for ch in chars {
+         if !(unicode_xid::UnicodeXID::is_xid_continue(ch) || ch =3D=3D =
'-' || ch =3D=3D '+' || ch =3D=3D '.') {
+-            config.shell().warn(&format!(
++            bail!(
+                 "invalid character `{}` in feature `{}` in package {}, =
\
+                 characters must be Unicode XID characters, `+`, or `.` =
\
+-                (numbers, `+`, `-`, `_`, `.`, or most letters)\n\
+-                {}",
+-                ch, name, pkg_id, FUTURE
+-            ))?;
++                (numbers, `+`, `-`, `_`, `.`, or most letters)",
++                ch,
++                name,
++                pkg_id
++            );
+         }
+     }
+     Ok(())
+ }
++
++#[cfg(test)]
++mod tests {
++    use super::*;
++    use crate::sources::CRATES_IO_INDEX;
++    use crate::util::into_url::IntoUrl;
++
++    use crate::core::SourceId;
++
++    #[test]
++    fn valid_feature_names() {
++        let loc =3D CRATES_IO_INDEX.into_url().unwrap();
++        let source_id =3D SourceId::for_registry(&loc).unwrap();
++        let pkg_id =3D PackageId::new("foo", "1.0.0", source_id).unwrap=
();
++
++        assert!(validate_feature_name(pkg_id, "c++17").is_ok());
++        assert!(validate_feature_name(pkg_id, "128bit").is_ok());
++        assert!(validate_feature_name(pkg_id, "_foo").is_ok());
++        assert!(validate_feature_name(pkg_id, "feat-name").is_ok());
++        assert!(validate_feature_name(pkg_id, "feat_name").is_ok());
++        assert!(validate_feature_name(pkg_id, "foo.bar").is_ok());
++
++        assert!(validate_feature_name(pkg_id, "+foo").is_err());
++        assert!(validate_feature_name(pkg_id, "-foo").is_err());
++        assert!(validate_feature_name(pkg_id, ".foo").is_err());
++        assert!(validate_feature_name(pkg_id, "foo:bar").is_err());
++        assert!(validate_feature_name(pkg_id, "foo?").is_err());
++        assert!(validate_feature_name(pkg_id, "?foo").is_err());
++        assert!(validate_feature_name(pkg_id, "=E2=92=B6=E2=92=B7=E2=92=
=B8").is_err());
++        assert!(validate_feature_name(pkg_id, "a=C2=BC").is_err());
++    }
++}
+diff --git a/src/tools/cargo/src/cargo/sources/registry/index.rs b/src/t=
ools/cargo/src/cargo/sources/registry/index.rs
+index aa5c2a78c..6d565da8f 100644
+--- a/src/tools/cargo/src/cargo/sources/registry/index.rs
++++ b/src/tools/cargo/src/cargo/sources/registry/index.rs
+@@ -293,7 +293,6 @@ impl<'cfg> RegistryIndex<'cfg>
+         'a: 'b,
+     {
+         let source_id =3D self.source_id;
+-        let config =3D self.config;
+
+         // First up actually parse what summaries we have available. If=
 Cargo
+         // has run previously this will parse a Cargo-specific cache fi=
le rather
+@@ -312,15 +311,13 @@ impl<'cfg> RegistryIndex<'cfg> {
+             .versions
+             .iter_mut()
+             .filter_map(move |(k, v)| if req.matches(k) { Some(v) } els=
e { None })
+-            .filter_map(
+-                move |maybe| match maybe.parse(config, raw_data, source=
_id) {
++            .filter_map(move |maybe| match maybe.parse(raw_data, source=
_id) {
+                     Ok(summary) =3D> Some(summary),
+                     Err(e) =3D> {
+                         info!("failed to parse `{}` registry package: {=
}", name, e);
+                         None
+                     }
+-                },
+-            )
++                })
+             .filter(move |is| {
+                 if is.v > INDEX_V_MAX {
+                     debug!(
+@@ -605,7 +602,7 @@ impl Summaries {
+                     // allow future cargo implementations to break the
+                     // interpretation of each line here and older cargo=
 will simply
+                     // ignore the new lines.
+-                    let summary =3D match IndexSummary::parse(config, l=
ine, source_id) {
++                    let summary =3D match IndexSummary::parse(line, sou=
rce_id) {
+                         Ok(summary) =3D> summary,
+                         Err(e) =3D> {
+                             // This should only happen when there is an=
 index
+@@ -793,17 +790,12 @@ impl MaybeIndexSummary {
+     /// Does nothing if this is already `Parsed`, and otherwise the `ra=
w_data`
+     /// passed in is sliced with the bounds in `Unparsed` and then actu=
ally
+     /// parsed.
+-    fn parse(
+-        &mut self,
+-        config: &Config,
+-        raw_data: &[u8],
+-        source_id: SourceId,
+-    ) -> CargoResult<&IndexSummary> {
++    fn parse(&mut self, raw_data: &[u8], source_id: SourceId,) -> Cargo=
Result<&IndexSummary> {
+         let (start, end) =3D match self {
+             MaybeIndexSummary::Unparsed { start, end } =3D> (*start, *e=
nd),
+             MaybeIndexSummary::Parsed(summary) =3D> return Ok(summary),
+         };
+-        let summary =3D IndexSummary::parse(config, &raw_data[start..en=
d], source_id)?;
++        let summary =3D IndexSummary::parse(&raw_data[start..end], sour=
ce_id)?;
+         *self =3D MaybeIndexSummary::Parsed(summary);
+         match self {
+             MaybeIndexSummary::Unparsed { .. } =3D> unreachable!(),
+@@ -823,7 +815,7 @@ impl IndexSummary {
+     /// a package.
+     ///
+     /// The `line` provided is expected to be valid JSON.
+-    fn parse(config: &Config, line: &[u8], source_id: SourceId) -> Carg=
oResult<IndexSummary> {
++    fn parse(line: &[u8], source_id: SourceId) -> CargoResult<IndexSumm=
ary> {
+         // ****CAUTION**** Please be extremely careful with returning e=
rrors
+         // from this function. Entries that error are not included in t=
he
+         // index cache, and can cause cargo to get confused when switch=
ing
+@@ -853,7 +845,7 @@ impl IndexSummary {
+                 features.entry(name).or_default().extend(values);
+             }
+         }
+-        let mut summary =3D Summary::new(config, pkgid, deps, &features=
, links)?;
++        let mut summary =3D Summary::new(pkgid, deps, &features, links)=
?;
+         summary.set_checksum(cksum);
+         Ok(IndexSummary {
+             summary,
+
+diff --git a/src/tools/cargo/src/cargo/util/toml/mod.rs b/src/tools/carg=
o/src/cargo/util/toml/mod.rs
+index 1cc32dee8..a32f0384b 100644
+--- a/src/tools/cargo/src/cargo/util/toml/mod.rs
++++ b/src/tools/cargo/src/cargo/util/toml/mod.rs
+@@ -2432,7 +2432,6 @@ impl TomlManifest {
+         let empty_features =3D BTreeMap::new();
+=20
+         let summary =3D Summary::new(
+-            config,
+             pkgid,
+             deps,
+             me.features.as_ref().unwrap_or(&empty_features),
+diff --git a/src/tools/cargo/tests/testsuite/features.rs b/src/tools/car=
go/tests/testsuite/features.rs
+index 848e05677..557fab14a 100644
+--- a/src/tools/cargo/tests/testsuite/features.rs
++++ b/src/tools/cargo/tests/testsuite/features.rs
+@@ -1937,8 +1937,8 @@ fn nonexistent_required_features() {
+ }
+=20
+ #[cargo_test]
+-fn invalid_feature_names_warning() {
+-    // Warnings for more restricted feature syntax.
++fn invalid_feature_names_error() {
++    // Errors for more restricted feature syntax.
+     let p =3D project()
+         .file(
+             "Cargo.toml",
+@@ -1948,72 +1948,57 @@ fn invalid_feature_names_warning() {
+                 version =3D "0.1.0"
+=20
+                 [features]
+-                # Some valid, but unusual names, shouldn't warn.
+-                "c++17" =3D []
+-                "128bit" =3D []
+-                "_foo" =3D []
+-                "feat-name" =3D []
+-                "feat_name" =3D []
+-                "foo.bar" =3D []
+-
+-                # Invalid names.
++                # Invalid start character.
+                 "+foo" =3D []
+-                "-foo" =3D []
+-                ".foo" =3D []
+-                "foo:bar" =3D []
+-                "foo?" =3D []
+-                "?foo" =3D []
+-                "=E2=92=B6=E2=92=B7=E2=92=B8" =3D []
+-                "a=C2=BC" =3D []
+             "#,
+         )
+         .file("src/lib.rs", "")
+         .build();
+=20
+-    // Unfortunately the warnings are duplicated due to the Summary bei=
ng
+-    // loaded twice (once in the Workspace, and once in PackageRegistry=
) and
+-    // Cargo does not have a de-duplication system. This should probabl=
y be
+-    // OK, since I'm not expecting this to affect anyone.
+     p.cargo("check")
+-        .with_stderr("\
+-[WARNING] invalid character `+` in feature `+foo` in package foo v0.1.0=
 ([ROOT]/foo), the first character must be a Unicode XID start character =
or digit (most letters or `_` or `0` to `9`)
+-This was previously accepted but is being phased out; it will become a =
hard error in a future release.
+-For more information, see issue #8813 <https://github.com/rust-lang/car=
go/issues/8813>, and please leave a comment if this will be a problem for=
 your project.
+-[WARNING] invalid character `-` in feature `-foo` in package foo v0.1.0=
 ([ROOT]/foo), the first character must be a Unicode XID start character =
or digit (most letters or `_` or `0` to `9`)
+-This was previously accepted but is being phased out; it will become a =
hard error in a future release.
+-For more information, see issue #8813 <https://github.com/rust-lang/car=
go/issues/8813>, and please leave a comment if this will be a problem for=
 your project.
+-[WARNING] invalid character `.` in feature `.foo` in package foo v0.1.0=
 ([ROOT]/foo), the first character must be a Unicode XID start character =
or digit (most letters or `_` or `0` to `9`)
+-This was previously accepted but is being phased out; it will become a =
hard error in a future release.
+-For more information, see issue #8813 <https://github.com/rust-lang/car=
go/issues/8813>, and please leave a comment if this will be a problem for=
 your project.
+-[WARNING] invalid character `?` in feature `?foo` in package foo v0.1.0=
 ([ROOT]/foo), the first character must be a Unicode XID start character =
or digit (most letters or `_` or `0` to `9`)
+-This was previously accepted but is being phased out; it will become a =
hard error in a future release.
+-For more information, see issue #8813 <https://github.com/rust-lang/car=
go/issues/8813>, and please leave a comment if this will be a problem for=
 your project.
+-[WARNING] invalid character `=C2=BC` in feature `a=C2=BC` in package fo=
o v0.1.0 ([ROOT]/foo), characters must be Unicode XID characters, `+`, or=
 `.` (numbers, `+`, `-`, `_`, `.`, or most letters)
+-This was previously accepted but is being phased out; it will become a =
hard error in a future release.
+-For more information, see issue #8813 <https://github.com/rust-lang/car=
go/issues/8813>, and please leave a comment if this will be a problem for=
 your project.
+-[WARNING] invalid character `:` in feature `foo:bar` in package foo v0.=
1.0 ([ROOT]/foo), characters must be Unicode XID characters, `+`, or `.` =
(numbers, `+`, `-`, `_`, `.`, or most letters)
+-This was previously accepted but is being phased out; it will become a =
hard error in a future release.
+-For more information, see issue #8813 <https://github.com/rust-lang/car=
go/issues/8813>, and please leave a comment if this will be a problem for=
 your project.
+-[WARNING] invalid character `?` in feature `foo?` in package foo v0.1.0=
 ([ROOT]/foo), characters must be Unicode XID characters, `+`, or `.` (nu=
mbers, `+`, `-`, `_`, `.`, or most letters)
+-This was previously accepted but is being phased out; it will become a =
hard error in a future release.
+-For more information, see issue #8813 <https://github.com/rust-lang/car=
go/issues/8813>, and please leave a comment if this will be a problem for=
 your project.
+-[WARNING] invalid character `=E2=92=B6` in feature `=E2=92=B6=E2=92=B7=E2=
=92=B8` in package foo v0.1.0 ([ROOT]/foo), the first character must be a=
 Unicode XID start character or digit (most letters or `_` or `0` to `9`)
+-This was previously accepted but is being phased out; it will become a =
hard error in a future release.
+-For more information, see issue #8813 <https://github.com/rust-lang/car=
go/issues/8813>, and please leave a comment if this will be a problem for=
 your project.
+-[WARNING] invalid character `=E2=92=B7` in feature `=E2=92=B6=E2=92=B7=E2=
=92=B8` in package foo v0.1.0 ([ROOT]/foo), characters must be Unicode XI=
D characters, `+`, or `.` (numbers, `+`, `-`, `_`, `.`, or most letters)
+-This was previously accepted but is being phased out; it will become a =
hard error in a future release.
+-For more information, see issue #8813 <https://github.com/rust-lang/car=
go/issues/8813>, and please leave a comment if this will be a problem for=
 your project.
+-[WARNING] invalid character `=E2=92=B8` in feature `=E2=92=B6=E2=92=B7=E2=
=92=B8` in package foo v0.1.0 ([ROOT]/foo), characters must be Unicode XI=
D characters, `+`, or `.` (numbers, `+`, `-`, `_`, `.`, or most letters)
+-This was previously accepted but is being phased out; it will become a =
hard error in a future release.
+-For more information, see issue #8813 <https://github.com/rust-lang/car=
go/issues/8813>, and please leave a comment if this will be a problem for=
 your project.
+-[CHECKING] foo v0.1.0 [..]
+-[FINISHED] [..]
+-")
++        .with_status(101)
++        .with_stderr(
++            "\
++error: failed to parse manifest at `[ROOT]/foo/Cargo.toml`
++
++Caused by:
++  invalid character `+` in feature `+foo` in package foo v0.1.0 ([ROOT]=
/foo), \
++  the first character must be a Unicode XID start character or digit \
++  (most letters or `_` or `0` to `9`)
++",
++        )
++        .run();
++
++    p.change_file(
++        "Cargo.toml",
++        r#"
++            [package]
++            name =3D "foo"
++            version =3D "0.1.0"
++
++            [features]
++            # Invalid continue character.
++            "a&b" =3D []
++        "#,
++    );
++
++    p.cargo("check")
++        .with_status(101)
++        .with_stderr(
++            "\
++error: failed to parse manifest at `[ROOT]/foo/Cargo.toml`
++
++Caused by:
++  invalid character `&` in feature `a&b` in package foo v0.1.0 ([ROOT]/=
foo), \
++  characters must be Unicode XID characters, `+`, or `.` \
++  (numbers, `+`, `-`, `_`, `.`, or most letters)
++",
++        )
+         .run();
+ }
+=20
+ #[cargo_test]
+-fn invalid_feature_names_error() {
++fn invalid_feature_name_slash_error() {
+     // Errors for more restricted feature syntax.
+     let p =3D project()
+         .file(
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-de=
vtools/rust/rust-source.inc
index 4a720e645b..086375a3c6 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -7,6 +7,7 @@ SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-${R=
UST_VERSION}-src.tar.xz;n
             file://zlib-off64_t.patch;patchdir=3D${RUSTSRC} \
             file://0001-musl-Define-SOCK_SEQPACKET-in-common-place.patch=
;patchdir=3D${RUSTSRC} \
             file://bootstrap_fail.patch;patchdir=3D${RUSTSRC} \
+	    file://0002-CVE-2023-40030.patch;patchdir=3D${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] =3D "bb8e9c564566b2d3228d95de9063a9254182446a161=
353f1d843bfbaf5c34639"
=20
--=20
2.42.0


