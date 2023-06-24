Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1EB3EB64DA
	for <webhook@archiver.kernel.org>; Sat, 24 Jun 2023 16:48:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.20395.1687625278265949068
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Jun 2023 09:47:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=FWVnfOOa;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5539481b1a=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 35OGlvLd022054;
	Sat, 24 Jun 2023 16:47:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=/TAUgOrTwU+BwVXGGl
	Qx4P5ncwb2t8uonw+2EXdH178=; b=FWVnfOOa8rLcvmGFsXqr8Fkpw6v/gRsQyR
	7UPXaz2W0rWyRDuhdIhB9d7RwOMwcLyzXf/STebgubHbluwZ6pMPbaWLaeaPr+mp
	5vtqX9rbUr4t5CGl3SDCD3R2QI2eyMtlgPFZWOktgbnkoC+X+hJSKCBS32aqFJPc
	5GP5U1xNvF2bCcBBrBY+eXbeoBGI4iR4VmvIuZBjwHI6gOtFORQGeD2kofyD8qxC
	okRmNkKCGsjLeKjak82AxN/ybt4E3t/vvpQjfO9Wqfl5VP9A729ZHIW1d1RoLkb8
	OjEMt6txPSVCaTXZ6Ip/rh4maKhTgB6tFilcYD7qWUhJYrPPR5fQ==
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2043.outbound.protection.outlook.com [104.47.57.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rdpqb0eu6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 24 Jun 2023 16:47:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d19Gm0jSfBXy6KWxnH3CUarH3oC9Q1wwh/ktRtnMFPvVrPsVTb9CNVl1hwBjfw+7r47Ueuk4KBMZbY2q+ZFLD7KIDtU8z9w3l9pGMElp/WarmU7JmCGFF+cAAbKyIx77O89GPazr64LlCJ+HB6pIfFPua64fnoPY7zmYpwPQPbNbY902/62K8HaD4nGdlNzI7zv4VtxT701TtKTdw7JBILnithQVuXt0bq0Alv0/k4+3EpHeEazoAxYc+X00vK2ED3lCDJLadZWF6Q0f6NCWUaaTjB2szGeJyd/3DHEsk2LCc0pfacK/Ouzr9dKuTmelFSmi1T5l7ZA2STkblAKwAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/TAUgOrTwU+BwVXGGlQx4P5ncwb2t8uonw+2EXdH178=;
 b=Dj22Y63wsGK9duZSkTmLlfSEsUgcgRd2/229h8t22VIuJAoHFKvYJbiG4dOs6Ol0VWo+N7DPbeaAQSKC2xiFxbqaG5ZqC4Xr1RdAJpQkoL0Fg6XLmDGTup0DUw/7AHiuUVZrnu+2leqhT9dQiaWn4SF41vPdjKSb8XMH1zX0F/tzMoDq7z/3N789Vo+6H1QGcaAd2Z7Dzxk+2B6p4/Pir+kJhQhPCI7DYJeK6yhrgwLZNW2L9NwlgSGi8IRV4If0lD4Nnyrg6w64siPv3P0g3Vb2agxItT5BbQCnIO+6cB6TobgDgfBLplt4HxQ5fnPB0UVFxefO1JeU5u8KEjdCeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 PH0PR11MB7657.namprd11.prod.outlook.com (2603:10b6:510:26c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Sat, 24 Jun
 2023 16:47:52 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::8dd:d4cb:2602:c41]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::8dd:d4cb:2602:c41%4]) with mapi id 15.20.6521.026; Sat, 24 Jun 2023
 16:47:52 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [mickledore][PATCH] go: Upgrade 1.20.4 -> 1.20.5
