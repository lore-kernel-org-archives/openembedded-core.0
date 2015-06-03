Return-Path: <tanu.kaskinen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 91DC574050
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 11:18:19 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 03 Jun 2015 04:18:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,546,1427785200"; d="scan'208";a="740076116"
Received: from tkkaskin-mobl3.ger.corp.intel.com (HELO [10.252.2.204])
	([10.252.2.204])
	by orsmga002.jf.intel.com with ESMTP; 03 Jun 2015 04:18:20 -0700
Message-ID: <1433330298.2898.0.camel@tkkaskin-mobl3.ger.corp.intel.com>
From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 03 Jun 2015 14:18:18 +0300
In-Reply-To: <CAMKF1sqm97zeLZ5v70-BKW=+tPCn+w_bDibFkM2q6714kpABJg@mail.gmail.com>
References: <cover.1432320274.git.tanu.kaskinen@linux.intel.com>
	<e5260dbf168f3c51d9114e4c4cb1fca49abc83b1.1432320274.git.tanu.kaskinen@linux.intel.com>
	<1432448758.12832.67.camel@linuxfoundation.org>
	<3ABA6702-FFD6-448B-99B2-5DD5723A3AD3@gmail.com>
	<CAMKF1sqm97zeLZ5v70-BKW=+tPCn+w_bDibFkM2q6714kpABJg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - PL 281, 00181 Helsinki
X-Mailer: Evolution 3.10.4 (3.10.4-4.fc20) 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/5] alsa-plugins: initial recipe
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
X-List-Received-Date: Wed, 03 Jun 2015 11:18:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-05-27 at 21:48 -0700, Khem Raj wrote:
> On Wed, May 27, 2015 at 9:19 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >
> >> On May 23, 2015, at 11:25 PM, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> >>
> >> On Fri, 2015-05-22 at 21:51 +0300, Tanu Kaskinen wrote:
> >>> When PulseAudio is installed, alsa-plugins is needed to provide
> >>> compatibility for ALSA applications.
> >>>
> >>> The dependencies are set up so that pulseaudio-server depends on
> >>> alsa-plugins-pulseaudio-conf, and alsa-plugins-pulseaudio-conf depends
> >>> on the PulseAudio plugins. This should make the ALSA->PulseAudio
> >>> compatibility configuration work out of the box, while leaving the
> >>> PulseAudio specific configuration out on systems that don't have
> >>> pulseaudio-server installed.
> >>>
> >>> The alsa-plugins recipes in meta-guacamayo and meta-webos were used as
> >>> references, but this recipe is not a straight copy of either.
> >>>
> >>> Signed-off-by: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
> >>
> >> FWIW this new recipe failed on the autobuilder when it was tested in a
> >> multilib build:
> >>
> >> ERROR: QA Issue: lib32-alsa-plugins: Files/directories were installed
> >> but not shipped in any package:
> >>  /usr/lib32/alsa-lib/libasound_module_rate_speexrate_medium.so
> >>  /usr/lib32/alsa-lib/libasound_module_rate_samplerate_order.so
> >>  /usr/lib32/alsa-lib/libasound_module_rate_samplerate_medium.so
> >>  /usr/lib32/alsa-lib/libasound_module_rate_samplerate_best.so
> >>  /usr/lib32/alsa-lib/libasound_module_rate_samplerate_linear.so
> >>  /usr/lib32/alsa-lib/libasound_module_rate_speexrate_best.so
> >> Please set FILES such that these items are packaged. Alternatively if
> >> they are unneeded, avoid installing them or delete them within
> >> do_install. [installed-vs-shipped]
> >>
> >> I created a follow up patch:
> >>
> >> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t222&id=bd4f5e346550f961f7a1056661f9b9fefdc8fff6
> >>
> >> which fixed this and meant to merge it immediately after your commit
> >> however it looks like I squashed the patches accidentally. In comes down
> >> to the class extension code not being able to rewrite entries from
> >> PACKAGES_DYNAMIC.
> >
> >
> > There are more errors I am seeing, I wonder if they are parallel install issues
> >
> > | mv: cannot stat '/home/kraj/work/rdk/build-b2120-h412-a9/tmp/work/cortexa9hf-vfp-neon-rdk-linux-gnueabi/alsa-plugins/1.0.29-r0/image/usr/share/alsa/alsa.conf.d/99-pulseaudio-default.conf.example': No such file or directory
> > | WARNING: exit code 1 from a shell command.
> > | ERROR: Function failed: do_install (log file is located at /home/kraj/work/rdk/build-b2120-h412-a9/tmp/work/cortexa9hf-vfp-neon-rdk-linux-gnueabi/alsa-plugins/1.0.29-r0/temp/log.do_install.30933)
> > ERROR: Task 4117 (/home/kraj/work/rdk/openembedded-core/meta/recipes-multimedia/alsa/alsa-plugins_1.0.29.bb, do_install) failed with exit code '1'
> 
> I sent a patch to fix this but then there still are issues.
> 
> WARNING: QA Issue: alsa-plugins-pulseaudio-conf rdepends on
> libasound-module-conf-pulse, but it isn't a build dependency?
> [build-deps]
> WARNING: QA Issue: alsa-plugins-pulseaudio-conf rdepends on
> libasound-module-ctl-pulse, but it isn't a build dependency?
> [build-deps]
> WARNING: QA Issue: alsa-plugins-pulseaudio-conf rdepends on
> libasound-module-pcm-pulse, but it isn't a build dependency?
> [build-deps]

I now sent a fix for these warnings.

-- 
Tanu


