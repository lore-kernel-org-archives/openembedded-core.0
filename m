Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D340C433EF
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 05:56:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.3616.1653458168863576659
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 22:56:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=F3oORMlD;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=21448a263a=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 24P5u8GT029752
	for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 22:56:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=+OOJcK5m/Jw4CFCPltegbhdqs8mGOo3qcHqkz+xZMjM=;
 b=F3oORMlD7MC3gvMyAPDVqbhbQk0W46bM+XfLNUF6QGKJp02fG9hToY8rAtfxeaFtn8z9
 iyL99XyrrXm9hRrvDM5CCWbF5NkUOUrDMYMbgDJEipwODqh/zIXGySjGPUZERHDVg+pW
 c5JFNxbcL+Y7p9LLZ9Wcc9I2v64t4jDe7kFMXyZbBXJbatbC8o2JC2CMG8ZFrZsE4Cpq
 +zbebIilkyoiyfuuJxoevTW2ESeZkYoIviY/+j9SPVHVnvitPlVXEyuHunYe8tN66A2D
 P5twQ2S00O1JSxpTCAqPsvt0dyC5/kF5k8X/knG1vbqMYu0X6LAxYuZdSo+zbtvEDuR7 pA==
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3g93u9gd9p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 22:56:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NL8QjKaJT8+g/HswrpkVDhlS9cWAkso9CkvXj+P0TQdXWg1uoTHbO+PwAGE//3cIltBZATr8l+Xxa2+Xr067Ml7kn8QhSzCDVNLK8kdyw7R9FR87B0PyVfT69qI6rrPgL93EoErTdECmEONP2XMWrV02KRNR4ZyfUpzv3aKuMfyApUD+E399/Cqozpt+bu19/iBMsCipVmdmgmeIfdQIELQruV3B7PONpd4QYKAU0JGAXWFIz/j2aEKx1iw7XKCkdYFAiRGqtONreFwNDedsAKZ7y2r0ACuIgfFXHbtgt9zzbiXDeYZHg8o/ydbGcjZDYLIbZiB8cW27ll904YylXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+OOJcK5m/Jw4CFCPltegbhdqs8mGOo3qcHqkz+xZMjM=;
 b=nnrjp3+3obbCs1QNQcpTtFVHqN6BlYYVZNrFnl0PNIhdgPIsbu44Rsn4+AaErsB7J5vqabvjDs9hwEOMSB0jVGhxFqUZS47bj3XTD2CW3+lAB9ZksdobqtMFu2eCiwoyZ87a8IOQpmyKgYI84Nk9tTbcalZPLwL4eGB9HGWwDjaUImw9cDWcKmmu/2E2yULcqrH4hmMG4hsFp+KrS9AdiW/2wl/Fkl2xtOgJY4t5qQclXRov1kuPWJkN6DuNZX4f1000ON7VFnBxDmwabSoKsmv09sEzuqQOuU6tIF/jgZFifXEkLrTSUCYuJ5DLmsHs+QAcvAqqYKUqWQNoZKWdcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MN2PR11MB4614.namprd11.prod.outlook.com (2603:10b6:208:268::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Wed, 25 May
 2022 05:56:06 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a0a0:842:e19d:e5df]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a0a0:842:e19d:e5df%6]) with mapi id 15.20.5273.023; Wed, 25 May 2022
 05:56:06 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] libsdl2: add back xvm and xinerama options
