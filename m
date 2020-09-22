Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web12.952.1600787728540473183
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2020 08:15:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=NmLns483;
 spf=fail (domain: prevas.dk, ip: <nil>, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C3UOb5nTix5cAOWr+el/4iU0pEs+zUBzifYKJKgoQGUzzblFiPCT/1pL+pgXvtFHg7ReipeL0y7l21/Mq7Iep524T/CcqT24Jtt/fXX0PUXB74qVcf11Kl/z48O9nN8g278+3krA/rwwpEJfxKfBKUFvf3RQZO+Hcs8m+i6lfW3KIblXUxrrS7qhpu1oBKkarQ2L3jV8K7mPflI+7J+z+ZYeukovuBqg5bBl4LBCaAN03hLR9JzA6LEHeLEjyONYL336TSDB5LZDteZEVQuLWbaQxjeIlLdo99CsrtQ7c0YKtYLPVJpotp6ZrniZTn7aJX964f8Kg1BaFEo2Yj8m0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vNnt8Z3Y+BHh0tSfa5tAmuy4rY3QfjFrlvWyf7Bf2YU=;
 b=Sr3TFfQC/Y15M+UxCtEFFLRwal00UOvq6tyYdTE0sKYSi9oZeVuys7kjrepc8WzBrXRcWAOUa+mLycyrs1rMl8Dj8ggXTqAPgEyfTjDHtwLrZ2fOUSTzb5ykgwwiq+V7xJPyZaU7OD7f7ewA5GIekJf7rGaPUvXDHDawBZwlW19X2OW0l2xcv/zX0h9QZdymOByWqz7PDR49uc/drJjoD77U4BKcDWcyecP8SMZtZJ+C5KERV0kSdOXF//LuOROUY9BFCJ4qqkiNEJBPtSjsRK6KmiXE+kHI3oh2ES7O+DNz6A0VJMWS5Yp+cSf25mufhZHvIRGfpulCbCvPK69LKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vNnt8Z3Y+BHh0tSfa5tAmuy4rY3QfjFrlvWyf7Bf2YU=;
 b=NmLns483GINCQxVpGPdQFK3EccTUK4trR/wap+h97W2/QEdcm9ALNCsABR2MIquqQSC+3dxaEwC3HXAwKXDzXKwnaDQgqibpJKCaraMftI+3alaBj38HyTpaLPMxlCvrPa/jkLuWRBTRurSbvk7fy6GznOe3kleOv4jdSkZ+HMM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM0PR10MB3441.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Tue, 22 Sep
 2020 15:15:28 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::19ee:8c9b:b371:abb2]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::19ee:8c9b:b371:abb2%2]) with mapi id 15.20.3391.027; Tue, 22 Sep 2020
 15:15:28 +0000
From: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: parkch98@gmail.com,
	Steve Sakoman <steve@sakoman.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [RFC PATCH 4/4] Revert "kernel.bbclass: ensure symlink_kernsrc task gets run even with externalsrc"
