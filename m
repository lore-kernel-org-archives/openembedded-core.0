Return-Path: <Zheng.Qiu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BA5DFA3740
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 17:47:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.523.1666892851528280115
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Oct 2022 10:47:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=gpdF5aop;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=729989650e=zheng.qiu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 29RBSFmS009409
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 17:47:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=bV6BArcILEUpJGXbaZGw+bjKyfF1lT4i3co8xpjG5XI=;
 b=gpdF5aop9t0OETH11rmzTKwMB9d0EyFSxK3c8PVJtwMUooP3O4bJsKm+gN2ThUnRNVpN
 ACrGkIVdYx3yQwjNkz69R9SAUvCxgF9T78rTmE2GyJo8otCW/JbPDjrm+iiPCq9QaexJ
 k/RG4XXwlNQE8rTEmfOg94G2uFu2T9z+u/EPwpvbXAdKpNvGQ4cawLHZ0qfe6CDiDhMz
 TJzTZyNDr8wlcxjN3ruqOYmqVg0Hqn7axJa9HiEI7TVimuVP0H4M1XrHGNPk1xmLp/tq
 TX3jNO0kwwy+nTeZ87+4wqiGdv/GPqGlR/tRk0F/HJrRnK4utyFy+aCvNhwOt708giAy 2Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kfg56gn3r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 17:47:30 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29RHlUfI025167
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 17:47:30 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kfg56gn3n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Oct 2022 17:47:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DqfMXfufG5G3u3lIcHFMYv4QARCzLw0C5dlToGFJFNUaZAgj9S8RNwKVhoIb+s2Dg4xF2UJfLdJn1zc8I40dtElKjkmj+EKUgK8zTnWYOfwxEGYd8E4AtI/booeUFP/qnrPplXLwhXGFg+g/oyPaYnn8a1cbee7FbYEG8aZDV6gFYXYtZPbrZ1WguG9JMfaunqJdIN+X2qdshr3+XfX7KxfGSRkiE4MQbnbmpzLhzSBIQtW3lbmkerc/UwRJSF3EwQ1pjzqvmAfaoKZR+AW4p0Ljnf8VcnGWmXuzEZXJ2jw1tQTYHeOAE5ZJNKyy04iKyB2gbIpKcltiIuw/VKaeWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bV6BArcILEUpJGXbaZGw+bjKyfF1lT4i3co8xpjG5XI=;
 b=N47PA2fc3lZwGh7wboEwh+FWER5/8f+IjkA7E0T5/es6QzQ45Q3Yvtf6gxRSIFa72VYfYhuPvAfmk659dScIrh4mgYkfskL9thpL52/IHYK+Fkpp3IcMr8ugM17Fec7fJARuHc3AYOiD/ofc25t7SLddck/eCqEziAWLh/f2xNnr/ON2EGsMyRaPCY9g1pDzAGHO4oiRl64QjZZ4C3XYqSlYfVLemzq0/XJump4WxHjr9ftJA16H2TRCJMsFzBtlIUCHIHuq2+MxwxA9ivWTkPpUTwuXpZ70MYP6+0j+XdcJearHuarW4DQtatpZQQag4xy48PACalwq72eAG0N4Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5536.namprd11.prod.outlook.com (2603:10b6:5:39b::15)
 by BL1PR11MB5554.namprd11.prod.outlook.com (2603:10b6:208:31d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Thu, 27 Oct
 2022 17:47:28 +0000
Received: from DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::9900:3433:7cff:ce14]) by DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::9900:3433:7cff:ce14%9]) with mapi id 15.20.5723.035; Thu, 27 Oct 2022
 17:47:28 +0000
