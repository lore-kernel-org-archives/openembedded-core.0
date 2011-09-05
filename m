Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1R0bjj-0006oa-75
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Sep 2011 18:09:27 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1R0bev-0001QL-8u
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Sep 2011 18:04:29 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 05 Sep 2011 17:04:28 +0100
In-Reply-To: <1315237881-14077-1-git-send-email-denis@eukrea.com>
References: <1315237881-14077-1-git-send-email-denis@eukrea.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1315238669.2519.21.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH] busybox: import the configuration from openembedded.dev
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
X-List-Received-Date: Mon, 05 Sep 2011 16:09:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-09-05 at 17:51 +0200, Denis Carikli wrote:
> Without that patch many applets are not build, like for instance
>   mdev, which could be necessary for building certain images.

If your distro needs mdev then you should probably supply your own
busybox config which turns it on.  For modern kernels mdev is probably
redundant since you will usually be better off with devtmpfs.

Or, conversely, if you feel that a particular change is important enough
that it really needs to go into the global busybox config for oe-core,
please send a patch which makes just that one change.  The patch you
sent flips a large set of of seemingly-random switches, for example:

@@ -85,14 +82,12 @@ CONFIG_FEATURE_FAST_TOP=y
 CONFIG_FEATURE_EDITING=y
 CONFIG_FEATURE_EDITING_MAX_LEN=1024
 # CONFIG_FEATURE_EDITING_VI is not set
-CONFIG_FEATURE_EDITING_HISTORY=15
+CONFIG_FEATURE_EDITING_HISTORY=64
 CONFIG_FEATURE_EDITING_SAVEHISTORY=y
 CONFIG_FEATURE_TAB_COMPLETION=y
 CONFIG_FEATURE_USERNAME_COMPLETION=y
 CONFIG_FEATURE_EDITING_FANCY_PROMPT=y
-# CONFIG_FEATURE_EDITING_ASK_TERMINAL is not set
-CONFIG_FEATURE_NON_POSIX_CP=y
-# CONFIG_FEATURE_VERBOSE_CP_MESSAGE is not set
+CONFIG_FEATURE_VERBOSE_CP_MESSAGE=y
 CONFIG_FEATURE_COPYBUF_KB=4
 CONFIG_MONOTONIC_SYSCALL=y
 CONFIG_IOCTL_HEX2STR_ERROR=y
@@ -105,7 +100,7 @@ CONFIG_FEATURE_HWIB=y
 #
 # Archival Utilities
 #
-CONFIG_FEATURE_SEAMLESS_LZMA=y
+# CONFIG_FEATURE_SEAMLESS_LZMA is not set
 CONFIG_FEATURE_SEAMLESS_BZ2=y
 CONFIG_FEATURE_SEAMLESS_GZ=y
 CONFIG_FEATURE_SEAMLESS_Z=y

... which is impossible to review sensibly, and it isn't at all obvious
why this new configuration would necessarily be an improvement.

p.




