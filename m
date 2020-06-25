Received: from dd41138.kasserver.com (dd41138.kasserver.com [85.13.157.12])
 by mx.groups.io with SMTP id smtpd.web11.2053.1593112701958667106
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 12:18:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: herbrechtsmeier.net, ip: 85.13.157.12, mailfrom: stefan@herbrechtsmeier.net)
Received: from [192.168.178.42] (i5E866743.versanet.de [94.134.103.67])
	by dd41138.kasserver.com (Postfix) with ESMTPSA id B3D1E11A0011;
	Thu, 25 Jun 2020 21:18:19 +0200 (CEST)
Subject: Re: [OE-core] Status of Go support
To: Paul Barker <pbarker@konsulko.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
 Khem Raj <raj.khem@gmail.com>, Otavio Salvador <otavio@ossystems.com.br>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <c207ad43-fba6-d5ff-085a-f6be1231e230@herbrechtsmeier.net>
 <CAP9ODKoR_JOt6UQFTMNJYv_fh4d-vuVyy-5k_cd6ZgjsiLcA0Q@mail.gmail.com>
 <CAMKF1srKPeNpoX0uRPSHQM3VDuqe+C=adNsDFZ85L+irrs6xDQ@mail.gmail.com>
 <2f176c09-1647-6d46-548c-e58fff7559b6@herbrechtsmeier.net>
 <c0aee660-78e1-d6b0-00d1-687853b89578@gmail.com>
 <9f3cf7b6-7240-f1ea-6c4f-27dde0dbdc6a@herbrechtsmeier.net>
 <CAP9ODKpQ+ZgNqoZvWtHRF_RyrvpXan4v-ZM=U9fiHXj8o8Daww@mail.gmail.com>
 <6c1c02b9-842a-1d33-2727-932d7a46f702@herbrechtsmeier.net>
 <CAM9ZRVss31=qStjgLFh4ZOGcMiYHs1Z7CMxo7TWXH-xF_9YVow@mail.gmail.com>
From: "Stefan Herbrechtsmeier" <stefan@herbrechtsmeier.net>
Message-ID: <781a286f-81fa-bfdf-9093-920937cb497e@herbrechtsmeier.net>
Date: Thu, 25 Jun 2020 21:18:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAM9ZRVss31=qStjgLFh4ZOGcMiYHs1Z7CMxo7TWXH-xF_9YVow@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 25.06.20 um 20:43 schrieb Paul Barker:
> On Thu, 25 Jun 2020 at 16:36, Stefan Herbrechtsmeier
> <stefan@herbrechtsmeier.net> wrote:
>>
>> Am 24.06.20 um 22:24 schrieb Otavio Salvador:
>>> Em qua., 24 de jun. de 2020 =C3=A0s 17:17, Stefan Herbrechtsmeier
>>> <stefan@herbrechtsmeier.net> escreveu:
>>>> The go-mod.bbclass download data from the internet during do_compile=
. If
>>>> you cut the internet connection after a do_fetch the do_compile fail=
ed:
>>>
>>> Yes, this was the better we could get without hacking go mod tool
>>> itself. It would be nice if you can provide an alternative way to
>>> improve it.
>>>
>>
>> What are the alternative?
>>
>> a) Add a fetcher to bitbake to create a vendor directory via `go mod
>> vendor`?
>> b) Add a `create_go.py` to recipetool and create a recipe per module?
>>
>> The solutions are related to the npm (a) and python (b) solution.
>>
>> I don't like a) because it breaks the best practices of OE (for exampl=
e
>> one major version per project and avoid embedded dependencies). On the
>> other side b) isn't so simple because of the circular dependency betwe=
en
>> go projects. This means we need a package (recipe) for the source and
>> the binary.
>=20
> (a) may not be in line with past best practices but I think it's
> better than no change. It at least gives the archiver and licensing
> classes a chance to capture the relevant artifacts (if configured
> correctly) and so do proper license compliance and/or maintain a
> source mirror.
>=20
> I think the Python method of one recipe per dependency works well for
> Python since it's not common to distribute a built artifact which
> statically links all those dependencies together. That's often not the
> case with rust and golang projects though.

The advantage of go-mod and cargo in compare to npm is that they enforce=20
semver. This mean you could provide one recipe per major version. The=20
statically linked dependencies are more a size problem on the target.

> I still think one recipe
> per upstream project with dependencies fully expressed in the bitbake
> recipes would be ideal but as others have said that's fighting a
> losing battle.

The main problem is that this package manager work different from the oe=20
approach. This package managers collect all dependencies at once and=20
doesn't process package after package.

I try to create one recipe per module (project) but have the problem=20
that two project depend on each other.



