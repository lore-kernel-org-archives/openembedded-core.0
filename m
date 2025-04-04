Return-Path: <Mario.Schuknecht@iris-sensing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C03C36010
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 15:14:44 +0000 (UTC)
Received: from FR4P281CU032.outbound.protection.outlook.com (FR4P281CU032.outbound.protection.outlook.com [40.107.149.82])
 by mx.groups.io with SMTP id smtpd.web11.13807.1743779676490791547
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Apr 2025 08:14:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@iris-sensing.com header.s=selector1 header.b=Pm0xZNtx;
 spf=pass (domain: iris-sensing.com, ip: 40.107.149.82, mailfrom: mario.schuknecht@iris-sensing.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wCLLw/2/B5XWEjlDI19rfQ+sBfo4XGvX+ak0S1s3So406/ktnlt+KK6at1BQsnnL5kafxKrFfTMtK+ns1EPKXin15xQarng6XtEdC3zjU+Pi4b8VWEZcsCdfxmCXXWcKNtI0rIA5RtSmPzUOIWByh5lFQotLYcyms1Iwmj9rDDJJSXYE5h093fEyJn5sEikn9eqtUkfFz52KsPFapsiK0gFd4km6i9kCAoAl0oo533b7XnngE6GO5hq+GLBoVIgb2Jrk0hr/m+ANiGlZ2O0h8MZfUbvewmqzLXr2HL3JQsgwfEKXwj95z5bPUt0aO9Sgrco4yH85IYdjDAIZch73Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/HkncYF6fraeEJtgr0p83GpAZP/TYqxM8LsD2Gv69pE=;
 b=miXTAa7Wn5+K+AKQQIjnb94PGqBQHOGHSEIU+FcjOrJHT6Imxp4lJYw5OhtLqknWg7W5xQsqxez72+d22XCEMC7smKEH+VQ3hTFpIMvJaUwKcXkRueCNuAUbHvqhW1Ti4vf89CaZoTV+d7Dxq44hxlrK5IO8FVrufzfZClWmJ4EDIT8Yx/KB0/hMRx6VeFtd5DArrNZJnN78cpXKhlhUU3oukfYTH80afH3Srw3kmxsWvdoONsqkZvx5sUT6xhW2GvSdt0HVvVBagfPw+iUfMXnSZSmSwIdtrwuMLzIALvkSO0aiaJNFzB67IOFyDD5/QA85lJxGL6VuJWm1ehjlrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=iris-sensing.com; dmarc=pass action=none
 header.from=iris-sensing.com; dkim=pass header.d=iris-sensing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iris-sensing.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/HkncYF6fraeEJtgr0p83GpAZP/TYqxM8LsD2Gv69pE=;
 b=Pm0xZNtxFkRZj40eTHqlc71QbPCKZ9niGY+Sf9qIowqTTQX3abSYXNKl1rZFCnuOC6jylOI/wJQIrmEpMJOecVDpyIWSR5V1MoFqunFco5v7/2HgpCuAcVhud96aaSVlr1YbHcdGeL5K4xhDKLBfOGvVNkDDtie+OEt3MnHevPOVo0mNU4DWYdKUDeotL4bmUy8NFL5KoYY+xLZEUJHBimWWI1f/wHFMHwsNFCJsqyL8KOCL0/cHQieT9FjliFVqk+a9lgOilnpc4ontBqKBQH620EIz9H7hiWVO6SLkz8O7I/5RZWEgJHXm7Ul1wmjJ1E0GSoUDzhQEhB6rdPq5Xg==
Received: from FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:34::8) by
 FR3PPFB94CE6166.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d18:2::187) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.43; Fri, 4 Apr
 2025 15:14:32 +0000
Received: from FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM
 ([fe80::6715:31c1:c53c:270b]) by FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM
 ([fe80::6715:31c1:c53c:270b%6]) with mapi id 15.20.8606.027; Fri, 4 Apr 2025
 15:14:32 +0000
From: Mario Schuknecht <Mario.Schuknecht@iris-sensing.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>, Mathieu Dubois-Briand
	<mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: AW: [OE-core] [meta-core][PATCH v2] libgpg-error: inherit lib_package
Thread-Topic: [OE-core] [meta-core][PATCH v2] libgpg-error: inherit
 lib_package
Thread-Index: 
 AQHbmnPP0QBf95+sukinf7d01CDLErOBAZGAgAEZvy2AAANiAIAABl8AgAFPrpqAAa4K3IAAaysfgAAEiACADhzR3Q==
