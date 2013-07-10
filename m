Return-Path: <mike.looijmans@topic.nl>
Received: from atl4mhob13.myregisteredsite.com
	(atl4mhob13.myregisteredsite.com [209.17.115.51])
	by mail.openembedded.org (Postfix) with ESMTP id AEBF861FE1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 13:05:24 +0000 (UTC)
Received: from mailpod.hostingplatform.com ([10.30.71.208])
	by atl4mhob13.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r6AD5PBc032483 for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 09:05:25 -0400
Received: (qmail 2327 invoked by uid 0); 10 Jul 2013 13:05:24 -0000
X-TCPREMOTEIP: 88.159.208.100
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO ?192.168.80.45?)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 10 Jul 2013 13:05:24 -0000
Message-ID: <51DD5C13.1040701@topic.nl>
Date: Wed, 10 Jul 2013 15:05:23 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <20130706213931.GD3288@jama>
	<1373459893-23611-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1373459893-23611-1-git-send-email-Martin.Jansa@gmail.com>
Subject: sstate-cache and making a package "host-dependent"
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
X-List-Received-Date: Wed, 10 Jul 2013 13:05:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I added a buildserver that also exports its "sstate-cache" directory, so 
that other build machines can grab their stuff from it. This works fine, 
but I have one problem. Some packages are meant to be dependent on the 
system that built it. I want to enforce that each build machine creates 
its own package, and does not grab it from the sstate-cache of the 
central server.

For example,

$ cat recipes-core/meta/distro-feed-configs.bbappend
PRINC="1"
DISTRO_HOST_NAME ?= "${@os.uname()[1]}"
DISTRO_FEED_NAME ?= "feed"
DISTRO_FEED_PREFIX = "topic"
DISTRO_FEED_URI = 
"http://${DISTRO_HOST_NAME}/${DISTRO_FEED_NAME}/${MACHINE}"


The purpose being that the host name of the machien that built the image 
ends up in the opkg config files. This works just fine.
Now that we have a central server, all images on all build hosts grab 
the package from the sstate-cache server, resulting in the feed pointing 
to the central server instead of the private one, which is not what I 
wanted to happen.

After reading the documentation, I added the following line to the recipe:

PACKAGE_ARCHS[vardeps] = "DISTRO_FEED_URI"

This did not have the desired effect. The package is still retrieved 
from the cache, and not rebuilt locally. Even if I clean and force a 
rebuild of the distro-feed-configs package, the package that ends up in 
the image is still the one from the central server.

What am I missing here?


