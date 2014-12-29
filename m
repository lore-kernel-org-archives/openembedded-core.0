Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 951397258B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Dec 2014 12:55:19 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-03.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1Y5Zqx-0003vU-CO from Awais_Belal@mentor.com ;
	Mon, 29 Dec 2014 04:55:19 -0800
Received: from EU-MBX-03.mgc.mentorg.com ([169.254.2.213]) by
	SVR-IES-FEM-03.mgc.mentorg.com ([137.202.0.108]) with mapi id
	14.03.0224.002; Mon, 29 Dec 2014 12:55:18 +0000
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Thread-Topic: [OE-core] [PATCH] gstreamer1.0-omx: use mulitple SCMs to fetch
	submodules
Thread-Index: AQHQI2TIvmlbJunIkUOUO5qdabwjd5ymhVJH
Date: Mon, 29 Dec 2014 12:55:17 +0000
Message-ID: <2021B186DC632746BD5A3CE32F12BD28EA001E0A@EU-MBX-03.mgc.mentorg.com>
References: <1419846408-31247-1-git-send-email-awais_belal@mentor.com>,
	<CAP71WjzrFn=W8QYoDQybKyLxEpi4zL6yN8xkFZK=ze-6YZ_rLw@mail.gmail.com>
In-Reply-To: <CAP71WjzrFn=W8QYoDQybKyLxEpi4zL6yN8xkFZK=ze-6YZ_rLw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.69]
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0-omx: use mulitple SCMs to fetch submodules
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
X-List-Received-Date: Mon, 29 Dec 2014 12:55:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Nicolas,=0A=
=0A=
I sent this against the omx package only because I wanted to see if there's=
 any feedback on this for improvement or anything that I might be doing wro=
ng. If this gets accepted I will submit updates for the other gstreamer1.0-=
*_git.bb recipes as you've correctly pointed out that they suffer from the =
same dilemma. Doing it through a .inc wouldn't be a good idea because the d=
ependency from one package to the other lies not just only the package but =
the exact rev as well so it should be done in this way for all in my opinio=
n.=0A=
=0A=
The SRC_REVs will obviously need to be taken care of when an update is made=
 but I think this is the way to go. =0A=
=0A=
BR,=0A=
Awais=0A=
=0A=
________________________________________=0A=
From: Nicolas Dechesne [nicolas.dechesne@linaro.org]=0A=
Sent: Monday, December 29, 2014 5:41 PM=0A=
To: Belal, Awais=0A=
Cc: Patches and discussions about the oe-core layer=0A=
Subject: Re: [OE-core] [PATCH] gstreamer1.0-omx: use mulitple SCMs to fetch=
 submodules=0A=
=0A=
On Mon, Dec 29, 2014 at 10:46 AM, Awais Belal <awais_belal@mentor.com> wrot=
e:=0A=
> The gstreamer omx package uses a submodule 'common' which=0A=
> is fetched by the configure script. This approach fails=0A=
> on non-network builds as the fetcher tries to look upstream=0A=
> for the submodule.=0A=
> We now use multiple SCMs, one for the main omx package and=0A=
> the other for the 'common' submodule so it is available in=0A=
> the downloads_dir for later use.=0A=
>=0A=
=0A=
we have the same issues with all the others gstreamer1.0-*_git.bb=0A=
recipes, don't we? maybe we should fix them all. i am not sure if=0A=
there is a nice way to do it for all recipes, like with a .inc file,=0A=
to avoid duplication..=0A=
=0A=
also, the autogen.sh script will still run git submodule update, even=0A=
if the 'common' folder already exist, so we will need to be extra=0A=
careful when upgrading the _git.bb recipes to update both=0A=
SRCREV_gst-omx and SRCREV_common or we will have the same issue=0A=
again..=0A=

