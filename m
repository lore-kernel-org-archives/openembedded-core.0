Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 588F8C4332F
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 18:54:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.10527.1667328853690852100
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 11:54:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Xpx1wDgS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=83045811bb=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A1EHWO5000506
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Nov 2022 18:54:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=xiNElCkQ/IU6XxA7WQ+JDUE28VZecSKWMnpYILrWu8w=;
 b=Xpx1wDgSEtdNWTSCeuECoNpXtxssVZjyKigs8HFRtwSC89YBH+KiZ7C/yPLGmVAkZbvo
 7WGnIpOoPBuuZS3JDaoDLKY0aHymiJeNAj5lx2VhAhsZHCKlE+iNhfYCiySHDPUwl6/2
 oJkcu6nH6Oh1+6DmOr0mOVhw/d8mfE3FReTUGEM6Te4SXjdVBA68/vvgQr+HD/DylsPh
 G23rtBXuunK+Ya+2A2N9hzrFdSrPnDOso9DZ3wVKmpF8boFRs49jk2aQDJ/9jSyJE9VK
 I7J9XY9dVDXJJZaMDzQ9DAytT+U6Nj06LaU47kUFhdQaG6vRs1i46PN/BL95X4jtUo3f /A== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kgu5c2mwt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 18:54:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jdcHaSBx7+tayl4WTEvbZ8qgEAESIfvV5iQTIznXZ3qnuyzGnoEPF+Cpjm2azW6U0+S4Aa6H8y3PLhckWERq7QQlQP+I6uAougszmNye6LoBqY0EXGRlMMqvRankLv+0J/LDjOoVBSOr/RU4VfUkMWim6F9L6B9k3hsXTnyz8em2XOhAMshFTh1BQomFk1B99DxkunWZv5yyGx+tIacvVVKvkpbzdm24Kjnu0JmUkS3Gf04bcq7WMCHTm6MbG8qrxvMc4KCBaWSOCpoBaivXQAs99p1wNCa9T3hK9VtrE6C8SZeiCSz9JOKPRhxTzhPktQrLGnZ/0s1eYJFJ0YpkMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xiNElCkQ/IU6XxA7WQ+JDUE28VZecSKWMnpYILrWu8w=;
 b=hARAg7MkocoA2nR569k3hvF0qhxyUWtqXYf5f3l9DINrPWHkbp+uJPWIhfdaM8aTf/0OUgdVthJw5mJr5kIMTgBBbynGLW8mc0/qcxxCIJ6jhtpIiAsKIV+fFHMywviWBBNTwcEAxi/lPauQqaXQn/ddCkvcz+5hUA4q9+UyzZXFdtHbs1CS6OlnfYk8sAQJYVIX7B0cyu5Yli3z/NHErdOmjZUfgti5iTzXSpfHMblQScfrofRrbn6GKrn4/7XY3lHGSsLutYL2w0qzp/KL39fjyRVLCNuYD3JZRFe6YZfFXQWz+vVM0tFGeNSuXPOzhkHRLKgnBBaGRNHGcZHRfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 CH0PR11MB5458.namprd11.prod.outlook.com (2603:10b6:610:d1::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.21; Tue, 1 Nov 2022 18:54:11 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::1f24:5efb:1519:ef4d]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::1f24:5efb:1519:ef4d%7]) with mapi id 15.20.5769.019; Tue, 1 Nov 2022
 18:54:11 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] go: update 1.19.2 -> 1.19.3
Date: Tue,  1 Nov 2022 14:52:45 -0400
Message-Id: <20221101185245.27081-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR01CA0016.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::24)
 To DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2538:EE_|CH0PR11MB5458:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c8a090f-45b3-4181-600c-08dabc3a7673
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YS9PZ3WOb2rHdBr0pvOn4A1/bgPf/V1bGTfWB7uRwsUxgAFLLpvZ6SJW5v/zsDqjML0cAlrbUyp3NIg+GeG/chgmNMqNz6IeFY4+bwuvq9x3xgUN4R8cUyoLwTZQ2f1eWq5Z9woj/u/Ss8Xup/DXOC/oU8ZatW2Yno9X4U7H73ANw9GrSikrhTfDY7WiFAjZ7dVcXWPyX49CwAdnvmE/cLmeb1sH/TSQ610jeYtbxtJkfBYOv5ycV7ubKBjtZalLWUFhw69UB/WMjjYJJ7VKjdFyb9ToxsNhqMknNsm1IAutGTF5ky59IbmcqmXe2cRaY5S/M4BWuLDJ9F/T3swWDAhpWbQ7l7quaQUlM+EM9U3Hu6YydKRdsOLFmjTaO5XpF3uoPIPRd2zteErOjEx/N+4kv36ARzcVzp4c1BhKolgv24dco58w8HLxCBQSvAskGTfNe0kdqhXrueP1vR19Dl8H0HuHHl8ljD7IYes5RimYV9wc9LyvuQNkQQJSYm6lziADGZCWyz1m/Z+aHQnwLn2N2EuRQccq+vNYZX37it+6ify8P5sdFBuMuh5lLPwZjvPG9a2V4hxJYv80oQ7+0tsKHwuvjQ5gErY5vtmw8WmAGy60zRYyvcIFf8r53fWI7OxpeYBWuQ3sc5fW1C3hrtFmtvY3M4zr1vkNjsXUrK+lLFTVelsfCw2zef+OQb2BQCc6T5NtItfwAX7UTW436mUI8UNS9PWOxqIWsVkz633xe0LvePwG3uZo1iflyvr9cOGdr0qwicXb6yFJFBiiWJaQwTgfI4ogorcSzvYl6Lk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(39850400004)(396003)(136003)(346002)(451199015)(1076003)(66556008)(66476007)(66946007)(8676002)(186003)(86362001)(44832011)(6486002)(478600001)(2906002)(36756003)(5660300002)(41300700001)(6916009)(8936002)(316002)(6666004)(2616005)(52116002)(26005)(6512007)(38350700002)(83380400001)(966005)(38100700002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vYRJA8iSDYKb5cdLc5RVfLMT1vhp6ZEaJ1YCWgbQu7y8edInv1lVZt4dm7zG?=
 =?us-ascii?Q?vbJo242UCLbK/5Q0Vq43Hjn+VvfuZVTAmBxzNQTI9GdyFdIdLiuhlPcA3s2X?=
 =?us-ascii?Q?5eEMvzvZq7QgH7oULNlMA9VqbxjNJyepUem2TGqsztPnay33nXgJ8Q62qc2R?=
 =?us-ascii?Q?9JgyxZt20/tQGsKH8hfOnn9463IEPhR9fpBhi6mJC6CnfTHdU30hGjkffOvS?=
 =?us-ascii?Q?qYkWnxN7UxcgQW+EX1E+zfZJ7XFxZr6gXbflU4epZ17zFwLDFbbzr9J7faJC?=
 =?us-ascii?Q?+ukMWoZJlA5N2JuTQcJEv/mQFg6zCodJpgSCB0eleeKkeYJ8EmItsBbUdkLx?=
 =?us-ascii?Q?EBJnZ+Sb+M9Y+/ARvskVI/XmEB9Td3Yo0q9ty7AZOddOkS91nVWgQfN4ku42?=
 =?us-ascii?Q?yj8FS2rCBjMnV1kKNYs/LM9BYFiwNFoWCGxMBXlcMhiMQOrFu3Y08zXy+gdF?=
 =?us-ascii?Q?854kMH9btbTgbMbbzcNQLcKy6ovvNEQ503FyhJux4/QLnPuq5OLf4WCQeRG6?=
 =?us-ascii?Q?obVBz8wyxrVfr1YrtuAWWp7dT57gCudmzVY8hm53sc0oT6ib+BPFyDLLBHd5?=
 =?us-ascii?Q?kqSuY6V7bkN3wrVTcUD+wwgBCQMFP3ZeRVOoz3mmJ212CYI3wP6OALiQi4wy?=
 =?us-ascii?Q?nIci35dvCgkBqmjJDgJv46/BdVqlWpdDzAAxoG+eqaZjtZmRLvLYufk2CZAt?=
 =?us-ascii?Q?IUwWcAVpogqvimipomj1/S4o+X3UE7Mo2NlflkphdcNISdu35EY95LNClFU9?=
 =?us-ascii?Q?ch+UWSM3RFo4Iw8TNUSXbZTj5QgN8BffXTnMMtlD4g51Z8ejByGzGDOX5Ffr?=
 =?us-ascii?Q?Qbdqhd1xC8qQa7CbtqPZwFZV+AObSZatakHi1EZJe5gdnPuuouveEvyYngvf?=
 =?us-ascii?Q?tV6jVUfSRx30XbADkWpkYw652fFOg95GBFyUDAjg2JUASglaV4TGmfuhST/5?=
 =?us-ascii?Q?/LH2cF0OaUFY8jV9Y6uylnMVbt12KSDQaurB9pzcIc0iGn9VoWBM/shPmUoH?=
 =?us-ascii?Q?ULP805EdWhJ9rmE2u5cAcXF+DlXBBfw4N9o4c+/nUbj0iPYa12av+t2+94ax?=
 =?us-ascii?Q?iAzElTbSus+ShmXH0x5ZHZk40KLPwfGVjc4rGd4+5abq23q8lYGHlDw0cqQ6?=
 =?us-ascii?Q?ziw0Dq+VYTcfB0+is36BUFN8x2w4V6INB5rSYZMim3aly8tDg1fp16oBIv1h?=
 =?us-ascii?Q?4E2c9ZakeCUs5Oi5sK+NkWY4QMHwLFc+ck+JYaKvKH9FlSGdSSSyn+dqTmVJ?=
 =?us-ascii?Q?tmEr3TdSWSthl8WnQjEX6KK5v23uZjtMEETCf6ZhOUl7Zb36jwIcKRtWT/S2?=
 =?us-ascii?Q?X1wuMmC9XLSxVwApF6t51ZDz+0pfklmP56RtSsAkVV3bOG90B57ReEYmEmDQ?=
 =?us-ascii?Q?teTMqO0tMRWo0PaAIgXOqH/p9q/mAwrc+DG5MR5lxBoXR6cCF+cBQZetJs+c?=
 =?us-ascii?Q?64MX4JyaICfYjLH7jUz5/lFPENZ2bz3jpfiMY4IatvYcfTXSR9Ddh6GaUUSu?=
 =?us-ascii?Q?IeS4ljvPC+40LwmutAqCRAu0VpwAb+qgTfjjzNLr1EmH7XznjVnCalU8x6DA?=
 =?us-ascii?Q?aMDj3Ku4KA+tKjSpsvDjIqtSa7+5R2Dgi9eAA8+6EnypTb3utVqTZOztgYe5?=
 =?us-ascii?Q?Tw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c8a090f-45b3-4181-600c-08dabc3a7673
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 18:54:10.9306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dHt7aOGTZx7OOl8A+7yQJOuXdReJqgi188Wt5Wv3/hqyOMunrpHcvE8BqK9R1s0YXblgUQP2/hFetw447EyLv+Sa6punuTr8DMOrFwv4P+0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5458
X-Proofpoint-ORIG-GUID: J-J2EZ9oWJflH7w1IrPBylXQjn_f_NzG
X-Proofpoint-GUID: J-J2EZ9oWJflH7w1IrPBylXQjn_f_NzG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-01_09,2022-11-01_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 clxscore=1011 mlxlogscore=777 priorityscore=1501
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211010136
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 18:54:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172383

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/go/{go-1.19.2.inc => go-1.19.3.inc}   | 2 +-
 ...o-binary-native_1.19.2.bb => go-binary-native_1.19.3.bb} | 6 +++---
 ...cross-canadian_1.19.2.bb => go-cross-canadian_1.19.3.bb} | 0
 .../go/{go-cross_1.19.2.bb => go-cross_1.19.3.bb}           | 0
 .../go/{go-crosssdk_1.19.2.bb => go-crosssdk_1.19.3.bb}     | 0
 .../go/{go-native_1.19.2.bb => go-native_1.19.3.bb}         | 0
 .../go/{go-runtime_1.19.2.bb => go-runtime_1.19.3.bb}       | 0
 meta/recipes-devtools/go/{go_1.19.2.bb => go_1.19.3.bb}     | 0
 8 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.19.2.inc => go-1.19.3.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.19.2.bb => go-binary-native_1.19.3.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.19.2.bb => go-cross-canadian_1.19.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.19.2.bb => go-cross_1.19.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.19.2.bb => go-crosssdk_1.19.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.19.2.bb => go-native_1.19.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.19.2.bb => go-runtime_1.19.3.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.19.2.bb => go_1.19.3.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.19.2.inc b/meta/recipes-devtools/go/go-1.19.3.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.19.2.inc
rename to meta/recipes-devtools/go/go-1.19.3.inc
index 206ee3ca45..1245faba93 100644
--- a/meta/recipes-devtools/go/go-1.19.2.inc
+++ b/meta/recipes-devtools/go/go-1.19.3.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://filter-build-paths.patch \
 "
-SRC_URI[main.sha256sum] = "2ce930d70a931de660fdaf271d70192793b1b240272645bf0275779f6704df6b"
+SRC_URI[main.sha256sum] = "18ac263e39210bcf68d85f4370e97fb1734166995a1f63fb38b4f6e07d90d212"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.19.2.bb b/meta/recipes-devtools/go/go-binary-native_1.19.3.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.19.2.bb
rename to meta/recipes-devtools/go/go-binary-native_1.19.3.bb
index 65d7c9de49..1eed2cde41 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.19.2.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.19.3.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "5e8c5a74fe6470dd7e055a461acda8bb4050ead8c2df70f227e3ff7d8eb7eeb6"
-SRC_URI[go_linux_arm64.sha256sum] = "b62a8d9654436c67c14a0c91e931d50440541f09eb991a987536cb982903126d"
-SRC_URI[go_linux_ppc64le.sha256sum] = "37e1d4342f7103aeb9babeabe8c71ef3dba23db28db525071119e94b2aa21d7d"
+SRC_URI[go_linux_amd64.sha256sum] = "74b9640724fd4e6bb0ed2a1bc44ae813a03f1e72a4c76253e2d5c015494430ba"
+SRC_URI[go_linux_arm64.sha256sum] = "99de2fe112a52ab748fb175edea64b313a0c8d51d6157dba683a6be163fd5eab"
+SRC_URI[go_linux_ppc64le.sha256sum] = "741dad06e7b17fe2c9cd9586b4048cec087ca1f7a317389b14e89b26c25d3542"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.19.2.bb b/meta/recipes-devtools/go/go-cross-canadian_1.19.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.19.2.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.19.3.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.19.2.bb b/meta/recipes-devtools/go/go-cross_1.19.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.19.2.bb
rename to meta/recipes-devtools/go/go-cross_1.19.3.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.19.2.bb b/meta/recipes-devtools/go/go-crosssdk_1.19.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.19.2.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.19.3.bb
diff --git a/meta/recipes-devtools/go/go-native_1.19.2.bb b/meta/recipes-devtools/go/go-native_1.19.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.19.2.bb
rename to meta/recipes-devtools/go/go-native_1.19.3.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.19.2.bb b/meta/recipes-devtools/go/go-runtime_1.19.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.19.2.bb
rename to meta/recipes-devtools/go/go-runtime_1.19.3.bb
diff --git a/meta/recipes-devtools/go/go_1.19.2.bb b/meta/recipes-devtools/go/go_1.19.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.19.2.bb
rename to meta/recipes-devtools/go/go_1.19.3.bb
-- 
2.33.0


