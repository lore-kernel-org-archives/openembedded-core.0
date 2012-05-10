Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SSJ4L-0006Km-4i
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 04:25:49 +0200
Received: by qcso7 with SMTP id o7so839618qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2012 19:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=X8ZtwIfIFxbFdybE7Vn4iBNLubYQZ4JVut6ivKHanVk=;
	b=DeVfCizj9oWLoXqlB94tycZf10tiabm75Xca47oGyV/IWB0FGqCBQKy2OYag8NthhG
	3lLKkWNSpBxpToHzpBnZqjaeGDahm92/wBR11Yiu0H14O8YRKFdf5mplr9eMB/cMCNuh
	ufRbhLRRmBPOJ6rCzkSsc0OfhXKfm5nrqRCBMKUTHLqRDHNnXDZ2D2udoiB0+ztKMe/s
	adKCCpdc/rHvLWeYTk29t9A3Vei5uZJGqFTuuRkoagAPT282xGp06TcgbSV7c7DBDLnu
	ovQxMA7VXbQuq7FJFhvHAQLu9UISmd3d0rxVD/W54FMEXlZ0e/e0sWTTSXfkxA9G2D2y
	Sx2Q==
Received: by 10.224.97.199 with SMTP id m7mr8988500qan.38.1336616135235; Wed,
	09 May 2012 19:15:35 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.214.81 with HTTP; Wed, 9 May 2012 19:15:14 -0700 (PDT)
In-Reply-To: <4FAB145D.4080001@linux.intel.com>
References: <cover.1336608479.git.josh@linux.intel.com>
	<CABcZANkTB3_QkBcMycY9Z+pZndz7JmOUAksvsQSSiwhHE7vZnQ@mail.gmail.com>
	<4FAB145D.4080001@linux.intel.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 9 May 2012 19:15:14 -0700
X-Google-Sender-Auth: rijFceODnWK_de9zEvepNpDoCXE
Message-ID: <CABcZANkk1HSS1SeJK-qpALZukc4L8sDKozf-A08NRTDOw+dGKg@mail.gmail.com>
To: Joshua Lock <josh@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 0/3] Shared state for all !
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
X-List-Received-Date: Thu, 10 May 2012 02:25:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 9, 2012 at 6:05 PM, Joshua Lock <josh@linux.intel.com> wrote:
>
>
> On 09/05/12 17:50, Chris Larson wrote:
>>
>> On Wed, May 9, 2012 at 5:22 PM, Joshua Lock<josh@linux.intel.com> =C2=A0=
wrote:
>>>
>>> In Yocto #2041[2] =C2=A0Mark reported an issue with reusing shared stat=
e as a
>>> different user on the same machine.
>>>
>>> Since the whole purpose of shared state is that it be shared I decided =
to
>>> dig
>>> into this issue. I wanted to at least be able to use the shared-state
>>> cache of
>>> a different user without error, even if all of the objects aren't
>>> actually used
>>> (i.e. native, at least on the Edison branch I did most of the testing
>>> with).
>>>
>>> This is an RFC mainly because it changes the permissions of created
>>> directories,
>>> sstate files and siginfo files from what they have traditionally been.
>>>
>>> There is more of the rhyme an reason in the patch commit headers and
>>> comments
>>> but tl;dr bb.mkdirhier directories will be 0777 (rwxrwxrwx) with this
>>> patch, as
>>> will all of the contents of sstate-cache (siginfo and tgz) files.
>>>
>>> This is actually what one would expect from reading the Python API docs
>>> for
>>> os.makedirs "The default mode is 0777 (octal)."[1] but not what actuall=
y
>>> happens
>>> on most modern Linux systems thanks to umask.
>>>
>>> Please review the following changes for suitability for inclusion. If y=
ou
>>> have
>>> any objections or suggestions for improvement, please respond to the
>>> patches. If
>>> you agree with the changes, please provide your Acked-by.
>>
>>
>> 777 seems questionable to me, personally. Generally collaboration
>> happens amongst folks within a group, and chmod g+s makes that easier.
>> I'd expect 775 to be a more sane value, myself.
>
>
> Do you mean for bb.mkdirhier calls, the tgz files, the siginfo files or
> everything?
>
> I went with 777 for mkdirhier as that's the default of os.makedirs before
> umask is involved. I would likely have picked rw-rw-r-- (664) if I weren'=
t
> trying to request comments.

Gotcha.

I'm concerned about the behavior change and potential implications of
changing the default behavior of mkdirhier. I'm inclined to say that
when you don't pass mode, let it use the current behavior of obeying
the umask. If we're not going to do that, and want to change the
default behavior, then I think 777 is the wrong/questionable default.
Beyond that, 777 is certainly the wrong mode to be using for the
shared state package in sstate.bbclass.
--=20
Christopher Larson


