Received: from mx4.leapfrog.com ([63.114.26.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dlazzari@leapfrog.com>) id 1S80M8-0003YH-4j
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 03:23:56 +0100
Received: from mx4.leapfrog.com (localhost [127.0.0.1])
	by localhost.leapfrog.com (Postfix) with ESMTP id F1E5F5E97
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 19:15:08 -0700 (PDT)
Received: from NAEXCHHT01.na.leapfrog.com (unknown [10.15.6.13])
	by mx4.leapfrog.com (Postfix) with ESMTP id D124B5E7E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 19:15:08 -0700 (PDT)
Received: from NAEMCASHT01.na.leapfrog.com (10.16.4.161) by
	NAEXCHHT01.na.leapfrog.com (10.15.6.13) with Microsoft SMTP Server
	(TLS) id 8.2.254.0; Wed, 14 Mar 2012 19:15:08 -0700
Received: from NAEMMAIL01.na.leapfrog.com ([fe80::252e:28a6:3d8f:6991]) by
	NAEMCASHT01.na.leapfrog.com ([::1]) with mapi id 14.01.0355.002;
	Wed, 14 Mar 2012 19:15:09 -0700
From: Daniel Lazzari <dlazzari@leapfrog.com>
To: "'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Task after do_package repeating despite stamp
Thread-Index: Ac0CUW/QMiCu8vdBRfKwnqPwlsYDyQ==
Date: Thu, 15 Mar 2012 02:15:07 +0000
Message-ID: <E7A9054A5ACABE48B0E540E46E862B0F0426C556@NAEMMAIL01.na.leapfrog.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.100.2.5]
MIME-Version: 1.0
Subject: Re: Task after do_package repeating despite stamp
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
X-List-Received-Date: Thu, 15 Mar 2012 02:23:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>Date: Thu, 15 Mar 2012 01:11:00 +0000
>From: Daniel Lazzari <dlazzari@leapfrog.com>
>Subject: [OE-core] Task after do_package repeating despite stamp
>To: "openembedded-core@lists.openembedded.org"
>	<openembedded-core@lists.openembedded.org>
>Message-ID:
>	<E7A9054A5ACABE48B0E540E46E862B0F0426C4F7@NAEMMAIL01.na.l
>eapfrog.com>
>Content-Type: text/plain; charset=3D"us-ascii"
>
>Let me preface this by saying I'm running an older oe-core (Angstrom) so t=
his
>may be fixed in the latest, but if so, I'm hoping someone can point me at =
the
>patch to fix it.
>
>I have a few recipes in our layer that need to generate proprietary packag=
es
>from ${D} after the do_package task has copied the files for its own devic=
es.
>To do this, I have a task like:
>
>do_create_foo() {
>	#Generate foo package here
>	foo_pkger ${D} ${DEPLOY_DIR}/foo/${MACHINE}
>}
>addtask create_foo after do_package before do_build
>do_create_foo[dirs] =3D "${DEPLOY_DIR}/foo/${MACHINE}"
>
>The problem is, when building any recipe that depends on this recipe, it
>reruns do_create_foo. This is especially problematic because we use
>rm_work, so often when it goes back to rerun do_create_foo, ${D} no longer
>exists. I checked and a stamp exists for the task.
>
>Anyone have any insight? Is anyone else seeing something like this?
>

Upon closer inspection, there isn't actually a stamp for this, just a sigda=
ta file. I put a quick tracer in bb.build.make_stamp and it is reaching thi=
s point. At the very least I am not as stuck as I thought I was. Help is st=
ill very much appreciated though if anyone knows what's going on.


