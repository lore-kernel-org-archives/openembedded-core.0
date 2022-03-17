Return-Path: <trevor.gamblin@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F080C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 19:22:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.502.1647544958201131732
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 12:22:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=TXqsUi6b;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=0075e80d06=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22HJ37Ab025630
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 19:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=0J9T9VNWCw8SuY0bQD53cjkwAr6zZ5bK7v+YzjTW4Y4=;
 b=TXqsUi6bapaUYB7fLg12Zv8XaSeM8no+G5UrB9cd/RmJJvWancAU9WkYYSoCqoSP6LmO
 8Sa6GlM5lOfBI6NaX3iLs0jEdk9hM6xN29r0t2cGNZA2S/V/4Twj0pxwZF67pKYC8Kt9
 pNn8lhKasimtAcdwobM5pOdQGqNED96W4G4kbbLe5GX+G85/5jS+UHb24APUrVrAJpbN
 v0KsQXjwzx9OcGGcKzFDbbhl3hpYC+HkKgrxGZGJ2TSMETmEP9tnOyXo8HwVMcx3HMeP
 xTzZzrrfF/CBwveqt8U+IaysS8PckX1Hp09/VxX4RHXgR/QYzuu3ndpMRQvPppNgcnaU ig==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3erjg7vr5n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 19:22:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cYW0u91c3bDpSkwVBwmB/439WmUcJJD2lVhwcZUECVQkDuoZfPrMLqtfwOzCoIYbxJJSt3o6Zn4Phsn+yyD0QkJ3sBG8BjpICST40UTxJwcU9hK6KCUbvYxLLZbq7U6xVCBrCbOTaOPdeD7ScDtBo/+zztXAG8tn0mxiRHY/+XlSGyunfK6pfr19iNp8CSzSkjjcNmoZ/DlmzwIIvFJKm15FxSEi66Nxmn7MmFbtRW+NwIU2az0OkEIGMuyxxxrO6zQmREHWem+M/Vl2BVclHiQrnn+btvaEiMW1DEeFrR8YxyFLsxOA62MhdtP0FQdylbqGinSZSSitf879+nLK7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0J9T9VNWCw8SuY0bQD53cjkwAr6zZ5bK7v+YzjTW4Y4=;
 b=ZV06CHE/61wbLnBxXsWSYWU1csYAlDRgTUYonhZiKHuWNcA4DWIH5ttz76PHeH0/EVuHY5LIJWoHkVml2k5o84YYx2Fl+OYvQJpdl3NdJyPEU0uOkfoIHpvw1hloUmqc+wIxw3PizIpUbYfJOG/Og0Z7/0B01G/2U2VkWuEet2H6scoCP70ym/769/NdYl/LkvHV9E0GDa5eqURDPTIp2Mw3Rtfyk2v+tnBXy55LeFern8d6wkGmI50QZjDlxR9DOdnCvUeFK8hwGS31ApPjeDCBme0PdEYebqmYxIBSUbQyRy+iTxA/HmbuciM6E3rv4BoCj8NZ4XgdGiWLWL2iqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by DM6PR11MB4515.namprd11.prod.outlook.com (2603:10b6:5:2a9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Thu, 17 Mar
 2022 19:22:35 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::c1c7:209:c28f:67dc]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::c1c7:209:c28f:67dc%3]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 19:22:35 +0000
From: tgamblin <trevor.gamblin@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] iptables: use nft backend with libnftnl
 PACKAGECONFIG
