Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1/IInxt4DiMIE8ukiSt2s85tMEjrSKZGE0=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QoHaL-0006SF-5F
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 18:12:49 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p72G8S5X015680;
	Tue, 2 Aug 2011 11:08:28 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <4E38201A.8080006@mentor.com>
Date: Tue, 2 Aug 2011 11:08:27 -0500
Message-Id: <2E0759C0-DEB5-4B29-9DD1-C991E3DBA98E@kernel.crashing.org>
References: <1312272881-15695-1-git-send-email-galak@kernel.crashing.org>	<1312298395.4325.53.camel@phil-desktop>	<4E381902.6050408@mentor.com>
	<12877E24-5764-42AA-B48C-6F90914DC709@kernel.crashing.org>
	<4E38201A.8080006@mentor.com>
To: Tom Rini <Tom_Rini@mentor.com>
X-Mailer: Apple Mail (2.1084)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] automake: Fix issue with tar configure	failing with large UID/GIDs
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
X-List-Received-Date: Tue, 02 Aug 2011 16:12:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 2, 2011, at 11:04 AM, Tom Rini wrote:

> On 08/02/2011 09:01 AM, Kumar Gala wrote:
>>=20
>> On Aug 2, 2011, at 10:34 AM, Tom Rini wrote:
>>=20
>>> On 08/02/2011 08:19 AM, Phil Blundell wrote:
>>>> On Tue, 2011-08-02 at 03:14 -0500, Kumar Gala wrote:
>>>>> +-_am_tools=3D'gnutar m4_if([$1], [ustar], [plaintar]) pax cpio =
none'
>>>>> ++_am_tools=3D'gnutar m4_if([$1], [ustar], [plaintar]) cpio pax =
none'
>>>>=20
>>>> Have you discussed that with upstream?  If not, are you confident =
that
>>>> preferring cpio will not simply mean that we are swapping one =
deficiency
>>>> for another?
>>>=20
>>> A bug was filed with upstream automake.  At issue is that pax does =
not
>>> fail gracefully when it cannot create ustar archives while cpio =
does.
>>>=20
>>>>> +Index: automake-1.11.1/Makefile.in
>>>>> =
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>> +--- automake-1.11.1.orig/Makefile.in
>>>>> ++++ automake-1.11.1/Makefile.in
>>>>> +@@ -44,7 +44,7 @@ am__aclocal_m4_deps =3D $(top_srcdir)/m4/a
>>>>> + 	$(top_srcdir)/m4/missing.m4 $(top_srcdir)/m4/mkdirp.m4 \
>>>>> + 	$(top_srcdir)/m4/options.m4 $(top_srcdir)/m4/runlog.m4 \
>>>>> + 	$(top_srcdir)/m4/sanity.m4 $(top_srcdir)/m4/strip.m4 \
>>>>> +-	$(top_srcdir)/m4/substnot.m4 $(top_srcdir)/m4/tar.m4 \
>>>>> ++	$(top_srcdir)/m4/substnot.m4 \
>>>>> + 	$(top_srcdir)/configure.ac
>>>>> + am__configure_deps =3D $(am__aclocal_m4_deps) =
$(CONFIGURE_DEPENDENCIES) \
>>>>> + 	$(ACLOCAL_M4)
>>>>=20
>>>> Can you explain why this hunk is necessary?
>>>=20
>>> That I don't recall.  Possibly some sort of re-gen hell I was trying =
/
>>> needing to avoid.
>>>=20
>>>>=20
>>>>> +do_configure () {
>>>>> +	touch ${S}/Makefile.in
>>>>> +	autotools_do_configure
>>>>> +}
>>>>=20
>>>> ... and this one?
>>>=20
>>> Didn't do that one.  Kumar? :)
>>=20
>> I think I pulled that from the SB3 change you made.
>=20
> Gah, you're right.  I think it was more "avoid re-gen" bits.

Tom,

Do you mind take a stab at updating this patch based on feedback as your =
far more familiar with that I am ;)

- k=


