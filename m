Return-Path: <sledz@dresearch-fe.de>
Received: from zk223.dresearch-fe.de (zk223.dresearch-fe.de [217.92.177.116])
	by mail.openembedded.org (Postfix) with ESMTP id 9D76D6F8B0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 12:16:17 +0000 (UTC)
Received: from fensuse.internal.dresearch-fe.de
	(fensuse.internal.dresearch-fe.de [172.29.23.6])
	by zk223.dresearch-fe.de (Postfix) with ESMTP id 662D2E012B;
	Mon, 24 Mar 2014 12:16:17 +0000 (UTC)
Received: from [IPv6:::1] (localhost [IPv6:::1])
	by fensuse.internal.dresearch-fe.de (Postfix) with ESMTP id A3D4B7012BB;
	Mon, 24 Mar 2014 13:16:16 +0100 (CET)
Message-ID: <5330220F.8050504@dresearch-fe.de>
Date: Mon, 24 Mar 2014 13:16:15 +0100
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: openembedded-core <openembedded-core@lists.openembedded.org>
X-Enigmail-Version: 1.6
Subject: complex versioning scenario
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
X-List-Received-Date: Mon, 24 Mar 2014 12:16:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We've a complex versioning scenario here which leads me to my limits. :(

There are two recipes. One for a shared library and one for an application using this library.

Both use GNU autotools (so they have internal version information). For continuous integration purposes both use AUTOREV.

At the moment the recipes look like this:


------------ libfoo_git.bb -------------
PR = "r7"
PE = "2"
SRCREV="${AUTOREV}"
PV = "gitr${SRCPV}"
...


------------ app_git.bb ----------------
DEPENDS = "... libfoo ..."
PR = "r10"
PE = "1"
SRCREV="${AUTOREV}"
PV = "gitr${SRCPV}"
...


Now we have the following problem. libfoo has some incompatible changes in its interface (a new internal major version).

In my opinion this should find its represenation in the package versioning in a way that the dependency checker can guarantee that the library and the application package match each other.

But how?

Regards,
Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

