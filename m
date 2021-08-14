Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web12.47781.1628933949840109698
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Aug 2021 02:39:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id B478EC0007;
	Sat, 14 Aug 2021 09:39:07 +0000 (UTC)
Date: Sat, 14 Aug 2021 11:39:07 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
To: Joe Slater <joe.slater@windriver.com>
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com
Subject: Re: [oe-core][PATCH 1/1] blktrace: add rdepends
Message-ID: <YRePO49ByXUDHv+R@piout.net>
References: <20210813202416.138888-1-joe.slater@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20210813202416.138888-1-joe.slater@windriver.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

On 13/08/2021 13:24:16-0700, Joe Slater wrote:
> bno_plot.py uses gnuplot.  Also change shebangs to
> python3 because we do not support python2.
> 
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  meta/recipes-kernel/blktrace/blktrace_git.bb  |  6 +++-
>  .../blktrace/files/python3-shebangs.patch     | 30 +++++++++++++++++++
>  2 files changed, 35 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-kernel/blktrace/files/python3-shebangs.patch
> 
> diff --git a/meta/recipes-kernel/blktrace/blktrace_git.bb b/meta/recipes-kernel/blktrace/blktrace_git.bb
> index d00b1bd0be..36ce282481 100644
> --- a/meta/recipes-kernel/blktrace/blktrace_git.bb
> +++ b/meta/recipes-kernel/blktrace/blktrace_git.bb
> @@ -10,11 +10,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
>  
>  DEPENDS = "libaio"
>  
> +RDEPENDS:${PN} += "gnuplot"
> +

This breaks many builds on the autobuilders with:

stdio: ERROR: Nothing RPROVIDES 'gnuplot' (but /home/pokybuild/yocto-worker/genericx86-64/build/meta/recipes-kernel/blktrace/blktrace_git.bb RDEPENDS on or otherwise requires it)
stdio: ERROR: Nothing RPROVIDES 'blktrace-dev' (but /home/pokybuild/yocto-worker/genericx86-64/build/meta/recipes-kernel/blktrace/blktrace_git.bb RDEPENDS on or otherwise requires it)

because gnuplot is part of meta-oe

>  SRCREV = "366d30b9cdb20345c5d064af850d686da79b89eb"
>  
>  PV = "1.3.0+git${SRCPV}"
>  
> -SRC_URI = "git://git.kernel.dk/blktrace.git"
> +SRC_URI = "git://git.kernel.dk/blktrace.git \
> +           file://python3-shebangs.patch \
> +          "
>  
>  S = "${WORKDIR}/git"
>  
> diff --git a/meta/recipes-kernel/blktrace/files/python3-shebangs.patch b/meta/recipes-kernel/blktrace/files/python3-shebangs.patch
> new file mode 100644
> index 0000000000..70a35c2c3a
> --- /dev/null
> +++ b/meta/recipes-kernel/blktrace/files/python3-shebangs.patch
> @@ -0,0 +1,30 @@
> +blktrace: Use python3 shebangs
> +
> +blktrace can use either python2 or python3, but we really want
> +python3, so modify the shebangs.
> +
> +Upstream-Status: pending
> +
> +Signed-off-by: Joe Slater <joe.slater@windriver.com.
> +
> +
> +diff --git a/btt/bno_plot.py b/btt/bno_plot.py
> +index 3aa4e19..d7d7159 100644
> +--- a/btt/bno_plot.py
> ++++ b/btt/bno_plot.py
> +@@ -1,4 +1,4 @@
> +-#! /usr/bin/env python
> ++#! /usr/bin/env python3
> + #
> + # btt blkno plotting interface
> + #
> +diff --git a/btt/btt_plot.py b/btt/btt_plot.py
> +index 40bc71f..8620d31 100755
> +--- a/btt/btt_plot.py
> ++++ b/btt/btt_plot.py
> +@@ -1,4 +1,4 @@
> +-#! /usr/bin/env python
> ++#! /usr/bin/env python3
> + #
> + # btt_plot.py: Generate matplotlib plots for BTT generate data files
> + #
> -- 
> 2.25.1
> 

> 
> 
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
