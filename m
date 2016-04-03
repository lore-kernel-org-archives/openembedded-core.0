Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7810076F8C
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Apr 2016 21:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u33Lje1A001079; Sun, 3 Apr 2016 22:45:40 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 0y6TgAslD4VF; Sun,  3 Apr 2016 22:45:40 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u33LjZKp001076
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 3 Apr 2016 22:45:36 +0100
Message-ID: <1459719934.7348.141.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Max Krummenacher <max.oss.09@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 03 Apr 2016 22:45:34 +0100
In-Reply-To: <1459717038-10549-1-git-send-email-max.krummenacher@toradex.com>
References: <1459717038-10549-1-git-send-email-max.krummenacher@toradex.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: Re: [oe][Patch] package.bbclass: fix host contamination warnings for source files
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
X-List-Received-Date: Sun, 03 Apr 2016 21:45:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2016-04-03 at 22:57 +0200, Max Krummenacher wrote:
> Addresses https://bugzilla.yoctoproject.org/show_bug.cgi?id=8939
> 
> Source files deployed with the *-dbg packages are owned by the user
> running bitbake leading to warnings as the one below.
> 
> WARNING: glibc-2.23-r0 do_package_qa: QA Issue: glibc: /glibc
> -dbg/usr/src/debug/glibc/2.23-r0/git/include/resolv.h is owned by uid
> 1000, which is the same as the user running bitbake. This may be due
> to host contamination
> glibc: /glibc-dbg/usr/src/debug/glibc/2.23-r0/git/include/monetary.h
> is owned by uid 1000, which is the same as the user running bitbake.
> This may be due to host contamination
> glibc: /glibc-dbg/usr/src/debug/glibc/2.23-r0/git/include/locale.h is
> owned by uid 1000, which is the same as the user running bitbake.
> This may be due to host contamination
> ...
> 
> The files are copied as part of the do_package task.
> The patch chowns all file in packages/usr/src after cpio copied them
> into the
> package directory.
> 
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> ---
> 
> 
>  meta/classes/package.bbclass | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/meta/classes/package.bbclass
> b/meta/classes/package.bbclass
> index bdbe96d..d9ef62c 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -362,6 +362,7 @@ def copydebugsources(debugsrcdir, d):
>      # and copied to the destination here.
>  
>      import stat
> +    import subprocess
>  
>      sourcefile = d.expand("${WORKDIR}/debugsources.list")
>      if debugsrcdir and os.path.isfile(sourcefile):
> @@ -410,6 +411,28 @@ def copydebugsources(debugsrcdir, d):
>          if retval:
>              bb.fatal("debugsrc symlink fixup failed with exit code
> %s (cmd was %s)" % (retval, cmd))
>  
> +        # cpio --no-preserve-owner does not create the destination
> files with
> +        # owner root even when run under pseudo, chown them
> explicitely.

How about passing --owner=0:0 to cpio? 

I'm a little worried about why I don't see this failure on my own local
builds.

We have a few cases where things sometimes seem to work out and
sometimes don't and I'd love to get to the bottom of how to reproduce
it and to understand why its different for different people.

Cheers,

Richard

