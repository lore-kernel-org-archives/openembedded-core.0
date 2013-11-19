Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 2F3156CC8C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 22:39:26 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id hz1so5799283pad.26
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 14:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=S8DPrnAvaUDFzcDBD/9UbhQXH6MzGlJQFzpvc2/TYmo=;
	b=bGtK8yWvBAC1RDN90OEb4eXhREESg5RUKXqm/4yH+cviTkEk4q+XsWaO4f/Ma98UPY
	Ind2PHiU7syfDsKusdU5vFwCXAC9XE2SDTqv7BoKD4nBjcN0WwrMDVRdPy8/tXW9J7d7
	PGZsApZ5H3GUdN11Ef9uqJ6ZidWBaw7uJ17OMfjlxYgxNQ9HrN7q5Rvf6zRWAEjDPivu
	ZrR4d1V7gZ2JJBkU9fxgEniaAn7QFS6vLOEiQIlPB5iT0CmwNg/HBir+r/E4J9zpqQ8i
	LWfI2pfAUoeh9ADcZOvX1rTVpiB5sKWOwAgMZ7ZwS5zwonuIaSScowTQ7+66RgCphKvL
	veTg==
X-Received: by 10.66.226.46 with SMTP id rp14mr10358261pac.133.1384900768207; 
	Tue, 19 Nov 2013 14:39:28 -0800 (PST)
Received: from kraj-sslvpn-nc.jnpr.net ([66.129.239.12])
	by mx.google.com with ESMTPSA id
	hn5sm21880007pbb.25.2013.11.19.14.39.26 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 19 Nov 2013 14:39:26 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.0 \(1822\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1384900579.16887.28.camel@ted>
Date: Tue, 19 Nov 2013 14:39:25 -0800
Message-Id: <B5287BC8-6DCA-44B5-84FC-72E6E271A4F0@gmail.com>
References: <cover.1381266484.git.bruce.ashfield@windriver.com>
	<9f62e2e632692c5919a0de25a785d17d477a64b3.1381266484.git.bruce.ashfield@windriver.com>
	<20131119173725.GA13018@mcrowe.com>
	<1384883174.23724.116.camel@phil-desktop.brightsign>
	<CADkTA4Pd1pqS8wf-BbGRy2becWpQNtzx9V0cmrrEy9OOc9N+mg@mail.gmail.com>
	<CADkTA4PSaf3PQOAnpv_mt769WRgb6vj2TGM04T9=O++p+9_9jw@mail.gmail.com>
	<5E5EE01A-4572-41FA-88DC-9F08DA17B040@gmail.com>
	<1384900579.16887.28.camel@ted>
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
X-List-Received-Date: Tue, 19 Nov 2013 22:39:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Nov 19, 2013, at 2:36 PM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2013-11-19 at 14:29 -0800, Khem Raj wrote:
>=20
>> Well reproducer case is that build from sstate but such that an =
external module needs to be rebuilt
>> if external module also comes from sstate then it all is fine. Its =
only when everything is coming from
>> sstate except this external module which needs to be rebuilt then you =
see this problem.
>>=20
>> now, I see the code in module-base.class
>>=20
>> #
>> # Ensure the hostprogs are available for module compilation. Modules =
that
>> # inherit this recipe and override do_compile() should be sure to =
call
>> # do_make_scripts() or ensure the scripts are built independently.
>> #
>> do_make_scripts() {
>>        unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS=20
>>        make CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" AR=3D"${KERNEL_AR}"=
 \
>>                   -C ${STAGING_KERNEL_DIR} scripts
>> }
>>=20
>> so it expects that, do_make_scripts is explicitly called by external =
module recipes
>>=20
>> and my recipes did override module_do_compile task but not do_compile =
like below
>>=20
>> module_do_compile() {
>>        oe_runmake
>> }
>>=20
>> so, is comment wrong there should it say module_do_compile instead ?
>>=20
>> will it work with sstate always ?
>>=20
>> it will be OK to revert it if thats the case.
>=20
> Did you inherit module-base or module? I think the wording applies to
> module and not module-base. I think the function used to be in module
> and was moved along with the comment which is now incorrect.
>=20

inherit module=20


> Cheers,
>=20
> Richard
>=20
>=20


