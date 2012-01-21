Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rokgm-0003cp-Ve
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Jan 2012 00:49:41 +0100
Received: by iabz21 with SMTP id z21so3045330iab.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jan 2012 15:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=QJZVcXtBw/ceOpSi7kq2qhl5yxrCeT3/TlD6+UdBclg=;
	b=d1ei7Ws/QgsTnj0axGer9KSk7Y6HbWt+ugLofB4DXNoyANLT8N8a8PY8kLxVd8jpnU
	+nJDCCUlnIltcHDP5O8vdycAA+WEcOdoM8pspkvSMWM84xv/JgFWZTUBH6JZSjMvqCkM
	aoiGcFjIqqp7vzld8KZGy7R+I8rHLii/bVxIo=
Received: by 10.50.188.166 with SMTP id gb6mr3858811igc.18.1327189317360;
	Sat, 21 Jan 2012 15:41:57 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id d15sm27394449ibf.7.2012.01.21.15.41.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 21 Jan 2012 15:41:55 -0800 (PST)
Date: Sat, 21 Jan 2012 15:41:51 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120121234151.GC12691@sakrah.homelinux.org>
References: <cover.1325744640.git.sgw@linux.intel.com>
	<e9a450bd3b519373e02ba235ebf5ce7750dc9767.1325744640.git.sgw@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <e9a450bd3b519373e02ba235ebf5ce7750dc9767.1325744640.git.sgw@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [CONSOLIDATED PULL 05/28] libcap: move library to base_libdir
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
X-List-Received-Date: Sat, 21 Jan 2012 23:49:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (04/01/12 22:30), Saul Wold wrote:
> From: Scott Garman <scott.a.garman@intel.com>
> 
> ls from coreutils links to libcap, so move the libcap library
> from libdir (/usr/lib) to base_libdir (/lib).
> 


what is motivation behind this ? needless we are tweaking the default
install mechanism that original package maintainer intended. This can
be a maintenace hassle. Is there a very strong reason to make these kind
of changes ?


> Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> ---
>  meta/recipes-support/libcap/libcap.inc     |   15 +++++++++++++--
>  meta/recipes-support/libcap/libcap_2.22.bb |    2 +-
>  2 files changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-support/libcap/libcap.inc b/meta/recipes-support/libcap/libcap.inc
> index 184b58a..9418abf 100644
> --- a/meta/recipes-support/libcap/libcap.inc
> +++ b/meta/recipes-support/libcap/libcap.inc
> @@ -21,6 +21,8 @@ do_configure() {
>  	sed -e 's,BUILD_CFLAGS ?=,BUILD_CFLAGS := $(BUILD_CFLAGS),' -i Make.Rules
>  }
>  
> +BUILD_LDFLAGS_virtclass_native += "-Wl,rpath=${base_libdir}"
> +
>  EXTRA_OEMAKE = " \
>    LIBATTR=yes \
>    PAM_CAP=${@base_contains('DISTRO_FEATURES', 'pam', 'yes', 'no', d)} \
> @@ -42,8 +44,17 @@ do_install() {
>  	oe_runmake install DESTDIR="${D}" prefix="${prefix}"
>  }
>  
> +do_install_append() {
> +	# Move the library to base_libdir
> +	install -d ${D}${base_libdir}
> +	mv ${D}${libdir}/* ${D}${base_libdir}
> +	rmdir ${D}${libdir}
> +}
> +
> +FILES_${PN}-dev += "${base_libdir}/*.so"
> +
>  # pam files
> -FILES_${PN} += "${libdir}/security/*.so"
> -FILES_${PN}-dbg += "${libdir}/security/.debug/*.so"
> +FILES_${PN} += "${base_libdir}/security/*.so"
> +FILES_${PN}-dbg += "${base_libdir}/security/.debug/*.so"
>  
>  BBCLASSEXTEND = "native"
> diff --git a/meta/recipes-support/libcap/libcap_2.22.bb b/meta/recipes-support/libcap/libcap_2.22.bb
> index dd63d9e..be1df54 100644
> --- a/meta/recipes-support/libcap/libcap_2.22.bb
> +++ b/meta/recipes-support/libcap/libcap_2.22.bb
> @@ -1,6 +1,6 @@
>  require libcap.inc
>  
> -PR = "r2"
> +PR = "r3"
>  
>  SRC_URI[md5sum] = "ce64058bdb3f086ddbfca8ce6c919845"
>  SRC_URI[sha256sum] = "73ebbd4877b5f69dd28b72098e510c5b318bc480f8201c4061ac98b78c04050f"
> -- 
> 1.7.6.4
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


