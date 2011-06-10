Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QVAWb-0001dE-Sd
	for openembedded-core@lists.openembedded.org;
	Sat, 11 Jun 2011 00:49:58 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 10 Jun 2011 15:46:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,349,1304319600"; d="scan'208";a="12939853"
Received: from unknown (HELO [10.255.12.216]) ([10.255.12.216])
	by orsmga001.jf.intel.com with ESMTP; 10 Jun 2011 15:46:35 -0700
Message-ID: <4DF29ECB.60608@linux.intel.com>
Date: Fri, 10 Jun 2011 15:46:35 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <cover.1307686598.git.sgw@linux.intel.com>	
	<79966738c56b3d8dbcb262642447f9efe7af930a.1307686610.git.sgw@linux.intel.com>	
	<1307697909.2529.4983.camel@phil-desktop>	
	<4DF2642E.5070706@linux.intel.com>
	<1307741760.3307.9.camel@lenovo.internal.reciva.com>
In-Reply-To: <1307741760.3307.9.camel@lenovo.internal.reciva.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 4/4] multiple recipes converted to -staticdev packages
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
X-List-Received-Date: Fri, 10 Jun 2011 22:49:58 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/10/2011 02:36 PM, Phil Blundell wrote:
> On Fri, 2011-06-10 at 11:36 -0700, Saul Wold wrote:
>>>> +FILES_eglibc-dev_append += "${bindir}/rpcgen ${base_libdir}/*.o ${datadir}/aclocal"
>>>> +FILES_eglibc-staticdev_append += "${libdir}/*.a ${base_libdir}/*.a"
>>>
>>> You need to make sure that libc_nonshared.a goes into -dev rather than
>>> -staticdev somehow.  I didn't immediately spot any mechanism which would
>>> do this, though I haven't tested the package to find out what happens.
>>>
>>>> +FILES_uclibc-staticdev_append = "\
>>>> +        ${libdir}/*_nonshared.a \
>>>> +        ${libdir}/lib*.a \
>>>
>>> In similar vein, this doesn't look right.
>>>
>> I think I should be able to remove nonshared from a list.
>
> I'm not entirely sure I understand what you said there.  Just to be
> totally clear, for eglibc and glibc at least (and I imagine uclibc too),
> libc_nonshared.a needs to go into the -dev package and not -staticdev.
> So I don't think it should ever be appearing in a FILES...staticdev
> list.
>
I understand that, Khem also mentioned it.  It a matter of doing some 
python RE stuff to drop them from the -staticdev list.

>>> This one is a bit odd: it seems to just be dropping the .a files
>>> altogether without introducing a -staticdev package for them.
>>>
>> I thought that maybe the default rule provided in bitbake.conf should
>> accomplish this since it is FILES_${PN}-staticdev = "${libdir}/*.a
>> ${base_libdir}/*.a"
>
> Ah yes, right.
>
>>>> +#FILES_${PN}-dev = " ${includedir}/a52dec/*.h ${libdir}/liba52.so ${libdir}/liba52.la "
>>>> +#FILES_${PN}-staticdev = " ${libdir}/liba52.a "
>>>
>>> This is a bit weird.  What's going on here?
>>>
>> As above, trying to ensure that the default bitbake.conf rules would work.
>
> Okay, fair enough.  But in that case please don't leave the old bits
> commented out.
>
Right, that was a goof on my part.

>>> All in all I think this patch needs a bit more work.  It was quite a big
>>> diff so I only skimmed it rather than reviewing it thoroughly but I
>>> don't think it is quite ready to go in yet.  Also, can't a lot of this
>>> be done in bitbake.conf without quite so much recipe patching?
>>>
>> Most of it is done there, I was looking at adding a staticdev.bbclass
>> that would handle the lib${PN} case generically, as a second phase of this.
>
> Can the RDEPENDS_${PN}-staticdev not go in bitbake.conf?  That would
> avoid all these cut and paste errors that seem to be plaguing that
> particular area.
>
Arealy in bitbake.conf, it's the RDEPENDS_lib${PN}-staticdev (note the 
'lib' prefix), this is special for a hand full, if I can set up the 
inherit than it done that way.


> p.
>
>
>


