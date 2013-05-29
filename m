Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 5A3E361A80
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 21:15:33 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4TLJo3Y023374; Wed, 29 May 2013 22:19:50 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id qSrRijkjL2lY; Wed, 29 May 2013 22:19:50 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4TLJhiO023368
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 29 May 2013 22:19:45 +0100
Message-ID: <1369862117.14887.233.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Wed, 29 May 2013 22:15:17 +0100
In-Reply-To: <1369840203-21898-11-git-send-email-mark.hatle@windriver.com>
References: <1369840203-21898-1-git-send-email-mark.hatle@windriver.com>
	<1369840203-21898-11-git-send-email-mark.hatle@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 10/21] ncurses, busybox, cml1.bbclass: Fix menuconfig display corruption
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
X-List-Received-Date: Wed, 29 May 2013 21:15:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-05-29 at 10:09 -0500, Mark Hatle wrote:
> From: Jason Wessel <jason.wessel@windriver.com>
> 
> Previously there was a change to the ncurses compile to make it more
> like the typical way it was compiled on a host system.  This fixed a
> whole class of host machines, but masked the real underlying problem
> with the display corruption issues and menuconfig.
> 
> The corner case that led to the discovery that the wrong curses.h file
> was getting used was when there was no curses libraries at all on one
> of the development hosts.  What had happened before was that
> /usr/include/curses.h on the host system had to match closely enough
> to the curses.h in the sysroot and then linking against the sysroot
> version of curses.so was ok (meaning no display corruption).  But on
> some systems with ncurses.h vs curses.h such as SuSE hosts, there were
> still issues.
> 
> If we fix the root of the problem and force the mconf and lxdialog to
> use the correct headers and libraries from the sysroot there is no
> further issues and the menuconfig target works properly.  It also
> means we can back out the custom compilation flags to the ncurses
> recipe because they are no longer needed.
> 
> For the kernel part of the menuconfig / nconfig changes it will be
> merged separately and this is all based on:
> 
> https://lkml.org/lkml/2013/3/3/103
> 
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  meta/classes/cml1.bbclass                          |  5 +-
>  .../busybox-1.20.2/busybox-cross-menuconfig.patch  | 69 ++++++++++++++++++++++
>  meta/recipes-core/busybox/busybox_1.20.2.bb        |  3 +-
>  meta/recipes-core/ncurses/ncurses.inc              | 14 -----
>  4 files changed, 74 insertions(+), 17 deletions(-)
>  create mode 100644 meta/recipes-core/busybox/busybox-1.20.2/busybox-cross-menuconfig.patch

Jason asked us to hold off merging this until things were sorted out in
the mainline kernel. Has that happened?

Cheers,

Richard


