Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E66BC3DA78
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 04:06:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.188968.1673928409247706430
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 20:06:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ca9QxKhR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0381132260=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30H3kjaC008746
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 20:06:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=yaxG/0vNcZuOy5f14LCA2iuu5exCx3kbSOgjPApqXdE=;
 b=ca9QxKhRX+hJtYmiofab1swhsbtdcrbEBlolVcif635A0XokB5kBgypyKwMbCBK4Cs5Y
 ezKyL3DwMfBFUO7DTlJ1T0Rs7sDTR105/kkRHgGRQQv6yqjY5RMafCnCjFDZrIjVNIQb
 hkaX4XRknsG5VHvzQorcmGAYR4xggqOg3EaGno24TLGkur7BTKaZ02qpJtEpgJaI5oZd
 iP8t1BlyrZic2T1sB+fJJdJELdFbmVlM2O8+zrU+TeoIBS1W81OpzXh9kjH2XQOvG6HN
 j8POVmaoHBSLK8UY9vmgk6J4MF8fh/No1DX6t6EGJVRlI+sBIBNPL0fq/zJlKhJo9cwN CQ== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3vsqa5af-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 20:06:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fljl01Ic+6pZOqt2CVFDtJxD8tnLsrN2Wa+tMWvXgODTTl8w1xvaPel0sDt/42pP/DGxAGDdI79KGLp8DKSioiIquFWsTsZRLiKjmgk1nG/b3K/tvBbucToG8tYzjZcW4Ewj0vjWTTGIePwOfPi7qgNmxAC9shdKktug48hh6MfKMyoxw53IwDE3yazM0cJ8hVX31BDXGaSW/NEfX1qdM/vKI9oCSSOxCR2t6PU5jv1Y/Gdwh2XJp1KVLycUN+qQXEmmTW9+T0GqJrQR6xSsopsvEUeJZdbrJUD7PfKBfuefLUvRWQpaTCxiqX/R2KC6fTvS3rwjieQwQv7y+cWT3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yaxG/0vNcZuOy5f14LCA2iuu5exCx3kbSOgjPApqXdE=;
 b=PUd32BIVUpqRrQoQcnZU9eOeMg4do6weta3OuFOQThnfh/HYO40r7/qv29Pew/+GV64DsLu7mmHe/fSkglWsXeswZHRdT16bZoe9guEoEHuKVrwxN46GrnuhAnhROn5nkSz4CwJiyf0NPooswB5ti2tHAYeGekpKzRJg7h1QHMy770+tFZI6hlQhoqssuF0efjP/jftrLFMA+jcebGkAM1cWg5TJRkmA4G0lVf5eNdz6ndX4WWK4GkwpUtQSz8Q56eOPDyesBU0Cn2JWfp4bWRPhJr/cIP5USgyveEphe4DJjA9L/8vl8OAu7Uwyxi/+lzadjXxhmZ6kMjqtuEB4Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SN7PR11MB7043.namprd11.prod.outlook.com (2603:10b6:806:29a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 04:06:46 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::3b28:4c3d:1225:fff7]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::3b28:4c3d:1225:fff7%9]) with mapi id 15.20.6002.013; Tue, 17 Jan 2023
 04:06:46 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/2] file: export MAGIC in SDK
Date: Tue, 17 Jan 2023 12:06:30 +0800
Message-Id: <20230117040631.34966-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0022.namprd08.prod.outlook.com
 (2603:10b6:a03:100::35) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SN7PR11MB7043:EE_
