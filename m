Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8D89371C1F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Jan 2018 10:11:26 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w0DABDVa015765
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sat, 13 Jan 2018 10:11:14 GMT
Message-ID: <1515838273.29722.133.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Juro Bystricky <juro.bystricky@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Sat, 13 Jan 2018 10:11:13 +0000
In-Reply-To: <1515791062-54281-1-git-send-email-juro.bystricky@intel.com>
References: <1515791062-54281-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: jurobystricky@hotmail.com
Subject: Re: [PATCH] libc6: improve reproducibility
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
X-List-Received-Date: Sat, 13 Jan 2018 10:11:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2018-01-12 at 13:04 -0800, Juro Bystricky wrote:
> Building various libraries (libc6, libc6-pic, libc6-staticdev, libc6-
> dbg, ...)
> can be non-deterministic because they may be built with two different
> versions
> of intl/plural.c. in two otherwise identical builds. We may or may
> not re-generate
> the file plural.c from the file plural.y, based on bison being
> installed or not
> and based on mtimes of those two files, as the Makefile contains:
> 
> plural.c: plural.y
> 	$(BISON) $(BISONFLAGS) $@ $^
> 
> If the above rule does not fire, we use a "fallback" plural.c,
> otherwise
> we use plural.c re-generated from plural.y.
> The fix is to always require bison to be installed and
> unconditionally
> re-generate plural.c. (This is achieved by touching plural.y).
> 
> [YOCTO #12291]
> 
> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> ---
>  meta/recipes-core/glibc/glibc_2.26.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Hi Juro,

Can you put a comment alongside the touch in the recipe as we're not
going to know why we're doing this in a few years time...

Cheers,

Richard


> diff --git a/meta/recipes-core/glibc/glibc_2.26.bb b/meta/recipes-
> core/glibc/glibc_2.26.bb
> index 04d9773..4d9b23f 100644
> --- a/meta/recipes-core/glibc/glibc_2.26.bb
> +++ b/meta/recipes-core/glibc/glibc_2.26.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36
> d3209f380deb394b213 \
>        file://posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c78
> 5f5d83a \
>        file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
>  
> -DEPENDS += "gperf-native"
> +DEPENDS += "gperf-native bison-native"
>  
>  SRCREV ?= "77f921dac17c5fa99bd9e926d926c327982895f7"
>  
> @@ -103,6 +103,7 @@ do_configure () {
>  # version check and doesn't really help with anything
>          (cd ${S} && gnu-configize) || die "failure in running gnu-
> configize"
>          find ${S} -name "configure" | xargs touch
> +        find ${S}/intl -name "plural.y" | xargs touch
>          CPPFLAGS="" oe_runconf
>  }
>  

