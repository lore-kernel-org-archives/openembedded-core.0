Return-Path: <daniel.ottiger@schindler.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E91F7C54E71
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 16:30:52 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.67])
 by mx.groups.io with SMTP id smtpd.web10.20453.1710865847232197055
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Mar 2024 09:30:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@schindler.com header.s=selector1 header.b=B6ioTYp2;
 spf=pass (domain: schindler.com, ip: 40.107.249.67, mailfrom: daniel.ottiger@schindler.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T75lfT7y/Q26HjOAv9GIk12M17u1XpsK3j453ZSAJ73smbXGmWSZy+Fi4Yi8ufSQyVHg3zhP+PdRJtcqtLBs/aP7bHpFQIdpSvMLyhQjr2Yj50Dv7G75UJhMf/0ZsKFhm0s44oINu8hfo09NyQDdmp0Q4Gywi7p4108xFD6jddmASgw65D9yWwC/i+fBD4a2kGtqCBsNSuBzDrFZc2oDfIkHoFjdYPKjI7fc4mMMWZ3MTnw14kGAtyG3+dT6BKuXBeIA6kZiZEWFU6TiKIwqbFOXQir5/E73LRzusX11keEnICVyNpqEp05JnPcc4cIxkDjC7vcQ/aH8CEPdBWThqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G/Pewj//Ybxs/gkSX+CCpsmjZ9WDJs5ErR18Kz92fy4=;
 b=Pr7OEolZmauJaWT9d1IYNJbViEXE9odSP0efe2gIWJzVhn4BoF/Dx4rKGD6LDH5vOcXd9I2rrnoUbLl/p5VF1gfMX+Js4MFDsANro+Oc5+r5EGe1vfrAfEI4+4JA9gb/IX/Snf8qTGGFNOigBbGTdT4SC4CDbQ/gROzRCoaXWAhiKCuAGglMTR5U+4dE4zADR+1SQFhx4JziXtScpFzU/iWVvQdQ9ahztoynjHHaVF1AROnyuuiqiY6YEavUDbRHTvEWN2yrkZ5zZTKfzU9eAbZgY2w0DoPNvSJ7dXbFiBxYx/dwbcM22pL0NnUHwSv9jWEaw4uy+PzgBz+3U400kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=schindler.com; dmarc=pass action=none
 header.from=schindler.com; dkim=pass header.d=schindler.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schindler.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G/Pewj//Ybxs/gkSX+CCpsmjZ9WDJs5ErR18Kz92fy4=;
 b=B6ioTYp2NpLrQ+egLyOwf5RKyt0fF0HUWMk4AglyYEJ/oZdlTfWR89emVOHLYzP13sQgDlQDro4SDs0fVYz3vjFbSBROl3+mSdvJ77R+5JfS7H51M2IcbbaBzxAwvJJvIWGwDAj6kL47ndBGl9DWVfQBWjB10RrUpvI/przThGtQfQ5NOiVaDUw4J1VjlaoOBJ1p7rrdaqTdhIbQdKVqjnn3IuUycHt/PwczA/CP0bTL77YtC7NAcnAFWgP96DpAU8JOFcVTdOCytuUaC061wltHhB0fLsNjJwAaJ8TBUxvWHs7tmyVfA8oXrQvWhARzzIQCxK/WJvHHJpIaLVhA6w==
Received: from AM0PR01MB6514.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:16c::19) by GV1PR01MB10640.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:15e::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.29; Tue, 19 Mar
 2024 16:30:44 +0000
Received: from AM0PR01MB6514.eurprd01.prod.exchangelabs.com
 ([fe80::3333:fd10:f938:da95]) by AM0PR01MB6514.eurprd01.prod.exchangelabs.com
 ([fe80::3333:fd10:f938:da95%2]) with mapi id 15.20.7386.025; Tue, 19 Mar 2024
 16:30:44 +0000
From: Daniel Ottiger <daniel.ottiger@schindler.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [EXTERNAL] Re: [OE-core] [PATCH] pulseaudio: replace
 "pulseaudio-" with "${PN}-"
Thread-Topic: [EXTERNAL] Re: [OE-core] [PATCH] pulseaudio: replace
 "pulseaudio-" with "${PN}-"
Thread-Index: AQHaehf8bRsj6AL+Xkm80yiengiiI7E/PL2AgAACcBE=
Date: Tue, 19 Mar 2024 16:30:43 +0000
Message-ID: 
 <AM0PR01MB6514572B842524D5F2C7DE73862C2@AM0PR01MB6514.eurprd01.prod.exchangelabs.com>
References: <20240319161026.2900153-1-daniel.ottiger@schindler.com>
 <CANNYZj-yPRWBUL8tOoUudWEV0w+067Eb6vJKBV1e1nZmVzaHWQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-yPRWBUL8tOoUudWEV0w+067Eb6vJKBV1e1nZmVzaHWQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_1dc4716b-92d5-4aa9-93a8-2ed8b74a3ef4_Enabled=True;MSIP_Label_1dc4716b-92d5-4aa9-93a8-2ed8b74a3ef4_SiteId=aa06dce7-99d7-403b-8a08-0c5f50471e64;MSIP_Label_1dc4716b-92d5-4aa9-93a8-2ed8b74a3ef4_SetDate=2024-03-19T16:30:43.633Z;MSIP_Label_1dc4716b-92d5-4aa9-93a8-2ed8b74a3ef4_Name=Internal
 and external
 sharing;MSIP_Label_1dc4716b-92d5-4aa9-93a8-2ed8b74a3ef4_ContentBits=0;MSIP_Label_1dc4716b-92d5-4aa9-93a8-2ed8b74a3ef4_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=schindler.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR01MB6514:EE_|GV1PR01MB10640:EE_
