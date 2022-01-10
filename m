Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3816C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 06:17:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.28386.1641795440812245009
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 22:17:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=gBOoqR7V;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=80098239fc=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20A6HJMu003888
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 06:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=ek0KvZd03kafuaaOVt/LKumEe6rEZIV3Df8Z75MYDLw=;
 b=gBOoqR7VkrhD150B9Ai8aaojdzgCUpMFsr6571guZRvuzRR6BnmIR+Kzkl+vPic4QctJ
 t1WHIaHKV+u+nHdAMbTyO2QR4N7ItGsIDyb0a2bcb9+a+wvOpqD/yQaH76ple+WOMKSj
 HLS4fb/fkTANGRCaOQO+SpsZqxoq1QQP6aUY/Nrb+HfMDU2SU+5fkpiP8jd50AQFmr1H
 Zg6bpD5MToyFJ5CoIOznnv1wWc8VLmNJG4QX2ckH4AtgfYDWwyFsMd/zl+In0UKjpGU0
 QSCBxHXYCIJ9/An5B3VugoxsmdVRR00ePKHCeeESGO7JZDm6VrjRKkp0upwmpCahyDf2 0A==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dgd99g1tt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 06:17:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jAixaihu7ER/WxAgWS0YNbo2jvO2uq8gPqTv4Ng7VqFiDW8JurU/spF9tlkt0HxjjOp9ktskmPS34kiUkxVUuHZIPR3/zr2fr7hG0Oo+d1HbcnQzAazxYJJehcX5QG/AKVNIGF6TStivtLGfFOF5TLIlM15E3KQtMLArWZcpMkVz7bF+0w4mMLyKEa9wFzPzxpkhtGDdHQOoOE2oRf75X2sNx6qgD0c3nHc/lpwgJyiUnSaKAqAxktPlOogPFFSd7cd/2IgiH9jcScH5RLWrc8QhIXcWhisyK/TXELhuZt12fkKp1hlRDkqZJg4Y5WpIACquZH4Q7Tk8ejEThm9I0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ek0KvZd03kafuaaOVt/LKumEe6rEZIV3Df8Z75MYDLw=;
 b=XlLCK9eN5XBtAzTssGdgzQaf9u3f6qKSA+ALQifY79XkR8+vrZ84hzTEjfmbfNr1u1UUlPwloWPHtR4FBUDhY2tiOaOs+EL86IOAa7SqqC4E6CY5ewrUyw9M1QSvqrVipR/YgA7rV/fFRHHePQxCYUnRB737uvd129jATYjIF50NJsVO7xOiJNB1xCiNoNTQVkhK8G6tNUulaQ1xrwh2EIlJJgQyBBaY7zNTs1icjOtA81Y2FmVMcTK09oZhtY4by2Fluw3nUKtC5iwCQk3Dy8eY+dwZtspGEta0P1N8R44L41FlKUXsiT/eYHlSgh3Dp1gnVjE7+YRQ3lbuAitLXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO6PR11MB5588.namprd11.prod.outlook.com (2603:10b6:303:13c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Mon, 10 Jan
 2022 06:17:16 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::f1ef:f6f5:d3e4:27cc]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::f1ef:f6f5:d3e4:27cc%5]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 06:17:16 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][hardknott][PATCH] populate_sdk_base: remove unneeded dirs
 such as /dev
Date: Sun,  9 Jan 2022 22:17:04 -0800
Message-Id: <20220110061704.6399-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0191.namprd05.prod.outlook.com
 (2603:10b6:a03:330::16) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe462a6c-758b-401d-8e8e-08d9d400d976
