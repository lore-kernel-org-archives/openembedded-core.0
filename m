Return-Path: <prvs=79962867b=Mikko.Rapeli@bmw.de>
Received: from esa3.bmw.c3s2.iphmx.com (esa3.bmw.c3s2.iphmx.com
	[68.232.133.150])
	by mail.openembedded.org (Postfix) with ESMTP id 3F294793EB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 10:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1537872290; x=1569408290;
	h=from:to:subject:date:message-id:references:in-reply-to:
	content-id:content-transfer-encoding:mime-version;
	bh=jIhbqdoRm+uiiB6NPnGMW2WyopflsstmGZsx8k0VKnI=;
	b=RppvXqT++VeDFWKULIFDvbs7nuuIGGtdx3XeszA/xwEdSkDKbTSkMiyq
	ZrtkgLtVHH9oBhL96eY964YGSZ/Y5nOOAKBVDYpRODOLeyF2rxL03XtQ6
	DO0c3MCyLRwA6k5+HgKptUgthIobo2qyZzd2ilwJvhyewwJ6SToEeb6Po c=;
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
	esa3.bmw.c3s2.iphmx.com with ESMTP/TLS; 25 Sep 2018 12:44:48 +0200
Received: from esabb5.muc ([160.50.100.47])  by esagw6.muc with ESMTP/TLS;
	25 Sep 2018 12:44:48 +0200
Received: from smucm10l.bmwgroup.net (HELO smucm10l.europe.bmw.corp)
	([160.48.96.48])
	by esabb5.muc with ESMTP/TLS; 25 Sep 2018 12:44:47 +0200
Received: from smucm10m.europe.bmw.corp (160.48.96.49) by
	smucm10l.europe.bmw.corp
	(160.48.96.48) with Microsoft SMTP Server (TLS;
	Tue, 25 Sep 2018 12:44:47 +0200
Received: from smucm10m.europe.bmw.corp ([160.48.96.49]) by
	smucm10m.europe.bmw.corp ([160.48.96.49]) with mapi id 15.00.1367.000;
	Tue, 25 Sep 2018 12:44:47 +0200
From: <Mikko.Rapeli@bmw.de>
To: <openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH RFC] insane.bbclass: add buildpaths_cmake and
	buildpaths_pkgconfig checks
Thread-Index: AQHUVLqNn1xrO/EhU0K7WQoKbZd7dKUAro2A
Date: Tue, 25 Sep 2018 10:44:47 +0000
Message-ID: <20180925104443.GP9430@hiutale>
References: <1537871293-32494-1-git-send-email-mikko.rapeli@bmw.de>
In-Reply-To: <1537871293-32494-1-git-send-email-mikko.rapeli@bmw.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.43]
MIME-Version: 1.0
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
X-List-Received-Date: Tue, 25 Sep 2018 10:44:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5BADD4F8112819489E2ECAC12456D295@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 25, 2018 at 01:28:13PM +0300, Mikko Rapeli wrote:
> And enable them by default as ERROR_QA. Reason is that
> absolute build directory paths in CMake .cmake modules
> and in pkg-config .pc files cause recipe builds to escape
> their recipe specific sysroots and triggers hard to debug
> and timing sensitive build failures. It's better to fail
> early.
>=20
> A failure from sumo version of libical looks like:
>=20
> ERROR: libical-2.0.0-r0 do_package_qa: QA Issue: CMake module /work/i586-=
poky-linux/libical/2.0.0-r0/packages-split/libical-dev/usr/lib/cmake/LibIca=
l/LibIcalTargets-noconfig.cmake contains reference to tmpdir which causes b=
uild raceconditions between recipes [buildpaths_cmake]
> ERROR: libical-2.0.0-r0 do_package_qa: QA run found fatal errors. Please =
consider fixing them.
> ERROR: libical-2.0.0-r0 do_package_qa: Function failed: do_package_qa
> ERROR: Logfile of failure stored in: /home/builder/src/yocto/poky/build/t=
mp/work/i586-poky-linux/libical/2.0.0-r0/temp/log.do_package_qa.4934
> NOTE: recipe libical-2.0.0-r0: task do_package_qa: Failed
> ERROR: Task (/home/builder/src/yocto/poky/meta/recipes-support/libical/li=
bical_2.0.0.bb:do_package_qa) failed with exit code '1'
>=20
> For some reason libical from poky master branch is not affected.

The reason why master branch is not affected is:

commit 26cccb93059b8963651b7d17cea2ee95f52633b7
Author: Juro Bystricky <juro.bystricky@intel.com>
Date:   Tue Mar 20 15:36:36 2018 -0700

    libical-dev_2.0: improve reproducibility
   =20
    Remove build host references from distributed files.
   =20
    (From OE-Core rev: 20f2670e755bcbf90b2b6c08192c022fe7e7eaad)
   =20
    Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
    Signed-off-by: Ross Burton <ross.burton@intel.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-support/libical/libical_2.0.0.bb b/meta/recipes-s=
upport/libical/libical_2.0.0.
index dcc21cc..daa47ab 100644
--- a/meta/recipes-support/libical/libical_2.0.0.bb
+++ b/meta/recipes-support/libical/libical_2.0.0.bb
@@ -17,3 +17,10 @@ SRC_URI[sha256sum] =3D "654c11f759c19237be39f6ad401d917e=
5a05f36f1736385ed958e60cf2
 UPSTREAM_CHECK_URI =3D "https://github.com/libical/libical/releases"
=20
 inherit cmake pkgconfig
+
+do_install_append_class-target () {
+    # Remove build host references
+    sed -i \
+       -e 's,${STAGING_LIBDIR},${libdir},g' \
+       ${D}${libdir}/cmake/LibIcal/LibIcalTargets-noconfig.cmake
+}

Now I'm struggling horribly with the same problem in various custom
CMake modules, so how about doing that same STAGING_LIBDIR to libdir
switch for all CMake modules automatically in cmake.bbclass?

I tried to correctly fix the libical CMake files too with help from
#cmake, but eventually had to give up. libical has an embedded
FindICU.cmake module but it seems like the upstream FindICU.cmake ends
up producing the same absolute paths while it does fix some other
bugs, and of course introduces new ones like no longer providing
ICU_I18N_FOUND variable when i18n ICU module is found.

-Mikko=

