Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-08.prod.phx3.secureserver.net
	(p3plsmtpa07-08.prod.phx3.secureserver.net [173.201.192.237])
	by mail.openembedded.org (Postfix) with ESMTP id B65316AFC2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 14:34:36 +0000 (UTC)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa07-08.prod.phx3.secureserver.net with 
	id Aeab1m00E1mTNtu01eabjY; Fri, 09 Aug 2013 07:34:36 -0700
Message-ID: <5204FDFE.1020100@pabigot.com>
Date: Fri, 09 Aug 2013 09:34:38 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: Openembedded-core@lists.openembedded.org
Subject: linux-yocto (dylan 3.8) arm and recipe-space issues
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
X-List-Received-Date: Fri, 09 Aug 2013 14:34:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I'm trying to use linux-yocto_3.8 under dylan (poky at 899e5cc) for 
gumstix overo as an experiment.  Since there are no overo files in the 
meta branch of the linux-yocto-3.8 repo, I'm using recipe-space 
metadata.  I've run into two anomalies.

First, in-tree metadata is still being found and referenced, which is 
good.  In my case $KARCH=arm which brings in arm.scc, and arm.cfg has:

   # Failure to use this on ARM results in lots of interesting runtime bugs.
   CONFIG_CC_OPTIMIZE_FOR_SIZE=y

But "bitbake linux-yocto -c kernel_configcheck" produces a merge_log.txt 
that has:

   Using meta/cfg/kernel-cache/ktypes/base/base.cfg.sanitized as base
   Merging meta/cfg/kernel-cache/features/kgdb/kgdb.cfg.sanitized
   ...
   Merging meta/cfg/kernel-cache/arch/arm/arm.cfg.sanitized
   ...
   Merging meta/cfg/kernel-cache/ktypes/standard/standard.cfg.sanitized
   Value of CONFIG_CC_OPTIMIZE_FOR_SIZE is redefined by fragment 
meta/cfg/kernel-cache/ktypes/standard/standard.cfg.sanitized:
   Previous value: CONFIG_CC_OPTIMIZE_FOR_SIZE=y
   New value: # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set

and indeed CONFIG_CC_OPTIMIZE_FOR_SIZE is not set in the resulting 
config file.  This seems wrong, and I haven't been able to figure out 
how to fix it.  That it's not diagnosed by kernel_configcheck also seems 
wrong.

Second, seeing in that file that various features are being pulled in 
from in-tree meta/cfg/kernel-cache/features, in my recipe-space 
overo.scc I have:

   include features/spi/spi.scc

because the in-tree metadata has that fragment with the contents I 
want.  It seems that because the reference is from a file in 
recipe-space the existing metadata from in-tree isn't found in this 
case, and I have to copy it into recipe-space FILESEXTRAPATHS for it to 
be found.

Is there a way to reference in-tree metadata from a recipe-space scc 
file so I don't have to duplicate it?

Thanks.

Peter

