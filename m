Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QoVYD-0000AQ-7r
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 09:07:33 +0200
Received: by wyg30 with SMTP id 30so390075wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Aug 2011 00:03:11 -0700 (PDT)
Received: by 10.227.172.73 with SMTP id k9mr4849542wbz.30.1312354991182;
	Wed, 03 Aug 2011 00:03:11 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fo2sm418325wbb.65.2011.08.03.00.03.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Aug 2011 00:03:10 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1312353556.3223.21.camel@lenovo.internal.reciva.com>
Date: Wed, 3 Aug 2011 09:03:08 +0200
Message-Id: <26D3BBA8-8A7F-4B0C-A235-8307DD46B3CE@dominion.thruhere.net>
References: <1312296431-18991-1-git-send-email-koen@dominion.thruhere.net>
	<C9D28EB1-CE86-42E9-9825-0A408698FD66@dominion.thruhere.net>
	<1312297317.4325.46.camel@phil-desktop>
	<F2D133A8-03CF-408A-A22B-CCC200E2AF18@dominion.thruhere.net>
	<1312353556.3223.21.camel@lenovo.internal.reciva.com>
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
X-List-Received-Date: Wed, 03 Aug 2011 07:07:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 aug. 2011, om 08:39 heeft Phil Blundell het volgende geschreven:

> On Wed, 2011-08-03 at 08:19 +0200, Koen Kooi wrote:
>> Op 2 aug. 2011, om 17:01 heeft Phil Blundell het volgende geschreven:
>>=20
>>> It does look a bit weird.  That code was introduced in 561d8754,
>>> ostensibly as a merger of the eglibc and glibc equivalents.  But, =
the
>>> original code from glibc-package.bbclass did:
>>>=20
>>>      def output_locale_binary_rdepends(name, pkgname, locale, =
encoding):
>>>              m =3D re.match("(.*)\.(.*)", name)
>>>              if m:
>>>                      glibc_name =3D "%s.%s" % (m.group(1), =
m.group(2).lower().replace("-",""))
>>>              else:
>>>                      glibc_name =3D name
>>>              bb.data.setVar('RDEPENDS_%s' % pkgname, =
legitimize_package_name('glibc-binary-localedata-%s' % glibc_name), d)
>>>=20
>>> ... i.e. it was using the "." separator both for splitting and =
joining,
>>> which seems reasonable.  But somehow when it showed up in
>>> libc-package.bbclass it had gotten transmogrified so that it split =
on
>>> "_" but joined with "." as you showed below.  That seems bogus to =
me.
>>=20
>> There is something funky going on if you use cross-localedef instead =
of on-target localedef and it looks like this is one of the reasons. I =
can respin the patch in different split formats if people want. But most =
of all I'd like to know what is going on :)
>=20
> Well, the original purpose of that code (when it split on dots) was to
> squash hyphens in encoding names.  That is, it transforms =
"en-US.utf-8"
> to "en-US.utf8", on the grounds that the dash isn't significant there
> and might be confusing with all the other dashes that go on in the
> package name.
>=20
> I don't know why cross-localdef would be doing anything different to =
the
> on-target one.  Can you expand on what exactly is the funky behaviour
> you see?

If you look at e.g. =
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/testlab/commit/?h=3D=
yocto&id=3D0fb50099

-locale_base_en_us -> eglibc_localedata_en_us;
-locale_base_en_us -> localedef;
-locale_base_en_us -> eglibc_charmap_utf_8;
-localedef -> libc6;
+locale_base_en_us -> eglibc_binary_localedata_en_us;

That shows that locale-base-foo drops some deps like the charmap when =
switching to binary locales. There's other breakage in that build =
clouding the diff, so I copied the relevant lines above.

regards,

Koen=