Date: Sat, 24 Jun 2023 12:47:12 -0400
Message-Id: <20230624164712.2058673-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL6PEPF00013E0E.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:f) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2538:EE_|PH0PR11MB7657:EE_
X-MS-Office365-Filtering-Correlation-Id: b1fd5bc0-a76c-421d-796e-08db74d2c00c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3wybEaez0dQcudF+MORJAOj+3Smp5j9AUgeu5I+mG16ziT+XsyNtg6XEix8eouy/SNLPRvULQK5WTmxG9eG0Gmv3Tyn76f+c9257INAgz6qVmTW6HrONEVad3JuM4KmmE1ZMsm8uwDK3EkCavLkeMwcKLH2z9vuqIKpDCvy104YYMdodhUm7PlCMg+UWhmkOpAujOqw347KPnS47V88Sm9cCBmdiBCJyBhliTqlr7A6rz6W2H6r3rDB8fJ+KzYvPocHwfklN0ZfDtbw1CDRUemi1LKO71VEjoYqoPe3+HKT3l4L7NeMNGD0QG4YlNVrPxlr1CsNQuFs7ZhtCJ7g2oP1I51uwp9gtvh5Hg+HdqsURyq9PuxlBEIwbPAoddO0GfZrbt1trWzHiHujFQLO0n4tcNiCOuti9eMK0+KEr01jIIKx7iKUVI/MBjmY/vxLa/ruUm2AEOYXAL2cwKLNuHm4n6VUedhJYxRJfGZCNlQBwht3StIKqKQqNrqzVUFRLIFGF6ucIgk8CzBj4oICyFxLktBRAv9KbRCYj4RvKFDWxsPWo5CHPq/uizYxaZEhiyQteF318n8lViZH4Vi9CiK0MBuYLMiVTaI6JxJ+t5L8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(396003)(346002)(39840400004)(366004)(451199021)(8676002)(478600001)(52116002)(6486002)(66946007)(66476007)(66556008)(6666004)(36756003)(6916009)(316002)(86362001)(6512007)(83380400001)(186003)(1076003)(2616005)(6506007)(38100700002)(966005)(26005)(5660300002)(38350700002)(41300700001)(8936002)(44832011)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WXBBC4UgQIxiU9OLRS8FMi9KLdQ0wpR4Zqcz99ANu7LQzYAYC5u2k1H/NPao?=
 =?us-ascii?Q?XrT7XczIzoAxvKl++3njergDs//qaLGMcHoHwMXIBNwo4bIViHAHz8IvPfL5?=
 =?us-ascii?Q?rn1Jvla6g9zFjv5/PuMhFAsRNXVRxQHx8Nalm+G487BAH8wTq9D2LOEn8q1C?=
 =?us-ascii?Q?Mp1q1jOba/6JAHyIt5gre5FveOhhx/YjonGcqB1DOCt87WYxahixmKNUHnM2?=
 =?us-ascii?Q?3tjwyeWzm6D3GQcoqm3WJLP2OtKiq+/ncMoZq+emD/xpk9I0kQMenAo6pzQq?=
 =?us-ascii?Q?vVkljyvFxm+Mjilzjt8WrufOhJgKsEqMX/0lrUgaPV59z69xZitUWNk9WrcO?=
 =?us-ascii?Q?t59VgdX4op7Pc+akxXoobI6PxY8ZTeoKdF61KRwcIqAhPe2ba66AKaWEx1wh?=
 =?us-ascii?Q?jqqPOUAUQOiHKYVh7tMhlUAFsQdnwN6SZfDPa8/YY28MoFW/+GGncLfRABJ8?=
 =?us-ascii?Q?YHP0p3EiQppi9Z1+Bu9x3+98sJFyzZ6DI5GfsXKFLOPYDCbs8NfrRfXiHMDh?=
 =?us-ascii?Q?JMEhzHjJQzmCJRH2SP9OEf89x/PsLJuDHLs0zjRlm8cyHyGkVhZanptfx+eT?=
 =?us-ascii?Q?sQb7PNSkWonU52w2ZYPkcUaduplOfTBgvoJPWuBfre+J/qhvs01Y0telZ1n0?=
 =?us-ascii?Q?ZMJRQ7pie1YzoNXTwN6eqfPas/8NJt7QkzcnDAPmkzrzC0wlaKfVnVJ4APwZ?=
 =?us-ascii?Q?LSRafo5K74d44yRqpuwxUGjNieXMl/eFVIxrx9kce17SkjGq77j3quWjcYGU?=
 =?us-ascii?Q?7MybFcLx60R0vjF/1LFMcborw2WSLZatyvvaeXDYUKaEsM1OvGhPwDRvrK4m?=
 =?us-ascii?Q?soiionGijH0rk+12XFpF9DnWYDp6QnOHzzZPgSSvoMUZQPpXd0Gn+ZdIgAZJ?=
 =?us-ascii?Q?HAPh69GzPXn0W3SAEGtpZQuAJ9+9xF4poOgAT9OFjrm6odBzuIXh3bSVhZZf?=
 =?us-ascii?Q?YQsDZ/+vvpuKDy8uxvMnzKtdYxg82PmAIURSxngqHWj/8HdIrL/3hYMFQtwe?=
 =?us-ascii?Q?/jgwvXWMPbMNQ+lgWX4R7I/KxLf40yuB/D5iB9p9IZ1ERS0cXCwaOl+HNfh8?=
 =?us-ascii?Q?ZRdGGjrA/nVv2ECrNdwj01L7PjpfgJ6RcZqzvUU2GQWcZjZCPQdlJlTA/43v?=
 =?us-ascii?Q?xn3vgWA4edIgBnB17E4lXGTbgoqwWLSIgbt/KehQgLUHY+kRR2QEU1N7kbVl?=
 =?us-ascii?Q?XnHMf2bT8Ej49k3yRF2pB5Eb7UrgcYmSki2ti7EPWyEFUkHu5/YFBEeIp9ky?=
 =?us-ascii?Q?jTVMLngjVIP+2sJvwT/jA1nacHcATs+Gsd2AzP9QM65CVck06oDS+hnmxwWj?=
 =?us-ascii?Q?uY7bgTOA9+79W1A5mebt3fddZnMhbobbeEeqHsnDfgGz8IUHowzfDtOWWE6Y?=
 =?us-ascii?Q?F1v8hkQB5Lffy2ewIGhk7ZV1EfHQiCINDQeE37ToyPoMP5PInOwIjXdoHvq9?=
 =?us-ascii?Q?xXeWwvcY4LMcoHuG+NE5eyE1zTxtKQS+kJ9HmUWIOj83TKrynrbdoGgoEjJI?=
 =?us-ascii?Q?DrDcUG+9kAputdGJWtgHwfD2J/rJbx8dUpb4XXLMNHBk3Mgn9lhVocwcLGL0?=
 =?us-ascii?Q?VSALWxpCWI6YOQvd1+UxIg+Cm4quSuSpkOaq07HpGE7NPPqSaxlI816G00Se?=
 =?us-ascii?Q?1g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1fd5bc0-a76c-421d-796e-08db74d2c00c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2023 16:47:51.8653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tJpOWodoXFb2FCSBg/aVSNlm08ckrGkJU+S/iT/XopKoalt58Av3lYmDOzY+8l1atJevpnOkDFCQ87+IeAwpP3oo3LvVRDPP54u+S9Unff8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7657
