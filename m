Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjKz6-00050h-LO
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 02:49:56 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Jul 2011 17:45:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,231,1309762800"; d="scan'208";a="27832175"
Received: from unknown (HELO [10.255.13.254]) ([10.255.13.254])
	by orsmga002.jf.intel.com with ESMTP; 19 Jul 2011 17:45:49 -0700
Message-ID: <4E26253D.8040000@linux.intel.com>
Date: Tue, 19 Jul 2011 17:45:49 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1dd2e2b995b65326b14426fe01116b99a920d779.1311034342.git.raj.khem@gmail.com>
	<d12eac7e3b3d9c368f99e4163fb297858e577d00.1311034342.git.raj.khem@gmail.com>
In-Reply-To: <d12eac7e3b3d9c368f99e4163fb297858e577d00.1311034342.git.raj.khem@gmail.com>
Subject: Re: [PATCH 14/16] clutter-box2d: Replace use of finite macro	with C99 compliant isfinite()
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
X-List-Received-Date: Wed, 20 Jul 2011 00:49:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/18/2011 05:17 PM, Khem Raj wrote:
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   .../clutter/clutter-box2d/isfinite.patch           |   19 +++++++++++++++++++
>   meta/recipes-graphics/clutter/clutter-box2d_git.bb |    6 ++++--
>   2 files changed, 23 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-graphics/clutter/clutter-box2d/isfinite.patch
>
> diff --git a/meta/recipes-graphics/clutter/clutter-box2d/isfinite.patch b/meta/recipes-graphics/clutter/clutter-box2d/isfinite.patch
> new file mode 100644
> index 0000000..fd2bf74
> --- /dev/null
> +++ b/meta/recipes-graphics/clutter/clutter-box2d/isfinite.patch
> @@ -0,0 +1,19 @@
> +_finite is obsoleted and C99 has isfinite instead so we should use it
> +
> +Signed-off-by: Khem Raj<raj.khem@gmail.com>
> +
> +Upstream-Status: Pending
> +
> +Index: clutter-box2d-0.10.0/box2d/Source/Common/b2Math.h
> +===================================================================
> +--- clutter-box2d-0.10.0.orig/box2d/Source/Common/b2Math.h	2008-12-16 06:42:10.000000000 -0800
> ++++ clutter-box2d-0.10.0/box2d/Source/Common/b2Math.h	2011-07-17 02:10:29.833825198 -0700
> +@@ -60,7 +60,7 @@
> + #ifdef _MSC_VER
> + 	return _finite(x) != 0;
> + #else
> +-	return finite(x) != 0;
> ++	return std::isfinite(x) != 0;
> + #endif
> + }
> +
> diff --git a/meta/recipes-graphics/clutter/clutter-box2d_git.bb b/meta/recipes-graphics/clutter/clutter-box2d_git.bb
> index bfd46b2..06f5fa2 100644
> --- a/meta/recipes-graphics/clutter/clutter-box2d_git.bb
> +++ b/meta/recipes-graphics/clutter/clutter-box2d_git.bb
> @@ -4,9 +4,11 @@ LIC_FILES_CHKSUM = "file://box2d/License.txt;md5=e5d39ad91f7dc4692dcdb1d85139ec6
>
>   SRCREV = "4799ac10ae8cb7da936a2b999aba58fe62eb1ee3"
>   PV = "0.10.1+git${SRCPV}"
> -PR = "r0"
> +PR = "r1"
>
> -SRC_URI = "git://git.gnome.org/clutter-box2d.git"
> +SRC_URI = "git://git.gnome.org/clutter-box2d.git \
> +           file://isfinite.patch \
> +          "
>
>   S = "${WORKDIR}/git"
>

Khem,

This patch seems to have patched clutter-box2d-1.6_0.10.0.bb also, with 
the isfinite patch.  This fails to apply.  Was this intentional were you 
planning on updating the 1.6 version?

Sau!


