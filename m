Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.105])
 by mx.groups.io with SMTP id smtpd.web12.8783.1601042755530673584
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2020 07:05:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=jEodwH4z;
 spf=pass (domain: prevas.dk, ip: 40.107.3.105, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SY2SOh0HYeLhvQLHJSTbnqkcfPkYM/pK/PbOvV6H5ByFqsWrgfQVCLEA4X+RCo9NgLHNO7z2f9Eed1osa5QQoGNk2zr5YMQjwKeafA9Dk1Gwl5+hTLHyRJbtOXPrMNFl1idsms0tit/aIt0dcKoJkZQGDOIJFqiKIWWuSH+siAwPMOxiXVB8RLL9YTuwPe/iRdMptyASHUwI8SLQZO9vaV7wsiEgHj5ZXFhRWyN1vplUbbMq5BG7hG9rJ1LjRt9G8DUDjBmDqCEDcC5kvdKaG43Bjnp+4erBI/cPziE0gCgcdQz8asrVjpbnjE/4thMWFe8ZXHmynbEuVlxP990TXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P6fzhR7Tdw8Ya4kw8TJDK+EHufWVTeZSQF7+NBDZfwo=;
 b=TPIM9kSa+MwfiqoKbPNYOA7Wwo7Ro6wdFrIEdDbGhrG5PkI4X6pjSj8icm4ThnrBWAt23NMtkay9SA+rPufn+/71JmXTiVxFtZilysvfLWeHUTsQRVdaJ1dbVrgM3STs/4p5DbAvv8iGpLVqXOgwPO9J9AEeuRenFO5wVYnlKywQpZKlZHXFMPShJjPhbiPgTdvmRfkMsCWe+Vx9vhM/Ycob2KOEhsZ05Py9hnOo5ayqaQ8/JGTjkmbNq7zGa35W7y4bPWxgsib+bmsBkVAtuA2SXH6vjrXZQTEp/T5DtTUSvjXakqS2ikV7oAoh+VA+VYvFQHr9PMtSR2dnB/woCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P6fzhR7Tdw8Ya4kw8TJDK+EHufWVTeZSQF7+NBDZfwo=;
 b=jEodwH4zfaZfuDn6KXMBdOtxhBmOWQP0NN2i/r/DuiHEvZonkbQb2vcoQg5n16+8ZzyASXg7O0VLfLpLKnItciWswL47USmtJo7CMeEOzR5Rlb+l9fME5pODWK9JYAtwqIQAefkXTEf45jOsFmqOyxEA6/sQcjt2WeBg6Y12sPY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM9PR10MB4183.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Fri, 25 Sep
 2020 14:05:53 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::acf4:4f51:6c3a:8cbc]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::acf4:4f51:6c3a:8cbc%5]) with mapi id 15.20.3412.020; Fri, 25 Sep 2020
 14:05:53 +0000
From: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: parkch98@gmail.com,
	Steve Sakoman <steve@sakoman.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [PATCH v2] kernel.bbclass: ensure symlink_kernsrc task gets run even with externalsrc