Date: Tue, 24 May 2022 22:55:56 -0700
Message-Id: <20220525055556.31026-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.36.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0057.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::32) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9bc7d645-eaa3-4a7c-58ff-08da3e1341db
X-MS-TrafficTypeDiagnostic: MN2PR11MB4614:EE_
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB4614E2FB79040D80FB16F7C0EDD69@MN2PR11MB4614.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1Cm7shdxL9vD/qdDLRaO4BXiI89lEpEJuOJJwd6eaF7GK0uTPBo1zPsbrKxnu6aLfXZY4rHbblHmviB4J5dleJo6KlyTnYVg6y6DPNXc+wtp8sdi6bzc2Eug5psLYXMJWqM6pr5qr+7ycx4BCL5WtEq6SX4dSlulEhLPz2Fut6Zsv05kjR3zjqEklrUhr4LVAxs0GEThJvCjOpGUONNrQDroNACnRMf6e6eSZNNDN0cLkIv3qBMT4piARXffh6/Nl65HBr/lB+ptS4G3EZnJC8b1ujEFaMbUjtoyZ/XuGGZsxbsNu+XzDS+A2H3V/RU15/X2qKQSlIWQCkLnp3o94tTOuOOKJUBH2DtPn31HAgCen32UPUZbHJwv2bH7wfvCvuR8kgdqSjtHbJC8PqWcblDoxRxDVyNo3d75DNGUEFu6U6/qIkR5VtMnm9kWg9mfHFg/ZV/2DrZo/sJnIPl1JzIq6L8thO5wPwpVUCwe9ScXZuWE+rJ2OgpMrqQgxUejX3LZ164L9fO+2vhu7GgXZnvCDDo4KTJec4pnUes1jle817WkaxW4FuGXsCFEqisRw3yPjX/ie8/vErwx+12sFdMZDX2JzVmCFlYP3Bk3zxZ2GYWjt2thnSkT0q9akcsHNikRkjJ/gVTonQ6gddWq5q73Ap4N0LJrTIoReHtuN4mvLkTZbybysHfopBmAfDdzaujvKFUNYkOFc1owvXU/iw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66556008)(66946007)(6506007)(26005)(6512007)(8676002)(52116002)(66476007)(86362001)(5660300002)(508600001)(6486002)(1076003)(2906002)(38100700002)(316002)(6666004)(38350700002)(2616005)(36756003)(186003)(6916009)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?I2VW120EOU0qR8gIphVisbn2Vtknq50U3gFYXJ8qdTnECKmKz8BAxbt5uUyV?=
 =?us-ascii?Q?s4SuprUSJJDTeq/Ayxo9jMh7Mj+4Ec3+jo2uD7sjo92ANeSpC+TDr5C9BPpx?=
 =?us-ascii?Q?psUpa0ZkCH8858Cz/0UwJwAaGuVcspZJF6YDt0R/C/2EFwQzkwdnhyJHpIf8?=
 =?us-ascii?Q?sfaLIqWPoet3Ap+C+wZlKby58gU6s177emlLqspyBKV4SuCcqNvD5Jj92lez?=
 =?us-ascii?Q?d1/wbBold8VleRXCZjMRIkmJZiVZ9E6GLNBy63UcE0zfwR26/Zk0vZATQ7wZ?=
 =?us-ascii?Q?OOj13RsEXKNlxZaM6E1g5URQVMeqf+8/t+uJbk8xj/fT/1KsF8/obMUvwspT?=
 =?us-ascii?Q?QWBrXkcRvN+Igfx9PzpgUEdwACWe1z6r9dMF7Op2Zjx1flwqWK4YjtkGyCRc?=
 =?us-ascii?Q?R8FWM9jvhn461oNbMzH0Mit3qPq1Q4W1K0+7GPD0XpPddPTPWB19WaaX2lXL?=
 =?us-ascii?Q?Pzo7c4sDY8kNWxsS12ZKXNV2/MVzXlmbYaq4ADGVIMPUMN0fwqLxUQ2i5/rv?=
 =?us-ascii?Q?78Rmt/ubnd6khJFx7UBoIIeVLKs7dBNM2MdtfZu72EuDTf83dq3KC20tAtdS?=
 =?us-ascii?Q?GKmP4zKu+7brE33AR7lLIZ16/capKB2dDmQcoIfvBipWhUC9NH0sGwq8QmKI?=
 =?us-ascii?Q?RYuZBMbtBmEUlGQ8ethc2b3MFo34UhHgd/3XUNgC+1/QZ6pYEhG+6I122OaL?=
 =?us-ascii?Q?1jnWWxveI7Tf1zB1Zmuv0nrk2fU5c6dBeuVGgc0VfeZ2gZIbZOmhamfUXoNv?=
 =?us-ascii?Q?I7YeKhoacZhrBg5pTkOrSP2uyKquXF4DSW195GJ3nqTUTnSg/T7hEe0Xe+kQ?=
 =?us-ascii?Q?l/I/Gx7TKvRSJVBvxz54/s923DvP0ZexqvfFHACHacNpgQYF2kSvVURUr3h6?=
 =?us-ascii?Q?YVfIvyjsTgK0hBZMu2z9eMxaEbXDDDxSzOmR+XBjnhBtZFNO7REEXpxlZGG0?=
 =?us-ascii?Q?1ee6VQ693Z3rDTjqfRnTWQ2+cePsA/4/AUQ7bXOn5H3SVmos1ohSvJ9G9Pp6?=
 =?us-ascii?Q?/LQfKSmD748kYXJSiEvvjzvHU0KNc3Zh06xPR3omRQesaStIrZsE2xXDd7mW?=
 =?us-ascii?Q?WvwaZOTANwtv6HtTX03LAcbhQ47lHvb52s7zNg63clw/z3iJa10QCAgiH3o4?=
 =?us-ascii?Q?i1eCMFyDO3nI91ad6+P0yYICJiEvHjqPd4sCEfnjr0ISVUu3FS9a017XImNv?=
 =?us-ascii?Q?Uvr3WKbXerb92EuUT6pB1Nw/uFFKJO2WiFwscs2Q5iUdxHPg61c1XU1XWVYw?=
 =?us-ascii?Q?/PjF7YxdeSRZDvqMDObTeBYHkEHVYlOUTm0NoIqHORxS9RUvcG5ht52owp3e?=
 =?us-ascii?Q?lJ6e5M/8E03zmhIkTpWQbQ+DHlGCKekCn8V8ds56Wayw8MV3GfxUMpcspK6Z?=
 =?us-ascii?Q?CgVd+7FBpZZkTpQqBKMdoPXxrp43nNl/jYDd3bEaOKLpER/jE5FizQ2qIWL7?=
 =?us-ascii?Q?0caQIYWf920BUgdZVmlWNS93/nLeZeqxA0HO4saO3P+adw+e6i/lMAHTZ9Uu?=
 =?us-ascii?Q?6FjbNM7uEJokhCAzlz3DmApmITDkOde+xAcu6sh7qP5CsEP5oYrzlPSEnVG/?=
 =?us-ascii?Q?8TApN2Ic4Bo5EAEQLH50j+WVqr4krPYIqNauVwNzBTn7u5KBLc/ak5a6rGsb?=
 =?us-ascii?Q?DCzbeL9+0nQJbPtykkESC8rOjo+amKnoB2VlRlTqlDZll4WVKIKK1Do+Kt9f?=
 =?us-ascii?Q?yPqtSgOoqUgGXvCG5i3hebJUYe7GdrUoUvbGMQ6S0C9je0JPDXOwEsU7fpPd?=
 =?us-ascii?Q?XaUM8ri31k8M98Eq93qifS9xNkcmMog=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9bc7d645-eaa3-4a7c-58ff-08da3e1341db
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 05:56:05.9352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 RH8LQK0JU9iJnfdVyLF+3xBIDZBKqCI40kY/H7GahPHX8By2UN3DkdiN30hb/F6iXFkWolO5xChTJRdfybJCcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4614
X-Proofpoint-GUID: FKYwAGKOdyqMg1S3UipxdpT6mvpTuCUQ
X-Proofpoint-ORIG-GUID: FKYwAGKOdyqMg1S3UipxdpT6mvpTuCUQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-25_02,2022-05-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxscore=0 adultscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=672 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2205250030
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 05:56:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166094

