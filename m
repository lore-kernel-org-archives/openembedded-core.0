Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59365CDB482
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 10:27:39 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.90])
 by mx.groups.io with SMTP id smtpd.web10.35406.1697192857504222259
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 03:27:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=ev+JvFGx;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.20.90, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sb14to7H/v9oWUj/OlsprMU0BYOjzkYR7qezA5TnYjCNfi/fwLA7u0bZmmr8BXNOI9MlDZUJBZgwKFUOu2qyX7pDfG1MhN3zIKFTMCp3U3vRYsBdHgDaf4ksYtqS634xD1ngjGuEfqOtLemke+GTkVc1QxYtK0meI6mVTtbqorkwnbnhkXWknKKB6Iy4GFsupwsSKmsGT4vk3fjnL9E6/k0dvjLqSTiU854vQJvrulvZsB2n7/FRAiBZqBUhaPiZ5hamsO2Rxn3n2+2pRjO1suPj8XyN4iU8P1QlVs1w4uhLRu0IJ1tOV1gFf2pOUC2GqXUef+Jn+3yNfmYW/sxstw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8t1L0kKTM6VS4kKL16lpIWptNFVOQ2MHWzAzugJV+Og=;
 b=DCtcf3bV4634hamJGrVEkOrz3qzZGxfWeM+NBp27f6e2E7PKPoHvvZmuCJwQQcDU6TUMbaeb3UTJMwNsngck0ifO6jZoG++SY3QyLatGNAkk3g9a4P2/of+BqYooeC4oZUI/1nopskupL3LgxJA6PeL6fQPRLN1QLctgY8aD/lT5Q9yFFnt95c/lRf92tWXrW+qy16/TW8z2RVqMWQuE0uZKTm03WoZDxWkf0oobeZsEW36yHhHB5PbHPZMVNokyRSy1RGsM+MKtnsLn9o3ST4DH8M+wsHnXIXrEd2Dz7mwrZQCtgH6QIygHbhSP0vc82r+8j2k2l0d2Dc2wTX1onQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8t1L0kKTM6VS4kKL16lpIWptNFVOQ2MHWzAzugJV+Og=;
 b=ev+JvFGxev+UAdrN6YCpv6BK8xw9mA5Rs/jSYh25FEfbeuR+WQ8XEvkVmREcgWsSC5N7dEOSyP+9XSrzBloT/mpVItiMpuRIrK7kyQPG0rje8LYH1xdFIjZ91258CjRljY5oYs6iIqOaRRa1oA3AdKG4isSDi9NKGvuMN/ZG5T8=
