Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1Se8zK-0001Fm-No
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 20:05:14 +0200
Received: from mail-lb0-f180.google.com ([209.85.217.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 11 Jun 2012 10:54:39 -0700
Received: by lbbgh12 with SMTP id gh12so2576327lbb.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2012 10:54:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=+wW8lGyzjeA3g8ihZwllns0gRZJ/9onEmDulkG/3GSY=;
	b=EJS+GlSz8bthqmWy8QP+ho14kKN1p8Ost9bi75TxIq6GHMdZJqT+cPMQ2YXQ1MGFvB
	DF+qEOePUjQigW/zt2dmPuiF5JVrozjoB1lbVwExa/S6sX/K3SUAazDKgjRJ+dYjwB0d
	XCjyxFEfxeKQ7EHzGR+L+aKmQZhgRMzJH8W6Vx/Gm6bbvJZhvBdT2ANiLNB72mbi1ezk
	wgfm/Ajm0kiFR3Ht2eqjSND9+FNKyysoNJBzSn6SjPF+OPVMLoYUa6l2QGVUiHNsmABp
	hEcy/Dayqw7ItVC00ToRmONojGNDyUl0X0P3Px2G8nBOPj5bXkvYBJFwvebHHgMPjuCC
	kC4Q==
MIME-Version: 1.0
Received: by 10.152.108.38 with SMTP id hh6mr17941112lab.28.1339437278092;
	Mon, 11 Jun 2012 10:54:38 -0700 (PDT)
Received: by 10.112.1.227 with HTTP; Mon, 11 Jun 2012 10:54:38 -0700 (PDT)
In-Reply-To: <1338450372-6802-1-git-send-email-xin.ouyang@windriver.com>
References: <1338450372-6802-1-git-send-email-xin.ouyang@windriver.com>
Date: Mon, 11 Jun 2012 10:54:38 -0700
Message-ID: <CAPhnLPDkE0D00GxUpv2+WXdcFP_e9biYNhO1TDO_ATuJPbCEhQ@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQn2gqaqDmCJykVQK42DVDHE85ebCKAE8pXBdGcMGY8k2RMFgbIcIGKpX7KkvTWEL4Hl1RC/
Subject: Re: [PATCH] cpan.bbclass: Fix config error while patches to Makefile.PL
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
X-List-Received-Date: Mon, 11 Jun 2012 18:05:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, May 31, 2012 at 12:46 AM,  <xin.ouyang@windriver.com> wrote:
> From: Xin Ouyang <Xin.Ouyang@windriver.com>
>
> If there is a patch to Makefile.PL, a Makefile.PL but no Makefile
> will be placed in ${B}/.pc/xxx.patch/ after do_patch.
> And no Makefile will be generated for *this* Makefile.PL.
> While do_configure, the original code tries to sed Makefiles
> matching with each Makefile.PL in {B}, so this would fail.
>
> Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
> ---
> =A0meta/classes/cpan.bbclass | =A0 =A01 +
> =A01 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/cpan.bbclass b/meta/classes/cpan.bbclass
> index 587e688..2e9432c 100644
> --- a/meta/classes/cpan.bbclass
> +++ b/meta/classes/cpan.bbclass
> @@ -23,6 +23,7 @@ cpan_do_configure () {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0# Use find since there can be a Makefile g=
enerated for each Makefile.PL
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for f in `find -name Makefile.PL`; do
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0f2=3D`echo $f | sed -e 's/=
.PL//'`
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 test -f $f2 || continue
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sed -i -e "s:\(PERL_ARCHLI=
B =3D \).*:\1${PERL_ARCHLIB}:" \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0-e 's/perl=
.real/perl/' \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0$f2
> --
> 1.7.9.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


Merged into OE-Core

Thanks

-b

--=20
Elizabeth Flanagan
Yocto Project
Build and Release


