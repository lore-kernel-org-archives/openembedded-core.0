Received: from mail-ie0-f173.google.com ([209.85.223.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1U2oFT-0004l8-Gy
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 20:32:08 +0100
Received: by mail-ie0-f173.google.com with SMTP id 9so723968iec.32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2013 11:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=klSqUNNa83OuPI6utY5d8lVzIs15en5o+hujP+RjtXw=;
	b=z6ELSDNvGV9H5QeC1MS9LmfNXL6+ZEQ2lUmYpriyKGaeYQJ2dZMbT4g4yayI64jc+a
	z7QvaytAAJElYMf90Pg7rDVX8LclUMEQeX3enlFzhcjtP0FAh2Z2a8PdhtaTVzOZuN+7
	wKFsVXh0dLrH+tvzKOh9UI2B6TJVAqe8jjmeyW1S6fpButujQCIJd85ha7pwatUbutjX
	/LKV05zD6gvyN/jm9wQcEBfjP8NVkC7WvJXNWSpwjZINAiE3gYcVGu9fd6BAfYjndoFe
	Ui7i4j0EgVruIJQK8d8X+2W6rLTV9zq1JBUCQHeXRQMovrrsY71PozVpBNSLI73WhN4r
	wFmg==
MIME-Version: 1.0
X-Received: by 10.50.236.41 with SMTP id ur9mr473394igc.7.1360091776930; Tue,
	05 Feb 2013 11:16:16 -0800 (PST)
Received: by 10.64.143.228 with HTTP; Tue, 5 Feb 2013 11:16:16 -0800 (PST)
In-Reply-To: <511151CC.8080801@linux.intel.com>
References: <cover.1360079373.git.rep.dot.nop@gmail.com>
	<3666e39a359b03ba1e054813f4353ddeed11d506.1360079373.git.rep.dot.nop@gmail.com>
	<5111374E.1050802@linux.intel.com>
	<CAC1BbcS3WTFO+UHKc-ZKL0ba2v4=mhW0Co2JdOVj-ryYsWm71w@mail.gmail.com>
	<511151CC.8080801@linux.intel.com>
Date: Tue, 5 Feb 2013 20:16:16 +0100
Message-ID: <CAC1BbcRr36SHQhfK+oT4bZELZMz=zhr+bpKh0XNZg011E0prHA@mail.gmail.com>
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
X-List-Received-Date: Tue, 05 Feb 2013 19:32:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 5 February 2013 19:39, Saul Wold <sgw@linux.intel.com> wrote:
> On 02/05/2013 09:13 AM, Bernhard Reutner-Fischer wrote:
>>
>> On 5 February 2013 17:46, Saul Wold <sgw@linux.intel.com> wrote:
>>>
>>> On 02/05/2013 07:55 AM, Bernhard Reutner-Fischer wrote:
>>>>
>>>>
>>>> This reverts commit dec6f912d68f52748f645b6af411f189cf464f85.
>>>>
>>>> This breaks core-image-sato-sdk for TCLIBC="uclibc".
>>>>
>>> What's the issue?  Is it fixable instead of reverting the ptest patch? I
>>
>>
>> The issue is that it incorrectly and unconditionally pulls in eglibc
>> stuff:
>>
>> -RDEPENDS_${PN}-ptest += "\
>> -            eglibc-gconv-utf-16 \
>> -            eglibc-charmap-utf-8 \
>> -            eglibc-gconv-cp1255 \
>> -            eglibc-charmap-cp1255 \
>> -            eglibc-gconv-utf-32 \
>> -            eglibc-gconv-utf-7 \
>> -            eglibc-charmap-invariant \
>> -            eglibc-localedata-translit-cjk-variants \
>> -            tzdata \
>> -            tzdata-americas \
>> -            tzdata-asia \
>> -            tzdata-europe \
>> -            tzdata-posix \
>> -            python-pygobject \
>> -            python-dbus \
>> -           "
>>
> Bjorn,
>
> Do you have some time to look at this and see if you can make use of TCLIBC
> to use the correct library and locale package info based on which libc is
> being used?

would most likely DTRT, yep.
I'm curious what you would need from uClibc to satisfy that ptest thing?
What does it do, what is it good for? :)

RDEPENDS_${PN}-ptest += "\
            tzdata \
            tzdata-americas \
            tzdata-asia \
            tzdata-europe \
            tzdata-posix \
            python-pygobject \
            python-dbus \
           "
RDEPENDS_${PN}-ptest_append_libc-eglibc = "\
            eglibc-gconv-utf-16 \
            eglibc-charmap-utf-8 \
            eglibc-gconv-cp1255 \
            eglibc-charmap-cp1255 \
            eglibc-gconv-utf-32 \
            eglibc-gconv-utf-7 \
            eglibc-charmap-invariant \
            eglibc-localedata-translit-cjk-variants \
           "
RDEPENDS_${PN}-ptest_append_libc-eglibc = "did not look"

TIA && cheers,


