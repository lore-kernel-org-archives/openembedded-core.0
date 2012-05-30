Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <brandon@rascalmicro.com>) id 1SZpyF-000201-RO
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 22:58:19 +0200
Received: by yenl13 with SMTP id l13so262546yen.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 13:48:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=FQhK9gDOoYlgz3qnHutdiuFP8513BFnLP0M4cztF2nM=;
	b=kKH+dx221yETC8Q0zHKTEn6XlGy6LXSKCljH3otX5DAIfgxuzrRJnWkiZz9ZajIlLO
	JmodiO105iKiZmnrCBiJsh49IMObCJplFdg1GXUKoELQUsQul8uO1TtB0wDCHoRAg0X/
	sKq4gqEZNjgKIQSLmXPReK97mvztbK4kBdOdt7F6Qzps7Mt9R6kwVgJQWvJkIDqtRZLe
	6+5o+h0572v8GUZkN9RkPO/rdEhd5X2635m8j9VAZyYG9R1idp4u4e3n4wKPhPOeR9HF
	Z08CwkZOsqmuR4T26sQbfxVPxhf90usOfW4Qv6U0uCcxVM5qCLrNAoOgnII2yML2mkAA
	O3kg==
MIME-Version: 1.0
Received: by 10.50.181.232 with SMTP id dz8mr12050331igc.72.1338410880260;
	Wed, 30 May 2012 13:48:00 -0700 (PDT)
Received: by 10.231.66.4 with HTTP; Wed, 30 May 2012 13:48:00 -0700 (PDT)
X-Originating-IP: [146.115.15.122]
In-Reply-To: <4FBFFFBE.5000907@windriver.com>
References: <CA+b4E8yzmANrQE43Ck_DZwW-2o1rAAC3rwGeQ96Uy0M9OS2pdw@mail.gmail.com>
	<4FBFEBE2.9080905@windriver.com>
	<CA+b4E8z15092kNF7r=yQiRncNKDnVDZqB5_YqAe_5YRn=kBFPQ@mail.gmail.com>
	<4FBFFFBE.5000907@windriver.com>
Date: Wed, 30 May 2012 16:48:00 -0400
Message-ID: <CA+b4E8ySAPZM7c4g5ZVqG-5L0ZtE1nbWRN7zy1mg+RYzxC4nzw@mail.gmail.com>
From: Brandon Stafford <brandon@rascalmicro.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmiulzdEV1TrU/S0mSI/mKvX3mfncuGOI8AJ6bzb61zc9aUI3zpIlCZxujHCCq8bwe9scQA
Subject: Re: /sbin/init not found in oe-core
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
X-List-Received-Date: Wed, 30 May 2012 20:58:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, May 25, 2012 at 5:55 PM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:
>
> On 5/25/12 3:52 PM, Brandon Stafford wrote:
>>
>> On Fri, May 25, 2012 at 4:30 PM, Mark Hatle<mark.hatle@windriver.com> =
=A0wrote:
>>
>>>> >> =A0Has the boot process changed? What should I be doing instead of
>>>> >> =A0calling /sbin/init?
>>>
>>> >
>>> >
>>> > =A0You should check your new rootfs. =A0is there anything called init=
 on it, even
>>> > =A0in a different directory?
>>
>> So far as I can tell, there is no file named init in the filesystem.
>>
>>> > =A0Are you using meta-oe and systemd?
>>
>> meta-oe: yes
>> systemd: only if it is enabled by default, so I don't think so. I can
>> still see /etc/rc[0-5].d, so I think that means Sys V is still in
>> place.
>
>
> meta-oe may have systemd enabled by default, but I'm not sure. =A0I haven=
't used it recently enough to know for sure.
>
>>> > =A0You should have some type of an init in the new filesystem.. if no=
t, then
>>> > =A0something is wrong with your image and you'll need to diagnose tha=
t first.
>>
>> Sounds like I have something amiss with my filesystem.

Just to wrap this up for the sake of future googlers: in my image
recipe, I was doing this:

=A0 =A0 inherit image

instead of:

    inherit core-image

I had also omitted task-core-basic from my IMAGE_INSTALL list. I'm not
certain which solved the problem, but /sbin/init definitely now
exists.

Cheers,
Brandon


