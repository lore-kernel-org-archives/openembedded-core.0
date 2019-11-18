Return-Path: <prvs=218492722=Mikko.Rapeli@bmw.de>
Received: from esa10.bmw.c3s2.iphmx.com (esa10.bmw.c3s2.iphmx.com
	[68.232.139.98])
	by mail.openembedded.org (Postfix) with ESMTP id 0254C7F8E5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 08:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1574067543; x=1605603543;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=Es1pJ5V9nuInibyccXj0poLW+ibUvXU6txxyCky2cEQ=;
	b=hZiALQxbJ/wa+6Fg/C8SBCCO7vf3CTEU2Uv9GTctI7Ac6xoTTq6bKg0q
	jQaiMzyfiKUFxxOBZAiwMIEiaAk1b7DWYynjjcX9vJbomExUBGp7d8CFC
	oy42w7j6JWlORDKcRdYDkMPLtLmI9+O+fasuID1QUrkaGDa8AHR8fE1i4 8=;
IronPort-SDR: 1boY78kZT2hQw7eLo9lz7G1zjWOXR7qo0F0A+X+9WXWYGMb446VZ0LhketVvvrpieMgz7eG1Gk
	YrlwzZUgDg3nQ4FwZeDM4g2euAnFF17tH4IKERrXlJ1WYCPBPHZ2jZUFpiUfkzvQR7Iqzg0LLX
	iKOkFfHhid8wDx1Y9lknMpJw6TsT+sY5M0J2dxEvGuMXPnQ+HhPtWKkuykpRF4sXNPpBFcMg96
	cOrbNndmfSDXZWUsnhz0WiYKTyqknlBhntxvHwXs+kJdkyk1y98kegw6Hhf2eCkqLvpi05p6Vq
	K5U=
Received: from esagw2.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
	esa10.bmw.c3s2.iphmx.com with ESMTP/TLS; 18 Nov 2019 09:59:01 +0100
Received: from esabb3.muc ([160.50.100.30])  by esagw2.muc with ESMTP/TLS;
	18 Nov 2019 09:58:39 +0100
Received: from smucm10j.bmwgroup.net (HELO smucm10j.europe.bmw.corp)
	([160.48.96.46])
	by esabb3.muc with ESMTP/TLS; 18 Nov 2019 09:58:39 +0100
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10j.europe.bmw.corp
	(160.48.96.46) with Microsoft SMTP Server (TLS;
	Mon, 18 Nov 2019 09:58:38 +0100
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.005;
	Mon, 18 Nov 2019 09:58:38 +0100
From: <Mikko.Rapeli@bmw.de>
To: <alex.kanavin@gmail.com>
Thread-Topic: [OE-core] How to add build date? (was: ... basehash value
	changed...)
Thread-Index: AQHVne5epjHvwC965Uu00+IegzMs8A==
Date: Mon, 18 Nov 2019 08:58:38 +0000
Message-ID: <20191118085838.GD3527@hiutale>
References: <adf92df5-06d4-ea38-ad9f-55dde92148b2@linux.ibm.com>
	<bb5c3045-8131-095a-f7bc-0ff91f36af5a@linux.ibm.com>
	<CANNYZj8LNhF26TLHuLMPh6K40dXe8V5pgEvv8N3MAEFVy+vveg@mail.gmail.com>
In-Reply-To: <CANNYZj8LNhF26TLHuLMPh6K40dXe8V5pgEvv8N3MAEFVy+vveg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, jrey@linux.ibm.com
Subject: Re: How to add build date? (was: ... basehash value changed...)
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
X-List-Received-Date: Mon, 18 Nov 2019 08:59:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E0FE4E48F3D3A548B3235CC26B10F554@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 17, 2019 at 10:19:32PM +0100, Alexander Kanavin wrote:
> I'd write the date into the file at image creation, via
> ROOTFS_POSTPROCESS_COMMAND.
>=20
> Having it in a recipe means that you either force the recipe to not be a
> part of sstate cache, always rebuilding it and its dependencies (bad idea=
),
> or accept that the date comes from a previously built cache object, which
> means it will mismatch the actual image creation date.

This is the approach I use. Also, the need of build time stamp is usually n=
ot what
users need. They likely need the latest time stamp in meta layer commits,
or similar. I use git submodules for them so a "git describe --tags --alway=
s --dirty" will
generate a unique tag and hash combination for all builds. The commit time
can be queried with 'git log HEAD~1.. --format=3D"%cD"'.

-Mikko=

