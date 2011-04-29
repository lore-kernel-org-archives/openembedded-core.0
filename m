Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.lippautz@gmail.com>) id 1QFmDv-0005Vu-ET
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Apr 2011 13:51:03 +0200
Received: by fxm19 with SMTP id 19so2829237fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Apr 2011 04:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=WS4y/u0mUNiEsgfiVdRR8zGDxyY4RTTZ0PW31bNs6Y0=;
	b=DmjogV7VS2rw9oCTxIvujwHYneCBt/uMZ/1wkk/aN4rTbadYCpgLMpvMJwZK+6LB7r
	ir3fLbl07BJ2ivBL75mmc5mCjt5RjFcE9aXGEbiJAO2BCbHRoyE8+o618s1ESRk5KAPd
	eZvtHj33XQVmw28Ic7nt4UKlHZPAijxfcy2z0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=G6t/Yn5Kor7UKbSU6XWv73Eebr70ZRPym7wfpW5b/IVr7eTr82DVzrLxYPZFT3MKeC
	DHuqYEG/ONwtOjeTV5ZYAly3eHqqppQ8QqJQD1k6v2hu8O6y6o/xWkJxAZumFZgATnF8
	otImkArtJ7Z5kyd3mERZvoWweJk1FRnsUghTQ=
Received: by 10.223.43.145 with SMTP id w17mr13956fae.12.1304077710209; Fri,
	29 Apr 2011 04:48:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.119.4 with HTTP; Fri, 29 Apr 2011 04:48:10 -0700 (PDT)
In-Reply-To: <9AB9810D-F908-4477-888F-056039505DCF@dominion.thruhere.net>
References: <1304073898-12204-1-git-send-email-michael.lippautz@gmail.com>
	<9AB9810D-F908-4477-888F-056039505DCF@dominion.thruhere.net>
From: Michael Lippautz <michael.lippautz@gmail.com>
Date: Fri, 29 Apr 2011 13:48:10 +0200
Message-ID: <BANLkTik1anmE4n7fKMp4uV9ZSLK1Gx_C0g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH]] python: Unbreak Python third-party extensions
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
X-List-Received-Date: Fri, 29 Apr 2011 11:51:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/4/29 Koen Kooi <koen@dominion.thruhere.net>:
>
> Op 29 apr 2011, om 12:44 heeft Michael Lippautz het volgende geschreven:
>
>> This fixes compilation/linking of Python 3rd party extensions.
>>
>> ${STAGING_LIBDIR}/python<pyver>/config/Makefile needs the correct
>> INCDIR and LIBDIR settings to be used in cross compilation for the
>> target. 3rd party module use distutils.sysconfig which uses this
>> Makefile to create compiler/linker flags.
>>
>> Workflow:
>> 1) compile needs the staged/sysroot Makefile since it is needed
>> =A0 for compilation/linking
>> 2) install needs the unmodified Makefile to install files (i.e.
>> =A0 headers) into the right directores. (otherwise they would be
>> =A0 installed in ${D}/${STAGING_...}
>> 3) staging needs modified Makefile again
>> 4) packaging needs unmodified to make compilation on the target
>> =A0 possible
>
> Does any of the sysroot leak into the 3rd party extensions after this pat=
ch? Apart from that question, the patch looks good to me, although I needed=
 a cup of coffee to work out the flow.

Nothing leaks into the 3rd party extensions as far as I know. The
Makefile is used by distutils (i.e. distutils.sysconfig) to determine
the compiler settings.

In the case of a 3rd partyextension the flow is as follows:
* distutils.bbclass uses python-native + distutils-native to generate
the package
* distutils-native looks up the compiler settings via
distutils.sysconfig (-native) in
${STAGING_LIBDIR}/python<pyver>/config/Makefile
  (it is thus important that STAGING_LIBDIR is set by distutils.bbclass)
* 3rd party extension is compiled using the settings from this Makefile

The compilation on the target should still be possible (although I
didn't test it), because the target's Makefile is untouched.

The actual problem was that the targets Makefile did get staged and
the compiler and linker have been invoked with the targets libs, for
instance -L/usr/lib.

> regards,
>
> Koen

(I needed more than one coffee to figure out this flow)

-Michael


