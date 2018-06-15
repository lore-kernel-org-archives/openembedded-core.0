Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 15D6374C7D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 21:58:05 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w5FLw4ra031208
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 15 Jun 2018 22:58:05 +0100
Message-ID: <9be8087a3d586dd5d372954ddae61db388e39011.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 15 Jun 2018 22:58:04 +0100
In-Reply-To: <1529088192-991-1-git-send-email-armccurdy@gmail.com>
References: <1529088192-991-1-git-send-email-armccurdy@gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] bitbake.conf: drop FETCHCMD, GITDIR, etc fetcher over-rides
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
X-List-Received-Date: Fri, 15 Jun 2018 21:58:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-06-15 at 11:43 -0700, Andre McCurdy wrote:
> Following recent updates to the bitbake, the fetchers should now all
> contain safe and correct defaults for the subdirectory within DL_DIR
> to use and the base fetch command to run. It's no longer necessary
> for bitbake.conf to specify these values.
> 
> This is cleanup which was originally proposed in 2012:
> 
>   http://lists.openembedded.org/pipermail/openembedded-core/2012-July
> /064224.html
> 
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/conf/bitbake.conf | 12 ------------
>  1 file changed, 12 deletions(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 3b2ef9f..8588684 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -349,12 +349,6 @@ CACHE = "${TMPDIR}/cache${@['', '/' +
> str(d.getVar('MACHINE'))][bool(d.getVar('M
>  # The persistent cache should be shared by all builds
>  PERSISTENT_DIR = "${TOPDIR}/cache"
>  LOG_DIR = "${TMPDIR}/log"
> -CO_DIR = "${DL_DIR}"
> -CVSDIR = "${CO_DIR}/cvs"
> -SVNDIR = "${CO_DIR}/svn"
> -GITDIR = "${CO_DIR}/git2"
> -BZRDIR = "${CO_DIR}/bzr"
> -HGDIR = "${CO_DIR}/hg"
>  
>  STAMPS_DIR ?= "${TMPDIR}/stamps"
>  STAMP =
> "${STAMPS_DIR}/${MULTIMACH_TARGET_SYS}/${PN}/${EXTENDPE}${PV}-${PR}"
> @@ -661,12 +655,6 @@ SRC_URI[vardepsexclude] += "\
>  #  export DEBIAN_MIRROR = "http://ftp.de.debian.org/debian/pool"
>  #     into your local.conf
>  
> -FETCHCMD_svn = "/usr/bin/env svn --non-interactive --trust-server-
> cert"
> -FETCHCMD_cvs = "/usr/bin/env cvs"
> -FETCHCMD_wget = "/usr/bin/env wget -t 2 -T 30 --passive-ftp --no-
> check-certificate"
> -FETCHCMD_bzr = "/usr/bin/env bzr"
> -FETCHCMD_hg = "/usr/bin/env hg"
> -
>  SRCDATE = "${DATE}"
>  SRCREV ??= "INVALID"
>  AUTOREV = "${@bb.fetch2.get_autorev(d)}"

To make this work, we need to force everyone to upgrade their bitbake
beyond the point where these have been added to the fetcher.

We could do that with the minimum bitbake version but I'm tempted to
hold this for a but until we have another more pressing reason to bump
the minimum bitbake version and then do this at the same time?

Cheers,

Richard

