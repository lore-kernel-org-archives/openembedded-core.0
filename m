Received: from mail-ve0-f180.google.com ([209.85.128.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UXvYB-0004rK-7U
	for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 17:36:06 +0200
Received: by mail-ve0-f180.google.com with SMTP id pa12so600227veb.39
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 May 2013 08:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=Imp7yDdMD6fzi2WUMa+p3p5S4B5kXDBFjlEScalMyOk=;
	b=hybIF1UhB9682Wh8NH125/TE2B2QiFxXL1k9xbn33uIbh+roDoD1VhJHHttEZ7euhJ
	ElF7HvkZ21wRJsf4GnYHfmuTQVYHOGRfhQID7j4hk/j2nYGglChzF5mtGR71IjZ0WW+j
	picRC86y6Jx0VTm2k9fgBwUFgMH4ZFdabWS4voliFFzwDIN5q7u6ijysGX87w1e9N8w5
	8W9Ulxg9MIhfZkU2ziHEVhn3dEcaXsA0RY+mFsY8u3+ya8VUXAEHy+EqOL2vXWzImF8u
	yOyOT/sjfpE2G6ai03FvbezpKj/S7G5bI6BCAas9cT74O53gxZMqo/khrwW+C24G2JiH
	1ZxQ==
MIME-Version: 1.0
X-Received: by 10.52.69.109 with SMTP id d13mr1961416vdu.75.1367507889195;
	Thu, 02 May 2013 08:18:09 -0700 (PDT)
Received: by 10.52.139.33 with HTTP; Thu, 2 May 2013 08:18:09 -0700 (PDT)
In-Reply-To: <518281A4.6040900@windriver.com>
References: <CALbNGRTYCh8aB_JNpL7T-80PzybUN9KMJmZ=_GP6AfkrJmAccw@mail.gmail.com>
	<51826BBB.2090307@windriver.com> <1556536.BsQG791ajX@helios>
	<51827D4B.4070907@windriver.com>
	<CALbNGRRJfRF1qM2gm=SoSs=cjxqrFi7+7xp9SN9X=AMRPesPfw@mail.gmail.com>
	<518281A4.6040900@windriver.com>
Date: Thu, 2 May 2013 17:18:09 +0200
Message-ID: <CALbNGRS4FLKC+_k9iuEeoMCx0o=DsXM-uu1X7uahtcrp24R=oA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: useradd.bbclass question
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
X-List-Received-Date: Thu, 02 May 2013 15:36:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 2, 2013 at 5:09 PM, Mark Hatle <mark.hatle@windriver.com> wrote=
:
> On 5/2/13 9:55 AM, Andreas M=C3=BCller wrote:
>>
>> On Thu, May 2, 2013 at 4:50 PM, Mark Hatle <mark.hatle@windriver.com>
>> wrote:
>>>
>>> On 5/2/13 9:34 AM, Paul Eggleton wrote:
>>>>
>>>>
>>>> On Thursday 02 May 2013 08:35:55 Mark Hatle wrote:
>>>>>
>>>>>
>>>>> On 5/2/13 2:49 AM, Andreas M=C3=BCller wrote:
>>>>>>
>>>>>>
>>>>>> on one of my build machines useradd.bbclass seem to use the UID/GID =
of
>>>>>> build host. On other machines useradd works correct.
>>>>>>
>>>>>> I have the follwing in gdm:
>>>>>>
>>>>>> <snip>
>>>>>> do_install_append() {
>>>>>>
>>>>>>        ...
>>>>>>        chown -R gdm:gdm ${D}${localstatedir}/lib/gdm
>>>>>>        chmod 0750 ${D}${localstatedir}/lib/gdm
>>>>>>
>>>>>> }
>>>>>>
>>>>>> ...
>>>>>>
>>>>>> USERADD_PACKAGES =3D "${PN}"
>>>>>> USERADD_PARAM_${PN} =3D "--system --no-create-home --home
>>>>>> ${localstatedir}/lib/gdm --user-group gdm"
>>>>>> <snip/>
>>>
>>>
>>>
>>> I don't know how ipk and deb handle this.  But with the RPM system it
>>> captures the uname/gname (not uid/gid) and uses that when installing th=
e
>>> file(s).  This way the USERADD is processed before the install and the
>>> right
>>> value is used during the install.
>>>
>>> We may have a problem here where we need to also process the useradd
>>> -before- the do_install runs so that it's available for pseudo to use f=
or
>>> deb/ipk.  (But if deb/ipk capture uid/gid vs uname/gname..  unless we s=
et
>>> a
>>> static value we could still have a problem.)
>>
>> 1. gdm's log.do_install starts with so I assume the useradd stuff is
>> performed before do_install.
>>
>> | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common',
>> 'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi',
>> 'common']
>> | DEBUG: Executing shell function useradd_sysroot
>> | Running useradd commands...
>> | DEBUG: Shell function useradd_sysroot finished
>> | DEBUG: Executing shell function do_install
>
>
> Ahh yes, there it is.. I forgot as well.
>
> ok, so the obvious problems are resolved.  The only place I can suggest y=
ou
> start looking would be in the sysroot's etc/passwd and etc/group files.  =
If
> they are not correct -- then this indicates a failure in the easy case an=
d
> could lead to incorrect values.
These are OK and as mentioned above (cleansstate/rebuild) definitely
prepared before do_install.
>
> The other thing you can do is add debugging to your script and see what u=
id
> and such it's looking for.. Dumping out the environment variables that st=
art
> with 'PSEUDO_' may help.  I believe the value is PSEUDO_PASSWD for the pa=
th.
> If it's not set it falls back to the chroot (which you won't be in) and t=
hen
> back to the system file --- so if PSEUDO_PASSWD isn't set this could be a
> clue as to the fault.
>
I will check that - still strange to me is that I have different
behaviour for two hosts - both with gdm user/group.

Andreas