X-Proofpoint-ORIG-GUID: oz34jGkNUUfXTk3B1yug8aa6defkfQgV
X-Proofpoint-GUID: oz34jGkNUUfXTk3B1yug8aa6defkfQgV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-24_12,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 mlxlogscore=999 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306240159
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 Jun 2023 16:48:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183361

Upgrade to latest 1.20.x release:
go.git$ git log --oneline go1.20.4..go1.20.5
e827d41c0a (tag: go1.20.5) [release-branch.go1.20] go1.20.5
c0ed873cd8 [release-branch.go1.20] cmd/go: disallow package directories containing newlines
356a419e2f [release-branch.go1.20] cmd/go: enforce flags with non-optional arguments
fa60c381ed [release-branch.go1.20] cmd/go,cmd/cgo: in _cgo_flags use one line per flag
36144ba429 [release-branch.go1.20] runtime: implement SUID/SGID protections
5036ba77eb [release-branch.go1.20] net: skip TestFileFdBlocks if the "unix" network is not supported
b249ec5655 [release-branch.go1.20] cmd/go/internal: update documentation of go test and go generate
4b95fc1e6c [release-branch.go1.20] cmd/go: save checksums for go.mod files needed for go version lines
31a1e19a59 [release-branch.go1.20] net, os: net.Conn.File.Fd should return a blocking descriptor
450c8021a5 [release-branch.go1.20] runtime: change fcntl to return two values
22741120ee [release-branch.go1.20] runtime: consistently define fcntl
9270e3be8f [release-branch.go1.20] os: if descriptor is non-blocking, retain that in Fd method
600636e931 [release-branch.go1.20] crypto/rsa: use BoringCrypto for 4096 bit keys
afbe101950 [release-branch.go1.20] cmd/compile: fix bswap/load rewrite rules

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3ea1e9e9d7385c78bdd513e44cea5c36444529b2)
Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/go/{go-1.20.4.inc => go-1.20.5.inc}   | 2 +-
 ...o-binary-native_1.20.4.bb => go-binary-native_1.20.5.bb} | 6 +++---
 ...cross-canadian_1.20.4.bb => go-cross-canadian_1.20.5.bb} | 0
 .../go/{go-cross_1.20.4.bb => go-cross_1.20.5.bb}           | 0
 .../go/{go-crosssdk_1.20.4.bb => go-crosssdk_1.20.5.bb}     | 0
 .../go/{go-native_1.20.4.bb => go-native_1.20.5.bb}         | 0
 .../go/{go-runtime_1.20.4.bb => go-runtime_1.20.5.bb}       | 0
 meta/recipes-devtools/go/{go_1.20.4.bb => go_1.20.5.bb}     | 0
 8 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.20.4.inc => go-1.20.5.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.20.4.bb => go-binary-native_1.20.5.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.20.4.bb => go-cross-canadian_1.20.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.20.4.bb => go-cross_1.20.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.20.4.bb => go-crosssdk_1.20.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.20.4.bb => go-native_1.20.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.20.4.bb => go-runtime_1.20.5.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.20.4.bb => go_1.20.5.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.20.4.inc b/meta/recipes-devtools/go/go-1.20.5.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.20.4.inc
