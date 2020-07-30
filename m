Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.47])
 by mx.groups.io with SMTP id smtpd.web12.3643.1596094638683329304
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2020 00:37:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=KDAwfYtf;
 spf=pass (domain: kpit.com, ip: 40.107.139.47, mailfrom: saloni.jain@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sm9N1H5DphaN2lkfJLzfqqrM++IF7SqyQQWMh/od6qQIzUZh9budnerfTxv3qYre3i1xF2afDfQ4MdX5j972wjf+dcw26MEq+i8oVIBFuzWHXxlI4xHpGEuxuSdAjFFkXPyjicXUhghjZEeQmyh5Ce/SIV+o69TkuHDDD7t+02WRgeQ/PZCrVpRhRYafs8MhlTn01091JOCDR7aAQDR/WizR/+8U9gFfR2VyB5fyMyEUZTmcNi2s3jmbHjRmqzdGXpMtzHWfsEEXFexVXfJajR3CyxEaWv5rx1isblUz5rWrOrPPkXHDZ7DXXYsJxlRVDmS731ZCWX6gAHM7roSO9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hOiFea5h83zpaqDfuMU0ScPmmqzz1sG/PJWmAO7VukQ=;
 b=UqbiBz7Z5WwvdaCb6JIzViMppjxVhoig+8QJPMCssJWIvLoTE9qOIOeAebcpyFC9KMmDrWXgYjtzuoPPd8IjHdUDDuWUYPFiYJtW5CBTinRfuog1dSNgav12nAnBYbGZZgMRMZ4Mkzw1UlE9s33ZdAbGs9VCDB1Qcb0DETVGBgYVRx7RuaHqNtxi8NBUmt26t0IsvmhKT6M6LqfGzn4LJE6VNDtKti/Ubg62xcbuPOwO6g36jKIS4OZEAk8oObtQeY3uVcFk1LouMC/IPG/8/L/k4ixXvlJRvulUvLnZBHfgj+6TkeEhGpqPF2Ot8j2mCCVfiF2EMqFLzY3kFY5jgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hOiFea5h83zpaqDfuMU0ScPmmqzz1sG/PJWmAO7VukQ=;
 b=KDAwfYtfMb0qu8TTkRM1oU685wBKRRblpEqi2teb2hIIjrL0931xVGEpmyq/j8W003IY7j7xu8EsHVovcTvOBvQ6sx67BWFiXezY72n8R5TEpyFRt7E4okqb/d5/vBO+gb70LsmaPXIEJU+aVf72TLhsfo+mvyBufNLS5odcIdo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BM1PR01MB3665.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:70::20)
 by BM1PR01MB2514.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:4b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Thu, 30 Jul
 2020 07:37:05 +0000
Received: from BM1PR01MB3665.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c872:e85a:d42f:a3f1]) by BM1PR01MB3665.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c872:e85a:d42f:a3f1%4]) with mapi id 15.20.3239.018; Thu, 30 Jul 2020
 07:37:05 +0000
From: "saloni" <saloni.jain@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	anuj.chougule@kpit.com,
	Rahul Taya <Rahul.Taya@kpit.com>
