Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QbXIH-00040y-9J
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 14:21:29 +0200
Received: by wyg30 with SMTP id 30so115324wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 05:17:45 -0700 (PDT)
Received: by 10.216.50.2 with SMTP id y2mr3221770web.77.1309263464034;
	Tue, 28 Jun 2011 05:17:44 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id w8sm91906wec.0.2011.06.28.05.17.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Jun 2011 05:17:43 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1309259242.20015.237.camel@rex>
Date: Tue, 28 Jun 2011 14:17:37 +0200
Message-Id: <15DA3F00-905F-4370-85D5-5038CD5D9ED2@dominion.thruhere.net>
References: <cover.1309163663.git.dongxiao.xu@intel.com>
	<cdd1860f64f84b58d18d1c6bed1805456d8d3e2e.1309163663.git.dongxiao.xu@intel.com>
	<1309165102.21613.234.camel@phil-desktop>
	<D5AB6E638E5A3E4B8F4406B113A5A19A12D6ADBBD3@shsmsx501.ccr.corp.intel.com>
	<1309252054.21613.329.camel@phil-desktop>
	<1309259242.20015.237.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 1/1] libc-locale: split locale handling from libc recipe.
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
X-List-Received-Date: Tue, 28 Jun 2011 12:21:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 28 jun 2011, om 13:07 heeft Richard Purdie het volgende geschreven:

> On Tue, 2011-06-28 at 10:07 +0100, Phil Blundell wrote:
>> On Tue, 2011-06-28 at 08:51 +0800, Xu, Dongxiao wrote:
>>>> -----Original Message-----
>>>> From: openembedded-core-bounces@lists.openembedded.org
>>>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf =
Of
>>>> Phil Blundell
>>>> Sent: Monday, June 27, 2011 4:58 PM
>>>> To: Patches and discussions about the oe-core layer
>>>> Subject: Re: [OE-core] [PATCH 1/1] libc-locale: split locale =
handling from libc
>>>> recipe.
>>>>=20
>>>> On Mon, 2011-06-27 at 16:37 +0800, Dongxiao Xu wrote:
>>>>> -PACKAGES =3D "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} =
sln${PKGSUFFIX}
>>>> nscd${PKGSUFFIX} ldd${PKGSUFFIX} localedef${PKGSUFFIX} libcidn =
${PN}-utils
>>>> ${PN}-pic ${PN}-dev eglibc-doc eglibc-locale libmemusage
>>>> libsegfault${PKGSUFFIX} eglibc-extra-nss =
eglibc-thread-db${PKGSUFFIX}
>>>> eglibc-pcprofile libsotruss${PKGSUFFIX}"
>>>>> -
>>>>> -PACKAGES_DYNAMIC =3D " \
>>>>> -		    glibc-gconv-*${PKGSUFFIX} glibc-charmap-* =
glibc-localedata-*
>>>> glibc-binary-localedata-* \
>>>>> -		    eglibc-gconv-* eglibc-charmap-* eglibc-localedata-*
>>>> eglibc-binary-localedata-* \
>>>>> -		    locale-base-*${PKGSUFFIX}"
>>>>> +PACKAGES =3D "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} =
sln${PKGSUFFIX}
>>>> nscd${PKGSUFFIX} ldd${PKGSUFFIX} ${PN}-utils ${PN}-pic ${PN}-dev =
eglibc-doc
>>>> libcidn libmemusage libsegfault${PKGSUFFIX} eglibc-extra-nss
>>>> eglibc-thread-db${PKGSUFFIX} eglibc-pcprofile"
>>>>=20
>>>> You seem to have made a bunch of changes here that are not related =
to locales.
>>>> What are those about?
>>>=20
>>> They are locale related changes.
>>> Locale related stuffs in the above PACKAGES and PACKAGES_DYNAMIC are =
moved to eglibc-locale recipe.
>>=20
>> Is libsotruss${PKGSUFFIX} (for example) really a "locale related =
stuff"?
>> It's not obvious to me what the connection is.
>=20
> Dongxiao: What Phil is referring to here is that =
libsotruss${PKGSUFFIX}
> disappeared from PACKAGES and that also "${libdir}/audit/.debug"
> disappeared from FILES_${PN}-dbg.
>=20
> Specifically these changes came in as part of:
>=20
> =
http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3D77c2dd944db42e40cc8=
467e6bc5a175fed90c251
>=20
> which I don't think your patch accounted for.
>=20
> Since this patch has been around for a while and it otherwise looks
> good, I've fixed up these couple of issues and merged it though.

This breaks when using eglibc 2.12 :(=


