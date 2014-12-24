Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 64FA772640
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Dec 2014 17:56:23 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 24 Dec 2014 09:56:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,691,1406617200"; d="scan'208";a="503687198"
Received: from aeadams-mobl.ger.corp.intel.com (HELO localhost.localdomain)
	([10.255.13.204])
	by orsmga003.jf.intel.com with ESMTP; 24 Dec 2014 09:51:37 -0800
Message-ID: <549AFE46.50303@linux.intel.com>
Date: Wed, 24 Dec 2014 09:56:22 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Hongxu Jia <hongxu.jia@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <cover.1419309149.git.hongxu.jia@windriver.com>
	<960042129c61baae9bdf304c256f8d2e8dd578da.1419309149.git.hongxu.jia@windriver.com>
In-Reply-To: <960042129c61baae9bdf304c256f8d2e8dd578da.1419309149.git.hongxu.jia@windriver.com>
Subject: Re: [PATCH 6/6] groff: upgrade 1.22.3
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
X-List-Received-Date: Wed, 24 Dec 2014 17:56:24 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 12/22/2014 09:09 PM, Hongxu Jia wrote:
> Rebase groff-1.22.2-correct-man.local-install-path.patch to 1.22.3
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   ...off-1.22.2-correct-man.local-install-path.patch | 32 ---------------
>   ...off-1.22.3-correct-man.local-install-path.patch | 45 ++++++++++++++++++++++

Does it make more sense not to have the version in the patch name if we 
are going to carry it forward?

>   .../groff/{groff_1.22.2.bb => groff_1.22.3.bb}     |  6 +--

The new version of groff seems to depend on Perl now for a couple of 
scripts (grog and BuildFoundries), please double check your RDEPENDS.

Thanks
	Sau!

