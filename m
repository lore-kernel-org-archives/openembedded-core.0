Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id C26AB6BD93
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2013 14:14:54 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r89ESNjj008773 for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Sep 2013 15:28:24 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id y4FSpT6wERBO
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2013 15:28:23 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r89ESH6T008764
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Sep 2013 15:28:18 +0100
Message-ID: <1378736079.3484.117.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 09 Sep 2013 15:14:39 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [RFC PATCH] bitbake.conf: Stop providing ${P} and ${PF} by default
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
X-List-Received-Date: Mon, 09 Sep 2013 14:14:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

For a long time we've provided PN-PV and PN-PV-PR by tweaking PROVIDES. This looks
nice at first glance however it turns out to be a bit problematic. Taking make as an
example where there are two versions, 3.81 and 3.82, what should "bitbake make-3.81" do?

Currently it builds make-3.81 and make-3.82 and breaks in interesting ways. Is that
a bitbake bug? Well, it certainly shouldn't try and run the build. Why is it building
3.82 though? Its due to finding a dependency on "make-dev" and then trying to figure
out what provides it? The answer is "make" and the default version of "make" is 3.82.

So arguably, finding "make-3.81" should infer PREFERRED_VERSION_make = "3.81". Doing
so resolved the above problem since now "make" resolves to "make-3.81".

So what about if we have Recipe A:
DEPENDS = "make-3.81"
and Recipe B:
DEPENDS = "make-3.82"

That is clearly an error, easy. So finally what about if we have Recipe A:
DEPENDS = "make-3.81"
and Recipe B:
DEPENDS = "make"

The first recipe infers the PREFERRED_VERSION_make = "3.81" and then forces that
version on everything else. Is that desired? Probably not in most cases, at least not
silently.

As mitigation, we could print a WARNING about this happening. The final part of the problem
is that we can ony figure this out within bitbake itself. That means we'd have to teach bitbake
about the PN-PV format of PROVIDES which is breaking the separation between bitbake and the
metadata. We can't win :(.

Nobody that I know of is using or relying on this functionality so perhaps we should
just remove it instead which is what this patch does. Opinions?

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 2d19d86..578c7d0 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -253,7 +253,7 @@ DEPCHAIN_POST = "-dev -dbg"
 DEPENDS = ""
 RDEPENDS = ""
 PROVIDES = ""
-PROVIDES_prepend = "${P} ${PF} ${PN} "
+PROVIDES_prepend = "${PN} "
 RPROVIDES = ""
 
 MULTI_PROVIDER_WHITELIST = "virtual/libintl virtual/libintl-native virtual/nativesdk-libintl virtual/xserver virtual/update-alternatives-native virtual/update-alternatives"



