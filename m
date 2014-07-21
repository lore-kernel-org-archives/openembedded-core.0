Return-Path: <tom.zanussi@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id AFF79701A9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 21:23:42 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 21 Jul 2014 14:18:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,704,1400050800"; d="scan'208";a="576653756"
Received: from unknown (HELO [10.255.12.245]) ([10.255.12.245])
	by orsmga002.jf.intel.com with ESMTP; 21 Jul 2014 14:23:42 -0700
Message-ID: <1405977822.3067.26.camel@empanada>
From: Tom Zanussi <tom.zanussi@intel.com>
To: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Date: Mon, 21 Jul 2014 16:23:42 -0500
In-Reply-To: <1405940517-30651-1-git-send-email-maciej.borzecki@open-rnd.pl>
References: <1405940517-30651-1-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-code][PATCH] wic: include partition label in fs image file name
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
X-List-Received-Date: Mon, 21 Jul 2014 21:23:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-07-21 at 13:01 +0200, Maciej Borzecki wrote:
> Not including the label image but having multiple partitions of the same
> type, the image file of one partition would overwrite the other.
> 

Right, the empty-partition case somehow missed the label - good catch.

Acked-by: Tom Zanussi <tom.zanussi@linux.intel.com>

> Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
> Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
> ---
>  scripts/lib/mic/kickstart/custom_commands/partition.py | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/lib/mic/kickstart/custom_commands/partition.py b/scripts/lib/mic/kickstart/custom_commands/partition.py
> index 06f29a9..d0f1b78 100644
> --- a/scripts/lib/mic/kickstart/custom_commands/partition.py
> +++ b/scripts/lib/mic/kickstart/custom_commands/partition.py
> @@ -343,7 +343,7 @@ class Wic_PartData(Mic_PartData):
>          """
>          Prepare an empty ext2/3/4 partition.
>          """
> -        fs = "%s/fs.%s" % (cr_workdir, self.fstype)
> +        fs = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
>  
>          dd_cmd = "dd if=/dev/zero of=%s bs=1M seek=%d count=0" % \
>              (fs, self.size)
> @@ -363,7 +363,7 @@ class Wic_PartData(Mic_PartData):
>          """
>          Prepare an empty btrfs partition.
>          """
> -        fs = "%s/fs.%s" % (cr_workdir, self.fstype)
> +        fs = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
>  
>          dd_cmd = "dd if=/dev/zero of=%s bs=1M seek=%d count=0" % \
>              (fs, self.size)
> @@ -384,7 +384,7 @@ class Wic_PartData(Mic_PartData):
>          """
>          Prepare an empty vfat partition.
>          """
> -        fs = "%s/fs.%s" % (cr_workdir, self.fstype)
> +        fs = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
>  
>          blocks = self.size * 1024
>  



