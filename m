Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web11.6272.1617798143329035027
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Apr 2021 05:22:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=lqsAHV6Y;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: kexin.hao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EmZqju0f+QYqzpT2zRNSnAwSM0z4nN3NLJJ4oS6nVp8gs86NarCV+I/UvMx1UK2QUdGP5GTLjvlVmHwnCs9Ibo502n9wztuXCwaLSId2EQ38Qe9am/M77T0I8KRHpQfbQiSJu8TVLJD5tzVI47uB7CyvCXRv/KA9SRFKz9CVMv2MlYPlifuNs4JqJtC/CFcbHggLyMg8pxzFgnb3FRGyqlFE23zStQRjJPT57MbkRYREU4G/iNVmdVZAGm1J4qlmfpMj/4p9qvbp7L34iaSdEar9Zz6CjzZ6tGlXowekT+nYjAHFVbdvXspDj/bDJDqybPYr0+9pedN/E4TwEi6sdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6iA3f4JTv3de+1MvrKHbUlTuESv40+LVqe3D5jVox7w=;
 b=PElyHJjSB+vRFDzMneuTMkbH1Ok6zn9LiNLi+8U6+0GIXEbtJz2IdZIpjjyWL/LC5ayguRqX8s65eymeLziRuFwihJM4EVtoedBXGnqfCNagyhmXKxgqTIcb8yr0DIzXim756XzElMqsgx91NRQNkYrcXrBv86yNv1SPdCcsJiz9LqG09rqHxvVF2AImyLpAUFoza2rujxAi0NLfEkUEFW6tTPxGic0ewV/IaCUh83SMWP0HMOdKo3hrsxYCQG8kNaknJIi2ywazAxxKsGkl/9rP5mboki5EF78RiTM+LWmDUaUJKkoH+eP10E9do8B9yC0uctY7kopOlfWIeLpokA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6iA3f4JTv3de+1MvrKHbUlTuESv40+LVqe3D5jVox7w=;
 b=lqsAHV6Y3HHLavVtWQMPupQ6swjIhQKcpHJOSD/nJ9wxEe1iSvTFIVytyi46c07Akyjaz1CL5aIsb/QYuyLJ5Rhws62DXix0ymQFTA068t7W+OFmieJpNWt/1ETr742KyS79P087Ek7C0IMDjEsTd6sg8ma6EcVSRh+rcWvkXl8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB2682.namprd11.prod.outlook.com (2603:10b6:5:c3::15) by
 DM6PR11MB3883.namprd11.prod.outlook.com (2603:10b6:5:19f::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.29; Wed, 7 Apr 2021 12:22:22 +0000
Received: from DM6PR11MB2682.namprd11.prod.outlook.com
 ([fe80::b080:6177:793a:2810]) by DM6PR11MB2682.namprd11.prod.outlook.com
 ([fe80::b080:6177:793a:2810%6]) with mapi id 15.20.3999.032; Wed, 7 Apr 2021
 12:22:22 +0000
From: "Kevin Hao" <kexin.hao@windriver.com>
To: openembedded-core@lists.openembedded.org
CC: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 1/3] modutils-initscripts: Bail out when no module is installed
Date: Wed,  7 Apr 2021 20:18:10 +0800
Message-ID: <20210407121812.4099-2-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210407121812.4099-1-kexin.hao@windriver.com>
References: <20210407121812.4099-1-kexin.hao@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR01CA0058.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::22) To DM6PR11MB2682.namprd11.prod.outlook.com
 (2603:10b6:5:c3::15)
