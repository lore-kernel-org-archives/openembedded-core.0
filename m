Return-Path: <akash.hadke@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D1BFC43334
	for <webhook@archiver.kernel.org>; Fri,  8 Jul 2022 12:07:15 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (IND01-MAX-obe.outbound.protection.outlook.com [40.107.222.46])
 by mx.groups.io with SMTP id smtpd.web08.6692.1657282032450727343
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jul 2022 05:07:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=xcO3UWPd;
 spf=pass (domain: kpit.com, ip: 40.107.222.46,
 mailfrom: akash.hadke@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oaFHB22+AwM/1O5onwTiWaEBwXxt4Lkya5vUX2CTU0erBMd/i9HM1+dIv+6jwes27BLA9dMIEKI6abna1vA01GUtUKKcA/qpIpSFOq5rXr6Qs55zA+U6f9KZPXWqdpyKgK+1sz6HdshSuDiUYHXolGiDLPw3oUuzu5KusLxrLgPcW6JjKI2Qr0wNNTmPvk5/pphF0524RMeA7DZtI4m+n3b6FR7FT+iwPgEqEFfnKXEBmAYH1WljGWaoDA//O8vOboCyeI8qbHxIsSqJALzUkXvIVVTOjPYUYUTUtqowHL/91r+npBJPEVw0/1QjzPMlVUFsgZApfoMNQzCPPaylxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HL6ssoBR0KBspRFrUTaQ9lRhLPoqh6t0a7UQf/J5Sbw=;
 b=Fc+UyIEva06mYCUyOIcuFlWQ7VgCYSVLKDOZ/oWak7RyJQ870m6GNVsuOThIgVtYK1Yw5P+Xxc+Xa8TeG8yUWIXMu0lBBLg0dGxVDFL3EI1DDzHAnY7uR+H4M94/iNlZMXBBKSZ8cCHipjJQesxuRNAzvwBthBHG3hcSttkKcRaa6+YqTsJ4tJsXFF16jw87oEaEBQhoFRcgR7WXBLrHm8leqTZtTzJ3diIp7oGnswRmMtDWraqChsq5ocJ/YoprNZiuE5Ppa9lqYmceKGS5EsEKZvK0LJA0gIUpfGCj2NfJ5RZ6yNADbawfAuM9g6dK7MiiWcoXPphF7UEr2ZY6lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HL6ssoBR0KBspRFrUTaQ9lRhLPoqh6t0a7UQf/J5Sbw=;
 b=xcO3UWPdFAUIXAoI9Nk9kvao8e2CAAY07peJmUNMFzrUvVtgS3PCeGCvNWFiSV5C1tfNTSabMLGJHuinqpTDOpNI5DKFGdT+SgkjnTpKkOJHFGO/U7Of1lNDPbljz1fWjelhSwPbDoVwEMoPSr63GC7EvedFNI5ugH9wSHOuKrI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:89::13)
 by MA1PR01MB3355.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:7e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Fri, 8 Jul
 2022 12:07:01 +0000
Received: from PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::57:e269:a77f:d5d9]) by PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::57:e269:a77f:d5d9%4]) with mapi id 15.20.5417.016; Fri, 8 Jul 2022
 12:06:58 +0000
From: Akash Hadke <akash.hadke@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: ranjitsinh.rathod@kpit.com
Subject: [poky][dunfell][PATCH] cve-extra-exclusions.inc: Use conditional
 override
