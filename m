Return-Path: <Tudor.Florea@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id CE06B6F89B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Mar 2014 21:27:59 +0000 (UTC)
Received: from SESTOEX05.enea.se ([fe80::41cb:8d2e:2e90:a183]) by
	SESTOEX03.enea.se ([fe80::6ce7:7b51:1edf:e245%17]) with mapi id
	14.03.0158.001; Tue, 11 Mar 2014 22:27:58 +0100
From: Tudor Florea <Tudor.Florea@enea.com>
To: Paul Barker <paul@paulbarker.me.uk>
Thread-Topic: [OE-core] [PATCH] python3: Add ptest support
Thread-Index: AQHPOaACvOrdOE0SV0GY3hYYs+Ta3prUu5CAgAXZ5YCAAaVkAIAAMjYA
Date: Tue, 11 Mar 2014 21:27:57 +0000
Message-ID: <26724FB0BFCB3D4C91BDE184751AA3A4289CC2BB@sestoex05.enea.se>
References: <1394153667-4247-1-git-send-email-paul@paulbarker.me.uk>
	<1394153667-4247-2-git-send-email-paul@paulbarker.me.uk>
	<531E0149.7010905@linux.intel.com>
	<CANyK_8eb29MDTxadMxVF+G+P5PYZMgH4sr3fyD16-tXNOYHj-w@mail.gmail.com>
In-Reply-To: <CANyK_8eb29MDTxadMxVF+G+P5PYZMgH4sr3fyD16-tXNOYHj-w@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.21.1.188]
MIME-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3: Add ptest support
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
X-List-Received-Date: Tue, 11 Mar 2014 21:28:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



>On 10 March 2014 18:15, Saul Wold <sgw@linux.intel.com> wrote:
>> On 03/06/2014 04:54 PM, Paul Barker wrote:
>>>
>>> A run-ptest script written in python is added which defines a new
>>> TestRunner
>>> subclass which prints test results in the required ptest format and the=
n
>>> executes python's built-in testsuite using this new TestRunner subclass=
.
>>> <snip>
>>
>> Seems like there is an issue with the multi-lib build.
>>
>> ERROR: QA Issue: lib32-python3: Files/directories were installed but not
>> shipped
>>   /usr/lib/python3
>>   /usr/lib/python3/ptest
>> NOTE: recipe lib32-pulseaudio-4.0-r0: task do_package_write_rpm: Started
>>
>> Sau!
>>
>>
>>
>>> +# This must come after inherit ptest for the override to take effect
>>> +do_install_ptest() {
>>> +    install -m 0755 -d ${D}/${libdir}/python3/ptest
>>> +    install -m 0755 ${S}/../run-ptest ${D}/${libdir}/${PN}/ptest
>>> +}
>
> Should I be using something other than ${libdir} here? I can see
> ${PTEST_PATH} used in the do_install_ptest function for python2,
> should I be using that instead?
>=20
> As I think I noted elsewhere, this is the first ptest related patch
> I've done so I don't really know much beyond what's documented at
> https://wiki.yoctoproject.org/wiki/Ptest.

I think you may have to add a line like=20
FILES_${PN} +=3D "/usr/lib/python3/ptest"
in the recipe (meta/recipes-devtools/python/python3_3.3.3.bb).
${PTEST_PATH} might be different than the above due to the use of suffix  $=
{PYTHON_MAJMIN}.
Alternatively you might they to install ptest stuff here: ${D}${libdir}/pyt=
hon${PYTHON_MAJMIN}=20
Regards,
  Tudor

> Cheers,
>=20
> --=20
> Paul Barker
>=20


