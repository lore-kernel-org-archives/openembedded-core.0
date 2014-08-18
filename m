Return-Path: <nick.lewis@usa.g4s.com>
X-Greylist: delayed 407 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 18 Aug 2014 14:57:08 UTC
Received: from mail1.bemta5.messagelabs.com (mail1.bemta5.messagelabs.com
	[195.245.231.147])
	by mail.openembedded.org (Postfix) with ESMTP id 502BA65CB2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 14:57:08 +0000 (UTC)
Received: from [85.158.139.35:4851] by server-11.bemta-5.messagelabs.com id
	BB/E1-31757-DA212F35; Mon, 18 Aug 2014 14:50:21 +0000
X-Env-Sender: nick.lewis@usa.g4s.com
X-Msg-Ref: server-13.tower-179.messagelabs.com!1408373420!36792229!1
X-Originating-IP: [89.206.228.155]
X-StarScan-Received: 
X-StarScan-Version: 6.11.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1002 invoked from network); 18 Aug 2014 14:50:20 -0000
Received: from unallocated.star.net.uk (HELO gbtwk10s037.Technology.local)
	(89.206.228.155)
	by server-13.tower-179.messagelabs.com with RC4-SHA encrypted SMTP;
	18 Aug 2014 14:50:20 -0000
Received: from GBTWK10E001.Technology.local ([10.234.1.29]) by
	gbtwk10s037.Technology.local ([10.234.1.39]) with mapi; Mon, 18 Aug 2014
	15:50:20 +0100
From: "Lewis, Nick" <nick.lewis@usa.g4s.com>
To: "'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
Date: Mon, 18 Aug 2014 15:50:19 +0100
Thread-Topic: [OE-core] image build with python fails due to missing
	berkeley db 5.3
Thread-Index: AQHPutA/YnOAFLXIt06m/WY1QqEawpvWZQUw
Message-ID: <AAE0766F5AF36B46BAB7E0EFB927320633FFF45E5C@GBTWK10E001.Technology.local>
References: <AAE0766F5AF36B46BAB7E0EFB927320633FFF45E56@GBTWK10E001.Technology.local>
	<4c5ac8f6664340f988bc68367cc3fa0a@BL2PR04MB852.namprd04.prod.outlook.com>
In-Reply-To: <4c5ac8f6664340f988bc68367cc3fa0a@BL2PR04MB852.namprd04.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: image build with python fails due to missing berkeley db 5.3
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
X-List-Received-Date: Mon, 18 Aug 2014 14:57:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>> My image build on yocto master fails reporting that python-bsddb
>> cannot be installed as no package provides libdb-5.3.so. On
>> examination it is evident that the "bitbake db" command builds
>> BerkeleyDB 6.0 instead of 5.3

> PREFERRED_VERSION_db =3D "5.3.28"

Thanks Martin - is there also a version specific variant of RDEPENDS that c=
an be added to python-bsddb to get this working without manual intervention=
?

>> As an experiment I added "#define HAVE_CXX_STDHEADERS" to the top of
>> this file (I guess I should have made a patch or passed it from the
>> recipe). The db_5.3.28.bb recipe then built okay and the image build
>> stopped complaining about missing libdb-5.3 when installing
>> python-bsddb

> I had similar issue with db-4.8* and zeroc-ice, HAVE_CXX_STDHEADERS is de=
fined by default, when db recipes passes --enable-cxx, then <iostream> is i=
ncluded instead of iostream.h and zeroc-ice builds ok.

I see that recipe-support/db/db_5.3.28.bb already has --enable-cxx so I am =
a bit confused why it failed

>> Does anyone else have this issue? Should python-bsddb be using BerkeleyD=
B 6.0 now?

It seems unfortunate that python-bsddb needs libdb 5.3 when everything else=
 in the master is using 6.0. What would need to change in the recipes-devto=
ols/python/python/python-2.7.3-berkeley-db-5.3.patch to get it to work with=
 libdb 6.0?

Nick


The details of this company are as follows:
G4S Technology Limited, Registered Office: Challenge House, International D=
rive, Tewkesbury, Gloucestershire GL20 8UQ, Registered in England No. 23823=
38.

This communication may contain information which is confidential, personal =
and/or privileged.

It is for the exclusive use of the intended recipient(s).
If you are not the intended recipient(s), please note that any distribution=
, forwarding, copying or use of this communication or the information in it=
 is strictly prohibited.

Any personal views expressed in this e-mail are those of the individual sen=
der and the company does not endorse or accept responsibility for them.

Prior to taking any action based upon this e-mail message, you should seek =
appropriate confirmation of its authenticity.

This e-mail has been scanned for all viruses by MessageLabs.

