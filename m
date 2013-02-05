Received: from mail-ie0-f171.google.com ([209.85.223.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1U2oYp-0005IX-QZ
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 20:52:08 +0100
Received: by mail-ie0-f171.google.com with SMTP id 10so759730ied.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2013 11:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=qSHhRebJb2+XPo/u3NLBj6T9SgdJL/j+eI3RqU7LAaY=;
	b=x5TUxs7ky6emZi8n6C1UaL47HuiEgnP8JgQIKtdAmcAdrcqp50cPragoAhwMoR8su3
	sQHOXtEiot3gQhab5nRqF4sudivmLvLUxkoEpotsKc1TMkvTQQHcTnFapvfGAVkqenAQ
	5FcD3B92OiHp+BuuM+A6uZrIbAqmsQvirMTi3xCJX+emYHsr+EedWbFFAmYEYbvKklxt
	XJfZtGDWDRsaq37uRE9y40IzgJ+89MW0E0Blrd6ROHuNebjLutTlU/J2ka2mIbSzoysN
	XjZCc0UZwHa5ln3F16CrupUGD+3BBvNq1ZUZsh7sOIrSMPjzFX5qz8vWH3tluenmlwLl
	9J5Q==
MIME-Version: 1.0
X-Received: by 10.50.151.227 with SMTP id ut3mr592885igb.5.1360092977176; Tue,
	05 Feb 2013 11:36:17 -0800 (PST)
Received: by 10.64.143.228 with HTTP; Tue, 5 Feb 2013 11:36:17 -0800 (PST)
In-Reply-To: <CAC1BbcRr36SHQhfK+oT4bZELZMz=zhr+bpKh0XNZg011E0prHA@mail.gmail.com>
References: <cover.1360079373.git.rep.dot.nop@gmail.com>
	<3666e39a359b03ba1e054813f4353ddeed11d506.1360079373.git.rep.dot.nop@gmail.com>
	<5111374E.1050802@linux.intel.com>
	<CAC1BbcS3WTFO+UHKc-ZKL0ba2v4=mhW0Co2JdOVj-ryYsWm71w@mail.gmail.com>
	<511151CC.8080801@linux.intel.com>
	<CAC1BbcRr36SHQhfK+oT4bZELZMz=zhr+bpKh0XNZg011E0prHA@mail.gmail.com>
Date: Tue, 5 Feb 2013 20:36:17 +0100
Message-ID: <CAC1BbcSeJ_yg7Cqoai=aoP+w_ba+MjkZ=QWdPJQAjWfPFCo1OQ@mail.gmail.com>
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
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
X-List-Received-Date: Tue, 05 Feb 2013 19:52:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 5 February 2013 20:16, Bernhard Reutner-Fischer
<rep.dot.nop@gmail.com> wrote:
> On 5 February 2013 19:39, Saul Wold <sgw@linux.intel.com> wrote:
>> On 02/05/2013 09:13 AM, Bernhard Reutner-Fischer wrote:
>>>
>>> On 5 February 2013 17:46, Saul Wold <sgw@linux.intel.com> wrote:
>>>>
>>>> On 02/05/2013 07:55 AM, Bernhard Reutner-Fischer wrote:
>>>>>
>>>>>
>>>>> This reverts commit dec6f912d68f52748f645b6af411f189cf464f85.
>>>>>
>>>>> This breaks core-image-sato-sdk for TCLIBC="uclibc".
>>>>>
>>>> What's the issue?  Is it fixable instead of reverting the ptest patch? I
>>>
>>>
>>> The issue is that it incorrectly and unconditionally pulls in eglibc
>>> stuff:
>>>
>>> -RDEPENDS_${PN}-ptest += "\
>>> -            eglibc-gconv-utf-16 \
>>> -            eglibc-charmap-utf-8 \
>>> -            eglibc-gconv-cp1255 \
>>> -            eglibc-charmap-cp1255 \
>>> -            eglibc-gconv-utf-32 \
>>> -            eglibc-gconv-utf-7 \
>>> -            eglibc-charmap-invariant \
>>> -            eglibc-localedata-translit-cjk-variants \
>>> -            tzdata \
>>> -            tzdata-americas \
>>> -            tzdata-asia \
>>> -            tzdata-europe \
>>> -            tzdata-posix \
>>> -            python-pygobject \
>>> -            python-dbus \
>>> -           "
>>>
>> Bjorn,
>>
>> Do you have some time to look at this and see if you can make use of TCLIBC
>> to use the correct library and locale package info based on which libc is
>> being used?
>
> would most likely DTRT, yep.

Well, given that i see e.g. glibc-gconv-utf-16 nowhere in
openembedded-core i suspect they are misplaced and should live in the
layer that provides them.

> I'm curious what you would need from uClibc to satisfy that ptest thing?
> What does it do, what is it good for? :)

Is e.g. glibc-gconv-utf-16 locale support or something like that?

thanks,
>
> RDEPENDS_${PN}-ptest += "\
>             tzdata \
>             tzdata-americas \
>             tzdata-asia \
>             tzdata-europe \
>             tzdata-posix \
>             python-pygobject \
>             python-dbus \
>            "
> RDEPENDS_${PN}-ptest_append_libc-eglibc = "\
>             eglibc-gconv-utf-16 \
>             eglibc-charmap-utf-8 \
>             eglibc-gconv-cp1255 \
>             eglibc-charmap-cp1255 \
>             eglibc-gconv-utf-32 \
>             eglibc-gconv-utf-7 \
>             eglibc-charmap-invariant \
>             eglibc-localedata-translit-cjk-variants \
>            "
> RDEPENDS_${PN}-ptest_append_libc-eglibc = "did not look"
>
> TIA && cheers,


