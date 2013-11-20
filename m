Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9FF5D6CC86
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 02:59:11 +0000 (UTC)
Received: by mail-pd0-f170.google.com with SMTP id g10so4663390pdj.15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 18:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=c7CCd1O7zNgBeyaj/e+50nfbp3+QGUiB5y/fD2866TY=;
	b=u61P57XFck4zUt9ZIjx6TvbgFQyLxqUtQoSWN6LuTZ8KBi9H6hgNQmVpvDzm6BcdYt
	6+LR5aWENV2L5tHtwDCMJ51M76NzeCWxkv9+GLZWuiF6uSWn1QNhRtG9SFKyRT2q9Sbh
	nCSDlHDYIGChVb14LItA/lDsmm/sLAXYAhp3VX/CdQEsNjMrU7Fi6KaXIOY112yzSclS
	UGFWfZon9+pMVuMKgAqPOD6GdrkQlRKuCTNaeXGMrOBd+LfLarOcv/tM3Bn0CIacezK1
	hwe54kTj4S5CuasAJj86FbTJeOAUdZxvB5TVW/ZhxBXCN1oA5PGNZIVBo8t1NE0/h9Z4
	pU4A==
X-Received: by 10.66.249.202 with SMTP id yw10mr18703383pac.111.1384916353340; 
	Tue, 19 Nov 2013 18:59:13 -0800 (PST)
Received: from kraj-sslvpn-nc.jnpr.net ([66.129.239.12])
	by mx.google.com with ESMTPSA id
	qw8sm33941352pbb.27.2013.11.19.18.59.11 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 19 Nov 2013 18:59:12 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.0 \(1822\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1384901152.16887.34.camel@ted>
Date: Tue, 19 Nov 2013 18:59:10 -0800
Message-Id: <BD0D1B35-0B17-418A-8119-DF6C169C092F@gmail.com>
References: <cover.1381266484.git.bruce.ashfield@windriver.com>
	<9f62e2e632692c5919a0de25a785d17d477a64b3.1381266484.git.bruce.ashfield@windriver.com>
	<20131119173725.GA13018@mcrowe.com>
	<1384883174.23724.116.camel@phil-desktop.brightsign>
	<CADkTA4Pd1pqS8wf-BbGRy2becWpQNtzx9V0cmrrEy9OOc9N+mg@mail.gmail.com>
	<CADkTA4PSaf3PQOAnpv_mt769WRgb6vj2TGM04T9=O++p+9_9jw@mail.gmail.com>
	<5E5EE01A-4572-41FA-88DC-9F08DA17B040@gmail.com>
	<1384900579.16887.28.camel@ted>
	<B5287BC8-6DCA-44B5-84FC-72E6E271A4F0@gmail.com>
	<1384901152.16887.34.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1822)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] kernel: restore scripts in the sysroot
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
X-List-Received-Date: Wed, 20 Nov 2013 02:59:12 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


On Nov 19, 2013, at 2:45 PM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2013-11-19 at 14:39 -0800, Khem Raj wrote:
>> On Nov 19, 2013, at 2:36 PM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>>=20
>>> On Tue, 2013-11-19 at 14:29 -0800, Khem Raj wrote:
>>>=20
>>>> Well reproducer case is that build from sstate but such that an =
external module needs to be rebuilt
>>>> if external module also comes from sstate then it all is fine. Its =
only when everything is coming from
>>>> sstate except this external module which needs to be rebuilt then =
you see this problem.
>>>>=20
>>>> now, I see the code in module-base.class
>>>>=20
>>>> #
>>>> # Ensure the hostprogs are available for module compilation. =
Modules that
>>>> # inherit this recipe and override do_compile() should be sure to =
call
>>>> # do_make_scripts() or ensure the scripts are built independently.
>>>> #
>>>> do_make_scripts() {
>>>>       unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS=20
>>>>       make CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" =
AR=3D"${KERNEL_AR}" \
>>>>                  -C ${STAGING_KERNEL_DIR} scripts
>>>> }
>>>>=20
>>>> so it expects that, do_make_scripts is explicitly called by =
external module recipes
>>>>=20
>>>> and my recipes did override module_do_compile task but not =
do_compile like below
>>>>=20
>>>> module_do_compile() {
>>>>       oe_runmake
>>>> }
>>>>=20
>>>> so, is comment wrong there should it say module_do_compile instead =
?
>>>>=20
>>>> will it work with sstate always ?
>>>>=20
>>>> it will be OK to revert it if thats the case.
>>>=20
>>> Did you inherit module-base or module? I think the wording applies =
to
>>> module and not module-base. I think the function used to be in =
module
>>> and was moved along with the comment which is now incorrect.
>>>=20
>>=20
>> inherit module=20
>=20
> So in that case there is:
>=20
> addtask make_scripts after do_patch before do_compile
> do_make_scripts[lockfiles] =3D "${TMPDIR}/kernel-scripts.lock"
> do_make_scripts[deptask] =3D =93do_populate_sysroot=94
>=20

yes I see.


> which forces the make_scripts task to run before compile. I don't see
> how that could therefore fail? :/
>=20
> Do you have a copy of the exact log?

Not anymore, it was sometime ago, the logs are unfortunately recycled.

> I'm wondering if this is another
> variant of the bitbake dependency bug I just tracked down
> =
(http://git.yoctoproject.org/cgit.cgi/poky-contrib/patch/?id=3D7b49d336c46=
72f3dfa78e1c3f1f5c7384264a118)
>=20

ah very likely, I think I will try this fix and revert the =
kernel.bbclass fix locally and see if I still am
able to reproduce this issue. In any case I think the kernel.bbclass may =
be abandoned since I now think it
was a wrong fix although it did fix the problem

> Cheers,
>=20
> Richard
>=20


