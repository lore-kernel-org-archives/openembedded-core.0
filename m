Received: from mx3.leapfrog.com ([63.114.26.253])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dlazzari@leapfrog.com>) id 1RyVCq-0003FD-S0
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Feb 2012 22:19:05 +0100
Received: from mx3.leapfrog.com (localhost [127.0.0.1])
	by localhost.leapfrog.com (Postfix) with ESMTP
	id 2B03D5F80; Fri, 17 Feb 2012 13:10:49 -0800 (PST)
Received: from NAEXCHHT01.na.leapfrog.com (unknown [10.15.6.13])
	by mx3.leapfrog.com (Postfix) with ESMTP
	id B689E5E88; Fri, 17 Feb 2012 13:10:48 -0800 (PST)
Received: from NAEMCASHT02.na.leapfrog.com (10.12.2.36) by
	NAEXCHHT01.na.leapfrog.com (10.15.6.13) with Microsoft SMTP Server
	(TLS) id 8.2.254.0; Fri, 17 Feb 2012 13:10:48 -0800
Received: from NAEMMAIL01.na.leapfrog.com ([fe80::252e:28a6:3d8f:6991]) by
	NAEMCASHT02.na.leapfrog.com ([::1]) with mapi id 14.01.0355.002;
	Fri, 17 Feb 2012 13:10:48 -0800
From: Daniel Lazzari <dlazzari@leapfrog.com>
To: 'Mark Hatle' <mark.hatle@windriver.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Problems with Pseudo
Thread-Index: AcztrW75y4vYIagQSn6dS9a1MMOLBwAR/BqAABBPs3A=
Date: Fri, 17 Feb 2012 21:10:47 +0000
Message-ID: <E7A9054A5ACABE48B0E540E46E862B0F04264E2A@NAEMMAIL01.na.leapfrog.com>
References: <E7A9054A5ACABE48B0E540E46E862B0F04264D83@NAEMMAIL01.na.leapfrog.com>
	<4F3EB7C5.6020605@windriver.com>
In-Reply-To: <4F3EB7C5.6020605@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.100.2.5]
MIME-Version: 1.0
Subject: Re: Problems with Pseudo
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
X-List-Received-Date: Fri, 17 Feb 2012 21:19:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks Mark! Your suggestions led me to the solution. A while back I had ad=
ded the cap_sys_rawio capability to my python binary because of a tricky si=
tuation involving needing to be able to issue mass storage device commands =
without being the root user. Reinstalling python removed that capability an=
d my bitbake is working again.

>-----Original Message-----
>From: Mark Hatle [mailto:mark.hatle@windriver.com]
>Sent: Friday, February 17, 2012 12:26 PM
>To: Patches and discussions about the oe-core layer
>Cc: Daniel Lazzari
>Subject: Re: [OE-core] Problems with Pseudo
>
>The usual cause of this error is either a system level protection, i.e.
>grsecurity, app armor, or selinux policy that prevents preload libraries f=
rom
>being loaded.
>
>The other option is something is set "setuid" and that also prevents
>LD_PRELOAD libraries from loading for security reasons.
>
>Finally, you can get this message if you are on a mixed-mode (multilib) ho=
st.
>I.e. you have executables that are both ELF 32 and ELF64.  If so, you need=
 to
>configure the system to build pseudo with both target environments,
>otherwise only one version is generated and you'll get an error when the
>"other" type is being executed.
>
>--Mark
>
>On 2/17/12 11:50 AM, Daniel Lazzari wrote:
>> A problem just popped up today that I can't seem to fix. When trying to
>bitbake anything, I first get the following message:
>>
>> ERROR: ld.so: object 'libpseudo.so' from LD_PRELOAD cannot be preloaded:
>ignored.
>>
>> Followed by a bunch of debug output, detailing the configuration files b=
eing
>loaded, then finally I get:
>>
>> ERROR:  Poky's config sanity checker detected a potential misconfigurati=
on.
>>      Either fix the cause of this error or at your own risk disable the =
checker
>(see sanity.conf).
>>      Following is the list of potential problems / advisories:
>>
>>      Pseudo is not functioning correctly, which will cause failures duri=
ng
>package installation. Please check your configuration.
>>
>> ERROR: Execution of event handler 'check_sanity_eventhandler' failed
>>
>> I've never seen this before, but I'm afraid to disable it because I know=
 how
>important pseudo is. Strangely enough, if I run pseudo (the one built in t=
he
>i686-linux sysroot) manually from the command line, it works just fine. I =
tried
>blowing away my build directory and downloads but nothing seems to work.
>Has anyone seen this before or might be able to help me track down what's
>going on?
>>
>> Thanks,
>>
>> Dan Lazzari Jr.
>> Firmware Engineer
>> dlazzari@leapfrog.com
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



