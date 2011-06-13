Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QW5l4-0005ST-T5 for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 13:56:43 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5DBrGBN030763
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2011 12:53:16 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30155-08 for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2011 12:53:12 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5DBr8F0030757
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2011 12:53:10 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Jun 2011 12:52:49 +0100
Message-ID: <1307965969.15712.279.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: RFD: Recipe variants, multilib and package handling
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Jun 2011 11:56:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Why are variants of recipes important at all? I think we've all seen the
benefit of BBCLASSEXTEND massively simplifying native recipes and the
nativesdk class gives some glimpse of the generic power. We're in the
process of adding multilib handling to OE-Core and this pushes that
mechanism. It turns out there are some complexities here to do with the
naming conventions and how we namespace various targets which need
discussion.

Possible Namespaces
===================

For the purposes of this email lets assume we have the variants
"<default target> <native> <nativesdk> <multilibA> <multilibB>". The
exact format of the namespace is flexible but there are fours main
viable approaches to package namespace of variants:

a) Something gets appended to the end of the name:

<def target> : pkgconfig pkgconfig-dev pkgconfig-locale-foo
<native>     : pkgconfig-native
<nativesdk>  : pkgconfig-nativesdk pkgconfig-dev-nativesdk pkgconfig-locale-foo-nativesdk
<multilibA>  : pkgconfig-mlA pkgconfig-dev-mlA pkgconfig-locale-foo-mlA
<multilibB>  : pkgconfig-mlB pkgconfig-dev-mlB pkgconfig-locale-foo-mlB

b) Something gets appended to the end of PN:

<def target> : pkgconfig pkgconfig-dev pkgconfig-locale-foo
<native>     : pkgconfig-native
<nativesdk>  : pkgconfig-nativesdk pkgconfig-nativesdk-dev pkgconfig-nativesdk-locale-foo
<multilibA>  : pkgconfig-mlA pkgconfig-mlA-dev pkgconfig-mlA-locale-foo
<multilibB>  : pkgconfig-mlB pkgconfig-mlB-dev pkgconfig-mlB-locale-foo

c) Something gets prepended to the start of the name:

<def target> : pkgconfig pkgconfig-dev pkgconfig-locale-foo
<native>     : native-pkgconfig
<nativesdk>  : nativesdk-pkgconfig nativesdk-pkgconfig-dev nativesdk-pkgconfig-locale-foo
<multilibA>  : mlA-pkgconfig mlA-pkgconfig-dev mlA-pkgconfig-locale-foo
<multilibB>  : mlB-pkgconfig mlB-pkgconfig-dev mlB-pkgconfig-locale-foo

Variant d) where something gets prepended to PN works out the same as c)
except where we have package names like lib${PN}.

Currently OE operates on b) or some variant thereof. BBCLASSEXTEND
automatically adds something to the end of PN.

The two conflicting problems
============================

So what's the problem? It all comes down to how to process a recipe and
turn it into one of these variants. There are two classes of problem:

i) Translating DEPENDS/RDEPENDS style variables

Given a general dependency like "pkgconfig-locale-foo", how do you turn
it into the variant? For the cases like b) and d) above where some
transformation of ${PN} is made, you don't know where to place the
variant in the general string. In this example, its obvious to the human
eye that it should be after "pkgconfig" but a computer can't do that
generically.

That turns out to be hard so then you consider appending to the end of
the name. You can search for any reference to the variant in the name,
remove it and place it at the end.

ii) Dealing with assumptions about ${PN}

The whole of the metadata does things like:

PACKAGES = "${PN} ${PN}-dev"
FILES_${PN}-dev = "x"

The use of PN like this is why there is the attraction of simply
appending to PN. The trouble is that i) above means you can't do this
and reliably translate dependencies.

Options
=======

a) We could introduce some kind of suffix variable ${PKGSFX} which would
contain the variant, maybe in conjuction with BPN instead of PN:

PACKAGES = "${BPN}${PKGSFX} ${BPN}-dev${PKGSFX}"
FILES_${BPN}-dev${PKGSFX} = "x"

This has the downside of having to touch the whole metadata and it looks
ugly.

b) We could try and remap all the variables at BBCLASSEXTEND time. This
would mean remapping PACKAGES and renaming all the package specific
variables such as FILES, SUMMARY, DESCRIPTION, RDEPENDS, RRECOMMENDS,
RSUGGESTS, RPROVIDES, RREPLACES, ALLOW_EMPTY, SECTION and likely others.

I knew were were going to have to read through some of those variables
and remap the dependencies but having to totally move them into new
namespaces is a scary thought (but still possible).

c) Switch to prepending to PN. This would only break cases where we have
packages which don't start with ${PN} of which there are comparatively
few. We could make the simplifying assumption that all PACKAGES start
with ${PN} meaning that all manipulations would be simple prepends. If
we do this, problems i) and ii) above are no longer an issue.

Discussion
==========

I don't think option a) above is viable and the current plan implies
we'd do b) but its extremely ugly. I'm therefore tempted to look more
seriously at c). The bigger issues would appear to be:

* It breaks with convention/tradition for OE (xxx-native vs native:xxx)
* It would add the constraint of packaging starting with ${PN}
* It would require changes to the likes of debian.bbclass to account 
  for package prefixes when performing auto renaming
* It would break a small set of the metadata where packages don't start 
  with ${PN} (although the class could simply refuse to extend these 
  automatically).

Things to consider:

* Would we just do this for multilibs or would we transition native 
  recipes to the new style of naming? We don't have PACKAGES problems 
  for native recipes.
* Likewise, would nativesdk transition? Is has more PACKAGES problems 
  so likely yes, it would make sense to transition.
* Would we stick with "-" as a delimiter or switch to something like 
  ":"?

Thoughts/suggestions/better ideas welcome...

Cheers,

Richard



