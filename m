Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A62D561EC2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 17:25:08 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 22 Aug 2013 10:22:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,935,1367996400"; d="scan'208";a="366920609"
Received: from dvhart-mobl3.amr.corp.intel.com (HELO [10.7.201.147])
	([10.7.201.147])
	by orsmga001.jf.intel.com with ESMTP; 22 Aug 2013 10:24:58 -0700
Message-ID: <1377192296.5259.7.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Thu, 22 Aug 2013 10:24:56 -0700
In-Reply-To: <37674ce0aeae479e3cde7f578871ed47ec9025f8.1377175027.git.liezhi.yang@windriver.com>
References: <cover.1377175027.git.liezhi.yang@windriver.com>
	<37674ce0aeae479e3cde7f578871ed47ec9025f8.1377175027.git.liezhi.yang@windriver.com>
Organization: Intel
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/6] e2fsprogs: properly set up extent header in do_write
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
X-List-Received-Date: Thu, 22 Aug 2013 17:25:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-08-22 at 09:13 -0400, Robert Yang wrote:
> do_write doesn't fully set up the first extent header on a new
> inode, so if we write a 0-length file, and don't write any data
> to the new file, we end up creating something that looks corrupt
> to kernelspace:
> 
> EXT4-fs error (device loop0): ext4_ext_check_inode:464: inode #12: comm
> ls: bad header/extent: invalid magic - magic 0, entries 0, max 0(0),
> depth 0(0)
> 
> Do something similar to ext4_ext_tree_init() here, and
> fill out the first extent header upon creation to avoid this.
> 
> [YOCTO #3848]
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../e2fsprogs-1.42.8/debugfs-extent-header.patch   |   47 ++++++++++++++++++++
>  .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb |    2 +

> +Upstream-Status: Backport

Should we backport? Or should we just update the revision we use?

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



