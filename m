Return-Path: <prvs=79962867b=Mikko.Rapeli@bmw.de>
Received: from esa9.bmw.c3s2.iphmx.com (esa9.bmw.c3s2.iphmx.com
	[68.232.133.110])
	by mail.openembedded.org (Postfix) with ESMTP id 4B8E77458C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 11:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1537874512; x=1569410512;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=xKQKjAMvuPOsMAvWpkVcGxzDSMZNeQyRRO76FMdMbNY=;
	b=oRIywNa3s98HRpOFLTKyNQ9KP+X6xYIjrx4tlf7FGxEjzD4BYC8zxYt+
	OwJ+LglFsBsPQtcxu9SR16NL706042J4ep5wiebhoqEYP0Lau2SazhyqZ
	UdmyRfGkByv2LKeqvXqXAVMoR5lFekB83G+hju4zpwMcJs62UQnFlVVAy Y=;
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
	esa9.bmw.c3s2.iphmx.com with ESMTP/TLS; 25 Sep 2018 13:21:50 +0200
Received: from esabb3.muc ([160.50.100.30])  by esagw6.muc with ESMTP/TLS;
	25 Sep 2018 13:21:24 +0200
Received: from smucm10m.bmwgroup.net (HELO smucm10m.europe.bmw.corp)
	([160.48.96.49])
	by esabb3.muc with ESMTP/TLS; 25 Sep 2018 13:21:23 +0200
Received: from smucm10m.europe.bmw.corp (160.48.96.49) by
	smucm10m.europe.bmw.corp
	(160.48.96.49) with Microsoft SMTP Server (TLS;
	Tue, 25 Sep 2018 13:21:23 +0200
Received: from smucm10m.europe.bmw.corp ([160.48.96.49]) by
	smucm10m.europe.bmw.corp ([160.48.96.49]) with mapi id 15.00.1367.000;
	Tue, 25 Sep 2018 13:21:23 +0200
From: <Mikko.Rapeli@bmw.de>
To: <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH RFC] insane.bbclass: add buildpaths_cmake and
	buildpaths_pkgconfig checks
Thread-Index: AQHUVLqNn1xrO/EhU0K7WQoKbZd7dKUAro2AgAAGngCAAAOZgA==
Date: Tue, 25 Sep 2018 11:21:23 +0000
Message-ID: <20180925112117.GQ9430@hiutale>
References: <1537871293-32494-1-git-send-email-mikko.rapeli@bmw.de>
	<20180925104443.GP9430@hiutale>
	<576c5e5174123059cfa49e8cf647716497a35610.camel@linuxfoundation.org>
In-Reply-To: <576c5e5174123059cfa49e8cf647716497a35610.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.42]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH RFC] insane.bbclass: add buildpaths_cmake and buildpaths_pkgconfig checks
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
X-List-Received-Date: Tue, 25 Sep 2018 11:21:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5099CC978ABC3C40954A14285C999362@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 25, 2018 at 12:08:24PM +0100, Richard Purdie wrote:
> On Tue, 2018-09-25 at 10:44 +0000, Mikko.Rapeli@bmw.de wrote:
> > On Tue, Sep 25, 2018 at 01:28:13PM +0300, Mikko Rapeli wrote:
> > > And enable them by default as ERROR_QA. Reason is that
> > > absolute build directory paths in CMake .cmake modules
> > > and in pkg-config .pc files cause recipe builds to escape
> > > their recipe specific sysroots and triggers hard to debug
> > > and timing sensitive build failures. It's better to fail
> > > early.
> > >=20
> > > A failure from sumo version of libical looks like:
> > >=20
> > > ERROR: libical-2.0.0-r0 do_package_qa: QA Issue: CMake module
> > > /work/i586-poky-linux/libical/2.0.0-r0/packages-split/libical-
> > > dev/usr/lib/cmake/LibIcal/LibIcalTargets-noconfig.cmake contains
> > > reference to tmpdir which causes build raceconditions between
> > > recipes [buildpaths_cmake]
> > > ERROR: libical-2.0.0-r0 do_package_qa: QA run found fatal errors.
> > > Please consider fixing them.
> > > ERROR: libical-2.0.0-r0 do_package_qa: Function failed:
> > > do_package_qa
> > > ERROR: Logfile of failure stored in:
> > > /home/builder/src/yocto/poky/build/tmp/work/i586-poky-
> > > linux/libical/2.0.0-r0/temp/log.do_package_qa.4934
> > > NOTE: recipe libical-2.0.0-r0: task do_package_qa: Failed
> > > ERROR: Task (/home/builder/src/yocto/poky/meta/recipes-
> > > support/libical/libical_2.0.0.bb:do_package_qa) failed with exit
> > > code '1'
> > >=20
> > > For some reason libical from poky master branch is not affected.
> >=20
> > The reason why master branch is not affected is:
> >=20
> > commit 26cccb93059b8963651b7d17cea2ee95f52633b7
> > Author: Juro Bystricky <juro.bystricky@intel.com>
> > Date:   Tue Mar 20 15:36:36 2018 -0700
> >=20
> >     libical-dev_2.0: improve reproducibility
> >    =20
> >     Remove build host references from distributed files.
> >    =20
> >     (From OE-Core rev: 20f2670e755bcbf90b2b6c08192c022fe7e7eaad)
> >    =20
> >     Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> >     Signed-off-by: Ross Burton <ross.burton@intel.com>
> >     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
> > >
> >=20
> > diff --git a/meta/recipes-support/libical/libical_2.0.0.bb
> > b/meta/recipes-support/libical/libical_2.0.0.
> > index dcc21cc..daa47ab 100644
> > --- a/meta/recipes-support/libical/libical_2.0.0.bb
> > +++ b/meta/recipes-support/libical/libical_2.0.0.bb
> > @@ -17,3 +17,10 @@ SRC_URI[sha256sum] =3D
> > "654c11f759c19237be39f6ad401d917e5a05f36f1736385ed958e60cf2
> >  UPSTREAM_CHECK_URI =3D "https://github.com/libical/libical/releases"
> > =20
> >  inherit cmake pkgconfig
> > +
> > +do_install_append_class-target () {
> > +    # Remove build host references
> > +    sed -i \
> > +       -e 's,${STAGING_LIBDIR},${libdir},g' \
> > +       ${D}${libdir}/cmake/LibIcal/LibIcalTargets-noconfig.cmake
> > +}
> >=20
> > Now I'm struggling horribly with the same problem in various custom
> > CMake modules, so how about doing that same STAGING_LIBDIR to libdir
> > switch for all CMake modules automatically in cmake.bbclass?
> >=20
> > I tried to correctly fix the libical CMake files too with help from
> > #cmake, but eventually had to give up. libical has an embedded
> > FindICU.cmake module but it seems like the upstream FindICU.cmake
> > ends
> > up producing the same absolute paths while it does fix some other
> > bugs, and of course introduces new ones like no longer providing
> > ICU_I18N_FOUND variable when i18n ICU module is found.
>=20
> I suspect we need to talk to cmake upstream about fixing this properly
> but adding something in the class may be an option until a better
> upstream solution can be found.
>=20
> I am puzzled by the need to add a .pc file path check since I thought
> there was already a test for that in insane.bbclass?
>=20
> package_qa_check_staged maybe? "Check staged la and pc files for common
> problems like references to the work directory."

That check is not enabled by default. At least bash is producing a broken
bash.pc (and several other files like Makefile.in and bashbug) in sumo
with embedded absolute paths to build sysroot.

-Mikko=

