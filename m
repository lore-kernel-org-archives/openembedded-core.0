Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9C21479C97
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 22:57:10 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w9IMv9xJ019098
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 18 Oct 2018 23:57:10 +0100
Message-ID: <79cf743ddd27cb124056261c4fed50f386d94e45.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 18 Oct 2018 23:57:09 +0100
In-Reply-To: <20181017164326.67111-2-mark.hatle@windriver.com>
References: <20181017164326.67111-1-mark.hatle@windriver.com>
	<20181017164326.67111-2-mark.hatle@windriver.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/4] systemd: Remove items that made this machine (qemu) specific
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
X-List-Received-Date: Thu, 18 Oct 2018 22:57:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-10-17 at 12:43 -0400, Mark Hatle wrote:
> Create a new systemd-conf recipe to contain the specific system/machine
> configuration items.  This new package is now machine specific.
> 
> Without doing this trying to create a single system with multiple BSPs,
> one of which was qemu based, would result in the systemd -and- everything that
> dependend upon systemd to have their hash changed.  The hash changing means
> lots of rebuilds, but worse if it's a package based system each different
> machine ends with a new PR value and a newly generated package.
> 
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/recipes-core/systemd/systemd-conf.bb     | 51 +++++++++++++++++++
>  ...ange-the-default-device-timeout-to-2.patch | 35 -------------
>  meta/recipes-core/systemd/systemd_239.bb      | 28 ++++------
>  3 files changed, 60 insertions(+), 54 deletions(-)
>  create mode 100644 meta/recipes-core/systemd/systemd-conf.bb
>  delete mode 100644 meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-default-device-timeout-to-2.patch
> 

With this patch, when systemd is enabled, it causes checksum issues:

$ oe-selftest -r sstatetests.SStateTests.test_sstate_sametune_samesigs

Its fixed by:

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 6221a057ce6..504f7fa07ad 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -74,6 +74,7 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   gnome-icon-theme->librsvg \
   font-alias->font-util \
   systemd-boot->systemd-bootconf \
+  systemd->systemd-conf \
   weston-init->weston \
   weston-init->kbd \
 "

Cheers,

Richard


