Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34EAAEB64D7
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 06:38:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5086.1687329523734818725
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jun 2023 23:38:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=o3FswZwU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=553642774b=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35L5eAAM010258
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 23:38:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=7bwQWEV5u9hp4kV1hgaoox/WFKUq73kggOiJURWQozU=;
 b=o3FswZwUH4uhcA/Hb68/eegpC1x8JScbh2sgVpqSoxY9e6u3QWkF2b4mT6QyS9/3YvDq
 Nb6E8KA7dKo4xw5E6H7XWhKTfFUh2vjWW+HoG+rFjIlUo7Vw7tUoCHHIA0NPKbKqcFGp
 oLv0Vp5g4HuzKXGW3VPZqJqn/9bdcvorN9ajo2BRsb6pNWTQYDeJd9q7QzLr2VKQHTqK
 DscFTp2nuaKUzI4JyjbT6IFV2yu19fYpd4SYQfBVNQZqYUAaJLKClpqNX/kGk71wlXEs
 cKqEkMeQGh751ohsqh1fgx5GU9N04ogKtkgxXFmZrEm1tUzHzNyjie7ICVcz00dMwQv2 bg== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r9842u6pp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 23:38:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VMyW+r7pkLhDzXXnN03DTtwHKLd30BRv689+wq+BoUbisYkPw6S02OLfLPsFBPcv7MP7CkHBwrq63Fx5qUrGgl0L7mxXnp/R8ZafLcPLVKmNFjHG3mlyRvPwATAkkMpI9Ivj+0hdWHcOQxQ7D39XM8QuDW1xp8rEbMzxdodiAsYSG3x+726tUzryVlhO/+r3ZK+6J63fYqqDLMmzJC/7s9yqb/JiJ22Xik/EacyokYYHjVoDWYATcFDuSoy1l7aK313ujwMyIbW3HXyS4SXysE0ISkIP/vYjmMO61lDiIhyR0Urmtr6OXNMfraMVxOENlK8mqn9frfE6uLTnOI/ViA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7bwQWEV5u9hp4kV1hgaoox/WFKUq73kggOiJURWQozU=;
 b=aeDE3p3nHPShhzWhdTrC/9y8cZgbTjA3vP0fXYQRKISgjoDe2AeW23Isojq69x9tC5AyTDu4mCZC29rrIiNtjL9YzgQ82Gs14/sgtllOLNv+SNTAeq52rL3tPSvzrS2lu42mbKK2QG5x3Rj1gcPmLRM6kfPE74ZTKqAW1fK2ZDcEhIbe717ZRIBfYtrQ3Hfi37H1AlulZSpRvjpDMeXUpcqkO49rFIGWHrDkXz5glPC5SB81UNVCNxcrOK6k3j2q2QMvDT54VJH5+sfbhpqbewGYIeHFmMQwHJM6Xn2Trg7JMSjxcRMhnsjVvg9bB2Hfz7jU8bo90ad0qnmAIsAWYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17)
 by DS0PR11MB7624.namprd11.prod.outlook.com (2603:10b6:8:141::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Wed, 21 Jun
 2023 06:38:37 +0000
Received: from PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::8017:7ce0:9b2d:6f04]) by PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::8017:7ce0:9b2d:6f04%4]) with mapi id 15.20.6521.020; Wed, 21 Jun 2023
 06:38:37 +0000
From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kalappa@windriver.com,
        Naveen.Gowda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [mickledore][PATCH] binutils: stable 2.40 branch updates
