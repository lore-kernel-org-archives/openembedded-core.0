Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B8D9C74A5B
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 16:46:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.18652.1679417193381833561
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Mar 2023 09:46:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=NlOoyCAz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2444fa4cce=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32L7SoGS011583
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 09:46:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=cUhMlug5cWy15y5SIuInNPQYImt0pEIjj2SxeDzmXd8=;
 b=NlOoyCAzPW39R1Ydfxr00rWhHwy3pQYCJCgYrUTE+zk0NSd9JX487xUR/Zkj/9YmTk56
 TAWBvbY8ZH8+nF5kJlpnRgqXFaaVgC3yTTpZHiILTQ5n3ctppKRbx4vhOSjFxWjzHGMn
 y4ZOog7OJSqU5w7XJBpCnUqjokF/XhjMpv0DbL9KSIyYiwweSLCgIcspNYrx745j9gQf
 U9Yka4LAd19HVMhTUXnxyRdkf/+GvzLPGjj8SMPIzCSV8rg4Y/xejww0lbAD+OxJ9vJR
 Zp8tN8vtuiEClCipIeMwl9+TlHYgtjO+IpTJ/bejN+/OHzMu8Md9pvAXCLDiVB2y0Fs5 Dg== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pd8k4u4eu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 09:46:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=La9Rpr/qCm9r9dB65k0PYCCUCBr5S4iLa/Hzq5R5fU7VJRJ0u1cSAGejJ+IOgmjlHefav2qhYWgZZo/XAoY2trPJ+NKvzV3XFvA8ssP46EB6BQLLiK2Qh43N7EcibsgjSHVH/5ocR7G61anfBi4b7AKrku3SfGXqqOKfi8GtN8U1OHDv0IWQS8xiol+mMkYxQP8TTrd/3WqplpH69vS9TJdEdf4Zm1PeqUTiB0G8ShdzEPHDe5gU6ZqIjrecuMnue8SnxKnk2tuBP/Up7io5jJMfZykpRtQmq+0WyHfAq3/N+aqdlu2nnAW/2J/b8WB0raHk6mF/FIdH6Z3kVmVUjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cUhMlug5cWy15y5SIuInNPQYImt0pEIjj2SxeDzmXd8=;
 b=ac0c5VIUvb+rHGRB0p7mwYwNJAMLv2x3pZClBJdHc2R7pGQtLmNpEsyr3xt2hLspBE4sBCNnZKgwyNwyjKYqv9Iip5bwkqzi/kr0ks1xwIgB/bHmwh9PUN0uLF5sx6XL63jYxVH6n45wPHIOuwcymDrO/ZcNfNXjz8ymcjtZwCHomj5ZIECsuTlppicFOPdo0zZzqx/TLs1WaXnUsOIeR8VjBnoYnW/LzbxLzUDEOOjsWnx80DUc5THt66OaPsixMFsariD+alvQAi/JVaiu6ZglDGL6uaVGPzxe6URZE9NHgF77y4vl4f23Tt6/qiAAWch2tozcBTlchsi5Cd6Ylw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH3PR11MB8211.namprd11.prod.outlook.com (2603:10b6:610:15f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 16:46:15 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ab37:4985:7b95:2b95]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ab37:4985:7b95:2b95%7]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 16:46:15 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] rpm: fix RPM_ETCCONFIGDIR value in SDK
Date: Wed, 22 Mar 2023 00:45:59 +0800
Message-Id: <20230321164559.11938-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0130.apcprd03.prod.outlook.com
 (2603:1096:4:91::34) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CH3PR11MB8211:EE_