When building libsdl2-native, and I met a do_configure error as below.

  | CMake Error: The following variables are used in this project, but they are set to NOTFOUND.
  | Please set them or make sure they are set and tested correctly in the CMake files:
  | XINERAMA_LIB

This error appears on hosts with libxinerama-dev installed.

Looking at the CMakeLists.txt file, I got:

  set(SDL_X11_OPTIONS Xcursor Xdbe Xinerama XInput Xfixes Xrandr Xscrnsaver XShape Xvm

We an see neither Xinerama nor Xvm is removed. So we should add back
these options removed by a previous commit.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb
index b112d63784..8519e7f732 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb
@@ -43,7 +43,9 @@ EXTRA_OECMAKE = "-DSDL_OSS=OFF -DSDL_ESD=OFF -DSDL_ARTS=OFF \
                  -DSDL_PTHREADS=ON \
                  -DSDL_RPATH=OFF \
                  -DSDL_SNDIO=OFF \
+                 -DSDL_X11_XVM=OFF \
                  -DSDL_X11_XCURSOR=OFF \
+                 -DSDL_X11_XINERAMA=OFF \
                  -DSDL_X11_XDBE=OFF \
                  -DSDL_X11_XFIXES=OFF \
                  -DSDL_X11_XINPUT=OFF \
-- 
2.36.0


