Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SpMJT-0001gq-5z
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 18:32:23 +0200
Received: by eeit10 with SMTP id t10so228602eei.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2012 09:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=EXYiUlZJoBA660ClYtvJn00+nrEqPjzEQHrMqhaFagg=;
	b=V8ggSGy4fGJUfGY/+ra8Fkdn4WdbbVL6w9vYA4p06cCvDizlf3Irphairdq0GJr4aj
	zPs7q8nUz8x1MZsDDgV9vInpmhUby0Fj0BDVHbZWG2jyuJR93rlMVkr8BaaVAwuethhc
	jK8R7tghFCgCmP1lQAwolnmRDKfr9gKQmPFBGoUsopYIIwk7iNGU90Pf+7xw6rm3Ivjz
	9ePZB5CXX6axXU1Y0XmyBi3dyWNqhCUBQ0hn1OIedGsxfz60Go4wsLs/QPc1NegSJDK3
	G9J0KaSxbc9E0KaYs0WnQ1kt2w8WfKmgcYFVNXqHBy3rBDpG5C32XRFaHFVODDxNmeLB
	O2nQ==
Received: by 10.14.37.76 with SMTP id x52mr7095640eea.102.1342110070087; Thu,
	12 Jul 2012 09:21:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Thu, 12 Jul 2012 09:20:39 -0700 (PDT)
In-Reply-To: <A23DB6C9-DD03-4F4B-A113-AD718A57B086@dominion.thruhere.net>
References: <CAK18fxF=EiFyWywDQhL=vFd1xv1J33MOwwDG8W7GJLyNZzMVVg@mail.gmail.com>
	<A23DB6C9-DD03-4F4B-A113-AD718A57B086@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 Jul 2012 09:20:39 -0700
Message-ID: <CAMKF1srbpfjbmBegfBvKAEye8U9FwQ4Z-rjFdk1C7SqBSG4Lkw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Results for xz compression with different -T and and -e
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
X-List-Received-Date: Thu, 12 Jul 2012 16:32:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 12, 2012 at 8:40 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>
>
> Op 12 jul. 2012 om 17:29 heeft Andrei Gherzan <andrei@gherzan.ro> het vol=
gende geschreven:
>
>> Hello,
>>
>> Koen suggested to add -T to xz commands. We have this option implemented=
 in our current version .1alpha.
>>
>> -T threads, --threads=3Dthreads
>>               Specify the number of worker threads to use.  Setting thre=
ads to
>>               a special value 0 makes xz use as many threads as there ar=
e  CPU
>>               cores  on  the system.  The actual number of threads can b=
e less
>>               than threads if the input file is not big enough  for  thr=
eading
>>               with  the  given  settings or if using more threads would =
exceed
>>               the memory usage limit.
>>
>> -------------------
>>
>> Memory: 7.8 GiB
>> Processor:: Intel=C2=AE Core=E2=84=A2 i5-2540M CPU @ 2.60GHz =C3=97 4
>>
>> File to compress: 1.9G
>>
>> xz -f -k -e -9 --check=3Dcrc32 (current configuration)
>> Memory: 673Mb
>> real    6m37.170s
>> user    6m35.389s
>> sys     0m0.884s
>> Compressed file size: 3.4Mb
>>
>> xz -f -k -e -9 -T 4 --check=3Dcrc32
>> Memory: Cannot allocate memory
>>
>> xz -f -k -e -8 -T 4 --check=3Dcrc32
>> Memory: 1.8G
>> real    3m24.462s
>> user    12m8.502s
>> sys     0m2.180s
>> Compressed file size: 3.4Mb
>>
>> xz -f -k -T 4 --check=3Dcrc32 (-e defaults to -6)
>> Memory: 471Mb
>> real    1m9.265s
>> user    4m8.972s
>> sys     0m0.944s
>> Compressed file size: 3.4Mb
>>
>> So my conclusion would be to use the default -e -6 with -T 4.
>
> Out of curiousity, what does -T0 give you?
>

if we have to use a default it should be -T0 IMO since everyone dont
have same number of CPUs

> regards,
>
> koen
>
>
>>
>> @g
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