X-MS-TrafficTypeDiagnostic: CO6PR11MB5588:EE_
X-Microsoft-Antispam-PRVS: 
	<CO6PR11MB5588DEEAE8ACFBB85AC30BA9ED509@CO6PR11MB5588.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:862;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BrGUoLjPVh8g5Vfse6WxbVkgxcLlPMQrnCLMaW5e9gj+ZaKpKbpOO8vaPBa5cICuQ0j3J97cN25b+SCj2kp6j4VfiV/1hl1JueAhEXxDQuxX5gySwCO3l5OToG08Y5aeWybRoHk1WoasuciTVWbL6pEC0hVq4UmAk2hko+NeikBu083P257nf64vTuQ8RfkbyjzwD1UBYPYhQORn2Eqsbe/qDs5Ra5hsL3IwL6w4xp/DAKRPFgR0mGclJ0wN9IpZExeym93JT9ldY/MGwH+cJluZR2mRg0A5NHxDz3WkLkgXxBCyZx5HCEy7/MaHs8UD+8pO+OdfYaf2MxIsYWSPsH+YsShwIHAnZS14ggoSC4cDS59t+YzD/2znJEW/PwXMoJCCR4X/R9IrSvlYcfPcvfxW+nkcWjHW2/6oVbJtpHVwiKC61UBI9/2QZ0uZ5Gx3ZrgEmF2GzqEZjWe1jXWpKs5aRiZOEPyj2Ro4YRENYtS5QaHGPMiN/qDebPtikXxI0eAra5Hj2vKz23igXqDRO81uacmz5uyp+7dgzKM/Nbx/zcliUUylYNXk/5WIn58OPUoLCtlu3BwF+WxDmtuy8+WVYEQln1lG9W98lHxSEuG2JRqY9C2HGF4r9tjIrhRZvoKKZ5g7SS5xnbp8L9nhy40GjQ6ch1NEVMxr3finz9A7AL13sVq7YtdhVnkORnayiG/+CLQGJX6+CqD0533hlw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(1076003)(6512007)(6666004)(8936002)(36756003)(5660300002)(2906002)(6916009)(38100700002)(6486002)(38350700002)(8676002)(316002)(6506007)(186003)(83380400001)(2616005)(52116002)(86362001)(508600001)(26005)(66946007)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?O3Unl5ZJ+xXvUp/IXcfqXy/yptz7PcuDqmNNF5bunCLlZEUdaqShYoY1AwBx?=
 =?us-ascii?Q?ujGbXQhswrGeY/9XTJ8Oewc9QjSMnH8uortWxB4qleg/Swl0iDsiaersVDTQ?=
 =?us-ascii?Q?d/ojkberakAuwcZ7mMalwlXB6FsZ83AV6f4aB3EMlKidevaS2co4yxct9hyY?=
 =?us-ascii?Q?c1X0F3QTptSfWy1+/y5lUJHx7+EABzKOa++TnNr75CM1S3r943kWFIO2bIqn?=
 =?us-ascii?Q?F6G8+5qrUNOS7GvvX25WlbQCHl/Wc2JcO1xqJPt4uIUDdLpTdknndoHjflUO?=
 =?us-ascii?Q?HYKSm2SP4sZwFjG8Xh/w4g4LORA4yt487dv4f9tcDPodCO9J1Kexnc1w8AE3?=
 =?us-ascii?Q?6c/zdm9GrMHFfc/W6twoJ/idMidZuHDc8lOfZxUTuXmtgAqMq+WBNVGB4Eib?=
 =?us-ascii?Q?fDXeJMlCy8IKmgMfhVt059XpRBzG6g8mAScx0Ctz7wpJuPpyiIEOMbu5tTDj?=
 =?us-ascii?Q?FK8yyfYyhpXzEVjpiWx95Zln4udbnZ6cJFXOmhnYpYERPOn/qerSUB7a+8N4?=
 =?us-ascii?Q?wvHMTXxFWb5GBfLU04JKsGXhsqnI77dfrAqbcryto7Gor9WoQkTrQF3hW554?=
 =?us-ascii?Q?BMFipfO6/k9ETBNvwV6XC2eunrF3olteDLdqk8EYBR35RjhocO2Xl/QQit9r?=
 =?us-ascii?Q?7wisgkSZS+XjynqIiYhzZHdRIpUv7/0CDK271LfZ5SIGGTdSszpehOUNwWSc?=
 =?us-ascii?Q?+w6QhZHj+kJbiG7ecE7UdAeLmgFWeyHN3MeUOEhnu1JN6Q3rWFQPTlc9W497?=
 =?us-ascii?Q?JxrSYTWoCgq0NkhoNpqTwSIzRBU9gyLXvVFu1vkeia+LWzPDHX+/EcS34zT5?=
 =?us-ascii?Q?6ORmlgqGqXMUImntyV6EEpI7H8jYihLyR9kmRPnK9+oHS6cGBhg9P3M80Oj1?=
 =?us-ascii?Q?OGNc7mIWpSyDVgJIYdYtvnEIkX2y7+APeYv6jMFTaiKvvlWmYbbSCCAaCUOK?=
 =?us-ascii?Q?NAz5sXCWbdDWxmrK904E+QY7i0R2loVuRYbNo5e2f3a873zmRHOHfL7S2s2P?=
 =?us-ascii?Q?qFLDg0myykhETc0txxZZaMfYT0Fi6Jg/k2PFwS2MCPfeNFq8KcQf/62z3QFs?=
 =?us-ascii?Q?e2GO+vmpHA7AOGxN0+KIHoHN74xS0GBWxshK9+3Cbi/ThcwLrbnN81q9F6U+?=
 =?us-ascii?Q?cNZgJv1VVSPnjFt3r2Vo4rv+Ext8X8waTGvi3qyQcYE9Vx7AyIwY+dfH/Mbb?=
 =?us-ascii?Q?79lZfEvnxF9YWSOPeqt0EfDKT+qnrU4Kl2Q3Sxse6ItYuXxCF1WJ0MKs3YFY?=
 =?us-ascii?Q?WUaZEwnYZiGWxH4ZnWA8sn9nj7trJhcdq9LSa1x3hLq6eJf4HI59Tou7QXBA?=
 =?us-ascii?Q?Q5ZN5qyjALNtgEEUsOzIDF6/MbgZ/spCOXeCjcE0IAUL9rb5EVaFVNStTnBZ?=
 =?us-ascii?Q?UCknG9ZZ7zbFeEzHC/TKXuRfDbCEgWURmWvc9zuxE5bSeDoyokTF1jjR6tw1?=
 =?us-ascii?Q?tnCctFOQW3Oo86gr9Gt7IX/8dNsyrB44o0wLgKrlw3V25uPcpfXTze4Qvt/j?=
 =?us-ascii?Q?j/nd+JEyYc6HqKZ9UvgkysiVMrDkvQjnWtT1XimQo3AEpfBce3TdEDwwUWi7?=
 =?us-ascii?Q?PnSYDsnyiy9hJj0WvXF9IBmaXSH99ck9EA8A5Tq4aw0vsxqIUh/AwlugT3aK?=
 =?us-ascii?Q?X6IZ1/htGvn3ZpSSUZMn97c=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fe462a6c-758b-401d-8e8e-08d9d400d976
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 06:17:16.6430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 +oIlx8/xO1vpP41mgxnr5tEBeicUNs0lwG/R3Ku09MtdgJ8iEnyPtIy6RHqRBX5VYZpDoUAMV5khZ9xRFJMvnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5588
X-Proofpoint-ORIG-GUID: WusbLr6c5Uoy0ySHtYWvqAFcMKFFDe49
X-Proofpoint-GUID: WusbLr6c5Uoy0ySHtYWvqAFcMKFFDe49
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-10_02,2022-01-07_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 mlxlogscore=739 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201100043
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 06:17:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160335

