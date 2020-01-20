Return-Path: <rasmus.villemoes@prevas.dk>
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
	(mail-eopbgr30129.outbound.protection.outlook.com [40.107.3.129])
	by mail.openembedded.org (Postfix) with ESMTP id 949927F89D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 07:28:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=MNeAU53QGlfDwKkGF2P6zTA2i5n4wHHf4n+lcKVOXqcE8lRKEDj4Z3Tu2HJoIjY4/gifE9MTxWiDvk+GnkeuHL+I/o1NkQ1NJSDlzbZRYadJi2E4U3IOYjpq8czzEPQoe6HaLHxebpQOMAXLqAer6ZLaSjBnuw2GJ17xdfq555VzNgIULCW8RyxD9E4XgbwOZq0ZP4YHJ5dXJfHX+w16alpw50xSmKZvsIHCRhvfTMcryewW4RV/Dh9N4/Xfhw8q7WskMXQ9gXPC16cToulXt3dd0d4xvd17Dxyl8jc/T49bU9dQclqSG4biBbDOYdxRQGqntYyA8qrsI5DI3RjqxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ZtcWzC8mtPg4nvPJlRcD6b7jN9/cIjO5utCmY+6yZZM=;
	b=eBw/MKd/IOjzFABtXOPQ3xF8KpB1xlKw+DlxubzKXHNE+l59M561GjHqvZwsELJUxlFxVw/YMDKm7FE2FQ6s04ayf7kmFWJmYCIKbndXAVYw8GJuJp3mPxRVccnaIaFSWftqwapWFf3zgF1QIIwrsI+2TJwYXeOsUcx34LPts52+vNz+BcaGX9KO3HHp6OJ+l8Xg/fjlk/xKsKSJkGXxJcl+SN7wOPxZdNscL05mKIMOerAKVhkInsGKiVLCNh0tzW0aeZVFGZbieXL7RlJtfgZ0Nuwz/1UhMabnxsMXJTDDvlF2WNpgkLSt0+jM99jWGJJe7hTZn6+Pz3N5/NyznA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk; 
	dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk; s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ZtcWzC8mtPg4nvPJlRcD6b7jN9/cIjO5utCmY+6yZZM=;
	b=bue6vjbz1Jf3GOquiVgTp+WvxKu7AG1CHI6RVfGGSCw/zoL2iSMMxR7yy20rDRIYuxkME+Hs7l+Q5vQrth6iZug14YEUH+0ekvE4Bka8o7TBQ8f+sYg1kaDFBeB6WrrMKwItQuiatL4JpmPJJDYPvCyysXIkF+2LwxlxOyTQiQI=
Received: from VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM (20.178.126.85) by
	VI1PR10MB1935.EURPRD10.PROD.OUTLOOK.COM (52.134.26.160) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2644.23; Mon, 20 Jan 2020 07:28:14 +0000
Received: from VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
	([fe80::8175:5aa2:2870:766d]) by
	VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
	([fe80::8175:5aa2:2870:766d%6]) with mapi id 15.20.2644.026;
	Mon, 20 Jan 2020 07:28:14 +0000
Received: from prevas-ravi.prevas.se (81.216.59.226) by
	HE1PR0102CA0069.eurprd01.prod.exchangelabs.com
	(2603:10a6:7:7d::46) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384)
	id 15.20.2644.19 via Frontend Transport;
	Mon, 20 Jan 2020 07:28:13 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] glibc: don't ignore global LDFLAGS settings
Thread-Index: AQHVz2MtF+4MCSftZ0KGKaK8stejig==
Date: Mon, 20 Jan 2020 07:28:14 +0000
Message-ID: <20200120072801.16603-1-rasmus.villemoes@prevas.dk>
References: <4e7244df21e0c47712976ad72bc53aab51236724.camel@linuxfoundation.org>
In-Reply-To: <4e7244df21e0c47712976ad72bc53aab51236724.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0102CA0069.eurprd01.prod.exchangelabs.com
	(2603:10a6:7:7d::46) To VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:803:e1::21)
