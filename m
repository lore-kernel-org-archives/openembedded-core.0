Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 87BB271B87
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 05:36:05 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-MBX-04.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1dAV9R-0003H1-TF from Awais_Belal@mentor.com ;
	Mon, 15 May 2017 22:36:05 -0700
Received: from SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) by
	SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4) with Microsoft SMTP
	Server (TLS) id 15.0.1210.3; Tue, 16 May 2017 06:36:02 +0100
Received: from SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17]) by
	SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17%22]) with
	mapi id 15.00.1210.000; Tue, 16 May 2017 06:36:02 +0100
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] autogen: fix autoopts script generation to
	handle shebang
Thread-Index: AQHSyyf1Z+lHkWIXCkGvAcE6jL5+q6Hwqu4AgARxwImAAB/ggIAARI/F///yioCAAP4lwA==
Date: Tue, 16 May 2017 05:36:02 +0000
Message-ID: <1494912962159.30415@mentor.com>
References: <20170512135918.25150-1-awais_belal@mentor.com>
	<b3b3d45f-7209-2ba2-a299-5da723ea5008@linux.intel.com>
	<1494838882617.45509@mentor.com>
	<d5c91712-63e4-b855-e508-a638de7cf916@linux.intel.com>
	<1494860635949.47847@mentor.com>,
	<2f2b263c-5b85-3622-ea62-c01825da24be@linux.intel.com>
In-Reply-To: <2f2b263c-5b85-3622-ea62-c01825da24be@linux.intel.com>
Accept-Language: en-US, en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.87]
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
X-List-Received-Date: Tue, 16 May 2017 05:36:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> The standard way to fix too long #! lines in oe is to patch upstream=0A=
> code to use=0A=
> #!/usr/bin/env something=0A=
> (where something is just the binary name).=0A=
=0A=
> Why not simply replace ${POSIX_SHELL} with /bin/sh? Where and how is it s=
et?=0A=
=0A=
POSIX_SHELL is being set to "/usr/bin/env sh" already through the recipe bu=
t it gets resolved/expanded to <build-dir>/hosttools/<shell-bin> during the=
 configuration process so it's not usable for shebang in deep directory hie=
rarchy scenarios.=0A=
I guess a better way would be simply to use the same technique that we're u=
sing for perl. So for shell we'll have=0A=
=0A=
#!/usr/bin/env sh=0A=
=0A=
in mk-tpl-config.sh directly. I'll submit the change as v2 if you think thi=
s is okay.=0A=
=0A=
BR,=0A=
Awais=0A=
=0A=
________________________________________=0A=
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>=0A=
Sent: Monday, May 15, 2017 8:10 PM=0A=
To: Belal, Awais; openembedded-core@lists.openembedded.org=0A=
Subject: Re: [OE-core] [PATCH] autogen: fix autoopts script generation to h=
andle shebang=0A=
=0A=
On 05/15/2017 06:03 PM, Belal, Awais wrote:=0A=
> Hi Alex,=0A=
>=0A=
>> The first line will guarantee a short shebang, while the second one=0A=
>> may result in a very long shebang which may hit the hardcoded=0A=
>> kernel limit.=0A=
>=0A=
> I do not see how the second one can be longer in any case than the=0A=
> first one but that's probably because of my lack of knowledge. I can=0A=
> confirm that the changes around perl setting are not required and I=0A=
> only stepped over it because I was using an older commit of core=0A=
> however the change for sh is still required. Should I submit a v2=0A=
> with that change only or is there a concern around that as well?=0A=
=0A=
The sh part is also using readlink, which produces full paths, and=0A=
therefore is incorrect. You simply should not use full paths in #!, as=0A=
depending on your setup they may be still too long.=0A=
=0A=
The standard way to fix too long #! lines in oe is to patch upstream=0A=
code to use=0A=
#!/usr/bin/env something=0A=
(where something is just the binary name).=0A=
=0A=
Why not simply replace ${POSIX_SHELL} with /bin/sh? Where and how is it set=
?=0A=
=0A=
Alex=0A=