We met a problem that core-image-tiny-initramfs's SDK cannot be
installed. The error message is like below.

  tar: ./sysroots/core2-64-poky-linux/dev/console: Cannot mknod: Operation not permitted

In fact, the '/dev' direcotry is not needed by SDK. So remove it.

This patches uses a variable, SDK_PRUNE_SYSROOT_DIRS, to hold useless dir entries
so that it could be extended. For example, '/usr/bin' could be added if wanted.

(From OE-Core rev: 9154f71c7267e9731156c1dfd57397103e9e6a2b)

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/populate_sdk_base.bbclass | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 2d33611ddd..76757a3a9d 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -90,6 +90,8 @@ SDK_HOST_MANIFEST = "${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.host.manifest"
 SDK_EXT_TARGET_MANIFEST = "${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.target.manifest"
 SDK_EXT_HOST_MANIFEST = "${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.host.manifest"
 
+SDK_PRUNE_SYSROOT_DIRS ?= "/dev"
+
 python write_target_sdk_manifest () {
     from oe.sdk import sdk_list_installed_packages
     from oe.utils import format_pkg_list
@@ -101,6 +103,12 @@ python write_target_sdk_manifest () {
         output.write(format_pkg_list(pkgs, 'ver'))
 }
 
+sdk_prune_dirs () {
+    for d in ${SDK_PRUNE_SYSROOT_DIRS}; do
+        rm -rf ${SDK_OUTPUT}${SDKTARGETSYSROOT}$d
+    done
+}
+
 python write_sdk_test_data() {
     from oe.data import export2json
     testdata = "%s/%s.testdata.json" % (d.getVar('SDKDEPLOYDIR'), d.getVar('TOOLCHAIN_OUTPUTNAME'))
@@ -120,8 +128,9 @@ python write_host_sdk_manifest () {
 }
 
 POPULATE_SDK_POST_TARGET_COMMAND_append = " write_sdk_test_data ; "
-POPULATE_SDK_POST_TARGET_COMMAND_append_task-populate-sdk  = " write_target_sdk_manifest ; "
+POPULATE_SDK_POST_TARGET_COMMAND_append_task-populate-sdk  = " write_target_sdk_manifest; sdk_prune_dirs; "
 POPULATE_SDK_POST_HOST_COMMAND_append_task-populate-sdk = " write_host_sdk_manifest; "
+
 SDK_PACKAGING_COMMAND = "${@'${SDK_PACKAGING_FUNC};' if '${SDK_PACKAGING_FUNC}' else ''}"
 SDK_POSTPROCESS_COMMAND = " create_sdk_files; check_sdk_sysroots; archive_sdk; ${SDK_PACKAGING_COMMAND} "
 
-- 
2.33.0


