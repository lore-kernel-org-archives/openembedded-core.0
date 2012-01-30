Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rrujj-0001ai-Pw
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2012 18:09:48 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 30 Jan 2012 09:01:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="101929377"
Received: from unknown (HELO [10.255.14.96]) ([10.255.14.96])
	by orsmga001.jf.intel.com with ESMTP; 30 Jan 2012 09:01:53 -0800
Message-ID: <4F26CD01.4050700@linux.intel.com>
Date: Mon, 30 Jan 2012 09:01:53 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1327795253-24794-1-git-send-email-schnitzeltony@googlemail.com>
	<1327795253-24794-2-git-send-email-schnitzeltony@googlemail.com>
In-Reply-To: <1327795253-24794-2-git-send-email-schnitzeltony@googlemail.com>
Subject: Re: [PATCH v2 1/1] atk: add native / disable introspection / merge atk.inc->recipe / change license
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
X-List-Received-Date: Mon, 30 Jan 2012 17:09:48 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/28/2012 04:00 PM, Andreas Müller wrote:
> Native support currently is appended in meta-oe. Native build failed with:
>
> | /usr/share/gir-1.0/GLib-2.0.gir:9:1: error: Unsupported version '1.1'
> | /usr/share/gir-1.0/GLib-2.0.gir:9:39: error: Unsupported version '1.1'
> | error parsing file Atk-1.0.gir: Failed to parse included gir GLib-2.0
> | make[3]: *** [Atk-1.0.typelib] Error 1
>
> build tested in meta-oe / angstrom environment
>
> Signed-off-by: Andreas Müller<schnitzeltony@googlemail.com>
> ---
>   meta/recipes-support/atk/atk.inc      |   13 -------------
>   meta/recipes-support/atk/atk_2.2.0.bb |   17 +++++++++++++----
>   2 files changed, 13 insertions(+), 17 deletions(-)
>   delete mode 100644 meta/recipes-support/atk/atk.inc
>
> diff --git a/meta/recipes-support/atk/atk.inc b/meta/recipes-support/atk/atk.inc
> deleted file mode 100644
> index 6a4fef6..0000000
> --- a/meta/recipes-support/atk/atk.inc
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -DESCRIPTION = "An accessibility toolkit for GNOME."
> -HOMEPAGE = "http://live.gnome.org/GAP/"
> -BUGTRACKER = "https://bugzilla.gnome.org/"
> -
> -LICENSE = "LGPLv2&  LGPLv2+"
> -
> -SECTION = "x11/libs"
> -
> -DEPENDS = "glib-2.0 gtk-doc-native"
> -
> -inherit autotools pkgconfig
> -
> -EXTRA_OECONF = "--disable-glibtest"
> diff --git a/meta/recipes-support/atk/atk_2.2.0.bb b/meta/recipes-support/atk/atk_2.2.0.bb
> index 0d657b5..74e7288 100644
> --- a/meta/recipes-support/atk/atk_2.2.0.bb
> +++ b/meta/recipes-support/atk/atk_2.2.0.bb
> @@ -1,14 +1,23 @@
> -require atk.inc
> +DESCRIPTION = "An accessibility toolkit for GNOME."
> +HOMEPAGE = "http://live.gnome.org/GAP/"
> +BUGTRACKER = "https://bugzilla.gnome.org/"
> +SECTION = "x11/libs"
>
> -PR = "r1"
> +LICENSE = "GPLv2+&  LGPLv2+"
Not sure what you changed here, but you did not fix this as Khem 
suggested.  Also, if you are making LICENSE changes the note you 
included in your 00 Patch email should really be in the Commit message 
instead.

Thanks
	Sau!

>   LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
>                       file://atk/atkutil.c;endline=20;md5=db21b0bdbef9da4dc6eb122debc9f9bc \
>                       file://atk/atk.h;endline=20;md5=c58238d688c24387376d6c69d06248a7"
> +PR = "r2"
>
> -SRC_URI = "http://download.gnome.org/sources/atk/2.2/${BPN}-${PV}.tar.bz2"
> +DEPENDS = "glib-2.0 gtk-doc-native"
> +
> +inherit autotools pkgconfig
>
> +SRC_URI = "http://download.gnome.org/sources/atk/2.2/${BPN}-${PV}.tar.bz2"
>   SRC_URI[md5sum] = "4894e9b04f0a9f1c37a624a1e8d6d73f"
>   SRC_URI[sha256sum] = "d201e3f5808aef0b1aec2277bfa61074f68863e405428adb57a73aab5c838450"
>
> +BBCLASSEXTEND = "native"
>
> -
> +EXTRA_OECONF = "--disable-glibtest \
> +                --disable-introspection"


