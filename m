Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 679D4CD98C7
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 20:01:09 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.101])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.55499.1781208067670631525
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 13:01:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=K3FFoisH;
 spf=pass (domain: navimatix.de, ip: 52.101.70.101, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ehZRW2MTH9lcTv4gzr4Wfph2ERPXkWhuQ9k8GRRdfsnytpPmPCHjDI4dzviYkhaZqnuXsYeUDXbqXlhNWfOd4vgErRWgBun26Z6VRzQpw7ZvI7VY4rGo2TrMX/4hALGCSKwyOgIrtUCBruzF6rOTp7KN9WbhegUA5hOLbl+zNfjFA1TvjhU1K6rlR3ISn4do8yFGIHhWmWhsU4OkVBr660SuHHUOi6cgf2jWf3/gwylxRioA1OO0rO8dUMM2rzVyXBY56KbOqP2bBmcOdbN1Hcgv5lb8DLaodZTyiPgfGaTUJJT2GwvXmuMsV3Ke+UrefelCZFd84cn0N6fd1d4Axw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ijNQUZJY5eMkAIkx9rYtpTKKh4vX4yn3fWwWh2wLeM8=;
 b=Fsv6u0G3IAt1Ibjz7uh0t8uYNNwiOufwO9t7Mz+WHvJwsPoa3YBGX3kEqr2bmnClNeWMJmUPs/n/TVWok+n7GsdpfNh2jNiT0AufGLn5XXNe6g1GG8hGsVbwvCK/L6oxu7fYj7+AtdKEdvQD69HmS/pdmCmi4LyAbDB6Y3y2vk8bhR/JO1iipMpDvoUF6OUP2bG1jNANIonXfUs/qsWV5tXdPqhBa2SIicV0dWvfj+tS876BZaKQUBONaiVPu05FeR5J7T2k0lgcWShRf3yc+CMo1RfUjpDYCcDEGR1K6yaKRSA9uhWq8wOK+seEK8U6Q3pmbbv2H89AXjItA8bfdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ijNQUZJY5eMkAIkx9rYtpTKKh4vX4yn3fWwWh2wLeM8=;
 b=K3FFoisHTFydxwmTi1/q+ThCE8ZwQiXSRY5QMYuEvcQ9Nxcdx2487PPhAMOcoMjYIVhzbUrC8D+Jr6S/5Kas52iJbupjh+odxXXtE4VYm98yXw7obv8OENr27exZaGTvSm6i421Si10JxAs3ij3t/W3wYtjLcKMIcbYJb9NyZ9I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by PA4PR01MB9284.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:27f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Thu, 11 Jun
 2026 20:01:02 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0092.017; Thu, 11 Jun 2026 20:01:02 +0000
Date: Thu, 11 Jun 2026 22:01:00 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] less: upgrade 692 -> 704
Message-ID: <82a2bcb80ea429ca4cb5210cd872881c35eaba8b.1781208058.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0241.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8b::16) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|PA4PR01MB9284:EE_
X-MS-Office365-Filtering-Correlation-Id: 40a30da6-fb2f-4187-4b1e-08dec7f429b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|12006099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	jFBauzZExYaKJ4YyIjlT2eUl5acpHh8Ud+VZvFzGiE885JL5+wrp6L0Q1zJtpM1T5IPwqfmVfJYkSSy/ur21RvLI00CcQAkmqyaWyBgJGQY/mXmSoSZJDvyX+8UHwAftpNb7fceUf0lTFJyIWhz+5n6nYKt1UCAhqiWh0wRld4QGkhKFpior3Wf43mDyDGYBbcE61hafQM3WPEpopNaD6DTQY+HioyPedgyugdzKlIRI3LGx6wNmdm2IT/m4WC1CIow4jDIkxlJDaeZmY4/BpmxFi9STNjjwEWK+bYW0A6pm5x1GuELAHOD4HmO5SxjZxyjM92n3A0XUMifTe4l6CrnQPt5yZ6/m8+TBcbMRYzG1/Q1W5j+496Z8DGuI7BhXubFehtCval8vzmO1XhIqkcMQ5nAP45D2PC2vxKY1GJ9TJJxT7SFbRA1nEkZsrj3g/Ta9WvL3PTKYUFAFCP6TpipgHpUN+5mE2xu4X2bcoFRol3p6EvQpUheo/9kGuzU8kydT2AxWHnHO2eT6tnZGIhRcYbaj/l/LJ5DPY59/b2Bed3BwW3uoCFBBIuBdV33qCU7uKvutvJgRksZIiZF+rcyqEXkHHXLhhhSkZz+E6KTCpVyOJZRTHZahHXqxeC4EvIz0CsErtDsDOepGwDLy8uOBwSKcBiEJ2QxRE8kCyehnVHH9aX/smlFrfvxtkAcEJh2DzXrUjYj8NJc0oXrrvw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(12006099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?teau4bJWpXv5QllLRGahNSikAXFgRyHofQNqVtmUZ4rYR6SuZPpUJ6kfle9X?=
 =?us-ascii?Q?wFsrCiUEHK1IcvmsPeRv0qNqG1C/DiPsbtdQp8xkJwmcgc855kIZWYU/+fqf?=
 =?us-ascii?Q?orjcQEaqiakU7FCIC9UK18E7RA1QHLSt+Pv6K9oLe5k68hk2RDa2yQD+yiDx?=
 =?us-ascii?Q?8LMwfeXAR2cOyKJom0zXuVHEPX+hmd51CaBA51ygJqaMvq57Ld1mwWqcZDHz?=
 =?us-ascii?Q?1ubHhM1W5523lLbX4xpWLG7oywwGTTAeJGrdM0HfgcvMsvGdqedfNXnax7Kw?=
 =?us-ascii?Q?QW/nr11fcLRLiI8hJZk+12DeDhK/0HaDVrLe6LAYO8zrVoC+w74/3a6c11QZ?=
 =?us-ascii?Q?3YD/SoxXh0eRP3HJ1b4+sKIUJFa1Gu+F/33BTe6ThLz0P5gyfYk/YyTEPboe?=
 =?us-ascii?Q?hN3a9eTBfyl/rRDZOXXTfpHz5+u63cqykKJJwShA/koPwM2yAJBM4ruckndS?=
 =?us-ascii?Q?Y6Tre49MskiC6bAh5L6ZpVNSHb88YYkHH7n93GwHmJOCnyHm8sBYQD7PmjmZ?=
 =?us-ascii?Q?a/Z/BheoOu5MQ7kk32jLc4G/0QicZ62bMLcLWoJ6B4DVqGwAS7pp+ldZpVLz?=
 =?us-ascii?Q?tEDi+xJ5sIzdmsWb7YNq6H4KjAWEmu+FbdiVCAgG2i9rUzlvkBO1ZJFf3ZAa?=
 =?us-ascii?Q?lXy123U7FRg/P3FuCrDm7LmphI/oR5sT45XhKxpXSfrDuHNAsopIomEtbYY3?=
 =?us-ascii?Q?CZhnYbLEPZAyWijKS8R5RhsOy6PML3xvu6tO6dQnmPaGoCT8iedkOxduYmz2?=
 =?us-ascii?Q?FxIApLE+g1zdFMwKTOhzcy1BMCEidkaPzIUz3RHUFziOlfM5kuGU3IoWcdKZ?=
 =?us-ascii?Q?Ln65oHXwfqASoqC5ErY9Q8MCXD+efHJ90CDC95VHRR2p42Ls9fFt/15MST33?=
 =?us-ascii?Q?Myj6BVqv+QlR6qchwD4s8VYS+z/S6pkY/VWsDVnbUytD2VjvwytRpDcjiXYX?=
 =?us-ascii?Q?p6WYYSdaXrvQN+hbB+SC8XDz7HnmMGLRsF+DSOH645Ld8PAeSThH9hjRls4J?=
 =?us-ascii?Q?oNJWj/ZOB2XwfRVJ+10++jj6+26l7W2MNLvh+MHxCYrD0cPJiExovAWppwNa?=
 =?us-ascii?Q?AeaS7zNiexGOS6qd38tOPrV4eSCVfKDaQbXHkpMlDnebJz0Cks0viswGfeSq?=
 =?us-ascii?Q?KM1FhOy+0Qc3zWWbwcEdXi2e+pO3qaVzfRVSM8A8mo2zbQ/Fy5XVV0t+Uzw5?=
 =?us-ascii?Q?QXoYHohOwxh/uREuPD8IcFEGnW3oPr8S2sPCUbuD7ZDcXcHNbbCwghQi+Yi+?=
 =?us-ascii?Q?OYgWmsI879MAnGfWhM1WZYrdCKxfKTSM6BHx+hH5nVpMVecZ2fn+goGo0TF7?=
 =?us-ascii?Q?q9+o1w2dNsAVC8GqZ5C49DZmiTjutXyuz295D10PCgin4c6KmIGChTsHFC9k?=
 =?us-ascii?Q?a66/gvVQxZbBQAOKBxbV0rErbcYNomY+d4O3tJeTh3GewFopGXZVN17KqqyK?=
 =?us-ascii?Q?ljWH9YzN50EAVckuabJhb/QpOuudOI7r5UPOyk8mvZTkNdxMg8znygFnZNb6?=
 =?us-ascii?Q?q9Uf1DOgtczf2JowpvdRsXXz+O6VbOaExiTCVDOMoEYOkEOwqvsJtFDA9zml?=
 =?us-ascii?Q?/G9h1YulMJP9bkyALZ0CFiV5lO54m8Z6aoVYIT/rGMN8E46w2FVCrDs3E8BE?=
 =?us-ascii?Q?1S/f/XkKaKhxA9VjEpp8hYvpwz03g9d6+R0VgEnVSPO9KlkmTtu/1jBwZEEb?=
 =?us-ascii?Q?HgMdnfKHEOQ13JHBj1Jhb4gUZuVDuzCBb7RKk6bIHcQpNzGSg06jLHmqBT5E?=
 =?us-ascii?Q?VdOQ8O27mM2eBPFuA11ZLkbcopH5n1w=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 40a30da6-fb2f-4187-4b1e-08dec7f429b2
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 20:01:02.0965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +G8M9NShrQAVKYTX2S9JijHLGyVvd/cE8xgK4DwNEZbOHZ05G/f1OA9eMRuo6R4AkTRAN+RymQXjPcw1b1m3NXFsuTH2QumXL/A5ZSOzXIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR01MB9284
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 20:01:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238587

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Supply DESTDIR to make install. Otherwise the build fails, because libexec
points to the real rootfs.

Changelog is here:

* https://greenwoodsoftware.com/less/news.702.html
* https://greenwoodsoftware.com/less/news.704.html

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-extended/less/{less_692.bb =3D> less_704.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/less/{less_692.bb =3D> less_704.bb} (91%)

diff --git a/meta/recipes-extended/less/less_692.bb b/meta/recipes-extended=
/less/less_704.bb
similarity index 91%
rename from meta/recipes-extended/less/less_692.bb
rename to meta/recipes-extended/less/less_704.bb
index 6f621905a0..76a06e9cdf 100644
--- a/meta/recipes-extended/less/less_692.bb
+++ b/meta/recipes-extended/less/less_704.bb
@@ -29,7 +29,7 @@ SRC_URI =3D "http://www.greenwoodsoftware.com/${BPN}/${BP=
N}-${PV}.tar.gz \
            file://run-ptest \
            "
=20
-SRC_URI[sha256sum] =3D "61300f603798ecf1d7786570789f0ff3f5a1acf075a6fb9f75=
6837d166e37d14"
+SRC_URI[sha256sum] =3D "20a0b0a2bb2525fa53c7eee9beb854b4c9cf172eabb209af70=
20743547bfe9fb"
=20
 UPSTREAM_CHECK_URI =3D "http://www.greenwoodsoftware.com/less/download.htm=
l"
=20
@@ -45,7 +45,7 @@ do_compile_ptest () {
 }
=20
 do_install () {
-        oe_runmake 'bindir=3D${D}${bindir}' 'mandir=3D${D}${mandir}' insta=
ll
+        oe_runmake 'DESTDIR=3D${D}' install
 }
=20
 do_install_ptest () {
--=20
2.53.0


