Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rongqing.Li@windriver.com>) id 1SygED-0003xg-U7
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 11:37:30 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q779PgAi024276
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 7 Aug 2012 02:25:42 -0700 (PDT)
Received: from [128.224.162.163] (128.224.162.163) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Tue, 7 Aug 2012 02:25:41 -0700
Message-ID: <5020DF14.9040205@windriver.com>
Date: Tue, 7 Aug 2012 17:25:40 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <501FBD86.3090705@windriver.com> <5020AED3.1020406@windriver.com>
	<1344325278.9756.196.camel@ted> <5020CB95.3010501@windriver.com>
	<1344330186.9756.210.camel@ted>
In-Reply-To: <1344330186.9756.210.camel@ted>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	q779PgAi024276
Cc: "Yang, Liezhi" <Liezhi.Yang@windriver.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Could we build tar-replacement firstly and not parallel if tar-replacement is needed to build
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
X-List-Received-Date: Tue, 07 Aug 2012 09:37:30 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable



On 2012=E5=B9=B408=E6=9C=8807=E6=97=A5 17:03, Richard Purdie wrote:
> On Tue, 2012-08-07 at 16:02 +0800, Rongqing Li wrote:
>>
>> On 2012=E5=B9=B408=E6=9C=8807=E6=97=A5 15:41, Richard Purdie wrote:
>>> On Tue, 2012-08-07 at 13:59 +0800, Rongqing Li wrote:
>>>> Paste a RFC PATCH
>>>>
>>>> [RFC PATCH 1/1] bitbake: compile tar-replacement firstly, and not pa=
rallel
>>>>
>>>> Compiling tar-replacement or not is decided by version of host tar,
>>>> if the host tar version is lower than 1.23, Compiling tar-replacemen=
t
>>>> is needed.
>>>>
>>>> When doing popoluate tar-replacement sysroot to write the tar to
>>>> sysroot, but writing is not finished. other packages probably
>>>> use the being written tar to unzip file, which will lead to failure
>>>> and report the below error:
>>>> "bitbake_build/tmp/sysroots/x86_64-linux/usr/bin/tar: Text file busy=
"
>>>>
>>>> Now we compile tar-replacement firstly and not parallel to ensure
>>>> that a being written tar command will not be used.
>>>>
>>>> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
>>>> ---
>>>>     scripts/bitbake |   14 +++++++++++++-
>>>>     1 files changed, 13 insertions(+), 1 deletions(-)
>>>>
>>>> diff --git a/scripts/bitbake b/scripts/bitbake
>>>> index 3772d82..eb6b144 100755
>>>> --- a/scripts/bitbake
>>>> +++ b/scripts/bitbake
>>>> @@ -134,7 +134,19 @@ if [ $buildpseudo -gt 0 ]; then
>>>>                 fi
>>>>             done
>>>>         done
>>>> -    bitbake pseudo-native $TARTARGET $additionalopts -c populate_sy=
sroot
>>>> +
>>>> +    if [ $needtar =3D "1" ]; then
>>>> +       NUM_THREAD_LINE=3D`grep -n "^\s*BB_NUMBER_THREADS" conf/loca=
l.conf
>>>> |awk -F':' '{print $1}'`
>>>> +	test -n "$NUM_THREAD_LINE" &&
>>>> +	sed -i ''"$NUM_THREAD_LINE"'s/^\s*BB_NUMBER_THREADS/#\0/g' conf/lo=
cal.conf
>>>> +
>>>> +	bitbake $TARTARGET -c populate_sysroot
>>>> +
>>>> +	test -n "$NUM_THREAD_LINE" &&
>>>> +	sed -i
>>>> ''"$NUM_THREAD_LINE"'s/^#\s*BB_NUMBER_THREADS/BB_NUMBER_THREADS/g'
>>>> conf/local.conf
>>>> +    fi
>>>
>>> We are *NOT* running sed over local.conf. What is the user used a
>>> different configuration file for example?
>>
>> I use the sed to disable NUM_THREAD_LINE in conf/local.conf if
>> NUM_THREAD_LINE has been enabled.
>>
>> After compile $TARTARGET, use the sed to enable NUM_THREAD_LINE
>> in conf/local.conf
>
> I understand what you did, I just don't want to do this. Its horrible
> and buggy.
>
>>> If you're just building tar-native, is there a parallel race possible=
?
>>> I'm not sure that there is?
>>
>> Even if I just build tar-native, I still have several packages which
>> are needed to building.
>>
>>
>> $bitbake tar-replacement-native -g
>>
>> $ cat pn-buildlist
>> autoconf-native
>> libtool-native
>> m4-native
>> gettext-minimal-native
>> tar-replacement-native
>> quilt-native
>> gnu-config-native
>> automake-native
>
> but tar-replacement-native will not build until all the above have
> executed their populate_sysroot tasks, correct?
>
> So I don't see a task that would run at the same time as
> tar-replacement:do_populate_sysroot which will be the last task to run?
>
> Cheers,
>
> Richard
>
>


You are right, seems I only need to build tar-replacement firstly, donot
need to disable the BB_NUMBER_THREADS.


-Roy



>

--=20
Best Reagrds,
Roy | RongQing Li




