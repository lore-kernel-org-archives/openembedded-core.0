Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EAB7C433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Jan 2022 20:13:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.14114.1641499988592850690
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jan 2022 12:13:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=fufZ+liC;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=8005714978=saul.wold@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 206JoZcm030046
	for <openembedded-core@lists.openembedded.org>; Thu, 6 Jan 2022 20:13:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=nykG7QR9eiNGPuCW2VtnWTr7B7xB+QterAjurQxlLkA=;
 b=fufZ+liC3E3wgGOpjdnRsQdYgdP9cr/OY3x4cq7RrNWXMbNwhdEwRYsVdcld6PTQNgeB
 dOG97oPjOQz3My9QiovLM33rovF8h9vS1rta3N9ktJmzbTF1TSb3Ulc7Md2bcx6+48OU
 eHxxN5QIKGhGadQpnMMFQ328Hb5I9rH11/xpAtuHq+7FK1xXQ8IhmkxRGWnsFvosWuvD
 3DgUFRTwTfFX/JSzfuxwO6NUJR/86fh6OoY2FMhCFnqDsnGHpia8VfeyGgBPV52II1C0
 7P7BoS6Oc5DSGe7+z9k9maUzmVTWcK1B85rsZCioVCEG/FOns+CFka+EkQV6tkBIYO6Z sA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3de4wc03f1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jan 2022 20:13:07 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 206KD73a017930
	for <openembedded-core@lists.openembedded.org>; Thu, 6 Jan 2022 20:13:07 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3de4wc03ey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jan 2022 20:13:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WXfaqtWJi6C26xery7inXwJxQGZlcqfi8whTquxwnuL//weulfYD86alz3q2kOL4KWI/7sYKjpqW0M7xRl16DTqVKpEuSQddu89gOGZsVX2yvpzScNVWu+x5TOPJ0cY71JXwFaajJxdWXkv2galEwz6jf3KMErc/+PiYkYPNr+Sq33+hJ1L0UHOVCcH14ewxqHTAnQbxwwX4KXYToKk9SOXAFQMugObADwiMCiyyrmI878NKrMiTG+CgfQkqTu3j+ZNr0rCNad2UZZp8yDLI6UJeKSnBKz5Oa1UxSA59uHqSYgNzEhh/Afp4jDwI875hkqvM4E6hJZCVEz1dpVwAiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nykG7QR9eiNGPuCW2VtnWTr7B7xB+QterAjurQxlLkA=;
 b=kVMdNB79YADxmPxpWxZYo/z1LWjgflpLz4z0Aeow7snWfXNONyq6sgrBQhM88e2OrOGXxprDbiOUO5BtJ2dVeGai8uyicXhlB4Gu426Z+itWrLZyx9f+cgnX7W7JPV8vhtOM1wX2PcDoal+HdTIhNqjQO3PTjlPembRxVhVnH6f3ph/E9w+VJxMkfktqICSgxlV2aRDLe/q42665BUCgu48oQ6hwI2p0dmNZtpuLOlBpWLreulALsDOi0HJdy2HoaWv00vUAw9JKBrHqg1MszwcGkMvVjDbYJ2CZN4lG4D26nEkzJDKsB1DpwSdh2xlr8EC7KK3mCgxDBrC+vQ66dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5085.namprd11.prod.outlook.com (2603:10b6:a03:2db::10)
 by BYAPR11MB2903.namprd11.prod.outlook.com (2603:10b6:a03:89::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Thu, 6 Jan
 2022 20:12:53 +0000
Received: from SJ0PR11MB5085.namprd11.prod.outlook.com
 ([fe80::7c04:e33d:9d46:f854]) by SJ0PR11MB5085.namprd11.prod.outlook.com
 ([fe80::7c04:e33d:9d46:f854%3]) with mapi id 15.20.4867.009; Thu, 6 Jan 2022
 20:12:52 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org, raj.khem@gmail.com
Cc: Saul Wold <Saul.Wold@windriver.com>, Saul Wold <saul.wold@windriver.com>
Subject: [PATCH v2] perl: Enable threading
Date: Thu,  6 Jan 2022 12:12:34 -0800
Message-Id: <20220106201234.159792-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0231.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::26) To SJ0PR11MB5085.namprd11.prod.outlook.com
 (2603:10b6:a03:2db::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da3fdaee-38b1-4008-f9f2-08d9d150ea78
X-MS-TrafficTypeDiagnostic: BYAPR11MB2903:EE_
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB29038343602C9853D3D38802EE4C9@BYAPR11MB2903.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bpw4oNIGeJ2MJUm0j797cSo1c0fHd7IZkGiHW2+XqCEtEzktCet/nqBNHYO2EAMIhRQQXHP0HmDl3QSIiuJe1tx/vu/mG9r1VaKPTYOfs9k1lyDaz8Xd9TqV1UR3ROpDOihfcJ96rKi0pJ3UgAnm/ci7N2/7jGEfeyAqJPBXm1Xb1aOOel061pL8Qn0p3ViED3D8FpM5YhbppRUXLp3Um8Y/PnWBi/mQTNr34cmvJ+7LqHet5RfQ7wfMkB9Q8V+W0O7hBa3CJoMVqnbivM2Xx4GClF8RFpft8aIq1igFmiJzGku3CBkxMJd2vsQuyqWvbmOOKZZ4sT8NlATYqd9xOVxDxSv2DWK/AOP1LOLNZLIM4KXIx1Ixis1pnmKdviKKYWPfHfuJ052Rb9+ldWSKM6Zwqm/ZgzXsTSbiMvUXa1vwljDQUtnrYDr2N9ZUj1uxqzbJ6fEsounXouhCFAZ/6CY/V00KN44wIxBLSCYsfIDtzw3kBe0iy+GsglAEoUa2uRwLdDqU0o3vKJMA4pWIdvmRhVHrGWKL77GrtnyN1r1ALUystyW5JH7y/lAdaucSMWZ1e0ftpIEygV3oomdFsAbxUFFheYgPWnXGl4Lh3HYQOiN8oKZXAzeYmiN6p0tQNaz9sTl9TN7Gvwz7bE1TVQgeYHMzFNWT6xIxZn5n1ovqTcHDH/OwYZbIWvdbiIoJ+OkNb2GNawFGZjtO6pXMxEzGGv8uQXmtuZ4YVCgjSk61UtIGk42GAt/bkGs7TvZfbEtlgiRbuIsvy+1cR9abMXNiyJpKN3AbqLgyJtEKKao=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5085.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(26005)(508600001)(966005)(107886003)(6666004)(8936002)(5660300002)(83380400001)(36756003)(6486002)(8676002)(54906003)(66946007)(6506007)(6512007)(66556008)(2906002)(66476007)(1076003)(316002)(52116002)(86362001)(38100700002)(186003)(38350700002)(44832011)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JSGPD7mx/labrFSDYOgoMFXLQGgDETqUeAsUGl/5eBzaP/EYK9DBoaSiVjbI?=
 =?us-ascii?Q?P6axWe6Ns4PQXDLG1AAxWWlq60joX28MkZ6OLRIhmM2qnpG59EbUQjO3eB3z?=
 =?us-ascii?Q?ABwOUy7FomZbCcEqpk8bGZqG31eaBHmxxXaogpQJi9/oVtDiWH7K0nbsTnm3?=
 =?us-ascii?Q?vCOJyi8Djc5PxMEsEClVIOBuwJHGr0UZFb2sCJFPJTW0YFl39mRPGU3mTuF2?=
 =?us-ascii?Q?D75NStZPAUnw/Nj8YuxeAew39n04cEnTngpEAZr6ICmdxaFzr1pyq3+FDdam?=
 =?us-ascii?Q?mHJHFeuSwl61Ys8BjbE55X6PDrz5pdtmd0JWD3YXLq99A9MOlK0Qj+202IrK?=
 =?us-ascii?Q?IFgrTw8qsbYfaZJwLubl0F4mS7iztGwZSJv2F0Z8xiO1pQwl5trkl+Q7Qy+p?=
 =?us-ascii?Q?300fQhBphaf2rTy8gOAHj5+lc0wg5Y339lo7MmnUQN52kumKgcGExCAMWEeH?=
 =?us-ascii?Q?Tvoarkb6PTPTPxgrAgg/0akmNLLLBPwz039cICwFD7sLR+gdpsYqebOxLpKb?=
 =?us-ascii?Q?0sFWI0uUJ07JaQBsVIkr8i3xaaGcWlyr8kKv/vNaDcA2Mj2eHGBGFncBbsSb?=
 =?us-ascii?Q?UoKjtiIAv6vwYMwdQMhT7rO7HO9G0aEnZZYhJ6abkqH1/609SBjDgYFlvSLr?=
 =?us-ascii?Q?tK2HOUsPYM30JntLfU1fqqplDcT/1UAAkBm5Na6jBXhbBsHGSfs94sh6dxvT?=
 =?us-ascii?Q?cA3lguwNW3HbtOnPHGrxntzBfjFuTMv3m7shUwDXn7i6ELn7YxtL1acjDgzy?=
 =?us-ascii?Q?OHHlMFhmPSOqfrYaqu6xG0lBFXrBSv3Fg8m4Myp2NvdZoI09kPDTzbZP0FbY?=
 =?us-ascii?Q?Lex+O7sOrp2C7OSx/5RwIr9P0tzTK0gp9FJF3UKyyYq5+0N1LiV59UDwyEMu?=
 =?us-ascii?Q?ZEexSDQuluQW/Xc2li0QjMeeBSej1Ln2E2qg2JPEPHeZ9lZ4k5TW6TD7wK/W?=
 =?us-ascii?Q?2A1wXuZHLWp4dK+7EdqtpW9dIDlgjFjrYYenWrFYU614320/qWuxUWaNhEJJ?=
 =?us-ascii?Q?0WeysXQf0adHECvjmTnRGbXTre3cOLcG84JPPleyxuzooq72LviUtmPU/tQr?=
 =?us-ascii?Q?Mx814vlsop5Xu7bI+TdVOM+tEmpNI1JZWS2XmUoHXx/5BP+93jvbpAauW/68?=
 =?us-ascii?Q?H0hLpVvbq78qMRFEZVTR/HSziiOWlXDM2AuKIs2hEDZ98O+i9SxNLSggVYr9?=
 =?us-ascii?Q?yUh+yv5qEcx6d+MG40L4Ry71vVQyOWt88mqXbnVBZl7jCVH4DgGCnODsnd6Y?=
 =?us-ascii?Q?Q7aZbhGrD3obFjf/lR8PgELiuvW1uZGtLfTVLq1Wzbk2fgnEQpbuhOU5d+FI?=
 =?us-ascii?Q?e2UlSmR1gaP2tPz0D1cxvUSFZds6AkDv2Gzjda/NMYc6WcSmLObveUGy7xZx?=
 =?us-ascii?Q?z0Z8OYIblinvbKneqahEQYly11/Gi/iXHUw2H4hMi/YcbydEqcbM7/in66+p?=
 =?us-ascii?Q?pYFQEY5SnM1hjJL5hzF+UfjUp3U9JKbTcvgZ/hWqogMgDfufiSma28CM5PGu?=
 =?us-ascii?Q?QxlOjGyPyUA5DvoOqRiZ5f7daqXXLJ8TASA3gKmhDwzUUz5mDjwHr9UbQWER?=
 =?us-ascii?Q?62kuJlItb6U7mF7PNyTLgxC1pmHKFHdOD+plfveHWfOmVzkXGlSV11sPhiVP?=
 =?us-ascii?Q?CagWm7WqDFBVceOhe4Fd3MI=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 da3fdaee-38b1-4008-f9f2-08d9d150ea78
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5085.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2022 20:12:51.8359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 4+PVGORkmMkLo2PDM67kbuI9gOMw/pR1adHDPIW/mRy9MyTysonNxPX1XndRAOcq6YOwJEZlOdJAAJ5g2FavMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2903
X-Proofpoint-GUID: Ds7VcpjKmuNxnM4Loe6zM_L_brHB1KWy
X-Proofpoint-ORIG-GUID: ux6nZ6ap2ieDoJSfA-ZGK7rH-90F-Up3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-06_08,2022-01-06_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 mlxlogscore=941 mlxscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201060128
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jan 2022 20:13:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160244

From: Saul Wold <Saul.Wold@windriver.com>

When the tranisiton to perl-cross occured, the threading define
seems to have been missed.  The perl tests for threading where
simply skipped, so there was no direct failures.  This was verified
by running perl ptest before and after the change to see PASS vs SKIP
results of threaded related tests.

NOTE: Perl officially discourges the use of threads, so this
functionality maybe depercated in the future [0][1]

v2: adds the usethreads to native and nativesdk. This was tested by
builing postresql and rrdtool which use perl and automake.

[0] https://perldoc.perl.org/5.34.0-RC2/threads#WARNING
[1] https://perldoc.perl.org/perlpolicy#discouraged

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/recipes-devtools/perl/perl_5.34.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/perl/perl_5.34.0.bb b/meta/recipes-devtools/perl/perl_5.34.0.bb
index a6ae80f07e1..e4bcfe3ce69 100644
--- a/meta/recipes-devtools/perl/perl_5.34.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.34.0.bb
@@ -53,6 +53,7 @@ do_configure:class-target() {
     ./configure --prefix=${prefix} --libdir=${libdir} \
     --target=${TARGET_SYS} \
     -Duseshrplib \
+    -Dusethreads \
     -Dsoname=libperl.so.5 \
     -Dvendorprefix=${prefix} \
     -Darchlibexp=${STAGING_LIBDIR}/perl5/${PV}/${TARGET_ARCH}-linux \
@@ -80,6 +81,7 @@ do_configure:class-nativesdk() {
     ./configure --prefix=${prefix} \
     --target=${TARGET_SYS} \
     -Duseshrplib \
+    -Dusethreads \
     -Dsoname=libperl.so.5 \
     -Dvendorprefix=${prefix} \
     -Darchlibexp=${STAGING_LIBDIR}/perl5/${PV}/${TARGET_ARCH}-linux \
@@ -94,6 +96,7 @@ do_configure:class-native() {
     ./configure --prefix=${prefix} \
     -Dbin=${bindir}/perl-native \
     -Duseshrplib \
+    -Dusethreads \
     -Dsoname=libperl.so.5 \
     -Dvendorprefix=${prefix} \
     -Ui_xlocale \
-- 
2.31.1