Date: Fri, 4 Apr 2025 15:14:32 +0000
Message-ID: 
 <FR3P281MB1917B56C58FEF4BC1FCEC291B6A92@FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM>
References: <20250321151245.21227-1-mario.schuknecht@iris-sensing.com>
 <D8NTZA6A6JBD.5NEFFO2SQS5Q@bootlin.com>
 <FR3P281MB19170866636FFF96C26464B8B6A42@FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM>
 <CANNYZj8s=w0CY3VFOCRtzn9z=LeH7H+z_TXS2QcvcRJyeUbAXA@mail.gmail.com>
 <5cdce6f6145ff07615ebf8496b21cdca9c75641d.camel@linuxfoundation.org>
 <FR3P281MB1917204FF59FC089654B5FCFB6A72@FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM>
 <18300D8D696CD25C.32743@lists.openembedded.org>
 <CANNYZj8tqi5tnomg7t5k9iGHj_xCszmC6nCYfKmgh=yToiM9aQ@mail.gmail.com>
 <FR3P281MB1917CC7FE52D22DAF61020FAB6A62@FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM>
 <CANNYZj_E+01hDV3hF=9AjPnEZTfmLCAwav203=XS7Y8sZquRuQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_E+01hDV3hF=9AjPnEZTfmLCAwav203=XS7Y8sZquRuQ@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iris-sensing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FR3P281MB1917:EE_|FR3PPFB94CE6166:EE_
