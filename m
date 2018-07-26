Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 66E3E78C33
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 16:11:20 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w6QGBGYg019132
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 26 Jul 2018 17:11:17 +0100
Message-ID: <f8ab4ac1813c531937fae65654513f8a21ab24b4.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jonathan Haigh <Jonathan.Haigh@arm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 26 Jul 2018 17:11:16 +0100
In-Reply-To: <DB5PR08MB0888B7FFDFD5AA67F818105E93520@DB5PR08MB0888.eurprd08.prod.outlook.com>
References: <DB5PR08MB0888CF3B2340E729DD3B946193520@DB5PR08MB0888.eurprd08.prod.outlook.com>
	<DB5PR08MB0888B7FFDFD5AA67F818105E93520@DB5PR08MB0888.eurprd08.prod.outlook.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Cc: Jeremy Johnson <Jeremy.Johnson@arm.com>
Subject: Re: INCOMPATIBLE_LICENSE mechanism
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
X-List-Received-Date: Thu, 26 Jul 2018 16:11:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-07-19 at 15:08 +0000, Jonathan Haigh wrote:
> I have some questions, comments and suggestions about the
> INCOMPATIBLE_LICENSE mechanism:
> 
> 1. If I specify licenseX in INCOMPATIBLE_LICENSE then I get an error
> when building a recipe with a package (packageA) that just
> RRECOMMENDS a package (packageB) with licenceX, even if I add
> packageB to BAD_RECOMMENDATIONS_pn-packageA. Am I correct in thinking
> that this behaviour is unintentional?

RRECOMMENDS are a runtime setting and something that the package
manager cares about. From bitbake's perspective, a RRECOMMEND and an
RDEPEND are the same thing.

This is done mainly for build determinism, we can't just sometimes
decide to build a recommendation but sometimes not (for example if its
build failed).

So the behaviour is intentional at one level but obviously the
implications for INCOMPATIBLE_LICENSE are problematic.

> 2. When checking whether a license expression is compatible with
> INCOMPATIBLE_LICENSE, the code takes into account "or" operands in
> the license expression, such that if licenseX is in
> INCOMPATIBLE_LICENSE but licenseY isn't, and a package's license
> expression is "licenseX | licenseY" then the license will be deemed
> okay even though licenseX is incompatible. I don't think this
> consideration of "or" operands is valid. Consider the case where:
> packageA has license expression "LGPLv3 | GPLv2;
> packageB has license expression "MIT";
> packageB dynamically links with packageA;
> INCOMPATIBLE_LICENSE = "LGPL-3.0".
> PackageB mustn't be using packageA under the terms of the GPLv2
> because the resulting combination would have to be GPLv2, not MIT, to
> comply with the terms of the GPLv2. PackageB must therefore be using
> packageA under the terms of the LGPLv3, but LGPL-3.0 is in
> INCOMPATIBLE_LICENSE, so the combination should be rejected.

The code there is simplistic and tries to spot "obvious" problems. As
you point out, its not entirely accurate. I'd very much like to see it
improved.

> Actually keeping track of how licenses of packages and their
> dependents interact might be too much work, too messy, or require too
> much legal knowledge, so I suggest this special treatment of "or"
> operands in license expressions is removed.

If you remove it, I'm not sure the situation improves much. I think
originally the idea was to be able to dial in a license policy such
that it would flag whichever combinations were problematic and
configured as incompatible.

Perhaps a better idea would be a new check in insane.bbclass which
checks the things a package is depending upon and considers and warns
about known problematic licensing. The list of licenses it was using
could then be influences by INCOMPATIBLE_LICENSE and you would get the
result you're looking for, admittedly at build time rather than parse
time but its better than nothing.

>  Another approach might be to allow packages explicitly declare the
> licenses under which they are using their rdependencies. That
> wouldn't work nicely with the implicit RDEPENDS addition mechanism
> though.
> 
> 3. If I understand correctly, INCOMPATIBLE_LICENSE doesn't let me
> have different license policies for packages that go into different
> images. It would be useful to be able to specify INCOMPATIBLE_LICENSE
> in an image recipe to prevent just that image containing
> packages/recipes with incompatible licenses. This would be useful
> e.g. to have a GPLv3-free production image but allow GPLv3 packages
> in a debug image.

INCOMPATIBLE_LICENSE is a "hammer" approach which removes many recipes
from the view of the system entirely. That was the way some legal
departments wanted it to work.

> 4. From the code in license.bbclass, it looks like when writing the
> rootfs and image manifest files, the intended behaviour is to modify
> the license expressions of packages/recipes by removing incompatible
> "or" branches (which seems a little odd, especially given #2).
> However, this is not the actual behaviour of the code when run with
> Python3. From write_license_files() in license.bbclass:
> 
>     bad_licenses = (d.getVar("INCOMPATIBLE_LICENSE") or "").split()
>     bad_licenses = map(lambda l: canonical_license(d, l),
> bad_licenses)
>     bad_licenses = expand_wildcard_licenses(d, bad_licenses)
> 
> expand_wildcard_licenses() expects a list, but in Python3 map()
> returns some sort of iterator, which causes
> expand_wildcard_licenses() to return an empty list. This can be fixed
> by wrapping the call to map() in a call to list(). I'll send a patch
> for this.

Please!

> I have a bbclass that adds license checking at the rootfs/image stage
> and doesn't take into account the "or" operands in license
> expressions, but I think it would be better to change/extend the
> functionality of the INCOMPATIBLE_LICENSE mechanism. Do the oe-core
> maintainers here agree with the following approach?
>
> Don't fail a build if a package just RRECOMMENDs another package with
> an incompatible license, only fail if the package is actually built.

This is potentially more problematic than you realise.

> Don't take "or" operands into account when checking for incompatible
> licenses.

I don't agree with this, I think we need to improve the code to handle
this better though.

> Add functionality to allow INCOMPATIBLE_LICENSE to just apply to
> packages/recipes that go into a particular image.

That is using it for something quite different from its original deisgn
intent.

> Don't modify package/recipe license expressions in the manifest
> files.

This is done because that file may be used as a basis to provide
something to a legal department and if you're not meant to be shipping
GPLv3, listing it in the manifest would cause more confusion. I can see
this from both sides...

> If so, I'd like to contribute patches to do this. I'm not at all
> familiar with how the RRECOMMENDS mechanism works though, so some
> guidance on that part would be useful.

See above, I've tried to explain the challenge there!

I would much rather see the existing mechanisms improved than adding
extra classes or new ones but there are reasons for some of why it
works the way it does.

Cheers,

Richard