rename to meta/recipes-devtools/go/go-1.20.5.inc
index 05bc168e0c..4e4e57d5cb 100644
--- a/meta/recipes-devtools/go/go-1.20.4.inc
+++ b/meta/recipes-devtools/go/go-1.20.5.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
 "
-SRC_URI[main.sha256sum] = "9f34ace128764b7a3a4b238b805856cc1b2184304df9e5690825b0710f4202d6"
+SRC_URI[main.sha256sum] = "9a15c133ba2cfafe79652f4815b62e7cfc267f68df1b9454c6ab2a3ca8b96a88"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.20.4.bb b/meta/recipes-devtools/go/go-binary-native_1.20.5.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.20.4.bb
rename to meta/recipes-devtools/go/go-binary-native_1.20.5.bb
index 87ce8a558f..a98be4af1b 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.20.4.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.20.5.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "698ef3243972a51ddb4028e4a1ac63dc6d60821bf18e59a807e051fee0a385bd"
-SRC_URI[go_linux_arm64.sha256sum] = "105889992ee4b1d40c7c108555222ca70ae43fccb42e20fbf1eebb822f5e72c6"
-SRC_URI[go_linux_ppc64le.sha256sum] = "8c6f44b96c2719c90eebabe2dd866f9c39538648f7897a212cac448587e9a408"
+SRC_URI[go_linux_amd64.sha256sum] = "d7ec48cde0d3d2be2c69203bc3e0a44de8660b9c09a6e85c4732a3f7dc442612"
+SRC_URI[go_linux_arm64.sha256sum] = "aa2fab0a7da20213ff975fa7876a66d47b48351558d98851b87d1cfef4360d09"
+SRC_URI[go_linux_ppc64le.sha256sum] = "049b8ab07d34077b90c0642138e10207f6db14bdd1743ea994a21e228f8ca53d"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.20.4.bb b/meta/recipes-devtools/go/go-cross-canadian_1.20.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.20.4.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.20.5.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.20.4.bb b/meta/recipes-devtools/go/go-cross_1.20.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.20.4.bb
rename to meta/recipes-devtools/go/go-cross_1.20.5.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.20.4.bb b/meta/recipes-devtools/go/go-crosssdk_1.20.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.20.4.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.20.5.bb
diff --git a/meta/recipes-devtools/go/go-native_1.20.4.bb b/meta/recipes-devtools/go/go-native_1.20.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.20.4.bb
rename to meta/recipes-devtools/go/go-native_1.20.5.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.20.4.bb b/meta/recipes-devtools/go/go-runtime_1.20.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.20.4.bb
rename to meta/recipes-devtools/go/go-runtime_1.20.5.bb
diff --git a/meta/recipes-devtools/go/go_1.20.4.bb b/meta/recipes-devtools/go/go_1.20.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.20.4.bb
rename to meta/recipes-devtools/go/go_1.20.5.bb
-- 
2.40.0


