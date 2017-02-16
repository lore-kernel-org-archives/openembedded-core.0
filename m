Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4090E71E1B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 12:03:08 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Feb 2017 04:03:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,169,1484035200"; d="scan'208";a="45951577"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 16 Feb 2017 04:03:09 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 3AC496A4080;
	Thu, 16 Feb 2017 04:03:08 -0800 (PST)
Date: Thu, 16 Feb 2017 13:40:40 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <20170216114040.GA26465@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <CAJTo0LYBSzN4ga5qyMU=ZxAn6rYGye5vaTMHQ7MSeS25TsVXoQ@mail.gmail.com>
	<1487241012-8486-1-git-send-email-kristian.amlie@mender.io>
MIME-Version: 1.0
In-Reply-To: <1487241012-8486-1-git-send-email-kristian.amlie@mender.io>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wic/partionedfs: Avoid reserving space for non-existing ext. partition
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
X-List-Received-Date: Thu, 16 Feb 2017 12:03:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kristian,

Thank you for the patch. It looks good to me. Just one thing needs to be
changed. See my comment below.

On Thu, Feb 16, 2017 at 11:30:12AM +0100, Kristian Amlie wrote:
> We don't need the gap that the extended partition occupies if we
> already know that we have less than five partitions. Saves up to one
> full alignment of space.
> 
> Signed-off-by: Kristian Amlie <kristian.amlie@mender.io>
> ---
>  scripts/lib/wic/plugins/imager/direct.py | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
> index 481d24d..bc2d620 100644
> --- a/scripts/lib/wic/plugins/imager/direct.py
> +++ b/scripts/lib/wic/plugins/imager/direct.py
> @@ -344,6 +344,10 @@ class PartitionedImage():
>  
>          msger.debug("Assigning %s partitions to disks" % self.ptable_format)
>  
> +        # The number of primary and logical partitions. Extended partition and
> +        # partitions not listed in the table are not included.
> +        num_real_partitions = len([p for p in self.partitions if not p['no_table']])
> +
Hm... shouldn't it be 'if p.no_table'?

Did you run 'oe-selftest -r wic' btw? I'd be surprised if it doesn't
fail at least some test cases with this change.

>          # Go through partitions in the order they are added in .ks file
>          for num in range(len(self.partitions)):
>              part = self.partitions[num]
> @@ -369,7 +373,7 @@ class PartitionedImage():
>                  # Skip one sector required for the partitioning scheme overhead
>                  self.offset += overhead
>  
> -            if self.realpart > 3:
> +            if self.realpart > 3 and num_real_partitions > 4:
>                  # Reserve a sector for EBR for every logical partition
>                  # before alignment is performed.
>                  if self.ptable_format == "msdos":
> @@ -408,7 +412,7 @@ class PartitionedImage():
>  
>              if self.ptable_format == "msdos":
>                  # only count the partitions that are in partition table
> -                if len([p for p in self.partitions if not p.no_table]) > 4:
> +                if num_real_partitions > 4:
>                      if self.realpart > 3:
>                          part.type = 'logical'
>                          part.num = self.realpart + 1

--
Regards,
Ed

