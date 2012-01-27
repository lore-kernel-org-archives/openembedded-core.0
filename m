Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>)
	id 1RqnkW-0000lC-MV; Fri, 27 Jan 2012 16:30:00 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Jan 2012 07:22:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="117088180"
Received: from unknown (HELO [10.255.14.96]) ([10.255.14.96])
	by fmsmga002.fm.intel.com with ESMTP; 27 Jan 2012 07:22:10 -0800
Message-ID: <4F22C122.9030206@linux.intel.com>
Date: Fri, 27 Jan 2012 07:22:10 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CALbNGRS-WsE45UakTV5VE2T5bAxb1C2iWgPeN+Ys+OTx-i48Rw@mail.gmail.com>
	<4F21FDA2.5070803@linux.intel.com>
	<CALbNGRQ0+FDE7QisckBOCXBUspQiumZFLjPJYgRf87a1mqtHaw@mail.gmail.com>
	<CALbNGRTqHJYvSzbman=ZPQ4D=Cyu8oX0F4JdTA7hrH4oMW_wbA@mail.gmail.com>
In-Reply-To: <CALbNGRTqHJYvSzbman=ZPQ4D=Cyu8oX0F4JdTA7hrH4oMW_wbA@mail.gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] evince: who is responsible to pack all within usr/lib/evince/3/backends to ${PN}?
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
X-List-Received-Date: Fri, 27 Jan 2012 15:30:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 01/27/2012 04:48 AM, Andreas Müller wrote:
> On Fri, Jan 27, 2012 at 9:43 AM, Andreas Müller
> <schnitzeltony@googlemail.com>  wrote:
>> On Fri, Jan 27, 2012 at 2:28 AM, Saul Wold<sgw@linux.intel.com>  wrote:
>>> On 01/26/2012 05:16 PM, Andreas Müller wrote:
>>>>
>>>> I checked: the complete contents of /usr/lib/evince/3/backends go to
>>>> evince package and I would like to move *.a to ${PN}-staticdev and
>>>> *.la to ${PN}-dev but I don't understand: who is responsible for
>>>> adding all this to ${PN}?
>>>>
>>> bitbake.conf defines where most files should go, but when you get files in
>>> sub-directories, such as /usr/lib/evince/..., then the recipe needs to do a
>>> little more work. If you look at the evince_2.32.0.bb, there already is a
>>> FILES_${PN}-staticdev that adds some extensions, you need to add this set of
>>> backends to that list, probably same with the .la to the -dev package.
>>>
>> Why I asked this: Maybe there is a chance to fix this more globally
>> instead of one by one in each recipe. But therefore I need to know
>> where the path is packed.
>>
> I looked around for this a bit: As Saul pointed out, in bitbake.conf we have
> FILES_${PN} = ... ${libdir}/${BPN}/* ...
>
> This
> * drags in all below this directory ( e.g *.la / *.a )
> * Forces me to rewrite FILES_${PN} in evince ( e.g just adding
> ${libdir}/${BPN}/*/backends/*.a to FILES_${PN}-staticdev fixes nothing
> ). This is something I would like to avoid.
>
> Suggestions?
>
> I guess others but evince are also affected.
>
Actually the ordering of PACKAGES matters here and since bitbake.conf 
lists the ${PN}-dev and ${PN}-staticdev package before ${PN}, you can 
append the ${libdir}/${BPN}/3/backends/*.a to FILES_${PN}-staticdev and 
it will pull those first before doing the FILES_${PN}. does that make 
sense?  You don't have to re-write FILES_${PN}.

Sau!

> Andreas
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


