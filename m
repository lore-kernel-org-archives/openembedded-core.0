Return-Path: <ross.burton@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6F70F7F80F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 14:23:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Jan 2020 06:23:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,330,1574150400"; d="scan'208";a="218920904"
Received: from grossi-mobl.ger.corp.intel.com (HELO rburton-mac01.local)
	([10.252.38.20])
	by orsmga008.jf.intel.com with ESMTP; 17 Jan 2020 06:23:04 -0800
To: openembedded-core@lists.openembedded.org
References: <CAE2LOAym2eC+yJ9pFmGUGDaC9LjjO=RKr_TA_ON+m6GvRtW3YA@mail.gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <f17d90f6-e302-2ef5-b768-04e36d64b9cc@intel.com>
Date: Fri, 17 Jan 2020 14:23:03 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAE2LOAym2eC+yJ9pFmGUGDaC9LjjO=RKr_TA_ON+m6GvRtW3YA@mail.gmail.com>
Subject: Re: attr dependency on linux-yocto
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
X-List-Received-Date: Fri, 17 Jan 2020 14:23:04 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 16/01/2020 23:22, Vladimir Molokov wrote:
> Hi,
> 
> Question about attr. I'm not familiar with it.
> 
> On a clean poky is it normal(not a bug?) to have deps such as
> 
> "attr.do_build" -> "linux-libc-headers.do_package_write_rpm"
> "attr.do_build" -> "linux-yocto.do_deploy"
> "attr.do_build" -> "linux-yocto.do_package_write_rpm"
> 
> How they are appear? I didn't find anything in attr which could be the cause.
> It's just a clean poky from a repo, after . oe-init-build-env and
> bitbake -g attr.
> Appreciate any hints.

It's a long and convoluted dependency chain that only happens if you 
have ptest enabled.  I can't recall the exact details but at some point 
attr-ptest RDEPENDS on util-linux and util-linux-ptest recommends 
kernel-module-scsi-debug.

As bitbake wants to ensure dependencies are satisfiable, building attr 
will ensure a kernel is built.

Ross

