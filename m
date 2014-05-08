Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (unknown [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0E2EC60897
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 May 2014 22:03:21 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s48M3G2t006709; Thu, 8 May 2014 23:03:16 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ImGLgeftG0wf; Thu,  8 May 2014 23:03:16 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s48M3B37006701
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 8 May 2014 23:03:12 +0100
Message-ID: <1399586585.31891.75.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Barker <paul@paulbarker.me.uk>
Date: Thu, 08 May 2014 23:03:05 +0100
In-Reply-To: <1399568104-11641-1-git-send-email-paul@paulbarker.me.uk>
References: <1399568104-11641-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH RFC] Support hierarchical ipk feeds
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
X-List-Received-Date: Thu, 08 May 2014 22:03:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-05-08 at 16:55 +0000, Paul Barker wrote:
> This is an RFC only and is not suitable for merging yet. The necessary patches
> for opkg-utils have also been posted for review but have not been merged yet. I
> want to know if there is general approval for adding this feature to oe-core. If
> there is, I'll go ahead and merge the opkg-utils patches and post a new patch
> series which includes the update to the SRCREV used for opkg-utils in oe-core.
> 
> This patch has been tested on qemuarm:
> 
>   A feed was created with IPK_HIERARCHICAL_FEED unset and opkg was pointed at
>   that feed. 'opkg update && opkg install ncurses-terminfo-base' worked
>   correctly, downloading a package file from the same directory as the package
>   feed.
>   
>   IPK_HIERARCHICAL_FEED was then set to "1" in local.conf and the feed was
>   rebuilt by running 'bitbake core-image-minimal && bitbake package-index'. On
>   qemu 'opkg update && opkg install ncurses-terminfo' worked correctly,
>   downloading the package from the subdirectory 'n/ncurses-terminfo'.
> 
>   Finally, IPK_HIERARCHICAL_FEED was unset again and the feed was rebuilt. On
>   qemu 'opkg update && opkg install ncurses' worked correctly, downloading
>   package files from the same directory as the package feed again.
> 
> Those tests prove that changes to IPK_HIERARCHICAL_FEED do not break the upgrade
> path of an existing system provided that 'bitbake pacakge-index' is re-ran after
> the change.
> 
> The proposed commit message follows...
> 
> 
> 
> package_ipk.bbclass: Support hierarchical feed
> 
> This patch allows for an optional new layout for ipk feed directories which I've
> called a 'hierarchical feed' and is based on how Debian pools package files. It
> is disabled by default and is enabled by setting IPK_HIERARCHICAL_FEED to "1".
> 
> In the traditional feed layout, package files are placed in <outdir>/<arch>/.
> This can lead to several thousand files existing in a single directory which is
> often a problem if developers want to upload a package feed to a shared web
> hosting provider. For example, in my case, listing files via FTP only shows the
> first 2000 files, breaking my scripts which attempt to upload only new and
> changed files via FTP.
> 
> In the hierarchical feed, package files are written to
> '<outdir>/<arch>/<pkg_prefix>/<pkg_subdir>', where pkg_prefix is the first
> letter of the package file name for non-lib packages or "lib" plus the 4th
> letter of the pacakge file name for lib pacakges (eg, 'l' for less, 'libc' for
> libc6).  pkg_subdir is the root of the pacakge file name, discarding the version
> and architecture parts and the common suffixes '-dbg', '-dev', '-doc',
> '-staticdev' and '-locale-*'.
> 
> This change relies on recent patches to opkg-utils which support hierarchical
> package feeds.

FWIW I'm ok with this and its something we probably want to enable by
default however:

a) I'm not sure <pkg_subdir> is that useful, we tend to only have one
version of things around in most cases and I can't imagine people having
a lot of these.

b) How are the "common suffixes" configured? I guess its just a loose
thing but I worry about the "why did my package get put into directory X
when its really part of Y?" type questions. Perhaps splitting on the
first dash in the name might be good enough? I'm thinking about
kernel-modules-xxx for example and some of our other dynamically
generated packages.

Cheers,

Richard