Received: from DB6PR06MB4008.eurprd06.prod.outlook.com (2603:10a6:6:54::31) by
 DB9PR06MB7947.eurprd06.prod.outlook.com (2603:10a6:10:29d::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.46; Fri, 13 Oct 2023 10:27:34 +0000
Received: from DB6PR06MB4008.eurprd06.prod.outlook.com
 ([fe80::71d1:d35b:e7da:6244]) by DB6PR06MB4008.eurprd06.prod.outlook.com
 ([fe80::71d1:d35b:e7da:6244%2]) with mapi id 15.20.6863.032; Fri, 13 Oct 2023
 10:27:34 +0000
From: SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Jason Wessel <jason.wessel@windriver.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: [meta-oe][PATCH] base-files: profile: allow profile.d to set EDITOR
Thread-Topic: [meta-oe][PATCH] base-files: profile: allow profile.d to set
 EDITOR
Thread-Index: AQHZ/b97Qis48Zl5yEqBO9jb/gMLEQ==
Date: Fri, 13 Oct 2023 10:27:34 +0000
Message-ID: 
 <DB6PR06MB400859907A9D2543961D71D5BCD2A@DB6PR06MB4008.eurprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB6PR06MB4008:EE_|DB9PR06MB7947:EE_
x-ms-office365-filtering-correlation-id: 6c883f5e-ae21-4272-456a-08dbcbd70388
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Zjz+91caqwf5pgJ7gtzLmWpArXEiIrXqo+u9rZh4WgCDv4BxdNquguf1AmNdABwG9cNY2O9skws+ksAmoK6SV0c2LKancF1b3CXmFWcaQwiizOKGGfAT/EejhbvDykbNoKX37h+XPs7UzJvJEovQo1GZvUSNVU4rZQmYF/epfRfS9ALDMX19p9f1IlMDFJolXaS0u6OAOspa9X8BV6PTNVKCvG7F7WJ8a5ComNqJGUjOOLZrkKiTlWCLxlnYrKq5ny8sJAGt8MzlGZMv76tSfDzlKK2oeQ6oq3W2RNGQOzXzdnlsOG7EVxHK9gx7PmMOYpMIgEG2as0KYt9NLRLEEEpxL3Ene2MXsfbDAr4YJXAvT/CLZMJJlkwP7BSnim1TKWnc9q2idl8fSmmETEn4DQEVtb/hCQhm/OQkvtLfAwvn44SSuCDqCXrTz9IJCNBsHPNJyrS2unMI7rbovx6BMLe3NCkb21EYqAasr3GuMWdTB54kdcsJG32KH6EPb8JRMFTMszcTrKEK7/37YN/xlRhEtPqvDdxN9/jPZrZaOEAsIt8eodfrOhD16aGEGpPALRY/Q+CcZSOln2FKKjYoHyPXA1bvIXCAb4TXzJTT2/Cta09DTPlGIIV3QmPNMLV2
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR06MB4008.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(366004)(346002)(396003)(376002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(54906003)(64756008)(41300700001)(66556008)(316002)(66946007)(76116006)(66476007)(478600001)(6916009)(91956017)(6506007)(7696005)(9686003)(71200400001)(4326008)(8936002)(52536014)(8676002)(26005)(5660300002)(2906002)(33656002)(86362001)(38070700005)(38100700002)(53546011)(122000001)(83380400001)(66446008)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?t3HkSR0vkLN876jZUJ2ys+L29KHqIhu4HYNfRedP3+yd8kCtFxur8obGIG?=
 =?iso-8859-1?Q?d5XHxttQplzqWYpHafpmNBIwTxFK08z7leVR46qk89+Ieq+OUR6ttdU0rY?=
 =?iso-8859-1?Q?IrJ/n3PiBZ5SOXiwpT1rjPyFAQtYeCHxqkx6S6ce0LVYfD8Rf1lvdOBHyP?=
 =?iso-8859-1?Q?ln4dqd1k/pyABi3l1JQRdbpjzI/P3dt8OnoDfqAYkXodjWsjiE1Z7rqV/c?=
 =?iso-8859-1?Q?0QWtDctu82c+BC1Qfvku4k73KaiwyVxfdrEHS1KITesxWJhhz4Q9myV4PN?=
 =?iso-8859-1?Q?LwzxLcKHGNpPs4WXk3CPrzD2UqUHAim8uS9feYAsLP7ulp9fpRCpHiMevy?=
 =?iso-8859-1?Q?aGWavTfZq5K7sO8Q2m6QKh6xoNihFA6MZtKG6VlZLQKRuV8OWQMN/S8gdy?=
 =?iso-8859-1?Q?5iw4QnWmIDEGNxFKkdW0FWHL0RuEA8QuEuqlXhWD3ldsHdW0rodfPcSHfw?=
 =?iso-8859-1?Q?4KUYyVVMXrqZG/QKDGiid0Kn1yfrPpJSC+GMz1lPF1CQvyTB1Cks4uHAf7?=
 =?iso-8859-1?Q?hhpMyVox+86A+F7RK0rT3jlVZ74kscWajEx9F7HBcD8QstFWqLUVGZQHH6?=
 =?iso-8859-1?Q?qIdRLY/Em9mmD+c1qtrelYCCZBbQs4+Ob6a4zPJdm6phBzEb6B5gnWIGez?=
 =?iso-8859-1?Q?phvU3ZEj8OD95xVnyQl6NNdfDbjMBcpz/ebjNGfcsof23IopAhAc8PnQho?=
 =?iso-8859-1?Q?n7A14WKaScOBZ6cJtzSMKHUh44tQa5q2nuagUVJWE509e/wT+JG+JvFQow?=
 =?iso-8859-1?Q?UG4rJHy1FmicmF4/7OTBcx9zBdaTPnLLJlcvXvo/vO2q7Pvn/QqkGaynJD?=
 =?iso-8859-1?Q?SUJl7kRC3iUArO+dHEZo6qehZ7lBH+SY064B/7rBnJBIQpbF8wJeKsfzCd?=
 =?iso-8859-1?Q?JAtkel9PM9SJQfEjWrYL+1zMBcqikjw7EoyLCy5muy8SI9fEeppqnqK13E?=
 =?iso-8859-1?Q?it6zjrqkcjG1Z5QHvgetJ2VkOQLILxUeahBwhmcKb+2MfYRn9mro+8jT84?=
 =?iso-8859-1?Q?gMJREVm5lID0nPv7s4j4fjCJpn+riAfNk7A4DwTdY8FBo4YM0SMKwTp/By?=
 =?iso-8859-1?Q?rvxsnEnqDe95eHj91BKSbQlpOfmtietOE4TRCL4R8r2kH3XreMvEgCkL2O?=
 =?iso-8859-1?Q?P57sCw9RktNoT7WZ/K6t+r1bMDkDnWkXgB82qE4E09uaHlqi5XzNqQP90/?=
 =?iso-8859-1?Q?uE0f0xT1csE7w0wxgCohLJ/CC+2lj3b8AWHvi/Fyt4CMdHe52fnxFX8kSj?=
 =?iso-8859-1?Q?1WxDiuOuzKxzNpyJCiWqeUZPI5sPHFpmYsGGO2op5LzpysEV2J3d2aaAlV?=
 =?iso-8859-1?Q?GpPMmOK0nFY8eswoQ7KJvBqoj3QdRor9snFJ4NEcQPbjeXXcquGRxwxfMo?=
 =?iso-8859-1?Q?8Irit8qRqlUpyF+TcRJ63HfY8ccpEaUjCFSvYfoOYi5Gvw2VdTZRwtMc4t?=
 =?iso-8859-1?Q?qKT44S3AG8CqrdMReKygR9AnxFEAyxo0MasJZRhlEOtYxAN82kjBWzeaxt?=
 =?iso-8859-1?Q?q2Q9zzdQYDxW5AeNkCpUiM+t7FBwY+3u6lt95S+tFF7BXpiAsYR5VJO2Uy?=
 =?iso-8859-1?Q?yB7m4bckt1LRGajGplEAV4K9i2VOYdKE1H1qLTHPD6gYZYW8qei0gglUPB?=
 =?iso-8859-1?Q?vX6bVsE/NLRg+EwvHGWu604nGWTimTo0DwY3PSpUkEpNa666ozJ24bCtQO?=
 =?iso-8859-1?Q?ueXo4a0WGwBbDpFHZUA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR06MB4008.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c883f5e-ae21-4272-456a-08dbcbd70388
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2023 10:27:34.0405
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PwnXrCQgKusY8ODqYKpQZqhT78ZRVrHv7kRigkUeexunpqzS9tZoUehqPWCQd8XwGU4Ze2yTk7EsE+TFqHdWsmrJs9nZIuG1y/hzOe/krHl3TjEi2mKgVwLOS+Ka1kHB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB7947
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 10:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189058

From 0013c8a6482018d5476e4eb2f4d537c96551e0c6 Mon Sep 17 00:00:00 2001=0A=
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>=0A=
Date: Fri, 13 Oct 2023 08:28:38 +0200=0A=
Subject: [PATCH v1] base-files: profile: allow profile.d to set EDITOR=0A=
=0A=
With a profile.d configuration in place that sets the EDITOR variable,=0A=
the automatic terminal 'resize' logic would not trigger. Which then=0A=
would possibly lead to a 80x24 fallback on the debug serial console.=0A=
=0A=
This can simply be avoided by setting a flag variable when the shell=0A=
is first opened, then processing all profile.d includes, trigger the=0A=
'resize' depending on the flag and shell-level and finally only set=0A=
EDITOR to some default if it is still unset.=0A=
=0A=
Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>=
=0A=
---=0A=
 meta/recipes-core/base-files/base-files/profile | 16 ++++++++++++----=0A=
 1 file changed, 12 insertions(+), 4 deletions(-)=0A=
=0A=
diff --git a/meta/recipes-core/base-files/base-files/profile b/meta/recipes=
-core/base-files/base-files/profile=0A=
index cc37e1ba77..bded3757cc 100644=0A=
--- a/meta/recipes-core/base-files/base-files/profile=0A=
+++ b/meta/recipes-core/base-files/base-files/profile=0A=
@@ -10,6 +10,12 @@ PATH=3D"/usr/local/bin:/usr/bin:/bin"=0A=
 # Set the prompt for bash and ash (no other shells known to be in use here=
)=0A=
 [ -z "$PS1" ] || PS1=3D'\u@\h:\w\$ '=0A=
 =0A=
+# Use the EDITOR not being set as a trigger to call resize later on=0A=
+FIRSTTIMESETUP=3D0=0A=
+if [ -z "$EDITOR" ] ; then=0A=
+	FIRSTTIMESETUP=3D1=0A=
+fi=0A=
+=0A=
 if [ -d /etc/profile.d ]; then=0A=
 	for i in /etc/profile.d/*.sh; do=0A=
 		if [ -f $i -a -r $i ]; then=0A=
@@ -50,17 +56,19 @@ resize() {=0A=
 }=0A=
 		fi=0A=
 	fi=0A=
-	# Use the EDITOR not being set as a trigger to call resize=0A=
-	# and only do this for /dev/tty[A-z] which are typically=0A=
+	# only do this for /dev/tty[A-z] which are typically=0A=
 	# serial ports=0A=
-	if [ -z "$EDITOR" -a "$SHLVL" =3D 1 ] ; then=0A=
+	if [ $FIRSTTIMESETUP -eq 1 -a $SHLVL -eq 1 ] ; then=0A=
 		case $(tty 2>/dev/null) in=0A=
 			/dev/tty[A-z]*) resize >/dev/null;;=0A=
 		esac=0A=
 	fi=0A=
 fi=0A=
 =0A=
-EDITOR=3D"vi"			# needed for packages like cron, git-commit=0A=
+if [ -z "$EDITOR" ]; then=0A=
+	EDITOR=3D"vi"			# needed for packages like cron, git-commit=0A=
+fi=0A=
+=0A=
 export PATH PS1 OPIEDIR QPEDIR QTDIR EDITOR TERM=0A=
 =0A=
 umask 022=0A=
-- =0A=
2.34.1=0A=
=0A=