Date: Fri, 25 Sep 2020 16:05:44 +0200
Message-ID: <20200925140544.13741-1-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <163723F633ECC6FD.8126@lists.openembedded.org>
References: <163723F633ECC6FD.8126@lists.openembedded.org>
X-ClientProxiedBy: BE0P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:a::16) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prevas-ravi.prevas.se (5.186.115.188) by BE0P281CA0006.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:a::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.14 via Frontend Transport; Fri, 25 Sep 2020 14:05:53 +0000
X-Mailer: git-send-email 2.23.0
X-Originating-IP: [5.186.115.188]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14c83193-f58f-4af1-675d-08d8615c1d81
X-MS-TrafficTypeDiagnostic: AM9PR10MB4183:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM9PR10MB41835A7706A17C4FB52D36CE93360@AM9PR10MB4183.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:206;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4H0ATj0yOtu4MEXAsYm1AY0F0NBGHrVzFSree8ayU9W9t/UNuS4BPs4h91y8JGZg0oL3GfotxAVY7CROhSUf5SauL6Zk64yXiQn3B8Ri609PVXDpvftGyEWJCrSSIm1ipkN7f/P3Z9CiIWyHNgDUGEZtk8ujUw5J3NpNykY/uM2tLAqy7pMtLbDxtOGw00YfHoEinRDatFJcJEm9rv7RYPXTL7hGOhGEiZfJnnP+vWSPwX1LNUnt4s+U0iY/WzCmpmhQiEahwL6tSSoHnpfq7CUccH0w3uPRLEa3RrMaUc/wLMgpksJaQfD1c1XQIpUA73WKqp9Yikf5nf7bas4g3EIJx/M/zC/KCefM8YSHjCni+s3+OMvyyUNyz9CqNfUc
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(136003)(396003)(39840400004)(346002)(376002)(366004)(44832011)(6506007)(8676002)(66946007)(6512007)(6916009)(66476007)(86362001)(54906003)(66556008)(4326008)(36756003)(1076003)(186003)(2906002)(316002)(83380400001)(6666004)(5660300002)(52116002)(107886003)(956004)(6486002)(8976002)(478600001)(2616005)(16526019)(8936002)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	qdwsX+6S4ajIgxeSaJ/0ub5l2cThHNvDXitahtqYPirsfqjG+rE9sQHvA4DpuZEHmNVgSQ/NEyxUkPd5uGKddaYE4U1ty1QnowD+przJUGJooM6dF/Ik2Ef6VEO/Gu0RQ+2rXvpmprkJuZ7GKnP2HmQaD0tNRLmcBTkqtE47TNlNSlvOfx7P+ICIJybGJZx1uPA83EdAkaeN/QxE73NdUYltMmXHouwzKIoyfxmAAYZ53W6ayQGDH+Zm2Jc9vL5qws/b60mAu7CcLSuYlI73tOZHhBhPnA9ufPjhw2HPgZZUh8bxT52nW+pCOpWKxkco9ZqAPg+nnMNTzNPtOjZHQD0/qYqOqqM29RVrY1hLV5qDag2fDTgac9FHobtr4D6t/2CtKM8wBucCqUVTtrS8tIWv6mljGOmwDNCd+MQsqt4Sk3kcOZmdjOPyQY2MPnHgXx9WyRGBrDUh3KyyQeNZZoADW4HfRRzSkD1VMTnro9b98VR1tvGBcTBOtkAWrB3xXdgOySILLNX6EAJ7qKaX0bp7elveFYPFbuf2Vt4n2tJApKneEb/63c+XfDZNGuqKTH7Wy707pplOfSP0mdGTeGT+RxVD4gin3ZNkepv8S1J76SnV0ImrGvYfooQ3o4AopY82zxV1shZ2gLqJVmg49w==
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 14c83193-f58f-4af1-675d-08d8615c1d81
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2020 14:05:53.4519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h+kL0UK2mYmFUmczrxksm2ysLmZzr9DG/p49t1kPcnFxl0AwWYv5m5HFX/lg+nd8JemL3mG4GJTWsCLG0KNSgKH4Wpx4ty5SwgdXTru+jgM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4183
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Commit c5dfc2586b41 (kernel.bbclass: run do_symlink_kernsrc before
do_patch) fixed a race between do_symlink_kernsrc and
do_populate_lic. However, I missed the fact that when
externalsrc.bbclass is in use, the do_patch task doesn't exist,
meaning that do_symlink_kernsrc now doesn't get run at all, breaking
the build.

We need this task to run regardless of whether do_patch exists or not,
so reinstate the configure->symlink_kernsrc dependency explicitly.

Fixes: c5dfc2586b41 (kernel.bbclass: run do_symlink_kernsrc before
do_patch)
Reported-by: Chanho Park <parkch98@gmail.com>

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
v2: update commit log to not say that externalsrc.bbclass is at fault
for using deltask over [noexec]. Rest of the series is dropped.

 meta/classes/kernel.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 48135b3d41..78def5bbc1 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -172,7 +172,10 @@ python do_symlink_kernsrc () {
             shutil.move(s, kernsrc)
             os.symlink(kernsrc, s)
 }
-addtask symlink_kernsrc before do_patch after do_unpack
+# do_patch is normally ordered before do_configure, but
+# externalsrc.bbclass deletes do_patch, breaking the dependency of
+# do_configure on do_symlink_kernsrc.
+addtask symlink_kernsrc before do_patch do_configure after do_unpack
=20
 inherit kernel-arch deploy
=20
--=20
2.23.0

