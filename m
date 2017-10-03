Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 315C560102
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Oct 2017 22:07:06 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Oct 2017 15:07:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,475,1500966000"; d="scan'208";a="158465203"
Received: from swold-mobl2.jf.intel.com ([10.24.8.66])
	by fmsmga005.fm.intel.com with ESMTP; 03 Oct 2017 15:07:07 -0700
Message-ID: <1507068427.7331.292.camel@linux.intel.com>
From: Saul Wold <sgw@linux.intel.com>
To: "matt@madison.systems" <matt@madison.systems>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Tue, 03 Oct 2017 15:07:07 -0700
References: <1506694551-4487-1-git-send-email-matt@madison.systems>
In-Reply-To: <1506694551-4487-1-git-send-email-matt@madison.systems>
X-Mailer: Evolution 3.24.5 (3.24.5-1.fc26) 
Mime-Version: 1.0
Cc: "otavio@ossystems.com.br" <otavio@ossystems.com.br>
Subject: Re: [PATCH] go-runtime: prevent host leakage into target objects
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
X-List-Received-Date: Tue, 03 Oct 2017 22:07:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-09-29 at 14:15 +0000, Matt Madison wrote:
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
> [YOCTO #12136]
> 

This does not appear to actually fix the bug mentioned here, I just
found the failure again with intel-corei7-64 (from meta-intel) and then
confirmed that it fails with qemux86-64 and genericx86-64 when using
TCLIBC = "musl"

Can you please verify and test with MUSL.

Thanks
   Sau!


> Signed-off-by: Matt Madison <matt@madison.systems>
> ---
>  meta/recipes-devtools/go/go-runtime.inc | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-devtools/go/go-runtime.inc b/meta/recipes-
> devtools/go/go-runtime.inc
> index 934d1aa..bd26e2e 100644
> --- a/meta/recipes-devtools/go/go-runtime.inc
> +++ b/meta/recipes-devtools/go/go-runtime.inc
> @@ -23,9 +23,13 @@ do_compile() {
>  	rm -rf ${GOBIN} ${B}/pkg
>  	mkdir ${GOBIN}
>  	cd src
> -	GO_FLAGS="" ./make.bash
> +	./make.bash --host-only
> +	cp ${B}/pkg/tool/${BUILD_GOTUPLE}/go_bootstrap ${B}
> +	rm -rf ${B}/pkg/${TARGET_GOTUPLE}
> +	./make.bash --target-only
>  	if [ -n "${GO_DYNLINK}" ]; then
> -		GO_FLAGS="-buildmode=shared" GO_LDFLAGS="-
> extldflags 
> \"${LDFLAGS}\"" ./make.bash
> +		cp ${B}/go_bootstrap ${B}/pkg/tool/${BUILD_GOTUPLE}
> +		GO_FLAGS="-buildmode=shared" GO_LDFLAGS="-
> extldflags 
> \"${LDFLAGS}\"" ./make.bash --target-only
>  	fi
>  	cd ${B}
>  }
> @@ -41,8 +45,9 @@ do_install() {
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

