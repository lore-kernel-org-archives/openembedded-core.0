Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Rn6Af-00051h-Ha
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 11:21:41 +0100
Received: by werf1 with SMTP id f1so1801235wer.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2012 02:13:57 -0800 (PST)
Received: by 10.216.136.194 with SMTP id w44mr3524641wei.46.1326795237889;
	Tue, 17 Jan 2012 02:13:57 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id gy6sm15860586wib.11.2012.01.17.02.13.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jan 2012 02:13:57 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAMKF1sq-cbZpPP3jxf1pUw_DaNGzY0QPqho4zmJN-Dnb9VqVPQ@mail.gmail.com>
Date: Tue, 17 Jan 2012 11:13:57 +0100
Message-Id: <1AF0367C-6192-4BC4-AB91-E100B4DF13E4@dominion.thruhere.net>
References: <cover.1326437644.git.xiaofeng.yan@windriver.com>
	<b2085de269fd8fc3bc551d922e68e24e42e2154a.1326437644.git.xiaofeng.yan@windriver.com>
	<4F13A8EF.5060001@linux.intel.com>
	<CAMKF1sq-cbZpPP3jxf1pUw_DaNGzY0QPqho4zmJN-Dnb9VqVPQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 3/3] pango.inc: add directory "/etc/pango"
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
X-List-Received-Date: Tue, 17 Jan 2012 10:21:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 17 jan. 2012, om 10:11 heeft Khem Raj het volgende geschreven:

> On Sun, Jan 15, 2012 at 8:34 PM, Saul Wold <sgw@linux.intel.com> =
wrote:
>> On 01/12/2012 11:06 PM, Xiaofeng Yan wrote:
>>>=20
>>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>>=20
>>> Command "pango-querymodules>  /etc/pango/pango.modules" can't work =
when \
>>> starting up yocto because of no directory "/etc/pango". It will =
cause \
>>> messy code when gtk-demo running.
>>>=20
>>> [YOCTO #1674]
>>>=20
>>> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>> ---
>>>  meta/recipes-graphics/pango/pango.inc |    7 ++++++-
>>>  1 files changed, 6 insertions(+), 1 deletions(-)
>>>=20
>>> diff --git a/meta/recipes-graphics/pango/pango.inc
>>> b/meta/recipes-graphics/pango/pango.inc
>>> index b428b9d..06db327 100644
>>> --- a/meta/recipes-graphics/pango/pango.inc
>>> +++ b/meta/recipes-graphics/pango/pango.inc
>>> @@ -46,6 +46,11 @@ fi
>>>=20
>>>  }
>>>=20
>>> +# Command "pango-querymodules>  /etc/pango/pango.modules" needs =
this
>>> directory.
>>> +do_install_prepend() {
>>> +       install -d ${D}/${sysconfdir}/pango
>>> +}
>>> +
>>>  python populate_packages_prepend () {
>>>        prologue =3D d.getVar("postinst_prologue", 1)
>>>=20
>>> @@ -54,6 +59,6 @@ python populate_packages_prepend () {
>>>        do_split_packages(d, modules_root, '^pango-(.*)\.so$',
>>> 'pango-module-%s', 'Pango module %s', prologue + =
'pango-querymodules>
>>>  /etc/pango/pango.modules')
>>>  }
>>>=20
>>> -FILES_${PN} =3D "/etc/pango/* ${bindir}/* =
${libdir}/libpango*${SOLIBS}"
>>> +FILES_${PN} +=3D "${bindir}/* ${libdir}/libpango*${SOLIBS}"
>>=20
>> This can actually be removed completed since the default for =
FILES_${PN}
>> includes bindir/* and libdir/lib*${SOLIBS}
>>=20
>> I fixed this up in my testing area.
>>=20
>=20
> Saul
>=20
> This seems wrong to me. Since now all the modules will also be bundled =
in $PN
> whereas you want them in pango-modules-* packages since
> populate_packages_prepend has nothing left to generate out modules
> packages so please reintroduce the FILES_${PN} as it was (note that it
> was overwriting the defaults
> and not appending to it.)

The original problem can also be solved by doing the mkdir in the =
postinst prologue=