Subject: [poky][zeus][PATCH] libpcre: Add fix for CVE-2020-14155
Date: Thu, 30 Jul 2020 13:06:50 +0530
Message-Id: <1596094610-9209-1-git-send-email-Saloni.Jain@kpit.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: BM1PR01CA0080.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1::20) To BM1PR01MB3665.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:70::20)
Return-Path: Saloni.Jain@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2409:4043:2c9e:a8f5:cdad:2ca8:49de:63fc) by BM1PR01CA0080.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:1::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3239.16 via Frontend Transport; Thu, 30 Jul 2020 07:37:04 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [2409:4043:2c9e:a8f5:cdad:2ca8:49de:63fc]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 00e97d92-2f78-45d6-5d5e-08d8345b5b1c
X-MS-TrafficTypeDiagnostic: BM1PR01MB2514:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BM1PR01MB251471D09C83DE0BBD4E40BC87710@BM1PR01MB2514.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	O3iywk2jUhGE01dFqJf+r3+6/fReVt+a2d50x/EkeYBSMkz4aHzwpFhI93mMLjKSFE3EU2epW+Dd01/xDn74JMsDr8HvUn+esFHr0oTdx7cwS4OH2U7UjiHP+mAC83cnOudqYtxEs3Nx/llNvPNaIciAWerzioVYvDeh7Jxls9wM+A7zbEVzIUr8KbJOoeGo2lHiOjIHpFDiZtsuGYXmvB2VECEwsKq7iSojyJQ/lZhEj/jc6J+K+HC/LsrC6o3fCTqjHmahc/A53Bt9JPsO0PcAdLQVArWvLCGcL9dpzSI1P7r2xD3+M6eCLyIXZuekMleUnJDo09DwxxsmFWXXsLT1ZkKcQbMYNFOC5QHEHn/934NaoqCrZhw4ilrASudEkWYmqIjWWIHTXAFteCOSkCUXDNAQwton4jF6PXO1hUMswE0BVs3y8QF99u1QK0hhVYKAmQMMJIsam/MY34PHtg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BM1PR01MB3665.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(39850400004)(366004)(376002)(346002)(6486002)(86362001)(478600001)(66556008)(66476007)(66946007)(107886003)(186003)(2906002)(316002)(66574015)(69590400007)(6512007)(83380400001)(6506007)(5660300002)(8676002)(16526019)(36756003)(52116002)(4326008)(2616005)(8936002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	cfH816tk4yNO5Ege0LxxvFw/QID1AXUr2cdW7wCXYi7jq+2p16r/fu24kHw+E+Y/5tev4L16B1oF/skb3ZnjEkevcVELO7am77ivhfFlKwlVeCpZMxOGuZj9EYpQc/V/V+abPjMaVY7FdXTYRMsfUuXkgHu35gydWz7jBXCPVp9NsYMGsNqozo7lV4RvdImfykGyYBP4w6hf10Ip505+9kjGR2iQILmWW+gDl6bld+vVt5zoEf6qILAuTLR9W/aeQbUs3dkheuT7Z3Z7MztfZurBKVHW0OzlbiZlIEvEizRVQpA7uuPTM40bGEfbQ30P4lg0mA98J+2NZy6MItUT+f4I+GkxO7wSR2nqBUBLkYmdB5nH/8dk2/qhlaxSvwDfyqyPIJxfbwJeGA+tIc6tKWO5IhWtUVHYBh64kiHscWy21RTll3zw5oIRTP01+rZqsJf8bv67cFI7iQ2BG/szjUpGh2nJX3NYlVpm4sm7klX69qVFiv+M8XQ++KEjoAhFn0ruwT4g5MxeyZm+GDMKG8joO8aNSrZKfqkeJZcOcxbSHe20bhoM4U15B1+5eG0B1qqOPgGww/iLDdlixiK0rdVwDrA5nFAf0jVz1u7q2NYuMA8zOqcDk7QZ+ABly8vPgRl5eCbRZ7RL2/OTDcdjGN0igXLh0mKe9uDpHuw15fPFJKu5WNYGS87nAr09YRXXxuIC7w4cP+T4MQ/HgLs51Q==
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00e97d92-2f78-45d6-5d5e-08d8345b5b1c
X-MS-Exchange-CrossTenant-AuthSource: BM1PR01MB3665.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2020 07:37:05.1996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u5ePfCvz+Sa8Bx+nrNZ6uU/8QtkqMUHJvzrP3nAVv0zj6YaRm67gvibNNDoGnmFjByr4+dwneSJRgHvTneklqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB2514
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Rahul Taya <Rahul.Taya@kpit.com>

Added below patch in libpcre
CVE-2020-14155.patch

This patch fixes below error:
PCRE could allow a remote attacker to execute arbitrary
code on the system, caused by an integer overflow in
libpcre via a large number after (?C substring.
By sending a request with a large number, an attacker
can execute arbitrary code on the system or
cause the application to crash.

Upstream-Status: Pending

Tested-by: Rahul Taya <Rahul.Taya@kpit.com>
Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
---
 .../libpcre/libpcre/CVE-2020-14155.patch           | 40 ++++++++++++++++++=
++++
 meta/recipes-support/libpcre/libpcre_8.43.bb       |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-support/libpcre/libpcre/CVE-2020-14155.pat=
ch

diff --git a/meta/recipes-support/libpcre/libpcre/CVE-2020-14155.patch b/me=
ta/recipes-support/libpcre/libpcre/CVE-2020-14155.patch
new file mode 100644
index 0000000..d6cb9bf
--- /dev/null
+++ b/meta/recipes-support/libpcre/libpcre/CVE-2020-14155.patch
@@ -0,0 +1,40 @@
+--- pcre-8.43/pcre_compile.c    2020-07-05 22:26:25.310501521 +0530
++++ pcre-8.43/pcre_compile1.c   2020-07-05 22:30:22.254489562 +0530
+
+CVE: CVE-2020-14155
+Upstream-Status: Backport [https://vcs.pcre.org/pcre/code/trunk/pcre_compi=
le.c?view=3Dpatch&r1=3D1761&r2=3D1760&pathrev=3D1761]
+
+@@ -6,7 +6,7 @@
+ and semantics are as close as possible to those of the Perl 5 language.
+
+                        Written by Philip Hazel
+-           Copyright (c) 1997-2018 University of Cambridge
++           Copyright (c) 1997-2020 University of Cambridge
+
+ -------------------------------------------------------------------------=
----
+ Redistribution and use in source and binary forms, with or without
+@@ -7130,17 +7130,19 @@
+           int n =3D 0;
+           ptr++;
+           while(IS_DIGIT(*ptr))
++           {
+             n =3D n * 10 + *ptr++ - CHAR_0;
++            if (n > 255)
++               {
++               *errorcodeptr =3D ERR38;
++               goto FAILED;
++               }
++            }
+           if (*ptr !=3D CHAR_RIGHT_PARENTHESIS)
+             {
+             *errorcodeptr =3D ERR39;
+             goto FAILED;
+             }
+-          if (n > 255)
+-            {
+-            *errorcodeptr =3D ERR38;
+-            goto FAILED;
+-            }
+           *code++ =3D n;
+           PUT(code, 0, (int)(ptr - cd->start_pattern + 1)); /* Pattern of=
fset */
+           PUT(code, LINK_SIZE, 0);                          /* Default le=
ngth */
diff --git a/meta/recipes-support/libpcre/libpcre_8.43.bb b/meta/recipes-su=
pport/libpcre/libpcre_8.43.bb
index b97af08..60ece64 100644
--- a/meta/recipes-support/libpcre/libpcre_8.43.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.43.bb
@@ -12,6 +12,7 @@ SRC_URI =3D "https://ftp.pcre.org/pub/pcre/pcre-${PV}.tar=
.bz2 \
            file://out-of-tree.patch \
            file://run-ptest \
            file://Makefile \
+           file://CVE-2020-14155.patch \
 "

 SRC_URI[md5sum] =3D "636222e79e392c3d95dcc545f24f98c4"
--
2.7.4

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
