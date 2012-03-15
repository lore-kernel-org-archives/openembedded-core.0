Received: from mx4.leapfrog.com ([63.114.26.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dlazzari@leapfrog.com>) id 1S8GFi-0002xN-Ek
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 20:22:22 +0100
Received: from mx4.leapfrog.com (localhost [127.0.0.1])
	by localhost.leapfrog.com (Postfix) with ESMTP id 59B1B5EA6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 12:13:20 -0700 (PDT)
Received: from NAEXCHHT01.na.leapfrog.com (unknown [10.15.6.13])
	by mx4.leapfrog.com (Postfix) with ESMTP id 395FA5E94
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 12:13:20 -0700 (PDT)
Received: from NAEMCASHT01.na.leapfrog.com (10.16.4.161) by
	NAEXCHHT01.na.leapfrog.com (10.15.6.13) with Microsoft SMTP Server
	(TLS) id 8.2.254.0; Thu, 15 Mar 2012 12:13:20 -0700
Received: from NAEMMAIL01.na.leapfrog.com ([fe80::252e:28a6:3d8f:6991]) by
	NAEMCASHT01.na.leapfrog.com ([::1]) with mapi id 14.01.0355.002;
	Thu, 15 Mar 2012 12:13:20 -0700
From: Daniel Lazzari <dlazzari@leapfrog.com>
To: "'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Task after do_package repeating despite stamp
Thread-Index: Ac0C361tEusuUyExTEq4PjCV9q4kUA==
Date: Thu, 15 Mar 2012 19:13:19 +0000
Message-ID: <E7A9054A5ACABE48B0E540E46E862B0F0426D8C3@NAEMMAIL01.na.leapfrog.com>
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
X-List-Received-Date: Thu, 15 Mar 2012 19:22:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>Date: Thu, 15 Mar 2012 08:19:54 +0000
>From: Richard Purdie <richard.purdie@linuxfoundation.org>
>Subject: Re: [OE-core] Task after do_package repeating despite stamp
>To: Patches and discussions about the oe-core layer
>	<openembedded-core@lists.openembedded.org>
>Message-ID: <1331799594.18586.61.camel@ted>
>Content-Type: text/plain; charset=3D"UTF-8"
>
>On Thu, 2012-03-15 at 01:11 +0000, Daniel Lazzari wrote:
>> Let me preface this by saying I'm running an older oe-core (Angstrom) so
>this may be fixed in the latest, but if so, I'm hoping someone can point m=
e at
>the patch to fix it.
>>
>> I have a few recipes in our layer that need to generate proprietary pack=
ages
>from ${D} after the do_package task has copied the files for its own devic=
es.
>To do this, I have a task like:
>>
>> do_create_foo() {
>> 	#Generate foo package here
>> 	foo_pkger ${D} ${DEPLOY_DIR}/foo/${MACHINE}
>> }
>> addtask create_foo after do_package before do_build
>> do_create_foo[dirs] =3D "${DEPLOY_DIR}/foo/${MACHINE}"
>>
>> The problem is, when building any recipe that depends on this recipe,
>> it reruns do_create_foo. This is especially problematic because we use
>> rm_work, so often when it goes back to rerun do_create_foo, ${D} no
>> longer exists. I checked and a stamp exists for the task.
>>
>> Anyone have any insight? Is anyone else seeing something like this?
>
>It looks like you're creating something machine specific since you're
>placing it in ${MACHINE}. This effectively makes anything depending on
>this task machine specific also.
>
>Cheers,
>
>Richard
>

I finally found the answer to this in case anyone else runs into it. The rm=
_work class removes stamps if they are not in a case statement in that clas=
s. Once I added *do_create_foo* to the case statement, the stamp was left a=
lone and everything is working again.