x-ms-office365-filtering-correlation-id: 340f5289-25d8-488f-43a9-08dd738b6756
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?K9AwVt/p9N/Wl816DQRJBwmbTU8XWnZ8CAtqURptyE/JgwVaogJRLdqosh?=
 =?iso-8859-1?Q?vxF5H8t78LL5d1WA/rFhmROhCw2KuZYxLzlxs5yXiNYjzeri7tbU/N4igA?=
 =?iso-8859-1?Q?/h6pP/8Ryamd+aMiKWMD4Bg1O8mhTbmkjzfzkFBL9JCxWlZznpV1/Z0POp?=
 =?iso-8859-1?Q?QNqV1w2SyYXjkDhx+uk/yX3KC/csmlZlGoY7y5WQfoL7KsdsOzw8+TWEcb?=
 =?iso-8859-1?Q?oFbGe6WkhRbclVRP0Drgyq6WRQz5WUVg4pfh22JEeDutCh4Afo+hy0IUNr?=
 =?iso-8859-1?Q?/DKuQ/AjfyLSg7cNhYxpeJAM9TL+xkGJPZyRxgYsOeM3AzzALARUMtwyAF?=
 =?iso-8859-1?Q?Q9TaKTw0jOJprF89ukebrOyWzH1k9dVkSoRWYpXvNHF8W6sUvJazI8v9iw?=
 =?iso-8859-1?Q?dXUCoOYnD8SgN6WmgRFiFEv/mAGl4DsKyJdT/rDTljYErLo9Ec0lGQ08Pd?=
 =?iso-8859-1?Q?y34wuc3sx7psr3GSJMFHG6J9vH2yYVzzlMKerpbuM862qO3603vZXDJiIY?=
 =?iso-8859-1?Q?IDcQD4M7RrHIwTX67K3Lv7WanASSnkqWmqRDHUTiiuGKNtvEEEDquttODf?=
 =?iso-8859-1?Q?vHzRFjvTj5ZO4jZ9Aw6ZW5RvqnuatdugTY+JTN//KmK4L2wERkYOqkjDnx?=
 =?iso-8859-1?Q?o45CQBfiMmIGM4BR+Plrpp9szPhWX6ejGN4wDEHhlDqrUdsAG32Iz61Yp5?=
 =?iso-8859-1?Q?QOX74GWYvdJvKY9GUyqFJInkiWQ32We7dS2IBs4Iu9FnE9jpCm9zDHMJg7?=
 =?iso-8859-1?Q?tJAluQSWLi6gx42bsEW/IUb005LGbGKZfB2oVVoJpJDoNZ5n7bPorqWv5j?=
 =?iso-8859-1?Q?ayVdP3EHGrN6RrelvexhDOSmtBF1F0CKugygbxBrQskPP+0ajY42PgiEzn?=
 =?iso-8859-1?Q?6eU8rgpiXq/+oyotlBzmFbX2LlrsFwDaZFDmMOtTPswkIv+zaEV/QndOli?=
 =?iso-8859-1?Q?UrWqIf1pQJOSfzHZNaGxTGh10OkFfP7heURXNCFnNempIKSe5KDyonNJNx?=
 =?iso-8859-1?Q?78qQNKfc7xunY9iD0TBxAJ6oPwbhOHXcNHrh+q8NaeEfBL5tpx9FkYQDj8?=
 =?iso-8859-1?Q?ipExKV9PiYdrPkwpbT+a5PZ8Vh6oD/4dNmlBCABzYNlJ76EIa92T/FF/Dt?=
 =?iso-8859-1?Q?tpOMK/iqSYaAG43++5KKUeV+Wer+/yBq4NEs7tR8nNH+H+XTiybOoqkAhb?=
 =?iso-8859-1?Q?2zIGfGg97aD+zfjX/RpXVFC8/uTgsFOkbSz/8ApndVYLFrQd7rFcfKKpVG?=
 =?iso-8859-1?Q?8ghlpWmUhIoLPsRxr/WwvCoiewgm+2lxbqb69S8LrdtIajJkpMqX5+nmpp?=
 =?iso-8859-1?Q?omRHVbBIu8/2kuub2RX3l7PmWDbp1ud4hfs7KUmzPJqibCReKF7b5WB2TO?=
 =?iso-8859-1?Q?cSk8IZOIyRpy0Dx7B2A2qkwwXhlG3GIx2xK6J+ag5fHmcXoYbeGoKBC5aj?=
 =?iso-8859-1?Q?IS3foYGjqoMOKDoy2k8hRO866WxNY3qRIc90iyx86RLn+BAbBZMCJzzGOW?=
 =?iso-8859-1?Q?ydPMGLUmocCCuPo9lSTrO92ke0UgzPBpxstIuFK0SuWQ=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?y2Pb2Or8NEqNNFB/HXVtEqrsfqc9IjcC530ohtcQkXBw3dCvoBqKGzbvEk?=
 =?iso-8859-1?Q?b7bGSUxyh+LJm0Mgh5/vCEYXbhc8FB3s8UqU5ruCKfgRP/luBumKLI5Hfh?=
 =?iso-8859-1?Q?Eq3f4mNPecG/F1wDvRBBqHD1cS90bVbCxGM4mvT1CaZ+FvzdYuB/ropu+s?=
 =?iso-8859-1?Q?CguVUXXM+psVw5965EOGl60t5ipTTOJLXQ1JjMCBNj+804A/KglaouRUv5?=
 =?iso-8859-1?Q?dt9Mj1STjryW7NUpnKQdUwFZr6nsPjaZdlDPyP0NpsIaZ8dAKNJ3cYVpXn?=
 =?iso-8859-1?Q?gmTXMhghPa9brFcZh+St+1XGQla0/s+6ZYvYgD7rTB0ktTN6surmF0NNzf?=
 =?iso-8859-1?Q?isQ9O5j2016W7uM1/QjLNFjoqlOzFq+Fx0WZ9M+anXWmQKJhG0QHkut3QG?=
 =?iso-8859-1?Q?XH/+phvNyIXxOBZ+b+6RRt5j2B5w+D8bMSaCgn3ZCN0MfkP8zcQfFlxw+C?=
 =?iso-8859-1?Q?hmPicWmtf3qZRN24KbWHa4xMII8WHmCK3EVTY10n5eneef2TRy/+Bve6zC?=
 =?iso-8859-1?Q?ZWFKl1k+hcAlPN9OWwYhBS9I1SV+lu00+3jzi+P+7pQ8sZEEhfmrmq29Uc?=
 =?iso-8859-1?Q?ZPQmnLRaiCzMDP5TCtynAX2FFNhIL8/tCaoHhLjM2MqcKPqu4LAVtxn0tj?=
 =?iso-8859-1?Q?pmS0AHI+eVV26COM+gKSQB59ZWNhrIPpx1g5Ayse+RsEbAflSPnhPvPeGL?=
 =?iso-8859-1?Q?ls9aFX6jB6HToCBditukx4PAzQOugRBHFt7uifS9X9JzAI9hA59TqnnagX?=
 =?iso-8859-1?Q?DnHo8ElbYWmqE13dLa4AYQrUNuPwMQXxBLgMVq/JteN+G7c1JQI78UDHlx?=
 =?iso-8859-1?Q?3pqsMV7pZYuAaXZDqygeCRfdfdZnfJ9JAnQFKK6EmaBTnbj8tzGSAp4a8C?=
 =?iso-8859-1?Q?kL620IZ1EWnutizgVkVcF5ERdeWUqVtII4TikR0yiWbkEVVRjCcHVOEqCD?=
 =?iso-8859-1?Q?eLas+SrFb1BXRgOBIyZZdR5SGZtbWq3jIOOkmGtPouIyacS8oU0bj/9Wc7?=
 =?iso-8859-1?Q?21SrU1SAQBDU6OLI5QxjacHXFoR+HA7QoJ/+G5sq97V01PMceZjvk6L5jg?=
 =?iso-8859-1?Q?bROkc8tUquqBqgA5bWpRKYcFReG654a3FG7DD6EkoBCZwhE5301SS98fMf?=
 =?iso-8859-1?Q?p2GlfmcSQZR5IVqdk2BgRwBaKhhXgsL/U1M0mGkQEPUSGZag6QK6lRHavz?=
 =?iso-8859-1?Q?tUp2B/LZsN955S91J/H6RPw2rmSMiRDQj4Cr2Zgr3mlfqO4cJYSQwYvVNZ?=
 =?iso-8859-1?Q?QOAgg06S1TQwPuR5VqTiII9meoPYaLTBjJF46QUV8blLwGK0HQvSQDXB6N?=
 =?iso-8859-1?Q?vCPIqZ4PoI4h7JUIzCvO0wY8PJtWHmtlIr2sXN5kHp11czZZnnnw0ap+U9?=
 =?iso-8859-1?Q?O0QYdhxZZhAiu6+aMiHUDaZOfbJZEXuM9S4eXOC1sysh4GnuMROnt7FOsW?=
 =?iso-8859-1?Q?e1nrYhCC3piS/R7yWnjwDtPRUC5+BBGSzxGOCTJmi7GQh5eixGyzfZ0NuX?=
 =?iso-8859-1?Q?Z6sDgTMeUwGIRKmRipm5lIZ51tAf0e83F2jZTJMYyZBmf0rN8WYe1jULGV?=
 =?iso-8859-1?Q?UtGmkZBzG7KZDnDkOqjQWSvOpigEqFgnGdq6maXTqKo0ILTVMkUM9l1IMx?=
 =?iso-8859-1?Q?0NyOFvUdYYv874KRwUaPCAtVLpQuMVr/VTbEFGaU4rk8hL2zysauUjdA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: iris-sensing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 340f5289-25d8-488f-43a9-08dd738b6756
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2025 15:14:32.7726
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 963f3913-ffae-43fd-856b-2dfd3f6604e3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S/syVEw7yxEhwnqzbGop5WZ+r0bLC9iShltcUqkuAHc80eHW3k62ySHwObah4TswgQC1WDwzSgHage1gG2kCv2f0HQuMA2Wi5bLjRtl90ehOEhYIq4puykEXac1pz1xm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR3PPFB94CE6166
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 15:14:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214348

