Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa09-08.prod.phx3.secureserver.net
	(p3plsmtpa09-08.prod.phx3.secureserver.net [173.201.193.237])
	by mail.openembedded.org (Postfix) with ESMTP id 1854E72341
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Dec 2014 00:31:31 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa09-08.prod.phx3.secureserver.net with 
	id PcXX1p00N0BVjqb01cXYib; Thu, 04 Dec 2014 17:31:32 -0700
Message-ID: <5480FCE3.7060601@pabigot.com>
Date: Thu, 04 Dec 2014 18:31:31 -0600
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1417030958.git.pab@pabigot.com>
In-Reply-To: <cover.1417030958.git.pab@pabigot.com>
Subject: Re: [RFC v2 0/9] Proposed solution to bluez4/bluez5 selection
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
X-List-Received-Date: Fri, 05 Dec 2014 00:31:36 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Any feedback on this approach?

Thanks.

Peter

On 11/26/2014 01:46 PM, Peter A. Bigot wrote:
> Here's a new approach to bluez5 integration for YOCTO #5031 based on
> RP's feedback from the last attempt.
>
> Though the lib interface is supposedly compatible between bluez4 and
> bluez5 the dbus interface is not.  The functionality differences are
> currently significant and likely to remain so. Therefore there will be
> no virtual/bluez as originally proposed in the defect report.
>
> Selection of the provider of bluetooth services is mediated by
> DISTRO_FEATURES.  As has been the case, "bluetooth" signifies support
> for bluetooth.  Two new identifiers "bluez4" and "bluez5" distinguish
> the provider of bluetooth services, just as "systemd" and "sysvinit"
> distinguish the provider of init services.
>
> Recipes that reference bluetooth now inherit from bluetooth.bbclass,
> which inspects the DISTRO_FEATURES and provides the variable BLUEZ as a
> default-defined variable with the value:
>   "" if "bluetooth" is not in DISTRO_FEATURES, else
>   "bluez5" if "bluez5" is in DISTRO_FEATURES, else
>   "bluez4"
>
> The presence of "bluez4" or "bluez5" in PACKAGECONFIG is normally used
> to control configuration.  (In some cases this is an "interface change"
> with respect to PACKAGECONFIG values for specific recipes but I don't
> see an alternative where existing keys are insufficiently precise.)
>
> The assumption is most packages will support either bluez4 or bluez5.
> Existing packages that used "bluetooth" or "bluez" as the key to select
> an explicit dependence on bluez4 have mostly been changed to use
> "bluez4" as the key.
>
> Where a package (e.g. pulseaudio) supports both variants with distinct
> configuration options PACKAGECONFIG settings for both "bluez4" and
> "bluez5" should be provided.
>
> Where a package (e.g. connman) supports both variants without distinct
> configuration options the PACKAGECONFIG setting should be "bluez" and
> the dependence will be on "${BLUEZ}".
>
> The following changes since commit ab63640fad50954b0440ab107c96dbd3f919ea4d:
>
>    gdk-pixbuf: use ptest-gnome (2014-11-25 13:03:30 +0000)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib pabigot/rfc-v2/bluez5
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pabigot/rfc-v2/bluez5
>
> Peter A. Bigot (9):
>    bluetooth.bbclass: simplify recipe inference of bluetooth provider
>    packagegroup-base: select distro preference for bluez provider
>    pulseaudio: select distro preference for bluez provider
>    qt-mobility: select distro preference for bluez provider
>    gstreamer1.0-plugins-bad: select distro preference for bluez provider
>    ofono: select distro preference for bluez provider
>    neard: select distro preference for bluez provider
>    libpcap: select distro preference for bluez provider
>    connman: depend on distro provider of bluez
>
>   meta/classes/bluetooth.bbclass                             | 14 ++++++++++++++
>   meta/recipes-connectivity/connman/connman.inc              |  6 ++++--
>   meta/recipes-connectivity/libpcap/libpcap.inc              |  6 ++++--
>   meta/recipes-connectivity/neard/neard.inc                  |  4 ++--
>   meta/recipes-connectivity/ofono/ofono.inc                  |  4 ++--
>   meta/recipes-core/packagegroups/packagegroup-base.bb       |  3 ++-
>   .../gstreamer/gstreamer1.0-plugins-bad.inc                 |  6 +++---
>   .../gstreamer/gstreamer1.0-plugins-bad_git.bb              |  1 -
>   meta/recipes-multimedia/pulseaudio/pulseaudio.inc          |  4 ++--
>   meta/recipes-qt/qt4/qt-mobility_1.2.0.inc                  |  6 ++++--
>   10 files changed, 37 insertions(+), 17 deletions(-)
>   create mode 100644 meta/classes/bluetooth.bbclass
>


