Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PzCFm-00048k-Fe
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Mar 2011 19:12:26 +0100
Received: by wyb40 with SMTP id 40so4444778wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2011 11:10:45 -0700 (PDT)
Received: by 10.216.221.72 with SMTP id q50mr10810733wep.99.1300126245294;
	Mon, 14 Mar 2011 11:10:45 -0700 (PDT)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id l5sm3972025wej.8.2011.03.14.11.10.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 Mar 2011 11:10:44 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4D750834.2060803@linux.intel.com>
Date: Mon, 14 Mar 2011 19:10:43 +0100
Message-Id: <4A916656-9670-438B-AA5E-21309243FBA1@dominion.thruhere.net>
References: <cover.1299267630.git.sgw@linux.intel.com>	<e807fc977770cb64a217768672c18437ea8f3057.1299267630.git.sgw@linux.intel.com>	<A53A0FEC-74B3-483C-916C-EB87748A1AC8@dominion.thruhere.net>	<4D715D30.3030608@linux.intel.com>	<EEFD338A-726B-4502-B995-442E9AB37B9D@dominion.thruhere.net>	<8BD56976-D3F5-41F0-8CD6-9CF4B3CBB6C1@dominion.thruhere.net>
	<4D7173CE.2090104@linux.intel.com>
	<4D750834.2060803@linux.intel.com>
To: Darren Hart <dvhart@linux.intel.com>
X-Mailer: Apple Mail (2.1082)
Cc: poky <poky@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] [PATCH 04/13] module: build hostprogs for each module
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
X-List-Received-Date: Mon, 14 Mar 2011 18:12:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 7 mrt 2011, om 17:30 heeft Darren Hart het volgende geschreven:

> On 03/04/2011 03:20 PM, Darren Hart wrote:
>> On 03/04/2011 02:30 PM, Koen Kooi wrote:
>>>=20
>>> Op 4 mrt 2011, om 23:28 heeft Koen Kooi het volgende geschreven:
>>>=20
>>>>=20
>>>> Op 4 mrt 2011, om 22:44 heeft Darren Hart het volgende geschreven:
>>>>=20
>>>>> On 03/04/2011 12:04 PM, Koen Kooi wrote:
>>>>>>=20
>>>>>> Op 4 mrt 2011, om 20:42 heeft Saul Wold het volgende geschreven:
>>>>>>=20
>>>>>>> From: Darren Hart<dvhart@linux.intel.com>
>>>>>>>=20
>>>>>>> This fixes [BUGID #241]
>>>>>>>=20
>>>>>>> The kernel hostprogs are built for the host architecture. They
>>>>>>> should not be
>>>>>>> deployed to the target, and they should not be included in an
>>>>>>> sstate package
>>>>>>> which might get reused on a host of a different architecture.
>>>>>>>=20
>>>>>>> As we don't build many out-of-tree modules, this patch takes the
>>>>>>> approach of
>>>>>>> building the hostprogs as part of the module compile process =
with a
>>>>>>> do_compile_prepend() routine in module.bbclass.
>>>>>>>=20
>>>>>>> We don't have to clean the hostprogs as modules depend on the
>>>>>>> kernel being
>>>>>>> populate_staging, so its done with the staging directory by the
>>>>>>> time we run.
>>>>>>>=20
>>>>>>> Signed-off-by: Darren Hart<dvhart@linux.intel.com>
>>>>>>> CC: Gary Thomas<gary@mlbassoc.com>
>>>>>>> ---
>>>>>>> meta/classes/module.bbclass | 12 +++++++++++-
>>>>>>> 1 files changed, 11 insertions(+), 1 deletions(-)
>>>>>>>=20
>>>>>>> diff --git a/meta/classes/module.bbclass
>>>>>>> b/meta/classes/module.bbclass
>>>>>>> index d16d462..bbceaf7 100644
>>>>>>> --- a/meta/classes/module.bbclass
>>>>>>> +++ b/meta/classes/module.bbclass
>>>>>>> @@ -3,6 +3,13 @@ DEPENDS +=3D "virtual/kernel"
>>>>>>>=20
>>>>>>> inherit module-base
>>>>>>>=20
>>>>>>> +# Ensure the hostprogs are available for module compilation
>>>>>>> +module_do_compile_prepend() {
>>>>>>> + unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
>>>>>>> + oe_runmake CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" =
AR=3D"${KERNEL_AR}" \
>>>>>>> + -C ${STAGING_KERNEL_DIR} scripts
>>>>>>> +}
>>>>>>> +
>>>>>>> module_do_compile() {
>>>>>>> unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
>>>>>>> oe_runmake KERNEL_PATH=3D${STAGING_KERNEL_DIR} \
>>>>>>> @@ -15,7 +22,10 @@ module_do_compile() {
>>>>>>=20
>>>>>> Why not put it in do_compile itself?
>>>>>=20
>>>>> My rationale was that a module recipe may override do_compile for
>>>>> one reason or another, but they will still need the hostprogs =
which
>>>>> we stripped in kernel.bbclass. This way, even if they override
>>>>> do_compile, the _prepend will still get run and prepare the
>>>>> hostprogs.
>>>>=20
>>>> Are you sure that actually works? AIUI bitbake will fold the =
compile
>>>> and prepend into one when you try to override it.
>>>=20
>>> What I actually meant to say is: If you need to prepend it to
>>> do_compile, even when someone will override it, use addtask to =
insert
>>> it between configure and compile. That makes the intention a lot
>>> clearer and isn't depending on faulty bitbake behaviour.
>>=20
>> You could be right, I'm not terribly familiar with how the =
"inheritance"
>> model works. It seems to me the "addtask" method would work =
regardless
>> as you suggest, and I have no objection to taking that route.
>>=20
>> Richard, do you have a preference? Can you clear up the inheritance
>> question?
>>=20
>=20
> Had a chat with Richard. His suggestion was to use a new function, ie =
do_hostprogs, which do_compile() calls. If a recipe overrides =
do_compile() it can call do_hostprogs() or manage it on its own. I'll do =
some testing and send out a follow-on patch.

Any news on this? I just hit the issue:

|   CC [M]  =
/OE/tentacle/build/tmp-angstrom_2010_x/work/beagleboard-angstrom-linux-gnu=
eabi/ti-dsplink-1_1_65_00_03-r99i/dsplink_linux_1_65_00_03/dsplink/gpp/src=
/../../gpp/src/arch/CFG_map.o
| /bin/sh: scripts/basic/fixdep: No such file or directory


regards,

Koen=


