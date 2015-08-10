Return-Path: <prvs=657fc4add=Mikko.Rapeli@bmw.de>
Received: from esa6.bmw.c3s2.iphmx.com (esa6.bmw.c3s2.iphmx.com
	[68.232.139.124])
	by mail.openembedded.org (Postfix) with ESMTP id D1CFE76804
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 11:48:03 +0000 (UTC)
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
	esa6.bmw.c3s2.iphmx.com with ESMTP/TLS; 10 Aug 2015 13:48:03 +0200
Received: from unknown (HELO esabb1.muc) ([160.50.100.31]) by esagw4.muc with
	ESMTP/TLS; 10 Aug 2015 13:48:04 +0200
Received: from smuch55a.muc (HELO SMUCH55A.europe.bmw.corp) ([160.46.137.111])
	by esabb1.muc with ESMTP/TLS; 10 Aug 2015 13:48:01 +0200
Received: from SMUCM65A.europe.bmw.corp ([160.46.134.155]) by
	SMUCH55A.europe.bmw.corp ([160.46.137.111]) with mapi id 14.03.0248.002;
	Mon, 10 Aug 2015 13:48:01 +0200
From: <Mikko.Rapeli@bmw.de>
To: <mike.looijmans@topic.nl>
Thread-Topic: [OE-core] [PATCH] sanity.bbclass: check SSTATE_DIR, DL_DIR and
	*MIRROR for broken symlinks
Thread-Index: AQHQy2+1X7gCy6EMvEOOz3fdAlfGJJ4E0fWAgAAOlACAACvdgA==
Date: Mon, 10 Aug 2015 11:48:00 +0000
Message-ID: <20150810114757.GG6102@loska>
References: <1438333215-1593-1-git-send-email-mikko.rapeli@bmw.de>
	<20150810081845.GF6102@loska> <55C86AA2.2050706@topic.nl>
In-Reply-To: <55C86AA2.2050706@topic.nl>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.44.101]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] sanity.bbclass: check SSTATE_DIR, DL_DIR and *MIRROR for broken symlinks
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
X-List-Received-Date: Mon, 10 Aug 2015 11:48:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4B49ED69984CE044AEF71CDF9EA22B92@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Aug 10, 2015 at 11:10:58AM +0200, Mike Looijmans wrote:
> On 10-08-15 10:18, Mikko.Rapeli@bmw.de wrote:
> >On Fri, Jul 31, 2015 at 12:00:15PM +0300, Mikko Rapeli wrote:
> ...
> >>+# Check that path isn't a broken symlink
> >>+def check_symlink(lnk):
> >>+    if os.path.islink(lnk) and not os.path.exists(lnk):
> >>+       return False
> >>+    return True
>=20
> - Bad coding style "if (x) return false".
> - Naming a method "check..." suggests to me that it will raise an excepti=
on
> on failure.

Thanks. I tried to follow existing patterns from the functions there.

> alternatives:
>=20
> def is_broken_symlink(lnk):
>     return os.path.islink(lnk) and not os.path.exists(lnk)
>=20
> def check_symlink(lnk, data):
>     if os.path.islink(lnk) and not os.path.exists(lnk):
> 	raise_sanity_error("%s is a broken symlink." % lnk, data)

This feels better and reduces the log statements too. Hopefully the generic
error message is enough to figure out what is wrong. I'll test and send a
new version.

Regarding testing, I guess selftests are not generally used to test error
paths like this.

-Mikko=

