Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 04D197391A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 05:44:35 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so7112058wic.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 22:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=R/qiPmkHDirPEs1WvqintbU3M5ZGcxliIzmBwCXMLAY=;
	b=kIs3Y8O3eVR2ub6Dgz0gP+TgeZVnq3xmTC0RvWl8fNbtUFXHziPWMatHmR5hdpeiSU
	dmDmLDqnTeQD/THRGEHDnhBxcgT6SZmTvNEVlIEwMWqhTAa2yJdb5XZGJGTLUh41bjOL
	utCbi/GjKd27cATAonTJsJ0a/ArSwML1IHEgZkZx2pMHMKZsDsJPtPO2Ls+YX+6uyQAD
	sgIlll7HaO/VMN69mlk2HemxbaX4bxGKpgjDhi7oChmc9M/IImXRRJbrzYkd8xybm/4n
	6m6/fad1t1aWbydaYqk4ADO6pEMPo+2Wr3/NsQibWfoDxYWqiTmYwQV6iY6iQTBNke8V
	cgmw==
X-Received: by 10.194.22.8 with SMTP id z8mr27229568wje.43.1442900675072;
	Mon, 21 Sep 2015 22:44:35 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	pk7sm27553179wjb.2.2015.09.21.22.44.34
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Sep 2015 22:44:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 22 Sep 2015 07:44:40 +0200
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20150922054440.GB28765@jama>
References: <20150921190422.GA28765@jama>
	<1442867607-8913-1-git-send-email-Martin.Jansa@gmail.com>
	<CAJTo0La661H=yF-bsVZjBwhSeRCtjafK1EuvbTL41J4vcoBhDA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0La661H=yF-bsVZjBwhSeRCtjafK1EuvbTL41J4vcoBhDA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCHv2] cmake.bbclass, perf: don't re-create ${B}
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
X-List-Received-Date: Tue, 22 Sep 2015 05:44:38 -0000
X-Groupsio-MsgNum: 71409
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="R3G7APHDIzY6R/pk"
Content-Disposition: inline

--R3G7APHDIzY6R/pk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2015 at 09:55:56PM +0100, Burton, Ross wrote:
> On 21 September 2015 at 21:33, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
>=20
> > * otherwise there is race-condition between do_configure rm+mkdir and
> >   bitbake trying to use it as CWD for do_populate_lic task, which
> >   results in errors like this:
> >
>=20
> It took me a few minutes to understand this race:
>=20
> Task A executing perf:do_configure and deleting ${B}
> Task B finishing perf:do_populate_lic and so running the sstate generation
> logic and the functions listed in SSTATEPOSTINSTFUNCS, which get executed
> with the default cwd of ${B}.

Thanks for more detailed explanation, sorry if I wasn't clear on this
one in my previous e-mails.

> I'll note that autotools.bbclass also does rmdir/mkdir ${B} so I'm curious
> why you see it more in perf and cmake and not everything else.

perf for some reason shows this most often, most our internal components are
using cmake, that's probably cmake was easier to find in our logs, but
I didn't grep all of them, maybe there are similar exceptions in
autotools based components. I'll send v3 with autotools.bbclass fix as
well.

> Would a better long-term fix be to pass cwd=3D${WORKDIR} to exec_func in =
the
> sstate code to stop the functions being executed in ${B} (after vetting t=
he
> functions, obviously).  FWIW I'm the owner of the bug to stop bitbake
> knowing about ${B} which is leading to exactly this sort of problem.

Yes, I agree it would be better, but as you said, such change is too
late even for master branch and I need to fix this long-standing issue
even in fido and dizzy, so smaller, simpler change will be easier to get
backported.

My for cycle finished 469 iterations over night and no exception since
this fix:
OE @ ~/build/oe-core $ grep "ERROR: Task" log.perf.00*
log.perf.0003:ERROR: Task 7 (/OE/build/oe-core/openembedded-core/meta/recip=
es-kernel/perf/perf.bb, do_populate_lic) failed with exit code '1'
log.perf.0004:ERROR: Task 7 (/OE/build/oe-core/openembedded-core/meta/recip=
es-kernel/perf/perf.bb, do_populate_lic) failed with exit code '1'
log.perf.0031:ERROR: Task 7 (/OE/build/oe-core/openembedded-core/meta/recip=
es-kernel/perf/perf.bb, do_populate_lic) failed with exit code '1'
log.perf.0055:ERROR: Task 7 (/OE/build/oe-core/openembedded-core/meta/recip=
es-kernel/perf/perf.bb, do_populate_lic) failed with exit code '1'
log.perf.0062:ERROR: Task 7 (/OE/build/oe-core/openembedded-core/meta/recip=
es-kernel/perf/perf.bb, do_populate_lic) failed with exit code '1'

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--R3G7APHDIzY6R/pk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYA6scACgkQN1Ujt2V2gBxzBACfRz0L629asFyy4SMqEbTa4oF0
DD4AnRgDtbfopTKLg0PvutWydMN1yxN7
=2hvw
-----END PGP SIGNATURE-----

--R3G7APHDIzY6R/pk--