=0A=
On Wed, 26 Mar 2025 at 16:17, Mario Schuknecht=0A=
<Mario.Schuknecht@iris-sensing.com> wrote:=0A=
=0A=
> I was able to reproduce the problem now.=0A=
> And as you mentioned, PR=3D"r1" fixes the problem.=0A=
> But setting the PR variable is rarely used. So I wonder if this solution =
is okay?=0A=
=0A=
Probably not. There seems to be a deeper issue here, and it's better=0A=
to get to the bottom of it. If you have a bit of time, I'd appreciate=0A=
if you narrrow it down: inspect the metadata of the .deb packages:=0A=
gnupg, and then gpg-error, before and after the change. In other=0A=
words, is the problem with apt, or with not repackaging gnupg=0A=
properly? How does it compare to when using rpm?=0A=
=0A=
Alex=0A=
=0A=
=0A=
I have found out the following:=0A=
=0A=
After applying the libgpg-error patch, the gnupg deb-packages are not rebui=
lt.=0A=
=0A=
My guess is that the gnupg recipe is missing a dependency on libgpg-error.=
=0A=
However, gnupg uses the shared library from libgpg-error, so this dependenc=
y=0A=
is necessary. =0A=
=0A=
That the gnupg built has been successful so far is probably due to the fact=
 that=0A=
gnupg depends on libgcrypt and libgcrypt depends on libgpg-error. As a=0A=
result, libgpg-error was available in the recipe-sysroot directory of gnugp=
.=0A=
=0A=
libgpg-error should be added to gnupg's DEPENDS variable. Then the=0A=
libgpg-error patch will work correctly.=0A=
=0A=
If this analysis is confirmed:=0A=
Should I create a separate patch to add the dependency?=0A=
Alternatively, someone else could do this and then the libgpg-error patch=
=0A=
could be used unchanged.=0A=
=0A=
Regards,=0A=
Mario=0A=
=0A=
=0A=
=0A=
=0A=

