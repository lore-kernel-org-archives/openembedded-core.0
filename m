Return-Path: <jlock@vmware.com>
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr720083.outbound.protection.outlook.com [40.107.72.83])
	by mail.openembedded.org (Postfix) with ESMTP id 0F56C7F32D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2019 13:16:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=C3akeRwH0+8ATP16xPnLmQ7QyoEYLgZHg2cLjogyPgm1zawX0tZHRUGdiz97XEk+W55Z+zLHVyFp3I+N8lA9Te89JL6BppcWalYcPxTVs2/zmBXHxj6NjDYmPe7e8LzeneulvJLzC4InBlIjYj6gWgvunaV98QxhQlXQ+e8IXgLzdtIbZZ9VBHI+w/Q5ACdxjLRhre/AuS3/Fo4J4nPN7EW+K9yCYi8dC9VnIAz5xftf7DL+BOzCbEWDmhkqU1wGq5amP62koeZUi8PIMZ56mjcXkfmewO1RtA3ebtwnQS6bIG7Y27BDTJBq6fSV38FNpnvXw16rbcG1kFTleWrQjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=0YVgEEeByuRcS3YdcVe5yWWseGtexU2B7BQwrfNDfII=;
	b=MB8EfXIkssAE5kZer0B8PcMp1YVYuXHHKfqPQWVj1cn5exKzIX+xrKo2GrUJI9a8lq0C6YeRsYuXvuub1N5OWEKQk+51JRSazMvdykTt552SmYbdJa3pfW+vx+Y4oWFkq18LytYFxVRfkLnkLr+dRn6iQqANeca/WAgF2GlbYbzFShq/JTAcZbhi8zQbqB7WG6cxkX7szZOp+BHB6qUWw0RcLdy8jGH6fLiXkB89vh27oPN4cPp4vGIQXnZW30sWOsifOE+WFkqhrxrcehnDcIIPh+F15JcveB6TQFra0hZkJ+qKUnbP3jdCu+yDlUH9pfiztKVIyYXxVDM032sXbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=vmware.com;dmarc=pass action=none
	header.from=vmware.com;dkim=pass header.d=vmware.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=0YVgEEeByuRcS3YdcVe5yWWseGtexU2B7BQwrfNDfII=;
	b=KaEOJ9q/WXUbR0YhZWf0yEnH7jbHtvJgUjXVPmo3pwEA+Ei4G6/eYQ8pYZZ+r4RAzgcIAmA/SJEiWYdTvHALb0VHYTmXD+jB7Uu5e06Jmflj+VknJFB+8Hm5odL+oC8ARPkiECcONiw9EVRrh0WWWRUIB+YjFcz9FKAfMW9NJEc=
Received: from CO2PR05MB2645.namprd05.prod.outlook.com (10.166.91.154) by
	CO2PR05MB2662.namprd05.prod.outlook.com (10.166.95.14) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2136.12; Tue, 30 Jul 2019 13:16:07 +0000
Received: from CO2PR05MB2645.namprd05.prod.outlook.com
	([fe80::4d14:654a:9769:3f59]) by
	CO2PR05MB2645.namprd05.prod.outlook.com
	([fe80::4d14:654a:9769:3f59%5]) with mapi id 15.20.2136.010;
	Tue, 30 Jul 2019 13:16:07 +0000
From: Joshua Lock <jlock@vmware.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH v2 2/3] classes/sstate: don't use unsigned sstate when
	verification enabled
Thread-Index: AQHVRtjyonO7cM8VfUeY25AsKqU0FQ==
Date: Tue, 30 Jul 2019 13:16:07 +0000
Message-ID: <e558f62cfa1d1905c162789c2f23fcd0370da145.1564487218.git.jlock@vmware.com>
References: <cover.1564487218.git.jlock@vmware.com>
In-Reply-To: <cover.1564487218.git.jlock@vmware.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0020.eurprd07.prod.outlook.com
	(2603:10a6:6:2d::30) To CO2PR05MB2645.namprd05.prod.outlook.com
	(2603:10b6:102:8::26)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=jlock@vmware.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.21.0
x-originating-ip: [212.140.202.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cb4ca010-d15c-493e-733b-08d714f01457
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:CO2PR05MB2662; 
x-ms-traffictypediagnostic: CO2PR05MB2662:
x-microsoft-antispam-prvs: <CO2PR05MB266261B168E27C3F73555A2ECEDC0@CO2PR05MB2662.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:260;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(39860400002)(136003)(396003)(366004)(346002)(376002)(189003)(199004)(4744005)(478600001)(6512007)(256004)(14444005)(81156014)(2351001)(316002)(5640700003)(476003)(486006)(7736002)(446003)(11346002)(6486002)(50226002)(6436002)(305945005)(66476007)(2616005)(53936002)(2501003)(14454004)(6916009)(15650500001)(66556008)(64756008)(66446008)(2906002)(66946007)(68736007)(8936002)(6116002)(3846002)(118296001)(25786009)(26005)(86362001)(102836004)(6506007)(386003)(36756003)(66066001)(52116002)(99286004)(81166006)(71200400001)(5660300002)(71190400001)(186003)(76176011)(8676002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CO2PR05MB2662;
	H:CO2PR05MB2645.namprd05.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1iDCMGNEX1O4kTxfX6CUsdI4S/uM2Vu1yzG+z+qYtu6b4iHpbFtfho2nHFDWfEurUXqGleNJ9iXy9hBYYmFbFf1y4OroMc1Md2QvxfAqihGHBPPZ0ZqgPrWHulq5OnxdATjCwX3tpb1xW6+aQku78hDdx5qkwWwqHSf8NvG1bCjc2AZq58q/sTpmR16GVHoH42GAwERSf0fKmPpL4z9ETVHEcvM9AcBG84SkKnjJP5MSCKK+m9tpZDeRBbQIXtbMo0tDozk1WOAlxkfRhI3wb4A6Tm1jvAZnQpy4arTnXVxefIkKn0hJwq4S5F6yzxnlcXVVxL8aBql5sBl/fHzvyiS6j7EINEfeuVGfDf253vhl1x8gRWfpGuwIr0Nwx9uRu7sZEvwh/DTXRqxvGmKRMvtY4XkKr0SVkZs4xKQ9yDw=
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb4ca010-d15c-493e-733b-08d714f01457
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 13:16:07.2142 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jlock@vmware.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR05MB2662
Subject: [PATCH v2 2/3] classes/sstate: don't use unsigned sstate when verification enabled
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
X-List-Received-Date: Tue, 30 Jul 2019 13:16:07 -0000
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