x-ms-office365-filtering-correlation-id: b73d9f5a-86e4-4b48-e548-08dc4831ec9f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 G4dN+qbxmzG+dRkuMgaamGBNOblL3BY4CrSv0MZl9V7isFDeWatEVadXvgI48aSOQRMootWjltW/qIpoBjezAS9Sw168/62R4xXOjPVVWMDaImxJZFrZkJx2p+Zx2RGFRgUUlCIPGl0xzYVB2NoRPNB3twiIWctES5UX5t8Re2M3RvzROFb27YpVf5B5jeylEhrV6mQjCxOiD2evLuKMFdVJd9kRyRd6dSHlLZ/CVBll8XwiJqjlJG2kM7jkFwZ/y14uoTM79rNs104Wqx2WRlk+t7huhtl3sC5rbhfFKXUDgwR+MLiSKfnfq0+fOcQ+b279DWKvYseMTVtBDDeUNlZBsFf98R3SZSA8N7akHvLcLZMolIKBrfGW8ji5eyYeaWSvmdgnzlKvUyIlxzbwmCjlr56c16FLa8PZZtL2hOFVlN0ezHdrjoCYF8SH8qW9yyFWyAXMfzl/dkCggR5/QeGhTWXW2/0FOOerkYpzN3etyXzTpseyYtEZHsotdKtd9rdVkkA25t8I14hMvB7FdIYlA/YktMJzHohiuhKBgccttZO6GBJ1aIK8gOZxfSyPzIjobUn4D4iiBbUBX0u555OP07hXxdyVYAEoBE+i2nxnddqr0zIoTsY3hu2U79wQmiFKzHpcnxDNTBqJ6ACpAm/MCYFM8BMQh5J0sjhvF/A=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR01MB6514.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?+U+S49c1Px6yPLL24GcjrVYNvma4t4pPYE7IeCuHe9gZRsKmlbyPKKa6?=
 =?Windows-1252?Q?NiZLEWlBHOXp0LqlBmPybtnruQKOAd/R3bW1StU64PT0vPTfEbd3ENhm?=
 =?Windows-1252?Q?O4nKzg7NCo3eCbrdVXDys3iyNtuAc7P9P0rVMxmKT1wqSdwzCpYz8GqO?=
 =?Windows-1252?Q?RryTWmI0eII2LeSaKuByhOFWoDpU/S48wYCUWxUKnsOvnJcxWLkVxEzm?=
 =?Windows-1252?Q?Yk7+7+L6n9OzZyDESEmNLzKmnBS8XniYkAABe1Ku1wV+pWtWfa9LtEyI?=
 =?Windows-1252?Q?H7bdryj3R/cTGlJr46xukFJG9on5NUK08cZkg5HWJefxsrEB/6qwVOQm?=
 =?Windows-1252?Q?6mbXlobMn60zCJhMuWjVoYDqjeVIcHUFF1oVCw+RGc2SqWmWR5KSQ3c0?=
 =?Windows-1252?Q?S1k64XDoZKN6g4o7vXoae80MtGbUTgQLsPNvKPR4i5SyrgyTqiOGQ9Ke?=
 =?Windows-1252?Q?qfFzjN1sbZlTCjIVIdrUWbakQFHafgDXi6xFVMNL66bBooUmAKjjiTfK?=
 =?Windows-1252?Q?++PpUo/lL1A43wqLHc/syNUUGe6ylBIOINTEL4JhfAHtgLAZysiKTC7N?=
 =?Windows-1252?Q?SuZ66ogxpEC2OQ7FuWiYB6GRRR256x8ZPUX+ANFgfeiex1BXiug9UYxA?=
 =?Windows-1252?Q?f3o6SvJ2z22nDdtXlIelv6bgjNH9pKnTWEeWpbbBCp62SN+5PhPbBdzU?=
 =?Windows-1252?Q?XHyDB1B2CydaqYBH9c0mn26LZoi2gtyCdN/sCblf8/pYmu4owgdj1XK+?=
 =?Windows-1252?Q?puxjangGIhe5Fay4jwRAKVy0GN+QzcqJCRTVhdoNeLrgzrDY5QXtP8P5?=
 =?Windows-1252?Q?+J9r1VTazHExSs+1FqdvYSFb46htkGvlWrxsrm63KohUq/R7UV41mSAd?=
 =?Windows-1252?Q?4bL4F8/U/9oT4Xm9cUOv47LKmMH+fRpVQGgXtjw1HS5IZAOT02GIJqfs?=
 =?Windows-1252?Q?P1LhzGf97SChBrKpqN+Gkh+0JTqETwwAuDILPnVXWoQsuvJyw8wFy1od?=
 =?Windows-1252?Q?bu4FAMHXTUJ0+S9os57E8UOg1Eohm0XfGsjAjNOsHfG61/8Uw4+wPswP?=
 =?Windows-1252?Q?4Y4zdCJoSqkBrkLqJ53c8N4OCxYK8wMYays7eycOEa7+yuYUdFc/vrK9?=
 =?Windows-1252?Q?zgO05Bpx5CnqkeogDtm+NBiYeTgvdoEU/nCXUbnW2gS4VXoYHpi1br8s?=
 =?Windows-1252?Q?dkCmGln5gquSMUb8cXM/ogizyUHZN4Q4Ai9bDTPtkeASxd0/Ae9tIzeA?=
 =?Windows-1252?Q?ovmalQqrxt6p7owQimscs2zC3KFvf3YvUTcbOEhZmNO49POfdybbXdWJ?=
 =?Windows-1252?Q?OLupL7OeR8p6RacmDWOTgPNgRX8lq+9K4twjNQMGEYK3n1QR+b8fZOWp?=
 =?Windows-1252?Q?sGPOKlD7Y1HthDRyCrh3e1oAYod21GzpxzahIJiS3+RR4KxkkHbm/2hi?=
 =?Windows-1252?Q?8WfFWGkWIykULgnxtXkWp8KVp7FExli8oXU+LihZPPMRez4W92M2FEGU?=
 =?Windows-1252?Q?x1Jx0nSyP9FQcc/wpyPCxNFGeHbUu/lrAdyZZ04L1Bs8H7guAakE4qsK?=
 =?Windows-1252?Q?ek2H2gyoLn4rpyRn+nwyQ/J8elHMBlCJW/pFHAC9w+I3d2+52a7E1I/d?=
 =?Windows-1252?Q?NhbWGlq4IjFKWF6MxrDddMFy7JKY7AHJl4hg+ZIgRs7v6LIroVvUPznj?=
 =?Windows-1252?Q?1Bs/wjj8U1SRh8q4lwT9uIxy7lLTVJWHP5lSvu3PG3c8QtldR04YFw?=
 =?Windows-1252?Q?=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_AM0PR01MB6514572B842524D5F2C7DE73862C2AM0PR01MB6514eurp_"
