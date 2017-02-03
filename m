Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1070B60765
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Feb 2017 15:20:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v13FKNIY023674
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 3 Feb 2017 07:20:23 -0800 (PST)
Received: from soho-mhatle-m.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 3 Feb 2017 07:20:22 -0800
To: ANDANI PRASHANT <andani.prashant@gmail.com>, Patches and discussions about
	the oe-core layer <openembedded-core@lists.openembedded.org>
References: <CAACupd1+PapV978TASu3kvsUYxrShh5hXnjM_r0f-hr5TtEhQw@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <d0aaea0e-5d65-d12a-a0ce-8b9d0a019f1d@windriver.com>
Date: Fri, 3 Feb 2017 09:20:22 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CAACupd1+PapV978TASu3kvsUYxrShh5hXnjM_r0f-hr5TtEhQw@mail.gmail.com>
Subject: Re: Want to strip rootfs
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
X-List-Received-Date: Fri, 03 Feb 2017 15:20:26 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 2/3/17 6:25 AM, ANDANI PRASHANT wrote:
> Hi,
> 
> I build rootfs which size is 100MB+
> As i look in to filesystem, there are 14mb libc-2.23.so <http://libc-2.23.so>,
> 12mb libstdc++.so.6.0.22,..etc.
> Is there any flag or option during build to strip all library and binary to
> optimise size of rootfs.

The default is that everything is stripped (actually split into stripped
executable and debug addition).  The stripped pieces are installed into your
rootfs, and the debug pieces are not.  (Unless you've added dbg-pkgs to your
configuration.)

The default optimization flag should be more then enough to get a consistent
well optimized system.

Where you will run into issues is if you, or one of the layers you are using
disables the splitting or enables global debug optimizations (lower optimization
levels.)

This is what you want to check for:

# Uncomment this to change the optimization to make debugging easer, at the
# possible cost of performance.
# DEBUG_BUILD = "1"
#
# Uncomment this to disable the stripping of the installed binaries
# INHIBIT_PACKAGE_STRIP = "1"
#
# Uncomment this to disable the split of the debug information into -dbg files
# INHIBIT_PACKAGE_DEBUG_SPLIT = "1"

You can use bitbake -e to investigate the values for the system as a whole, or
specify a recipe to look at a specific item.

--Mark

> Regards,
> Prashant
> 
> 


