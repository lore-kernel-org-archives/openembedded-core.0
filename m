Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id ED82D6156D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 09:29:56 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 12 Sep 2013 02:29:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,890,1371106800"; d="scan'208";a="394636736"
Received: from ks-mobl3.gar.corp.intel.com (HELO helios.localnet)
	([10.252.123.176])
	by fmsmga001.fm.intel.com with ESMTP; 12 Sep 2013 02:29:57 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
Date: Thu, 12 Sep 2013 10:29:56 +0100
Message-ID: <2771628.zHcdCVtJ3y@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-29-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1378935481-592-1-git-send-email-sgw@linux.intel.com>
References: <1378935481-592-1-git-send-email-sgw@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bluez4/5: Add EXCLUDE_FROM_WORLD = 1
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
X-List-Received-Date: Thu, 12 Sep 2013 09:29:57 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 11 September 2013 14:38:01 Saul Wold wrote:
> We can't build both recipes in the world build as there is a collision of
> package name and PR values. Specificly the libasound-module-bluez which is
> the same in both goes backwards from r5 (bluez4) -> r0 (bluez5) and the
> subpackage_metadata check fails:
> 
> ERROR: Recipe lib32-bluez5 is trying to change PR from 'r0' to 'r5'. This
> will cause do_package_write_* failures since the incorrect data will be
> used and they will be unable to find the right workdir.
> 
> [YOCTO #5165]
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-connectivity/bluez/bluez4.inc  | 1 +
>  meta/recipes-connectivity/bluez5/bluez5.inc | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/meta/recipes-connectivity/bluez/bluez4.inc
> b/meta/recipes-connectivity/bluez/bluez4.inc index b540622..e4f6834 100644
> --- a/meta/recipes-connectivity/bluez/bluez4.inc
> +++ b/meta/recipes-connectivity/bluez/bluez4.inc
> @@ -43,3 +43,4 @@ EXTRA_OECONF = "\
>    --with-udevrulesdir=`pkg-config --variable=udevdir udev`/rules.d \
>  "
> 
> +EXCLUDE_FROM_WORLD = "1"
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc
> b/meta/recipes-connectivity/bluez5/bluez5.inc index e5cb9e8..2e25d86 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -82,3 +82,5 @@ FILES_${PN}-dbg += "\
>  RDEPENDS_${PN}-testtools += "python python-dbus python-pygobject"
> 
>  SYSTEMD_SERVICE_${PN} = "bluetooth.service"
> +
> +EXCLUDE_FROM_WORLD = "1"

Surely we don't need to exclude both from world, just one of them?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

