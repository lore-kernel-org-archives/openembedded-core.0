Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SOxwL-0006sm-Rh
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Apr 2012 23:15:26 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 30 Apr 2012 14:05:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="137159412"
Received: from unknown (HELO [10.255.12.182]) ([10.255.12.182])
	by azsmga001.ch.intel.com with ESMTP; 30 Apr 2012 14:05:42 -0700
Message-ID: <4F9EFEA5.1080407@linux.intel.com>
Date: Mon, 30 Apr 2012 14:05:41 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1334159995-3392-1-git-send-email-florin.sarbu@windriver.com>
In-Reply-To: <1334159995-3392-1-git-send-email-florin.sarbu@windriver.com>
Subject: Re: [PATCH] vala: Add vala package as a devtool (version 0.12.1)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Apr 2012 21:15:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2012 08:59 AM, Florin Sarbu wrote:
> Added the vala package from meta-oe to support future systemd integration.
>
> Signed-off-by: Florin Sarbu<florin.sarbu@windriver.com>
> ---
>   meta/recipes-devtools/vala/vala.inc       |   25 +++++++++++++++++++++++++
>   meta/recipes-devtools/vala/vala_0.12.1.bb |    7 +++++++
>   2 files changed, 32 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-devtools/vala/vala.inc
>   create mode 100644 meta/recipes-devtools/vala/vala_0.12.1.bb
>
> diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/vala/vala.inc
> new file mode 100644
> index 0000000..0815c66
> --- /dev/null
> +++ b/meta/recipes-devtools/vala/vala.inc
> @@ -0,0 +1,25 @@
> +DESCRIPTION = "Vala is a C#-like language dedicated to ease GObject programming. \
> +Vala compiles to plain C and has no runtime environment nor penalities whatsoever."
> +SECTION = "devel"
> +DEPENDS = "glib-2.0 dbus"
> +BBCLASSEXTEND = "native"
> +DEPENDS_virtclass-native = "glib-2.0-native dbus-native"
> +HOMEPAGE = "http://vala-project.org"
> +LICENSE = "LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
> +INC_PR = "r0"
> +
> +#
> +# WARNING: This source release has specifically been built for OpenEmbedded.
> +# Don't update to any upstream release without consulting the recipe maintainer.
> +#
> +
> +SRC_URI = "\
> +  http://downloads.freesmartphone.org/sources/vala-${PV}.tar.bz2;name=archive \
> +"
In the above comment you mention not to update the SRC_URI here, but 
below in the actual .bb file you override the SRC_URI with the 
ftp.gnome.org version, is that the correct one?

Also, until we get serious about systemd in poky, I think this patch 
will be on hold, it is something we are going to work on for 1.3.
> +
> +inherit autotools
> +
> +EXTRA_OECONF = "--disable-vapigen"
> +
> +FILES_${PN}-doc += "${datadir}/devhelp"
> diff --git a/meta/recipes-devtools/vala/vala_0.12.1.bb b/meta/recipes-devtools/vala/vala_0.12.1.bb
> new file mode 100644
> index 0000000..1049ed6
> --- /dev/null
> +++ b/meta/recipes-devtools/vala/vala_0.12.1.bb
> @@ -0,0 +1,7 @@
> +require vala.inc
> +SRC_URI = "ftp://ftp.gnome.org/pub/GNOME/sources/vala/0.12/vala-${PV}.tar.bz2"
> +
> +FILES_${PN} += "${datadir}/vala-0.12/vapi"
> +
> +SRC_URI[md5sum] = "bf35262cc611de447147d01cbac33767"
> +SRC_URI[sha256sum] = "d9a2be21bb8ab88eab838e7f3a4d0aaa2a1fddf35615dca32bef6a0051f58ea8"