X-MS-Office365-Filtering-Correlation-Id: c2ed584a-1bd9-44fc-538a-08db2a2bc97c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YVRBSZ/mOwyO2BwYNDBTViYABz97imvI6B0Tndksv4lOW2pLuYJM7AWjzQCqtNIcF1/3h/k4aWrGNak+ZTYxCrPkKRMatW7rw37KFwbhuK7oqu/Zh0C0QGG4q0DtXM4OnrWypo9d/t5W6XZoEtglMG0gJfGNIZBU+syiFLBnIC7fT6RQ51mTbLx30eOceiwfHY5oGavNAsnetc/3qqhZEIjcxc5Q6WJhMDGGvBgN8qR6pE5uW8ovlJzMkKGLLhWRMN2LD0S698i25TLi47wzUrhoreaoz2DUtzRlMekOcB5XFOD+nU6YraT+wQ7jA2AmUy0NI3ArbbBFNTxvrZ0CnHMwFPdpDio3a6fqe0005h+E6jNvGVbr4WaZy0bIgpAvWkW7a6i6CCv8ErEYgJAvxxKmmLjDoG+Xh5C3KJ7O1p7aK3DqD9igi5l96cCYvS17mn5iwv7s0b2AsCK4GtiOf7FqCgyjyEFmVzrdmNd1bhyTKfqihUQjvApp6gUm7qhIZ4XHRaF4rqL1joHmDHRnztmr3tCaSAtP38nfWXDjwqNGNIdrBjOivh5KN+RbGf8AsIJBUZQ+Qx9XD6LJsaKDDp3FBS/SfzqsSIbOigcSSzZd/KgjmXJklHBqiWx7Bu3C60TGekjuomJw5vKOfnI6JICJxAQDy5MBzNIzczryh9u633cNIn3zRRKyeV+1CySgwf4Itvd/lNdpPaZXFu1MRg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39850400004)(346002)(366004)(136003)(376002)(396003)(451199018)(41300700001)(2906002)(8936002)(5660300002)(8676002)(66476007)(66946007)(6916009)(66556008)(1076003)(86362001)(478600001)(52116002)(6486002)(6666004)(6506007)(6512007)(36756003)(186003)(26005)(316002)(83380400001)(2616005)(38100700002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?H6kUkEe4gTUNr+fDJNOX+6vZVK9jf+JoAqaC63h9xqGCoquwFYoKsnCXjfku?=
 =?us-ascii?Q?EuU72PW3xiDjwcdiD1XH6T1XhaXqpeHFiR5fWVAWbSGKNxcTmldwDutqH/R+?=
 =?us-ascii?Q?5LmtfdguikcM9YbmVWN9LYIsxWCGLOc8d5frMnQE8cZ9XUsJpiz6ehgmYf7R?=
 =?us-ascii?Q?OMRjohFvNurApAB+ygPxVFq08hArNvcsLu+HlEVrO8Rzv6sOQFHtNAxQH6E8?=
 =?us-ascii?Q?LB5bmisKPo8twiLmq9//LTWvYgz1WXBFu59d+Fg9ZMvNID8yB0AUJrtyBEi0?=
 =?us-ascii?Q?7BoGHd0spLrznzXprkcjiF2bE3fyPrRyGGgsRDguRd84ny3ND+c1cyrkG95S?=
 =?us-ascii?Q?8dF2C8GyVAMR+3U0KrhQr1mh5BKCCxjqed555Cza1iu0LqA5VUOmprp5qYgD?=
 =?us-ascii?Q?+q22vJ/9r79tPn2o7liWrzkCqttcM/21d8ZgaSO3LgodRDZz3bxBz1lHLSyc?=
 =?us-ascii?Q?cSfCqxWj9FXynolPjbJDVRkszn7oaoYDe1B3ROMiGAnPo5NuS8/ojiCdSd5L?=
 =?us-ascii?Q?HEZ81xB7wQfFLCmfWPG7h4ykhrVB05rFr+T7fuzFciQ45dG0jNVD/mqn9kO+?=
 =?us-ascii?Q?HDNhKb5pz59HJcH2tQpPuVaQEc4Y/y4ohjKrOoT1gwMNQAA3ZGLbzDnk5hKb?=
 =?us-ascii?Q?3/aTnYsdo4rit3eS31mLkfl07NRT2mi54S3/+1m6ET/uQN2B6uLd3V7iUeEK?=
 =?us-ascii?Q?di2ewVX59JwcHNlL3DfVS/OrDraDkcNk4SQ1DgPGtFQMe5NOLm5AbHWabmUR?=
 =?us-ascii?Q?OGw9g/EibwY1DSKjMg128ejKoT+jICK/u3hBojnrqQNXFf7+iOq4eNezTw/v?=
 =?us-ascii?Q?lmdIgV8k5fOlKtMj8VRKfi8VCaVdFCTuhu5RtKQMJ5lue4ZWgrKUGWOhX26o?=
 =?us-ascii?Q?kz3VtHWEoPn45L2rcvR2XN0YhISP8xskCkognEkIShjHU/rEBoF0OVryLGY6?=
 =?us-ascii?Q?DdjXFrGJf/+hQgWrG1yEJhfDQrHVbTlqJjRqRbHAmKI2zySIQ464Ers1YS6i?=
 =?us-ascii?Q?/LWUzFjzsqqejiUtbJhAlMHSpd89n1dIuq8U2WRUnaCj1pmyvanzlpCscoOf?=
 =?us-ascii?Q?3Rr3gbjkzlqyLO3DB3P+6p5hsqs8wD3Y0+TKDMlPxoTUjg9XReHJzAakh2Qn?=
 =?us-ascii?Q?95IgSl/yfLb2cyb1WT3VKbsY2x8nodmWp7RygDBEBarm8nrW+3oRBgWMhMEZ?=
 =?us-ascii?Q?z18jYfPGkglcDZGWucnbJeVnwnnv+hjonFSj3i6PIiO/WDytiAXBdiQvaOOw?=
 =?us-ascii?Q?k6xGsTnjw0OA5wc/pECzXM2NVfs7ykGOOv4jAGlOEbF4ufWLY0t2MbxIHQCO?=
 =?us-ascii?Q?WODRk08o17tvsc6i63/sT7h+R5ATl7nquZDP5zYhUqT30eYRg5N74RiwQL9V?=
 =?us-ascii?Q?6LgmIzcxJNyyZVqZRQUy66niG+0zYevuMM9NLgdB7fnHABtEyb7ITYN9HTAV?=
 =?us-ascii?Q?NZmP/DXefpCn2B5a+1gNgzvinCfQsVXc0XiiKywmB8pz+LKFRg7sxLf7Q44R?=
 =?us-ascii?Q?K7r4mI2D4k9d95zTf9tafpPBOot7QWx9F1kEvPVKGzYHINNoYDb+3EQ5KYYQ?=
 =?us-ascii?Q?s5CjFdobi3JOcuP1EfPqSJNpRp8ZGNfEtmhm6euZ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2ed584a-1bd9-44fc-538a-08db2a2bc97c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 16:46:15.7104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W8FzUBPO9WcQbViQLjOV/8wdXnzK9Io7NBUH9BvVBnP96Ud39trbFBObPyf8LFjuQjwy9TRinLnnGATn12zfww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8211
X-Proofpoint-ORIG-GUID: vUrN9d6QCo5HfNQgQNFGxh-rHao0pxUd
X-Proofpoint-GUID: vUrN9d6QCo5HfNQgQNFGxh-rHao0pxUd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-21_11,2023-03-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=424
 spamscore=0 clxscore=1015 impostorscore=0 bulkscore=0 mlxscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303210132
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 16:46:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178891

The RPM_ETCCONFIGDIR should be some root directory instead of the
etc directory as in patch 0002-Add-support-for-prefixing-etc-from-RPM_ETCCONFIGDIR-.patch
RPM_ETCCONFIGDIR is used to prefix /etc.

The regression was introduced in the following patch.
"""
nativesdk-rpm: export RPM_ETCCONFIGDIR and MAGIC in environment like RPM_CONFIGDIR
"""
The patch incorrectly set RPM_ETCCONFIGDIR, maybe because this variable's
name is a little misleading.

Note that this patch modifies both RPM_ETCCONFIGDIR and RPM_CONFIGDIR.
The RPM_CONFIGDIR's value happened to be correct because of the ${libdir},
not $OECORE_NATIVE_SYSROOT. In fact, due to the substitution mechanism,
the $OECORE_NATIVE_SYSROOT is empty.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/rpm/rpm_4.18.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_4.18.0.bb b/meta/recipes-devtools/rpm/rpm_4.18.0.bb
index aa398793e2..7790db8b5a 100644
--- a/meta/recipes-devtools/rpm/rpm_4.18.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.18.0.bb
@@ -122,8 +122,8 @@ do_install:append:class-nativesdk() {
 
 	mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
 	cat <<- EOF > ${D}${SDKPATHNATIVE}/environment-setup.d/rpm.sh
-		export RPM_CONFIGDIR="$OECORE_NATIVE_SYSROOT${libdir}/rpm"
-		export RPM_ETCCONFIGDIR="$OECORE_NATIVE_SYSROOT${sysconfdir}"
+		export RPM_CONFIGDIR="${libdir}/rpm"
+		export RPM_ETCCONFIGDIR="${SDKPATHNATIVE}"
 		export RPM_NO_CHROOT_FOR_SCRIPTS=1
 	EOF
 }
-- 
2.17.1


