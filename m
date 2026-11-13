Subject: Re: [PATCH v3] rust: add rust-analyzer to the SDK behind a PACKAGECONFIG
To: openembedded-core@lists.openembedded.org
From: "Dora, Sunil Kumar" <SunilKumar.Dora@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (106.51.222.193)
X-Originating-Platform: Windows Chrome 157
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 12 Nov 2026 23:57:34 -0800
References: <20261006111230.1478039-1-benhur.tessele@est.tech> <20261111154442.241009-1-benhur.tessele@est.tech> <743327.1794550799903849632@lists.openembedded.org> <CAMKF1spBTO3yUOYJ1pNkSKn9pfzQioX0o5OJU+Nbk=bh5G0OEw@mail.gmail.com>
In-Reply-To: <CAMKF1spBTO3yUOYJ1pNkSKn9pfzQioX0o5OJU+Nbk=bh5G0OEw@mail.gmail.com>
Message-ID: <727417.1794556654997095405@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="NpPMc8ZRhZ9zLe4kskHP"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 07:57:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250153

--NpPMc8ZRhZ9zLe4kskHP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 12:17 PM, Khem Raj wrote:

>=20
> binary is started by the system loader, but then picks up a libc.so.6 fro=
m
> some other glibc tree
> (the.../lib/ in the message). That libc wants a private symbol the system
> loader doesn=E2=80=99t
> provide, so rustc dies before doing anything.
>=20

Yes. This looks like the same issue as YOCTO #15579 / #15735.
Two patches to drop the wrapper were posted in early 2025 and not merged,
the concern being the libncurses case the wrapper was added for in 388e7cac=
9f ( https://git.openembedded.org/openembedded-core/commit/?id=3D388e7cac9f=
90e79ce8c3c1683d8ee0f4df1bc907 ).

What has changed since then is glibc 2.44: the pointer guard moved to a
GLIBC_PRIVATE symbol exported by ld.so, so any host loader older than
2.44 now fails deterministically on the SDK libc:

https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Da5ec880f808ee7268d=
985bed4f961799bdc0a4bf

With rust-analyzer in the SDK this will be hit by anyone who has rustup
installed, so it may be worth revisiting. How would you like this tracked?

Thanks,
Sunil Dora

>=20
>=20
>

--NpPMc8ZRhZ9zLe4kskHP
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Fri, Nov 13, 2026 at 12:17 PM, Khem Raj wrote:</div>
<div>
<blockquote>
<div>binary is started by the system loader, but then picks up a <code dir=
=3D"ltr">libc.so.6</code> from some other glibc tree</div>
<div>(the <code dir=3D"ltr">.../lib/</code> in the message). That libc want=
s a private symbol the system loader doesn&rsquo;t</div>
<div>provide, so rustc dies before doing anything.</div>
</blockquote>
Yes. This looks like the same issue as YOCTO #15579 / #15735.&nbsp;<br />Tw=
o patches to drop the wrapper were posted in early 2025 and not merged,&nbs=
p;<br />the concern being the libncurses case the wrapper was added for in =
<a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=3D388e=
7cac9f90e79ce8c3c1683d8ee0f4df1bc907" target=3D"_blank" rel=3D"noopener">38=
8e7cac9f</a>.<br /><br />What has changed since then is glibc 2.44: the poi=
nter guard moved to a<br />GLIBC_PRIVATE symbol exported by ld.so, so any h=
ost loader older than<br />2.44 now fails deterministically on the SDK libc=
:<br /><br />https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Da5ec8=
80f808ee7268d985bed4f961799bdc0a4bf<br /><br />With rust-analyzer in the SD=
K this will be hit by anyone who has rustup<br />installed, so it may be wo=
rth revisiting. How would you like this tracked?<br /><br />Thanks,<br />Su=
nil Dora<br />
<blockquote>
<div>&nbsp;</div>
</blockquote>
</div>

--NpPMc8ZRhZ9zLe4kskHP--
