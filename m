Return-Path: <prvs=659e801ce=Mikko.Rapeli@bmw.de>
X-Greylist: delayed 1767 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 12 Aug 2015 10:33:55 UTC
Received: from esa2.bmw.c3s2.iphmx.com (esa2.bmw.c3s2.iphmx.com
	[68.232.133.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6C860768B6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 10:33:55 +0000 (UTC)
Received: from esagw1.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
	esa2.bmw.c3s2.iphmx.com with ESMTP/TLS; 12 Aug 2015 11:49:53 +0200
Received: from unknown (HELO esabb1.muc) ([160.50.100.31]) by esagw1.muc with
	ESMTP/TLS; 12 Aug 2015 11:49:52 +0200
Received: from smuch57a.muc (HELO SMUCH57A.europe.bmw.corp) ([160.46.137.109])
	by esabb1.muc with ESMTP/TLS; 12 Aug 2015 11:49:51 +0200
Received: from SMUCM65A.europe.bmw.corp ([160.46.134.155]) by
	SMUCH57A.europe.bmw.corp ([160.46.137.109]) with mapi id 14.03.0248.002;
	Wed, 12 Aug 2015 11:49:51 +0200
From: <Mikko.Rapeli@bmw.de>
To: <ed.bartosh@linux.intel.com>
Thread-Topic: shell script guidelines in oe-core? (was Re: [OE-core] [PATCH
	v4] create-pull-request: cleanup bashisms)
Thread-Index: AQHQ1OQ7eQVn8LyWQUCBkb9ccZkr/g==
Date: Wed, 12 Aug 2015 09:49:50 +0000
Message-ID: <20150812094953.GL6102@loska>
References: <1439303596-18965-1-git-send-email-ed.bartosh@linux.intel.com>
	<1439372011-26268-1-git-send-email-ed.bartosh@linux.intel.com>
In-Reply-To: <1439372011-26268-1-git-send-email-ed.bartosh@linux.intel.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.44.101]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: shell script guidelines in oe-core? (was Re: [PATCH v4] create-pull-request: cleanup bashisms)
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
X-List-Received-Date: Wed, 12 Aug 2015 10:33:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4715DC58C3DD75459B4CF768A8F4A7AB@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Sorry to hijack the thread but...

On Wed, Aug 12, 2015 at 12:33:31PM +0300, Ed Bartosh wrote:
> Made create-pull-request POSIX compatible:
>    - Replaced /bin/bash -> /bin/sh in shebang.
>    - Replaced usage of pushd/popd with generic shell commands.
>    - Tested on zsh and dash.

This reminded me of the problems I've seen with various oe-core shell scrip=
ts:
they are missing systematic error handling.

IMO using bash and 'set -euxo pipefail' are a good approach to catch errors
early in shell scripts. Manually checking for $? is error prone and things
like pipes can hide them. Using undefined variables is another thing
which should fail early before things go horribly wrong. And in build autom=
ation
I'd rather see output of -x since things can fail in mysterious ways.
And then there's quoting....

One useful guide is to use shellcheck as static analysis tool for shell scr=
ipts.

I guess internally bitbake uses at least set -e.

Comments?

-Mikko=

