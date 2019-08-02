Return-Path: <prvs=110bfcb55=Mikko.Rapeli@bmw.de>
Received: from esa10.bmw.c3s2.iphmx.com (esa10.bmw.c3s2.iphmx.com
	[68.232.139.98])
	by mail.openembedded.org (Postfix) with ESMTP id 77B6B7C7A9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2019 10:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1564741552; x=1596277552;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=8kQTxCkpApd28OavfY5TrNescpYZU6cRrzseVigiLKU=;
	b=mM6/7czo+/dgOaCkW/kacQIjenfF4RUaJnVNoWIfz0IbhHzOPYGgGQcq
	Oj6RRVctg40ZcFXY2LGckNT07GoZinFTdmrkM/tURuMD0nBZxOaIFMw41
	O0yXCM7sMlB1Q+1lmFKY1tgm4oA7pB8C4u3xi0bbK1Zua/r4ie/ejo6J5 Q=;
IronPort-SDR: 8kEVgeh/h/ekJTB56ijzNwikpzWkugetm9YVpHdsec7+JWjfZlg0UbZOLNaJf5B0Q0vWMA1Y2H
	u9PJbG1rq7IgS4R8KadYe0Cj4jjrSG4tYVSWXiWJXei5AeTYJtfKPqU4XkE450tMmYCWLGfLDc
	gZX5/DGob+ZQ/OzWBHc01rSO4OYlhDejrM887BwvHgjehGGziaWEl1PQhS+K87gvbDsseH3NGj
	zvS8q+jA0MGVevU6sNu0GazJLJ3zMuo34KRakFpH5hOlWm0nN6FFQqGUid0ekpbSv9MR2YozFA
	DW4=
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
	esa10.bmw.c3s2.iphmx.com with ESMTP/TLS; 02 Aug 2019 12:25:51 +0200
Received: from esabb2.muc ([160.50.100.34])  by esagw6.muc with ESMTP/TLS;
	02 Aug 2019 12:25:50 +0200
Received: from smucm10k.bmwgroup.net (HELO smucm10k.europe.bmw.corp)
	([160.48.96.47])
	by esabb2.muc with ESMTP/TLS; 02 Aug 2019 12:25:50 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10k.europe.bmw.corp
	(160.48.96.47) with Microsoft SMTP Server (TLS;
	Fri, 2 Aug 2019 12:25:50 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.005;
	Fri, 2 Aug 2019 12:25:50 +0200
From: <Mikko.Rapeli@bmw.de>
To: <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH 1/1] kill-bb: Add it for killing abnormal
	bitbake processes
Thread-Index: AQHVSRwcPOL0TpneREWUJYdDMQlraqbnhZAA
Date: Fri, 2 Aug 2019 10:25:50 +0000
Message-ID: <20190802102549.GL3459@hiutale>
References: <cover.1564741458.git.liezhi.yang@windriver.com>
	<6e12b495c74cfe8497e067fe1b4c4b823c6d4abe.1564741458.git.liezhi.yang@windriver.com>
	<67a9995b-8401-7308-bb0b-b6b81da03abb@intel.com>
In-Reply-To: <67a9995b-8401-7308-bb0b-b6b81da03abb@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.45]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] kill-bb: Add it for killing abnormal bitbake processes
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
X-List-Received-Date: Fri, 02 Aug 2019 10:25:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BF22C5E315394445A8DEF1A624F0F2DC@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 02, 2019 at 11:21:24AM +0100, Ross Burton wrote:
> On 02/08/2019 11:24, Robert Yang wrote:
> > There might be processes left after Ctr-C, e.g.:
> > $ rm -f tmp/cache/default-glibc/qemux86/x86_64/
> > $ bitbake -p
> >=20
> > Press 'Ctrl-C' multiple times during parsing, then bitbake processes ma=
y not
> > exit, and the worse is that we can't start bitbake again, we can't alwa=
ys
> > reproduce this, but sometime. We can only use "ps ux" to find the proce=
sses and
> > kill them one by one. This tool can kill all of them easily.
> I've noticed this, and also noticed that it got a lot worse recently.
>=20
> But let's fix bitbake instead of adding tools to work around it?

I run builds in lxc containers for this and host contamination reasons.

Several build tools can also escape the bitbake environment and keep
running in the build machine if bitbake itself ends or gets killed,
so the problems are not only with bitbake.

-Mikko=

