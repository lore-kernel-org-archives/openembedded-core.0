Received: from mail6.webfaction.com ([74.55.86.74] helo=smtp.webfaction.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded@mindchasers.com>) id 1SaqyZ-00042n-Cv
	for openembedded-core@lists.openembedded.org;
	Sat, 02 Jun 2012 18:14:51 +0200
Received: from [192.168.1.3] (pool-108-11-44-22.atclnj.east.verizon.net
	[108.11.44.22])
	by smtp.webfaction.com (Postfix) with ESMTP id 917A326ED347;
	Sat,  2 Jun 2012 10:37:09 -0500 (CDT)
Message-ID: <4FCA3324.8050007@mindchasers.com>
Date: Sat, 02 Jun 2012 11:37:08 -0400
From: Bob Cochran <openembedded@mindchasers.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4F87233E.2030604@opendreambox.org>
	<4F878641.1010207@windriver.com>
	<4F87F622.3070302@opendreambox.org>
In-Reply-To: <4F87F622.3070302@opendreambox.org>
Cc: Kang Kai <Kai.Kang@windriver.com>
Subject: Re: cleanup-workdir
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
X-List-Received-Date: Sat, 02 Jun 2012 16:14:51 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 04/13/2012 05:47 AM, Andreas Oberritter wrote:
> On 13.04.2012 03:49, Kang Kai wrote:
>> On 2012=E5=B9=B404=E6=9C=8813=E6=97=A5 02:47, Andreas Oberritter wrote=
:
>>> Hello Kai,
>>>
>>> because I was low on disk space, I just tried scripts/cleanup-workdir
>>> for the first time. My observations:
>>
>> Hi Andreas,
>>
>>
>>> 1.) It deletes work directories that were built for other machines
>>> (archs) than the current one. I guess the list of architectures to
>>> handle should be queried from bitbake to avoid this.
>> Do you mean that you build for 2 archs under the same "build" director=
y?
>
> I have two build directories, one for each machine, sharing a single tm=
p
> directory.
>
> The basic layout looks roughly like this:
>
> $OE/build/machineA/conf/local.conf
> $OE/build/machineB/conf/local.conf
> $OE/tmp/work/
>
>> Even in this way the script only delete the packages' build dir for ol=
d
>> versions.
>
> That's right, but different machines may have different versions due to
> COMPATIBLE_MACHINE settings. In my setup, there's also a layer for each
> machine, which contains hardware drivers etc. Although every machine
> provides the same set of drivers (same ${PN}), the versions differ slig=
htly.
>
>> Your requirement is that cleanup-workdir just clean the build dirs for
>> current arch, right?
>
> Yes. For each arch listed in PACKAGE_ARCHS (or
> ALL_MULTILIB_PACKAGE_ARCHS?) for the current machine.
>
>>> 2.) It doesn't delete work directories of previously deleted recipes.
>> Because when the recipe gone, I can NOT tell whether the directory is
>> left by bitbake or created by user.
>> I will list them and let user to choose delete them or not.
>
> It should be safe to assume that there are no directories created by th=
e
> user, as tmp/work is known to be managed by OE. However, recipes don't
> disappear very often, so asking the user seems to be fine.



Yes, it ignored the following package directories from removed recipes:=20
module-init-tools-3.16-r0 & module-init-tools-cross-3.16-r0.   My=20
preference would be to have the tool delete them.

I also noticed that the regex filters missed "iputils-s20101006-r3", so=20
a tweak to pick this up is probably warranted (or at least flag it at=20
the bottom of the regex loop as not being matched by any of the filters).

Related question: why not add an option to the tool to have it go ahead=20
and also delete the artifacts from the obsolete packages left in stamps=20
and buildstats?




>
> Regards,
> Andreas
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