Date: Tue, 22 Sep 2020 17:15:18 +0200
Message-ID: <20200922151518.1615-5-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200922151518.1615-1-rasmus.villemoes@prevas.dk>
References: <20200922151518.1615-1-rasmus.villemoes@prevas.dk>
X-ClientProxiedBy: AM0PR01CA0131.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::36) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prevas-ravi.prevas.se (81.216.59.226) by AM0PR01CA0131.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14 via Frontend Transport; Tue, 22 Sep 2020 15:15:27 +0000
X-Mailer: git-send-email 2.23.0
X-Originating-IP: [81.216.59.226]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f607b4a5-cd70-4422-2b84-08d85f0a56b8
X-MS-TrafficTypeDiagnostic: AM0PR10MB3441:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR10MB3441FD524FCDDBED1684F892933B0@AM0PR10MB3441.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:364;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fe9Gg+D+beEWUxhWJrrVTtxIsLGmFeXfnpr2byaps7PBCmY5gmY150ZniAt+i5DJIysawxDzcJ3KrzOE715y5otcUCRdRGi4sJMNeex/yRw2szA92aV62pn2Q9SW3KeuK2kq5BtlMMXgurZNn5H6nQXn+aT5ja04ASoeMaayWytOFtF1dVjbTc8PaGxkXlPvMPWdj4qKhBq3LHEv8siU8hJcqgFphYyRQuQTeMs0DgsyVWjhq0M03/LfefvxDuHv83wdpL4/hyTox+sxZOr85UkeTvuZ3uoONLKNdIJE0brutPTNszzhTBAo6X202uFTtd+HlAr3gkor/tH473//jt+JJypTbufPN2kkt7We58oM6B1sZAPxf5uvn0akGNcd
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(39850400004)(396003)(376002)(346002)(366004)(136003)(6506007)(36756003)(186003)(4744005)(8976002)(6666004)(2906002)(107886003)(5660300002)(1076003)(66556008)(6916009)(8676002)(66476007)(6512007)(478600001)(26005)(66946007)(83380400001)(956004)(86362001)(52116002)(8936002)(44832011)(54906003)(4326008)(6486002)(2616005)(16526019)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	a/wG7Z88/dFylJDoSO4S+1qDpIkFfz+ZCiqkT0EtG/zbjE+GUdVbfIaAU6McHstucJa/K4Z43XpCJ2x823HjT0PEDUjajDm+tjRxE8ceqGRS/yPKFPGjdeg2nvm2H/VBEvhFHYmiCr64lD3pEwbhGRkKedEqY4zgA7Q+DEPirnKITu4q7vcV7QkTQDCrvQGVEDsr+7944mDTS7Wk+OhS8z8cl7UcZW9Z+vH3jabepHZQJ8bvnOjJmvM9JqbqOcjRh3mEwbwdoum6U2gfin/JSEwnDENy3WpTPrmiTl6huS2f7WWUuoL5ZXGxc/k3ULJmN8+0VNCF7cD+hjJOcA1YifNsrmGVHghrgQOlf30BpGUnM94fZotuFvNl6hSc7cgvRw3VWywUoaHxe4Yk/MN+oAD38LfL8xDSIUphrTjP/eQDxryDLRjm62Jnmm8OtA4UKUc5inctr9pt87eqUN2DGruvK36/qqoIIi/DPsV2XAESgovxr1nssb1yHQDzHJ70Kg6nsThzSeNqqvYCsloxtmzPXYkm1NY/Zcw/EB5sXuUS7uF17DJxKrCVpu2Ic17JUskEEr+lMsWxEMnYsRi34JGC2Z2Z999SToebdQNTuymsdFJFY33ttR2B3WETTFENelAlGT+YTonPJBMgOH+/tg==
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: f607b4a5-cd70-4422-2b84-08d85f0a56b8
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2020 15:15:28.5915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ghnDYXiQt3Kb/YHJR2zSOhuvbXeP0RNtz+kENX8H3Tmc19z3iM5k7LQF5HH/9dt3tUsOj0yIfPxWM17U36cdZiB2dCmMop5yCHPy2n3q9wM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3441
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

With the changes to externalsrc.bbclass to make tasks noexec instead
of deleting them, we no longer need to explicitly make
do_symlink_kernsrc a dependency of do_configure.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 meta/classes/kernel.bbclass | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 78def5bbc1..48135b3d41 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -172,10 +172,7 @@ python do_symlink_kernsrc () {
             shutil.move(s, kernsrc)
             os.symlink(kernsrc, s)
 }
-# do_patch is normally ordered before do_configure, but
-# externalsrc.bbclass deletes do_patch, breaking the dependency of
-# do_configure on do_symlink_kernsrc.
-addtask symlink_kernsrc before do_patch do_configure after do_unpack
+addtask symlink_kernsrc before do_patch after do_unpack
=20
 inherit kernel-arch deploy
=20
--=20
2.23.0

