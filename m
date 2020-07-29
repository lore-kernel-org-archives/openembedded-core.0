Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.71])
 by mx.groups.io with SMTP id smtpd.web11.5187.1596027361312801501
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2020 05:56:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=m4holGaL;
 spf=pass (domain: kpit.com, ip: 40.107.139.71, mailfrom: saloni.jain@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gwuQOKW3eur1lzocvUryVntNemDChUKcOnHmdES++zCEXwCa6fehJYFlcaEoxP7QMt8OGyy6DmTAuuMcq9tJ/77oCAIsTtwHd6J+ewL2oNkloyOU+vbcVWxLr2y0QYhfvD22xnr1foq/S5al3R8XCVNEpInYESwKASi4jFDQQGYUWuLM7vHpExPwkKkAq3T7jAZb2uzNNfCrMEHGLeojyUPZmq+iNbIi9Ok5ZAO3sutQS7/wiQOQrSFfhyxNkVsZf/UtGbRskGB+iyqD2BXYmGW6wFkt49pHcqg63zeTPU1T/2lhc/HDFP5w2ZmlDCnbFERzaUj9pdgQfveCx+SSCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wtwUqfRKsiOlyBIA/Q2Vvuvnt/9yE4xnm2/5hEo1nm0=;
 b=fUDMdUkqMzA2cevWpXlMUfQSbEOE64kifluxh09GR674osk+pmQK2iSdEwTzUwUUtcq8cHi9aIV8woCPv4dYvOnoZKb5EHc6JITqnSVae3MUwMjecEOhY/fqNxn5GKwAnDiqAc6aB9DEk1ff8yJbPjppHQsE9lRWUI7SoRxAc50x8yfO83KJrHkGMZzDCe9pqWc8XXb2Q3rfJ7alhdOP94Dusi4yt5/zJ8RYv5y4nbhRM+PcxHJYfGrYGg6QlsbOnxRH1xS9cGmsrXQmo7BvS5n5uBbkze+g0sT47gBTDAEk6sR9l9VMX7VhDpH1Bb6On0C3emkhWerKE+PVq5MVew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wtwUqfRKsiOlyBIA/Q2Vvuvnt/9yE4xnm2/5hEo1nm0=;
 b=m4holGaLHsm5zfDL8KbiBCCwEkjoMGK6+UJMTwWY0Rqa2/zPmpvwYq5Kv7moZjXW/7qui1kDDu0lSeml/7oN/KF1UdT4EH6AmPfKr1RPgDTh/ukvxXEMvjKhJd+itQgA6OVVtrNYzs37jqyh9yHkcwDx064cO6F9flE6BHCAn9A=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BM1PR01MB3665.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:70::20)
 by BM1PR01MB3665.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:70::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Wed, 29 Jul
 2020 12:55:57 +0000
Received: from BM1PR01MB3665.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c872:e85a:d42f:a3f1]) by BM1PR01MB3665.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c872:e85a:d42f:a3f1%4]) with mapi id 15.20.3216.033; Wed, 29 Jul 2020
 12:55:57 +0000
From: "saloni" <saloni.jain@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	anuj.chougule@kpit.com,
	Rahul Taya <Rahul.Taya@kpit.com>
Subject: [poky][zeus][PATCH] libpcre: Add fix for CVE-2020-14155
Date: Wed, 29 Jul 2020 18:25:45 +0530
Message-Id: <1596027345-16076-1-git-send-email-Saloni.Jain@kpit.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: BM1PR01CA0105.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00::21)
 To BM1PR01MB3665.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:70::20)
