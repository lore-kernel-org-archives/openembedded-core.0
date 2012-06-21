Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Shjmb-0003vy-Cx
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jun 2012 17:58:57 +0200
Received: by eekd49 with SMTP id d49so291747eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 08:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=UcE2t3PGXaMm1V6OqeXQYXG7x7lDlMOo1f1MWVbW2ZY=;
	b=BCyjFgLkO/MDgT9b2FCfJEfuo+zua75/xusYdKaiFhJPwditd2IIuu7BLBrtU4GWbS
	fyDn6y4kGeSZthCGVgodeH0Y2Ja6UyUBjw3yFYv8gLr/cl+SnKsBztKClfTYfTfV0IzA
	0mhfzYFmtZFj26xXEnNiL4IBsmjIsZRk2DGyzLolOwaFcqSWqLTC4EVC/Zm8bDNuCTIo
	dyCJ5Ov5miHZijm7QCugT0uLtIBCAF4fPnxZblq3EiruEZIOnp9F8tFTD43FsdXmFyAf
	SlnW0xxrNfQwE1tPEek/iFHpGlN5YXpZeAOjCVR6Cdp/+3xPbaFRrakAiL/BfI1PdMLX
	GOPQ==
Received: by 10.14.37.132 with SMTP id y4mr5708761eea.142.1340293691235; Thu,
	21 Jun 2012 08:48:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.219.71 with HTTP; Thu, 21 Jun 2012 08:47:41 -0700 (PDT)
In-Reply-To: <1340262834-27560-1-git-send-email-xin.ouyang@windriver.com>
References: <1340262834-27560-1-git-send-email-xin.ouyang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Jun 2012 08:47:41 -0700
Message-ID: <CAMKF1sp-vCv1iP3YAgAbEP4=2ruAme+-JnCqxBLXGW5yJ3oyZw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cpan.bbclass: Fix CCFLAGS.
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
X-List-Received-Date: Thu, 21 Jun 2012 15:58:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 21, 2012 at 12:13 AM,  <xin.ouyang@windriver.com> wrote:
> From: Xin Ouyang <Xin.Ouyang@windriver.com>
>
> We should not just replace CCFLAGS with CFLAGS while compiling, because
> this may cause run-time errors with perl's DynaLoader.pm.
>
> Tested on qemux86 with new libnet-libidn-perl bb recipe:

can you instead try the patch from

http://bugs.debian.org/cgi-bin/bugreport.cgi?msg=3D19;bug=3D628522

>
> root@qemux86:~# perl -e "use Net::LibIDN"
> Not a CODE reference at /usr/lib/perl/5.14.2//DynaLoader.pm line 213.
> END failed--call queue aborted at /usr/lib/perl/vendor_perl/5.14.2//Net/L=
ibIDN.pm line 213.
> Compilation failed in require at -e line 1.
> BEGIN failed--compilation aborted at -e line 1.
>
> Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
> ---
> =C2=A0meta/classes/cpan.bbclass | =C2=A0 =C2=A03 ++-
> =C2=A01 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/cpan.bbclass b/meta/classes/cpan.bbclass
> index 2e9432c..957a6e2 100644
> --- a/meta/classes/cpan.bbclass
> +++ b/meta/classes/cpan.bbclass
> @@ -26,13 +26,14 @@ cpan_do_configure () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0test -f $f2 || continue
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0sed -i -e "s:\(PERL_ARCHLIB =3D \).*:\1${PERL_ARCHLIB}:" \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e 's/perl.real/perl/' \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e "s/^\(CCFLAGS =3D.*\)/\1 ${CFLAGS}/" =
\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$f2
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done
> =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
> =C2=A0}
>
> =C2=A0cpan_do_compile () {
> - =C2=A0 =C2=A0 =C2=A0 oe_runmake PASTHRU_INC=3D"${CFLAGS}" CCFLAGS=3D"${=
CFLAGS}" LD=3D"${CCLD}"
> + =C2=A0 =C2=A0 =C2=A0 oe_runmake PASTHRU_INC=3D"${CFLAGS}" LD=3D"${CCLD}=
"
> =C2=A0}
>
> =C2=A0cpan_do_install () {
> --
> 1.7.5.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


