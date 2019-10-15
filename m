Return-Path: <ross.burton@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B4B316C3A9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 10:55:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Oct 2019 03:55:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,299,1566889200"; d="scan'208";a="395489711"
Received: from dirkbeck-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.252.40.171])
	by fmsmga005.fm.intel.com with ESMTP; 15 Oct 2019 03:55:32 -0700
To: openembedded-core@lists.openembedded.org
References: <20191015054827.7103-1-dan.callaghan@opengear.com>
	<20191015061510.21803-1-dan.callaghan@opengear.com>
	<e41fa2a4-1744-993c-d38a-f98229726251@gmail.com>
	<1571123420-sup-6304@galangal.danc.bne.opengear.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <84b5c0f5-e790-84e4-967c-6eace1f673ba@intel.com>
Date: Tue, 15 Oct 2019 11:55:31 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1571123420-sup-6304@galangal.danc.bne.opengear.com>
Subject: Re: [PATCH v2] elfutils: add PACKAGECONFIG for compression algorithms
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
X-List-Received-Date: Tue, 15 Oct 2019 10:55:31 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 15/10/2019 08:21, Dan Callaghan wrote:
> Poky has "bzip2-native" in ASSUME_PROVIDED. Presumably, this is because
> bzip2 (the command line program) is a required host tool and so there is
> no need to build bzip2-native just to get a working bzip2 program.
> 
> However that also means that bzip2-native libraries and headers are
> silently omitted from the recipe-sysroot-native for elfutils-native,
> even though it depends on bzip2-native. On our Jenkins, which has a very
> minimal build environment and lacks the bzip2 headers, elfutils-native
> fails to configure:
> 
>      | checking for library containing BZ2_bzdopen... no
>      | configure: error: missing -lbz2 for --with-bzlib
> 
> It seems to me the real problem here is that "bzip2-native" does not
> really belong in ASSUME_PROVIDED. Recipes can assume that the host
> provides the bzip2 *command* but not necessarily its headers and
> libraries.
> 
> So now I am not quite sure what to do...

If you need bzip-native for the libraries, DEPEND on 
bzip2-replacement-native.

Ross

