Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UXyBy-0007tT-R4
	for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 20:25:19 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r42I7Ngg027486
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 May 2013 11:07:23 -0700 (PDT)
Received: from msp-dhcp2.wrs.com (172.25.34.2) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 2 May 2013 11:07:23 -0700
Message-ID: <5182AB5B.1080200@windriver.com>
Date: Thu, 2 May 2013 13:07:23 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CAJTo0LZdtT=qg2k3eBJ_DQHQzMvqS0vwFSmkgCxxG7KOiPWfzQ@mail.gmail.com>
	<lyy5bxl2h7.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <lyy5bxl2h7.fsf@ensc-virt.intern.sigma-chemnitz.de>
Subject: Re: libexecdir and multilib
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 May 2013 18:25:19 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/2/13 12:24 PM, Enrico Scholz wrote:
> "Burton, Ross" <ross.burton@intel.com> writes:
>
>> rpm allows "executables" (but not libraries) to conflict and will
>> prefer the 64-bit version,
>
> Sure? At least rpm-4 (Fedora, RHEL) does not allow files to conflict.
> Fedora solves the multilib problem by splitting the distribution into
> main packages (unilib only; contain binaries and data) and libraries
> (multilib).  The distribution assemble tool ("mash") copies e.g. i386
> -lib and -devel packages both in i386 and x86_64 repositories.

RPM rule (doesn't matter rpm4 or rpm5), they have the same multilib rules.

If the file color (type) is -not- ELF, then a conflict occurs if the files are 
different.

If the file color (type) is ELF, then the policy is used to decide if this is a 
conflict, or which version wins.

> libexecdir files in Fedora should be part of unilib (main architecture)
> packages only.

Just because we're using RPM doesn't mean we have to follow Fedora.  There are a 
lot of things that Fedora does wrong (and right) IMHO.  Same with Debian and 
others.  We need to make sure we do appropriate choices based on the users of 
OE-Core.  These users may need specific situations and/or expect certain 
configurations that they are used to from Fedora.  So deviating for the sake of 
deviating is bad as well... There needs to be a technical reason for it.

>
>> libexecdir = ${exec_prefix}/libexec"
>> ===
>>
>> Conflicting binaries with multilib, would likely need improvements in
>> the opkg bbclass.  Consistent name so cross-architecture file paths
>> are consistent, although the binary architecture isn't.
>
> How is ${bindir} multilib packaging solved in OE?  Can this mechanism
> applied to ${exec_prefix}/libexec too?
>
>
>> What's clear from the research I've done is that there isn't a clear
>> answer - upstreams have different expectations of how libexecdir/bindir
>> are used, and different distributions do different things to solve the
>> multilib problems - even when the distribution maintainers are also
>> upstream developers.  Some examples:
>>
>> dbus has a helper dbus-daemon-launch-helper, which is installed into
>> libexecdir.  Fedora moves it into $libdir, where as Debian moves this
>> same binary to /usr/lib/dbus-1 avoiding the $arch... Some disagreement
>> there apparently.
>
> Yes; Fedora introduced this in 2007[1] without telling the rationale in
> the commit :( afais, this is not give problems because path is read from
> <serviceconfig> tag in /etc/dbus-1/system.conf and program is probably
> called only from dbus library itself.
>
>
>> My personal opinion at this point in time is that we should change
>> libexecdir to be $libdir.
>
> atm, multilib is a theoretical issue for me only and I do not have a
> strong bias for ${libdir} vs. ${exec_prefix}/lib.
>
> Nevertheless, when we change libexecdir to match ${libdir} in one
> architecture, we will see packaging regressions.  To fix/detect them,
> we will have to:
>
> 1. remove ${libexecdir}/* wildcards from FILES lists (permanent change)
>
> 2. do world builds with "strange", temporary libexecdir
>     (e.g. /usr/lib/strange-libexec) and look for unpackaged files.
>
>
>
> Enrico
>
> Footnotes:
> [1]  http://pkgs.fedoraproject.org/cgit/dbus.git/commit/?id=73fe28f678b4a1f015bffbec0fa50b3690dd39a4
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



