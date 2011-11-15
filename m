Received: from mx4.leapfrog.com ([63.114.26.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dlazzari@leapfrog.com>) id 1RQOjA-0007Y0-Af
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2011 20:31:28 +0100
Received: from mx4.leapfrog.com (localhost [127.0.0.1])
	by localhost.leapfrog.com (Postfix) with ESMTP id A72815E9E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2011 11:24:39 -0800 (PST)
Received: from NAEXCHHT01.na.leapfrog.com (unknown [10.15.6.13])
	by mx4.leapfrog.com (Postfix) with ESMTP id 8800B5E5C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2011 11:24:39 -0800 (PST)
Received: from NAEMCASHT02.na.leapfrog.com (10.12.2.36) by
	NAEXCHHT01.na.leapfrog.com (10.15.6.13) with Microsoft SMTP Server
	(TLS) id 8.2.254.0; Tue, 15 Nov 2011 11:24:39 -0800
Received: from NAEMMAIL01.na.leapfrog.com ([fe80::252e:28a6:3d8f:6991]) by
	NAEMCASHT02.na.leapfrog.com ([::1]) with mapi id 14.01.0289.001;
	Tue, 15 Nov 2011 11:24:38 -0800
From: Daniel Lazzari <dlazzari@leapfrog.com>
To: "'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Reproducible build problem with BB_NUMBER_THREADS=8
Thread-Index: AQHMo8w3OeHizvQi9ke7VH50dDmAlg==
Date: Tue, 15 Nov 2011 19:24:38 +0000
Message-ID: <E7A9054A5ACABE48B0E540E46E862B0F0424496C@NAEMMAIL01.na.leapfrog.com>
References: <mailman.14454.1321367942.14568.openembedded-core@lists.openembedded.org>
In-Reply-To: <mailman.14454.1321367942.14568.openembedded-core@lists.openembedded.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.100.2.5]
MIME-Version: 1.0
Subject: Re: Reproducible build problem with BB_NUMBER_THREADS=8
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Nov 2011 19:31:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>Date: Tue, 15 Nov 2011 15:32:36 +0100
>From: Eric B?nard <eric@eukrea.com>
>Subject: Re: [OE-core] Reproducible build problem with
>	BB_NUMBER_THREADS=3D8
>To: Patches and discussions about the oe-core layer
>	<openembedded-core@lists.openembedded.org>
>Message-ID: <4EC27804.7060902@eukrea.com>
>Content-Type: text/plain; charset=3DISO-8859-1; format=3Dflowed
>
>Le 15/11/2011 12:03, Eric B?nard a ?crit :
>> - log2.txt (plain oe-core + angstrom setup to remove the doubt of my
>overlay
>> being the source of the problem) :
>> directfb fails with
>> mkdgifft.cpp:64:16: fatal error: list: No such file or directory
>> the file exists :
>> build/tmp-angstrom_2010_x-
>eglibc/sysroots/beagleboard/usr/include/c++/list
>> here again, it seems that include/c++ is not in the header search path
>> =3D> I reduced BB_NUMBER_THREADS to 1 and launched again bitbake (build
>actually
>> in progress).
>>
>this build also crashed a few hours later on gnutls with :
>| ./includes/gnutls/gnutlsxx.h:4:21: fatal error: exception: No such
>file or
>directory
>
>Here again the only solution is to remove tmp and start again with a
>reduced
>BB_NUMBER_THREADS.
>
>Eric
>

I actually just ran into this very problem late last week. I have narrowed =
it down to a problem with one of the gcc recipes (gcc-cross, gcc-cross-init=
ial, gcc-cross-intermediate, gcc-runtime) being built. I seem to get the pr=
oblem when my PARALLEL_MAKE > 2. If I run into the problem, dial back PARAL=
LEL_MAKE to 2, cleanall the above 4 recipes, and then continue, the problem=
 seems to go away. I don't really have any extra cycles to continue my inve=
stigation, but hopefully that helps put someone on the right track.


