Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QbIHB-0002td-Bb
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Jun 2011 22:19:21 +0200
Received: by pwi1 with SMTP id 1so3378203pwi.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2011 13:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=wToSAri/TZekh238CiP7sapgLpKriFTKIWRok+XtyIM=;
	b=QN943YMY/vrGye7bC9q3hgWwm9nPWEMIxP6QNO+i6ayUbppWKO7UJbX3yW91zC4y3y
	ypEckrOAfhOoWaYdB5SYY6s25iev9PoVzGCDjFoRATltQT2jRG3ZmqxWsu7JTUqmTrZM
	6tBSo3h3sSVbll2qBKm/uSpFF+spExfpOofTc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=j/Qe7MpQKqMYxKfgMf7P/6xckMAsB4duiC4F7k0Wu0r8JkgRvdL9hdiVKkk7NditIK
	oOVIIJNDm9843jrD0aDXrajKopMZ2I6bfMoDEnE62GsF2+Zuwo4ePmB0SBVlx0/ZiqS7
	I2wm8TXQPKldPErfZZ+gDShBPFQtncFUDlsGo=
Received: by 10.68.36.234 with SMTP id t10mr3384961pbj.361.1309205740179; Mon,
	27 Jun 2011 13:15:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.105 with HTTP; Mon, 27 Jun 2011 13:15:10 -0700 (PDT)
In-Reply-To: <1309170035.21613.289.camel@phil-desktop>
References: <CFB391EB-D84F-4616-887D-DAFAB036EA42@dominion.thruhere.net>
	<4E0699D1.9090308@gmail.com> <4E074ABB.80405@gmail.com>
	<48356C52-61A1-42BE-92AA-704FB136D8A3@dominion.thruhere.net>
	<1309167774.21613.264.camel@phil-desktop>
	<8815E10D-6790-48AD-811D-5BE977A17380@dominion.thruhere.net>
	<1309170035.21613.289.camel@phil-desktop>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Jun 2011 13:15:10 -0700
Message-ID: <BANLkTimbUn+g6wsnH6661GWT3kbg_WxTLw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: gcc-cross-kernel problems
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
X-List-Received-Date: Mon, 27 Jun 2011 20:19:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 27, 2011 at 3:20 AM, Phil Blundell <pb@pbcl.net> wrote:
> On Mon, 2011-06-27 at 12:07 +0200, Koen Kooi wrote:
>> In the first one only cc1 and collect are present. What would be the bes=
t way to fix this?
>
> It seems that gcc-package-cross.inc is doing this by steam for the
> regular cross compiler. =C2=A0See this code from do_install():
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0# Insert symlinks into libexec so when tools w=
ithout a prefix are searched for, the correct ones are
> =C2=A0 =C2=A0 =C2=A0 =C2=A0# found. These need to be relative paths so th=
ey work in different locations.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0dest=3D${D}${libexecdir}/gcc/${TARGET_SYS}/${B=
INV}/
> =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d $dest
> =C2=A0 =C2=A0 =C2=A0 =C2=A0for t in ar as ld nm objcopy objdump ranlib st=
rip g77 gcc cpp gfortran; do
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${BINRELPAT=
H}/${TARGET_PREFIX}$t $dest$t
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${BINRELPAT=
H}/${TARGET_PREFIX}$t ${dest}${TARGET_PREFIX}$t
> =C2=A0 =C2=A0 =C2=A0 =C2=A0done
>
> So I guess you could copy that into gcc-cross-kernel or arrange for the
> two recipes to share more stuff. =C2=A0Really, the only difference betwee=
n
> gcc-cross-kernel and regular gcc-cross should be that the former doesn't
> install itself as ${TARGET_SYS}-gcc in the sysroot bindir.

you need to include gcc-package-cross.inc using

require gcc-package-cross.inc

in the newly added gcc-cross-kernel_csl-arm-2007q3.bb
and all should be set.

>
> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


