Return-Path: <armccurdy@gmail.com>
Received: from mail-vn0-f51.google.com (mail-vn0-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id EDA6F73CEB
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 02:05:34 +0000 (UTC)
Received: by vnbf62 with SMTP id f62so10568875vnb.3
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 19:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=7l/Z6tg/NQXg/knT/JU2DLR1BDYKMhV2wffb61LoLh8=;
	b=jZl+WJaVBKY0i7haDIz2IeOdIc1iyRp4zHGA/WDwdeYa6ejVMslBmnhAlrCR2QCKfA
	aDPOjWOxYF3zQGWtfga0pYEfYerEnln1966yKqTCgldyoEwXv+bcj0njQViEd3s85Y6S
	gqDIGVjXhq2xcsF45gDd1VFiDKHhQ0WNxBycctIJvtCYa6Au6OgbBtlMmM6C08Uoq3Zb
	mmofHY0DK+ENIQ8nYh1nnIN5toxcHTQGJxcKCRqfA+0sG5bjK/G5SUCrXea1klKwKCAj
	U6JWdyHWHaengHhZH/O08VsY7FOaKGlEqd7X/MfQUBI1DzEIeONCo19sLFuGa4wklXN+
	BGWA==
MIME-Version: 1.0
X-Received: by 10.202.76.66 with SMTP id z63mr11381139oia.15.1429063535888;
	Tue, 14 Apr 2015 19:05:35 -0700 (PDT)
Received: by 10.202.102.13 with HTTP; Tue, 14 Apr 2015 19:05:35 -0700 (PDT)
In-Reply-To: <CA+chaQfLz-OgjHwce6yoeCQXgMwKEJnuo3ZBThSS=yK7hAXc5Q@mail.gmail.com>
References: <CAJ86T=Uw=yOfYCmEcx5Ro5of7jKksjxq6WSBOaxPOjMHFp8LoA@mail.gmail.com>
	<CA+chaQfLz-OgjHwce6yoeCQXgMwKEJnuo3ZBThSS=yK7hAXc5Q@mail.gmail.com>
Date: Tue, 14 Apr 2015 19:05:35 -0700
Message-ID: <CAJ86T=VMoW-hX-Y6xPy835Hfn4W3Wqbn_s+TCYWfHZ42Oc368w@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE Core mailing list <Openembedded-core@lists.openembedded.org>
Subject: Re: autom4te segfault in Dumper.so when configuring intltool
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Apr 2015 02:05:35 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 14, 2015 at 4:39 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Yes, I see it very often since this patch almost 3 years ago:
> http://lists.openembedded.org/pipermail/openembedded-core/2012-August/066282.html

The problem seems to be that autom4te is getting executed by the host
system's perl but loads Dumper.so from OE sysroot. If the host and OE
versions of perl are sufficiently different then host perl crashes
when it tries to execute OE sysroot Dumper.so

Manually hacking the first line of autom4te to replace "/usr/bin/perl"
with the full path to the perl-native binary in OE sysroot makes the
crashes stop.


> On Tue, Apr 14, 2015 at 11:34 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> I'm seeing messages such as the following appear in syslog when
>> building intltool or intltool-native from fido:
>>
>>   [1049484.121948] autom4te[16180]: segfault at 1 ip 00007fea41a7e7fe
>> sp 00007fff3c666080 error 4 in Dumper.so[7fea41a77000+8000]
>>   [1049567.199028] autom4te[17012]: segfault at 1 ip 00007f34acc007fe
>> sp 00007fff5ed84db0 error 4 in Dumper.so[7f34acbf9000+8000]
>>
>> The segfault happens reproducibly when configuring intltool or
>> intltool-native (one segfault every time I run or re-run the
>> run.do_configure script).
>>
>> There are no obvious errors in config.log and the intltool build
>> succeeds over-all.
>>
>> If I hack the intltool run.do_configure script so that the host
>> machine's perl (v5.18.2) is found instead of perl-native from sysroot
>> then the segfaults stop.
>>
>> Is anyone else seeing the same issue?
>>
>> Andre
>> --
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

