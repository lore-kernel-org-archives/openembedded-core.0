Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 91DDB60132
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 14:30:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 1131B5188036
Message-ID: <1435329011.3376.6.camel@collabora.co.uk>
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Jun 2015 15:30:11 +0100
In-Reply-To: <0c6156d62bf9efb1b6982987a67049ce25410ee0.1435174534.git.jussi.kukkonen@intel.com>
References: <cover.1435174534.git.jussi.kukkonen@intel.com>
	<0c6156d62bf9efb1b6982987a67049ce25410ee0.1435174534.git.jussi.kukkonen@intel.com>
X-Mailer: Evolution 3.16.3 (3.16.3-2.fc22) 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] dbus: CVE-2015-0245: prevent forged ActivationFailure
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
X-List-Received-Date: Fri, 26 Jun 2015 14:30:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-06-24 at 23:06 +0300, Jussi Kukkonen wrote:
> Fix CVE-2015-0245 by preventing non-root and non-systemd processes
> from fooling the dbus daemon into thinking systemd service activation
> failed.

Thanks Jussi,

This is queued in my fido-next branch[1].

Regards,

Joshua

1. http://cgit.openembedded.org/openembedded-core
-contrib/log/?h=joshuagl/fido-next

> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
>  meta/recipes-core/dbus/dbus.inc                    |  1 +
>  ...015-0245-prevent-forged-ActivationFailure.patch | 48 
> ++++++++++++++++++++++
>  2 files changed, 49 insertions(+)
>  create mode 100644 meta/recipes-core/dbus/dbus/CVE-2015-0245-prevent
> -forged-ActivationFailure.patch
> 
> diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes
> -core/dbus/dbus.inc
> index fb5d017..f1744c8 100644
> --- a/meta/recipes-core/dbus/dbus.inc
> +++ b/meta/recipes-core/dbus/dbus.inc
> @@ -17,6 +17,7 @@ SRC_URI = "
> http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
>             file://dbus-1.init \
>             file://os-test.patch \
>             file://clear-guid_from_server-if
> -send_negotiate_unix_f.patch \
> +           file://CVE-2015-0245-prevent-forged
> -ActivationFailure.patch \
>  "
>  
>  inherit useradd autotools pkgconfig gettext update-rc.d
> diff --git a/meta/recipes-core/dbus/dbus/CVE-2015-0245-prevent-forged
> -ActivationFailure.patch b/meta/recipes-core/dbus/dbus/CVE-2015-0245
> -prevent-forged-ActivationFailure.patch
> new file mode 100644
> index 0000000..59363b3
> --- /dev/null
> +++ b/meta/recipes-core/dbus/dbus/CVE-2015-0245-prevent-forged
> -ActivationFailure.patch
> @@ -0,0 +1,48 @@
> +CVE-2015-0245: prevent forged ActivationFailure from non-root 
> processes
> +
> +Upstream has fixed this in code but suggests using this as a easily
> +backportable fix: https://bugs.freedesktop.org/show_bug.cgi?id=88811
> +
> +Upstream-Status: Inappropriate
> +Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +
> +
> +
> +From 91eb2ea3362630190e08c1c777c47bae065ac828 Mon Sep 17 00:00:00 
> 2001
> +From: Simon McVittie <simon.mcvittie@collabora.co.uk>
> +Date: Mon, 26 Jan 2015 20:09:56 +0000
> +Subject: [PATCH 1/3] CVE-2015-0245: prevent forged ActivationFailure 
> from
> + non-root processes
> +
> +Without either this rule or better checking in dbus-daemon, non
> -systemd
> +processes can make dbus-daemon think systemd failed to activate a 
> system
> +service, resulting in an error reply back to the requester.
> +
> +This is redundant with the fix in the C code (which I consider to be
> +the real solution), but is likely to be easier to backport.
> +---
> + bus/system.conf.in | 8 ++++++++
> + 1 file changed, 8 insertions(+)
> +
> +diff --git a/bus/system.conf.in b/bus/system.conf.in
> +index 92f4cc4..851b9e6 100644
> +--- a/bus/system.conf.in
> ++++ b/bus/system.conf.in
> +@@ -68,6 +68,14 @@
> +     <deny send_destination="org.freedesktop.DBus"
> +           send_interface="org.freedesktop.DBus"
> +           send_member="UpdateActivationEnvironment"/>
> ++    <deny send_destination="org.freedesktop.DBus"
> ++          send_interface="org.freedesktop.systemd1.Activator"/>
> ++  </policy>
> ++
> ++  <!-- Only systemd, which runs as root, may report activation 
> failures. -->
> ++  <policy user="root">
> ++    <allow send_destination="org.freedesktop.DBus"
> ++           send_interface="org.freedesktop.systemd1.Activator"/>
> +   </policy>
> + 
> +   <!-- Config files are placed here that among other things, punch 
> +-- 
> +2.1.4
> +

