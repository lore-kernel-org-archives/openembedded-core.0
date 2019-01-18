Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id CF08E6BC89
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 00:34:33 +0000 (UTC)
Received: from [172.16.169.141] (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id 4FBD6220239;
	Fri, 18 Jan 2019 13:34:33 +1300 (NZDT)
To: Randy MacLeod <randy.macleod@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20190116225154.12180-1-douglas.royds@taitradio.com>
	<b08ee857fa323713a81f69c756169807f62a2ba2.camel@linuxfoundation.org>
	<48037e45-c43c-ad6e-8b99-a4b797e601d8@taitradio.com>
	<3aae69e3-a2e2-6c17-f808-33f89b002576@windriver.com>
From: Douglas Royds <douglas.royds@taitradio.com>
Message-ID: <8df40c0e-77a4-b9fa-7aac-aeff2d60d2c7@taitradio.com>
Date: Fri, 18 Jan 2019 13:34:33 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <3aae69e3-a2e2-6c17-f808-33f89b002576@windriver.com>
Subject: Re: [PATCH] cmake.bbclass: make cleaning of build directory on configure optional
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
X-List-Received-Date: Fri, 18 Jan 2019 00:34:34 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 18/01/19 12:59 PM, Randy MacLeod wrote:

> On 1/16/19 7:38 PM, Douglas Royds wrote:
>> On 17/01/19 12:01 PM, Richard Purdie wrote:
>>
>>> On Thu, 2019-01-17 at 11:51 +1300, Douglas Royds wrote:
>>>> From: Sam Nobs <samuel.nobs@taitradio.com>
>>>>
>>>> The do_configure task is sensitive to changes in recipes and
>>>> configuration files.
>>>> This can be time consuming because cmake.bbclass deletes the ${B}
>>>> directory
>>>> at the beginning of the do_configure task. CMake figures
>>>> out what to do when it's run again, so unless your cmake files are
>>>> buggy, there shouldn't
>>>> be any need to erase the build directory and start afresh.
>>>>
>>>> This change allows you to turn this behaviour off, either globally o=
r
>>>> on a per-recipe basis, e.g.
>>>>
>>>> OECMAKE_CLEAN_BUILDDIR_ON_CONFIGURE_pn-yourrecipe =3D ""
>>>>
>>>> Signed-off-by: Sam Nobs <samuel.nobs@taitradio.com>
>>>> ---
>>>> =C2=A0 meta/classes/cmake.bbclass | 23 ++++++++++++++++++-----
>>>> =C2=A0 1 file changed, 18 insertions(+), 5 deletions(-)
>>> This may give a speed boost for some cases but it does come at a
>>> potential risk of determinism issues.
>>>
>>> I appreciate you've made it configurable but that actually further
>>> concerns me as we now have two code paths which potentially both have
>>> to be tested.
>>>
>>> Is this change really worth it?
>>>
>>> Cheers,
>>>
>>> Richard
>>
>>
>> For us, the benefit is beyond question - on our proprietary C++=20
>> component, the compile from scratch after a configure is punishing,=20
>> 10s of minutes per MACHINE.
>>
>> We are counting on binary reproducibility to flush out any=20
>> determinism issues with the CMake code, that is, we will be comparing=20
>> our incremental builds with our clean builds. Note also that we are=20
>> deleting all the generated CMake artefacts, but leaving the object=20
>> files behind. CMake will force a complete rebuild should there be any=20
>> change in the CFLAGS and friends.
>
> Douglas,
>
> What workflow are you trying to optimize?
>
> If you're strictly changing existing source files
> then you shouldn't need to run configure again so I'm confused.
>
> Also, have you tried using ccache as per:
> =C2=A0=C2=A0 d014c8c11f cmake.bbclass: Make it work with ccache
> and if so why doesn't that work for you?
>
> Thanks,
> ../Randy


We are not only changing existing source files, we routinely add or=20
rename files or entire directories. This is a current product, very much=20
under active development. You're absolutely right though, we should=20
rarely need to reconfigure, indeed a compile (normal behaviour under=20
externalsrc) will cause CMake to notice (under the bonnet) that it needs=20
to rebuild_cache, which is all we need.

The problem is that reconfiguration happens quite frequently for other=20
reasons, notably changes in any library that our proprietary components=20
depend on (some of them also proprietary), or non-whitelisted changes in=20
OE variables or functions.

We use icecc, which gives similar performance to ccache, it's quite=20
impressive. I cheerfully concede that we could use ccache to reduce the=20
load on our icecc network, and for a further marginal improvement. There=20
is however a great deal of linking to be done, and regrettably our=20
non-trivial code base might have less than ideal build dependencies=20
within it (within the cmake code), leading to less than perfect=20
parallelism in compilation and linking ... Unnecessary rebuilding from=20
scratch imposes an unwelcome burden on our developers, and quite some=20
muttering in the ranks. I wish to feel safe making my cup of coffee.

None of this is a problem if we don't delete object files at=20
configure-time. I see no benefit from doing so. Our proposed patch=20
deletes only CMake artefacts, which should be adequate in all cases.

Hope this clarifies things,
Douglas.


