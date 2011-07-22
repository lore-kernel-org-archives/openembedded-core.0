Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QkA7v-0008PE-Rs
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 09:26:28 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 22 Jul 2011 00:22:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,246,1309762800"; d="scan'208";a="30230996"
Received: from unknown (HELO [10.255.14.1]) ([10.255.14.1])
	by azsmga001.ch.intel.com with ESMTP; 22 Jul 2011 00:22:10 -0700
Message-ID: <4E292522.801@linux.intel.com>
Date: Fri, 22 Jul 2011 00:22:10 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1311246527.git.nitin.a.kamble@intel.com>
	<eafb85c6bdc1904c6d99ae3fee97298fc5798f2b.1311246527.git.nitin.a.kamble@intel.com>
In-Reply-To: <eafb85c6bdc1904c6d99ae3fee97298fc5798f2b.1311246527.git.nitin.a.kamble@intel.com>
Subject: Re: [PATCH 1/1] glib-2.0: fix a compilation issue due to dtrace
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
X-List-Received-Date: Fri, 22 Jul 2011 07:26:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/21/2011 04:09 AM, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>
> With multilib&  x32 builds dtrace is getting turned-on by the glib-2.0
> configure, which causes following compilation failure.
>
> | x86_64-linux-libtool: link: ccache gcc
> -isystem/disk0/pokybuild/build-multilib/tmp/sysroots/x86_64-linux/usr/include
> -O2 -pipe -Wall -Wl,-rpath-link
> -Wl,/disk0/pokybuild/build-multilib/tmp/sysroots/x86_64-linux/usr/lib
> -Wl,-rpath
> -Wl,/disk0/pokybuild/build-multilib/tmp/sysroots/x86_64-linux/usr/lib
> -Wl,-O1 -o .libs/gtester gtester.o
> -L/disk0/pokybuild/build-multilib/tmp/sysroots/x86_64-linux/usr/lib
> ./.libs/libglib-2.0.so -lrt -Wl,-rpath
> -Wl,/disk0/pokybuild/build-multilib/tmp/sysroots/x86_64-linux/usr/lib
> | ./.libs/libglib-2.0.so: undefined reference to `GLIB_SLICE_ALLOC'
> | ./.libs/libglib-2.0.so: undefined reference to `GLIB_MEM_REALLOC'
> | ./.libs/libglib-2.0.so: undefined reference to `GLIB_SLICE_FREE'
> | ./.libs/libglib-2.0.so: undefined reference to `GLIB_MEM_ALLOC'
> | ./.libs/libglib-2.0.so: undefined reference to `GLIB_MEM_FREE'
> | ./.libs/libglib-2.0.so: undefined reference to `GLIB_QUARK_NEW'
> | collect2: ld returned 1 exit status
> | make[4]: *** [gtester] Error 1
>
> Signed-off-by: Nitin A Kamble<nitin.a.kamble@intel.com>
> ---
>   meta/recipes-core/glib-2.0/glib-2.0_2.27.5.bb |    2 +-
>   meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb |    3 ++-
>   2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.27.5.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.27.5.bb
> index 0b30d17..26fc8fb 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.27.5.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.27.5.bb
> @@ -1,6 +1,6 @@
>   require glib.inc
>
> -PR = "r5"
> +PR = "r6"
>
Why do you bump the PR here?

Sau!

>   SRC_URI = "${GNOME_MIRROR}/glib/2.27/glib-${PV}.tar.bz2 \
>              file://configure-libtool.patch \
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb
> index a2e609f..dce6802 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb
> @@ -1,6 +1,6 @@
>   require glib.inc
>
> -PR = "r2"
> +PR = "r3"
>   PE = "1"
>
>   SRC_URI = "${GNOME_MIRROR}/glib/2.28/glib-${PV}.tar.bz2 \
> @@ -20,3 +20,4 @@ SRC_URI[sha256sum] = "222f3055d6c413417b50901008c654865e5a311c73f0ae918b0a9978d1
>
>   BBCLASSEXTEND = "native"
>
> +EXTRA_OECONF_append = " --enable-dtrace=no"