Date: Fri,  8 Jul 2022 14:06:11 +0200
Message-Id: <20220708120611.6577-1-akash.hadke@kpit.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0107.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::20) To PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:89::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ab01cce-f2a5-4e43-d390-08da60da5b05
X-MS-TrafficTypeDiagnostic: MA1PR01MB3355:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0stJb8NsU159v3R31xJMo8Ug0/ch8lsqPzThG7mYa119tU0WUdliK60HFo9t8vyC1RQiwMJ0QczfM4l9T+I4V05PTsIJwL8e0sRygnC92Fr49toq4mXwsvUXxC/AO4SvVtbC20n9MJF21fYyouYTuNBwXJCIFaA5z3xG8t3r/8oVeHjA+FO/yDxMfNOtY1uu1TR5Nw6CsmnBvORiacfd5Faz1lc0nUefSMt01B6VxQvIZJYMfZXPrm/08xl+kPnsXca6Innmk/Gekbcheg6uU74J7Kl8sUxD5COJXX8hbU/yiqpA3vXo1sEvkz5QxkzLahWp6NBBKKzpP/x2yUpBjLgstukjEOsjoN0fR1Uby4gxFipOHR7yFNK9elxkCUxvhVCrSHHE90fGjE/3xfPcqvB/Qe6RRjAm5MchTA1/serQcMDXUpBvw1JE8FOtPv7mtGr7JKqORWsF4Xi+xgaAggtpAtyuQUkfnKJ9OXXIJy/B+3LcZji3mPJDufPFFNpQf4O+ut6LXg3FGVWtcpSpyUZcnGgQOrOLqE323OBUGuYJ8TXq/LbZfhxKoNwaFeLkMqbEjg70ir5c82ehG4feWwI69szULe2csFo8Uzi/s41qGWyomCPeov3uSU/d3poSbMimlUY2RLu6H1gRvcbNX2/CbVi6z8WQg3x3Ng6HWQ1uloEaJJgyoCCFbaUJVJnspQ04T10xHdeWXOlqPZNrXkTT9nW5YUwm6RXdXW//DxrcuFy1Y8st5xhaHFzeVcvZGMkbqHQx4Dk0+08MHRfjUU2/IVylPJTcx/+SAXGipOjXQsg1I2d6RVtOkz2c02u20WK9DIsOv9MTVGjLOnjmH3reUprI7ktLim7lRBEVsF8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(376002)(346002)(39860400002)(136003)(66476007)(478600001)(36756003)(8936002)(4326008)(8676002)(66556008)(6916009)(66946007)(86362001)(41300700001)(966005)(6486002)(6666004)(2906002)(44832011)(52116002)(38100700002)(107886003)(38350700002)(6506007)(186003)(6512007)(2616005)(316002)(26005)(83380400001)(1076003)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HhWqvwVbQU7mKWRAKcnC7nMlIGbV/n6DrSI2cGHMJPqIhsAD/mRadAXXOS8h?=
 =?us-ascii?Q?maKJow6HXOiTvueghnoNCDjJGz0KTMG4AIY0c4lEvtBo/JJOatFYSmJX5K8w?=
 =?us-ascii?Q?47gGr/hQghC98lbtkYqS6RZos8qXlYS0tuvCJKilJnYQ+kmtteFMlWc9tTVa?=
 =?us-ascii?Q?cCoTES7bV5DObBrEIoZHjhVyaY6Ng2nlTGy7lHpQP7ZL0gUKRnQQF6vtxUJ8?=
 =?us-ascii?Q?P/Ytx8uIBk60nGoTESa+2Kw4PU3vc+A1omvu50CqW34Rpr4InDzkBi/v06G7?=
 =?us-ascii?Q?TbpR9bv9bS56QWzL+GP6tfS//XSaBo1ViwRJ3ojix6ncSdoaG4+QYB24Qdaz?=
 =?us-ascii?Q?2z1oCJuMIu35F3+F75U+W6qXRY8mFTSOKkIRA0uaZE2ZAnD3cXT9kmlYOFaR?=
 =?us-ascii?Q?7+hVnGx+lzohtQBXEs3GF/m8GjcENQbRnioGRcYPWNSuGc9oUwmOoXRZZzM2?=
 =?us-ascii?Q?5HhSgDhrGdF8jeUEPtLKWiZSeIBqQ89sabNMdQXgIa2EwP7MrY2TzBNvDZ1P?=
 =?us-ascii?Q?LqxTCzCL4o1YZ1kzR+CjhNgF30uAWjh05Wszm42xPr2ByeO+CsEDA/cAk/Ul?=
 =?us-ascii?Q?fW0jfzrJ7B3Nbcn8flpvxbnuGbrMz3TgAsjjQ3NSLG1jAW0Jggw+h/mQF9OO?=
 =?us-ascii?Q?sXWT1riEeQKN0LdeWDVYwBfPy0TFMTuC2hi+OhZ+FUBa4VR9Fo3Ax+tFbCtW?=
 =?us-ascii?Q?EBCcczEdF+UeZUkjuNIy4SqRJY4u92qOaLP4uL6UnrQKPR5TN45mElfdD1MN?=
 =?us-ascii?Q?OY+tb7OgfMQiRd96w6bQ+Avs3L9QplsjYqTQGLyRR85ajon1e5BFDF8b3onG?=
 =?us-ascii?Q?sdxsjo43HIjqVnIE4/pgvsm+ns0opPg5khBxv3hXLNy0OJEPagAEoy8sEGqc?=
 =?us-ascii?Q?9OtuBF10JJSplHyQseQ7lZFm8hYyo+QuomiRdf0tBMTMSWdHxZ9065jo+ySZ?=
 =?us-ascii?Q?vileQCvJKhlwey9NyM0vaJ1OHZmzs6xg7BIikaAu0LbBj9xGi9FYViiho+2/?=
 =?us-ascii?Q?VQasTPFqRmOqw95mwMsgM6o80Wcs5+0QAn0HVNy6Yw/hOhx4AS6noGHjAFK9?=
 =?us-ascii?Q?FuhTjjPE6s9BM4brb8p27M+woRR6EYqnKvrqF7v4jstwU7kDgpyNTwb/KeZm?=
 =?us-ascii?Q?XzBXKvChjUUugqF/h1V2xh3cPnXt7Fftg/NpPo7867MjRwug3boGHUNmQApZ?=
 =?us-ascii?Q?J/zbGacbeGQYWcb00kcot7G3tpMMiJgityOugzGoaUOZ7PPWZJZKYr+tvIcc?=
 =?us-ascii?Q?bwHZN3D3KeZ6w3PIl7jTDZzo5r3FMcfNVKLkM97fE7dp21X6upzMYmPhlGrg?=
 =?us-ascii?Q?j0efOiW72Xg+J2IsA+RtcGxYyQGpql3thW6ZCiVcdqwMdghG4CUXMwfE30h2?=
 =?us-ascii?Q?vHXTAtLDN00bjwlFa7zyOIGz2AHxTF09N94FULS1kGvlcGytR0l42NKc09I2?=
 =?us-ascii?Q?e15oYSnDw3Jebqvv+xfej06+3Az08RWzywGW0qXltsfst4fafpwgMiNVP2tK?=
 =?us-ascii?Q?0WrpFoawnTsEWCPDCoFv9YLQcKNPaBRNH0vI8YZ6C1ztNI2+YH0EiQbAHGvd?=
 =?us-ascii?Q?LrCQ1adUOKtgEVqPLWCCnvgVOGusgrXgAPAnv+4x?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2ab01cce-f2a5-4e43-d390-08da60da5b05
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 12:06:57.5091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 USfriNJcodZM59gnISKhFlgnqTQ8zwCbZQhPRW3T19bI7okD8VKWxlihJY/+3McGDpVi+0wWGYFc/esXJ3wJeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA1PR01MB3355
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Jul 2022 12:07:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167821