>   3 files changed, 48 insertions(+), 35 deletions(-)
>   delete mode 100644 meta/recipes-extended/groff/groff-1.22.2/groff-1.22.2-correct-man.local-install-path.patch
>   create mode 100644 meta/recipes-extended/groff/groff-1.22.3/groff-1.22.3-correct-man.local-install-path.patch
>   rename meta/recipes-extended/groff/{groff_1.22.2.bb => groff_1.22.3.bb} (90%)
>
> diff --git a/meta/recipes-extended/groff/groff-1.22.2/groff-1.22.2-correct-man.local-install-path.patch b/meta/recipes-extended/groff/groff-1.22.2/groff-1.22.2-correct-man.local-install-path.patch
> deleted file mode 100644
> index f7e9a74..0000000
> --- a/meta/recipes-extended/groff/groff-1.22.2/groff-1.22.2-correct-man.local-install-path.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -Correct the install path of man.local to fix following error:
> -    /yocto/build/tmp/sysroots/x86_64-linux/usr/share/groff/1.22.2/tmac/an-old.tmac:690: warning: can't find macro file `man.local'
> -
> -Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
> -Upstream-Status: Pending
> -
> ---- groff-1.22.2/tmac/Makefile.sub.orig	2013-02-07 20:06:08.000000000 +0800
> -+++ groff-1.22.2/tmac/Makefile.sub	2013-06-26 19:11:23.572259001 +0800
> -@@ -114,9 +114,9 @@
> - 	  rm -f $(DESTDIR)$(mdocdir)/$$f; \
> - 	  $(INSTALL_DATA) $$f-s $(DESTDIR)$(mdocdir)/$$f; \
> - 	done
> --	-test -f $(DESTDIR)$(localtmacdir)/man.local || \
> -+	-test -f $(DESTDIR)$(tmacdir)/man.local || \
> - 	  $(INSTALL_DATA) $(srcdir)/man.local \
> --	    $(DESTDIR)$(localtmacdir)/man.local
> -+	    $(DESTDIR)$(tmacdir)/man.local
> - 	-test -f $(DESTDIR)$(localtmacdir)/mdoc.local || \
> - 	  $(INSTALL_DATA) mdoc.local-s $(DESTDIR)$(localtmacdir)/mdoc.local
> -
> -@@ -158,9 +158,9 @@
> - 	-rm -f $(DESTDIR)$(tmacdir)/$(tmac_s_prefix)s.tmac
> - 	-rm -f $(DESTDIR)$(tmacdir)/$(tmac_an_prefix)an.tmac
> - 	-rm -f $(DESTDIR)$(tmacdir)/www.tmac
> --	-if cmp -s $(DESTDIR)$(localtmacdir)/man.local \
> -+	-if cmp -s $(DESTDIR)$(tmacdir)/man.local \
> - 	           $(srcdir)/man.local; then \
> --	  rm -f $(DESTDIR)$(localtmacdir)/man.local; \
> -+	  rm -f $(DESTDIR)$(tmacdir)/man.local; \
> - 	fi
> - 	-if cmp -s $(DESTDIR)$(localtmacdir)/mdoc.local \
> - 	           $(srcdir)/mdoc.local; then \
> diff --git a/meta/recipes-extended/groff/groff-1.22.3/groff-1.22.3-correct-man.local-install-path.patch b/meta/recipes-extended/groff/groff-1.22.3/groff-1.22.3-correct-man.local-install-path.patch
> new file mode 100644
> index 0000000..e5db6cf
> --- /dev/null
> +++ b/meta/recipes-extended/groff/groff-1.22.3/groff-1.22.3-correct-man.local-install-path.patch
> @@ -0,0 +1,45 @@
> +Correct the install path of man.local to fix following error:
> +
> + /yocto/build/tmp/sysroots/x86_64-linux/usr/share/groff/1.22.2/tmac/an-old.tmac:690:
> + warning: can't find macro file `man.local'
> +
> +Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
> +Upstream-Status: Pending
> +
> +Rebase to 1.22.3
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + tmac/Makefile.sub | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/tmac/Makefile.sub b/tmac/Makefile.sub
> +index 1506232..f1468c5 100644
> +--- a/tmac/Makefile.sub
> ++++ b/tmac/Makefile.sub
> +@@ -121,9 +121,9 @@ install_data: $(NORMALFILES) $(SPECIALFILES) man.local \
> + 	  $(RM) $(DESTDIR)$(mdocdir)/$$f; \
> + 	  $(INSTALL_DATA) $$f-s $(DESTDIR)$(mdocdir)/$$f; \
> + 	done
> +-	-test -f $(DESTDIR)$(localtmacdir)/man.local \
> ++	-test -f $(DESTDIR)$(tmacdir)/man.local \
> + 	  || $(INSTALL_DATA) $(srcdir)/man.local \
> +-	       $(DESTDIR)$(localtmacdir)/man.local
> ++	       $(DESTDIR)$(tmacdir)/man.local
> + 	-test -f $(DESTDIR)$(localtmacdir)/mdoc.local \
> + 	  || $(INSTALL_DATA) mdoc.local-s $(DESTDIR)$(localtmacdir)/mdoc.local
> +
> +@@ -164,9 +164,9 @@ uninstall_sub:
> + 	$(RM) $(DESTDIR)$(tmacdir)/$(tmac_s_prefix)s.tmac
> + 	$(RM) $(DESTDIR)$(tmacdir)/$(tmac_an_prefix)an.tmac
> + 	$(RM) $(DESTDIR)$(tmacdir)/www.tmac
> +-	-if cmp -s $(DESTDIR)$(localtmacdir)/man.local \
> ++	-if cmp -s $(DESTDIR)$(tmacdir)/man.local \
> + 	           $(srcdir)/man.local; then \
> +-	  $(RM) $(DESTDIR)$(localtmacdir)/man.local; \
> ++	  $(RM) $(DESTDIR)$(tmacdir)/man.local; \
> + 	fi
> + 	-if cmp -s $(DESTDIR)$(localtmacdir)/mdoc.local \
> + 	           $(srcdir)/mdoc.local; then \
> +--
> +1.9.1
> +
> diff --git a/meta/recipes-extended/groff/groff_1.22.2.bb b/meta/recipes-extended/groff/groff_1.22.3.bb
> similarity index 90%
> rename from meta/recipes-extended/groff/groff_1.22.2.bb
> rename to meta/recipes-extended/groff/groff_1.22.3.bb
> index 63f0425..e0d632f 100644
> --- a/meta/recipes-extended/groff/groff_1.22.2.bb
> +++ b/meta/recipes-extended/groff/groff_1.22.3.bb
> @@ -9,11 +9,11 @@ PR = "r1"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>
>   SRC_URI = "${GNU_MIRROR}/groff/groff-${PV}.tar.gz \
> -	file://groff-1.22.2-correct-man.local-install-path.patch \
> +	file://groff-1.22.3-correct-man.local-install-path.patch \
>   "
>
> -SRC_URI[md5sum] = "9f4cd592a5efc7e36481d8d8d8af6d16"
> -SRC_URI[sha256sum] = "380864dac4772e0c0d7b1282d25d0c5fd7f63baf45c87c4657afed22a13d2076"
> +SRC_URI[md5sum] = "cc825fa64bc7306a885f2fb2268d3ec5"
> +SRC_URI[sha256sum] = "3a48a9d6c97750bfbd535feeb5be0111db6406ddb7bb79fc680809cda6d828a5"
>
>   DEPENDS = "groff-native"
>   DEPENDS_class-native = ""
>

