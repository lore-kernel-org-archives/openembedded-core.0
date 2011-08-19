Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QuPz0-0003mu-QQ for openembedded-core@lists.openembedded.org;
	Fri, 19 Aug 2011 16:23:39 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7JEIxU0028274
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 15:18:59 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26885-03 for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 15:18:55 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7JEImA1028268
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 15:18:50 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <b3827be03af9e8a6041d012a3be59c9c6a818250.1313700595.git.sgw@linux.intel.com>
References: <cover.1313700595.git.sgw@linux.intel.com>
	<b3827be03af9e8a6041d012a3be59c9c6a818250.1313700595.git.sgw@linux.intel.com>
Date: Fri, 19 Aug 2011 09:18:46 -0500
Message-ID: <1313763526.13995.98.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 26/32] procps: Fix lib path to support multilib
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Aug 2011 14:23:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-08-18 at 13:55 -0700, Saul Wold wrote:
> From: Dongxiao Xu <dongxiao.xu@intel.com>
> 
> Remove the install.patch which hardcode the lib paths.
> Change ${PN} to ${BPN} in file names.
> 
> Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> ---
>  .../procps/procps-3.2.8/install.patch              |   29 --------------------
>  meta/recipes-extended/procps/procps.inc            |    3 +-
>  meta/recipes-extended/procps/procps_3.2.8.bb       |    8 +++---
>  3 files changed, 5 insertions(+), 35 deletions(-)
>  delete mode 100644 meta/recipes-extended/procps/procps-3.2.8/install.patch
> 
> diff --git a/meta/recipes-extended/procps/procps-3.2.8/install.patch b/meta/recipes-extended/procps/procps-3.2.8/install.patch
> deleted file mode 100644
> index b52a2c9..0000000
> --- a/meta/recipes-extended/procps/procps-3.2.8/install.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -Upstream-Status: Inappropriate [configuration]
> -
> ---- procps-3.2.5.virgin/Makefile	2005-01-26 05:55:26.000000000 +0100
> -+++ procps-3.2.5/Makefile	2005-08-03 04:55:26.346984488 +0200
> -@@ -30,7 +30,10 @@
> - install  := install -D --owner 0 --group 0
> - 
> - # Lame x86-64 /lib64 and /usr/lib64 abomination:
> --lib64    := lib$(shell [ -d /lib64 ] && echo 64)
> -+# lib64    := lib$(shell [ -d /lib64 ] && echo 64)
> -+
> -+# Equally lame hack to work around makefile lameness when the host arch is 64bit, but the target is not.
> -+lib64      := lib

Both these cases are plain wrong. We can't simply drop this patch since
we may be building 64 bit on a 32 bit system and /lib64 may not exist.
Dropping the patch will therefore fix some cases and break others (e.g.
what a about x32?).

We likely need to heavier patch the Makefile.

Cheers,

Richard





