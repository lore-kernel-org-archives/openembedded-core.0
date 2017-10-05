Return-Path: <sgw@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id E29C977FC1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Oct 2017 00:02:28 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Oct 2017 17:02:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,479,1500966000"; d="scan'208";a="319683307"
Received: from swold-mobl2.jf.intel.com ([10.24.10.36])
	by fmsmga004.fm.intel.com with ESMTP; 04 Oct 2017 17:02:29 -0700
Message-ID: <1507161749.7331.383.camel@linux.intel.com>
From: Saul Wold <sgw@linux.intel.com>
To: Matt Madison <matt@madison.systems>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 04 Oct 2017 17:02:29 -0700
In-Reply-To: <1507141312-10348-2-git-send-email-matt@madison.systems>
References: <1507141312-10348-1-git-send-email-matt@madison.systems>
	<1507141312-10348-2-git-send-email-matt@madison.systems>
X-Mailer: Evolution 3.24.5 (3.24.5-1.fc26) 
Mime-Version: 1.0
Cc: otavio@ossystems.br
Subject: Re: [PATCH v3 1/1] go-runtime: prevent host leakage into target objects
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
X-List-Received-Date: Thu, 05 Oct 2017 00:02:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-10-04 at 18:21 +0000, Matt Madison wrote:
> When building for a target whose architecture matches
> the build host's, the second pass through make.bash
> to build the shareable runtime would also overwrite
> the target's static cgo library with host-compatibile
> binaries.
> 
> Fix this by running the host-side build once and
> target-only passes of make.bash twice, for static
> and shareable.  This ensures that what gets installed
> is target-compatible.
> 
> Also fix an issue with x86-64 targets running MUSL by
> removing the pre-built (for glibc) objects for the
> race detector runtime before building.
> 
> [YOCTO #12136]
> 
> Signed-off-by: Matt Madison <matt@madison.systems>
Thanks Matt!

Acked-by: Saul Wold <sgw@linux.intel.com>
Tested-by: Saul Wold <sgw@linux.intel.com>


> ---
>  meta/recipes-devtools/go/go-runtime.inc | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/recipes-devtools/go/go-runtime.inc b/meta/recipes-
> devtools/go/go-runtime.inc
> index 934d1aa..f181dc7 100644
> --- a/meta/recipes-devtools/go/go-runtime.inc
> +++ b/meta/recipes-devtools/go/go-runtime.inc
> @@ -15,7 +15,13 @@ export CC_FOR_TARGET="${CC}"
>  export CXX_FOR_TARGET="${CXX}"
>  export GOROOT_OVERRIDE = "1"
>  
> -do_configure[noexec] = "1"
> +do_configure() {
> +	:
> +}
> +
> +do_configure_libc-musl() {
> +	rm -f ${S}/src/runtime/race/*.syso
> +}
>  
>  do_compile() {
>  	export GOBIN="${B}/bin"
> @@ -23,9 +29,13 @@ do_compile() {
>  	rm -rf ${GOBIN} ${B}/pkg
>  	mkdir ${GOBIN}
>  	cd src
> -	GO_FLAGS="" ./make.bash
> +	./make.bash --host-only
> +	cp ${B}/pkg/tool/${BUILD_GOTUPLE}/go_bootstrap ${B}
> +	rm -rf ${B}/pkg/${TARGET_GOTUPLE}
> +	./make.bash --target-only
>  	if [ -n "${GO_DYNLINK}" ]; then
> -		GO_FLAGS="-buildmode=shared" GO_LDFLAGS="-extldflags 
> \"${LDFLAGS}\"" ./make.bash
> +		cp ${B}/go_bootstrap ${B}/pkg/tool/${BUILD_GOTUPLE}
> +		GO_FLAGS="-buildmode=shared" GO_LDFLAGS="-extldflags 
> \"${LDFLAGS}\"" ./make.bash --target-only
>  	fi
>  	cd ${B}
>  }
> @@ -41,8 +51,9 @@ do_install() {
>  	rm -rf ${D}${libdir}/go/pkg/obj
>  	rm -rf ${D}${libdir}/go/pkg/bootstrap
>  	find src -mindepth 1 -maxdepth 1 -type d | while read
> srcdir; do
> -		[ "$srcdir" = "./cmd" ] || cp --
> preserve=mode,timestamps -R $srcdir ${D}${libdir}/go/src/
> +		cp --preserve=mode,timestamps -R $srcdir
> ${D}${libdir}/go/src/
>  	done
> +	rm -f ${D}${libdir}/go/src/cmd/dist/dist
>  }
>  
>  # Remove test binaries that cannot be relocated
> -- 
> 2.7.4
> 

