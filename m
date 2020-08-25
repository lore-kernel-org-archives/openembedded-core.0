Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.126])
 by mx.groups.io with SMTP id smtpd.web11.9874.1598346817125723582
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2020 02:13:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=J7QOpAJN;
 spf=pass (domain: prevas.dk, ip: 40.107.6.126, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A+xKQxFlNasxeTyl+pB+Ujp3p99RqPOyM6F9ArmMt+CdWeYjmrvjYuMI9AH8nYHaEEneqeMShknCgiqRGaK8WKE9R0sP+lERwVVmJYbBF+HaISxIgM7G2I1i2rdzerlqA5LKUzvwUEEBBoJax/AwBUVTe/0PFahQmp1FGESRxYGE7bAI+PPyCn075SxabHvtwL5z6ANRH2A3OIChJarohRcVrq++bYpSMr2PttnwSJk8jWZNTOZkQGev6bkSqoQcoetPhEU5b3gUZypp1g3b6DyY1jLuJPImGSsDX09HPC9ObG+HdrbxNUkKSbgloj5EtfcL0hfozWOlZPjfY0kQQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/bTdqCuIYzTUL9lSqAC6FBmRjciYGFxNB4JKc5+Iwfg=;
 b=j4pWK1IQOMs7q3WS67YI/idOFvElx2Y6DK3V+ipBGxz+GJt6xVTP/Mos4iuqKG3zgioit4HvPlqkiOMhl9Q8Z7UsM+tZQ3cw8HmSPFywuG2uQkmZBwmAZFMOMmTzNWR5Rq6OmqPjQ8zmUwhtmXi+aGXeW/n1a0smK567lIKCgxAt05qRyA/DrIlW5IuesDx4wQWJn8DLw6sDkRinWK1KRN8OzQVxbfE0fL3qH7W9/p/ACjZNeAgnLHRDoa7OvbsYxAQx/GG3sLi3URbxsgfOUZ20soku7hdGzGFJViPqDI3ojt+fGuJ2VYo0u6zICQh8r5rUyVwmUwm+cFxoQLCDrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/bTdqCuIYzTUL9lSqAC6FBmRjciYGFxNB4JKc5+Iwfg=;
 b=J7QOpAJNVz1X3cV/ps8XI57bOzYRvgABLCBHtXrJWPt1lN1sjgPMqFfCtZ3Kf7els7OJBPGcwK1i34t1fOZ9qjit3ZxExdQnVYa+ZyOKIwtVuIAk1Hi5Ma/tG73lwHVB1Okn9m5sJmjTq7459YZPa8czuzLnkJHOPJ5oHz4YYvA=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM9PR10MB3991.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Tue, 25 Aug
 2020 09:13:35 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3cfb:a3e6:dfc0:37ec]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3cfb:a3e6:dfc0:37ec%3]) with mapi id 15.20.3305.026; Tue, 25 Aug 2020
 09:13:35 +0000
