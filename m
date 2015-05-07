Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3C9A16AC3E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 May 2015 12:04:37 +0000 (UTC)
Received: by wgic8 with SMTP id c8so14674597wgi.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 May 2015 05:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=SBXfJyzn74PvwV5iRbMNHW6Aw4dvJ5ytTCQPYBcKZRw=;
	b=M5oIFd7RFaDPNsCca+uBmGlDAPUVk1mtx7XxgTMKYgmqOW5KyjG1hXc7EBIvo3DQpS
	Yc0bdPBniNyQru0tYOwWZ+FDKg91cZG9SHQ2S1Zsta7atXgmeHABNYwQiw3RSZmzMqGi
	/fDPueTpzBXIIniOFDiwYzTXuAx1EPLp2IefZ0PTgbdAq/L45qKg3hDtnMH9kC8VvQaq
	xuvkzt6Fw1KFN7ecJjjmFl5qJ9C6QZABVW97krwzic33avi78zSp4A9lZTTla3lk5f3M
	cHiFaclwUoj5D80GOIMKRRiWprgYfNH80P2tXtDmlkC4o9Ym5536TSUlOFCY1apw2mHl
	hduA==
X-Received: by 10.180.73.180 with SMTP id m20mr6108789wiv.2.1431000277662;
	Thu, 07 May 2015 05:04:37 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id l6sm3127342wjz.4.2015.05.07.05.04.36
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 May 2015 05:04:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 7 May 2015 14:05:03 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20150507120503.GC2400@jama>
References: <f19629f2963bbec46e41a35626a11a64fc4a0c6d.1430895556.git.raj.khem@gmail.com>
	<4ffe99f25368e8b65df327fb9120ebca1c29e925.1430895556.git.raj.khem@gmail.com>
	<1430899916.8074.20.camel@linuxfoundation.org>
	<000AAC87-CE74-45DC-A006-D4704D8841D8@gmail.com>
	<1430981590.8074.127.camel@linuxfoundation.org>
	<1FEAAD81-09DB-43E7-B162-2567D3B5DD21@gmail.com>
	<1430994286.8074.129.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1430994286.8074.129.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/6] gcc-cross: Pass EXTRA_OECONF_GCC_FLOAT to configure
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 May 2015 12:04:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 07, 2015 at 11:24:46AM +0100, Richard Purdie wrote:
> On Thu, 2015-05-07 at 00:17 -0700, Khem Raj wrote:
> > > On May 6, 2015, at 11:53 PM, Richard Purdie <richard.purdie@linuxfoun=
dation.org> wrote:
> > > We do ship
> > > an environment file and in that file we have the options gcc needs to
> > > work, the sysroot, the other cflags and the float abi. Unless we go b=
ack
> > > to a setup of hardcoding the cflags into gcc and have a gcc per set of
> > > cflags, this isn't going to work since it solves part of the problem =
but
> > > not all of it.
> > >=20
> >=20
> > its also how the target libraries are compiled should match the ABI fla=
gs for target gcc
>=20
> Agreed, the other option is we have gcc pull the right config from the
> sysroot in question.

FWIW: when we were upgrading from Dylan to Dizzy one MACHINE with hf, we
noticed that few recipes weren't respecting CC variable and ended with
mixing soft and hard fp which was luckily detected in build time by
linker, so easy to fix.

Having at least QA check which will warn user that some compiled binary
has different float ABI then enabled in bitbake environment could be
useful. But I agree that it's recipe fault if it doesn't respect CC or
*FLAGS variables and we should fix it there instead of building
gcc-cross twice (if you have 2 arm MACHINEs with different float ABI).

Another option would be mfloat-abi poisoning if possible like we do with
default sysroot parameter, so that the usage of default value is
detected as soon as possible.

Regards,

>=20
> > > Our other alternative is to wrap gcc with a script (preferred in PATH)
> > > which ensures the right cflags are present. I'd obviously prefer not =
to
> > > do that but it is an option if we believe people can't cope with the
> > > environment script.
> > >=20
> >=20
> > Would solve the cross compile scenario but on-device scenario I am not =
sure
>=20
> On device is a completely different story. That gcc is target specific
> and *should* have the right flags set. That isn't what the patch in this
> thread is about though. On target gcc has always been target specific
> and will remain so.
>=20
> Cheers,
>=20
> Richard
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

