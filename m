Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1R3cvN-0001rQ-P9
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 02:01:57 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 13 Sep 2011 16:56:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,376,1312182000"; d="scan'208";a="52769584"
Received: from unknown (HELO [10.255.14.59]) ([10.255.14.59])
	by fmsmga002.fm.intel.com with ESMTP; 13 Sep 2011 16:56:47 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Sep 2011 16:56:41 -0700
In-Reply-To: <3be290aac4da885fe5bc31797c4a689196c63b7a.1315956050.git.sgw@linux.intel.com>
References: <cover.1315956050.git.sgw@linux.intel.com>
	<3be290aac4da885fe5bc31797c4a689196c63b7a.1315956050.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.0.3 (3.0.3-1.fc15) 
Message-ID: <1315958207.2252.22.camel@scimitar>
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] libzypp: move package-manger to it own package
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
X-List-Received-Date: Wed, 14 Sep 2011 00:01:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-09-13 at 16:41 -0700, Saul Wold wrote:
> [YOCTO #1234]

Aside/nitpick: I really hate this being the first line.

> 
> This moves a couple of files to a pkgmgt package so that
> they will not be installed by default. This removes the
> Add/Remove Software Icon from rpm based rootfs.
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

We should ensure that we document how to hook up and enable this
functionality too.

Signed-off-by: Joshua Lock <josh@linux.intel.com>

> ---
>  meta/recipes-extended/libzypp/libzypp_git.bb |    9 ++++++++-
>  1 files changed, 8 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-extended/libzypp/libzypp_git.bb b/meta/recipes-extended/libzypp/libzypp_git.bb
> index 1fc6809..aeae7df 100644
> --- a/meta/recipes-extended/libzypp/libzypp_git.bb
> +++ b/meta/recipes-extended/libzypp/libzypp_git.bb
> @@ -14,7 +14,7 @@ RDEPENDS_${PN} = "sat-solver"
>  S = "${WORKDIR}/git"
>  SRCREV = "15b6c52260bbc52b3d8e585e271b67e10cc7c433"
>  PV = "0.0-git${SRCPV}"
> -PR = "r13"
> +PR = "r14"
>  
>  SRC_URI = "git://gitorious.org/opensuse/libzypp.git;protocol=git \
>             file://no-doc.patch \
> @@ -32,9 +32,16 @@ SRC_URI_append_mips = " file://mips-workaround-gcc-tribool-error.patch"
>  # ARM specific global constructor workaround
>  SRC_URI_append_arm  = " file://arm-workaround-global-constructor.patch"
>  
> +PACKAGES =+ "${PN}-pkgmgt"
> +
>  FILES_${PN} += "${libdir}/zypp ${datadir}/zypp ${datadir}/icons"
>  FILES_${PN}-dev += "${datadir}/cmake"
>  
> +FILES_${PN}-pkgmgt = "${bindir}/package-manager \
> +                      ${bindir}/package-manager-su \
> +                      ${datadir}/applications/package-manager.desktop \
> +                     "
> +
>  EXTRA_OECMAKE += " -DLIB=${@os.path.basename('${libdir}')}"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"

-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre



