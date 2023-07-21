Return-Path: <ovidiu.panait@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2B72C001DC
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 10:58:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4649.1689937132274114776
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jul 2023 03:58:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=FR/qKcYd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6566990a09=ovidiu.panait@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36LAr1b2005472
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 10:58:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=kmikbwvqicwoMzt4yz
	IUx9+/TKfMJPFLukoFwVVRWN0=; b=FR/qKcYdWDERni4sBvCtzsdNm9q91xKsPw
	ZswjeY33EZfOKruv/l5hr8vRKH8vq0FZlp8J1BhDK/0ykiGZz3B2Z5Uf4yTuH0WE
	DFZ+lwmifhdt7Nb8yAokTzHwKrj9WQeOzF6+7LZ7vAXOgUZ9VCTKrKlQ+6zCVl1X
	Q065YRVulEXYX7EObP2VUW41wf2gpmSy7SFzZ8sZkaZ5y/sYkTQKGwDkhMBUWwDM
	bz+t12A4TEgUg4tlRdQ2hv8jpPZl6CV0rKFE4ZQ9EuGF4KxBPSEvF/dgkI41NDiv
	odnwGOHrA98gLvAC1Dst/dBf0ybHBt8MkdEFxmoKKBLtuILOVshQ==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3run9jwjn8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 10:58:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LES9NE6gRHWTM5eGaj4orLHQi/JKR7DWPTCS8k4uY8Zff9G4zmto+DpU0m1bTI6M1YzjbDLKWEarGPwJHBFsS3DhYTJIaaiDy4wxOOaNuFuWMiB9z6xuo+zCdqpLb5p2s0JeWoIZt3fkdAnnWhDgt4ymNvkkV2V66eucm53t7d+n66IU7hP5U98xDHF1PmkwkHfBnTgogJK/NB8jRc2X4OKZ8L///5+Xhv2QZp4eAY7JSNga+5glP6Ad9oo444wjCgQmKuBnWUNv7wx0YPJgLtzdl+f2XhbiQJElGDKffquD7CxbUq3l4U9rMlRq43ApwvKwhf2U4GJul1YSxEyoxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kmikbwvqicwoMzt4yzIUx9+/TKfMJPFLukoFwVVRWN0=;
 b=HzHrjdH1Lusav+qJpn6b2jRneVc1rxeWob6oTF79cOoFwBlDqOih/cbORV9Sa3QRyjlxfdn+Z9WPwaX3yoBx9Hibevk1rXHgc3Ex1hPcni4nPxguYLL/JRM+HH993u1IPjwjkxgFeUwNjWZsPCy8+nAhJ5EBOVuQLymG9SVIYVQ8S5IJaeGJlo203+MIz7qTWCS9cbmpRHHNRF3oshFJJ86ihF2En9y+0geuqL3O7dWYF77DidehS8sg4DyOUsJHe0HaIq/8dnp5Dz4Ywr23hdW+hg/jhDmnF02SuMfsCiy9PbLMQtr/VWK3XPROKDIAlk1WZ44eNK9HKzyb4PPnEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5327.namprd11.prod.outlook.com (2603:10b6:5:392::22)
 by CH0PR11MB8143.namprd11.prod.outlook.com (2603:10b6:610:193::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Fri, 21 Jul
 2023 10:58:46 +0000
Received: from DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::1f8b:45ed:dd21:9c99]) by DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::1f8b:45ed:dd21:9c99%7]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 10:58:46 +0000
From: ovidiu.panait@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] mdadm: add util-linux-blockdev ptest dependency
Date: Fri, 21 Jul 2023 13:58:27 +0300
Message-Id: <20230721105827.1637688-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.39.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P190CA0034.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::47) To DM4PR11MB5327.namprd11.prod.outlook.com
 (2603:10b6:5:392::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5327:EE_|CH0PR11MB8143:EE_
X-MS-Office365-Filtering-Correlation-Id: bb3a1a97-2727-4923-bd99-08db89d97476
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rUY4afAijgCi5x+1a3teVE1pnITgz+dsAyiGY+4h4ZtJQnCzBs1SpZ15kvc8SzrKSPk7XJreHkdOUm+XJBT4VqnU2VW1ABRmznmN8erAPGMpYodm8JeBilCkBnv6GLdPx8NN+O2XIKUxwmx55KeUdACDllRlBd0Wej8XASv/hDJo/uQbCpsmhD1ky+u1dl7FTqjuitMV+w1zBrahdNolxzGv0EdDZ842tKfmvkjFmXyi0L4Msx0etUiTFGIewl3fQdOLayfzNSYISu0RM+HnIes6lOB68eepNQ5Uzhz5JpkDxLJHTlim0ct7zb2UxzzsRDm8ol/LzaY+S4dTXqAstHDd34r3ea3/7SjqaJm02uE5XBmnXal+f9A5q9zktUoDZf2x0e3VGXhivdP0EQ+23j1hq2RV3CA+azkd6ejn+bcEunILw1pZE1TrFt4ErdTk7G0me1YZEr8Y1M6Ktl18GkAFY6BqjcrIT/KiFUCqJ7wXEIAU8eIZAKaQ8/5xiznO1XBMeHun+U0DFEEmMKd2rDkaQAu1Hwr2mFOeqRkBZ9+Gm5R6T/jJ9KkIf7kJKFTfI5vf+7GeL8BDFoI5rgkhLGH/XQI7c0XLuaJWVW3nU3A9INFN9PBv6ECLEVNMjid3
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5327.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(39850400004)(376002)(136003)(346002)(451199021)(86362001)(36756003)(6666004)(66556008)(66946007)(478600001)(66476007)(6916009)(6486002)(52116002)(1076003)(6506007)(26005)(6512007)(8676002)(9686003)(41300700001)(8936002)(5660300002)(2906002)(4744005)(316002)(38350700002)(38100700002)(83380400001)(2616005)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HraBSWCHOmk3av4wkbEh9qHCkZjrruZp4gn4xLzZaeh2pxVOxFvokCY1e+c+?=
 =?us-ascii?Q?CVzQBLD+WUiqqd4bijcgre8NK5mQqUiv3xMV1KlOZ+o8LO3oEb6thW3vg2nQ?=
 =?us-ascii?Q?FQ1KxYGvOw3MaoqPGvx9GW0Fc8Mmd9n+5uTPNC4eW37vw/zi512OcRDR/2ql?=
 =?us-ascii?Q?0JvfDx7uhRmRt+nSs9ESltq588IBrgTszz1UA5EWfLNyP5Gd0bmXlI36eaG5?=
 =?us-ascii?Q?/F6V+wqONt0nNhw2Kn+7vwLuxZYY56evyNU7hCaDklT//DNk2KyfvP76OkV1?=
 =?us-ascii?Q?MBJrOOwyjl/pbfH9LByhmngxcA4UrWxX0g7rd58HnfPOX7rLGy/aWad6dmih?=
 =?us-ascii?Q?sZGmxxagjWob7F8I3O5WFgl262yW55GPhrSHPbOwlm2+A7Z3UnpY6SwAm5kH?=
 =?us-ascii?Q?XszTQzDEgU/RYOPKMC6SXa2tBIv2bFGjm9/utGO1kAyAkdQLuhhv5Erz+Cjc?=
 =?us-ascii?Q?vXcp8E1aLezuA1Mm0YeKz+lwbhE4IXUqZcPQcFTV3FsItweTy7QCkXUs6Whi?=
 =?us-ascii?Q?9Oc2kb9bHz/51x09/jpGTT47Qq+G+GMFpVhqi4e1qIRN1Vyjs68/dKshYhJ6?=
 =?us-ascii?Q?rIsWaOdX85xVuomSh7SjyHJJsI5cePcwn+RCLPOD5nkVhGrvVxGAJErTH18H?=
 =?us-ascii?Q?YWr88xY71AVB7q88TxCv17ArsUb3oKHiXPdirKxh+NZ/I5f9FY0s6Cmid/+h?=
 =?us-ascii?Q?JPh3dLQdRqaFnfad64YWP94coMWHt9dhopnMWnw0cMtG9yXHzecULmwe/7zI?=
 =?us-ascii?Q?/5rFMkUy8u9pazhGqHwyi5Sm+nKfPErA1/ilIFIXBglvuxX/+RcfBNoiwhBe?=
 =?us-ascii?Q?xqglGZn+e1XjJvqx2ffyML8Eco50TXeJE3yNGjGzV7sVUqpBizsQxrousaU3?=
 =?us-ascii?Q?MhOPtOmNuFPNt9OWZgkY2Twmn1BUcKbAgBRID9tRH8dECdh2zxETQXC2JBeS?=
 =?us-ascii?Q?p/dHux8RLup72rMHDSElkCPrN4KZ8dWg75wL2gzKFTro4nBs3EgGNxqEelmk?=
 =?us-ascii?Q?K2iUEBA7pDBjMS/GJp+ADi1RpiF5RaK1uoKCOYhY6O52bFVUr7qZZjkkRSrH?=
 =?us-ascii?Q?bTNv9CPTGl7yetVsJTfv0c3qcgb6WmB+K/v+gR9axBwFeSmaRFdNah4IPspu?=
 =?us-ascii?Q?zJUQXNRZJCFB7oNSja1BCyTChlxeCHHz1VsmecDUHEdt90Owf4birXzHg5DR?=
 =?us-ascii?Q?KGyYwuW0tN03LPiIwOKfOiOP7T86ig8+yp9ny1WIXkYa5YYapUNCYaYMxJ50?=
 =?us-ascii?Q?Jph64unZ0fZrJnwCgh77rLvQWdibhmCOI8Vw5N6lXRf+D+ljH0a/yla+LRw5?=
 =?us-ascii?Q?qZV8iI3pwWMwC4Q7PoiZbavzH8/0f3RXAmT7S8f7JDHsgtfADGLysOqdQKYs?=
 =?us-ascii?Q?rs8sR6TfwFsKuDw0lxghEj9yRatKVu9EO1fcXgpHUrJxkaLydAG+8SMJeZSR?=
 =?us-ascii?Q?QFNVwbEL5kECjfIx58ksiqd0utoJiTkIvwiD6AkkcC2cqGdz2ytt1TYNI73+?=
 =?us-ascii?Q?fd66aRprNMG33vZkvyEsKZktI+XOvbw+uc2jmmiwXBIJibagPC5h5PpSWagd?=
 =?us-ascii?Q?yYR9t0ScK+q0anG5P5D5O0W/8vrCZCYlHFr2SHoWbefLyMlLDiG6ECDUMOGO?=
 =?us-ascii?Q?fg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb3a1a97-2727-4923-bd99-08db89d97476
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5327.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 10:58:46.1093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7EWfhoPXRU0K2+we++lWAGLhVbzffUngeTMRWZiMzlKZLrUvVFOvCBw0y5/GQe25xOXS7r6CqkyWES9qWL9I7AZmUO5V8nRC5EzAhx87+ww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8143
X-Proofpoint-GUID: ZQhrQr2-BvtvprLwERtKIoI3JR7zLAcV
X-Proofpoint-ORIG-GUID: ZQhrQr2-BvtvprLwERtKIoI3JR7zLAcV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-21_06,2023-07-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 mlxlogscore=502 phishscore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2307210098
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 10:58:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184682

From: Ovidiu Panait <ovidiu.panait@windriver.com>

07revert-inplace test logs contain the following:
func.sh: line 335: /sbin/blockdev: No such file or directory

Add the missing util-linux-blockdev dependency.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 meta/recipes-extended/mdadm/mdadm_4.2.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
index 50d9548747..fa50325f1f 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
@@ -107,7 +107,14 @@ do_install_ptest() {
 }
 
 RDEPENDS:${PN} += "bash"
-RDEPENDS:${PN}-ptest += "bash e2fsprogs-mke2fs util-linux-lsblk util-linux-losetup strace"
+RDEPENDS:${PN}-ptest += " \
+    bash \
+    e2fsprogs-mke2fs \
+    util-linux-lsblk \
+    util-linux-losetup \
+    util-linux-blockdev \
+    strace \
+"
 RRECOMMENDS:${PN}-ptest += " \
     coreutils \
     kernel-module-loop \
-- 
2.39.1