MIME-Version: 1.0
X-OriginatorOrg: schindler.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR01MB6514.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b73d9f5a-86e4-4b48-e548-08dc4831ec9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2024 16:30:43.9844
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: aa06dce7-99d7-403b-8a08-0c5f50471e64
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xXFKzMO+fIUHJ7cJp8qWHynLLnS6nKchQm5kws0hxll2nJT357pDI4vMMFZK86eNN4QTEeJKe/2JsIT8Ss3IXSDmRvESPfCRN8WZFSjdqsk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR01MB10640
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 16:30:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197326

--_000_AM0PR01MB6514572B842524D5F2C7DE73862C2AM0PR01MB6514eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

If I remove my bbappend file for enabling native compilation, and I try to =
build "vorbis-tools-native" I get the following error:

bitbake vorbis-tools-native
Parsing recipes: 100% |####################################################=
###########################################################################=
##############################################| Time: 0:00:05
Parsing of 3691 .bb files complete (0 cached, 3691 parsed). 5918 targets, 1=
137 skipped, 0 masked, 0 errors.
Removing 1 recipes from the x86_64 sysroot: 100% |#########################=
###########################################################################=
##############################################| Time: 0:00:00
NOTE: Resolving any missing task queue dependencies
ERROR: Nothing PROVIDES 'pulseaudio-native' (but virtual:native:/home/ottig=
eda/workspace/yocto-builder-scarthgap/meta-openembedded/meta-multimedia/rec=
ipes-multimedia/libao/libao_1.2.0.bb DEPENDS on or otherwise requires it). =
Close matches:
  pseudo-native
  pulseaudio
  usbredir-native

In case this is important, I also have meta-openembedded layer (https://git=
hub.com/openembedded/meta-openembedded) added.
Maybe the dependency is from there ?

Daniel
________________________________
From: Alexander Kanavin <alex.kanavin@gmail.com>
Sent: 19 March 2024 17:14
To: Daniel Ottiger <daniel.ottiger@schindler.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: [EXTERNAL] Re: [OE-core] [PATCH] pulseaudio: replace "pulseaudio-"=
 with "${PN}-"

Wait, what do vorbis tools need pulseaudio for? It=92s an odd dependency, c=
an you check?

Alex

On Tue 19. Mar 2024 at 17.10, Daniel Ottiger via lists.openembedded.org<htt=
p://lists.openembedded.org/> <daniel.ottiger=3Dschindler.com@lists.openembe=
dded.org<mailto:schindler.com@lists.openembedded.org>> wrote:
avoid preferred provider warnings when compiling pulseaudio natively.

Enabling native compilation was done in a separate bbappend file for pulsea=
dio:
----
BBCLASSEXTEND +=3D "native"
----

pulseaudio is a dependency of vorbis-tools,
from which we like to use the native version of oggenc
in order to convert wav to ogg files as part of the yocto build.

Signed-off-by: Daniel Ottiger <daniel.ottiger@schindler.com<mailto:daniel.o=
ttiger@schindler.com>>
---
 .../pulseaudio/pulseaudio.inc                 | 78 +++++++++----------
 1 file changed, 39 insertions(+), 39 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recip=
es-multimedia/pulseaudio/pulseaudio.inc
index ae16056d243..85515b3581f 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -145,9 +145,9 @@ do_install:append() {
        install -m 0644 ${WORKDIR}/volatiles.04_pulse  ${D}${sysconfdir}/de=
fault/volatiles/04_pulse
 }

-USERADD_PACKAGES =3D "pulseaudio-server"
-GROUPADD_PARAM:pulseaudio-server =3D "--system pulse"
-USERADD_PARAM:pulseaudio-server =3D "--system --home /var/run/pulse \
+USERADD_PACKAGES =3D "${PN}-server"
+GROUPADD_PARAM:${PN}-server =3D "--system pulse"
+USERADD_PARAM:${PN}-server =3D "--system --home /var/run/pulse \
                               --no-create-home --shell /bin/false \
                               --groups audio,pulse --gid pulse pulse"

@@ -166,12 +166,12 @@ PACKAGES =3D+ "\
 # RDEPENDS we define for it in this recipe, and thereby ensure that when
 # adding the console-kit module to an image, we also get the necessary
 # consolekit package produced.
