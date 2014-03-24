Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 3EA016FAE5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 12:35:34 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2OCZRuE025505; Mon, 24 Mar 2014 12:35:28 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id NypVBTFl_Kfh; Mon, 24 Mar 2014 12:35:27 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2OCZMGe025501
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 24 Mar 2014 12:35:24 GMT
Message-ID: <1395664516.24232.56.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steffen Sledz <sledz@dresearch-fe.de>
Date: Mon, 24 Mar 2014 12:35:16 +0000
In-Reply-To: <5330220F.8050504@dresearch-fe.de>
References: <5330220F.8050504@dresearch-fe.de>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: complex versioning scenario
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
X-List-Received-Date: Mon, 24 Mar 2014 12:35:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-03-24 at 13:16 +0100, Steffen Sledz wrote:
> We've a complex versioning scenario here which leads me to my limits. :(
> 
> There are two recipes. One for a shared library and one for an application using this library.
> 
> Both use GNU autotools (so they have internal version information). For continuous integration purposes both use AUTOREV.
> 
> At the moment the recipes look like this:
> 
> 
> ------------ libfoo_git.bb -------------
> PR = "r7"
> PE = "2"
> SRCREV="${AUTOREV}"
> PV = "gitr${SRCPV}"
> ...
> 
> 
> ------------ app_git.bb ----------------
> DEPENDS = "... libfoo ..."
> PR = "r10"
> PE = "1"
> SRCREV="${AUTOREV}"
> PV = "gitr${SRCPV}"
> ...
> 
> 
> Now we have the following problem. libfoo has some incompatible
> changes in its interface (a new internal major version).
> 
> In my opinion this should find its represenation in the package
> versioning in a way that the dependency checker can guarantee that the
> library and the application package match each other.

It is generally impossible to directly compare two git hashes and decide
whether one is "greater" than the other. This is why most git recipes
have PV = "0.0+git${SRCPV}" so that you can change 0.0 when something
major changes. That way you can put a constraint in the second recipe.

This is a fundamental problem with git versioning and not something we
can fix generically.

Cheers,

Richard




