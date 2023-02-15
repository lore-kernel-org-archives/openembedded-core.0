Return-Path: <kubiznak@2n.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC1F7C6379F
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 09:40:05 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.11522.1676453995850079306
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 01:39:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail, err=mail: missing word in phrase: charset not supported: "iso-8859-2";
 spf=pass (domain: 2n.com, ip: 195.60.68.18, mailfrom: kubiznak@2n.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WPhPu6QfJkpsf1umi1LuiBCGJJXBKH4n0/qIAISXeviOxE57hMz9khbZzGt/TiCkc/TnBJoOMmbYYNCE0tFoB+OGlB0YA5sY7t+/oTbiAcVBep5j2srnm6W96qeVRHd+rNt2dSOgUD8OKadBcA7ZHbdlrUW6YwlNuUWu1X6K5Zh4fXAv2Cstnxb3iY8HT7AnlRelqdSFtc+2NlZFnmXOUzZN/UmhqlM1B7uCxtcqtGQ3HXgEzK9anPnXFpetw7JpMQKCswxrWRQH7WhUG9F+wDS9a4Vlutt/CqltZ43VSP3AjuPtaCSpcrozbAM1p0mZySqsLzl7UVy5yIczpMSj0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OEyrkKB1M8fnnFBJNTYYwkSlkqSG0jTvQGrr6GKZ0es=;
 b=gQwz9RPIAI0dcZHLmNRo75QWsmbdltUJxKXehcvS0gekQ9s4UieeX2+ji9GCDUrrWvb4DYAnmO8ES1PRsQckvax1hyuH7cFhkT0+5SR3oNW3OBOEfyM195Q6oIaNQ5K38krU11Q9NJhlDfMR8UxvWRaIoX9dqK7q97m/dcx7/sYjBE+AC65mVjl9DWdyqPcrqQ1kwDCHGsPUehgjqDJQi9OCi+CWnoEjdnV9WgSTy9Daun2as4L8J0HnSrl/YSsHhuavFsjnh2io/y3EvMITYDRUnn4JJoj6ubL2ep5OIafCcrRJVYB+kM9tD57bu/8ooUFMRkzDd3Ql2GvGH9PPbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=2n.com; dmarc=pass action=none header.from=2n.com; dkim=pass
 header.d=2n.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis365.onmicrosoft.com; s=selector2-axis365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OEyrkKB1M8fnnFBJNTYYwkSlkqSG0jTvQGrr6GKZ0es=;
 b=BC6vl0qgEMtV25ba5liGrcijOrqO1oc0xlLsUmWa5WBkPmG74EQLfjF4Cy2z3GLGVRFq3O25eCMHmsAy4As33/ZMHN6fE4aQkyTAbu4tPEERRyXAiUFGse76fcWOxeT2PyXB0YDVx+wPjVpYrv5NWkSt96PFltNJWjJMMBRVBHs=
From: =?iso-8859-2?Q?Petr_Kubiz=F2=E1k_-_2N?= <Kubiznak@2n.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
Subject: Re: [OE-core][PATCH 1/2] gobject-introspection: check for
 GI_DATA_ENABLED
Thread-Topic: [OE-core][PATCH 1/2] gobject-introspection: check for
 GI_DATA_ENABLED
Thread-Index: AQHZIDIvVR7HPOD4Nkm3C4IeSj1LKa6OJ86sgAACnh////a/gIABuyOa///zXQCAAcyOyIAEOpwAgAUAbDyACBANAIAXcyz1gBWnSuE=
Date: Wed, 15 Feb 2023 09:39:49 +0000
Message-ID: <DB4PR02MB100306D119372AABB30DD918BE2A39@DB4PR02MB10030.eurprd02.prod.outlook.com>
References: <20230104114555.575278-1-kubiznak@2n.com>
 <17371904FDF90491.29426@lists.openembedded.org>
 <CANNYZj8Qfcs+X8yGRiHZJygZ0RH4n=KDsKXkXO-+duY=ycRS5A@mail.gmail.com>
 <35848697143b4b3a8612c027d8852575@2n.com>
 <CANNYZj9eVWdxkuSVgur0WvTd3xNLECWS5mZ1nZg+q=WPO8PBGQ@mail.gmail.com>
 <6351b082f6b748b7bf01d4313c648861@2n.com>
 <CANNYZj9sEYON_ymHC8-8hyu8kq4jspCHDEF2TyxU1qCcOu3+kQ@mail.gmail.com>
 <e46977d84bbc4fd6ba7966b02937e8e9@2n.com>
 <CANNYZj8LTq_oXKzZUGYjjU0AU=Q8rXvaM0ne0xvz_CaNAV0NjQ@mail.gmail.com>
 <DB4PR02MB10030E1A4CEFF3F064DF2F2EBE2FD9@DB4PR02MB10030.eurprd02.prod.outlook.com>
 <CANNYZj-24WyZK=1vG7rbuoi9mquxkB3uGTkyTTA2R0F=R=x=5A@mail.gmail.com>
 <173FBEEB24ED84F2.30239@lists.openembedded.org>
In-Reply-To: <173FBEEB24ED84F2.30239@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=2n.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB4PR02MB10030:EE_|DB9PR02MB10349:EE_
x-ms-office365-filtering-correlation-id: bd59e8bc-2a62-4220-6e76-08db0f389520
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f24dwuZWu4qq7ld65jk3XsLJPeWAxsK7Y/tjcGZRxJz2PrXRgFheSeje+/9x3+Kzphut4DbUF1BV2vXSGu9/VUV4v5PH3F0TfEGwQmxOif+izMgWx0PsI98KF1bYfu+9vASA9FpQ3cwMvGB1abLKOOFw5MrdClS5Cp5ozUQDPrYKYlvIsa4tktdtBrsEsZqbE6fm+lsIxUHisiPm07bJXmhyKng5LVukCz374aoTJZlvNTBPhpibSy9t2+LRloYfy+HAYBX/nHQIAdftxKfltmOOez/r6Q8VCj+GRUzIRIovVKB/ey6vkQmPOBDOxDI+IPhWuooGdJ3cWtnEOK3maG6Py5DzY8O/Zr/aK85rSVPI+TBA5/Uioz/ka73np2Lh1MR/buc7tCfr73ZyEP2KAMKj8wZFK6he66mgvAgqmPU3f0foqaBcd000JSHfgsYwlPpWyjhiXtPAHtRfQ+yVSMy5YvqwhmXNKZXzwM96L4gU4EWKFGtY2bRX0zwHKAFB0vCRX0lr7crVPVJHFcUZB51Y8PXAy552S8wJ9qPGhLEA6zmaYcTbA/bTnbjSjDH0QlHiJf9wy2yUi+/2Oydl9N9xVlcFH6BMBPa7AAkrabHWqre2iO4qxpg23OAXPGr0YVrhcYyBcC/1Gjw9sSQINflbTI61CxQz9cY6v8c/3CUwgAsCiMUOMzHBOihkQKKNZ5TP0e6iJ5zPQwlweOCkNw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR02MB10030.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(366004)(346002)(396003)(39860400002)(136003)(451199018)(71200400001)(478600001)(53546011)(7696005)(186003)(26005)(6506007)(9686003)(52536014)(2906002)(41300700001)(8936002)(5660300002)(316002)(8676002)(76116006)(66476007)(91956017)(66556008)(38100700002)(66446008)(66946007)(64756008)(6916009)(122000001)(4326008)(86362001)(55016003)(33656002)(38070700005)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?2AJJARMw6x2q1KSQbpva7kvMfQ+fP1dfD1oAtCv9N+rdIsIZaElRdVmxgy?=
 =?iso-8859-2?Q?UsldP3BDz9DKFZKsn9eONp5Tf6pAr/qUCThOjN7xNwgZY05OiautNrAOTp?=
 =?iso-8859-2?Q?dOZoa5aDzpt4Pq7o143z6rATTjclvPGQ5Z1+DTn+209RCWQL8ywP+R4bfh?=
 =?iso-8859-2?Q?PJR5gosSPj88FElqnGVu/hqiJCevvqPmhbQpRSt7AfXKY/XrmO+Sl4xVrV?=
 =?iso-8859-2?Q?yi3lS2kysaqDoqkLVUix/kED+6A+Mw9Hc0wlA/EDKWe1edCdelhBMsywoo?=
 =?iso-8859-2?Q?Nmev9saku/T8ZtroAedRkKxRsw6rVOEGHdbD7wmpol8GYt4+YR0ybSvOEN?=
 =?iso-8859-2?Q?plu40zd/nmvSvRnsJ3D21AhkMNDJzaiP4fehE5oikBj1yzVrn4XCEN6GUr?=
 =?iso-8859-2?Q?zAkFdJQ/W003l5/8Iw+eLZyXF3g2idzI3oEA4zhlpHgCZTzbb0ukh3aVhd?=
 =?iso-8859-2?Q?OBq2PzO/iWcNwGbpfOGrCfS1N1TbiVfjcK61sLy3z6/QzhvSA5rXFjzEz6?=
 =?iso-8859-2?Q?RwnJUcyQcsiJ74VxkqHqW6lZLMOsJ0eXFMfzcmUyv17iEpGtEFF/8TR+uv?=
 =?iso-8859-2?Q?AIYyKPoW33JXouK5mNLFwwh/hDKBC0tBAgqXyhi8Bhx3A7YV87VBgneO4J?=
 =?iso-8859-2?Q?W5UXSA+tUPAswKZxrsH2vb9t3yE348lEhIlkniCVU7Ng4seJWQjNKERGbq?=
 =?iso-8859-2?Q?bc5krpoS5UyVk4vBzcuKr2E8wuS2gsf3PnY7mc5Cw2o98G6yviAkP2Z+WM?=
 =?iso-8859-2?Q?RQtjz/X1XZmnXXaBmlFsr1pZFrUrSOOe1juNnm5MSsL6MfHqg5feBWJfgd?=
 =?iso-8859-2?Q?uN2l+4+c6gQhiogRs9ZlIS6YcEiL9ekxkZw4z20HBqQEzp2534cZImjqZO?=
 =?iso-8859-2?Q?841s9Jp3OCa3MyO8rPpBfo2RpUkOzlhrTQS9F09V3YliK6dPNe7oZx7Vpu?=
 =?iso-8859-2?Q?OC1xfkdVZaXuxanIhFE4d+dDJgqL/VcD8UsaRo/v2zfy90lGocrgweTUE6?=
 =?iso-8859-2?Q?uXtA58ZSx4fM2wiB2DJDsuTOnS+2fx18z4gmp2JFfiPRfm9u2GWG3zxWFr?=
 =?iso-8859-2?Q?jlgjtjfPZuQuqzjP6IgHoDNGtecul6nVkEtzqGQtBH3kEyRBEpPDRNjFEN?=
 =?iso-8859-2?Q?Bshq/WcfwTo40sXduUYnlS6ZiUIsMCNuBX6/BzIvFJ8YzrhFlUCMk/3a/C?=
 =?iso-8859-2?Q?GCJCNu3I4ataSD4ePp835X+VtOdxs+rXFRpw7XdgDCnp/8viAPw/BH4dqx?=
 =?iso-8859-2?Q?OP5rmVYkMT9WORcFWuZZjtajp8F2R4oefkpJouuGJwxpJsVR8S+BkxHd9A?=
 =?iso-8859-2?Q?3jHGRheikl6gSPyVUGbhdULkp8oQ3Mndllp+zY8AO3tYKWr2H83K6QJFQs?=
 =?iso-8859-2?Q?hsm17jXo5uQkZlBWY9JSsVOESp73+ysm7bgPUYzSuAJPTQGubcUWevR6d1?=
 =?iso-8859-2?Q?eU/ZuEdGQFIfMkwNj9XFqHaWGXvY13jVJ0OO2D6Ru2cZnQS2IXNCvxAM63?=
 =?iso-8859-2?Q?XuT2ctdBZjUwWiGyYr2t9wzK/TYqgfg9sShprQ/6FQhcPOreCIckm3DQ21?=
 =?iso-8859-2?Q?ii5nk9eiJ1qXdGIu/HFdNg8w7csrC1B8kUgFgb6vlfpH+6BuYHOUdpidA5?=
 =?iso-8859-2?Q?ZhciJMAb9JLhI=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB4PR02MB10030.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd59e8bc-2a62-4220-6e76-08db0f389520
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2023 09:39:49.7104
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uDXEP4hQy3pzxyVBQdIKRZUdotozOGsafjrJximCIgxp3Oxjzr36W7gSr90MTsRm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB10349
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 09:40:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177182

Hi Alex,=0A=
=0A=
May I kindly ask you for your opinion?=0A=
=0A=
Thank you,=0A=
Petr=0A=
=0A=
________________________________________=0A=
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Petr Kubiz=F2=E1k - 2N <Kubiznak@2n.com>=0A=
Sent: Wednesday, February 1, 2023 5:04 PM=0A=
To: openembedded-core@lists.openembedded.org=0A=
Subject: Re: [OE-core][PATCH 1/2] gobject-introspection: check for GI_DATA_=
ENABLED=0A=
=0A=
________________________________________=0A=
From: Alexander Kanavin <alex.kanavin@gmail.com>=0A=
Sent: Tuesday, January 17, 2023 5:50 PM=0A=
To: Petr Kubiz=F2=E1k - 2N=0A=
Cc: openembedded-core@lists.openembedded.org=0A=
Subject: Re: [OE-core][PATCH 1/2] gobject-introspection: check for GI_DATA_=
ENABLED=0A=
=0A=
> The way I read gtk4 and graphene source code, what the recipe claims=0A=
> is not true: you can disable introspection in graphene, and it would=0A=
> still build and install graphene-gobject.pc which is what gtk4 is=0A=
> looking for. If the needed piece is not installed, then you need to=0A=
> get to the bottom of why, e.g. specific source code lines where that=0A=
> decision is made.=0A=
=0A=
That's not really true. If no patches are applied and g-i is disabled, grap=
hene fails in do_compile:=0A=
=0A=
[75/75] /home/kubiznak/projects/poky2/build/tmp/work/core2-64-poky-linux/gr=
aphene/1.10.8-r0/recipe-sysroot/usr/bin/g-ir-compiler-wrapper src/Graphene-=
1.0.gir --output src/Graphene-1.0.typelib --includedir=3D/usr/share/gir-1.0=
=0A=
FAILED: src/Graphene-1.0.typelib=0A=
/home/kubiznak/projects/poky2/build/tmp/work/core2-64-poky-linux/graphene/1=
.10.8-r0/recipe-sysroot/usr/bin/g-ir-compiler-wrapper src/Graphene-1.0.gir =
--output src/Graphene-1.0.typelib --includedir=3D/usr/share/gir-1.0=0A=
Could not find GIR file 'GObject-2.0.gir'; check XDG_DATA_DIRS or use --inc=
ludedir=0A=
error parsing file src/Graphene-1.0.gir: Failed to parse included gir GObje=
ct-2.0=0A=
=0A=
If the attached patch is applied, graphene builds and yes, graphene-gobject=
-1.0.pc is then created, too. (Maybe this is the first patch to send indivi=
dually?) In that case, gtk4 builds fine. Anyway, webkitgtk fails in do_comp=
ile, with a failure which I worry I'm not able to resolve (see the attached=
 tail of the log, full log is ~50MiB).=0A=
=0A=
Petr=0A=