Return-Path: Saloni.Jain@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2409:4043:2c9e:a8f5:68da:801b:6ffa:8a47) by BM1PR01CA0105.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3239.16 via Frontend Transport; Wed, 29 Jul 2020 12:55:56 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [2409:4043:2c9e:a8f5:68da:801b:6ffa:8a47]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bff6c720-a9c1-4bf7-a720-08d833bebc0f
X-MS-TrafficTypeDiagnostic: BM1PR01MB3665:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BM1PR01MB36651E9B60AACC8915436D4687700@BM1PR01MB3665.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CpPLL4aK8O7sOZoX52Uja02OlTVTl/wgSJ4wszQffoeODYLXxYoCp1PZLBuj06J5y1IgsLFThnuxoHNTc5nGVRukmFnxref4TGRBBCubqSg4qBKLF2A6mIxW31e9kJ/jSA2dYyJXjQzCidUjd88ZK7dHu30sTQJ2VmclQA1hSAY0XhyZjYBwMQFdZchZ06Mbr1LmHS8Q4tIgwml99695JMGImDJCehADZhuViOx8u+Js/SGaHdSi1LYay+6jEkfQrGKT6FU8Ws/pJLi2yLBcq3vN2d/7BxD+nHNkk2DYuAdHs5ggGFKYgPgqfb8wGhPi7UfUDIAwC4QnxkhV0zEjidIjJnROK3StfwIF+OHl7u0/Oyb6o2Tvw54+beec7NSJ4epgZPLIGz+KVbhBndb7fK2+61hiSUZJLE+hlVa31VrXW0EAW/oQCKiRxUGH2qtS/kaUE42ZJMSalj0wE7ljhQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BM1PR01MB3665.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(39850400004)(346002)(136003)(376002)(396003)(52116002)(6486002)(2906002)(66574015)(478600001)(86362001)(316002)(6506007)(83380400001)(6666004)(36756003)(8936002)(6512007)(5660300002)(66946007)(4326008)(69590400007)(8676002)(16526019)(186003)(107886003)(2616005)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	gn9ZEh+IBgg7YjZHYFjE3xK2pr992/mumIALLB1Ie9YqZjIdSSiE0IDTzNKL6D3WWPLy34zGx3xoOH8o2R1e0vA3NmyyrYE3v1/uRdClOjgscorCYAd+7INZbas0DYFPPfGKNWfEjGG6PR8bD1clDunlG50/HN/H7Fmpvg19wcmNc6Y4CfyOJjTEkBCikssa3aXMZk4I5zTapwIBLcwkxBxLvDUSTOthc3cuPR4BQiXQ9xzZvBaIKosIdCFQpc2nY2ckUsvZEQh/vQ7wRRf3Hk5A8p7zHaK/IA8+oxbKRHRvj+xxHqUZem9b/r1t5CpRlVAiFznDG6OodrUYpogUQnSEX9Dbqx5Fk7IyvB5yJxDHTPXeMMWnZUONI40qYM61naUS9jlS08JXL4jb2nq6Q6gCLNhyFZJOzW+rm60HTuLCPd5Ne/AoyrLt/cV5djLDDNfb4oMONtcQ5DbBZ8SG7pfb4zGo2/lRlM2tLM0vt6hYAgvXr36sJJYvQ9HnOwFoGC8fuR7IR/aPiqSeaEpI6iRAec4vx1fW1+M68Yc90dpRjnP3H2RW2FZBtAJ7YFiG
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bff6c720-a9c1-4bf7-a720-08d833bebc0f
X-MS-Exchange-CrossTenant-AuthSource: BM1PR01MB3665.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2020 12:55:56.8488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sYclWuPC3CBd4mEHZBlnFS5GfNbHaEOb734sd39QQ5cuUFgjSgCdbJvX9fAQ8pluC+bxDl9/ss/q98HGI9w+lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB3665
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
 meta/recipes-support/libpcre/libpcre_8.44.bb       |  3 +-
 2 files changed, 42 insertions(+), 1 deletion(-)
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
diff --git a/meta/recipes-support/libpcre/libpcre_8.44.bb b/meta/recipes-su=
pport/libpcre/libpcre_8.44.bb
index e5471e8..81b38bb 100644
--- a/meta/recipes-support/libpcre/libpcre_8.44.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.44.bb
@@ -11,7 +11,8 @@ SRC_URI =3D "https://ftp.pcre.org/pub/pcre/pcre-${PV}.tar=
.bz2 \
            file://fix-pcre-name-collision.patch \
            file://run-ptest \
            file://Makefile \
-           "
+           file://CVE-2020-14155.patch \
+"

 SRC_URI[md5sum] =3D "cf7326204cc46c755b5b2608033d9d24"
 SRC_URI[sha256sum] =3D "19108658b23b3ec5058edc9f66ac545ea19f9537234be1ec62=
b714c84399366d"
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