Date: Thu, 17 Mar 2022 15:22:27 -0400
Message-Id: <20220317192227.2203130-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0236.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::33) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6469ab5-3193-4427-2c39-08da084b7dbe
X-MS-TrafficTypeDiagnostic: DM6PR11MB4515:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB45158255791BC066990DAF599F129@DM6PR11MB4515.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JX9IZQs3foT/yMONRjVSQy+UFBrQo3M9KzKw7gnF80V+V2Fs6/5w/seBt0+1HgdkujhDI8SqhNg47KEwwlrUFb1s/qMZ/8zbuY+k41zxGDLj32otDTtxTDn9DdtITY0CikqF2U9qah+HJ6uI1Y/A0DHpcYETu/YJ/2oxw1f/gFh7KkrfAeAjVSK0Z7QJRYXE1HnNPjPyMSEu/+JKS+kyk4y1Uh+LpFvEskPiSPb0pcR9meS9GX4ue4F6Vg7sLOxkC53d+FiAHMdsRCvsM8Z0dbozktpxBGiCGgDsSohoGoirOzoNw6q2cfnC0doO7jrWcXOkpjBaOnS8FkhwglAvsv4FFsbgeG95rRtumiqp9ezbT/qlzIfgBf8lrZra43b/4CMQm9nyJpwHs/cES0nRcIvdyseI7aOzq9V9t5Ldpcq1XH43Ec5368GzUsZ521oyWgBr50LrWG9Qf4E3iboL8khR5YNRaO824LMhVuc/aLye/muzQgKjEiJfBGcWepzWye2Z+gaViJ/ogWb4wpufsm3QVFtEBvArkoTiQzrM3AbIerLTkezI7yHXBPtfd8qhzV8f465STF2aqMThUn/PFZaFvvc8OScJVVEFnzf18Z9jMLSwVuu8Y5lJ3E5ugc0Rrn5IEGapAk9/MnPSsxMDtQoefszomhgyxDSEh4UaES8NLbaYvUT4JdUhKfyIn6mNIz+DuGydu5CysuScX18KrtEr3unNmQfuzFOVZ1FsB4reIjdu2qxEPuC4blv13tqf11QT0+MwedA1K+ZZqywzNw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(66556008)(66476007)(66946007)(8676002)(186003)(26005)(1076003)(2616005)(38350700002)(38100700002)(6506007)(6486002)(8936002)(508600001)(2906002)(52116002)(6916009)(36756003)(316002)(5660300002)(6666004)(6512007)(43062005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?j6XexRLwekAG+jG5z+AbK6QdZqUQB+4mmfzrzFwIfoVJlsRyRG6XZ4f+Iyyx?=
 =?us-ascii?Q?buCzaVw1TA0dz+71bi9hPU35qDkPw54aSGmOrbTwP6sHUZO2S8piwXc/2FP6?=
 =?us-ascii?Q?KecCHACHdNuYWGwP9JWeXH+2CPS2uEHEaUt/9lkf8VlimxeXgEEPWVFC4439?=
 =?us-ascii?Q?Zehjk51poIpSQVZU8w98gCUXKR+IEDsPFN3NR9kYF/E5zNikxUnDZraUYoUd?=
 =?us-ascii?Q?Cgvk8XemVgawyKd/0ZeuUQMAZdn9Xmtn4OJ2PyEDbzwJrfdZXaI9EegcmJ8s?=
 =?us-ascii?Q?ZakeoJHKye6pRrITq/UvvCga2/nt2Ifa4xL6NLmoozybVr70NCWeglWxGdvq?=
 =?us-ascii?Q?fFZ/+mBxpqS4CIO9QNDHFS0imqH7XUqEsx2Bax3DNAKEaIT3yp3ffB0xGYmU?=
 =?us-ascii?Q?09rereNMRxjwm5qkcCX9R68BKs/KYOK0CkpsckVV7hO9vmlTnegTg6fZrRYS?=
 =?us-ascii?Q?Q5XRX/6lRHgcFpOfw8wucdz/TaHhvZBDao/1ipdMR0ToHsW9Y2NJ1Gcb9GfI?=
 =?us-ascii?Q?JTjfjphSkUkh1FvFm4k5UhujMxRKPbfnEhsxaeH2wslJd1ABzw5A3qRTF/nT?=
 =?us-ascii?Q?ec7eRjsMow2CSLAh83otPgX/rRMfxB2Vz0x8o6ivtv1Hv1ofvAZBVlcZrszY?=
 =?us-ascii?Q?uLkpWPRxKaRUU+0b8r3UCgNO85u9EJe3u2x5vUjUF/AKV6djJuNIrgaLmqw/?=
 =?us-ascii?Q?hMOoTmqMQX1AHSE1YN2SIrBR45NimUIRA1gZ5b2wV9paXWA0uiUVV9Ol8TW2?=
 =?us-ascii?Q?VxEIKgqu5zzgQqCaJlxqRnu1eWl7ZcDyQLCHziYeoYhLcek7Lu4zdp2KHoRu?=
 =?us-ascii?Q?hFQGl6XF5YzN4JBL8sk0SERjN/pfCwF4KX36v0V1wDfyzhyWnjwj48w9G5bu?=
 =?us-ascii?Q?SZJneaNuk7lRIvq2bMMJ6HEddljijHbgL/NGrl+Y30o3YB4pv46yKLv6s5Y9?=
 =?us-ascii?Q?EFMJkwMZjxqB2DT6VaIkbonL5L5YyMXVEJb4PscMDdBiLQKaCHE2ZuB1PrBb?=
 =?us-ascii?Q?pcmT8RlaCicXZAwAUcRQpyqsySxKu7l6tUNfOjW125oK+fbBa2tbOYE6caz4?=
 =?us-ascii?Q?AJ4LTi/z9/U2U7OLHfogkl55v1YD4nAyDKvPrV7Tbc/CVqFOegZGJNzG2aKl?=
 =?us-ascii?Q?3WFESJtkTPjm9wMmSirPZZ/CyY4TFYdEK7A2Ycdjh6WQhaAntFJcKDA2SjJs?=
 =?us-ascii?Q?+5lLUTopnrDxOmC/17JRF82DRUgzWiHEhd6Onv3FBa6LKIe++UA6XTGGnpT6?=
 =?us-ascii?Q?V0AzQc7MCwOEZydHLdNJrgvXTLQFqG3B/7mtMF7vhsZOt2Qtg5xg8jn8Sgch?=
 =?us-ascii?Q?XsgSlsVjTnUNrPAj2xjoLJm8332RbqTu7KXeWulqkCbactW01bAzX97PiHsT?=
 =?us-ascii?Q?SCjjgUYaCaYEC9Tp1zjkt65U8ob6rYWgWu+txUw+eX4Kb7/NV6ojE+6oO2WS?=
 =?us-ascii?Q?uMHmT5lE+U4KIA0mr6YOBovE6XlQztXUFZdFIRSZwhWiakd7+Saf4g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e6469ab5-3193-4427-2c39-08da084b7dbe
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 19:22:35.2312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 RZsU7RiTI3dXxOjrMg7h/71Y7sX6S9/mn25ZcvB+yOFLf36vOAOeWdhfnoAfqvxr2EakgHpwWAdqHiC0+OoCNW3Tm/aGul58mqUkGucma7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4515
X-Proofpoint-ORIG-GUID: 3Hdvh3yI3dTkrjoYMRY69VHXXmWiFe_5
X-Proofpoint-GUID: 3Hdvh3yI3dTkrjoYMRY69VHXXmWiFe_5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-17_07,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0 mlxscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=522 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203170109
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 19:22:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163432

Currently, when the libnftnl (part of meta-networking) PACKAGECONFIG is
enabled for iptables, both legacy and nft-based binaries are built and
installed in the image. However, the "iptables" symlink in this case
still points to xtables-legacy-multi, rather than xtables-nft-multi.
This patch adds a conditional check to replace the symlink to point to
the latter if iptables is built with libnftnl support, which is
consistent with other major distros (e.g. Fedora). The "iptables-legacy"
symlink remains present and unmodified.

Signed-off-by: tgamblin <trevor.gamblin@windriver.com>
---
 meta/recipes-extended/iptables/iptables_1.8.7.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-extended/iptables/iptables_1.8.7.bb b/meta/recipes-extended/iptables/iptables_1.8.7.bb
index 839733aaa8..3b41882841 100644
--- a/meta/recipes-extended/iptables/iptables_1.8.7.bb
+++ b/meta/recipes-extended/iptables/iptables_1.8.7.bb
@@ -66,6 +66,11 @@ do_install:append() {
             -e 's,@RULESDIR@,${IPTABLES_RULES_DIR},g' \
             ${D}${systemd_system_unitdir}/ip6tables.service
     fi
+
+    # if libnftnl is included, make the iptables symlink point to the nft-based binary by default
+    if ${@bb.utils.contains('PACKAGECONFIG', 'libnftnl', 'true', 'false', d)} ; then
+        ln -sf ${sbindir}/xtables-nft-multi ${D}${sbindir}/iptables 
+    fi
 }
 
 PACKAGES =+ "${PN}-modules ${PN}-apply"
-- 
2.35.1


