Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2FFBF600B3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 May 2015 06:26:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4O6QC8k025611; Sun, 24 May 2015 07:26:12 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id fMDhvaCrTVdr; Sun, 24 May 2015 07:26:12 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4O6PwNW025602
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 24 May 2015 07:26:10 +0100
Message-ID: <1432448758.12832.67.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
Date: Sun, 24 May 2015 07:25:58 +0100
In-Reply-To: <e5260dbf168f3c51d9114e4c4cb1fca49abc83b1.1432320274.git.tanu.kaskinen@linux.intel.com>
References: <cover.1432320274.git.tanu.kaskinen@linux.intel.com>
	<e5260dbf168f3c51d9114e4c4cb1fca49abc83b1.1432320274.git.tanu.kaskinen@linux.intel.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Sun, 24 May 2015 06:26:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-05-22 at 21:51 +0300, Tanu Kaskinen wrote:
> When PulseAudio is installed, alsa-plugins is needed to provide
> compatibility for ALSA applications.
> 
> The dependencies are set up so that pulseaudio-server depends on
> alsa-plugins-pulseaudio-conf, and alsa-plugins-pulseaudio-conf depends
> on the PulseAudio plugins. This should make the ALSA->PulseAudio
> compatibility configuration work out of the box, while leaving the
> PulseAudio specific configuration out on systems that don't have
> pulseaudio-server installed.
> 
> The alsa-plugins recipes in meta-guacamayo and meta-webos were used as
> references, but this recipe is not a straight copy of either.
> 
> Signed-off-by: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>

FWIW this new recipe failed on the autobuilder when it was tested in a
multilib build:

ERROR: QA Issue: lib32-alsa-plugins: Files/directories were installed
but not shipped in any package:
  /usr/lib32/alsa-lib/libasound_module_rate_speexrate_medium.so
  /usr/lib32/alsa-lib/libasound_module_rate_samplerate_order.so
  /usr/lib32/alsa-lib/libasound_module_rate_samplerate_medium.so
  /usr/lib32/alsa-lib/libasound_module_rate_samplerate_best.so
  /usr/lib32/alsa-lib/libasound_module_rate_samplerate_linear.so
  /usr/lib32/alsa-lib/libasound_module_rate_speexrate_best.so
Please set FILES such that these items are packaged. Alternatively if
they are unneeded, avoid installing them or delete them within
do_install. [installed-vs-shipped]

I created a follow up patch:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t222&id=bd4f5e346550f961f7a1056661f9b9fefdc8fff6

which fixed this and meant to merge it immediately after your commit
however it looks like I squashed the patches accidentally. In comes down
to the class extension code not being able to rewrite entries from
PACKAGES_DYNAMIC.

Cheers,

Richard


