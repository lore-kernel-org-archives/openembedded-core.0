Received: from mail-ob0-f182.google.com ([209.85.214.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UPCdW-0007YD-Vm
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 16:01:31 +0200
Received: by mail-ob0-f182.google.com with SMTP id ef5so5713109obb.27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Apr 2013 06:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=48jzR91CekHOJnqtOBvaK51hWPNKvOL1hEsD6zZaDfU=;
	b=x7b5v2lxKqdLepBwT4s92BPEaa8QskeoI3Xq3xoIseyPPeHVRkGY0mMCWjRfQDZMJG
	LX8cG9D4/JVLPMTlsQRpho2T3lsolVk3vEQAGDGO5n80mcBg08yaMBsPQZMbSTXygq+h
	qmvPRFXTrghwOKhj0b3E61fLK02JXtMMGrTcckYr6xdyNEleOQDmGFDkNtqgF1mp/dqf
	biMyz1ZfX8EWraP8GCQcjQWPdKk6FqUqBozDyuZR1F7hey6uQQCvj9712/Mi7Gy3jmaZ
	2zkpiNBfMAAKH4PheFDYqcySmwQ3Rns/sLQNb1FDsOvPyOmVVJL1PULOzmf7IxHjnwPA
	VMwQ==
MIME-Version: 1.0
X-Received: by 10.182.205.169 with SMTP id lh9mr15457457obc.86.1365428651791; 
	Mon, 08 Apr 2013 06:44:11 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Mon, 8 Apr 2013 06:44:11 -0700 (PDT)
In-Reply-To: <20130408153718.78a8dfb3@e6520eb>
References: <1365268668-15483-1-git-send-email-otavio@ossystems.com.br>
	<20130406200203.6eca6094@e6520eb>
	<CAP9ODKoG2xAL+45oqL++9rWWGC+CRBQyFa3jtX-fFUYKdvCOMA@mail.gmail.com>
	<20130407073745.54c2d0e8@e6520eb>
	<CAP9ODKqfL7o1pjTALefq148uiLQcUBOzv5Tdc5d_wMwfZW8PFw@mail.gmail.com>
	<20130408153718.78a8dfb3@e6520eb>
Date: Mon, 8 Apr 2013 10:44:11 -0300
X-Google-Sender-Auth: koQAJihTUp94rhiAkVXWDElTve0
Message-ID: <CAP9ODKqKO0BYLcpk8EaVXGStCSYE3KWMQUiFii1N0nk7ZEB7OQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: Fix matching of SOC_FAMILY in COMPATIBLE_MACHINE
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
X-List-Received-Date: Mon, 08 Apr 2013 14:01:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 8, 2013 at 10:37 AM, Eric B=E9nard <eric@eukrea.com> wrote:
> Hi Otavio,
>
> Le Mon, 8 Apr 2013 10:31:17 -0300,
> Otavio Salvador <otavio@ossystems.com.br> a =E9crit :
>
>> On Sun, Apr 7, 2013 at 2:37 AM, Eric B=E9nard <eric@eukrea.com> wrote:
>> > Le Sat, 6 Apr 2013 17:58:30 -0300,
>> > Otavio Salvador <otavio@ossystems.com.br> a =E9crit :
>> >
>> >> On Sat, Apr 6, 2013 at 3:02 PM, Eric B=E9nard <eric@eukrea.com> wrote=
:
>> >> > Hi Otavio,
>> >> >
>> >> > Le Sat,  6 Apr 2013 14:17:48 -0300,
>> >> > Otavio Salvador <otavio@ossystems.com.br> a =E9crit :
>> >> >> +            compat_machines =3D [d.getVar('MACHINE', True)]
>> >> >> +            compat_machines.extend((d.getVar('SOC_FAMILY', True) =
or "").split(":"))
>> >> >> +            for this_machine in compat_machines:
>> >> >> +                if re.match(need_machine, this_machine):
>> >> >> +                    break
>> >> >> +            else:
>> >> >> +                raise bb.parse.SkipPackage("incompatible with mac=
hine %s (not in COMPATIBLE_MACHINE)" % this_machine)
>> >> >>
>> >> > aren't you breaking this log here vs what is was supposed to
>> >> > print before ?
>> >>
>> >> The 'else' is used when no 'break' is done inside of for loop.
>> >>
>> > but will this_machine contain the value of the MACHINE variable ?
>>
>> Yes, check:
>>
>> ...
>> +            compat_machines =3D [d.getVar('MACHINE', True)]
>> +            compat_machines.extend((d.getVar('SOC_FAMILY', True) or
>> "").split(":"))
>> ...
>>
> I'm not very experienced in python so sorry is that's a stupid
> remark but after these lines you are using this_machine to go
> through the content of compat_machines so in the end, when it reach the
> log message it will contain the last value in compat_machine (and thus
> the last one in SOC_FAMILY instead of the machine name) ?

Indeed this is indeed a bug. I will follow-up with a proper fix for it.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