-PACKAGES =3D+ "${@bb.utils.contains('PACKAGECONFIG', 'dbus', 'pulseaudio-m=
odule-console-kit', '', d)}"
+PACKAGES =3D+ "${@bb.utils.contains('PACKAGECONFIG', 'dbus', '${PN}-module=
-console-kit', '', d)}"

 #upgrade path:
-RREPLACES:pulseaudio-server =3D "libpulse-bin libpulse-conf"
+RREPLACES:${PN}-server =3D "libpulse-bin libpulse-conf"

-PACKAGES_DYNAMIC +=3D "^pulseaudio-lib-.* ^pulseaudio-module-.*"
+PACKAGES_DYNAMIC +=3D "^${PN}-lib-.* ^${PN}-module-.*"

 FILES:libpulsecore =3D "${libdir}/pulseaudio/libpulsecore*.so"
 FILES:libpulsecommon =3D "${libdir}/pulseaudio/libpulsecommon*.so"
@@ -200,7 +200,7 @@ ALLOW_EMPTY:${PN} =3D "1"

 CONFFILES:libpulse =3D "${sysconfdir}/pulse/client.conf"

-CONFFILES:pulseaudio-server =3D "\
+CONFFILES:${PN}-server =3D "\
   ${sysconfdir}/pulse/default.pa<http://default.pa/> \
   ${sysconfdir}/pulse/daemon.conf \
   ${sysconfdir}/pulse/system.pa<http://system.pa/> \
@@ -228,38 +228,38 @@ RDEPENDS:${PN}-pa-info =3D "\
                           ${PN}-server \
                           "

-RDEPENDS:pulseaudio-server =3D " \
-    pulseaudio-module-filter-apply \
-    pulseaudio-module-filter-heuristics \
-    pulseaudio-module-udev-detect \
-    pulseaudio-module-null-sink \
-    pulseaudio-module-device-restore \
-    pulseaudio-module-stream-restore \
-    pulseaudio-module-card-restore \
-    pulseaudio-module-augment-properties \
-    pulseaudio-module-detect \
-    pulseaudio-module-alsa-sink \
-    pulseaudio-module-alsa-source \
-    pulseaudio-module-alsa-card \
-    pulseaudio-module-native-protocol-unix \
-    pulseaudio-module-default-device-restore \
-    pulseaudio-module-intended-roles \
-    pulseaudio-module-rescue-streams \
-    pulseaudio-module-always-sink \
-    pulseaudio-module-suspend-on-idle \
-    pulseaudio-module-position-event-sounds \
-    pulseaudio-module-role-cork \
-    pulseaudio-module-switch-on-port-available"
+RDEPENDS:${PN}-server =3D " \
+    ${PN}-module-filter-apply \
+    ${PN}-module-filter-heuristics \
+    ${PN}-module-udev-detect \
+    ${PN}-module-null-sink \
+    ${PN}-module-device-restore \
+    ${PN}-module-stream-restore \
+    ${PN}-module-card-restore \
+    ${PN}-module-augment-properties \
+    ${PN}-module-detect \
+    ${PN}-module-alsa-sink \
+    ${PN}-module-alsa-source \
+    ${PN}-module-alsa-card \
+    ${PN}-module-native-protocol-unix \
+    ${PN}-module-default-device-restore \
+    ${PN}-module-intended-roles \
+    ${PN}-module-rescue-streams \
+    ${PN}-module-always-sink \
+    ${PN}-module-suspend-on-idle \
+    ${PN}-module-position-event-sounds \
+    ${PN}-module-role-cork \
+    ${PN}-module-switch-on-port-available"

 # If the server is installed, it's usually desirable to make ALSA applicat=
ions
 # use PulseAudio. alsa-plugins-pulseaudio-conf will install the configurat=
ion
 # that makes the PulseAudio plugin the default ALSA device.
-RDEPENDS:pulseaudio-server +=3D "${@bb.utils.contains('DISTRO_FEATURES', '=
pulseaudio', 'alsa-plugins-pulseaudio-conf', '', d)}"
+RDEPENDS:${PN}-server +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'pulse=
audio', 'alsa-plugins-pulseaudio-conf', '', d)}"

 # pulseaudio-module-console-kit is built whenever dbus is enabled by PACKA=
GECONFIG
 # but consolekit depends on libx11 and is available only for DISTRO with x=
11 in DISTRO_FEATURES
-RDEPENDS:pulseaudio-module-console-kit =3D+ "${@bb.utils.contains('DISTRO_=
FEATURES', 'sysvinit x11', 'consolekit', '', d)}"
-RDEPENDS:pulseaudio-misc +=3D "pulseaudio-module-cli-protocol-unix"
+RDEPENDS:${PN}-module-console-kit =3D+ "${@bb.utils.contains('DISTRO_FEATU=
RES', 'sysvinit x11', 'consolekit', '', d)}"
+RDEPENDS:${PN}-misc +=3D "${PN}-module-cli-protocol-unix"

 FILES:${PN}-module-alsa-card +=3D "${datadir}/pulseaudio/alsa-mixer"

@@ -270,14 +270,14 @@ FILES:${PN}-module-gsettings +=3D "${libexecdir}/puls=
e/gsettings-helper ${datadir}
 # running for the duration of the user login session). The device-manager =
and
 # x11-* modules are referenced from the start-pulseaudio-x11 script, so th=
ose
 # modules must be installed when X11 is enabled.
-RDEPENDS:pulseaudio-server +=3D "\
+RDEPENDS:${PN}-server +=3D "\
         ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '\
-                pulseaudio-module-device-manager \
-                pulseaudio-module-x11-cork-request \
-                pulseaudio-module-x11-publish \
-                pulseaudio-module-x11-xsmp \
+                ${PN}-module-device-manager \
+                ${PN}-module-x11-cork-request \
+                ${PN}-module-x11-publish \
+                ${PN}-module-x11-xsmp \
         ', '', d)}"

