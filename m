Return-Path: <abuse@basmevissen.nl>
Received: from hosting.emcodev.net (hosting.emcodev.net [178.18.92.162])
	by mail.openembedded.org (Postfix) with ESMTP id 35F6E7DD82
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 11:57:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by hosting.emcodev.net (Postfix) with ESMTP id AA97E212003;
	Mon, 13 May 2019 13:57:05 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at hosting.emcodev.net
Received: from hosting.emcodev.net ([127.0.0.1])
	by localhost (hosting.emcodev.net [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id OWcPdGsw23yI; Mon, 13 May 2019 13:57:05 +0200 (CEST)
Received: from emcodev.nl (localhost [127.0.0.1])
	by hosting.emcodev.net (Postfix) with ESMTP id F1D8B212001;
	Mon, 13 May 2019 13:57:04 +0200 (CEST)
MIME-Version: 1.0
Date: Mon, 13 May 2019 13:57:04 +0200
From: Bas Mevissen <abuse@basmevissen.nl>
To: Mark Hatle <mark.hatle@windriver.com>
In-Reply-To: <ceb5ee6b-3965-de63-4237-805a6a97e92b@windriver.com>
References: <20190427113714.30173-1-schnitzeltony@gmail.com>
	<d935a0811d57ce8681e7aeeedaf2722233242ae4.camel@linuxfoundation.org>
	<CALbNGRSBsq7c8AAdpHUfkYytbeBMddDns5R7HeQ=9bWZU_OLyA@mail.gmail.com>
	<a45f59b03312a7693bd5d4e4ae04c600@basmevissen.nl>
	<CALbNGRT_FRQfA0jpP7DHsFOxnt97JW-KEjyGXOkW9V2w+Ujgyw@mail.gmail.com>
	<CALbNGRR_YxL=+u7Kc5x8OiTXLFhRjqK_jp53xB5Q_9WZS-rZ+Q@mail.gmail.com>
	<ec77d08feb85f543bbc79372d276092c10336035.camel@linuxfoundation.org>
	<b53e6c90-2a8d-7ae7-b5f7-e7a80b258da3@gmail.com>
	<ceb5ee6b-3965-de63-4237-805a6a97e92b@windriver.com>
Message-ID: <255904c59d132d543a4c13945a7dff77@basmevissen.nl>
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
X-List-Received-Date: Mon, 13 May 2019 11:57:05 -0000
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: quoted-printable

On 2019-05-13 13:34, Mark Hatle wrote:
> On 5/11/19 4:42 AM, Khem Raj wrote:
>>=20
>>=20
>> On 4/29/19 6:51 AM, richard.purdie@linuxfoundation.org wrote:
>>> On Mon, 2019-04-29 at 15:47 +0200, Andreas M=C3=BCller wrote:
>>>> On Mon, Apr 29, 2019 at 2:21 PM Andreas M=C3=BCller <
>>>> schnitzeltony@gmail.com> wrote:
>>>>> On Mon, Apr 29, 2019 at 12:56 PM Bas Mevissen <abuse@basmevissen.nl
>>>>>> wrote:
>>>>>> On 2019-04-29 11:29, Andreas M=C3=BCller wrote:
>>>>>>=20
>>>>>> (...)
>>>>>>=20
>>>>>>> Understood - hope to find time till tomorrow for this. Need to
>>>>>>> find an
>>>>>>> old machine for test because otherwise further fixes might
>>>>>>> remain
>>>>>>> incomplete again.
>>>>>>>=20
>>>>>>=20
>>>>>> Why not add the g++ option --std=3Dc++11 when test building this
>>>>>> recipe?
>>>>>>=20
>>>>>> $cat test.cc
>>>>>>=20
>>>>>> #include <string>
>>>>>>=20
>>>>>> using namespace std::literals;
>>>>>>=20
>>>>>> int main()
>>>>>> {
>>>>>>          return 0;
>>>>>> }
>>>>>>=20
>>>>>>=20
>>>>>> $ g++ --std=3Dc++17 test.cc -o test
>>>>>> $ g++ --std=3Dc++11 test.cc -o test
>>>>>> test.cc:5:22: error: =E2=80=98literals=E2=80=99 is not a namespace=
-name
>>>>>>       5 | using namespace std::literals;
>>>>>>         |                      ^~~~~~~~
>>>>>>=20
>>>>>> -- Bas.
>>>>> Did that but on CFLAGS (copy & paste from another place in recipe)
>>>>> and
>>>>> since issues popped up I thought it was right :(
>>>>>=20
>>>> Looked into:
>>>>=20
>>>> There is no easy way to get vte-native to build with c++11. Even if=20
>>>> -
>>>> patches possibly introduce functional changes/errors (and the result
>>>> of oe-selftest is questionable with a massively patched vte).
>>>>=20
>>>> So I see two ways to go:
>>>>=20
>>>> 1. set vte-native requirements to c++14. That worked here with
>>>> CXXFLAGS_append_class-native =3D " --std=3Dc++14" but looking into l=
ogs
>>>> of
>>>> centos 7 there are several '--std=3Dgnu++11'. Have no idea where the=
y
>>>> come from so chances are high this patch is going fail with c++14.
>>>> 2. revert vte back to 0.52.2 and forget the idea to get recent
>>>> gnome-terminal back in near future. That requires vte 0.56.1 and was
>>>> the reason I sent the update here.
>>>>=20
>>>> My preference is 2.
>>>=20
>>> I'm willing to try testing a c++14 patch if that helps, we can fall
>>> back to 2 if that fails?
>>>=20
>>=20
>> Can we require centos7 and other hosts which use old compilers to
>> install the additional packages to have newer compilers ? e.g. for
>> centos installing devtoolset-7 will fix this issue
>=20
> I think we need to consider disabling this by default, as Ross=20
> indicated he
> wasn't sure it was really required, as well as consider the c++14 patch=
=20
> (if
> standard CentOS supports C++-14).
>=20

If I recall correctly, CentOS properly only supports up to C++-11.

> I do think it's reasonable to try to patch this component, assuming it=20
> can be
> done in a reasonable way with a reasonable end result.  (10-lines is=20
> pretty easy
> to understand/support, 1000 lines... no so much.)
>=20

Agreed. But that was attempted already and seemed to fail.

> However, once we get past one component into multiples, then we need a=20
> better
> answer.  Either a set of buildtools the user can build/download, or=20
> items
> standard distributions have that they can install.
>=20

Or simply build a gcc{,-c++}-native on platforms where the existing host=20
compiler is too old?

It might even be a way to be able to build _older_ OE/Yocto on newer=20
distros. For example, I now use a CentOS 7 systemd container to build=20
Morty stuff on my Fedora 30 build host as some older stuff does not=20
build on the newer build environment of Fedora since some time.

> Unfortunately CentOS 7 (and corresponding RHEL) is ancient by compiler
> standards, but is heavily used as a replacement is not yet ready.  So=20
> this is a
> problem we'll need to deal with for a while still.  Until CentOS 7 era=20
> is really
> no longer heavily used I think we don't have a choice here but to deal=20
> with this
> one way or another.
>=20

Yes, RHEL/CentOS 7 has been great, but RHEL/CentOS 8 to me feel like a=20
year late. I hope with "8" we can leverage the modular repository=20
function to keep the devtools updated.

Given the wide spread in host environments (origin and age), one could=20
wonder whether more of the host build environment should be simply part=20
of OE/Yocto build system as native packages. This will make development=20
definitely easier. The only expense is a larger host environment for the=20
user.

-- bas.

> --Mark
>=20
>>> Cheers,
>>>=20
>>> Richard
>>>=20

