Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2E7067F7E8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 08:01:26 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 22so856887wms.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 01:01:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=pbI8TQaGFGbDhFG6dFcuhEA1qPGhetpbOdTbEGQPvTc=;
	b=k7RUksw4UbFiOFN8s5y0GCHEJ32BI1355r7vwkU4RvwKrgF9juNNZBuzIB0jQieHD+
	Y36shQCpt6uKIuEH5aOiJ61RqCvgR1JWeGb8nFp+t952gR4ff6ng/NCsilbnmoxlGhNS
	hRmu1iIQNs2NszZPetpK46D7ELIxjHGXLn96rGsfyR2LIo/CKVD/5mVAkXTCd9/EsTbO
	jfP1DB0k509+fls6lc/1bhwEakND+PUDg3Gz7x8BhCTRZne3mNye4hJ5vxRV9AebLIqa
	HioebCF5y1uqG1L7eaCt5mfGtyVT5V4Ml5J5LPHcUZPvI+DZKH2/FA4nx2PCEEt0TzNt
	/oBg==
X-Gm-Message-State: APjAAAWxW+UbJUQxyH+E/nK8G5MKKoLzwG38gpcoiGmMbLxOKB9zjhbB
	2z9Hkcgk71pSTAXmNuQrpTJ2fYb4
X-Google-Smtp-Source: APXvYqyFaeqe4H7kYv2eNp2yVQiZtLzize4hvUm5BGytfTStzE7IOaVAAykjek7QczpbtqtrIwXyPg==
X-Received: by 2002:a1c:7219:: with SMTP id n25mr2122786wmc.33.1571990486478; 
	Fri, 25 Oct 2019 01:01:26 -0700 (PDT)
Received: from tfsielt31850.fritz.box ([79.97.20.138])
	by smtp.gmail.com with ESMTPSA id
	o18sm1845914wrm.11.2019.10.25.01.01.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 25 Oct 2019 01:01:25 -0700 (PDT)
Message-ID: <84dcb01f8a015b1717be0b2430c220b6d23ef0d8.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2019 09:01:25 +0100
In-Reply-To: <20191022090353.21151-1-jean-marie.lemetayer@savoirfairelinux.com>
References: <20191022090353.21151-1-jean-marie.lemetayer@savoirfairelinux.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: Re: [RFC][PATCH 0/6] NPM refactoring
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
X-List-Received-Date: Fri, 25 Oct 2019 08:01:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

This has been an interesting discussion so far.

I'd like to throw in something else...

A couple years back I wrote a little python script to automatically
generate all the required dependency recipes given an npm project's
package.json

The generated recipes worked very well, including cross-compilation using
node-gyp.

At least at the time this was all reasonably straight forward, avoided *any* use
of npm, gave me all the benefits of reproducibility, yocto caching, license
management, correct cross-compilation for native code, etc. Also, the
generated yocto packages contained none of the test- or other items that
npm packages usually contain and don't need to be copied onto the target
for image builds. All this by simply inspecting the package.json

This approach also minimised maintenance cost, as all recipes were auto-generated.

The only downside was that bitbake became a bit slow, as the number of
tasks went to about 15000.

I can dig this out and share on Monday. This script could live in the
scripts/ subdirectory, allowing people to create recipes on demand for
projects they care about.


Cheers,
Andre'


On Tue, 2019-10-22 at 11:03 +0200, Jean-Marie LEMETAYER wrote:
> The current NPM support have several issues:
>  - The current NPM fetcher downloads the dependency tree but not the other
>    fetchers. The 'subdir' parameter was used to fix this issue.
>  - They are multiple issues with package names (uppercase, exotic characters,
>    scoped packages) even if they are inside the dependencies.
>  - The lockdown file generation have issues. When a package depends on
>    multiple version of the same package (all versions have the same checksum).
> 
> This patchset refactors the NPM support in Yocto:
>  - As the NPM algorithm for dependency management is hard to handle, the new
>    NPM fetcher downloads only the package source (and not the dependencies,
>    like the other fetchers) (patch submitted in the bitbake-devel list).
>  - The NPM class handles the dependencies using NPM (and not manually).
>  - The NPM recipe creation is simplified to avoid issues.
>  - The lockdown file is no more used as it is no longer relevant compared to the
>    latest shrinkwrap file format.
> 
> This patchset may remove some features (lockdown file, license management for
> dependencies) but fixes the majority of the NPM issues. All of these issues
> from the bugzilla.yoctoproject.org are resolved by this patchset:
> #10237, #10760, #11028, #11728, #11902, #12534
> 
> The fetcher and recipetool are now aware of a 'latest' keyword for the version
> which allow to build the latest version available on the registry. This feature
> fixes the two issues: #10515, #11029
> 
> Moreover the issue #13415 should also be fixed but I cannot test it.
> 
> I have tested the recipe creation and builds using a self made example to
> generate build failures:
>  - https://github.com/savoirfairelinux/node-server-example
>  - https://npmjs.com/package/@savoirfairelinux/node-server-example
> 
> The test steps are these ones:
>   $ source poky/oe-init-build-env
>   $ bitbake-layers add-layer ../meta-openembedded/meta-oe
>   $ devtool add "npm://registry.npmjs.org;name=@savoirfairelinux/node-server-example;version=latest"
>   $ devtool build savoirfairelinux-node-server-example
>   $ bitbake-layers create-layer ../meta-test
>   $ bitbake-layers add-layer ../meta-test
>   $ devtool finish savoirfairelinux-node-server-example ../meta-test
>   $ echo IMAGE_INSTALL_append = '" savoirfairelinux-node-server-example"' >> conf/local.conf
>   $ bitbake core-image-minimal
> 
> Also the 'devtool add' url could be one of these:
>  - npm://registry.npmjs.org;name=@savoirfairelinux/node-server-example;version=latest
>    This url uses the new npm fetcher and request the latest version available on
>    the registry.
>  - npm://registry.npmjs.org;name=@savoirfairelinux/node-server-example;version=1.0.0
>    This url uses the new npm fetcher and request a fixed version.
>  - git://github.com/savoirfairelinux/node-server-example.git;protocol=https
>    This url uses the git fetcher. As the dependencies are managed by the NPM
>    class, any fetcher can be used.
> 
> When this patchset will be merged, I have planned to update the NPM wiki:
>   https://wiki.yoctoproject.org/wiki/TipsAndTricks/NPM
> 
> This patchset is also the base work for the full Angular support in Yocto that I
> am preparing. These applications have a huge dependency tree which is ideal to
> test the NPM support.
> 
> Jean-Marie LEMETAYER (6):
>   npm.bbclass: refactor the npm class
>   devtool: update command line options for npm
>   recipetool/create_npm.py: refactor the npm recipe creation handler
>   devtool/standard.py: update the append file for the npm recipes
>   recipetool/create.py: replace 'latest' keyword for npm
>   recipetool/create.py: remove the 'noverify' url parameter
> 
>  meta/classes/npm.bbclass             | 210 +++++++++----
>  scripts/lib/devtool/standard.py      |  22 +-
>  scripts/lib/recipetool/create.py     |  16 +-
>  scripts/lib/recipetool/create_npm.py | 444 ++++++++++-----------------
>  4 files changed, 331 insertions(+), 361 deletions(-)
> 
> --
> 2.20.1
> 


