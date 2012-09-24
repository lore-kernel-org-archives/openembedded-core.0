Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TGGmY-00027j-4x
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Sep 2012 00:05:38 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 24 Sep 2012 14:52:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,477,1344236400"; d="scan'208";a="148580324"
Received: from unknown (HELO [10.255.14.15]) ([10.255.14.15])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Sep 2012 14:52:47 -0700
Message-ID: <5060D62F.1000901@linux.intel.com>
Date: Mon, 24 Sep 2012 14:52:47 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Matthew McClintock <msm@freescale.com>
References: <1348516546-26005-1-git-send-email-msm@freescale.com>
	<1348516546-26005-2-git-send-email-msm@freescale.com>
In-Reply-To: <1348516546-26005-2-git-send-email-msm@freescale.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] libx11: fix nativesdk build on older distros
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Sep 2012 22:05:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/24/2012 12:55 PM, Matthew McClintock wrote:
> makekeys-makekeys.o: In function `main':
> makekeys.c:(.text+0x85): undefined reference to `__isoc99_sscanf'
> makekeys.c:(.text+0xa7): undefined reference to `__isoc99_sscanf'
> collect2: ld returned 1 exit status
> make: *** [makekeys] Error 1
>
> Older libc do not have this defined, we can use the -D_GNU_SOURCE
> to the compiler to prevent generating calls to this function and
> make linking work
>
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
>   .../xorg-lib/libx11/use_host_cc_for_utils.patch    |   12 ++++++++++++
>   meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb     |    3 ++-
>   2 files changed, 14 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-graphics/xorg-lib/libx11/use_host_cc_for_utils.patch
>
> diff --git a/meta/recipes-graphics/xorg-lib/libx11/use_host_cc_for_utils.patch b/meta/recipes-graphics/xorg-lib/libx11/use_host_cc_for_utils.patch
> new file mode 100644
> index 0000000..08ba39a
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-lib/libx11/use_host_cc_for_utils.patch

This patch needs a header!


> @@ -0,0 +1,12 @@
> +Index: libX11-1.5.0/src/Makefile.am
> +===================================================================
> +--- libX11-1.5.0.orig/src/Makefile.am
> ++++ libX11-1.5.0/src/Makefile.am
> +@@ -420,6 +420,6 @@ ks_tables.h: $(KEYSYMDEFS) $(top_builddi
> + 	mv ks_tables_h $@
> +
> + $(top_builddir)/src/util/makekeys$(EXEEXT): force
> +-	cd util && $(MAKE)
> ++	cd util && $(MAKE) CC=gcc CCLD=gcc LDFLAGS= CFLAGS=-D_GNU_SOURCE

Is hardcoding 'gcc' here really the right thing to do?
> +
> + force:
> diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
> index 94e2051..3e00dd8 100644
> --- a/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
> +++ b/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
> @@ -1,11 +1,12 @@
>   require libx11.inc
>   inherit gettext
>
> -PR = "${INC_PR}.2"
> +PR = "${INC_PR}.3"
>
>   BBCLASSEXTEND = "native nativesdk"
>
>   SRC_URI += "file://keysymdef_include.patch"
> +SRC_URI_append_virtclass-nativesdk += "file://use_host_cc_for_utils.patch"
>
>   SRC_URI[md5sum] = "78b4b3bab4acbdf0abcfca30a8c70cc6"
>   SRC_URI[sha256sum] = "c382efd7e92bfc3cef39a4b7f1ecf2744ba4414a705e3bc1e697f75502bd4d86"
>


