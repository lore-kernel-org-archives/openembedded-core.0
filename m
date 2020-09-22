Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.120])
 by mx.groups.io with SMTP id smtpd.web12.952.1600787728540473183
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2020 08:15:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=In9cR0Tn;
 spf=pass (domain: prevas.dk, ip: 40.107.8.120, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P0lEqcDaxE0NkG2neyNl3YErf8jlTtxFeglc1Cr+m00TEFj0p0JWkCtlQtH9J8FdHjemjp3SQYzLQSGhdehuSBmwoGAIATNWBJnv2AsGghEZ0Zp0zBRi/CheiUjv8HB/WPwaZtX6zaJ/qEg/3i8pJcVRpImVZ8vx8KMNXM9XOUwkiUnKNE8tNjV/jMrO8gsiQGqUlXriwjQdQO+QPG6wu15IRPVWRdC91VrtVmNlOCeqViesK5CMrx8L4m/1nY6RUz3JHcZkc9o0wRwammbyJXPPi58Z8ejAfs1gA1orpyLUOSUcRp4kVH4Iwb3c1akqjsOiELJlq+DLcZLNgDIMGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eVvOsZuCj/YZKkA54iWl9/y6YBwMTeMqvX56bFfZ2oI=;
 b=Bc1aP1Kk5Q1ikaDR5uz7Q5/FEtPIh1qYpSfbL6ZwlrPQx++aZez4FD0ecuy5Aot5PN7w0Crk5B3Q0trUbESQXPmwsmE2HApw7ckNaXYckx0zvqUD1/3Pb8FSSq8Wg24A8G5b71SGZQnfj4Hy2ZAPbq1XRWzXynY/nTmgHivuHj6NiO1t8YvmurzejcHKY5ccInNbzjp9dn0Z0eN+/pvTCiFCgfKERUoyQuIf3F4UtCACBaVQ7dBCDQLrWENC2czY2bZuuG4uvVp4/l+ZIxRq4dpC+L0mIxPnxYu1eg2/0tZ9aOFwK1L8NkVmy8q9Q/LtlEYaP1fEO/CvTALWLE8aSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eVvOsZuCj/YZKkA54iWl9/y6YBwMTeMqvX56bFfZ2oI=;
 b=In9cR0Tn7ElsUoVoULGYcpdX4OMqufxCM5UxGZWHnj3eyMFDo6lzIloPUnPjR5dY05Fp3VuPijSFIhjepF6mR3D6lsyzz4b2DRED3r83CCOxnMigaahD3ODVVIREwF+l1YPOg5+cSDdEynX26EcW0029k30lABa10vkVb/zR2Ns=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM0PR10MB3441.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Tue, 22 Sep
 2020 15:15:25 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::19ee:8c9b:b371:abb2]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::19ee:8c9b:b371:abb2%2]) with mapi id 15.20.3391.027; Tue, 22 Sep 2020
 15:15:25 +0000
From: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: parkch98@gmail.com,
	Steve Sakoman <steve@sakoman.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [RFC PATCH 0/4] fix externalsrc task dependency issues