x-mailer: git-send-email 2.23.0
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=rasmus.villemoes@prevas.dk; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.216.59.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 36a37e73-8640-43f8-3118-08d79d7a4f57
x-ms-traffictypediagnostic: VI1PR10MB1935:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR10MB1935CC5D1F9750B10A30D30693320@VI1PR10MB1935.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0288CD37D9
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39840400004)(346002)(136003)(376002)(396003)(366004)(199004)(189003)(66446008)(36756003)(66476007)(6512007)(66556008)(64756008)(66946007)(6486002)(107886003)(54906003)(316002)(2906002)(478600001)(1076003)(86362001)(8936002)(71200400001)(52116002)(6916009)(186003)(16526019)(6506007)(8976002)(4326008)(26005)(81156014)(81166006)(5660300002)(2616005)(44832011)(956004)(8676002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR10MB1935;
	H:VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: prevas.dk does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sSy3I4B/Wb5gY5vnBdkUplK50bC30k2nOqMYOt//3qhlA6/eSx9+naqpNpB6mC7m/NmllAjkFNq9QEgNsdv3t+QsgS2jZhAr1D4DvPv1y5GevFvENLQ8n5NMv+TEeEYzZn+Vj8Zti+94JVpBJNgIdh9121x4ENb6B5wZPUIHzNi0WaGDnd7q1FHe2mccm1u8cNkO3WxMKXlBPy0tIIKgftTsmmfJHcayks0XsZZ0xtfjvGI9P4w3NJ/LkBNyrYCnj0vB3uOXjivqDYMmdrWHtOJuZZpLCp3vwSt4L5mfAcKNHEVvIr8PhkUovqaRGl1h/CfSy7ROQYzGjLQ0bW2r4XLzbmsbjP/51jRFvpcN+ibmMqLFw8H9XPmWWDChI/NLG+r+2vbGNHIYW9H9Rj0wfLypNZ6VVv9m5LAos0+C9ZzoxQScEj1TQu2oUfhuKOHf
MIME-Version: 1.0
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 36a37e73-8640-43f8-3118-08d79d7a4f57
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2020 07:28:14.2937 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qVmKiRpr6No3bj2Hl9cDHkYVW8PpBh2hD2bvXBtH2pP0k8ShWUhayahHQac5ODqDrengv3r7Xjd0T9QFGVvXWyCFMMyCOyDn7jK3hBoqFl4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB1935
Subject: [PATCH] glibc: don't ignore global LDFLAGS settings
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
X-List-Received-Date: Mon, 20 Jan 2020 07:28:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Two things: The -Wl,-rpath-link comment is stale (due to per-recipe
staging), so we no longer need to set our own LDFLAGS to avoid
-Wl,-rpath-link being in there. Second, overriding LDFLAGS should be
done at the recipe level so "bitbake -e" can show what is going on.
Otherwise debugging why one's global LDFLAGS tweaks are being ignored
is needlessly painful.

So pull out the LDFLAGS setting from do_compile, and change it to an
append instead of assignment.

For the benefit of future git blame: the -fuse-ld=3Dbfd setting was
added by ac64c3b96b (glibc: always use bfd linker).

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 meta/recipes-core/glibc/glibc_2.30.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc_2.30.bb b/meta/recipes-core/glib=
c/glibc_2.30.bb
index 7913bc2812..c6dd78ca8b 100644
--- a/meta/recipes-core/glibc/glibc_2.30.bb
+++ b/meta/recipes-core/glibc/glibc_2.30.bb
@@ -93,9 +93,8 @@ do_configure () {
         CPPFLAGS=3D"" oe_runconf
 }
=20
+LDFLAGS +=3D "-fuse-ld=3Dbfd"
 do_compile () {
-	# -Wl,-rpath-link <staging>/lib in LDFLAGS can cause breakage if another =
glibc is in staging
-	LDFLAGS=3D"-fuse-ld=3Dbfd"
 	base_do_compile
 	echo "Adjust ldd script"
 	if [ -n "${RTLDLIST}" ]
--=20
2.23.0


