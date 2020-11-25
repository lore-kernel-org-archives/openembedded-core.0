Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.42])
 by mx.groups.io with SMTP id smtpd.web09.3238.1606285253354225001
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2020 22:20:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=IaRki9WX;
 spf=pass (domain: windriver.com, ip: 40.107.220.42, mailfrom: jiping.ma2@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AQJOxktdgYoWTwuUFgJNWce+GZLSqEFt069wipxo0d0pIEZv36WhoW9qgfeA44IoZ96eOt0yt5ffUYDe6lbVTFv+6L1lQvh31a7jJ3qzphPKYeCEBeQ3D7h9v58MXYv4l8e0gAh+z1JbxLJq0t6A4X8KApLOGV+BaHnYEkiY2TmFMlCty8aq5u24GYy02Ao6+BYxlBEr1lRxe1OVCbGVpk4f8EsKKXU9ZeF0/iibqhtZT8SLm96R979UHxTZ0KO0OFW25R4/lg6MOs845DNDsa9hzHv3jPzLEP1bTsWCM212DtZ7Hc6AJWYwM7Q98llVSylW0Gx1Yl0GMPtA8ULrYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afsRRblJ84bDvTGnAu6eKalxY0G5cExpXESyCNVUo/0=;
 b=WOifUUhe+O3sX4NHwUdak624IqMWgVsYSXtwOyo5PKfCbS6vIKsv1S3bUSvwouRDp7G59IlmmpmYBWxbTaN9pvOh8bKiLKjcd9z9b04DA24Gn6wNWcdjt6iq2fgO6LDK0lx0S/tbv7v+g3C/IR9oAl+DgXbx1XUM3C/YlK0BFLNnCT67PHjTP+R0lZjrzxE9jbW1696tEOtR09chEK02h6T+0qbL61y7K6hISMnDFYqpHy0a6OzTSnV6DEW385+2nEqbJgEecfXQHJ8O/l3SSh3fTNFEBkyGc/VRketyMiZTtboE5B08tBIfuErCctO5UyWnuLNYnhDnr8ntR2O2Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afsRRblJ84bDvTGnAu6eKalxY0G5cExpXESyCNVUo/0=;
 b=IaRki9WXBbYrox/CPVWWvqZgK8f7wZJ0Ip+OvYN6vXXZGqhh/UwnlFHzpKQPWyXULF+ZF7JZc305dD5oy2uTTzcsdYW6Bmvi1SNnPbWVWon+24xJblOWzTHsGJd8QEBQaXYscEBLB+hABhL5cmUDejkWWK0eLe+HVbPrC483V4Y=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB2747.namprd11.prod.outlook.com (2603:10b6:5:c6::22) by
 DM6PR11MB2585.namprd11.prod.outlook.com (2603:10b6:5:ce::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.22; Wed, 25 Nov 2020 06:20:52 +0000
Received: from DM6PR11MB2747.namprd11.prod.outlook.com
 ([fe80::dd9a:8caa:5d02:f349]) by DM6PR11MB2747.namprd11.prod.outlook.com
 ([fe80::dd9a:8caa:5d02:f349%7]) with mapi id 15.20.3589.025; Wed, 25 Nov 2020
 06:20:52 +0000
From: "Jiping Ma" <jiping.ma2@windriver.com>
To: openembedded-core@lists.openembedded.org,
	jiping.ma2@windriver.com
Subject: [oe][master][PATCH] packagegroup-cross-canadian: repackage when multilibs gcc gdb binutils changes
Date: Wed, 25 Nov 2020 14:19:57 +0800
Message-Id: <1606285197-79282-1-git-send-email-jiping.ma2@windriver.com>
X-Mailer: git-send-email 1.9.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: YT1PR01CA0126.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::35) To DM6PR11MB2747.namprd11.prod.outlook.com
 (2603:10b6:5:c6::22)
Return-Path: jiping.ma2@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpggp2.wrs.com (60.247.85.82) by YT1PR01CA0126.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3611.20 via Frontend Transport; Wed, 25 Nov 2020 06:20:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 038c0a65-e80b-4153-6b17-08d8910a41e7
X-MS-TrafficTypeDiagnostic: DM6PR11MB2585:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB25854B3B56A833B189B02E8ED8FA0@DM6PR11MB2585.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lZOwpL/R64V8W7Jm1LjAHACnOJZaxYlz7leS3f9c+v4BSVtz5KWNYLNdQ+YzYrlQeWdtFal9eszLijxWHqRXpeCiNs+J5noxLLV89l/1ND+f0vbDdSX4PhGAEGQ/W0xS71c5+83WW/QP04BfvCrNmr7vIHkIvnBOn2dREcTG9Mbe3E5fA5Ldv0vJUANjlcK5q9EefSiUCjkpJUCS4InJa4YdUIeRfeca/btGLzK8VNQREr2fiOdnJ6RFnJMymOqYbVOKCdOWF47Rarwa21A9cLF0uPU+m15xX9KEAQaNrYB03RI7+zoxZ88PLEPAkVbp
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2747.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(366004)(346002)(136003)(396003)(6486002)(956004)(5660300002)(86362001)(66946007)(6512007)(66556008)(2616005)(316002)(66476007)(52116002)(36756003)(16526019)(186003)(2906002)(6506007)(83380400001)(26005)(478600001)(8936002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?g0AgP/8fywZNR/9qUll6pz9qBO4lpyWtflv4iGhwoBdIxw2boynl6tBVnMgy?=
 =?us-ascii?Q?lQS6cZJ/vEYQycejqR+FEddSkVWHICbzS90MoiFTpqxCgpra34EUXfEXx/aP?=
 =?us-ascii?Q?o0EzHvo6ttCYG86lCbKWkahSf+DADUH48ngbjCMnm4Z2/CtDzoNkS6PCj4MH?=
 =?us-ascii?Q?D9w7rVDS9YDIi2MgBF/Gjy+3L9MY3V0g0SeXrx0CUwdVEE/SPLYGOrewp3nq?=
 =?us-ascii?Q?UT67i9jaOOous5RRfcLahfoYOUqzE22If1/7GluI08cOdtg9WGZEws7M4tJu?=
 =?us-ascii?Q?7sddoyfVikkKfU+ToDpvf31csmYLYbaAWrc/du+ZzRp/Us63USR7tvehHCRN?=
 =?us-ascii?Q?/+pxooNZ+4bNNl4uSGudIHqcD7U/fayIUrjuYwE260IGoj/9V61J+9e91zTN?=
 =?us-ascii?Q?VPjKwxI2Zj4LToMrQmXnUbcr38fonKaVSKlVEKAdbx4ZrCR1V5OeHVR57nnZ?=
 =?us-ascii?Q?HhAbLNR52wfT7t3cArx59op4nRzwQSgpEBLu0QLTpOC0T/ButckEbTpgnSbG?=
 =?us-ascii?Q?vOirTvNXJnVer27eVx1o7M+EeHCPXISxX31LCIz+JDTBpMkIRnLwl0V7+1Mg?=
 =?us-ascii?Q?Vauh3JrSu26BdHFzt/Uu1Pq2/Lx1c6eMwOfFaHF5LQreOfsqcJG4TULrFfPv?=
 =?us-ascii?Q?sYVqQ6eigjYqd6bLtDSy5Ed4HFLQVVj8cguXDOldoxauTMxpO3VQXg6rDfkr?=
 =?us-ascii?Q?CaZS/4Wt9whLsVdCdCivJLGFxHdj3CLAL6N7YqGCS39UcMi4myN/VWcOa3tt?=
 =?us-ascii?Q?7b88gZhkhJ8/VIddw72dhVt6q/sSDBHQiQEBxq53jkXps2xArkG6iUBIbdXY?=
 =?us-ascii?Q?yLguxogoQfwfiZFLUj34U7Ic/6Kv54Z67ACP08a5Mdu/b0X9fjJdZyvNrjrs?=
 =?us-ascii?Q?IvXW7/RN7QXrZDMqFjgbVvws5RPTISbOk7ZiCGPzGbx4nVJbWbnHoaGuaiXI?=
 =?us-ascii?Q?vckUw9H4mKZWiPOLhWzF1InMPBnXL58C4KuRhA9Bozk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 038c0a65-e80b-4153-6b17-08d8910a41e7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2747.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2020 06:20:51.8908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9w6TMN4AkU+0eaj5JuEyHYWvNxmB0XhJlBTliIJNzWN+TAD4x6cxeYvb93eDrx5QPubMOA7yn7r90HIzs3wMR73SYLjOwid5oXEOdgRDKM4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2585
Content-Type: text/plain

Signed-off-by: Jiping Ma <jiping.ma2@windriver.com>
---
 .../packagegroups/packagegroup-cross-canadian.bb  | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
index 3b430c0814..b6b3e5235f 100644
--- a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
@@ -17,8 +17,13 @@ RDEPENDS_${PN} = "\
     meta-environment-${MACHINE} \
     "
 
-# When TUNE_ARCH changes but MACHINE does not (for example when a machine definition is updated), 
-# cross-canadian.bbclass prevents variable dependency propagation to TRANSLATED_TARGET_ARCH
-# This will result in erroneous reuse of previous sstate packages. The following line
-# establishes a direct dependency instead.
-do_package[vardeps] += "TUNE_ARCH"
+# When TUNE_ARCH, GCC, GDB, BINUTILS changes but MACHINE does not (for example when a machine 
+# definition is updated), cross-canadian.bbclass prevents variable dependency propagation to 
+# TRANSLATED_TARGET_ARCH This will result in erroneous reuse of previous sstate packages. The
+# following line establishes a direct dependency instead.
+do_package[vardeps] += "\
+    ${@all_multilib_tune_values(d, 'BINUTILS')} \
+    ${@all_multilib_tune_values(d, 'GDB')} \
+    ${@all_multilib_tune_values(d, 'GCC')} \
+    TUNE_ARCH \
+    "
-- 
2.23.0