Date: Tue, 20 Jun 2023 23:38:11 -0700
Message-Id: <20230621063811.1843937-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0019.namprd07.prod.outlook.com
 (2603:10b6:a03:505::21) To PH7PR11MB6449.namprd11.prod.outlook.com
 (2603:10b6:510:1f7::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6449:EE_|DS0PR11MB7624:EE_
X-MS-Office365-Filtering-Correlation-Id: 70e3b5b3-6b31-44e8-cd5c-08db72222445
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sHnZOAzXQti/gS1EPMKukgS2vgLkN4sLY1fiaQ5dBFPbTPHjZxlPEBcC0HHFy9z0qD7MPTo/ZaxZHHXss9HkMhlo2oTeUO5glgbr4oDlfJjnk+jztZFX1vUrPeNIyyKCDDehFVmU06F2W46AY6f9RVpnOowIZGeLQdYQ+AEG/sj/wxivCWxfxXBX82dSd2utRbp32cgaM1pYR0GjtXuulOXa4+MazP0/82P9JSf852WQX3v39KfRB/+8jMTyeWC1X6Vy+wGLSAl4FDyq9W2VemGpPv8nnG5cYrV2gGINLTlXGxCSKMEhXpVYJVTkeou4URDFj8TrZ3FfE/0VCqM1J+DL5/24VidTvpQZxVw3DXKZuEDDXeloVaa/XZIgXghjVDX2TPtJ7ylOAw6Y1JqHERHDLfTAyuUcVRITLjehHwf0bDeY9/AHRIQhOks481FHFgBBXifygRnFCz0sPjUrhJ7DuT8ihI3NHJAuGIzyfkpGyygt5ArCzwlsdhwcaWp8AIKhq3UWDayvuneClPmf4mU5SXQlgvlb4oIefMBivpGuSesq0ivjrWVJYBawBILCXyyPqzpeXayd9PJiXExNG4cBL87qwWoPwlHkSkOz/kIAqy7PrzyK6Hh8G/WqILk1
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6449.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(39850400004)(396003)(366004)(346002)(451199021)(8936002)(41300700001)(8676002)(6506007)(478600001)(38100700002)(38350700002)(52116002)(83380400001)(2616005)(6666004)(186003)(26005)(107886003)(6512007)(6486002)(86362001)(36756003)(316002)(4326008)(6916009)(66556008)(66946007)(1076003)(66476007)(4744005)(15650500001)(2906002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UuYCcPqe/Z7aCrOuDBFEGvVqf7lUpJZbRgYBcVbPO+J8g+Ehng+PjLgLBmCK?=
 =?us-ascii?Q?h8kFdXjrwbkOhYiNrThNm3qtkmLeB63zoFP14J+wVTqO4ccyUrvvDVcv0Xf1?=
 =?us-ascii?Q?l7t0qReftjp9NyB6mLkVdhFgN2YRxgjp+ASF1O5LZgJFbWts3xVcIWSzZVFy?=
 =?us-ascii?Q?95GMnmtmlW+EvsRXQn6Y54tz4OpK8IlPnfZ4K2UP7SBtKt6HsXRuBQrytbJI?=
 =?us-ascii?Q?lPK3U0Kw9i0M09CekiuQmtDtFGNrxbUlPseCGzCAnGxeNWdH64B7m7QrTrKN?=
 =?us-ascii?Q?1fbRNXt7Gi68OgmvsFeDYz2C1lQnEvfmIFeSPkyuiFVTQgmR6q/H/BxbjNik?=
 =?us-ascii?Q?nLgG2yM0G/7OqpG6oqaS/GY9X70iZlu/bYg7e2CVvrRpzfdMrMYdxb5wClme?=
 =?us-ascii?Q?YLtC6FwtXCT0F5CZfu+kuiwcDhkk25UczeApenyXhEKK39eGHAkfaZt9Vuxc?=
 =?us-ascii?Q?jh9f0Mbp10ljf8/iR4rWvdoRQUt/LsB4S/Rzbk5FqfEtUWjuzVLiK9aCSjMq?=
 =?us-ascii?Q?5UzMjpO8Mkajdl80ebFBC//aTnnijbQqkP30URGAn5meD1nvhZx1rttKHwUS?=
 =?us-ascii?Q?o/fkFTpqzdaqiNci+zubw89cu32KW1FoOdrRJTIXN3jAyMWT+VumWDQ5q7Xw?=
 =?us-ascii?Q?mY7eQByPTD+pDUWv/Fn1uA+Lz1FcL+XVz8RZA3pgHxgbwxfPx4G61RY+k8z4?=
 =?us-ascii?Q?XECF43f71wq9OdgXSVRpaqNFaLCt1CMr6/SQYvuWZyyYVLrqloP40vabIjbk?=
 =?us-ascii?Q?beeIPnZ0+lCRmumK1bH6PqgjVI6KE2HHAl+mhX8hpFDdpPz+nqVFJ3fHfuYa?=
 =?us-ascii?Q?M2/5GX2+epkalxJ0UyB3phM+upztFR28CPVtqXQgxcVQk4AkD+6uAYK1xW7e?=
 =?us-ascii?Q?rHM/7xmTBCd9gG9ujyzSprGIIBaZ7+Ca28RrJV8tetq2CIBRNSMlBXPnggB9?=
 =?us-ascii?Q?zi1vWmcC4XaBEQINuKCpzZNqVHh95dHC0VRs0w0xcvrh9LRPLKmgMJn0JFuu?=
 =?us-ascii?Q?je/UGFEsWVGZotOGicrUoaM+huWm5OpUSuWePq9OzdLa09Ubn+ZCZ42JpfLH?=
 =?us-ascii?Q?fUzJByVX2nW/B+6cvbqPKxaWJkL1/E3F0ItJFQKOTyehpSpwrNR+Qcf0ONlv?=
 =?us-ascii?Q?hLsYCpbC78iDtH+zJg2aYjUMR6Cm/Ut3mzTXKeO/8i2ZALEdGVR08/CTCorN?=
 =?us-ascii?Q?2gy3MNBS1wzGBlmxYnr6PeKvMBUuhvLRiz12N8aLjsg1bRs3mmrI2BPav1ZY?=
 =?us-ascii?Q?tn8Kj9zfY6njV6etMsZKu3GXGd38FUDaZIBHKVRcH8sSMA+DrbHKMteJ3hwc?=
 =?us-ascii?Q?oT6YChwDF9D0IaRxcLE2XUGXvYsl5ibsTwYai10Vf37Qen9qOeaOxZZfWCGo?=
 =?us-ascii?Q?FkTKkjc415Vi1bDMqyKrSd+YltqrYxbEWLNgiKdcwpfUX/hzWArgiaMNP2BY?=
 =?us-ascii?Q?RemTmGpOBCfXggyhSriguqtEW5FvUThefjnJseTNq3bTc+Aq+Xw3hdBCbX+G?=
 =?us-ascii?Q?Vr7TBkDMP6yNRqSR3Io+m1yxc+Z/gAu37tLH9Q5HJnOcyWDQSdXhWABln8Jt?=
 =?us-ascii?Q?ZjZ18OQzFATrNDowRvJ1etchBroJ2V5lviysIwz124xfWPOgEinueL3UO6hK?=
 =?us-ascii?Q?gA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70e3b5b3-6b31-44e8-cd5c-08db72222445
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6449.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 06:38:36.8321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pRT7ij3wUNLJaTz89rOo9dNAX64NLNSX+v+xsHj+s5N6TjSz0CadMRPhRmU7wIWKkQhchPD9wX+cqjZ9fYHPDyxPugcWYRkFr9Dpa0QkLrQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7624
X-Proofpoint-ORIG-GUID: eHZF6V2GNDcKUl8mGaNjzi9NXHgtc-Mh
X-Proofpoint-GUID: eHZF6V2GNDcKUl8mGaNjzi9NXHgtc-Mh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-21_04,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0 mlxlogscore=561
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306210055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 06:38:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183168

Below commits on binutils-2.40 stable branch are updated.
0dc8f96598a Updated Swedish translation for the opcodes directory
85c5365527f New Georgian translation for the bfd sub-directory.

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 meta/recipes-devtools/binutils/binutils-2.40.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.40.inc b/meta/recipes-devtools/binutils/binutils-2.40.inc
index dbb43044a4..006d60e784 100644
--- a/meta/recipes-devtools/binutils/binutils-2.40.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.40.inc
@@ -18,7 +18,7 @@ SRCBRANCH ?= "binutils-2_40-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV ?= "4671be001eb5a899ecac3e2686a92934000f8262"
+SRCREV ?= "7343182dd163d14b7e17c255515940dff67f2bbd"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.39.0