-RDEPENDS:pulseaudio-server +=3D "${@bb.utils.contains('DISTRO_FEATURES', '=
x11', \
-                                  bb.utils.contains('DISTRO_FEATURES', 'sy=
stemd', 'pulseaudio-module-systemd-login', 'pulseaudio-module-console-kit',=
 d), \
+RDEPENDS:${PN}-server +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11',=
 \
+                                  bb.utils.contains('DISTRO_FEATURES', 'sy=
stemd', '${PN}-module-systemd-login', '${PN}-module-console-kit', d), \
                                   '', d)}"
--
2.39.2


*****************************************************************
The information contained in this message is intended only for use of the i=
ndividual(s) named above and may contain confidential, proprietary or legal=
ly privileged information. No confidentiality or privilege is waived or los=
t by any mistransmission. If you are not the intended recipient of this mes=
sage you are hereby notified that you must not use, disseminate, copy it in=
 any form or take any action in reliance of it. If you have received this m=
essage in error please delete it and any copies of it and notify the sender=
 immediately.
*****************************************************************

-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#197324): https://lists.openembedded.org/g/openembedded-=
core/message/197324
Mute This Topic: https://lists.openembedded.org/mt/105026949/1686489
Group Owner: openembedded-core+owner@lists.openembedded.org<mailto:openembe=
dded-core%2Bowner@lists.openembedded.org>
Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex=
.kanavin@gmail.com<mailto:alex.kanavin@gmail.com>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


*****************************************************************
The information contained in this message is intended only for use of the i=
ndividual(s) named above and may contain confidential, proprietary or legal=
ly privileged information. No confidentiality or privilege is waived or los=
t by any mistransmission. If you are not the intended recipient of this mes=
sage you are hereby notified that you must not use, disseminate, copy it in=
 any form or take any action in reliance of it. If you have received this m=
essage in error please delete it and any copies of it and notify the sender=
 immediately.
*****************************************************************

--_000_AM0PR01MB6514572B842524D5F2C7DE73862C2AM0PR01MB6514eurp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div><span style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 1=
0pt; color: rgb(0, 0, 0);">If I remove my bbappend file for enabling native=
 compilation, and I try to build &quot;vorbis-tools-native&quot; I get the =
following error:</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Arial, Helvetica,=
 sans-serif; font-size: 10pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Arial, Helvetica,=
 sans-serif; font-size: 10pt; color: rgb(0, 0, 0);">bitbake vorbis-tools-na=
tive</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Arial, Helvetica,=
 sans-serif; font-size: 10pt; color: rgb(0, 0, 0);">Parsing recipes: 100% |=
###########################################################################=
###########################################################################=
#######################|
 Time: 0:00:05</span></div>
<div><span style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 1=
0pt; color: rgb(0, 0, 0);">Parsing of 3691 .bb files complete (0 cached, 36=
91 parsed). 5918 targets, 1137 skipped, 0 masked, 0 errors.</span></div>
<div><span style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 1=
0pt; color: rgb(0, 0, 0);">Removing 1 recipes from the x86_64 sysroot: 100%=
 |#########################################################################=
#########################################################################|
 Time: 0:00:00</span></div>
<div><span style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 1=
0pt; color: rgb(0, 0, 0);">NOTE: Resolving any missing task queue dependenc=
ies</span></div>
<div><span style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 1=
0pt; color: rgb(0, 0, 0);">ERROR: Nothing PROVIDES 'pulseaudio-native' (but=
 virtual:native:/home/ottigeda/workspace/yocto-builder-scarthgap/meta-opene=
mbedded/meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb
 DEPENDS on or otherwise requires it). Close matches:</span></div>
<div><span style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 1=
0pt; color: rgb(0, 0, 0);">&nbsp; pseudo-native</span></div>
<div><span style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 1=
0pt; color: rgb(0, 0, 0);">&nbsp; pulseaudio</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Arial, Helvetica,=
 sans-serif; font-size: 10pt; color: rgb(0, 0, 0);">&nbsp; usbredir-native<=
/span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Arial, Helvetica,=
 sans-serif; font-size: 10pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Arial, Helvetica,=
 sans-serif; font-size: 10pt; color: rgb(0, 0, 0);">In case this is importa=
nt, I also have meta-openembedded layer (https://github.com/openembedded/me=
ta-openembedded) added.</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Arial, Helvetica,=
 sans-serif; font-size: 10pt; color: rgb(0, 0, 0);">Maybe the dependency is=
 from there ?</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Arial, Helvetica,=
 sans-serif; font-size: 10pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Arial, Helvetica,=
 sans-serif; font-size: 10pt; color: rgb(0, 0, 0);">Daniel</span></div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Alexander Kanavin &lt=
;alex.kanavin@gmail.com&gt;<br>
<b>Sent:</b> 19 March 2024 17:14<br>
<b>To:</b> Daniel Ottiger &lt;daniel.ottiger@schindler.com&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> [EXTERNAL] Re: [OE-core] [PATCH] pulseaudio: replace &quot;=
pulseaudio-&quot; with &quot;${PN}-&quot;</font>
<div>&nbsp;</div>
</div>
<div>
<div dir=3D"auto">Wait, what do vorbis tools need pulseaudio for? It=92s an=
 odd dependency, can you check?</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Alex</div>
