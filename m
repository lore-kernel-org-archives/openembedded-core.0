Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CBD156E46D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2013 10:36:38 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Dec 2013 02:32:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,494,1384329600"; d="scan'208";a="425291373"
Received: from mmckenna-mobl1.ger.corp.intel.com (HELO helios.localnet)
	([10.252.122.3])
	by orsmga001.jf.intel.com with ESMTP; 16 Dec 2013 02:36:36 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: ChenQi <Qi.Chen@windriver.com>
Date: Mon, 16 Dec 2013 10:36:35 +0000
Message-ID: <60315409.4GC3QP4sfd@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-34-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <52AE819A.8020203@windriver.com>
References: <52AE819A.8020203@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Problems with INC_RPM_IMAGE_GEN
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
X-List-Received-Date: Mon, 16 Dec 2013 10:36:39 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Qi,

On Monday 16 December 2013 12:29:14 ChenQi wrote:
> Recently I've enabled INC_RPM_IMAGE_GEN on my old and slow build
> machine. Here are two problems I can see with this feature.
> 
> 1. INC_RPM_IMAGE_GEN and 'rm_work'
> If we enable INC_RPM_IMAGE_GEN and 'rm_work' at the same time, we would
> get build failures.
> This is because the original rootfs has been removed because of rm_work.

We could perhaps now auto-set RM_WORK_EXCLUDE for images where 
INC_RPM_IMAGE_GEN is set, would that fix this?

> 2. INC_RPM_IMAGE_GEN and XXX_POSTPROCESS_COMMAND
> Let's first look at a case.
> 1. build core-image-minimal with 'extrausers' inherited and root
> password set in local.conf
> 2. build core-image-minimal without 'extrausers' inherited
> The image generated in the second step still has the root password set.
> This is not what we want.
> 
> The problem in incremental rpm image generation is that it chooses the
> final image as a starting point.
> However, the final image has been tweaked by all those
> XXX_POSTPROCESS_COMMAND.
> For example, the 'debug-tweaks' IMAGE_FEATURE will lead to several
> additonal ROOTFS_POSTPROCESS_COMMAND.
> meta/classes/image.bbclass:# Allow dropbear/openssh to accept logins
> from accounts with an empty password string if debug-tweaks is enabled
> meta/classes/image.bbclass:ROOTFS_POSTPROCESS_COMMAND +=
> '${@base_contains("IMAGE_FEATURES", "debug-tweaks",
> "ssh_allow_empty_password; ", "",d)}'
> meta/classes/image.bbclass:# Enable postinst logging if debug-tweaks is
> enabled
> meta/classes/image.bbclass:ROOTFS_POSTPROCESS_COMMAND +=
> '${@base_contains("IMAGE_FEATURES", "debug-tweaks",
> "postinst_enable_logging; ", "",d)}'
> 
> IMHO, the rootfs after all packages installed and before all postprocess
> commands running should serve as the reference rootfs for the
> incremental rpm image generation.
> But I cannot figure out a reasonable solution which doesn't have much
> performance impact.
> 
> Any idea or suggestion?

Probably we would have to take a copy of the rootfs at some point before this. 
To be honest though this incremental functionality has always seemed a bit 
fragile to me - what if a postinstall for a package makes changes to files in 
the rootfs installed by another package, and the second time around the 
package is removed but the package's postrm doesn't undo those changes (do we 
even run postrms during incremental rootfs generation)?

Cheers,
Paul

