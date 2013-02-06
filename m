Received: from mail-ie0-f171.google.com ([209.85.223.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1U2si7-0007Yc-LO
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Feb 2013 01:17:59 +0100
Received: by mail-ie0-f171.google.com with SMTP id 10so1085172ied.16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2013 16:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=SFXZPw/nsAq2pVUFJAZo394HDnzNQFbnxbWjiQ+i2dk=;
	b=Cz9j3Esdlag1w305p3NUlYmL/E6ElkD2FF8i2M9OUi9RzDu21VnxjJmO1Rc17EoSeF
	V3P5CdzU0Hy6v7m4eEiIeD85GtlVQ9/RW2KKDDQhhmYarmq9TwB6HqljYh5OikJgRsAq
	IRYXoui6aNuzqYJZJxlEOSgRxDoqc+tTSVDWoYgsl/dvxdT0vXiJ8O7JVLuQSh5zZGPF
	umDb1wsgw0oihNboFtQ5J2BSPVrWdmv7sEhvLMNbJSqGdwyGPZfXtP2sta3kHbkwza/l
	H7TEXS344sRvkOFSc0BZsQZHmKbLGDVfh8lTswCXKbx39d3tcy4XU2pFBkChD1NRdSBr
	OvTw==
X-Received: by 10.50.47.170 with SMTP id e10mr1766802ign.84.1360108927809;
	Tue, 05 Feb 2013 16:02:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.18.169 with HTTP; Tue, 5 Feb 2013 16:01:37 -0800 (PST)
In-Reply-To: <5111648C.5010301@linux.intel.com>
References: <cover.1360079373.git.rep.dot.nop@gmail.com>
	<3666e39a359b03ba1e054813f4353ddeed11d506.1360079373.git.rep.dot.nop@gmail.com>
	<5111374E.1050802@linux.intel.com>
	<CAC1BbcS3WTFO+UHKc-ZKL0ba2v4=mhW0Co2JdOVj-ryYsWm71w@mail.gmail.com>
	<511151CC.8080801@linux.intel.com>
	<CAC1BbcRr36SHQhfK+oT4bZELZMz=zhr+bpKh0XNZg011E0prHA@mail.gmail.com>
	<CAC1BbcSeJ_yg7Cqoai=aoP+w_ba+MjkZ=QWdPJQAjWfPFCo1OQ@mail.gmail.com>
	<5111648C.5010301@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Feb 2013 16:01:37 -0800
Message-ID: <CAMKF1soBpk34iun5VLUO-=HXr2OOYMDWyS+dHxRXjwYo2b3-rg@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
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
X-List-Received-Date: Wed, 06 Feb 2013 00:17:59 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 5, 2013 at 11:59 AM, Saul Wold <sgw@linux.intel.com> wrote:
> On 02/05/2013 11:36 AM, Bernhard Reutner-Fischer wrote:
>>
>> On 5 February 2013 20:16, Bernhard Reutner-Fischer
>> <rep.dot.nop@gmail.com> wrote:
>>>
>>> On 5 February 2013 19:39, Saul Wold <sgw@linux.intel.com> wrote:
>>>>
>>>> On 02/05/2013 09:13 AM, Bernhard Reutner-Fischer wrote:
>>>>>
>>>>>
>>>>> On 5 February 2013 17:46, Saul Wold <sgw@linux.intel.com> wrote:
>>>>>>
>>>>>>
>>>>>> On 02/05/2013 07:55 AM, Bernhard Reutner-Fischer wrote:
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> This reverts commit dec6f912d68f52748f645b6af411f189cf464f85.
>>>>>>>
>>>>>>> This breaks core-image-sato-sdk for TCLIBC="uclibc".
>>>>>>>
>>>>>> What's the issue?  Is it fixable instead of reverting the ptest patch?
>>>>>> I
>>>>>
>>>>>
>>>>>
>>>>> The issue is that it incorrectly and unconditionally pulls in eglibc
>>>>> stuff:
>>>>>
>>>>> -RDEPENDS_${PN}-ptest += "\
>>>>> -            eglibc-gconv-utf-16 \
>>>>> -            eglibc-charmap-utf-8 \
>>>>> -            eglibc-gconv-cp1255 \
>>>>> -            eglibc-charmap-cp1255 \
>>>>> -            eglibc-gconv-utf-32 \
>>>>> -            eglibc-gconv-utf-7 \
>>>>> -            eglibc-charmap-invariant \
>>>>> -            eglibc-localedata-translit-cjk-variants \
>>>>> -            tzdata \
>>>>> -            tzdata-americas \
>>>>> -            tzdata-asia \
>>>>> -            tzdata-europe \
>>>>> -            tzdata-posix \
>>>>> -            python-pygobject \
>>>>> -            python-dbus \
>>>>> -           "
>>>>>
>>>> Bjorn,
>>>>
>>>> Do you have some time to look at this and see if you can make use of
>>>> TCLIBC
>>>> to use the correct library and locale package info based on which libc
>>>> is
>>>> being used?
>>>
>>>
>>> would most likely DTRT, yep.
>>
>>
>> Well, given that i see e.g. glibc-gconv-utf-16 nowhere in
>> openembedded-core i suspect they are misplaced and should live in the
>> layer that provides them.
>>
> It's a DYNAMIC package built in eglibc-locale.inc.
>
>
>>> I'm curious what you would need from uClibc to satisfy that ptest thing?
>>> What does it do, what is it good for? :)
>>
>>
> Bjorn question at this point!
>
>
>> Is e.g. glibc-gconv-utf-16 locale support or something like that?
>>
> probably, could the uclibc-gconv provide equivalent?
>


split the ptest recipe out into its own and make it eglibc only recipe
locales and gconv stuff wont fly with uclibc


> Sau!
>
>
>
>> thanks,
>>>
>>>
>>> RDEPENDS_${PN}-ptest += "\
>>>              tzdata \
>>>              tzdata-americas \
>>>              tzdata-asia \
>>>              tzdata-europe \
>>>              tzdata-posix \
>>>              python-pygobject \
>>>              python-dbus \
>>>             "
>>> RDEPENDS_${PN}-ptest_append_libc-eglibc = "\
>>>              eglibc-gconv-utf-16 \
>>>              eglibc-charmap-utf-8 \
>>>              eglibc-gconv-cp1255 \
>>>              eglibc-charmap-cp1255 \
>>>              eglibc-gconv-utf-32 \
>>>              eglibc-gconv-utf-7 \
>>>              eglibc-charmap-invariant \
>>>              eglibc-localedata-translit-cjk-variants \
>>>             "
>>> RDEPENDS_${PN}-ptest_append_libc-eglibc = "did not look"
>>>
>>> TIA && cheers,
>>
>>
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


