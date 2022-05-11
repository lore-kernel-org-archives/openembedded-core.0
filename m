Return-Path: <akash.hadke@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E547C433FE
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 14:37:18 +0000 (UTC)
Received: from IND01-MA1-obe.outbound.protection.outlook.com
 (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.59])
 by mx.groups.io with SMTP id smtpd.web09.141.1652279834107446530
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 07:37:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=F/YVDwk3;
 spf=pass (domain: kpit.com, ip: 40.107.138.59,
 mailfrom: akash.hadke@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MVCrgo3CIj7wv7Jr0bNetq0mfgIRVOgC/a2b8kBwoiRVlJL48QKuJ8J4Xn4JUS9TM3HLZxRquqZKQMvHyR6UpAQozJJ3RLIlAWbzUT17TaXBmHxFyAX3HNQLKOvmqiJj4/MtgcqXGwXSBHznpcqVy8mi69ltepNwh3GmlZ4OgjzcxPt1gfRFNvrdIybn+mCbkhJ2bbX0NWVGC7DY6gbuudPF7/FaWO6rwFcknl1u++Z/wwAlrFoRJANtCO3LO44FbLcSXNO2yo7oAdnX5BZBGgCIoKvO5mh5zejj6iXLKGS0U0hq/i3aw91SMSnowBNGGT2/yQL5dlB8O4sQcYlKaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JBXM3+3dDgd0QFGnom4igGnltCowje91n0/e1Xe1r6o=;
 b=Mi32goxlp2agepDy65VRZWaLzjk3fKEM10zFGEvdCyjbzuCC8wfB3syifboBgFoyB4AVXVv7B2lg4h7srf3gqjMkNNIkRhWyy7fITOeiEKcPjr7liPv9PNtlqSwXJ/+8vLGbulvwUwfEh0FrKhdIAMRFVgKXpuLQOyxDJxoZrd63iCYOut5CNPjMl2JvNLgSwpJdfzbgMbEMtXxMmbvWcs8NS7oZJCEJ+242nCVC287kXboj0HbCtRaA7P5DdJza+3K77W4enAp9eEqwIOgO8pIkcg0MGj8gdzqyAhVzAubSaRqfaoo6JG/fYc3x0JT5HmLICstYXPRkm/J3d6i8wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JBXM3+3dDgd0QFGnom4igGnltCowje91n0/e1Xe1r6o=;
 b=F/YVDwk3Dpg2dxwCpAYsGL4fRYupakXVQo5dk++s2iDteTfSwlmObBsGPhbx4vkuNdQex/7XXfwzCf+/bQvb3F7mleWPDqworJMXijC64Y74QX+54B1d5ecCM9jKnopyXbthYHartAkXxYL9Y9C5NIVWw7//6tJMZt1YrUznbqE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:89::13)
 by MA1PR01MB2187.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:37::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Wed, 11 May
 2022 14:37:07 +0000
Received: from PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8119:8287:2cf2:7125]) by PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8119:8287:2cf2:7125%6]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 14:37:07 +0000
From: Akash Hadke <akash.hadke@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: ranjitsinh.rathod@kpit.com,
	Akash Hadke <hadkeakash4@gmail.com>
Subject: [poky][master][PATCH 3/3] cve_export.py: Add new selftest for
 cve-export.bbclass
