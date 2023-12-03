Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF17FC46CA3
	for <webhook@archiver.kernel.org>; Sun,  3 Dec 2023 09:27:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.36500.1701595658716699416
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Dec 2023 01:27:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NpDxEJuV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0701187513=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B39RcVl026802;
	Sun, 3 Dec 2023 01:27:38 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=vFgHikXQBkDKm7Fmk3ahS3x6SqYrHALIH2KZDl+TnGo=; b=
	NpDxEJuV6WM4/Dyd+uKwHNL5AuunQt5ZgXZerRShZmH2O8EoY39Blj6XNRwQPSPG
	nc+YNLXfhmwCLcQpU7TJt30juPnYYqFYEkRK0EmVyI54c3F+k+I/cFEl936VT4M/
	y7PrgrfCwM/ScA622Qw0xjOHCieO4r+7mDGYIe9bfWjgLgyTb7Lc5+1PFAX0oJbI
	TH2Ijdw1isRIjc2L90UbzMFqt0i73cnE95SyCzrGQfAVEqF9vuAxvH10moOYl8mK
	qgk1SyW2x8ngaDcZKuwyGUwoWFdCZBZixGxxmC5ybXYowm66+z8gCgn8K7hffCvY
	mwBBkHZNZHGeeaInIYyCUQ==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ur0r4gkes-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 03 Dec 2023 01:27:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VW4TgeJAweOoTPcXjxqgPkvYmaRJSbGShCyP3tfp4nozqKLAz2Y6XpQBB5GmbyaYqYZBdD3QApXtADLPNZHL3Cn9zSWp3RUF0fk6PeheNZRzAGXu6kZkQtgoqDzw2Ww2Wx/VqBkOE+4+9WrwIf9nHHJtw+ysJ2kR3hk2kybJAmmgYnBZfzU5revaVc6r4h6LVT+X1lTjAHllAYAbHjtVMj5m6GqXU7hoWOTIOB1oe93noSbkiyON9NdMb0gmitSlebkoGj2C3ZbRRNjZ4m2D3IkRfvP+YreMOqAioB9s9hqjheJx4Uwej6SrxGlRsTjU2QUJDE70GQe+gScqw6MgfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vFgHikXQBkDKm7Fmk3ahS3x6SqYrHALIH2KZDl+TnGo=;
 b=lWthHghk65hxJVAzJZPekGohlXZv/648KO/xwmKZBZ+q1aDVIuD+qVye0lKNbmdr4TMos/1AgAJv+09rBvkIdMkN786Bn8EwNP4PzarJvJUojKJzCQyUfiqqKqnStV5+fYwzEjRKq9g8GKwfvxs3LQpmv8G7WGKofkslT3nF338vPho7Ctm8r/8y+2nFVxSMhz2HisIo0hrulWsfN8iTexOKPCcmretYZZBatyaqgV6xpGY/w/fDYhvWp1AEnkEH7yseaegIn31wlYbJrc1XcfoAsSBMPPzueXHw0wq9zwnYpbwOkItZl7cnWgKt21TC9qDx/BmEQQcKoch0Zn+HtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by CY5PR11MB6343.namprd11.prod.outlook.com (2603:10b6:930:3c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.32; Sun, 3 Dec
 2023 09:27:36 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::c56:aece:e7ef:6cb3]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::c56:aece:e7ef:6cb3%3]) with mapi id 15.20.7046.032; Sun, 3 Dec 2023
 09:27:36 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] psplash: upgrade to latest revision
Date: Sun,  3 Dec 2023 17:27:24 +0800
Message-Id: <20231203092724.3484441-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231203092724.3484441-1-yi.zhao@windriver.com>
References: <20231203092724.3484441-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0008.APCP153.PROD.OUTLOOK.COM (2603:1096::18) To
 DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|CY5PR11MB6343:EE_
