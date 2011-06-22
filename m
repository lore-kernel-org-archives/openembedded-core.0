Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.parkin@gmail.com>) id 1QZNJ2-000098-6e
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 15:17:20 +0200
Received: by vws2 with SMTP id 2so631716vws.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 06:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=nZVRCeoC+pgXyfpin+/tu7IBzNbSDrNmpDpi7jKi9X0=;
	b=jvm+gDBPr/qqLxN809KtVX80Rm4+RRWaxsVwabf0VA+ekZRnDArkRvloKuQ+fs/P75
	pGJIb+FXVTxRtRGPdp5zVrO+vBZw4+zG1zwmtuKw9UGU67XmYzi6Omkr60iLY1zTQYUM
	8s6rlWZGM/1DV8Nvo1Trb0O9Ijn+m1NLieXJg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=AvcmGH+HhUETbyHqKucVwvQbj7DtlLhDREs7s1+WOlrIqgMgdhwqrXCOmndkcD2UCS
	AxO+qoN8rHjL1wWvA5KZZID9B7OXq78bVoHOh/h4+LkdiRMfMesJ6imbgsjV34GfLLUq
	y9G0eqyMrHZzbphkADOYUXeWqAljReFiBRuYk=
MIME-Version: 1.0
Received: by 10.220.65.232 with SMTP id k40mr54262vci.71.1308748425203; Wed,
	22 Jun 2011 06:13:45 -0700 (PDT)
Received: by 10.220.182.11 with HTTP; Wed, 22 Jun 2011 06:13:45 -0700 (PDT)
In-Reply-To: <1308674994.20015.33.camel@rex>
References: <20110621140419.GA8589@raven.pace.internal>
	<1308668047.21613.30.camel@phil-desktop>
	<1308674994.20015.33.camel@rex>
Date: Wed, 22 Jun 2011 14:13:45 +0100
Message-ID: <BANLkTi=JM-tWmJ7me+efV3gzdqWp37SczQ@mail.gmail.com>
From: Tom Parkin <tom.parkin@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Using TCLIBC = "uclibc" in oe-core
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
X-List-Received-Date: Wed, 22 Jun 2011 13:17:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Thanks for the comments, everyone.

I think the balance of what's been said suggests we'd want this change
in oe-core.  The question of whether doing special "USE_NLS" hackery
for glib-2.0-native is a good design or not is a somewhat more open
issue...

Assuming this change is good, what would I need to do to formally
submit a patch?  Is there a howto for oe-core patch submission that I
can refer to?

Thanks,
Tom

On 21 June 2011 17:49, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2011-06-21 at 15:54 +0100, Phil Blundell wrote:
>> On Tue, 2011-06-21 at 15:04 +0100, Tom Parkin wrote:
>> > The attached patch allows me to (at least) assemble the bitbake task
>> > list when TCLIBC =3D "uclibc". =A0I'm not sure whether this is the cor=
rect
>> > approach, though.
>>
>> Do you know why glib-2.0.inc is doing this crazy thing in the first
>> place? =A0If we're going to have code in the config files to effectively
>> make it think that USE_NLS is always on, maybe that check should just be
>> removed.
>>
>> You're right though that the current line in tclibc-uclibc.inc is
>> clearly just wrong and should be either fixed or deleted.
>
> It does appear to work due to code in base.bbclass which does:
>
> =A0 =A0use_nls =3D bb.data.getVar('USE_NLS_%s' % pn, d, 1)
> =A0 =A0if use_nls !=3D None:
> =A0 =A0 =A0 =A0bb.data.setVar('USE_NLS', use_nls, d)
>
> where this code predates the use of pn-${PN} in overrides.
>
> Nowadays it makes sense just to use the pn- override and we should drop
> this legacy stuff IMO.
>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
Tom Parkin
www.thesecretdogproject.com
Morality, like art, means drawing a line someplace /Wilde/