Date: Wed, 11 May 2022 16:36:13 +0200
Message-Id: <20220511143613.25002-3-akash.hadke@kpit.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220511143613.25002-1-akash.hadke@kpit.com>
References: <20220511143613.25002-1-akash.hadke@kpit.com>
Content-Type: text/plain
X-ClientProxiedBy: AM6P193CA0073.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::14) To PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:89::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db715d7a-c283-4138-8011-08da335bb909
X-MS-TrafficTypeDiagnostic: MA1PR01MB2187:EE_
X-Microsoft-Antispam-PRVS: 
	<MA1PR01MB2187073E7667B7A3C1EDA3E48EC89@MA1PR01MB2187.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1JB3ZIW1sr++d3gSiptH/hCpU4RVPO11zfpc6ebcwimRre37LDDVLmuK5NkGfgMTLufg2M+nWZkpNZFN4ifigqNC0ff91Z4mn/oG+hwFBLAYNvCogUmAFWv/QvNi8jeIkDhIWqWJesGh7jhtBJUcrzEyg8DU6EcybfCGEwjNMDfuf+5bAKHvKWmK3Z60+UrErcMBO5yH5Te6mAu4Hb6qjKW/Ak49DE/QkWRi+j36qabhdssH1qLqtFBLzPB65tNLye49Ogdb/yACFOkEEppBleMJiCxNmp5kIvOzCZJvBdhQDXYIz7Yi7Y2bf9zvtVlz1gHVSAR158dWb6g+hDTYf0V2v+DavJKAfLIr2XVIaUBqnkELayaE2eSSLIMlO6qOwYhBMXXweDzCjB1K9HvqHuGQRAtzysjoszDningdJZ3RPzqY7SH/w5ZkCVUIzKv7V1V6zv7Mo8BN8NUDb7SfZe9vR9IsOz1PdA+FJu5h5CM5rWCm2mDbDZlXq65QRuElj9/LwCEKHb6X50uED5C2x54iZL4fzPO85ZuqsPMHD8tF1aTvxmJBNoXG1R+MIDnXxehGG16A/IUJxfjsUb9kysfKGWcG3x6SaKmHZ/YiCLE1LahJ5XPZfgTFVoU1yAjDxtEjWFr8fix93bu7lgfSXdQl1tBpr8Na9OF3G5KGC69JCto3wYgnwA8a5zUPSk0Vq8kqSAAKH930RvZK74Twrw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(38100700002)(2616005)(6512007)(4326008)(36756003)(6916009)(8676002)(186003)(1076003)(316002)(66556008)(66476007)(66946007)(6666004)(508600001)(86362001)(6506007)(5660300002)(2906002)(8936002)(6486002)(38350700002)(52116002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yqQGtvtTuHYcxWLzcOUR3znq05rWt8rrgdnOB9SqjlpeVYZfsNE3jgJKTquH?=
 =?us-ascii?Q?69gQa68XWzjtxLa37yzFTn3fMusVEqWJdOkLHviJYR+WrGsLbd2idAD/JR9+?=
 =?us-ascii?Q?qq9lejZvgPBTkWlRtLugNvDWIMRJl6bwlaypIEAiKU7icgVOFmuMT40S/n+o?=
 =?us-ascii?Q?gIM6KaoWIGvhEc4nRdqJA7XYmTQgT9SwNWytxJ//HobOncpGtc8d6upJp6qt?=
 =?us-ascii?Q?VFEsswvlZ9R17C1APU5pQ5HpQwtS5mUpIpSW9rFonM+VyYdpgje5/rm4k9Zr?=
 =?us-ascii?Q?mz+t7qno2UIc59URkEAWOfcVPkXRzoCLZi+I1cQJkQfNykfEYzc+YRN4l5DH?=
 =?us-ascii?Q?iurHLXlO9XPsopQQ0qc/o5OeIWtjXN+CO8HM8h6+yxkCJiEkgXFNiq3udxdB?=
 =?us-ascii?Q?5ldIvAU+Nzlw+WQDW7NXbETQAW/al7PwBuaqUa7t+F001DwUS4t44ul1Gss3?=
 =?us-ascii?Q?bJ2q4Qw7WGTgQUwwq72e+ejj1bac5AcpnhcnE/YdOeZznEt/MaC6kIvM9W4w?=
 =?us-ascii?Q?W2DX5h1dAkz742HR/+5ZWov17jDrCW5FStCq+beask+ZJV/K3l0FrEL1UB+j?=
 =?us-ascii?Q?8q9ITispA1BkifL6/zwOsZlTnWJ0u6KfNS1ecC+D51fFHPabF+rH+nNDlxkp?=
 =?us-ascii?Q?hEdsPZMSD800MbWNiRjNZgED8EhoGDCapcVaXTsS9f8XTmvGe86i5hcH6A9N?=
 =?us-ascii?Q?vsaSoCwH19QkAo7eKE4ivAB/mINk1HIT074tILAiLRyh8fb8RUse46hEzUaW?=
 =?us-ascii?Q?BkO5vO573m+KipTELhzkCcLIj58zMbRKVCKCu6SA9q8N56iomB+c86vEnkgU?=
 =?us-ascii?Q?TVnxNG9BlN39wZ13V3qqT2eOjpxw4cgzT+GA7iKsYqgXt7lfUt5xqHDxtDPC?=
 =?us-ascii?Q?Kz7yIwTlZwWHNZfr16C3Ez5FrZSrDtx7dwBrRIo0aifZmeW7Nexv4jlRihZ3?=
 =?us-ascii?Q?t5X2nT8n/871HvEUW6vt+dNrFrO8fC/DfywX1Lbg5XEqZ1/JdznWdghUag4t?=
 =?us-ascii?Q?uqtlg0NfXtJ6XZBCgGv3JH4tu0e8t++KVg+rxL5c4c3iWEP3Q4KWyqmT8HIg?=
 =?us-ascii?Q?jmvnFkIZoIKp9T3CyKU1aBYZKUdpXKE4DEmvIw/22B9stjzUuofvhU7yoms9?=
 =?us-ascii?Q?L01EuYyiBYPUdvOL18RQGVFGo/RwlgyMxHdvnEfYtI1IGgvBcWhtkg2WrfPz?=
 =?us-ascii?Q?2hgLDLERbW9Y4/i86YBOXFQWXNpDgEXuZtoo0lc/lOwoi3dGzzbqPZZYAY1X?=
 =?us-ascii?Q?i6JERzrKyCleoEwC0dtC8RJeLAa1L+z7pkye58Jg7fEIlLJCn7YrXEtgz46e?=
 =?us-ascii?Q?KQ9L8pEG5bzH0gHw7J++V7UmI5DgEzIdgV5HecT8xIWxuT9E31bUOtTpKYIe?=
 =?us-ascii?Q?anhmWZ/t3pR1HudKVxHIz4vRBGtDoTltKBLhVhw4MTQskBEVuhqzJpIJADT4?=
 =?us-ascii?Q?v507/BsIAA4uKBqdEBIC5mEtlXGs5mMh1BH1trz4S3B53AoS5MP0wCdQ5au/?=
 =?us-ascii?Q?jnhrD6bIOPi9hJoFDiosf9zHgO590Zzmyoy737X14FnV45J8sz/hWg92KYXz?=
 =?us-ascii?Q?q1/ryBkJnAGWE9ptUfKliwAAX2dUHqnB62jFMm/ujoePsN0ry8OEuM2PGeKB?=
 =?us-ascii?Q?Cc6tHe4orAp/HO0u5Aeri48ihIyzDBdSRvpmA5ZqK+5M4/AAQLHGkpzMpbHe?=
 =?us-ascii?Q?2Ju9CG349KsYrFt5ttPj92V3KtzXcyt0pDBOyvw6kIpj0vN2p0BmS70Ho8uR?=
 =?us-ascii?Q?BCLpuU1dTA=3D=3D?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 db715d7a-c283-4138-8011-08da335bb909
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 14:37:06.8450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 vGDYZ2XmB/Vz+1PNGO21NFLgkfvfeo7p/7qvdALMKnSAN7/xM8XMVMlIG3xTxhcozeJdtiOo0/SdGYIb+E5wMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA1PR01MB2187
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 14:37:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165501

This test compares values of variables CVE_CHECK_IGNORE with
CVE_IGNORED that is exported from cve-export.bbclass

Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
Signed-off-by: Akash Hadke <hadkeakash4@gmail.com>
---
 meta/lib/oeqa/selftest/cases/cve_export.py | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/cve_export.py

diff --git a/meta/lib/oeqa/selftest/cases/cve_export.py b/meta/lib/oeqa/selftest/cases/cve_export.py
new file mode 100644
index 0000000000..7c7fd07957
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/cve_export.py
@@ -0,0 +1,24 @@
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake, get_bb_var
+from oe.cve_check import get_ignored_cves
+
+class CveExportTest (OESelftestTestCase):
+
+    def test_ignored_cves(self):
+        """
+        This test compares the values of variables CVE_CHECK_IGNORE with
+        CVE_IGNORED that is exported from cve-export.bbclass
+        """
+        target = 'unzip'
+        feature = 'INHERIT += "cve-export"\n'
+        feature += 'require conf/distro/include/cve-extra-exclusions.inc'
+        self.write_config(feature)
+
+        res = bitbake("%s -c fetch" % target, ignore_status=True)
+        self.assertEqual(res.status, 0, "\nCouldn't build.\nbitbake output %s" % res.output)
+
+        paths = get_bb_var('PATH', target).split(':')
+        cves = get_bb_var('CVE_CHECK_IGNORE', target).split()
+        final_cve = get_ignored_cves(paths, cves)
+        ignore_cves_from_exported_variable = get_bb_var('CVE_IGNORED', target)
+        self.assertEqual(final_cve, ignore_cves_from_exported_variable.strip(), "Ignored CVEs are not matching")
-- 
2.17.1


