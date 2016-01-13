Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id E61E860797;
	Wed, 13 Jan 2016 00:09:47 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 12 Jan 2016 16:09:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,285,1449561600"; d="scan'208";a="859296204"
Received: from rusilaw-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.149.174])
	by orsmga001.jf.intel.com with ESMTP; 12 Jan 2016 16:09:45 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Jan 2016 13:09:43 +1300
Message-ID: <1462345.ZzKELdxCEg@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.2.8-300.fc23.x86_64; KDE/4.14.14; x86_64; ;
	)
In-Reply-To: <39606447-07D3-4F1F-93A1-CB9C77114535@gmail.com>
References: <39606447-07D3-4F1F-93A1-CB9C77114535@gmail.com>
MIME-Version: 1.0
Cc: openembedded-architecture@lists.openembedded.org,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Cached size of off_t
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
X-List-Received-Date: Wed, 13 Jan 2016 00:09:50 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tue, 12 Jan 2016 15:23:33 Khem Raj wrote:
> Hi
> 
> We cache size of off_t in site files and the value is 4 in most cases
> 
> 
> meta/site/arm-linux:ac_cv_sizeof_off_t=${ac_cv_sizeof_off_t=4}
> meta/site/ix86-common:ac_cv_sizeof_off_t=${ac_cv_sizeof_off_t=4}
> meta/site/nios2-linux:ac_cv_sizeof_off_t=${ac_cv_sizeof_off_t=4}
> meta/site/powerpc32-linux:ac_cv_sizeof_off_t=${ac_cv_sizeof_off_t=4}
> meta/site/x32-linux:ac_cv_sizeof_off_t=${ac_cv_sizeof_off_t=8}
> meta/site/x86_64-linux:ac_cv_sizeof_off_t=${ac_cv_sizeof_off_t=8}
> 
> 
> However this value is wrong when largefile support is enabled (which is
> default) on most OE based distros. It also lands us in nasty bugs which are
> complicated to uncover eg. the curl issue
> 
> http://git.openembedded.org/openembedded-core/commit/?id=3c58712465494e441c4
> 036a7cf21d2e6d343efab
> 
> and just in OE-Core more e.g. grub2,libsndfile1,pax are showing same
> symptoms.
> 
> I think this value should be left for configure to compute and
> autotools.bbclass should pass --{enable|disable}-largefile based upon
> DISTRO_FEATURES enabling largefile support
> 
> Do we see any downsides or point I might have missed

IIRC I think the issue was older configure scripts without the capability to 
compute this properly (where we're not auto-reconf'ing them).

Ross, any thoughts?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