<div><br>
<div class=3D"x_gmail_quote">
<div dir=3D"ltr" class=3D"x_gmail_attr">On Tue 19. Mar 2024 at 17.10, Danie=
l Ottiger via
<a href=3D"http://lists.openembedded.org/" originalsrc=3D"http://lists.open=
embedded.org/" shash=3D"z+cJQhPC9pLmCv7SacY/MIs7kE9pqhhvkG/Z/3dQBkmU1UWokOE=
f9QYgQZPcS8dcaDH17Olk8cblh63bjpf1lEzIqjRPK0WdGNLKRwLahoA8pw3JWhGF+pYA6yXJB9=
6tC34cAWsL1sQ/nCs70QSrQWz4mKvx+kmje0XTohbctiY=3D">
lists.openembedded.org</a> &lt;daniel.ottiger=3D<a href=3D"mailto:schindler=
.com@lists.openembedded.org">schindler.com@lists.openembedded.org</a>&gt; w=
rote:<br>
</div>
<blockquote class=3D"x_gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; bord=
er-left-width:1px; border-left-style:solid; padding-left:1ex; border-left-c=
olor:rgb(204,204,204)">
avoid preferred provider warnings when compiling pulseaudio natively.<br>
<br>
Enabling native compilation was done in a separate bbappend file for pulsea=
dio:<br>
----<br>
BBCLASSEXTEND +=3D &quot;native&quot;<br>
----<br>
<br>
pulseaudio is a dependency of vorbis-tools,<br>
from which we like to use the native version of oggenc<br>
in order to convert wav to ogg files as part of the yocto build.<br>
<br>
Signed-off-by: Daniel Ottiger &lt;<a href=3D"mailto:daniel.ottiger@schindle=
r.com" target=3D"_blank">daniel.ottiger@schindler.com</a>&gt;<br>
---<br>
&nbsp;.../pulseaudio/pulseaudio.inc&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| 78 +++++++++----------<br>
&nbsp;1 file changed, 39 insertions(+), 39 deletions(-)<br>
<br>
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recip=
es-multimedia/pulseaudio/pulseaudio.inc<br>
index ae16056d243..85515b3581f 100644<br>
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc<br>
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc<br>
@@ -145,9 +145,9 @@ do_install:append() {<br>
&nbsp; &nbsp; &nbsp; &nbsp; install -m 0644 ${WORKDIR}/volatiles.04_pulse&n=
bsp; ${D}${sysconfdir}/default/volatiles/04_pulse<br>
&nbsp;}<br>
<br>
-USERADD_PACKAGES =3D &quot;pulseaudio-server&quot;<br>
-GROUPADD_PARAM:pulseaudio-server =3D &quot;--system pulse&quot;<br>
-USERADD_PARAM:pulseaudio-server =3D &quot;--system --home /var/run/pulse \=
<br>
+USERADD_PACKAGES =3D &quot;${PN}-server&quot;<br>
+GROUPADD_PARAM:${PN}-server =3D &quot;--system pulse&quot;<br>
+USERADD_PARAM:${PN}-server =3D &quot;--system --home /var/run/pulse \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;--no-create-home --shell /bin/false \<b=
r>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;--groups audio,pulse --gid pulse pulse&=
quot;<br>
<br>
@@ -166,12 +166,12 @@ PACKAGES =3D+ &quot;\<br>
&nbsp;# RDEPENDS we define for it in this recipe, and thereby ensure that w=
hen<br>
&nbsp;# adding the console-kit module to an image, we also get the necessar=
y<br>
&nbsp;# consolekit package produced.<br>
-PACKAGES =3D+ &quot;${@bb.utils.contains('PACKAGECONFIG', 'dbus', 'pulseau=
dio-module-console-kit', '', d)}&quot;<br>
+PACKAGES =3D+ &quot;${@bb.utils.contains('PACKAGECONFIG', 'dbus', '${PN}-m=
odule-console-kit', '', d)}&quot;<br>
<br>
&nbsp;#upgrade path:<br>
-RREPLACES:pulseaudio-server =3D &quot;libpulse-bin libpulse-conf&quot;<br>
+RREPLACES:${PN}-server =3D &quot;libpulse-bin libpulse-conf&quot;<br>
<br>
-PACKAGES_DYNAMIC +=3D &quot;^pulseaudio-lib-.* ^pulseaudio-module-.*&quot;=
<br>
+PACKAGES_DYNAMIC +=3D &quot;^${PN}-lib-.* ^${PN}-module-.*&quot;<br>
<br>
&nbsp;FILES:libpulsecore =3D &quot;${libdir}/pulseaudio/libpulsecore*.so&qu=
ot;<br>
&nbsp;FILES:libpulsecommon =3D &quot;${libdir}/pulseaudio/libpulsecommon*.s=
o&quot;<br>
@@ -200,7 +200,7 @@ ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
<br>
&nbsp;CONFFILES:libpulse =3D &quot;${sysconfdir}/pulse/client.conf&quot;<br=
>
<br>
-CONFFILES:pulseaudio-server =3D &quot;\<br>
+CONFFILES:${PN}-server =3D &quot;\<br>
&nbsp; &nbsp;${sysconfdir}/pulse/<a href=3D"http://default.pa/" originalsrc=
=3D"http://default.pa/" shash=3D"ydoYovpTcvbyfTqcpBP3iA3er3UP2oo7x1juEYx536=
8pPvn7mlQZT3Q6J5DYdxu8Qo9s6srKJaPKo5NN4Q/xgFKOUC9XyuOGyj5hL8BvZ7RKEdSL1Wfwk=
5sSh16dbFNh1yIM4fW+s3YB4j1X9NBg+QUlvlGrXREYCCPgFcuaWbo=3D" rel=3D"noreferre=
r" target=3D"_blank">default.pa</a>
 \<br>
&nbsp; &nbsp;${sysconfdir}/pulse/daemon.conf \<br>
&nbsp; &nbsp;${sysconfdir}/pulse/<a href=3D"http://system.pa/" originalsrc=
=3D"http://system.pa/" shash=3D"xJDdNpAjyATKPTciuU4GiK5o6/rS6UFkvdwj8fv2e7K=
Oqne3wooPuF2PbZ3YIPO59Ow0Ib1QpPeyUKISydgC8046Os3pyUNBpd3d+rZUM496yojqKXk9fP=
7vpPLs+DQ/6f6LDcuqEdDXmhGeCSi9Y6/CFHSM+lYk0l02foBBeUo=3D" rel=3D"noreferrer=
" target=3D"_blank">system.pa</a>
 \<br>
@@ -228,38 +228,38 @@ RDEPENDS:${PN}-pa-info =3D &quot;\<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;${PN}-server \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;&quot;<br>
<br>
-RDEPENDS:pulseaudio-server =3D &quot; \<br>
-&nbsp; &nbsp; pulseaudio-module-filter-apply \<br>
-&nbsp; &nbsp; pulseaudio-module-filter-heuristics \<br>
-&nbsp; &nbsp; pulseaudio-module-udev-detect \<br>
-&nbsp; &nbsp; pulseaudio-module-null-sink \<br>
-&nbsp; &nbsp; pulseaudio-module-device-restore \<br>
-&nbsp; &nbsp; pulseaudio-module-stream-restore \<br>
-&nbsp; &nbsp; pulseaudio-module-card-restore \<br>
-&nbsp; &nbsp; pulseaudio-module-augment-properties \<br>
-&nbsp; &nbsp; pulseaudio-module-detect \<br>
-&nbsp; &nbsp; pulseaudio-module-alsa-sink \<br>
-&nbsp; &nbsp; pulseaudio-module-alsa-source \<br>
-&nbsp; &nbsp; pulseaudio-module-alsa-card \<br>
-&nbsp; &nbsp; pulseaudio-module-native-protocol-unix \<br>
-&nbsp; &nbsp; pulseaudio-module-default-device-restore \<br>
-&nbsp; &nbsp; pulseaudio-module-intended-roles \<br>
-&nbsp; &nbsp; pulseaudio-module-rescue-streams \<br>
-&nbsp; &nbsp; pulseaudio-module-always-sink \<br>
-&nbsp; &nbsp; pulseaudio-module-suspend-on-idle \<br>
-&nbsp; &nbsp; pulseaudio-module-position-event-sounds \<br>
-&nbsp; &nbsp; pulseaudio-module-role-cork \<br>
-&nbsp; &nbsp; pulseaudio-module-switch-on-port-available&quot;<br>
+RDEPENDS:${PN}-server =3D &quot; \<br>
+&nbsp; &nbsp; ${PN}-module-filter-apply \<br>
+&nbsp; &nbsp; ${PN}-module-filter-heuristics \<br>
+&nbsp; &nbsp; ${PN}-module-udev-detect \<br>
+&nbsp; &nbsp; ${PN}-module-null-sink \<br>
+&nbsp; &nbsp; ${PN}-module-device-restore \<br>
+&nbsp; &nbsp; ${PN}-module-stream-restore \<br>
+&nbsp; &nbsp; ${PN}-module-card-restore \<br>
+&nbsp; &nbsp; ${PN}-module-augment-properties \<br>
+&nbsp; &nbsp; ${PN}-module-detect \<br>
+&nbsp; &nbsp; ${PN}-module-alsa-sink \<br>
+&nbsp; &nbsp; ${PN}-module-alsa-source \<br>
+&nbsp; &nbsp; ${PN}-module-alsa-card \<br>
+&nbsp; &nbsp; ${PN}-module-native-protocol-unix \<br>
+&nbsp; &nbsp; ${PN}-module-default-device-restore \<br>
+&nbsp; &nbsp; ${PN}-module-intended-roles \<br>
+&nbsp; &nbsp; ${PN}-module-rescue-streams \<br>
+&nbsp; &nbsp; ${PN}-module-always-sink \<br>
+&nbsp; &nbsp; ${PN}-module-suspend-on-idle \<br>
+&nbsp; &nbsp; ${PN}-module-position-event-sounds \<br>
+&nbsp; &nbsp; ${PN}-module-role-cork \<br>
+&nbsp; &nbsp; ${PN}-module-switch-on-port-available&quot;<br>
<br>
&nbsp;# If the server is installed, it's usually desirable to make ALSA app=
lications<br>
&nbsp;# use PulseAudio. alsa-plugins-pulseaudio-conf will install the confi=
guration<br>
&nbsp;# that makes the PulseAudio plugin the default ALSA device.<br>
-RDEPENDS:pulseaudio-server +=3D &quot;${@bb.utils.contains('DISTRO_FEATURE=
S', 'pulseaudio', 'alsa-plugins-pulseaudio-conf', '', d)}&quot;<br>
+RDEPENDS:${PN}-server +=3D &quot;${@bb.utils.contains('DISTRO_FEATURES', '=
pulseaudio', 'alsa-plugins-pulseaudio-conf', '', d)}&quot;<br>
<br>
&nbsp;# pulseaudio-module-console-kit is built whenever dbus is enabled by =
PACKAGECONFIG<br>
&nbsp;# but consolekit depends on libx11 and is available only for DISTRO w=
ith x11 in DISTRO_FEATURES<br>
-RDEPENDS:pulseaudio-module-console-kit =3D+ &quot;${@bb.utils.contains('DI=
STRO_FEATURES', 'sysvinit x11', 'consolekit', '', d)}&quot;<br>
-RDEPENDS:pulseaudio-misc +=3D &quot;pulseaudio-module-cli-protocol-unix&qu=
ot;<br>
+RDEPENDS:${PN}-module-console-kit =3D+ &quot;${@bb.utils.contains('DISTRO_=
FEATURES', 'sysvinit x11', 'consolekit', '', d)}&quot;<br>
+RDEPENDS:${PN}-misc +=3D &quot;${PN}-module-cli-protocol-unix&quot;<br>
<br>
&nbsp;FILES:${PN}-module-alsa-card +=3D &quot;${datadir}/pulseaudio/alsa-mi=
xer&quot;<br>
<br>
@@ -270,14 +270,14 @@ FILES:${PN}-module-gsettings +=3D &quot;${libexecdir}=
/pulse/gsettings-helper ${datadir}<br>
&nbsp;# running for the duration of the user login session). The device-man=
ager and<br>
&nbsp;# x11-* modules are referenced from the start-pulseaudio-x11 script, =
so those<br>
&nbsp;# modules must be installed when X11 is enabled.<br>
-RDEPENDS:pulseaudio-server +=3D &quot;\<br>
+RDEPENDS:${PN}-server +=3D &quot;\<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;${@bb.utils.contains('DISTRO_FEATURES', '=
x11', '\<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; pulseaudio-module-=
device-manager \<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; pulseaudio-module-=
x11-cork-request \<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; pulseaudio-module-=
x11-publish \<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; pulseaudio-module-=
x11-xsmp \<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ${PN}-module-devic=
e-manager \<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ${PN}-module-x11-c=
ork-request \<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ${PN}-module-x11-p=
ublish \<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ${PN}-module-x11-x=
smp \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;', '', d)}&quot;<br>
<br>
-RDEPENDS:pulseaudio-server +=3D &quot;${@bb.utils.contains('DISTRO_FEATURE=
S', 'x11', \<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bb.utils.contains('DISTRO_FEAT=
URES', 'systemd', 'pulseaudio-module-systemd-login', 'pulseaudio-module-con=
sole-kit', d), \<br>
+RDEPENDS:${PN}-server +=3D &quot;${@bb.utils.contains('DISTRO_FEATURES', '=
x11', \<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bb.utils.contains('DISTRO_FEAT=
URES', 'systemd', '${PN}-module-systemd-login', '${PN}-module-console-kit',=
 d), \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'', d)}&quot;<br>
--<br>
2.39.2<br>
<br>
<br>
*****************************************************************<br>
The information contained in this message is intended only for use of the i=
ndividual(s) named above and may contain confidential, proprietary or legal=
ly privileged information. No confidentiality or privilege is waived or los=
t by any mistransmission. If you
 are not the intended recipient of this message you are hereby notified tha=
t you must not use, disseminate, copy it in any form or take any action in =
reliance of it. If you have received this message in error please delete it=
 and any copies of it and notify
 the sender immediately.<br>
*****************************************************************<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#197324): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/197324" originalsrc=3D"https://lists.openembedded.o=
rg/g/openembedded-core/message/197324" shash=3D"xewBuyBIR1vWEhCkan5Ox9zB+cP=
RXXr6gxquect0slQAwlO3Bu0VMR5J6LYRodoC088qMveUNRlC3ery3XHkQiO7+kyEiHfa1qLQdl=
4K3irJ+qBeSxGGRNoTDRm1vg5cFHEDG2Auj7IPoZQm6w2H1isOoD8++kyOZcZVGcouhyo=3D" r=
el=3D"noreferrer" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/message/197324</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105026949/168=
6489" originalsrc=3D"https://lists.openembedded.org/mt/105026949/1686489" s=
hash=3D"t8gOUCg+imHBWSyStFu9J8y56JSKrADwz3WhFvFxzm8zmFDKcT/Mgp2yGVz6V3d1FPR=
2n5ZZqQlNpa7Xb2Rc+ei2awhn3Tf4l7zwAPGvu6EL4V5diuPQYDWOtOy4nLFx1h4IuljvvKN+Xj=
AwGB6zy0TZdJqci1NoIr/DXMeNIe0=3D" rel=3D"noreferrer" target=3D"_blank">
https://lists.openembedded.org/mt/105026949/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">
openembedded-core+owner@lists.openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" originalsrc=3D"https://lists.openembedded.org/g/openembedded-core/un=
sub" shash=3D"RDaIGZmSD6pTKpVhU/cBnslW4JeZeeAJkz6jIOnzqShmLQYI6CbPe2dbtr+8R=
VZkQyvk6tFzLSZWo5wWmrTPulIY03a/K9lkPW4XMcEihhDxN23f8/XoCCmAgSTjjPBvlQWJ7jJQ=
a8+pdRfdscqs1ji651bTPhxTq8GOBmQXaTw=3D" rel=3D"noreferrer" target=3D"_blank=
">
https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"ma=
ilto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>]<=
br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote>
</div>
</div>
</div>
<br>
*****************************************************************<br>
The information contained in this message is intended only for use of the i=
ndividual(s) named above and may contain confidential, proprietary or legal=
ly privileged information. No confidentiality or privilege is waived or los=
t by any mistransmission. If you
 are not the intended recipient of this message you are hereby notified tha=
t you must not use, disseminate, copy it in any form or take any action in =
reliance of it. If you have received this message in error please delete it=
 and any copies of it and notify
 the sender immediately.<br>
***************************************************************** <br>
</body>
</html>

--_000_AM0PR01MB6514572B842524D5F2C7DE73862C2AM0PR01MB6514eurp_--

