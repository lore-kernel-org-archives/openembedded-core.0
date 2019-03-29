Return-Path: <hnje@triax.com>
X-Greylist: delayed 3631 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 29 Mar 2019 21:46:21 UTC
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr70113.outbound.protection.outlook.com [40.107.7.113])
	by mail.openembedded.org (Postfix) with ESMTP id CAC8C6D409
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2019 21:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triax.onmicrosoft.com; 
	s=selector1-triax-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=uAMSf0U3flPPH2Vsz0v8Wzi8wIX6A3n6gC0JBUR2MPo=;
	b=O6OGzRm844K/5tpVxIzTdn3jxZfR8hVYI1Wr3CpHfzz7pypi+nThWXVczPo7w8iULz1lEgpeK4V/rGD5Uf+190ESJFLRsGoje1LvkH3l0UOiOci+kk7foVMJ1xM9WWD59BuWhW/7M9fnwz4uAjEgGYOhtid/uXHLpC6STZ2MZBA=
Received: from AM0PR09MB2626.eurprd09.prod.outlook.com (20.177.110.218) by
	AM0PR09MB3428.eurprd09.prod.outlook.com (20.179.254.209) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1750.15; Fri, 29 Mar 2019 19:14:00 +0000
Received: from AM0PR09MB2626.eurprd09.prod.outlook.com
	([fe80::b8ba:e7f4:be2e:f400]) by
	AM0PR09MB2626.eurprd09.prod.outlook.com
	([fe80::b8ba:e7f4:be2e:f400%5]) with mapi id 15.20.1730.019;
	Fri, 29 Mar 2019 19:14:00 +0000
From: "Henrik Nymann Jensen (HNJE)" <hnje@triax.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] kernel-devsrc: fix /usr/src/kernel symlink to also work
	for SDK
Thread-Index: AQHU5mOQrc9yntVe0UahnxsqTw1sDA==
Date: Fri, 29 Mar 2019 19:14:00 +0000
Message-ID: <20190329191348.9272-1-hnje@triax.com>
Accept-Language: en-150, da-DK, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0202CA0028.eurprd02.prod.outlook.com
	(2603:10a6:3:e4::14) To AM0PR09MB2626.eurprd09.prod.outlook.com
	(2603:10a6:208:e2::26)
authentication-results: spf=none (sender IP is ) smtp.mailfrom=hnje@triax.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [193.106.123.182]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 78008aaf-ffda-4fc1-2cad-08d6b47ab300
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
	SRVR:AM0PR09MB3428; 
x-ms-traffictypediagnostic: AM0PR09MB3428:
x-microsoft-antispam-prvs: <AM0PR09MB34285C538F6BA1CD3EE77A84CA5A0@AM0PR09MB3428.eurprd09.prod.outlook.com>
x-forefront-prvs: 0991CAB7B3
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(376002)(396003)(39850400004)(346002)(136003)(189003)(199004)(71200400001)(14454004)(107886003)(6486002)(53936002)(5640700003)(305945005)(316002)(66066001)(99286004)(2351001)(81166006)(7736002)(186003)(6512007)(68736007)(8676002)(6436002)(81156014)(256004)(1076003)(52116002)(8936002)(50226002)(71190400001)(478600001)(6116002)(4744005)(2616005)(86362001)(476003)(2906002)(6916009)(26005)(14444005)(5660300002)(105586002)(36756003)(6506007)(97736004)(4326008)(2501003)(3846002)(106356001)(25786009)(386003)(486006)(102836004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR09MB3428;
	H:AM0PR09MB2626.eurprd09.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: triax.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 02hhN41C9+GM7poASS2YmL43qAGQAIFUKAU2YbdI6Vvzq+/hloyiZoptF6tdj9HpA439SnzLbRVNglnp6sbIKPcvGNEW/JfrHTMIdf0G8LkywbTMMC9sFAiQKHXf9khrKOw8BmPAwZEhsjj6+fUZBBLeLsK78VAKZv6noSyE+kbwK8WHmSe9uxCuA8d9g4rftdZUqpaxmRdW4ExOmRbeBuGQbHWYXNLOD3xxue6ucdLrv7zjhiDWHlIRbBP0sAb4IpWscPQdRE5FVr6WqumfenmTZz1u2JIPXbDl8CLIltADfAr2XUHk0jV8IhSHhYJ7GBuspVi/G5TIY39nP622+Xl7PBr70MtLMEl74rWCmNDYTYjeYSGg7Oargf0tOwkA6Lw5OLMpWt1crd1fPqMBxDAmYJWR2Z4SNzUWkWjtuug=
MIME-Version: 1.0
X-OriginatorOrg: triax.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78008aaf-ffda-4fc1-2cad-08d6b47ab300
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2019 19:14:00.4568 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0e4fd38b-2bbd-4850-8e60-c136d92e69d6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB3428
Subject: [PATCH] kernel-devsrc: fix /usr/src/kernel symlink to also work for SDK
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Mar 2019 21:46:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

If kernel-devsrc is used in a SDK context, the symlink from usr/src/kernel
points to an absolute path '/lib/modules/${KERNEL_VERSION}/build',
which ends up pointing to the local machine's build directory.

To address this issue change the symlink to be realtive to
${D}/lib/modules/${KERNEL_VERSION}/build.

Signed-off-by: Henrik Nymann Jensen <hnje@triax.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kern=
el/linux/kernel-devsrc.bb
index 6daeea4f7a..69a8eaef81 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -48,7 +48,7 @@ do_install() {
     mkdir -p ${D}/usr/src
     (
 	cd ${D}/usr/src
-	ln -s ${KERNEL_BUILD_ROOT}${KERNEL_VERSION}/source kernel
+	lnr ${D}${KERNEL_BUILD_ROOT}${KERNEL_VERSION}/source kernel
     )
=20
     # for on target purposes, we unify build and source
--=20
2.20.1


