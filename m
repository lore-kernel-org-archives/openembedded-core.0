Received: from mail-vb0-f46.google.com ([209.85.212.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UXvkm-0006Tl-6b
	for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 17:49:06 +0200
Received: by mail-vb0-f46.google.com with SMTP id 10so561618vbe.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 May 2013 08:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=asjfX5onMNqbJkqi9oJv8GyVk3E4k8i1+gFlqZ0yOeU=;
	b=DxfoB10NDSJNbqZ4QJp3oVMJW/yFYziOHJNGxPw915DErOxjOh0X0Z0qWshQcCRzsy
	QQt3kf8+u6rJpCdUB69BOiX/1x6qnpbJ1i2fTTdKWmOnC1Qs9oNlx8s1QM9T5KicCUaD
	VzX5RwuQf298nwnYGVIjhk/NnC7Z5CVxo7SGMSo8OABnwgrtcdMCKe9bi1V9XR73cH+t
	Epm64vNn+9k2V00/C1GNq72WHIF8d6OERdFH3nCaBtqm4NFTdOgvCOSFPCVznlECBzfq
	S7XZ3R7vfFhL2OY9J1sVddNYNVcM7Op4E8DtvCJvbvzUH6QJgBuYhISEm5hHLaGCWiXd
	cioA==
MIME-Version: 1.0
X-Received: by 10.52.69.109 with SMTP id d13mr1978813vdu.75.1367508670178;
	Thu, 02 May 2013 08:31:10 -0700 (PDT)
Received: by 10.52.139.33 with HTTP; Thu, 2 May 2013 08:31:10 -0700 (PDT)
In-Reply-To: <CALbNGRS4FLKC+_k9iuEeoMCx0o=DsXM-uu1X7uahtcrp24R=oA@mail.gmail.com>
References: <CALbNGRTYCh8aB_JNpL7T-80PzybUN9KMJmZ=_GP6AfkrJmAccw@mail.gmail.com>
	<51826BBB.2090307@windriver.com> <1556536.BsQG791ajX@helios>
	<51827D4B.4070907@windriver.com>
	<CALbNGRRJfRF1qM2gm=SoSs=cjxqrFi7+7xp9SN9X=AMRPesPfw@mail.gmail.com>
	<518281A4.6040900@windriver.com>
	<CALbNGRS4FLKC+_k9iuEeoMCx0o=DsXM-uu1X7uahtcrp24R=oA@mail.gmail.com>
Date: Thu, 2 May 2013 17:31:10 +0200
Message-ID: <CALbNGRRm15aBQXAuqcJDEsvQ2UNC-VKj8_brbGPHj-bqxTaSKw@mail.gmail.com>
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
X-List-Received-Date: Thu, 02 May 2013 15:49:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 2, 2013 at 5:18 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Thu, May 2, 2013 at 5:09 PM, Mark Hatle <mark.hatle@windriver.com> wro=
te:
>> On 5/2/13 9:55 AM, Andreas M=C3=BCller wrote:
>>>
>>> On Thu, May 2, 2013 at 4:50 PM, Mark Hatle <mark.hatle@windriver.com>
>>> wrote:
>>>>
>>>> On 5/2/13 9:34 AM, Paul Eggleton wrote:
>>>>>
>>>>>
>>>>> On Thursday 02 May 2013 08:35:55 Mark Hatle wrote:
>>>>>>
>>>>>>
>>>>>> On 5/2/13 2:49 AM, Andreas M=C3=BCller wrote:
>>>>>>>
>>>>>>>
>>>>>>> on one of my build machines useradd.bbclass seem to use the UID/GID=
 of
>>>>>>> build host. On other machines useradd works correct.
>>>>>>>
>>>>>>> I have the follwing in gdm:
>>>>>>>
>>>>>>> <snip>
>>>>>>> do_install_append() {
>>>>>>>
>>>>>>>        ...
>>>>>>>        chown -R gdm:gdm ${D}${localstatedir}/lib/gdm
>>>>>>>        chmod 0750 ${D}${localstatedir}/lib/gdm
>>>>>>>
>>>>>>> }
>>>>>>>
>>>>>>> ...
>>>>>>>
>>>>>>> USERADD_PACKAGES =3D "${PN}"
>>>>>>> USERADD_PARAM_${PN} =3D "--system --no-create-home --home
>>>>>>> ${localstatedir}/lib/gdm --user-group gdm"
>>>>>>> <snip/>
>>>>
>>>>
>>>>
>>>> I don't know how ipk and deb handle this.  But with the RPM system it
>>>> captures the uname/gname (not uid/gid) and uses that when installing t=
he
>>>> file(s).  This way the USERADD is processed before the install and the
>>>> right
>>>> value is used during the install.
>>>>
>>>> We may have a problem here where we need to also process the useradd
>>>> -before- the do_install runs so that it's available for pseudo to use =
for
>>>> deb/ipk.  (But if deb/ipk capture uid/gid vs uname/gname..  unless we =
set
>>>> a
>>>> static value we could still have a problem.)
>>>
>>> 1. gdm's log.do_install starts with so I assume the useradd stuff is
>>> performed before do_install.
>>>
>>> | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common',
>>> 'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi',
>>> 'common']
>>> | DEBUG: Executing shell function useradd_sysroot
>>> | Running useradd commands...
>>> | DEBUG: Shell function useradd_sysroot finished
>>> | DEBUG: Executing shell function do_install
>>
>>
>> Ahh yes, there it is.. I forgot as well.
>>
>> ok, so the obvious problems are resolved.  The only place I can suggest =
you
>> start looking would be in the sysroot's etc/passwd and etc/group files. =
 If
>> they are not correct -- then this indicates a failure in the easy case a=
nd
>> could lead to incorrect values.
> These are OK and as mentioned above (cleansstate/rebuild) definitely
> prepared before do_install.
>>
>> The other thing you can do is add debugging to your script and see what =
uid
>> and such it's looking for.. Dumping out the environment variables that s=
tart
>> with 'PSEUDO_' may help.  I believe the value is PSEUDO_PASSWD for the p=
ath.
>> If it's not set it falls back to the chroot (which you won't be in) and =
then
>> back to the system file --- so if PSEUDO_PASSWD isn't set this could be =
a
>> clue as to the fault.
[andreas@oe-core]$ bitbake -e gdm | grep ^PSEUDO_PASSWD
PSEUDO_PASSWD=3D"/home/andreas/tmp/oe-core-eglibc/sysroots/overo"
>>
> I will check that - still strange to me is that I have different
> behaviour for two hosts - both with gdm user/group.
>
> Andreas


