Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 96203736B6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 21:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2ULjRFi002158; Mon, 30 Mar 2015 22:45:27 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id lZs9nTAFYL1M; Mon, 30 Mar 2015 22:45:27 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2ULjBQ0002151
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 30 Mar 2015 22:45:23 +0100
Message-ID: <1427751911.14020.328.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Mon, 30 Mar 2015 22:45:11 +0100
In-Reply-To: <5519BB5C.2060808@windriver.com>
References: <1426283873-11784-1-git-send-email-jslater@windriver.com>
	<4010D2ED-6067-4B6B-9C27-B2C5FC465DC9@gmail.com>
	<1426627208.23698.39.camel@linuxfoundation.org>
	<007BD92917A2324FA403BCF9A464CF847769E93E@ALA-MBA.corp.ad.wrs.com>
	<5519BB5C.2060808@windriver.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gcc-cross-canadian: Add inhibit of split as well was Re: [PATCH 1/1] package.bbclass: decouple splitting	and stripping
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
X-List-Received-Date: Mon, 30 Mar 2015 21:45:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-03-30 at 16:08 -0500, Mark Hatle wrote:
> On 3/18/15 12:44 PM, Slater, Joseph wrote:
> > I just found out that this patch will break qa for ltp packaging.  The ltp recipe
> > inhibits stripping which used to inhibit splitting.  If splitting is enabled,
> > there are several .debug directories in places packages.bbclass doesn't look, so
> > they wind up in ltp, not ltp-dbg.
> > 
> > It's tempting just to inhibit splitting since that was never really done before, anyhow,
> > but I suppose that's not the right way to fix it.
> 
> In addition to ltp, I recently found this breaks gcc-cross-canadian, below is a
> patch that should probably be applied even if this one does not make it in.
> 
> 
> gcc-cross-canadian: Add inhibit of split as well
> 
> With the recent change to allow strip and split of packages to be controlled
> seperately, gcc-cross-canadian will sometimes fail to build properly.  So in
> addition to the existing inhibit strip, we also want to inhibit split.
> 
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> index 195b465..ad4b08f 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> @@ -64,6 +64,7 @@ do_compile () {
>  }
> 
>  INHIBIT_PACKAGE_STRIP = "1"
> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> 
>  # Having anything auto depending on gcc-cross-sdk is a really bad idea...
>  EXCLUDE_FROM_SHLIBS = "1"

Not sure which revision of fido or master this against but: 

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=92739edc9da0dea10ccc9d153226cacd6a18ee33

i.e. we fixed this the other way...

Cheers,

Richard