To: OE Core mailing list <openembedded-core@lists.openembedded.org>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
From: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>
Subject: do_populate_lic problems
Message-ID: <5044ffcf-5959-1ada-0ae6-b351e55b4c0c@prevas.dk>
Date: Tue, 25 Aug 2020 11:13:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
X-ClientProxiedBy: AM0PR10CA0111.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::28) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.16.11.132] (81.216.59.226) by AM0PR10CA0111.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Tue, 25 Aug 2020 09:13:34 +0000
X-Originating-IP: [81.216.59.226]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 653ed9f8-e2fe-49bf-94a5-08d848d724fa
X-MS-TrafficTypeDiagnostic: AM9PR10MB3991:
X-Microsoft-Antispam-PRVS: 
	<AM9PR10MB3991CAAE61269A5AEF7BD6FE93570@AM9PR10MB3991.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zDVISRRNb0JJKj4W9BqM1QqXdwOCFreVSYwz4pLjoHp0kMebs/hBjJgbw7v+m2LFSsIW3zuuduXI6xoQaf7YjaandKAYqbR3CKX0YxDHfjXljX8uLgB+Sdr2659ibjz+nUprdIhUxjswcq0JHW/kg80/Uqs4qTKTiNyYujhNiuDjrLWsko6Lk6lmqyhr07JPf3keru1tDQ4lefNKgWt5PmkQ9W+P7ivl63/AlhMLlkwhgakHDoHnnnbdYElv9OF1zOOOPy5OpuQbFIIw+ROmqCWapW4czbrg5W0FKPI6ppMvJS7LG7x8mjlxrnBKl0LCUF/qGpD+0haaFubao4d+JfuqnVAU/WWOf4Ttn7nDjSE1+CwoMSClia1vJ4T1Q0CNDqNXj37uKo6KRG2lZjPclvZLJ/9o1mnDVHJnfaKi+M8RwazCorJDu7IW8Ms+RozkrNHC68oBl1EjpdtJnhzHLg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(376002)(366004)(346002)(136003)(39850400004)(396003)(83380400001)(110136005)(16576012)(66946007)(2906002)(8936002)(8676002)(8976002)(66556008)(66476007)(966005)(478600001)(36756003)(316002)(86362001)(7116003)(31686004)(6486002)(31696002)(16526019)(26005)(44832011)(2616005)(186003)(5660300002)(52116002)(956004)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	lMBVULZrQC4LSGWtrGjRkYkYKPCNJ1bGhPPd1EM+dOcm8OmUxnAHiuO0x/iXG9ma96u5qUSB8fU9+n/YIo7DabJjOYkWWKX6/rtXsGaVz2pM4onecF35T41CULb9fbgVFaa4cp944ZND8Nl6Jg8+pSou/KDr9AyniA/gdJQdR+GF+iXe5T4/HPYVX7ocJiEUaPUtaYJIFQ4+RT6BT/azSHFY1WyC3IfQsmiDp5jDZVu0SE1D/IgancrzHlm8ZgrmqATZlctnc70AGBJ+krRg2dqP2AowmbO+wXQt3dSTlfs4ppWsicfAQkhqnIZgAOwNY9cfjp07bC6x3CKiT1I+dOUGOKGxsPdsf7UxXkqVNGpusKu2uEFu3oexMJzWjXOcnJTZed2zdy/e2ruNjRSSTZB0nmm91xyCEKjpNoHDZgyCY67M5cSqKgsV9LiRNL7KOxSp8L0RfnEC9DdAoUG/6RFiEGUOcvcvCSLpmrfpNCJ32KEVe49xZjE6xyFin7VoLEZSYRWbnPSpXnjbd1i2KvhL72M+4To6xHoPOXS2mP5vOvOxTAbGVQ4O/OxptOPoCC6lKdGkiFLMzS21TXV7bS2PNFNtiqilj38TV5tnIPH80BQ7OXhGRWaDIMgvxITAx58cthVW1zZo5Dw/zXT0iQ==
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 653ed9f8-e2fe-49bf-94a5-08d848d724fa
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 09:13:35.0614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JispaSHPt5T2WpaWPZRRhGWcDIsDU5sixub8ejo+alZ7N+oRbQyJNDUmdnMtfIBgSv/Mq2XmzTMv4NGBHlx9qdw2hbwl29j/Mr0KG24COis=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB3991
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

There are a couple of problems with do_populate_lic, especially around
the kernel and u-boot recipes.

First, we have a race condition in kernel recipes:

addtask populate_lic after do_patch before do_build
addtask symlink_kernsrc before do_configure after do_unpack

so there's no ordering between those two tasks. I have in fact seen
do_populate_lic fail because (part of) it runs just between the two lines

            shutil.move(s, kernsrc)
            os.symlink(kernsrc, s)

WARNING: Could not copy license file /mnt/...
...
ERROR: QA Issue: ...: LIC_FILES_CHKSUM points to an invalid file:

and it's fairly easy to reproduce with a monkey-patch:

@@ -148,7 +148,9 @@ python do_symlink_kernsrc () {
             os.symlink(s, kernsrc)
         else:
             import shutil
+            import time
             shutil.move(s, kernsrc)
+            time.sleep(15)
             os.symlink(kernsrc, s)
 }

I think this could be fixed by making symlink_kernsrc run before
do_patch rather than do_configure - in fact, AFAICT, there's the exact
same lack of ordering with do_patch, it's just that nobody usually has
any .patch files for the kernel when it's maintained in git.

Second, as I've reported previously [1], creating hard-links to files in
kernel or u-boot source repositories, as do_populate_lic does, leads to
scripts/setlocalversion falsely appending a "-dirty" string. It doesn't
happen if one is building a kernel containing ff64dd485730 or a backport
of it (e.g. v5.0+, v4.19.82+) _and_ one has git >= 2.14. U-Boot hasn't
copied ff64dd485730 yet, so it can always happen for U-Boot. Since
there's no ordering between do_populate_lic and do_compile, it's not
even deterministic whether that -dirty string is appended. So while
appropriate tools and patched upstream projects will make the problem go
away, I'm wondering the hardlink optimization is really worth the
trouble it causes.

[1] https://lists.openembedded.org/g/openembedded-core/message/137702

Rasmus
