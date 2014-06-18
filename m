Return-Path: <tklauser@sym2.noone.org>
X-Greylist: delayed 344 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 18 Jun 2014 13:05:34 UTC
Received: from sym2.noone.org (sym2.noone.org [178.63.92.236])
	by mail.openembedded.org (Postfix) with ESMTP id 270756FDD2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jun 2014 13:05:34 +0000 (UTC)
Received: by sym2.noone.org (Postfix, from userid 1002)
	id 1AA1D135A020; Wed, 18 Jun 2014 14:59:49 +0200 (CEST)
Date: Wed, 18 Jun 2014 14:59:49 +0200
From: Tobias Klauser <tklauser@distanz.ch>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20140618125948.GD16897@distanz.ch>
References: <1402058035-11177-1-git-send-email-tklauser@distanz.ch>
	<5399D671.5040403@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <5399D671.5040403@linux.intel.com>
X-Editor: Vi IMproved 7.3
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] powertop: upgrade from 2.5 to 2.6.1
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
X-List-Received-Date: Wed, 18 Jun 2014 13:05:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Saul

On 2014-06-12 at 18:33:53 +0200, Saul Wold <sgw@linux.intel.com> wrote:
> On 06/06/2014 05:33 AM, Tobias Klauser wrote:
> >Upgrade powertop from 2.5 to 2.6.1. Also adjust to the new upstream
> >download URL.
> >
> >Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
> >---
> >  .../{powertop_2.5.bb => powertop_2.6.1.bb}         |    6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >  rename meta/recipes-kernel/powertop/{powertop_2.5.bb => powertop_2.6.1.bb} (81%)
> >
> >diff --git a/meta/recipes-kernel/powertop/powertop_2.5.bb b/meta/recipes-kernel/powertop/powertop_2.6.1.bb
> >similarity index 81%
> >rename from meta/recipes-kernel/powertop/powertop_2.5.bb
> >rename to meta/recipes-kernel/powertop/powertop_2.6.1.bb
> >index 86a7f60..6a293bc 100644
> >--- a/meta/recipes-kernel/powertop/powertop_2.5.bb
> >+++ b/meta/recipes-kernel/powertop/powertop_2.6.1.bb
> >@@ -6,10 +6,10 @@ DEPENDS = "ncurses libnl pciutils"
> >  LICENSE = "GPLv2"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
> >
> >-SRC_URI = "http://01.org/powertop/sites/default/files/downloads/powertop-${PV}.tar.gz"
> >+SRC_URI = "http://01.org/sites/default/files/downloads/powertop/powertop-${PV}.tar.gz"
> >
> >-SRC_URI[md5sum] = "806bbcbd44fcea1f807c9582fc1f7d3e"
> >-SRC_URI[sha256sum] = "8b2c08a555d79e1c428863470c41cb023971d74ba4801d80a05e35adeec23c0b"
> >+SRC_URI[md5sum] = "4391e7b0af854ecf722cdf712f24b631"
> >+SRC_URI[sha256sum] = "034cde6d5bb433fe0d29251d5cde5d4c2948abf05fe29ef10966b659331b20e4"
> >
> >  inherit autotools gettext pkgconfig
> >
> >
> I know this seems like a simple change, but it may have introduced a
> parallel make issue:

[...]

> Please review this error, we are building with PARALLEL_MAKE = "-j 16"

Thanks for the notice. I didn't get the error when I was initially
testing the change, but then noticed that I was working against an
outdated oe-core version. When building with an up-to-date oe-core I see
the errors as well, but regardless of value the PARALLEL_MAKE - even for
non-parallel builds.

I've been spending a considerable amount of time investigating this and
unfortunately didn't find a solution yet. Strange enough it doesn't
happen at all when building with the vanilla upstream source (parallel
and non-parallel build, build directory outside of source directory).

The cause for the errors seems to be the fact that build/src/tuning/
is not created but all other src/ subdirectories are. There was a patch
applied to upstream [1] removing the src/tuning directory from
powertop_SOURCES in Makefile.am, but it doesn't seem to make any
difference whether it is applied or not.

[1] https://github.com/fenrus75/powertop/commit/f446b66124132c9e38b6c5559ea06f021846b596

Any help on further investigating this issue would be appreciated...

Thanks
Tobias