Date: Tue, 22 Sep 2020 17:15:14 +0200
Message-ID: <20200922151518.1615-1-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.23.0
X-ClientProxiedBy: AM0PR01CA0131.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::36) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prevas-ravi.prevas.se (81.216.59.226) by AM0PR01CA0131.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14 via Frontend Transport; Tue, 22 Sep 2020 15:15:25 +0000
X-Mailer: git-send-email 2.23.0
X-Originating-IP: [81.216.59.226]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 002bf971-1e52-416a-b326-08d85f0a5530
X-MS-TrafficTypeDiagnostic: AM0PR10MB3441:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR10MB3441C4284D4A5C2BC673F69B933B0@AM0PR10MB3441.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zRpO1es2YrOZeXKaLksrSRfA5hfzU3DFsW1jxoplHE10cDTKzJfIeujczZKoPF4KAHpxLoE8Oi7Gg4e0YvEt5gYJIoTIUi1i2dAVzJn27EGuT+YYryrmjTbavCZD6CJ6R6BhUXkWwcI4f8LU+/pd+OAw0pZ20kPGW6AC95x4Hr6/x6XVxxnxVgDqqWIQYOXNeJlmi6Lm97ToAc95MlhmAj1f1ZFo7TPdhziUsZ8KJNnsoZUGxBm8darGNbBIm4S3NdjYBGqS9iyQeWvJoLfBF/K1mrPmZp2xbFTByIhgDlQSyK3SZy7xsvNCjbwlOgT0x0VvoI5Mw1r3oXGlvb6/L1MwH1pV50p7XR8g25m+FgkDg7lKf6L18sW4HJ/Zf6S3
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(39850400004)(396003)(376002)(346002)(366004)(136003)(6506007)(36756003)(186003)(4744005)(8976002)(6666004)(2906002)(107886003)(5660300002)(1076003)(66556008)(6916009)(8676002)(66476007)(6512007)(478600001)(26005)(66946007)(83380400001)(956004)(86362001)(52116002)(8936002)(44832011)(54906003)(4326008)(6486002)(2616005)(16526019)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	lnxoAfqtyeAdMgbW1dkF/jmUwukZUBxx/i56RERWcZu4SKtQkvHQspjKcNpejejhYU0cbWSNsl88k7Pg1hcZ0zCdJ7QqMSyPB9OzTVYD2eRvfOgx4uqcvRQuZbvlkbseLMi+WuiPQ7aAmPprd7ydJ6VN4XU8Hp5hijYggG+SvHq8hExDUa7Tm8ae+SBJRuGcrM1JCnXaZbJH6KVZBMovVnlQPCOdPLTIWIGr9osTLGb8wut9wddtulm4mbsAwnOn9dF0nfHxJCflvJJVw2Xsj30E78OBji9mb2zkjItErfcif2Q2s2auZVAQ/DhJJB1Vc3U2lsQ3L0Ojs4yL+ry2a5gwgMRyNJ2ytgIDiavkVZyXlSS/SfQGXOVBNatI2P5ykDf7ToDBf0vD5J3Ts/mveOyGAyTps3UgVpvqJAUjmlgW/hA+8VOogY7PL1OjuhByw+Iw0Ck6qVqk+lW1sHt+At0kgOAc4xhyqAtVy6I+pq/KkdaM0RuHK+bPUqhx1RQp0bMoofyPLXv8TpAqMWyeU2hLcb7Dfpn7OchTdW369j2cRTXyOSmwEBPRQ8WW6stj5nAZe3DGiL3FOJhfB9LLmNjlI7pz7C4PcFnVcUCQJeOPmtKtcVpGDFhZVch578Tn49MSnrdNi6eKd97fMnCWwA==
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 002bf971-1e52-416a-b326-08d85f0a5530
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2020 15:15:25.8190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: it3aTpYaAP5U/fQbXWwG2LS3enwVYL70WpOWReuV+7cJpj2VqYfU8U97Pqhk5apZdnH/kvJ2HOz7IW2KEV3x5kADzi9ncT+RCWuCU8kaAx0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3441
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

This is all entirely untested, hence RFC. But if this doesn't work for
some reason, I think externalsrc.bbclass should grow some comments as
to why deltask is used instead of the noexec flag.

Patch 4 is a revert of patch 1, but I did it that way to facilitate
backporting, in case patch 2 is too dangerous for backporting. If that
is considered safe enough, it should be enough to apply patch 2 to
avoid the churn. In any case, patch 3 is just a little simplification
made possible by patch 2.


Rasmus Villemoes (4):
  kernel.bbclass: ensure symlink_kernsrc task gets run even with
    externalsrc
  externalsrc.bbclass: make SRCTREECOVEREDTASKS noexec instead of
    deleting them
  kernel-yocto.bbclass: remove now unnecessary externalsrc workaround
  Revert "kernel.bbclass: ensure symlink_kernsrc task gets run even with
    externalsrc"

 meta/classes/externalsrc.bbclass  | 5 +----
 meta/classes/kernel-yocto.bbclass | 6 ------
 2 files changed, 1 insertion(+), 10 deletions(-)

--=20
2.23.0