Use conditional override for CVE_CHECK_WHITELIST variable
to whitelist CVEs for specific recipe.

After including cve-extra-exclusions.inc all CVEs from
file are getting shown in whitelist list for every component even
if that CVE is not related to it.

This change can help to set actual whitelisted CVEs for
the recipe.

Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
---
 meta/conf/distro/include/cve-extra-exclusions.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
index e02a4d1fde..4c8716c1a8 100644
--- a/meta/conf/distro/include/cve-extra-exclusions.inc
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -19,7 +19,7 @@
 # strace https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2000-0006
 # CVE is more than 20 years old with no resolution evident
 # broken links in CVE database references make resolution impractical
-CVE_CHECK_WHITELIST += "CVE-2000-0006"
+CVE_CHECK_WHITELIST:pn-strace += "CVE-2000-0006"
 
 # epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2005-0238
 # The issue here is spoofing of domain names using characters from other character sets.
@@ -28,26 +28,26 @@ CVE_CHECK_WHITELIST += "CVE-2000-0006"
 # there is unlikely ever to be a single fix to webkit or epiphany which addresses this
 # problem. Whitelisted as there isn't any mitigation or fix or way to progress this further
 # we can seem to take.
-CVE_CHECK_WHITELIST += "CVE-2005-0238"
+CVE_CHECK_WHITELIST:pn-epiphany += "CVE-2005-0238"
 
 # glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-4756
 # Issue is memory exhaustion via glob() calls, e.g. from within an ftp server
 # Best discussion in https://bugzilla.redhat.com/show_bug.cgi?id=681681
 # Upstream don't see it as a security issue, ftp servers shouldn't be passing
 # this to libc glob. Exclude as upstream have no plans to add BSD's GLOB_LIMIT or similar
-CVE_CHECK_WHITELIST += "CVE-2010-4756"
+CVE_CHECK_WHITELIST:pn-glibc += "CVE-2010-4756"
 
 # go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29509
 # go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29511
 # The encoding/xml package in go can potentially be used for security exploits if not used correctly
 # CVE applies to a netapp product as well as flagging a general issue. We don't ship anything
 # exposing this interface in an exploitable way
-CVE_CHECK_WHITELIST += "CVE-2020-29509 CVE-2020-29511"
+CVE_CHECK_WHITELIST:pn-go += "CVE-2020-29509 CVE-2020-29511"
 
 # db
 # Since Oracle relicensed bdb, the open source community is slowly but surely replacing bdb with
 # supported and open source friendly alternatives. As a result these CVEs are unlikely to ever be fixed.
-CVE_CHECK_WHITELIST += "CVE-2015-2583 CVE-2015-2624 CVE-2015-2626 CVE-2015-2640 CVE-2015-2654 \
+CVE_CHECK_WHITELIST:pn-db += "CVE-2015-2583 CVE-2015-2624 CVE-2015-2626 CVE-2015-2640 CVE-2015-2654 \
 CVE-2015-2656 CVE-2015-4754 CVE-2015-4764 CVE-2015-4774 CVE-2015-4775 CVE-2015-4776 CVE-2015-4777 \
 CVE-2015-4778 CVE-2015-4779 CVE-2015-4780 CVE-2015-4781 CVE-2015-4782 CVE-2015-4783 CVE-2015-4784 \
 CVE-2015-4785 CVE-2015-4786 CVE-2015-4787 CVE-2015-4788 CVE-2015-4789 CVE-2015-4790 CVE-2016-0682 \
-- 
2.17.1