X-MS-Office365-Filtering-Correlation-Id: 794cbf84-d9f4-4918-cd5b-08daf840401f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	68i+04/Y6qtNdTcvICeQ4Cg/o5gqEh2hk3NxZEiF75yfxi8R46hLBD23hYSsX+iXemEbA8AqZ7C3piHRWrit0Slejq7THcaw0a0SaCKfmIxf54SzY7Z+dfXYkwS36O66DiXnVoAY5ddA0yaK+OTe/bXq8fMSLAyaqUAmmGH8qF7v10BjdyLGe6FjkoJjAvyeY76o5kRJ5qFEhIzz3GSCT/GeCYMJIr1mQCda16U/hZqSltyWBlAtCAx8DT267Kk6Ebyf0auj79V93Ois0nTaXwAFGYY3J/oUhw4WbAiITeKgBmoVcg0uMaX1w0esIgu+u0iLZKpD2kVWB5QmN5o7d7l0LiXP+ducTfqnkzqUIUGdgQ6bNJR0I9cfqCnX4al7LZdsPyM7bueHp/mp5NV2tPUt64yd6zoTu7boWaij4GbA5pE4aEq01e3QuIMBT73sqMQLeSbbOZGIrm+YTuWSxoXct2uowHO6HFeOOOjmMoM1dT28YCiJbgkQxwOZHvCVy6BjG9ebmPU+LOQG0nTsVZrtY1+2wf8OtgqPQ7izRGlxDS0h8vc8dcJubejWm1mA/c6PZbzav1X++yC/M7HPmUKelRpcr6RyirO2CmCMBuB4rFODB/XJrkhhZoWKOA100QNwSnqfYqiJy1erfc+7dOGrY6i6OgeuikwzPDjeGUXYepV6wjr7TbwhlcZUTQI08SCLL8tlvq7PvHes94wdcA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(396003)(39850400004)(376002)(366004)(451199015)(1076003)(2616005)(52116002)(316002)(6506007)(8936002)(8676002)(6916009)(66556008)(66476007)(83380400001)(41300700001)(5660300002)(6666004)(2906002)(66946007)(38350700002)(38100700002)(6486002)(36756003)(6512007)(26005)(478600001)(186003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Cb7CF1tYXJRLJu5zMU3v4w2/LZbSDlu2DXgl43qsMSmX7AP+ltP1MHgH+Rli?=
 =?us-ascii?Q?wRMacByNR59qyvBHsAaP2QKyRbk27MQN1ckXOx9Ocmg2o/grShNW+WXgqPB9?=
 =?us-ascii?Q?VK5M3IU/gArEr8l2uVvAwMPTBG9xzpZiwDK18C9p6elazsg/lD9RgzpiYM/7?=
 =?us-ascii?Q?F7lqgOKInWCd5j6UX3s+64vmObrjX3C2aifKq1NXDWbty3Zlu66BN80LBo98?=
 =?us-ascii?Q?YCvZkZv1Ojd5Pj/KzlkmM7Vgthh0HzPdNYV1e77KPj4QPOzxoS8Df0eUDQG+?=
 =?us-ascii?Q?yvXn01anVDPtrinsQ9bIp2eRscUNaSc64w2Rx/zrEfGNNa8guR4ofgOSP9la?=
 =?us-ascii?Q?HHgEhTAhtjS15ZXo7dfH+ZTSfsTwGLKP6ivzmg8pTLCPY7P694h1QM+dXTZl?=
 =?us-ascii?Q?T6TRn6C3LqEYE0iJiYyj0WpjP4cQjYFJDaktm+RRDU9eafc0lp2tbf9fVnZX?=
 =?us-ascii?Q?Tdb/D+Or+RP+Lj7sz1husGRRVW80mQvNcTd8iZHV6ac1D606PqkdMFEoXHdO?=
 =?us-ascii?Q?LwWJsEuWPP+aMck7n4BewqZZG4atKc/0rGCNKH7d9xueZKtBqAnzGPYN3H+X?=
 =?us-ascii?Q?AhGpmYoj2FCHg8QeFkufRgluXB/AqAo0p2nznIO5XsnrwKQ/g57jHRLJUE8c?=
 =?us-ascii?Q?fQtRp6r+2kw4q1P7FFwkWNnjmqjWAwS6c4xJjuFWuUYXQ8oStGWIBLgGbm2q?=
 =?us-ascii?Q?QCxDJS0tHqG3wizsjkaGwEYJdHkBPALiUAP1kiXd0iVDhAgCiI4/ZBxyxu90?=
 =?us-ascii?Q?pEhQ2Rk4uHvNmo7lN8CucuvlHGD4Ne2xX5oRZgRHrrDvhexfbeCPsEF5vAb6?=
 =?us-ascii?Q?0+ttOanqsSqm35SAwSfp8YPSrO+l5LrSliqetIybCBTKRMIpmxy+bO5NWiJs?=
 =?us-ascii?Q?d7E4Fc0Jh4Tpw0bod6Q65IP2HU9Pbx/TqSeT9JqUoywxWHdQBWcE1WedvVJk?=
 =?us-ascii?Q?2xUHoxCuTwYPTlTJF+wYX6gBhr4SECwrx5K4IDEkC9wPf/yxvS47hcbqHPXb?=
 =?us-ascii?Q?3gHva2fE/maMSSXyAhAFvZGv2ne74Ibk7hwtbDHq4qvo7Xgf0WlPiM8MAEu6?=
 =?us-ascii?Q?3qEeerUnh7yvmP5MmU3pP00Ne/sQJzoKAgqUomiucW7Wu91g9FjGsGEpVUhh?=
 =?us-ascii?Q?zcnEZCEY8ZPLoJ0jd9Qs7tC4gqnwfdeeEwBvY8Anpf26mBAhd6Jdpfjwg1g3?=
 =?us-ascii?Q?QfvmhYGpwK6rc5evyxEA8CmSvRqFT8tp/fCzET0hyCqWHKJLu3VhkU16ldIE?=
 =?us-ascii?Q?RjcJDliCTlGcoIipwjBOyUYnKCog9IBHikjHJyhK1FqP18UYisRm5J/UV2XH?=
 =?us-ascii?Q?e2oEWIYZspcHqOv40tJBseQJMCAqu2Hol01MhJs+r68SXfnaE387w4Lt1L39?=
 =?us-ascii?Q?ujkzG480qIs5DR9jW6itQ8dpbKFmOTMGI+1khy0YLoPOJEQuBY0H77FYOQg3?=
 =?us-ascii?Q?Dj++GWHzzju58L79Lcq7lDvRE1hYxN7LYVpQRCDfVqxLreDvm0WPrPzZq9GY?=
 =?us-ascii?Q?tKTFMUIn0gc8iOchttVNvIyIQWr7WtZpx9iHOsMQqzNORvtXba0NbEUYJ/WM?=
 =?us-ascii?Q?QNlLYmLJjaCVv+91UYeMeE5d6bxQMcacPCgvFpE7w5Hj+RsMR/jw4gWEGIZB?=
 =?us-ascii?Q?cA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 794cbf84-d9f4-4918-cd5b-08daf840401f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 04:06:46.6891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XwvCzaImnxJVAoTy/YVa3WJ1flQfHzHkNCqbVKifq8R6cmXdZpWf9Khw33UqBIO16KuxfgNZoELNzxxD30tP1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7043
X-Proofpoint-GUID: iT_AW9v6sgQRtJt3xDL7AhH2zQ7w3qag
X-Proofpoint-ORIG-GUID: iT_AW9v6sgQRtJt3xDL7AhH2zQ7w3qag
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-17_01,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxlogscore=717 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301170031
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 04:06:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176027

Previously, a wrapper is used for file, which adds '--magic-file'
option to it. But other components might use libmagic and in such
case, if there's no MAGIC environent variable set correctly, things
do not work. For example, rpmbuild makes use of libmagic and it
requries MAGIC to be set correctly.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/file/file_5.44.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/file/file_5.44.bb b/meta/recipes-devtools/file/file_5.44.bb
index b3d821518a..d4b49341b7 100644
--- a/meta/recipes-devtools/file/file_5.44.bb
+++ b/meta/recipes-devtools/file/file_5.44.bb
@@ -32,6 +32,7 @@ EXTRA_OEMAKE:append:class-target = " -e FILE_COMPILE=${STAGING_BINDIR_NATIVE}/fi
 EXTRA_OEMAKE:append:class-nativesdk = " -e FILE_COMPILE=${STAGING_BINDIR_NATIVE}/file-native/file"
 
 FILES:${PN} += "${datadir}/misc/*.mgc"
+FILES:${PN}:append:class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/file.sh"
 
 do_compile:append:class-native() {
 	oe_runmake check
@@ -43,8 +44,10 @@ do_install:append:class-native() {
 }
 
 do_install:append:class-nativesdk() {
-	create_cmdline_wrapper ${D}/${bindir}/file \
-		--magic-file ${datadir}/misc/magic.mgc
+	mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
+	cat <<- EOF > ${D}${SDKPATHNATIVE}/environment-setup.d/file.sh
+		export MAGIC="$OECORE_NATIVE_SYSROOT${datadir}/misc/magic.mgc"
+	EOF
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


