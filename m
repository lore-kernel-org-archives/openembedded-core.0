Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 09954751D2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2018 07:36:11 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w5M7a9Gi031398
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 22 Jun 2018 08:36:10 +0100
Message-ID: <74728be5ad84d7fcc78d591b3eb85b5780ea7075.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Christopher Larson <kergoth@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 22 Jun 2018 08:36:09 +0100
In-Reply-To: <5ce7b09e00b4967d2c0efaad58049cf871fab57a.1529604086.git.chris_larson@mentor.com>
References: <cover.1529604086.git.chris_larson@mentor.com>
	<5ce7b09e00b4967d2c0efaad58049cf871fab57a.1529604086.git.chris_larson@mentor.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 6/6] perf: drop the rdep on man
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
X-List-Received-Date: Fri, 22 Jun 2018 07:36:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-06-22 at 02:07 +0500, Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
> 
> It's not common practice to make -doc rdep on man when man pages are
> included, and doing so prevents the recipe from building for non-
> gplv3
> 
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>  meta/recipes-kernel/perf/perf.bb | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-
> kernel/perf/perf.bb
> index 51f5597eb92..5e710f61834 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -239,7 +239,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  PACKAGES =+ "${PN}-archive ${PN}-tests ${PN}-perl ${PN}-python"
>  
>  RDEPENDS_${PN} += "elfutils bash"
> -RDEPENDS_${PN}-doc += "man"
>  RDEPENDS_${PN}-archive =+ "bash"
>  RDEPENDS_${PN}-python =+ "bash python python-modules ${@bb.utils.con
> tains('PACKAGECONFIG', 'audit', 'audit-python', '', d)}"
>  RDEPENDS_${PN}-perl =+ "bash perl perl-modules"

We're certainly not consistent but:

http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/classes/manpages.bbclass#n13

RDEPENDS_${MAN_PKG} += "${@bb.utils.contains('PACKAGECONFIG', 'manpages', 'man-db', '', d)}"

man-db is gplv2 too...

Cheers,

Richard



