Received: from kozue.soulik.info (kozue.soulik.info [108.61.200.231])
 by mx.groups.io with SMTP id smtpd.web10.4261.1627015950824098362
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 21:52:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: soulik.info, ip: 108.61.200.231, mailfrom: ayaka@soulik.info)
Received: from [10.42.0.186] (unknown [192.147.44.15])
	by kozue.soulik.info (Postfix) with ESMTPSA id 4CB4C101FEF;
	Fri, 23 Jul 2021 13:51:09 +0900 (JST)
Mime-Version: 1.0 (1.0)
Subject: Re: [OE-core] proposal: using oe to build Android vendor image
From: "Randy Li" <ayaka@soulik.info>
X-Mailer: iPad Mail (16D57)
In-Reply-To: <CAMKF1sr7VxYthccLNMSeykCgosjV=rhZ7YrF2Uq4hzm+WOqe3A@mail.gmail.com>
Date: Fri, 23 Jul 2021 12:52:22 +0800
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Message-Id: <D23A4E43-F3F6-4FE2-A4EF-1F8C902D0471@soulik.info>
References: <8DD70E68-65EE-432E-BEA4-D9E8988A44BB@soulik.info> <CAMKF1sr7VxYthccLNMSeykCgosjV=rhZ7YrF2Uq4hzm+WOqe3A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Jul 23, 2021, at 3:26 AM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
> Hi Randy
>=20
> Its not clear what you are looking for, perhaps you are looking to
> build some Linux packages and dependencies that can run on Android.
Most of like that.
> meta-mingw does not build for windows target although it can be
> extended, it builds SDK that can be used on windows hosts to build
> packages for linux targets. What you need is perhaps meta-android
> which can provide the android SDK environment into OE and then you can
> leverage the build infra. But if you explain your usecase a bit more
> that may bring more ways to solve your problem
For example, if I want to build and setup a media service in a Android sys=
tem(or a AI service), it could depend on a framework likes FFMpeg, Gstreame=
r or VideoLan, that framework would depend on more packages.
Then I just create a image target, oe would build all those packages, inst=
all them into a stagging dir then pack in into a image. That image would no=
t included some Android system library likes library C and C++, and the oth=
er library vendor should not have its own version(likes OpenGL ES, libjpeg =
? OpenMAX)
I think the first thing I need to care is how to use that external clang b=
aesd toolchain from Android NDK. We can=E2=80=99t use our build one, it mus=
t follow Android=E2=80=99s ABI strictly or it can=E2=80=99t fix into Androi=
d update. meta-external-toolchain is for gcc, I am looking at how to add an=
 clang version.
>=20
>> On Thu, Jul 22, 2021 at 6:39 AM Randy Li <ayaka@soulik.info> wrote:
>>=20
>> Hello All
>>=20
>> I am working with video, graphics and AI stuff all the time, although A=
ndroid has many good frameworks and published some good standards to follow=
ing(as long as you could understand its documents). I am sure we would like=
 still to use those packages that we are familiar with at GNU Linux. For ex=
ample, if we want to use the Gstreamer on Android, you would need to compil=
e a bulk of dependency packages. Although I don't know a vendor would like =
to ship those frameworks in their product, they are very useful at the deve=
lopment stage. I am sure AI staff would like this, there are too many neura=
l network frameworks for different platforms. Those frameworks may depend o=
n the other neural network framework for model parsing.
>>=20
>> There is a project from Gstreamer called Cerbero, people may have alrea=
dy known that. It has done the most of work I want, but  I just don't want =
to port so many recipes to it.
>>=20
>> I am not sure what I need to do, what the meta-mingw did may not be eno=
ugh for me. Do I need to start up a new distribution? There is not a librar=
y C nor linker loader in the vendor's partition and many install files for =
general Linux won't be used in Android.  The meta-clang may need to be adop=
ted as it would use an external Android NDK toolchain. And I don't need to =
support many target platforms based on Android One policy, only limited ABI=
s would be supported and no CPU variant tuning would be used.
>> After we could run that software only depending on the kernel's API, I =
think I could move forward to support building those HAL modules(likes hard=
ware decoders and encoders for codec2). That would require us to separate t=
hose codes from Android SDK repositories. Packing the APEX file should be i=
n plan as well.
>>=20
>> ayaka
>>=20
>>=20
>>=20

