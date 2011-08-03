Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QoUry-0007fW-L6
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 08:23:54 +0200
Received: by wyg30 with SMTP id 30so370923wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Aug 2011 23:19:32 -0700 (PDT)
Received: by 10.227.195.197 with SMTP id ed5mr7980801wbb.104.1312352372478;
	Tue, 02 Aug 2011 23:19:32 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id b13sm405855wbh.7.2011.08.02.23.19.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 02 Aug 2011 23:19:31 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1312297317.4325.46.camel@phil-desktop>
Date: Wed, 3 Aug 2011 08:19:25 +0200
Message-Id: <F2D133A8-03CF-408A-A22B-CCC200E2AF18@dominion.thruhere.net>
References: <1312296431-18991-1-git-send-email-koen@dominion.thruhere.net>
	<C9D28EB1-CE86-42E9-9825-0A408698FD66@dominion.thruhere.net>
	<1312297317.4325.46.camel@phil-desktop>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH] libc-package bbclass: fix binary localedata dependency code
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
X-List-Received-Date: Wed, 03 Aug 2011 06:23:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 2 aug. 2011, om 17:01 heeft Phil Blundell het volgende geschreven:

> It does look a bit weird.  That code was introduced in 561d8754,
> ostensibly as a merger of the eglibc and glibc equivalents.  But, the
> original code from glibc-package.bbclass did:
>=20
>       def output_locale_binary_rdepends(name, pkgname, locale, =
encoding):
>               m =3D re.match("(.*)\.(.*)", name)
>               if m:
>                       glibc_name =3D "%s.%s" % (m.group(1), =
m.group(2).lower().replace("-",""))
>               else:
>                       glibc_name =3D name
>               bb.data.setVar('RDEPENDS_%s' % pkgname, =
legitimize_package_name('glibc-binary-localedata-%s' % glibc_name), d)
>=20
> ... i.e. it was using the "." separator both for splitting and =
joining,
> which seems reasonable.  But somehow when it showed up in
> libc-package.bbclass it had gotten transmogrified so that it split on
> "_" but joined with "." as you showed below.  That seems bogus to me.

There is something funky going on if you use cross-localedef instead of =
on-target localedef and it looks like this is one of the reasons. I can =
respin the patch in different split formats if people want. But most of =
all I'd like to know what is going on :)

regards,

Koen

>=20
> p.
>=20
> On Tue, 2011-08-02 at 16:55 +0200, Koen Kooi wrote:
>> The bug I was seeing was caused by something else, but I'd still like =
feedback on this patch to find out why the dot vs dash difference exists
>>=20
>> Op 2 aug. 2011, om 16:47 heeft Koen Kooi het volgende geschreven:
>>=20
>>> When using binary locales rootfs generation fails with:
>>>=20
>>> | Unknown package 'locale-base-en-us'.
>>> | Collected errors:
>>> |  * opkg_install_cmd: Cannot install package locale-base-en-us.
>>>=20
>>> This is due to:
>>>=20
>>> $ dpkg-deb -I ipk/armv7a/locale-base-en-us_2.12-r16_armv7a.ipk | =
grep Depends
>>> Depends: eglibc-binary-localedata-en.us
>>>=20
>>> Note the '.' seperator
>>>=20
>>> $ ls ipk/armv7a/ | grep binary-localedata-en | grep us
>>> eglibc-binary-localedata-en-us_2.12-r16_armv7a.ipk
>>>=20
>>> Note the '-' seperator vs the '.' in the locale-base packages.
>>>=20
>>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>>> ---
>>> meta/classes/libc-package.bbclass |    2 +-
>>> 1 files changed, 1 insertions(+), 1 deletions(-)
>>>=20
>>> diff --git a/meta/classes/libc-package.bbclass =
b/meta/classes/libc-package.bbclass
>>> index de57230..67d08c0 100644
>>> --- a/meta/classes/libc-package.bbclass
>>> +++ b/meta/classes/libc-package.bbclass
>>> @@ -243,7 +243,7 @@ python package_do_split_gconvs () {
>>> 	def output_locale_binary_rdepends(name, pkgname, locale, =
encoding):
>>> 		m =3D re.match("(.*)_(.*)", name)
>>> 		if m:
>>> -			libc_name =3D "%s.%s" % (m.group(1), =
m.group(2).lower().replace("-",""))
>>> +			libc_name =3D "%s-%s" % (m.group(1), =
m.group(2).lower().replace("-",""))
>>> 		else:
>>> 			libc_name =3D name
>>> 		bb.data.setVar('RDEPENDS_%s' % pkgname, =
legitimize_package_name('%s-binary-localedata-%s' \
>>> --=20
>>> 1.6.6.1
>>>=20
>>=20
>>=20
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



