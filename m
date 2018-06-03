Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A219D60684
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Jun 2018 16:01:13 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w53G1DO2020226
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sun, 3 Jun 2018 17:01:14 +0100
Message-ID: <43755bc4971a80f56aa06bbafad9ce0b62c809f9.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 03 Jun 2018 17:01:13 +0100
In-Reply-To: <c445dcff9a4a8f8c5de9fbe7468ccc7fc095857e.1527670923.git.liezhi.yang@windriver.com>
References: <cover.1527670923.git.liezhi.yang@windriver.com>
	<c445dcff9a4a8f8c5de9fbe7468ccc7fc095857e.1527670923.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 06/16] gcc-sanitizers: Fix libtool .la files
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
X-List-Received-Date: Sun, 03 Jun 2018 16:01:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-05-30 at 17:03 +0800, Robert Yang wrote:
> From: Yuanjie Huang <yuanjie.huang@windriver.com>
> 
> Since libtool sysroot is not set when compiling sanitizers, the
> libtool
> does no prefix the dependency path correctly. Fix it, so that
> programs
> can link to sanitizer libraries without error.
> 
> Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/recipes-devtools/gcc/gcc-sanitizers.inc | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> index e5e8452..2373dd8 100644
> --- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> +++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> @@ -39,6 +39,8 @@ do_install () {
>          rmdir --ignore-fail-on-non-empty -p ${D}${infodir}
>      fi
>      chown -R root:root ${D}
> +    # Fix broken libtool with stdc++, as sysroot is not set.
> +    find ${D} -name \*.la -exec sed -i "/^dependency_libs=/s@'${libdir}'@=${libdir}@g" {} \;
>  }
>  
>  INHIBIT_DEFAULT_DEPS = "1"

At this point we gave up and started just deleting .la files so I'm not
sure this matters any more. Do you still need to do this?

Regardless, it would be better to pass in the right libtool sysroot
rather than hacking the .la files.

Cheers,

Richard


