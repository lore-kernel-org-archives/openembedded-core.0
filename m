Return-Path: <dv@pseudoterminal.org>
X-Greylist: delayed 593 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 28 Jul 2017 15:13:24 UTC
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 2E6BC784EB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 15:13:24 +0000 (UTC)
Received: from [10.1.14.248] (vpn.streamunlimited.com [91.114.0.140])
	by ptmx.org (Postfix) with ESMTPSA id 74AB94857F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 17:03:32 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <1499267003-20382-1-git-send-email-maxin.john@intel.com>
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <3a2e0473-4ff8-21c2-b5f9-0eef996413fe@pseudoterminal.org>
Date: Fri, 28 Jul 2017 17:03:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1499267003-20382-1-git-send-email-maxin.john@intel.com>
Subject: Re: [PATCH v3 00/12] gstreamer: upgrade to 1.12.1
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
X-List-Received-Date: Fri, 28 Jul 2017 15:13:25 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

What is the status of this? GStreamer is at 1.12.2 now, and these 
patches are still unmerged. What is the blocker here?


On 2017-07-05 17:03, Maxin B. John wrote:
> Upgrade gstreamer to 1.12.1
>
> Also upgrade libva to 1.8.3. This upgrade helps us to remove
> the workaround patch in gst-player - [YOCTO #11437]
>
> We "should" move to the new home of gst-player and upgrade it:
> https://cgit.freedesktop.org/gstreamer/gst-examples
>
> However, the buildsystem of gst-player moved to meson.
> Waiting for meson to be in oe-core for this transition.
>
> Changes in v2:
>      Handle remaming of plugins in gstreamer1.0-plugins-good
>
> Changes in v3:
>      Add new recipe for libva-utils and make libva RDEPEND on it
>      Rearrange the RPROVIDES in gstreamer1.0-plugins-good
>
> Maxin B. John (12):
>    gst-player: remove workaround which disable visualizations
>    gstreamer1.0: upgrade 1.10.4 -> 1.12.1
>    gstreamer1.0-plugins-base: upgrade 1.10.4 -> 1.12.1
>    gstreamer1.0-plugins-ugly: upgrade 1.10.4 -> 1.12.1
>    gstreamer1.0-rtsp-server: upgrade 1.10.4 -> 1.12.1
>    gstreamer1.0-omx: upgrade 1.10.4 -> 1.12.1
>    gstreamer1.0-libav: upgrade 1.10.4 -> 1.12.1
>    gstreamer1.0-vaapi: upgrade 1.10.4 -> 1.12.1
>    gstreamer1.0-plugins-bad: upgrade 1.10.4 -> 1.12.1
>    gstreamer1.0-plugins-good: upgrade 1.10.4 -> 1.12.1
>    libva-utils: add recipe
>    libva: upgrade to 1.8.3
>
>   ...-configure.ac-Use-wayland-scanner-in-PATH.patch |  37 -
>   ...and-Don-t-commit-and-ship-generated-files.patch | 339 --------
>   meta/recipes-graphics/libva/libva-utils_1.8.3.bb   |  30 +
>   .../libva/{libva_1.7.3.bb => libva_1.8.3.bb}       |   9 +-
>   .../0001-gtk-play-Disable-visualizations.patch     |  59 --
>   ...error-signal-emission-for-missing-plugins.patch | 252 ------
>   .../gstreamer/gst-player/Fix-pause-play.patch      | 107 ---
>   .../gstreamer/gst-player/filechooser.patch         |  54 --
>   .../recipes-multimedia/gstreamer/gst-player_git.bb |   4 -
>   ...ideobufferpool-create-allocator-if-needed.patch |  61 --
>   ...ibav_1.10.4.bb => gstreamer1.0-libav_1.12.1.bb} |   4 +-
>   .../gstreamer/gstreamer1.0-meta-base.bb            |   2 +-
>   ....0-omx_1.10.4.bb => gstreamer1.0-omx_1.12.1.bb} |   4 +-
>   .../gstreamer/gstreamer1.0-plugins-bad.inc         |  24 +-
>   ...-don-t-hardcode-libtool-name-when-running.patch |  60 +-
>   ...G_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch |  42 +-
>   ...gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch |  21 +-
>   ...1-mssdemux-improved-live-playback-support.patch | 929 ---------------------
>   ...ming-implement-adaptivedemux-s-get_live_s.patch | 183 ----
>   ...ming-use-the-duration-from-the-list-of-fr.patch |  62 --
>   ....10.4.bb => gstreamer1.0-plugins-bad_1.12.1.bb} |  11 +-
>   ...eed-more-buffers-in-output-queue-for-bett.patch |  32 -
>   ...10.4.bb => gstreamer1.0-plugins-base_1.12.1.bb} |   5 +-
>   ...Also-add-videometa-if-there-is-padding-to.patch |  35 -
>   ...10.4.bb => gstreamer1.0-plugins-good_1.12.1.bb} |   8 +-
>   .../gstreamer/gstreamer1.0-plugins-ugly.inc        |   1 -
>   ...10.4.bb => gstreamer1.0-plugins-ugly_1.12.1.bb} |   4 +-
>   .../gstreamer/gstreamer1.0-rtsp-server_1.10.4.bb   |   6 -
>   .../gstreamer/gstreamer1.0-rtsp-server_1.12.1.bb   |   6 +
>   .../gstreamer/gstreamer1.0-vaapi_1.10.4.bb         |   7 -
>   .../gstreamer/gstreamer1.0-vaapi_1.12.1.bb         |   5 +
>   meta/recipes-multimedia/gstreamer/gstreamer1.0.inc |   1 -
>   .../gstreamer1.0/deterministic-unwind.patch        |  29 +-
>   ...treamer1.0_1.10.4.bb => gstreamer1.0_1.12.1.bb} |   4 +-
>   34 files changed, 170 insertions(+), 2267 deletions(-)
>   delete mode 100644 meta/recipes-graphics/libva/files/0001-configure.ac-Use-wayland-scanner-in-PATH.patch
>   delete mode 100644 meta/recipes-graphics/libva/files/0001-wayland-Don-t-commit-and-ship-generated-files.patch
>   create mode 100644 meta/recipes-graphics/libva/libva-utils_1.8.3.bb
>   rename meta/recipes-graphics/libva/{libva_1.7.3.bb => libva_1.8.3.bb} (88%)
>   delete mode 100644 meta/recipes-multimedia/gstreamer/gst-player/0001-gtk-play-Disable-visualizations.patch
>   delete mode 100644 meta/recipes-multimedia/gstreamer/gst-player/Add-error-signal-emission-for-missing-plugins.patch
>   delete mode 100644 meta/recipes-multimedia/gstreamer/gst-player/Fix-pause-play.patch
>   delete mode 100644 meta/recipes-multimedia/gstreamer/gst-player/filechooser.patch
>   delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer-vaapi/vaapivideobufferpool-create-allocator-if-needed.patch
>   rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.10.4.bb => gstreamer1.0-libav_1.12.1.bb} (88%)
>   rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.10.4.bb => gstreamer1.0-omx_1.12.1.bb} (69%)
>   delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-mssdemux-improved-live-playback-support.patch
>   delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-smoothstreaming-implement-adaptivedemux-s-get_live_s.patch
>   delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-smoothstreaming-use-the-duration-from-the-list-of-fr.patch
>   rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.10.4.bb => gstreamer1.0-plugins-bad_1.12.1.bb} (61%)
>   delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/encodebin-Need-more-buffers-in-output-queue-for-bett.patch
>   rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.10.4.bb => gstreamer1.0-plugins-base_1.12.1.bb} (78%)
>   delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2object-Also-add-videometa-if-there-is-padding-to.patch
>   rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.10.4.bb => gstreamer1.0-plugins-good_1.12.1.bb} (77%)
>   rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.10.4.bb => gstreamer1.0-plugins-ugly_1.12.1.bb} (76%)
>   delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.4.bb
>   create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.1.bb
>   delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.10.4.bb
>   create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.12.1.bb
>   rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.10.4.bb => gstreamer1.0_1.12.1.bb} (72%)
>


