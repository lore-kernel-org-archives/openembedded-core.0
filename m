Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 4E1A46F2E7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 14:58:16 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s1OEwBaZ015667 for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 14:58:12 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id UiSLQsJ04tlv
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 14:58:11 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s1OEw7JJ015664
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 14:58:09 GMT
Message-ID: <1393253881.31769.6.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Feb 2014 14:58:01 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: RFC: Separate build dir for autotools
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
X-List-Received-Date: Mon, 24 Feb 2014 14:58:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

For a while poky and others have been using the seperatebuilddir.inc
file. This makes ${S} != ${B} and means that ${B} can be wiped when
configuration changes.

This helps deal with the fact that autotools and friends are not
particular good at rebuilding things that change. The recent libcheck
upgrade which broke bluez4 builds is but one example of the kind of
problem we can hit. Sadly bluez4 doesn't work for S!=B so it didn't
protect against that issue but it does protect other packages.

I'd really love to switch the default in autotools.bbclass to make this
the default and then have broken packages opt out of it.

I can deal with OE-Core and make sure the metadata there is updated, my
bigger worry is what this would do to other layers.

The options I can see are therefore basically:

a) We change the default in autotools.bbclass and fix things that break

b) We introduce an "autotools2" class and have recipes inherit that.
This version would default to separate builddirs. It does mean change to
all the "good" recipes rather than the broken ones though and hence a
fair bit of churn.

Have we got the willpower to fix a)? is b) an option? Other ideas?

One way or another I think we should try and switch things somehow...

Cheers,

Richard


