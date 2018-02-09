Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 67B4571D97
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Feb 2018 06:58:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Feb 2018 22:58:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,482,1511856000"; d="scan'208";a="16484368"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga007.fm.intel.com with ESMTP; 08 Feb 2018 22:58:19 -0800
To: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1518150301-33101-1-git-send-email-rebecca.swee.fun.chang@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <754a5028-97a1-79a3-fe48-232cea8d3a6d@linux.intel.com>
Date: Fri, 9 Feb 2018 08:52:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1518150301-33101-1-git-send-email-rebecca.swee.fun.chang@intel.com>
Subject: Re: [PATCH 1/2] bmap-tools: change SRC_URI to use tarball instead
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
X-List-Received-Date: Fri, 09 Feb 2018 06:58:19 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02/09/2018 06:25 AM, Chang Rebecca Swee Fun wrote:
> -SRC_URI = "git://github.com/intel/bmap-tools.git"
> -SRCREV = "9dad724104df265442226972a1e310813f9ffcba"
> +SRC_URI = "https://github.com/intel/${BPN}/releases/download/v${PV}/${BPN}-${PV}.tgz"

When you switch the upstream source location like this, you need to 
verify that upstream version check still works:

bitbake -c checkpkg bmap-tools

and inspect tmp/log/checkpkg.csv to see the outcome. If bitbake can no 
longer determine the latest version, set UPSTREAM_CHECK_URI to the 
webpage where all the tarballs are linked from (I think it would be 
https://github.com/intel/${BPN}/releases/). There's plenty of recipes in 
oe-core with similar adjustments, if you need further examples.

Alex