From: Zheng Qiu <zheng.qiu@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: zheng.qiu@windriver.com, ross.burton@arm.com
Subject: [master][PATCH] tiff: fix a typo for CVE-2022-2953.patch
Date: Thu, 27 Oct 2022 13:47:07 -0400
Message-Id: <20221027174707.33423-1-zheng.qiu@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0141.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::14) To DM4PR11MB5536.namprd11.prod.outlook.com
 (2603:10b6:5:39b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5536:EE_|BL1PR11MB5554:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d41dc0f-c879-4a53-fecf-08dab84350a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BeJd/3K4GqYUbAoEbrGX9Aw+FTDTFc/LWq+alMHqH3xcsCRYnn+jJpw9j8XozFA5wU4vX/GTtUiIAXwUxR8WS5RIZn0xKFIj7EDMEJmaNiP5LmW2yoQdmBQz2xLc6iKEH8ltNvth4LaYl/9bVuNbMdADzx7oBggtdxgBftb7XFF/6TI755aa5tbCbKVsXxDGW8rt4WQYxLY1RzwBPyM5cW1aieMGw3qTOTKuMpJGN1f9+k8bq5U5xjjaiclAxZPLfZemYh+Olmz5UivWdRzw8AAjAKJcCBqxTmUwr4LjJa1F+m12QyLhpNUVYQHxkCcibVOyexsKqHUo0wJ9nJcgpEtmnY34wIxKyUfJBWRMxU7j6gq7i/tc32fI976ddR14eeSQlZyYo7MZT1DLuCAKoMf5S0XRq4/5ChXJF+rnH+nOFpo/Bo+aiCYUF/3u2DMbrjdgZz2LxoYS1q+Kk/yGIXkOKJBigfK/lL1OGmjDAn2OYp2KAi1xlHfin1zK7CTDPjXbYVHazjeqAj61N7HiIAO9yQd+kAnxVS1CQc3erjUviFxZAduuwXoqnSHzkP/foMSKEjLZslRnErgIRThkzzpif+HEHNKn7Lt47Y021X0DJDJ8mZaoxkeu/9TUvkW0EVr4TzSSHQ6dMGSrrTJ69HU+0gwYz641ZnTDqznFGK7qd9rsgxdo8lB5bpJc5o1rZEtC9FyvvNlLBz+VaUNSISsv9oUVNhoB7s4032PO+WhpZR7EKRObl37uinpx/tv82zJer7XGIYD/Lh4Arxj1Cw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5536.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(39850400004)(136003)(376002)(346002)(451199015)(36756003)(38100700002)(6486002)(8936002)(66476007)(41300700001)(316002)(8676002)(66946007)(83380400001)(38350700002)(4326008)(478600001)(6916009)(5660300002)(6512007)(44832011)(66556008)(1076003)(186003)(4744005)(2616005)(2906002)(26005)(6666004)(6506007)(52116002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GcjlX0JXZp/PkwEbWccaslTe8wpnJO7wxAZXDUIZHkw0z5OKBzkBOp3u97CI?=
 =?us-ascii?Q?rUcfoXlnZ0H++QNQP21Ykor+2BUJUBJ9DEqJ51hgXx26eDQYUTepWO96DK84?=
 =?us-ascii?Q?ecknwW892ZHdrCaDt4yLtyTnoashYNlcyAXNkMrtJcbFLjqpdqbWxHEzcxJR?=
 =?us-ascii?Q?CvMKkl6e0KBz3+rq9tSW//4txkvgtT/i9H3a/B0JRFR2vR1PnVW0izv+aLM2?=
 =?us-ascii?Q?ELKwfPJCSUD/shg5T42xz85JMwq35rmNPxFXX9ucJPJrKHfoZYqvraDcdJ69?=
 =?us-ascii?Q?SnnwkDfZjxb/7ZhtkjVwzm7DWJHISh0aIMRvV2v2kb2cbCM25tqZecflp6Xb?=
 =?us-ascii?Q?15IYdsUgsuLuT4JRMFZSwBfSorBuczHOL25VOizIdJIa1KmSX+gBfq2RRhZg?=
 =?us-ascii?Q?yB62E2pktSKy099W0E9CiKXrcQ4259z0kPRkCkFwpHHcr97Z8TtAefyDd0pG?=
 =?us-ascii?Q?JbfU4PdhPy/alJnl7kpaBph1nr4DB/KWNVxAOEA+RBjct0YmKxdkz5hGo83T?=
 =?us-ascii?Q?gmC56xIxHE+JYGrqn3QkB7ZD7D5Z07UPZuCY9nzF/JQ6tgIL2L6Hol4cZ1z9?=
 =?us-ascii?Q?WRbM8ZoIX3ItH+7L/VlE/FN/75SkF5TcijdFFtNwW1LhQtnevn9i3tqfJfWR?=
 =?us-ascii?Q?fDjs/M0K4DfXqmdEM8ivMBaO7vcsIy9oWioLJWDilmAjDr/PYKT+YgXbI9BF?=
 =?us-ascii?Q?CJ0ng35u0I2zTPMPtp/WjHzXHR/renGYAsWuM/bjzUw4lAbdjAX5wTuF5VfZ?=
 =?us-ascii?Q?2PQl3LgW6AHrPHCIfSwMuh1IWHJ2tE+qXQhjRqTML1QKwMXHKBeGVBHgRi+z?=
 =?us-ascii?Q?vN8GW3S9NaTd4uuB4qjKmmy9uuHEFb4N4IpmAA+us1QGmZn9TXpKCFXbcIPs?=
 =?us-ascii?Q?kLamW5LWelYmloaHO1Iwhvo5QGu2EkMTNTcZCTHS+zWV5FC+CIqKKAxcbHzD?=
 =?us-ascii?Q?5GdvR4cfOi8WFemQpUVRrMMePXrn9L03DFTLsFVpdZlWOZSeCUqLD++LjMMS?=
 =?us-ascii?Q?aDJH/Kvvx/MFcJTB9Agj1wo97FECPL4XQ56hbIt0Zxz/DUr5Q/Cv8ic02m5Q?=
 =?us-ascii?Q?/MQfnhfSLns3Rkb5yYaHjQEO3zIOskh7LMaL1LZ0qgsotXU8xipfYgvy+HED?=
 =?us-ascii?Q?wdSozA9OYCZC1RPdhjBQKkYt4nGH5LM72KbeGehxOHAWfNmucX0A+rJTT7TU?=
 =?us-ascii?Q?JovDpqV7XLUih1kz771HD0u9DcRH6O9XaZ+uchd8oiAhaOpU9COuN2Xo7koy?=
 =?us-ascii?Q?XMWz+v2WwAiGOLXyqdos1s+6d76dCBjqEkkobNtXj9waVWiECSvAB7HIMuqA?=
 =?us-ascii?Q?jtgMfHq4x+Grcsaqc0C6DlVjlFlRZRTNGWOl9q2DlCsrwa9WJsbZBujOw/mc?=
 =?us-ascii?Q?ZZKoVJU6iJWUaPftwMBaKGBbYfaJH2DiLTPa7AmNstZDkbAFIRLWIVVWph0c?=
 =?us-ascii?Q?K1jL7leIAJ9EZzkWJmzdKcjoIPd/B3eZPfFZ93TaBC5Nml0HuasuAXfa+Nj7?=
 =?us-ascii?Q?kmnjWGi2Z1IHzaj96Ty9oYm2z3eokfg4iyncDgFPs0J2rUx6QDBgCHj6gcMj?=
 =?us-ascii?Q?Neo1uA/0fz+CsGUXDKgbc+Cjco14HNuvAV+xWHQDt89wiBeg1jqEbscVhhn6?=
 =?us-ascii?Q?yQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d41dc0f-c879-4a53-fecf-08dab84350a4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 17:47:28.3232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3M4Q8XE4zP6LUdyR9vHBoPwsS9gcKjx0yEdhpEIhC5Dqqr1E6gOLccuwSfnfV0l+RDBbBw35OhLhDFLBjkOp6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5554
X-Proofpoint-GUID: o9_uq5KshzH_2-hhioIvUbvBJ-gzowr-
X-Proofpoint-ORIG-GUID: JRU2pZbP2PMdQj9vghwLUwaCF6Ce-lxC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-27_07,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=645 impostorscore=0 phishscore=0 malwarescore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210270100
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 17:47:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172197

The CVE number in the patch is a typo. CVE-2022-2053 is not related to
libtiff. So fix it.

Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
---
 meta/recipes-multimedia/libtiff/files/CVE-2022-2953.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2022-2953.patch b/meta/recipes-multimedia/libtiff/files/CVE-2022-2953.patch
index 98020ff92f..e673945fa3 100644
--- a/meta/recipes-multimedia/libtiff/files/CVE-2022-2953.patch
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2022-2953.patch
@@ -1,4 +1,4 @@
-CVE: CVE-2022-2053
+CVE: CVE-2022-2953
 Upstream-Status: Backport
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 
-- 
2.33.0


