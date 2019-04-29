Return-Path: <abuse@basmevissen.nl>
Received: from hosting.emcodev.net (hosting.emcodev.net [178.18.92.162])
	by mail.openembedded.org (Postfix) with ESMTP id 965B77DBBE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 15:51:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by hosting.emcodev.net (Postfix) with ESMTP id 43F74212002;
	Mon, 29 Apr 2019 17:51:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at hosting.emcodev.net
Received: from hosting.emcodev.net ([127.0.0.1])
	by localhost (hosting.emcodev.net [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id F2x4Va3BGZTE; Mon, 29 Apr 2019 17:51:47 +0200 (CEST)
Received: from emcodev.nl (localhost [127.0.0.1])
	by hosting.emcodev.net (Postfix) with ESMTP id 7F618212001;
	Mon, 29 Apr 2019 17:51:47 +0200 (CEST)
MIME-Version: 1.0
Date: Mon, 29 Apr 2019 17:51:47 +0200
From: Bas Mevissen <abuse@basmevissen.nl>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
In-Reply-To: <CALbNGRR_YxL=+u7Kc5x8OiTXLFhRjqK_jp53xB5Q_9WZS-rZ+Q@mail.gmail.com>
References: <20190427113714.30173-1-schnitzeltony@gmail.com>
	<d935a0811d57ce8681e7aeeedaf2722233242ae4.camel@linuxfoundation.org>
	<CALbNGRSBsq7c8AAdpHUfkYytbeBMddDns5R7HeQ=9bWZU_OLyA@mail.gmail.com>
	<a45f59b03312a7693bd5d4e4ae04c600@basmevissen.nl>
	<CALbNGRT_FRQfA0jpP7DHsFOxnt97JW-KEjyGXOkW9V2w+Ujgyw@mail.gmail.com>
	<CALbNGRR_YxL=+u7Kc5x8OiTXLFhRjqK_jp53xB5Q_9WZS-rZ+Q@mail.gmail.com>
Message-ID: <b96f15f32947c7d40a4fc5a3e4800247@basmevissen.nl>
X-Sender: abuse@basmevissen.nl
User-Agent: Roundcube Webmail/1.3.7
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] vte-native: reduce c++ requirements from c++17 -> c++11
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
X-List-Received-Date: Mon, 29 Apr 2019 15:51:48 -0000
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: quoted-printable

On 2019-04-29 15:47, Andreas M=C3=BCller wrote:
> On Mon, Apr 29, 2019 at 2:21 PM Andreas M=C3=BCller=20
> <schnitzeltony@gmail.com> wrote:
>>=20
>> On Mon, Apr 29, 2019 at 12:56 PM Bas Mevissen <abuse@basmevissen.nl>=20
>> wrote:
>> >
>> > On 2019-04-29 11:29, Andreas M=C3=BCller wrote:
>> >
>> > (...)
>> >
>> > >>
>> > > Understood - hope to find time till tomorrow for this. Need to fin=
d an
>> > > old machine for test because otherwise further fixes might remain
>> > > incomplete again.
>> > >
>> >
>> > Why not add the g++ option --std=3Dc++11 when test building this rec=
ipe?
>> >
>> > $cat test.cc
>> >
>> > #include <string>
>> >
>> > using namespace std::literals;
>> >
>> > int main()
>> > {
>> >         return 0;
>> > }
>> >
>> >
>> > $ g++ --std=3Dc++17 test.cc -o test
>> > $ g++ --std=3Dc++11 test.cc -o test
>> > test.cc:5:22: error: =E2=80=98literals=E2=80=99 is not a namespace-n=
ame
>> >      5 | using namespace std::literals;
>> >        |                      ^~~~~~~~
>> >
>> > -- Bas.
>> Did that but on CFLAGS (copy & paste from another place in recipe) and
>> since issues popped up I thought it was right :(
>>=20
> Looked into:
>=20
> There is no easy way to get vte-native to build with c++11. Even if -
> patches possibly introduce functional changes/errors (and the result
> of oe-selftest is questionable with a massively patched vte).
>=20
> So I see two ways to go:
>=20
> 1. set vte-native requirements to c++14. That worked here with
> CXXFLAGS_append_class-native =3D " --std=3Dc++14" but looking into logs=
 of
> centos 7 there are several '--std=3Dgnu++11'. Have no idea where they
> come from so chances are high this patch is going fail with c++14.

In Centos 7, its gcc-c++ is 4.8.5 currently. That version does not fully=20
support c++14.

> 2. revert vte back to 0.52.2 and forget the idea to get recent
> gnome-terminal back in near future. That requires vte 0.56.1 and was
> the reason I sent the update here.
>=20

vte 0.56.2 and 0.57 are out already. So better focus on one of those=20
versions instead of 0.56.1.

> My preference is 2.
>=20
> Cheers
>=20
> Andreas

