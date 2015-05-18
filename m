Return-Path: <tanu.kaskinen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id EE9CF609B2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 12:40:49 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 18 May 2015 05:40:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,453,1427785200"; d="scan'208";a="731113908"
Received: from tkkaskin-mobl3.ger.corp.intel.com (HELO
	tkkaskin-mobl3.ger.corp.intel.com.ger.corp.intel.com)
	([10.252.29.132])
	by orsmga002.jf.intel.com with ESMTP; 18 May 2015 05:40:44 -0700
From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 May 2015 15:40:38 +0300
Message-Id: <1431952843-25139-1-git-send-email-tanu.kaskinen@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH 0/5] Enable PulseAudio in Sato images
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
X-List-Received-Date: Mon, 18 May 2015 12:40:50 -0000

These patches fix YOCTO#7517.

ALSA configuration is set up so that the default ALSA device is the
PulseAudio plugin, so ALSA applications still work when PulseAudio is
using the audio hardware.

There's one quirk that can cause some confusion sometimes: the
PulseAudio server will auto-exit in 20 seconds after the last client
has disconnected. This shouldn't generally be a problem, because the
server will automatically start again when the next client tries to
connect. On a more "normal" system PulseAudio would not exit until the
user login session has terminated, but it seems that the graphical
session in Sato doesn't register as a session in ConsoleKit, so
PulseAudio doesn't know when the session ends.

Tanu Kaskinen (5):
  alsa-plugins: initial recipe
  pulseaudio: client-conf: Add allow-autospawn-for-root
  pulseaudio: move client.conf to a separate package
  pulseaudio-client-conf-sato: initial recipe
  packagegroup-core-x11-sato: add PulseAudio

 .../recipes-multimedia/alsa/alsa-plugins_1.0.29.bb | 81 +++++++++++++++++++
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  | 20 +++--
 ...-client-conf-Add-allow-autospawn-for-root.patch | 92 ++++++++++++++++++++++
 .../pulseaudio/pulseaudio_6.0.bb                   |  1 +
 .../packagegroups/packagegroup-core-x11-sato.bb    |  2 +
 .../pulseaudio-client-conf-sato/client.conf        |  7 ++
 .../pulseaudio-client-conf-sato_1.bb               | 20 +++++
 7 files changed, 216 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-plugins_1.0.29.bb
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-client-conf-Add-allow-autospawn-for-root.patch
 create mode 100644 meta/recipes-sato/pulseaudio-sato/pulseaudio-client-conf-sato/client.conf
 create mode 100644 meta/recipes-sato/pulseaudio-sato/pulseaudio-client-conf-sato_1.bb

-- 
1.9.3


