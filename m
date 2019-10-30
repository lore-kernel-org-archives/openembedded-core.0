Return-Path: <ross.burton@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 126657D19E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2019 23:06:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Oct 2019 16:06:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,248,1569308400"; d="scan'208";a="211425966"
Received: from koernerm-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.41.216])
	by fmsmga001.fm.intel.com with ESMTP; 30 Oct 2019 16:06:01 -0700
To: Dan Callaghan <dan.callaghan@opengear.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
References: <20191015061510.21803-1-dan.callaghan@opengear.com>
	<20191015224456.22136-1-dan.callaghan@opengear.com>
	<20191029201821.GA26658@localhost>
	<1572385232-sup-1496@galangal.danc.bne.opengear.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <dd047b35-85bc-e238-48b3-1edae5c8dc00@intel.com>
Date: Wed, 30 Oct 2019 23:05:58 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1572385232-sup-1496@galangal.danc.bne.opengear.com>
Subject: Re: [PATCH v3] elfutils: add PACKAGECONFIG for compression algorithms
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
X-List-Received-Date: Wed, 30 Oct 2019 23:06:02 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 29/10/2019 21:46, Dan Callaghan wrote:
> I couldn't find anything that would ever use the bzip2 decompression in
> elfutils, so I had a quick look at why they even added bzip2 support in
> the first place. It turns out it was for reading compressed kernel
> images (presumably, in the elfutils tools like eu-readelf):
> 
> https://sourceware.org/git/?p=elfutils.git;a=commitdiff;h=d6ccdc1a05f27bf0bb5d802ec14f879aa9fe3e98
> 
>      commit d6ccdc1a05f27bf0bb5d802ec14f879aa9fe3e98
>      Author: Roland McGrath <roland@redhat.com>
>      Date:   Wed Aug 26 00:23:01 2009 -0700
> 
>          libdwfl: Support Linux bzip2 kernel images for automatic decompression.
> 
> And indeed on my Fedora host eu-readelf can decode ELF information from
> a kernel bzImage, but the eu-readelf built by Yocto's elfutils-native
> recipe says "not a valid ELF file" when I feed it the same bzImage.
> 
> Whether that's useful or not is a different question. In our product
> I am planning to disable bzip2 (because we don't use the elfutils tools
> for anything) and enable xz (for .gnu_debugdata sections).

Good digging, thanks.

Lets default to bzip being off for now, and then if anyone does want 
this then they can just turn it on.

Ross

