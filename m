Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TBqJ9-0002P3-8R
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 19:00:59 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 12 Sep 2012 09:48:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,410,1344236400"; d="scan'208";a="221130552"
Received: from unknown (HELO [10.255.13.93]) ([10.255.13.93])
	by fmsmga002.fm.intel.com with ESMTP; 12 Sep 2012 09:48:25 -0700
Message-ID: <5050BCD9.5010004@linux.intel.com>
Date: Wed, 12 Sep 2012 09:48:25 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <1347281377-12799-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1347281377-12799-1-git-send-email-ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] telepathy-idle: fix parallel build
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
X-List-Received-Date: Wed, 12 Sep 2012 17:00:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/10/2012 05:49 AM, Ross Burton wrote:
> Apply a patch from upstream git, and clean up our other patch so that it
> applies.
>
> [ YOCTO #3056 ]
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   .../build-fix-for-make-j-safety.patch              |   39 ++++++++++++++++++++
>   .../fix-svc-gtk-doc.h-target.patch                 |   24 +-----------
>   .../telepathy/telepathy-idle_0.1.12.bb             |    5 ++-
>   3 files changed, 43 insertions(+), 25 deletions(-)
>   create mode 100644 meta/recipes-connectivity/telepathy/telepathy-idle-0.1.12/build-fix-for-make-j-safety.patch
>

Merged into OE-Core

Thanks
	Sau!


> diff --git a/meta/recipes-connectivity/telepathy/telepathy-idle-0.1.12/build-fix-for-make-j-safety.patch b/meta/recipes-connectivity/telepathy/telepathy-idle-0.1.12/build-fix-for-make-j-safety.patch
> new file mode 100644
> index 0000000..0aeed09
> --- /dev/null
> +++ b/meta/recipes-connectivity/telepathy/telepathy-idle-0.1.12/build-fix-for-make-j-safety.patch
> @@ -0,0 +1,39 @@
> +From b092172e56393fad70e472afa26df4f886dfdbc0 Mon Sep 17 00:00:00 2001
> +From: Dan Winship <danw@gnome.org>
> +Date: Fri, 24 Aug 2012 12:19:45 -0400
> +Subject: [PATCH] build: fix for "make -j" safety
> +
> +A make rule with multiple (non-pattern) targets just says that each of
> +those files can be built by the rule, not that the rule builds all of
> +them at once. So under "make -j", extensions/Makefile would run three
> +copies of glib-ginterface-gen.py at once, which could end up deleting
> +each others' files and causing a make failure. Fix.
> +
> +Signed-off-by: Jonny Lamb <jonny.lamb@collabora.co.uk>
> +
> +Upstream-Status: Backport [b092172e56393fad70e472afa26df4f886dfdbc0]
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +---
> + extensions/Makefile.am |    5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/extensions/Makefile.am b/extensions/Makefile.am
> +index 24efb6e..bb837da 100644
> +--- a/extensions/Makefile.am
> ++++ b/extensions/Makefile.am
> +@@ -42,7 +42,10 @@ extensions.html: _gen/all.xml $(tools_dir)/doc-generator.xsl
> + 		$(tools_dir)/doc-generator.xsl \
> + 		$< > $@
> +
> +-_gen/svc.c _gen/svc.h _gen/svc-gtk-doc.h: _gen/all.xml \
> ++_gen/svc.h: _gen/svc.c
> ++_gen/svc-gtk-doc.h: _gen/svc.c
> ++
> ++_gen/svc.c: _gen/all.xml \
> + 	$(tools_dir)/glib-ginterface-gen.py
> + 	$(AM_V_GEN)$(PYTHON) $(tools_dir)/glib-ginterface-gen.py \
> + 		--filename=_gen/svc --signal-marshal-prefix=_idle_ext \
> +--
> +1.7.10.4
> +
> diff --git a/meta/recipes-connectivity/telepathy/telepathy-idle-0.1.12/fix-svc-gtk-doc.h-target.patch b/meta/recipes-connectivity/telepathy/telepathy-idle-0.1.12/fix-svc-gtk-doc.h-target.patch
> index a5efed4..2cd2c78 100644
> --- a/meta/recipes-connectivity/telepathy/telepathy-idle-0.1.12/fix-svc-gtk-doc.h-target.patch
> +++ b/meta/recipes-connectivity/telepathy/telepathy-idle-0.1.12/fix-svc-gtk-doc.h-target.patch
> @@ -3,7 +3,7 @@ Upstream-Status: Pending
>   Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
>   --- a/extensions/Makefile.am
>   +++ b/extensions/Makefile.am
> -@@ -37,12 +37,12 @@ _gen/all.xml: all.xml $(wildcard $(srcdi
> +@@ -37,8 +37,8 @@ _gen/all.xml: all.xml $(wildcard $(srcdi
>    		--xinclude $(tools_dir)/identity.xsl \
>    		$< > $@
>
> @@ -13,25 +13,3 @@ Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
>    		$(tools_dir)/doc-generator.xsl \
>    		$< > $@
>
> --_gen/svc.c _gen/svc.h _gen/svc-gtk-doc.h: _gen/all.xml \
> -+_gen/svc.c _gen/svc.h: _gen/all.xml \
> - 	$(tools_dir)/glib-ginterface-gen.py
> - 	$(AM_V_GEN)$(PYTHON) $(tools_dir)/glib-ginterface-gen.py \
> - 		--filename=_gen/svc --signal-marshal-prefix=_idle_ext \
> ---- a/extensions/Makefile.in
> -+++ b/extensions/Makefile.in
> -@@ -585,12 +585,12 @@ _gen/all.xml: all.xml $(wildcard $(srcdi
> - 		--xinclude $(tools_dir)/identity.xsl \
> - 		$< > $@
> -
> --extensions.html: _gen/all.xml $(tools_dir)/doc-generator.xsl
> -+extensions.html _gen/svc-gtk-doc.h: _gen/all.xml $(tools_dir)/doc-generator.xsl
> - 	$(AM_V_GEN)$(XSLTPROC) $(XSLTPROCFLAGS) \
> - 		$(tools_dir)/doc-generator.xsl \
> - 		$< > $@
> -
> --_gen/svc.c _gen/svc.h _gen/svc-gtk-doc.h: _gen/all.xml \
> -+_gen/svc.c _gen/svc.h: _gen/all.xml \
> - 	$(tools_dir)/glib-ginterface-gen.py
> - 	$(AM_V_GEN)$(PYTHON) $(tools_dir)/glib-ginterface-gen.py \
> - 		--filename=_gen/svc --signal-marshal-prefix=_idle_ext \
> diff --git a/meta/recipes-connectivity/telepathy/telepathy-idle_0.1.12.bb b/meta/recipes-connectivity/telepathy/telepathy-idle_0.1.12.bb
> index c8163e2..c9e8b3b 100644
> --- a/meta/recipes-connectivity/telepathy/telepathy-idle_0.1.12.bb
> +++ b/meta/recipes-connectivity/telepathy/telepathy-idle_0.1.12.bb
> @@ -5,10 +5,11 @@ DEPENDS = "glib-2.0 dbus telepathy-glib openssl"
>   LICENSE = "LGPLv2.1"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1 \
>                       file://src/idle.c;beginline=1;endline=19;md5=b06b1e2594423111a1a7910b0eefc7f9"
> -PR = "r0"
> +PR = "r1"
>
>   SRC_URI = "http://telepathy.freedesktop.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
> -           file://fix-svc-gtk-doc.h-target.patch"
> +           file://fix-svc-gtk-doc.h-target.patch \
> +           file://build-fix-for-make-j-safety.patch"
>
>   SRC_URI[md5sum] = "e77e5b84cc8f77cf12d15727c30df366"
>   SRC_URI[sha256sum] = "5343aede5f68450735be8e835143795d5d95151b64d35fd7a99c2a24a771e33b"
>



