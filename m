Return-Path: <tomas@novotny.cz>
X-Greylist: delayed 585 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 07 Feb 2018 21:08:58 UTC
Received: from hosting.pavoucek.net (hosting.pavoucek.net [46.28.107.168])
	by mail.openembedded.org (Postfix) with ESMTP id B74DE783C9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Feb 2018 21:08:58 +0000 (UTC)
Received: from tomas.local.tbs-biometrics.cz (unknown [176.74.132.138])
	(Authenticated sender: tomas@novotny.cz)
	by hosting.pavoucek.net (Postfix) with ESMTPSA id 24D56103FCF;
	Wed,  7 Feb 2018 21:59:14 +0100 (CET)
Date: Wed, 7 Feb 2018 21:59:13 +0100
From: Tomas Novotny <tomas@novotny.cz>
To: Joshua Watt <jpewhacker@gmail.com>
Message-ID: <20180207215913.1efc2300@tomas.local.tbs-biometrics.cz>
In-Reply-To: <cover.1517857764.git.JPEWhacker@gmail.com>
References: <cover.1517857764.git.JPEWhacker@gmail.com>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/14] Fix support for Icecream
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
X-List-Received-Date: Wed, 07 Feb 2018 21:08:59 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Joshua,

On Tue,  6 Feb 2018 16:01:19 -0600
Joshua Watt <jpewhacker@gmail.com> wrote:

> Fix up support for using Icecream to do distributed builds, which
> appears to have been broken for some time.

we were using icecream a year ago and we set ICECC_CARET_WORKAROUND env
variable to 0 (in set_icecc_env() in icecc.bbclass). The default is 1 and it
causes a local rebuild when any warning is emitted.

I don't have exact numbers, but the extreme case was opencv. There was so
many warnings that distributed build on ~10 threads was slower than local
build on 4 threads.

I know that it is some kind of configuration, but I would set the default to
0. Or do it at least configurable.

> In addition, Icecream support can now be enabled in the SDK. When
> enabled, the SDK install process will check if the host supports icecc
> and if so will construct a proper environment tarball and use it when
> compiling.

Thanks for work on that, I'm keen to use it in our environment.

Tomas

> Most of the changes should be straightforward. icecc-create-env has
> been almost completely re-written but the changes were broken up into
> hopefully logical chunks.
> 
> The following changes since commit 385944254d0ef88bd6450a221a54cbcb40020b42:
> 
>   tcmode-default.inc: drop preferred version of gzip-native (2018-01-31 17:01:20 +0000)
> 
> are available in the Git repository at:
> 
>   git://push.yoctoproject.org/poky-contrib jpew/icecream
> 
> Joshua Watt (14):
>   icecc.bbclass: Move to shared work directory
>   icecc.bbclass: Fix STAGING_BINDIR_TOOLCHAIN usage
>   icecc.bbclass: Skip canadian-cross compiles
>   icecc-create-env: Reformat
>   icecc-create-env: Add /bin/true to environment
>   icecc-create-env: Use program interpreter for deps
>   icecc-create-env: Symlink alternate names
>   icecc-create-env: Archive directory
>   icecc-create-env: Fix executable rpaths
>   icecc-create-env: Add support for nativesdk
>   icecc-create-env: Allow multiple tool aliases
>   toolchain-shar-extract: Add post-relocate scripts
>   icecc-toolchain: Add SDK icecream setup
>   icecc.bbclass: Add IceCream support to SDK
> 
>  meta/classes/icecc.bbclass                         |  37 ++-
>  meta/classes/toolchain-scripts.bbclass             |  15 +
>  meta/files/toolchain-shar-extract.sh               |   8 +
>  meta/recipes-core/meta/meta-environment.bb         |   2 +
>  .../icecc-create-env/icecc-create-env              | 328 ++++++++++++++-------
>  ...e-env-native_0.1.bb => icecc-create-env_0.1.bb} |   4 +-
>  .../icecc-toolchain/icecc-toolchain/icecc-env.sh   |  37 +++
>  .../icecc-toolchain/icecc-toolchain/icecc-setup.sh |  43 +++
>  .../nativesdk-icecc-toolchain_0.1.bb               |  38 +++
>  9 files changed, 390 insertions(+), 122 deletions(-)
>  rename meta/recipes-devtools/icecc-create-env/{icecc-create-env-native_0.1.bb => icecc-create-env_0.1.bb} (98%)
>  create mode 100644 meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-env.sh
>  create mode 100644 meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-setup.sh
>  create mode 100644 meta/recipes-devtools/icecc-toolchain/nativesdk-icecc-toolchain_0.1.bb
> 

