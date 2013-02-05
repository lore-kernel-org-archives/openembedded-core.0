Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1U2ouy-00065P-21
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 21:15:00 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 05 Feb 2013 11:59:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,609,1355126400"; d="scan'208";a="286981792"
Received: from unknown (HELO [10.255.12.90]) ([10.255.12.90])
	by fmsmga002.fm.intel.com with ESMTP; 05 Feb 2013 11:59:08 -0800
Message-ID: <5111648C.5010301@linux.intel.com>
Date: Tue, 05 Feb 2013 11:59:08 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
References: <cover.1360079373.git.rep.dot.nop@gmail.com>
	<3666e39a359b03ba1e054813f4353ddeed11d506.1360079373.git.rep.dot.nop@gmail.com>
	<5111374E.1050802@linux.intel.com>
	<CAC1BbcS3WTFO+UHKc-ZKL0ba2v4=mhW0Co2JdOVj-ryYsWm71w@mail.gmail.com>
	<511151CC.8080801@linux.intel.com>
	<CAC1BbcRr36SHQhfK+oT4bZELZMz=zhr+bpKh0XNZg011E0prHA@mail.gmail.com>
	<CAC1BbcSeJ_yg7Cqoai=aoP+w_ba+MjkZ=QWdPJQAjWfPFCo1OQ@mail.gmail.com>
In-Reply-To: <CAC1BbcSeJ_yg7Cqoai=aoP+w_ba+MjkZ=QWdPJQAjWfPFCo1OQ@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/8] Revert "Add ptest for glib."
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
X-List-Received-Date: Tue, 05 Feb 2013 20:15:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/05/2013 11:36 AM, Bernhard Reutner-Fischer wrote:
> On 5 February 2013 20:16, Bernhard Reutner-Fischer
> <rep.dot.nop@gmail.com> wrote:
>> On 5 February 2013 19:39, Saul Wold <sgw@linux.intel.com> wrote:
>>> On 02/05/2013 09:13 AM, Bernhard Reutner-Fischer wrote:
>>>>
>>>> On 5 February 2013 17:46, Saul Wold <sgw@linux.intel.com> wrote:
>>>>>
>>>>> On 02/05/2013 07:55 AM, Bernhard Reutner-Fischer wrote:
>>>>>>
>>>>>>
>>>>>> This reverts commit dec6f912d68f52748f645b6af411f189cf464f85.
>>>>>>
>>>>>> This breaks core-image-sato-sdk for TCLIBC="uclibc".
>>>>>>
>>>>> What's the issue?  Is it fixable instead of reverting the ptest patch? I
>>>>
>>>>
>>>> The issue is that it incorrectly and unconditionally pulls in eglibc
>>>> stuff:
>>>>
>>>> -RDEPENDS_${PN}-ptest += "\
>>>> -            eglibc-gconv-utf-16 \
>>>> -            eglibc-charmap-utf-8 \
>>>> -            eglibc-gconv-cp1255 \
>>>> -            eglibc-charmap-cp1255 \
>>>> -            eglibc-gconv-utf-32 \
>>>> -            eglibc-gconv-utf-7 \
>>>> -            eglibc-charmap-invariant \
>>>> -            eglibc-localedata-translit-cjk-variants \
>>>> -            tzdata \
>>>> -            tzdata-americas \
>>>> -            tzdata-asia \
>>>> -            tzdata-europe \
>>>> -            tzdata-posix \
>>>> -            python-pygobject \
>>>> -            python-dbus \
>>>> -           "
>>>>
>>> Bjorn,
>>>
>>> Do you have some time to look at this and see if you can make use of TCLIBC
>>> to use the correct library and locale package info based on which libc is
>>> being used?
>>
>> would most likely DTRT, yep.
>
> Well, given that i see e.g. glibc-gconv-utf-16 nowhere in
> openembedded-core i suspect they are misplaced and should live in the
> layer that provides them.
>
It's a DYNAMIC package built in eglibc-locale.inc.

>> I'm curious what you would need from uClibc to satisfy that ptest thing?
>> What does it do, what is it good for? :)
>
Bjorn question at this point!

> Is e.g. glibc-gconv-utf-16 locale support or something like that?
>
probably, could the uclibc-gconv provide equivalent?

Sau!


> thanks,
>>
>> RDEPENDS_${PN}-ptest += "\
>>              tzdata \
>>              tzdata-americas \
>>              tzdata-asia \
>>              tzdata-europe \
>>              tzdata-posix \
>>              python-pygobject \
>>              python-dbus \
>>             "
>> RDEPENDS_${PN}-ptest_append_libc-eglibc = "\
>>              eglibc-gconv-utf-16 \
>>              eglibc-charmap-utf-8 \
>>              eglibc-gconv-cp1255 \
>>              eglibc-charmap-cp1255 \
>>              eglibc-gconv-utf-32 \
>>              eglibc-gconv-utf-7 \
>>              eglibc-charmap-invariant \
>>              eglibc-localedata-translit-cjk-variants \
>>             "
>> RDEPENDS_${PN}-ptest_append_libc-eglibc = "did not look"
>>
>> TIA && cheers,
>
>


