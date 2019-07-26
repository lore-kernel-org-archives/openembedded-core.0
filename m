Return-Path: <jlock@vmware.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr820084.outbound.protection.outlook.com [40.107.82.84])
	by mail.openembedded.org (Postfix) with ESMTP id A38F17F1DF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 11:26:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=LfjOCyajaUOnF/ZXmCi0QkPhKDnLeiZsrD80GDBjG7C4ank6Tw+oil/s79u4gh7FoAEU8sQRy1Wt126qEnQepa7IjkufE8zaPAwMF/g9N3bhW0cFEzToo4jWp1ys/7zpeIO+sNY0sQ+rfSlHYoQ8QziwWPxeEmGbFGG7Edm2L1ZGHE7B/+At41rqUE0fdRI+B8kXzb+nMk+9cVRmYotsn7SQT8QxmObDwKoYx5gFB8VZBX5ArnfHnzeAblvGGB/sAAZTb9nG9xwvzgKyU1yI1W0603zrUGNzm4vN0bIUTNCSXMKT022lLZowLDEZO6sa23BfH8KE+xDeoOCyNmhfkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=0YVgEEeByuRcS3YdcVe5yWWseGtexU2B7BQwrfNDfII=;
	b=gEJ89fUCl65LaQNnXPmczvQcio6fgq93i1IuhX0kEQAmCWuidyar5HRrP4s2XldWCLPXiSo/GrLV3ZjBhZkIpUjwIUDM49+cJ9PW4kgvdvv09MapVfcSDwfCZUYqOhBkKjY4fO1yIY1iwsLvs06UXWhvW6o9//muNSAawcWRYkt3IOfJN7OFpsKhokCN2t2X4gJqXEFrxMoz1xHgf32TgbTQ7TOEV8tUkXU8N9tEv5DZRVJ7np3/JUi81RDWDIO8EYEXsKaSe/VyAsk7/UK+iiyVjbM+8NLOaXVTdv9dTBUN2Y5k3ev8Z27pKbCWeDZb+//vNPYXf9Tm5YlIg8w6Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=vmware.com;dmarc=pass action=none
	header.from=vmware.com;dkim=pass header.d=vmware.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=0YVgEEeByuRcS3YdcVe5yWWseGtexU2B7BQwrfNDfII=;
	b=cjTBQuqQdTEISG2EuLZWnSOsNb1mJiC45GjH5BQOIMMd/ldcqjEPDgakCQJsHANvwENR5uHJzDecnkVl6AcbKZd8g09441oZsTjvmqypMiwSfdNcu5SYfqkWho/64FkCnIKWB5oimSXRCQBzA7+n+UoS45r5Hi7zhb0PcJ3+fWI=
Received: from CO2PR05MB2645.namprd05.prod.outlook.com (10.166.91.154) by
	CO2PR05MB2453.namprd05.prod.outlook.com (10.166.214.148) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2136.9; Fri, 26 Jul 2019 11:26:49 +0000
Received: from CO2PR05MB2645.namprd05.prod.outlook.com
	([fe80::4d14:654a:9769:3f59]) by
	CO2PR05MB2645.namprd05.prod.outlook.com
	([fe80::4d14:654a:9769:3f59%5]) with mapi id 15.20.2115.005;
	Fri, 26 Jul 2019 11:26:49 +0000
From: Joshua Lock <jlock@vmware.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [RFC PATCH 2/3] classes/sstate: don't use unsigned sstate when
	verification enabled
Thread-Index: AQHVQ6UEqiF1sLwRcUSu0jxbS2+Ykg==
Date: Fri, 26 Jul 2019 11:26:49 +0000
Message-ID: <e558f62cfa1d1905c162789c2f23fcd0370da145.1564139487.git.jlock@vmware.com>
References: <cover.1564139487.git.jlock@vmware.com>
In-Reply-To: <cover.1564139487.git.jlock@vmware.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB7PR04CA0015.eurprd04.prod.outlook.com
	(2603:10a6:10:12::28) To CO2PR05MB2645.namprd05.prod.outlook.com
	(2603:10b6:102:8::26)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=jlock@vmware.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.21.0
x-originating-ip: [212.140.202.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a73e1b89-0104-4f50-a457-08d711bc2681
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:CO2PR05MB2453; 
x-ms-traffictypediagnostic: CO2PR05MB2453:
x-microsoft-antispam-prvs: <CO2PR05MB2453988C5F5B473BE1BB9127CEC00@CO2PR05MB2453.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:260;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(189003)(199004)(118296001)(6116002)(6436002)(3846002)(5640700003)(2501003)(86362001)(2351001)(5660300002)(66446008)(64756008)(66556008)(66476007)(66946007)(6506007)(386003)(102836004)(14454004)(4744005)(11346002)(76176011)(2906002)(52116002)(6486002)(478600001)(486006)(305945005)(2616005)(256004)(14444005)(476003)(7736002)(6512007)(71200400001)(99286004)(71190400001)(81166006)(81156014)(8676002)(6916009)(316002)(8936002)(50226002)(25786009)(36756003)(186003)(15650500001)(66066001)(446003)(53936002)(26005)(68736007);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CO2PR05MB2453;
	H:CO2PR05MB2645.namprd05.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iXBLT0LMIow6A4QYTUgg0p9P0sCf/a5IFocewxCBP6nppDYtQ00dc+nWmBg94FI6g+lsJSb0tNod77QQx0aPV8D/jaInwnOTiYVUdlHJDDDGjLGCuevhXH+D4lHKAgB0p9Qi64fZC3GKWAUtYpDMk7e6uP8cu7R/PXertJ1IZKlxdrWS6GQKadJeiXbfp7qD1OEYnKqLK5uJBiR2Wlbm5HM8O/3MiUNVwWQuleSCv2QzGdaZzLTB926hAchKBE419fSOSR3XZh7rHofLHQ7bOUiqP7St3b8BV+NFoNpWw63cSODkEdoprRUYXw9DVOxoeJlI3hvXfEYlrhv4hE1TIDbeccwlw87J7U1gMJwspjxeq1junyhKPLZG0W4Ih8zLO2lY1qm8mfCQBarbyp1g7jYW7mc4Ki9Vr3PAShLKgvQ=
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a73e1b89-0104-4f50-a457-08d711bc2681
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 11:26:49.7896 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jlock@vmware.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR05MB2453
Subject: [RFC PATCH 2/3] classes/sstate: don't use unsigned sstate when verification enabled
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
X-List-Received-Date: Fri, 26 Jul 2019 11:26:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

When signature verification of shared state objects is enabled
(SSTATE_VERIFY_SIG) use of an unsigned object, even though it produces a
warning, seems unexpected. Instead skip unsigned objects and force the
non-accelerated task to be run.

Signed-off-by: Joshua Lock <jlock@vmware.com>
---
 meta/classes/sstate.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index d8fdcece6a..3342c5ef50 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -340,7 +340,8 @@ def sstate_installpkg(ss, d):
     if bb.utils.to_boolean(d.getVar("SSTATE_VERIFY_SIG"), False):
         signer =3D get_signer(d, 'local')
         if not signer.verify(sstatepkg + '.sig'):
-            bb.warn("Cannot verify signature on sstate package %s" % sstat=
epkg)
+            bb.warn("Cannot verify signature on sstate package %s, skippin=
g acceleration..." % sstatepkg)
+            return False
=20
     # Empty sstateinst directory, ensure its clean
     if os.path.exists(sstateinst):
--=20
2.21.0


