Return-Path: <prvs=75617a962=Mikko.Rapeli@bmw.de>
Received: from esa10.bmw.c3s2.iphmx.com (esa10.bmw.c3s2.iphmx.com
	[68.232.139.98])
	by mail.openembedded.org (Postfix) with ESMTP id 9AC9778F2B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 09:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1534152733; x=1565688733;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=3xf33jvVWBoXunTfvsaNJWokoaEp9b0qwT6hMoP24jU=;
	b=g+0Rd8p9EKNMme/65xfRTvUKqWn6oiCroqK0Fsln5fKD3yUWD0Htsrpp
	JkElC40sDzDy4S7Lz3GMlbrIc8kR2TFw/2qc15W/r/mRhLGImAhuITDxp
	1YeLAceQcS2wbpyhtpymhXsNtfCccqzJYwwwXNjSij1a29OeC3Avbzi3B Y=;
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
	esa10.bmw.c3s2.iphmx.com with ESMTP/TLS; 13 Aug 2018 11:32:11 +0200
Received: from esabb5.muc ([160.50.100.47])  by esagw5.muc with ESMTP/TLS;
	13 Aug 2018 11:32:11 +0200
Received: from smucm10k.bmwgroup.net (HELO smucm10k.europe.bmw.corp)
	([160.48.96.47])
	by esabb5.muc with ESMTP/TLS; 13 Aug 2018 11:32:11 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10k.europe.bmw.corp
	(160.48.96.47) with Microsoft SMTP Server (TLS;
	Mon, 13 Aug 2018 11:32:11 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1367.000;
	Mon, 13 Aug 2018 11:32:11 +0200
From: <Mikko.Rapeli@bmw.de>
To: <martin.jansa@gmail.com>
Thread-Topic: [PATCH] perf: fail if src path does not exist
Thread-Index: AQHUMLZoGSN6oZisREOtzBrL/OLJC6S9ThAA
Date: Mon, 13 Aug 2018 09:32:10 +0000
Message-ID: <20180813093210.GA8291@hiutale>
References: <1533911276-12983-1-git-send-email-mikko.rapeli@bmw.de>
In-Reply-To: <1533911276-12983-1-git-send-email-mikko.rapeli@bmw.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.36]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] perf: fail if src path does not exist
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
X-List-Received-Date: Mon, 13 Aug 2018 09:32:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B8D38274B5C73348A0B7361E23B069A8@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Martin Jansa wrote:
> I think this will break support for older kernels added in:
> http://git.openembedded.org/openembedded-core/commit/?id=3D19fb2d11a8bb3c=
6dfdd5edc1b9155d642dc0f5e0
>=20
> kernel-source/tools/arch and kernel-source/tools/build are missing in 3.1=
6
> kernel even when it's not completely broken.
>=20
> I'm not completely against this change, maybe just add to commit message
> that for older kernels you need to add .bbappend which removes the
> directories which really doesn't exist in your kernel version from PERF_S=
RC.

Exactly. For older kernels like 4.1 the recipe did not work at all and the
failure was a total one at compile time. Once error was clear, solution
was to create a perf.bbappend for the kernel which overwrites
the PERF_SRC variable with needed directories from kernel source tree.

I can document this in the commit message and send a v2.

-Mikko=