Return-Path: kexin.hao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpggp6.wrs.com (60.247.85.82) by HK0PR01CA0058.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend Transport; Wed, 7 Apr 2021 12:22:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2c44c5d-30fd-4744-76aa-08d8f9bfcb88
X-MS-TrafficTypeDiagnostic: DM6PR11MB3883:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB3883517EE8495BFA16392B18E2759@DM6PR11MB3883.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tXEWRJ+Y9f+9N0K9/fxMUPso6/HZ5mRwzZzqJ7c+bApaDyO7e8m6ZJEwCKyGGzUuS0vmte/Ufr1+b15st0sDJjVRiB8Px3T6pPfeZwo2E2J1iEmMco5ZG+vndi9aG/0Tc7FcAG94myBFgSpqvXORvhTCG4OVZymySlmtO9tJ+vlo7Lx4y0i8BKltzL0jMCGvH0xSv9NJX+VUna7+hWCZyCTcBN2Wi33J3ACX0Hx+8hW6wNbD8W018QxO5MMJdo4gIvClZzPmgrRHm4FxnJ5pO8o0ExQqsBSI2hKhTREYxiva48cu2md1DG7vMH3Viw/yPKR5xYO1TOSnV0+kUTERNSMnFYs2zdx74iFbAWP700PVzscVFsdJeaMHK2lAql7KxqQXFJbsCeRKY6VqZfQpVMP0NEtgZPfOYR/ognuaaGp1n5hWJh8K5F9+2pBAB2Sowy6Zvr04ql8Oy/P3LQZNLjSt+OiTgAsnxZHFmOpnZQZJK13+ZfR4RkjBJDmamdrX2CgAC9EaXGa6lZ9ldMxfGcBZBVOuxReH0+4sv7hl03NP1TicFG+ltBNIV+C/HWe2yD/BYh0+zrtjDYnDhFH+rUVJO88GXFLS+HqC57tk+vhEsGFJ2vXxOOpb4UnMXR41GksKyeqj+AUtb3fQZRHJ6d2yx1wUubCIX0blVPF6h7CoEndhW1LSdWHjhlc+7TEL
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2682.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(396003)(346002)(136003)(366004)(26005)(2616005)(956004)(6666004)(8936002)(38350700001)(52116002)(86362001)(6506007)(8676002)(6916009)(5660300002)(66556008)(66476007)(4744005)(6486002)(66946007)(36756003)(1076003)(2906002)(478600001)(316002)(38100700001)(83380400001)(16526019)(186003)(4326008)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?BhZemzynGoRpx3YMf4ajojdtcYVRGVxDQlT5cZIZADOBg435toH76zwC6LKg?=
 =?us-ascii?Q?ApS/Bvn7JEYSl0tTCvtf2MHFqWtDBgDYY9riOwH01M7gi6Acp3+q/68AM29P?=
 =?us-ascii?Q?l4TCt7JMksuYKYWQoMncqLWb5qYkRJp/PSehT612PsaQn3znTSr6YAA4Vi05?=
 =?us-ascii?Q?LtFUxKo3gN/i+5fV8nKnUX/n/XMVfeer837gjWn1cDKF5V24VaN2TE6rFZ1j?=
 =?us-ascii?Q?Kq8RzDJWrr09nz6vAbT7q6wdyBJphnyCgtPSLB0gxlqMRpRr5JEDRxqnVo9O?=
 =?us-ascii?Q?0uU2eCMWI7oCJwhPJVfVddagPc4kwPhBJw19khX85Vvq9DvYaAXzV1wppIzG?=
 =?us-ascii?Q?PkQklW64vDhv5s9EQ8B83eL+Y7wbf30p+cy3cpe1sYbbYH9QWlT65M2JYp9s?=
 =?us-ascii?Q?MHkTY7SmjV6UZsfgajWzeJJNnFLw3kjyEa6dXPU11FVcnEqpFckEijsKPY6l?=
 =?us-ascii?Q?f5uLfdICRc1j6PP/Gtg0f32pVWZ4UKMG2OkM26vlOEOnja7Ai+qghOwap2KI?=
 =?us-ascii?Q?TDZrKqpyE47XDFkK5aNVFFR6r7KoZhzTYagOh0x/ka1oM0s1CAhMHXuvVUm5?=
 =?us-ascii?Q?xEBBorT8LryUe+iUumDds3eoTjs4W4Tu24fYcPlchQq+zhMbn/VAKIeqynIF?=
 =?us-ascii?Q?niSc5mZv8het2FYz6Mru2Orl0QneFQ3PvZiImdUKRePCG72XBxzadAX21OJ3?=
 =?us-ascii?Q?JdLL2SB9Zp9AWiLtKivO2G0sFnok3dPORWWrEQiqJwF9erUiDZlR5IdIOtyI?=
 =?us-ascii?Q?erfHNNQ2bPvYvG00OGucZ+yJzBN5Duq0fzlrA7L38sHjdrDAzeBb39iOSF6A?=
 =?us-ascii?Q?6Xf7IRFCO3p2hOBle5JrEjFd3aL0RWU2EgNeIL8+k1cNu2Rwts5OTD5MEv++?=
 =?us-ascii?Q?pwbuGQ1kknmhcg/29IWe4p2SLZTDhlueCrvYjJE4Eeu1Gy9yha1HdnQlCTKX?=
 =?us-ascii?Q?YtDRSIIfU4BcmGvsvlab12Pn3x2lnYwAjkvu5/uvoXejun+pIFVHF2g9XlbK?=
 =?us-ascii?Q?4a9ifsD0Enwgv9Zd+/YYqsLJp+1kr+S1Svjit8L6Sb27ds8Y0RbBSa8j90cA?=
 =?us-ascii?Q?Z1sx+NMU/1quIIA6RQZp6NmNcjy3ce69b4OqyvsZ2E8kD7eqjPF95Xu3o3o4?=
 =?us-ascii?Q?8qNtkcxYV8cJBVFY6p0akc0tQFIvhLdP791zxeGdbKH7ZIGfX9JHrtroIOgx?=
 =?us-ascii?Q?4m424WqdTR5BCtWSrYQFP5vNbT2CkR1Keut9kUu3nAbmt2PHmka896/aN0v9?=
 =?us-ascii?Q?2GivXPlrOVaBD/CQBLFFLdfrvHt3Esw9EDDabizv6aje8J/xKOc6tWo23PRC?=
 =?us-ascii?Q?o2RkCvravTwOEsE/bhIFpeZA?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2c44c5d-30fd-4744-76aa-08d8f9bfcb88
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2682.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 12:22:22.5370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bgxCdmvcW6kVl22GDWehc7xol6L1aCmcgNCrMHDnE57rqlEazP0DstoF/9GE5e57KUb7MejxnN4OulmfPreW8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3883
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Fix the following warning when boot with a core-image-minimal rootfs:
  depmod: can't change directory to 'lib/modules/5.10.25-yocto-standard': N=
o such file or directory

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
---
 meta/recipes-kernel/modutils-initscripts/files/modutils.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/modutils-initscripts/files/modutils.sh b/m=
eta/recipes-kernel/modutils-initscripts/files/modutils.sh
index 28fe6f92d77f..67e1dcd9907e 100755
--- a/meta/recipes-kernel/modutils-initscripts/files/modutils.sh
+++ b/meta/recipes-kernel/modutils-initscripts/files/modutils.sh
@@ -13,6 +13,7 @@
=20
 LOAD_MODULE=3Dmodprobe
 [ -f /proc/modules ] || exit 0
+[ -d /lib/modules/`uname -r` ] || exit 0
=20
 # Test if modules.dep exists and has a size greater than zero
 if [ ! -s /lib/modules/`uname -r`/modules.dep ]; then
--=20
2.30.2

