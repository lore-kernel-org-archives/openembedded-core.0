Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 174AA72F56
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 15:03:59 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=svr-ies-mbx-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1dAHXT-0005EG-Rx from Awais_Belal@mentor.com ;
	Mon, 15 May 2017 08:04:00 -0700
Received: from SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) by
	svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2) with Microsoft SMTP
	Server (TLS) id 15.0.1210.3; Mon, 15 May 2017 16:03:56 +0100
Received: from SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17]) by
	SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17%22]) with
	mapi id 15.00.1210.000; Mon, 15 May 2017 16:03:56 +0100
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] autogen: fix autoopts script generation to
	handle shebang
Thread-Index: AQHSyyf1Z+lHkWIXCkGvAcE6jL5+q6Hwqu4AgARxwImAAB/ggIAARI/F
Date: Mon, 15 May 2017 15:03:56 +0000
Message-ID: <1494860635949.47847@mentor.com>
References: <20170512135918.25150-1-awais_belal@mentor.com>
	<b3b3d45f-7209-2ba2-a299-5da723ea5008@linux.intel.com>
	<1494838882617.45509@mentor.com>,
	<d5c91712-63e4-b855-e508-a638de7cf916@linux.intel.com>
In-Reply-To: <d5c91712-63e4-b855-e508-a638de7cf916@linux.intel.com>
Accept-Language: en-US, en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.94.31.225]
MIME-Version: 1.0
Subject: Re: [PATCH] autogen: fix autoopts script generation to handle shebang
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
X-List-Received-Date: Mon, 15 May 2017 15:04:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Alex,=0A=
=0A=
> The first line will guarantee a short shebang, while the second one may=
=0A=
> result in a very long shebang which may hit the hardcoded kernel limit.=
=0A=
=0A=
I do not see how the second one can be longer in any case than the first on=
e but that's probably because of my lack of knowledge. I can confirm that t=
he changes around perl setting are not required and I only stepped over it =
because I was using an older commit of core however the change for sh is st=
ill required. Should I submit a v2 with that change only or is there a conc=
ern around that as well?=0A=
=0A=
BR,=0A=
Awais=0A=
=0A=
________________________________________=0A=
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>=0A=
Sent: Monday, May 15, 2017 4:53 PM=0A=
To: Belal, Awais; openembedded-core@lists.openembedded.org=0A=
Subject: Re: [OE-core] [PATCH] autogen: fix autoopts script generation to h=
andle shebang=0A=
=0A=
On 05/15/2017 12:01 PM, Belal, Awais wrote:=0A=
=0A=
> Really did not get the first question. Regarding PERL being set=0A=
> twice, I am just trying to manipulate it to the actual host binary,=0A=
> is there a better way? 'which perl' or 'env perl' will only point to=0A=
> the symlink under HOSTTOOLS.=0A=
=0A=
=0A=
1. You are replacing=0A=
=0A=
#!/usr/bin/env perl=0A=
=0A=
with=0A=
=0A=
#! <result of calling `readlink -f ${PERL}`>=0A=
=0A=
The first line will guarantee a short shebang, while the second one may=0A=
result in a very long shebang which may hit the hardcoded kernel limit.=0A=
So you are effectively adding the problem instead of fixing it (and=0A=
there is nothing to be fixed).=0A=
=0A=
2. You do this:=0A=
=0A=
PERL=3D`which perl`=0A=
PERL=3D`readlink -f ${PERL}`=0A=
=0A=
There is no need for the first line, if PERL is immediately set to=0A=
something else.=0A=
=0A=
=0A=
Alex=0A=

