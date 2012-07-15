Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SqDQd-00081G-VE
	for openembedded-core@lists.openembedded.org;
	Sun, 15 Jul 2012 03:15:20 +0200
Received: by qcad10 with SMTP id d10so2517403qca.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Jul 2012 18:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=YgRUfYkJUEyKzeRbf+0v12tDRBQvuvqPJZgFjFKSsKU=;
	b=AfFn+hQv3xZSObvr2Ho4YatKULXA9ReGyDMyx7o8Oz851+gqEwu/s/QjYfbwQ2eTHc
	Tg9WrLn0tMSoVOgzkK1VeC7Iv6UbMkHFpSQ7OcwiUv6OPSH/8JqGOkoQJ+e9O3SRokU/
	YsA+NMoTBYNDGhzQroLowyiVGj8UBUbuDepgPCOvbP2TihGiHvvaFwmtOnBZd1Cn7vLW
	m+oyPssxqxYophuaBwpxNpYdVu/4385qbh+gS7pCOEb5RE7R2hTAbBgBCw8c45oyQp5a
	gTNLTntO1ZC9X0ESO5XvcbA+90a8ieWW3P2V+poyuluaWjalZ0Nq6wuqxAR/GhYIphS7
	J+fA==
MIME-Version: 1.0
Received: by 10.229.69.30 with SMTP id x30mr3583551qci.13.1342314243035; Sat,
	14 Jul 2012 18:04:03 -0700 (PDT)
Received: by 10.229.8.78 with HTTP; Sat, 14 Jul 2012 18:04:02 -0700 (PDT)
In-Reply-To: <5001EAB7.4080106@gmail.com>
References: <alpine.DEB.2.02.1207141456190.13961@oneiric>
	<CADkTA4Nah089oYXaHo3JDF_kmV-LQKz+hm8T6U9PBjtBvVDtxg@mail.gmail.com>
	<5001EAB7.4080106@gmail.com>
Date: Sat, 14 Jul 2012 21:04:02 -0400
Message-ID: <CADkTA4MK7Gd+dO_9Pw2nipdKJoAn5_brNEw1e1LYkOp0A9yC9w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: is "LINUX_VERSION" actually needed for a kernel checkout?
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
X-List-Received-Date: Sun, 15 Jul 2012 01:15:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Jul 14, 2012 at 5:55 PM, Khem Raj <raj.khem@gmail.com> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 7/14/2012 2:26 PM, Bruce Ashfield wrote:
>> On Sat, Jul 14, 2012 at 3:07 PM, Robert P. J. Day
>> <rpjday@crashcourse.ca> wrote:
>>>
>>> pawing my way through the kernel recipe file and checkout code so
>>> i understand it once and for all, and i'm curious about the
>>> setting of:
>>>
>>> LINUX_VERSION ?= "3.4.4"
>>>
>>> in linux-yocto_3.4.bb.
>>>
>>> for my example, i'm testing with straight oe-core and building
>>> for qemuarm, so i can see the following relevant lines from the
>>> kernel recipe file that will affect my kernel checkout:
>>>
>>> KBRANCH_qemuarm  = "standard/arm-versatile-926ejs"
>>> SRCREV_machine_qemuarm ?=
>>> "9aca8fec49787efbe44d0f137f31ee59edd94c49" SRCREV_meta ?=
>>> "a8cf77018b0faa0d29f1483ff4e5a2034dc8edd5"
>>>
>>> SRC_URI =
>>> "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
>>>
>>>
>>>
> LINUX_VERSION ?= "3.4.4"
>>>
>>> as i read the docs (and i could be totally off-base), the
>>> KBRANCH variable identifies the branch i want for my checkout,
>>> while the SRCREV_machine variable identifies the particular
>>> commit on that branch that i want (typically, it's a merge of
>>> standard/base into that branch).  and of course, SRCREV_meta is
>>> the state of the meta branch i want for further configuration.
>>>
>>> but at no time did i need to know the tagged kernel version that
>>> my machine branch was based on, did i?  so for the purposes of
>>> what happened above, i didn't *require* the value of
>>> LINUX_VERSION, did i?
>>>
>>> i can see that it will be handy in, say, creating meaningful
>>> directory names for building.  but beyond that, what else is it
>>> used for?  (i haven't got to the meta/ directory processing yet,
>>> so i have no idea whether it's suddenly necessary there.)
>>
>> The kernel itself doesn't care .. but the rest of the system does,
>> since that is used for setting PV.
>>
>
> I think we only have 1 recipe per release e.g. 3.2, 3.4 and so on so
> adding an additional minor is confusing there may be it can be avoided
> and when we say 3.4 it means 3.4 release branch of kernel.
>
> unless we plan to have it selectable for users to use 3.4.1 and 3.4.2
> it probably loses the significance

selectable no .. but useful none the less. It's clear information (that does no
harm), that has it's users and use cases, so I have no plans to abandon it.

Cheers,

Bruce

>
>>
>
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.12 (MingW32)
> Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/
>
> iEYEARECAAYFAlAB6rcACgkQuwUzVZGdMxSIxQCfcFYddR+x8FIhH18Ae7lNYAma
> nF0AnimKPeYQ/cKVDpr5ckrAIibr4dYa
> =qNRw
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


