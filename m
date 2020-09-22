Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web12.952.1600787728540473183
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2020 08:15:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=DuDSlxV0;
 spf=fail (domain: prevas.dk, ip: <nil>, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EdJgc7xA3e620XmiIC9V1FiYz0JYqfiy7cDt7bCxPmftK1PIJZAnindYzWwNk4TPYWMm1xH9ZsQ+obaUyPfUTzpA415p30eY2Bxq0nffceTovcmpaTnpq88Ohtbp0tMuXEVpeHaZcuch7r/PErzFA/TAiUMRbsQf/1PM3mh8QqtqKFumj5P7azMZwSVEW2Tpv7L/RlWL+PAHEWSx+Aje02FSPdJHOcwYiiMRAh0V91mmzhZ178xxzS9JuxRmLjyWhYbhV+A/t5B9OLIC5gJ4Bb6V3aXeCXVFzhPnhwVTtDrruJoGz7Hhxq4cXhygXo0IsO2H68l0dBhsfzKfAsBG9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nmVPCiGYFVoQLIUmkQ8gLnwi07uHm4f1S1JAoolqLrM=;
 b=MKiKqNAaPPvkzYsVGZgszHABVM0g6jf/009FqRRw1pWQyyCs/mCn0ysKERrJavqMa8FJa8KThstfHNkA+FrV5fdmfWG7EwT5U6Ug28fiQspJbbO9UYXlDJfo+apBCrY4rmkvoW4Rv22hab3T9VwJBm86ZJ/HMRXtMpF/JEMQ4QWDtrYMKXyDZRoE8AV/akyj9Suf/p8TVrgdoYJDFGlI0yQeJ7Ct4m9g6u5wEqkC1NV87pBArsCCzwiOzCxWNUI5NiKVteVAaLzcrkvvoc1yP18+d7MM+zZVRBki/m+LWxFDH98jkLThfGK/LpCY3YEo3KIA0rRwTkUdqkPYklYYyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nmVPCiGYFVoQLIUmkQ8gLnwi07uHm4f1S1JAoolqLrM=;
 b=DuDSlxV02dEaWAG2JY6rD1XeURUHSuE0BpjU2XdvdVnkG9u9+dq2FyoudbEJ/Bki0xVVkgN4AoALfye3SzMczcY/0mJ5w6+T0NGoKjF2b96OIKMD6/ayKz+JHuNDqeDrzWmR7LNSY3E/aJJ3EU3EHGsgNox/ert77Cst1sfbbw8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM0PR10MB3441.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Tue, 22 Sep
 2020 15:15:26 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::19ee:8c9b:b371:abb2]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::19ee:8c9b:b371:abb2%2]) with mapi id 15.20.3391.027; Tue, 22 Sep 2020
 15:15:26 +0000
From: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: parkch98@gmail.com,
	Steve Sakoman <steve@sakoman.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [RFC PATCH 1/4] kernel.bbclass: ensure symlink_kernsrc task gets run even with externalsrc
Date: Tue, 22 Sep 2020 17:15:15 +0200
Message-ID: <20200922151518.1615-2-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200922151518.1615-1-rasmus.villemoes@prevas.dk>
References: <20200922151518.1615-1-rasmus.villemoes@prevas.dk>
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
X-MS-Office365-Filtering-Correlation-Id: 935705f2-a223-4de3-ed8e-08d85f0a5590
X-MS-TrafficTypeDiagnostic: AM0PR10MB3441:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR10MB3441F47F4143DDB932B82D27933B0@AM0PR10MB3441.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RX5f2j/xAUILQQzSZ1TZ6KhVFkNX7LiGzYbQ5XiD7SgxpzRhC8KaSt2YqkLTxb90CJlpSKWlpXebdd/LllvFpMSI/6RNDCoytRg4wbGb/GT3aIQByBlYnTzSBVgGkxcSLBHnWUQ8Wxz9eupO3dqInMs9MRxOCGtYfrb+7Wjjr46WDCYdjqodhDSd2otAaKzWKGVH+ZwSlTmdmeLxpx2CPauvOWkHzE9THADCwcCsDwXJXWRdpjJdWtvDAWV+JKs3bYtfBVvaVo4vxDtxv5NwhyYAQWD1fF7YLIlSWDiXpq9nt3oKSKa4tyV84pVG6cI6NwjFC14eNBueA8VR4J+vtAqY8NdD6/wC5dzJqHy9HtQHEeVUZ4b/EHZzjY1vYOfi
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(39850400004)(396003)(376002)(346002)(366004)(136003)(6506007)(36756003)(186003)(8976002)(6666004)(2906002)(107886003)(5660300002)(1076003)(66556008)(6916009)(8676002)(66476007)(6512007)(478600001)(26005)(66946007)(83380400001)(956004)(86362001)(52116002)(8936002)(44832011)(54906003)(4326008)(6486002)(2616005)(16526019)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	4F0DnbheFl8d3w/txHmIhF6pS68qKkdulEPUN7yHaEA/5OMy+IjbuyuN7av3JBa2LCHvauxl8jEUh9E7mOX+y/QluRIaq4hpgHPre9OaZDE55FLz3RJ3KptuN6lmyLOHd73L+67h5sLTUojve8D8/Zz9VlrcTFJqFCgWg5OdO8EEqYHdz7DLQVMBtJ7luB93qOHEhpgez4Bh47WxXNIeIGKLpYnhaYRc0CkL00RLvFx3GGYUqtO4HsAvjaZ7I3vcTfYX5I6618ErXkjCBOwo2Fb/0smaAKzabb0R4b1h9fbE0TWV+p5AoppEQnDD5mCcyAQZHePKEQMWtvu7crMHDIJAyIUAc1n71swG/uLuWLVgTFD15ewthlne2aQhQHPTlhdzxiHC2ZWrEi/469cGClaof/ZtLCUFfv4Jsj6e4xfM/+5TLZMTqQXd2Fa/L+5z7e8Z/jilf5bWx8cIsxi3jZtg6gdK9h8sll6w38kvfgzCaWMw/FsIjcml5h37EYybburUyCG0cjeyuln0UzaFfQSxMwgu+ZlxlNy1zrbzTqabAApYmZk/jHkfQAE31+YQWpXlzGPH3gBsJfwZND8X1ofehOclgGLndEYjoleMBNQQtvT5SzDnZxWRiDE6C9AUcmUYcmq8AJISjQU0mK2JyQ==
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 935705f2-a223-4de3-ed8e-08d85f0a5590
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2020 15:15:26.4387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N7eEsgSDPttmtoIiXLcebjKjKNqBacBF17GPf3r5wFPFy+Xba8Ako62m2xi9I0Ta+56OKe7rnYv2rP3NmII0HpupdfYJDEeYfOdDCt2ZTmE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3441
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Commit c5dfc2586b41 (kernel.bbclass: run do_symlink_kernsrc before
do_patch) fixed a race between do_symlink_kernsrc and
do_populate_lic. However, I missed the fact that when
externalsrc.bbclass is in use, the do_patch task doesn't exist,
meaning that do_symlink_kernsrc now doesn't get run at all, breaking
the build.

While I think the proper fix is to stop deltask'ing do_patch and
instead make it noexec in externalsrc.bbclass, a more targeted fix
suitable for backporting is to simply make this a dependency of both
do_patch and do_configure.

Fixes: c5dfc2586b41 (kernel.bbclass: run do_symlink_kernsrc before
do_patch)
Reported-by: Chanho Park <parkch98@gmail.com>

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
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

