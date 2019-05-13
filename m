Return-Path: <abuse@basmevissen.nl>
Received: from hosting.emcodev.net (hosting.emcodev.net [178.18.92.162])
	by mail.openembedded.org (Postfix) with ESMTP id 9C2DB7DD91
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 11:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by hosting.emcodev.net (Postfix) with ESMTP id 32841212003;
	Mon, 13 May 2019 13:21:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at hosting.emcodev.net
Received: from hosting.emcodev.net ([127.0.0.1])
	by localhost (hosting.emcodev.net [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id v_QUMdJI9MiG; Mon, 13 May 2019 13:21:20 +0200 (CEST)
Received: from emcodev.nl (localhost [127.0.0.1])
	by hosting.emcodev.net (Postfix) with ESMTP id CC00E212001;
	Mon, 13 May 2019 13:21:20 +0200 (CEST)
MIME-Version: 1.0
Date: Mon, 13 May 2019 13:21:20 +0200
From: Bas Mevissen <abuse@basmevissen.nl>
To: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <b53e6c90-2a8d-7ae7-b5f7-e7a80b258da3@gmail.com>
References: <20190427113714.30173-1-schnitzeltony@gmail.com>
	<d935a0811d57ce8681e7aeeedaf2722233242ae4.camel@linuxfoundation.org>
	<CALbNGRSBsq7c8AAdpHUfkYytbeBMddDns5R7HeQ=9bWZU_OLyA@mail.gmail.com>
	<a45f59b03312a7693bd5d4e4ae04c600@basmevissen.nl>
	<CALbNGRT_FRQfA0jpP7DHsFOxnt97JW-KEjyGXOkW9V2w+Ujgyw@mail.gmail.com>
	<CALbNGRR_YxL=+u7Kc5x8OiTXLFhRjqK_jp53xB5Q_9WZS-rZ+Q@mail.gmail.com>
	<ec77d08feb85f543bbc79372d276092c10336035.camel@linuxfoundation.org>
	<b53e6c90-2a8d-7ae7-b5f7-e7a80b258da3@gmail.com>
Message-ID: <880385fd89953494847818f104c6f642@basmevissen.nl>
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
X-List-Received-Date: Mon, 13 May 2019 11:21:24 -0000
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: quoted-printable

On 2019-05-11 03:42, Khem Raj wrote:
> On 4/29/19 6:51 AM, richard.purdie@linuxfoundation.org wrote:
>> On Mon, 2019-04-29 at 15:47 +0200, Andreas M=C3=BCller wrote:
>>> On Mon, Apr 29, 2019 at 2:21 PM Andreas M=C3=BCller <
>>> schnitzeltony@gmail.com> wrote:
>>>> On Mon, Apr 29, 2019 at 12:56 PM Bas Mevissen <abuse@basmevissen.nl
>>>>> wrote:
>>>>> On 2019-04-29 11:29, Andreas M=C3=BCller wrote:
>>>>>=20
>>>>> (...)
>>>>>=20
>>>>>> Understood - hope to find time till tomorrow for this. Need to
>>>>>> find an
>>>>>> old machine for test because otherwise further fixes might
>>>>>> remain
>>>>>> incomplete again.
>>>>>>=20
>>>>>=20
>>>>> Why not add the g++ option --std=3Dc++11 when test building this
>>>>> recipe?
>>>>>=20
>>>>> $cat test.cc
>>>>>=20
>>>>> #include <string>
>>>>>=20
>>>>> using namespace std::literals;
>>>>>=20
>>>>> int main()
>>>>> {
>>>>>          return 0;
>>>>> }
>>>>>=20
>>>>>=20
>>>>> $ g++ --std=3Dc++17 test.cc -o test
>>>>> $ g++ --std=3Dc++11 test.cc -o test
>>>>> test.cc:5:22: error: =E2=80=98literals=E2=80=99 is not a namespace-=
name
>>>>>       5 | using namespace std::literals;
>>>>>         |                      ^~~~~~~~
>>>>>=20
>>>>> -- Bas.
>>>> Did that but on CFLAGS (copy & paste from another place in recipe)
>>>> and
>>>> since issues popped up I thought it was right :(
>>>>=20
>>> Looked into:
>>>=20
>>> There is no easy way to get vte-native to build with c++11. Even if -
>>> patches possibly introduce functional changes/errors (and the result
>>> of oe-selftest is questionable with a massively patched vte).
>>>=20
>>> So I see two ways to go:
>>>=20
>>> 1. set vte-native requirements to c++14. That worked here with
>>> CXXFLAGS_append_class-native =3D " --std=3Dc++14" but looking into lo=
gs
>>> of
>>> centos 7 there are several '--std=3Dgnu++11'. Have no idea where they
>>> come from so chances are high this patch is going fail with c++14.
>>> 2. revert vte back to 0.52.2 and forget the idea to get recent
>>> gnome-terminal back in near future. That requires vte 0.56.1 and was
>>> the reason I sent the update here.
>>>=20
>>> My preference is 2.
>>=20
>> I'm willing to try testing a c++14 patch if that helps, we can fall
>> back to 2 if that fails?
>>=20
>=20
> Can we require centos7 and other hosts which use old compilers to
> install the additional packages to have newer compilers ? e.g. for
> centos installing devtoolset-7 will fix this issue
>=20

Apparently [1], there is already a devtoolset-8 [2] with gcc 8.2.
So if going this step, lets directly go to the latest devtoolset version=20
available.

The only question is whether only this issue with 1 native package is=20
sufficient justification to impose the additional burden to the users.=20
If it would make further OE/Yocto core development easier, it would be a=20
great way to keep supporting RHEL/CentOS 7 until "8" is mainstream.

(the "scl enable devtoolset-8 <shell>" command could be incorporated=20
into the oe-init script to make the burden less)

[1] the collections browser at softwarecollections.org seems to be=20
broken or unmaintained, reported this to the appropriate list already
[2] http://mirror.centos.org/centos/7/sclo/x86_64/rh/devtoolset-8/

>> Cheers,
>>=20
>> Richard
>>=20

BR,

Bas.