X-MS-Office365-Filtering-Correlation-Id: ca3793da-0dae-4751-8a0c-08dbf3e21620
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	b9UaNUs0u7KZ4OzBP5+gQ6obAGjCR0zjNEd0KRSg2Fc6Ji2FzgLg39spNoN8edS4HopvvGHXIRXA4A6gwbzc8tBrSFm3RgPLE2GIBlNVHEumyhqLPA2SKa9UrAaWICv6saNV1hiFbn65iFHO2hmEpivbRKDBfuLpixY1JjKQaLX3mSgbsIb7f2kKh6DKVSt6plFXlYxPqECZTzldLEH3+X/4ZLPYLgheuE+T8X8aISEeUSJi/1SzL6ZKqSkUu7U92t4mZv+cNyNxgeYgpIcQeXb7Tqlv/VuMTb8HVoNuFlbqOOrUzm2aKj3shHeISZn1qZMMLlxf+CxCvX1biglpTCMzqrJqXiH+kWw80+0Zdv3NZjjzOBtqNgMf/E9JPiDOcwckaGWnkcm758uybE3m5N2B8fYqLMPtejdghMaX2jGyZeg0mUjxAHgWdquDruQdbujt/ua/Gc/GUIb473QZHAa9kJlDmnrOe3QXfvhhXEGYD8WgqNcybuDoK/gN9Tb3aVRb2zLQnB0vccN4z/HE/+sloQ23Uf7btEpNf7K33k11tpqJrzocOpHnZWhzBNxIQndqdIjkwASJ3PAdhhSS29Hnb9WawnhSAx+mv8NVZKd2vcFWME1UQTVf8h+dBxBI
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39840400004)(346002)(376002)(366004)(136003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(6666004)(2616005)(1076003)(52116002)(6506007)(38100700002)(66946007)(66556008)(66476007)(6916009)(316002)(6512007)(26005)(478600001)(83380400001)(6486002)(8676002)(8936002)(86362001)(5660300002)(4744005)(2906002)(41300700001)(44832011)(38350700005)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JIQE/ukaQNuvrJeIH2xZ+9N7FFqiqgk5mieuIoDxHI2+xoz21aViE6ghxYpv?=
 =?us-ascii?Q?6ArJh/o8Ek7A8xWy7v/IGEZX7nWwD9PrYiecO5tnlqUey+pnbF7FE17ffqcI?=
 =?us-ascii?Q?xJIcILjd/39bhBWGSOyQ4GVYyKBLbnNdQsJ+BVIosDGzixXAs10t/nVUftby?=
 =?us-ascii?Q?wdZ2QL2u18M9cBRFWhp2kSxHLaUxA8zf1H+rJA7asiQd6TErYrxZkTEguxHd?=
 =?us-ascii?Q?Q6eDhVdF8VskZpyg6kBTWWO1K+IXH6zrvTGEls0SpxMwkJpmERb1vBY8qgaR?=
 =?us-ascii?Q?TDS/VMbhyhGqPy2j+koiXfzhXlpTbxjFIfGTTq+5LTiAxzVuAAtbsDPwaDfQ?=
 =?us-ascii?Q?IoTVPaGqhM8CT0dXL5dXA6mIFymrNWwk/zU2bPYulhoi8gkTrsVN5JgYAnMM?=
 =?us-ascii?Q?6/MrMgjBhYn/8CDk/P7GKCUiZ7JkxGtIOVinbcOslw6kxq49Cm67lPooLMXH?=
 =?us-ascii?Q?FBDZ5Z99KoHDob8JP43hH06Ab4rT1TJABe5sNp0N6mDo1lyNROKA5k5JSth3?=
 =?us-ascii?Q?5/PihWDLmkIbO+p8TLxBVAqH8rpfhXboKZMvOa75IaxBGiTY0DsVEqUrFEMJ?=
 =?us-ascii?Q?lmYuy4t4K8ZDUxicojakbGIf6YW1tG8iyaeo7VLz9RXbSjJcRzgDWzM6ogXe?=
 =?us-ascii?Q?5DY998DJPec9zVaaXzodOvFDDGs0TTDhvACn8uUA5+16IYW7JL0dj6RRvm3+?=
 =?us-ascii?Q?afIfEDSG1M2FvRhWatgzrZ6UEdY7yp91jVy+2HF3Ogfch5iaD16eJPXehudQ?=
 =?us-ascii?Q?9b48yP9HPxlJVsNsKMRIN5KVQEvxNj2tKVyijPjQ9mgVYiqjoRpMfXDxPA61?=
 =?us-ascii?Q?92cM9FMKzgmQUjR7ptJ7SJCAnmsy94KEJcRpQHuf9TXoDbNb+7r/Xj5/3QcD?=
 =?us-ascii?Q?vne6ifOeGH/qlT9lSxT5O/Obw3rIp8duw59kdF8sNLQNhOJdoh4vvDERaAet?=
 =?us-ascii?Q?EuuwMT6UV5Kbby+b6Z+uzLFn5JHMxa4czoaa1sKflK1WRDZnro5qGD/n+qjG?=
 =?us-ascii?Q?ABYB7h5sonGB+GcZceI6by0Fjuf97tz5F0ftcB5GxPHurrB8bP/3tKqPFqfj?=
 =?us-ascii?Q?ltAPlGU/vH97C7G99uTwDsin2YImeJ8sglvyyPEayfU3cUkZGfMfLA0XTwuf?=
 =?us-ascii?Q?HJLXL4Zzp4xIjNx2UzcIT9y6Cm5cWmxo2Gw4wJ14QxH4JORwvH6Opv21T8wo?=
 =?us-ascii?Q?lMaiNGcojebUqo6LsodxpQ9nVqOHpTMNInEy+yk8xquT9a1Hjs75qcihq4KG?=
 =?us-ascii?Q?3A6Ej0Ta8/XA2KIJ1onUUGQ+sDxq59BlE9qpHyZQycjlHxvjAWrL2r/XR+jO?=
 =?us-ascii?Q?TLnhTY6huLiC35AFrHUJdHsVuP7nDkTQQVKev7ng0OE/hTT5tnS9o56Py07G?=
 =?us-ascii?Q?ee0W3k4QeRoMqJ8EinhWyj/Dn2fKiZYk1Vy4htmVhsMZ6OSu8HpnSsMptw8l?=
 =?us-ascii?Q?yx2yIpsxMhZeOmtKVemsIlpQvyAJZ1G1YIIHQnq4hX5o/S7UsVZlBlePy9hp?=
 =?us-ascii?Q?/HeV/h/B4sPuUYycOchIgGlMRCLMIpkTcRgrGQqMXkpQ8SdMLwhr5OQmVY1t?=
 =?us-ascii?Q?C88EdcLKCaOglV9RNyOTeUDQpy+qr4EJNYqwdz9Z?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca3793da-0dae-4751-8a0c-08dbf3e21620
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2023 09:27:36.5832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ut0v1Saivx/ZEH3oDSRlHjEgSfPTVCmXWwnITMckJ03A7qpf9Ch0kQ7NIFw2yBSeiMGl1h2nJSZzv68HOVxfpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6343
X-Proofpoint-GUID: dP2XSGajsUStd0ZXSVZooRg5Y6XtwUt7
X-Proofpoint-ORIG-GUID: dP2XSGajsUStd0ZXSVZooRg5Y6XtwUt7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 priorityscore=1501 mlxlogscore=504 adultscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311060001
 definitions=main-2312030074
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Dec 2023 09:27:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191705

* ecc19137 SECURITY.md: Add file

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-core/psplash/psplash_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 17704a02f6..40937098e6 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://psplash.h;beginline=1;endline=8;md5=8f232c1e95929eacab37f00900580224"
 DEPENDS = "gdk-pixbuf-native"
 
-SRCREV = "44afb7506d43cca15582b4c5b90ba5580344d75d"
+SRCREV = "ecc1913756698d0c87ad8fa10e44b29537f09ad1"
 PV = "0.1+git"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https \
-- 
2.25.1


