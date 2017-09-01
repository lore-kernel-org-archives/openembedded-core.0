Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AAA2078457
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 14:47:14 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v81El8E8021493
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 1 Sep 2017 15:47:13 +0100
Message-ID: <1504277228.2175.52.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org, haris.okanovic@ni.com
Date: Fri, 01 Sep 2017 15:47:08 +0100
In-Reply-To: <025f202d-c573-d8e6-5124-2161c9a91795@linux.intel.com>
References: <20170519150121.7707-1-haris.okanovic@ni.com>
	<20170831184643.3991-1-haris.okanovic@ni.com>
	<025f202d-c573-d8e6-5124-2161c9a91795@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 01 Sep 2017 15:47:13 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] package_manager.py: Add PACKAGE_ENABLE_FILELIST option to OpkgIndexer
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
X-List-Received-Date: Fri, 01 Sep 2017 14:47:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-09-01 at 16:04 +0300, Alexander Kanavin wrote:
> On 08/31/2017 09:46 PM, Haris Okanovic wrote:
> > 
> > Setting PACKAGE_ENABLE_FILELIST option generates Packages.filelist
> > on
> > `bitbake package-index`, which is index of files provided by each
> > IPK package in the feed. It's useful for figuring out which package
> > provides a particular file/program/library/etc.
> > 
> > Disabled by default since generating a filelist involves reading
> > the
> > payload of every package in the feed, a time and IO intensive
> > operation
> > many users won't want to run. Those who do may flip this switch.
> > 
> > Testing:
> >   * Built an opkg index with PACKAGE_ENABLE_FILELIST unset and
> > verified
> >     no Packages.filelist are generated.
> >   * Built with PACKAGE_ENABLE_FILELIST="1" and verified each
> > subfeed
> >     has Packages.filelist; took ~3min longer for 8,200 IPKs.
> 
>
> The only way to discover that this option exists is to read the code
> for OpkgIndexer. And it's specific to opkg, which is not reflected in
> the option name at all.
> 
> Can you instead just place the index generation into a custom recipe 
> that depends on package-index recipe?

I'm going to disagree with that, I don't want a separate recipe for
this and I'm not sure that makes sense.

I'm ok with adding an option but we need to come up with a better
namespace. How about OPKG_PACKAGE_INDEX_FILELIST_GEN?

(says its package index and opkg specific)

Cheers,

Richard



