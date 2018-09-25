Return-Path: <prvs=79962867b=Mikko.Rapeli@bmw.de>
Received: from esa2.bmw.c3s2.iphmx.com (esa2.bmw.c3s2.iphmx.com
	[68.232.133.169])
	by mail.openembedded.org (Postfix) with ESMTP id EB7C07953F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 17:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1537895482; x=1569431482;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=6b7AzbJpMxhi6BkAlIu3D1rJZy1Eggfo12ZPJ20PMh8=;
	b=AmgKsCJADqz+aplr6hn3+tqXYY60TegZ8PxE4WSn1cmLLLr+rn/767uH
	Beho80F5n3V/t1354K5PKZK7YaRlSSV/PrA9HHvweIgMkpFAsmedyfODR
	PyYd/5lbtrHDXL5XLEd3ZZ3cKME3QnF/2e0t02zXZZyuq3b3qZKPIAqSh 8=;
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
	esa2.bmw.c3s2.iphmx.com with ESMTP/TLS; 25 Sep 2018 19:11:21 +0200
Received: from esabb2.muc ([160.50.100.34])  by esagw3.muc with ESMTP/TLS;
	25 Sep 2018 19:11:20 +0200
Received: from smucm10l.bmwgroup.net (HELO smucm10l.europe.bmw.corp)
	([160.48.96.48])
	by esabb2.muc with ESMTP/TLS; 25 Sep 2018 19:11:20 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10l.europe.bmw.corp
	(160.48.96.48) with Microsoft SMTP Server (TLS;
	Tue, 25 Sep 2018 19:11:20 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1395.000;
	Tue, 25 Sep 2018 19:11:20 +0200
From: <Mikko.Rapeli@bmw.de>
To: <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH RFC] insane.bbclass: add buildpaths_cmake and
	buildpaths_pkgconfig checks
Thread-Index: AQHUVLqNn1xrO/EhU0K7WQoKbZd7dKUAro2AgAAGngCAAAOZgIAAQpmAgAAfM4A=
Date: Tue, 25 Sep 2018 17:11:20 +0000
Message-ID: <20180925171119.GV9430@hiutale>
References: <1537871293-32494-1-git-send-email-mikko.rapeli@bmw.de>
	<20180925104443.GP9430@hiutale>
	<576c5e5174123059cfa49e8cf647716497a35610.camel@linuxfoundation.org>
	<20180925112117.GQ9430@hiutale>
	<4d8f4e7d3c76db6acca576b8b31c5fbe9832b285.camel@linuxfoundation.org>
In-Reply-To: <4d8f4e7d3c76db6acca576b8b31c5fbe9832b285.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.43]
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
X-List-Received-Date: Tue, 25 Sep 2018 17:11:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6214991A7FBD784C844173DACC516B2C@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 25, 2018 at 04:19:39PM +0100, richard.purdie@linuxfoundation.or=
g wrote:
> On Tue, 2018-09-25 at 11:21 +0000, Mikko.Rapeli@bmw.de wrote:
> > On Tue, Sep 25, 2018 at 12:08:24PM +0100, Richard Purdie wrote:
> > > I suspect we need to talk to cmake upstream about fixing this
> > > properly
> > > but adding something in the class may be an option until a better
> > > upstream solution can be found.
> > >=20
> > > I am puzzled by the need to add a .pc file path check since I
> > > thought
> > > there was already a test for that in insane.bbclass?
> > >=20
> > > package_qa_check_staged maybe? "Check staged la and pc files for
> > > common
> > > problems like references to the work directory."
> >=20
> > That check is not enabled by default. At least bash is producing a
> > broken
> > bash.pc (and several other files like Makefile.in and bashbug) in
> > sumo
> > with embedded absolute paths to build sysroot.
>=20
> I still felt I was missing something:
>=20
> ERROR_QA ?=3D "dev-so debug-deps dev-deps debug-files arch pkgconfig la=20
>=20
> which sets "pkgconfig" and "la". package_qa_check_staged calls
> package_qa_handle_error("la",...) and
> package_qa_handle_error("pkgconfig"...).
>=20
> do_qa_staging calls package_qa_check_staged() and is triggered by:
>=20
> do_populate_sysroot[postfuncs] +=3D "do_qa_staging "
>=20
> which is set for everything and should be running on master?
>=20
> I had a look at bash.pc in a random local build and there is no
> hardcoded path in it for master. I then found a sumo build and looked
> at bash.pc there and also no hardcoded paths.
>=20
> The issues would have appeared to have been fixed by:
>=20
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3Ddabbfe23de0615a958=
fac31b83684ade024cf17d=20
> which should be in sumo.

Cool, but this ignores nativesdk, which is where I saw the problems with
this test. Somehow missed that nativesdk part in my reply, possibly because
of plain recipe name in the error message.

> What may be the real issue is that sanity checker is quite specific
> about what its looking for and does do:
>=20
> file_content =3D file_content.replace(recipesysroot, "")
>=20
> which may make sense for .la files but perhaps not .pc files, I'd guess
> its to stop compiler flags triggering errors.=20
>=20
> So the real fix here may be to remove that line from the .pc check, at
> least in the target case (native case it would make sense)?

And .cmake files?

I've fixed issues found by this test in my tree by following the pattern fr=
om
these "improve reproducibility" fixes. Some recipes were installing generat=
ed
.cmake files from build tree (bad, bad) and several recipes were somehow
generating .cmake files with absolute paths for libraries. It's completely
unclear to me when and why CMake decides to fill in absolute paths, like wi=
th
libical.

-Mikko=

