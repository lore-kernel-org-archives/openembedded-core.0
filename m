Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QwyN7-0000dW-9s
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 17:31:05 +0200
Received: by wyf19 with SMTP id 19so2682078wyf.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2011 08:26:16 -0700 (PDT)
Received: by 10.216.143.211 with SMTP id l61mr1981275wej.5.1314372376632;
	Fri, 26 Aug 2011 08:26:16 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fd4sm1388681wbb.30.2011.08.26.08.26.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 26 Aug 2011 08:26:15 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1314367938.19905.90.camel@phil-desktop>
Date: Fri, 26 Aug 2011 17:26:14 +0200
Message-Id: <EB5E7A93-679D-4108-8E6D-03D7E1865908@dominion.thruhere.net>
References: <1314210721-29941-1-git-send-email-koen@dominion.thruhere.net>
	<1314264296.19905.29.camel@phil-desktop>
	<1314284316.5939.196.camel@rex>
	<1314367938.19905.90.camel@phil-desktop>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH 1/2] libc-package bbclass: fix binary localedata dependency code
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
X-List-Received-Date: Fri, 26 Aug 2011 15:31:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 26 aug. 2011, om 16:12 heeft Phil Blundell het volgende geschreven:

> On Thu, 2011-08-25 at 07:58 -0700, Richard Purdie wrote:
>> On Thu, 2011-08-25 at 10:24 +0100, Phil Blundell wrote:
>>> On Wed, 2011-08-24 at 20:32 +0200, Koen Kooi wrote:
>>>> diff --git a/meta/classes/libc-package.bbclass =
b/meta/classes/libc-package.bbclass
>>>> index 0d5ce20..d3b33d6 100644
>>>> --- a/meta/classes/libc-package.bbclass
>>>> +++ b/meta/classes/libc-package.bbclass
>>>> @@ -243,7 +243,7 @@ python package_do_split_gconvs () {
>>>> 	def output_locale_binary_rdepends(name, pkgname, locale, =
encoding):
>>>> 		m =3D re.match("(.*)_(.*)", name)
>>>> 		if m:
>>>> -			libc_name =3D "%s.%s" % (m.group(1), =
m.group(2).lower().replace("-",""))
>>>> +			libc_name =3D "%s-%s" % (m.group(1), =
m.group(2).lower().replace("-",""))
>>>> 		else:
>>>> 			libc_name =3D name
>>>> 		bb.data.setVar('RDEPENDS_%s' % pkgname, =
legitimize_package_name('%s-binary-localedata-%s' \
>>>=20
>>> For what it's worth (probably not much), this is not quite the right
>>> fix.  Joining with "." was correct; it was the splitting on "_" that =
was
>>> wrong.  The right thing would be to put it back how it was before =
the
>>> glibc/eglibc merge commit, i.e. change the re to "(*.)\.(*.)" and =
leave
>>> the output pattern alone.  That ought to fix your problem and also =
allow
>>> the encoding to be correctly canonicalised.
>>=20
>> Can someone please send me the correct patch against master? :)
>=20
> I think the attached is what you need.  Koen, maybe you could confirm
> whether this does indeed fix your original problem.

I built some images before applying this patch and then:

bitbake -ccleansstate eglibc eglibc-locale
bitbake systemd-image

And that gives me =
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/testlab/commit/?h=3D=
yocto&id=3D9b2e08e0c4da4881ba8c83be39697a40a63b75fd

-locale_base_en_us -> eglibc_binary_localedata_en_us;
+locale_base_en_us -> eglibc_binary_localedata_en_u_;

So something regexp is being a bit too greedy by the looks of it.=


