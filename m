Return-Path: <ross.burton@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 284E96B076
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 10:56:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Oct 2019 03:56:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,220,1569308400"; d="scan'208";a="223143630"
Received: from adahiya-mobl1.gar.corp.intel.com (HELO blackadder.local)
	([10.249.39.45])
	by fmsmga004.fm.intel.com with ESMTP; 23 Oct 2019 03:56:15 -0700
To: openembedded-core@lists.openembedded.org
References: <20191022235935.19461-1-nick.owens@eero.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <95105283-4f0b-7316-aaea-d5359fd6e115@intel.com>
Date: Wed, 23 Oct 2019 11:56:12 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191022235935.19461-1-nick.owens@eero.com>
Subject: Re: [PATCH] distutils: pass along parallel make flags to setup.py build
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
X-List-Received-Date: Wed, 23 Oct 2019 10:56:15 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 23/10/2019 00:59, Nick Owens wrote:
> parallel builds for native code in python modules was added about 5
> years ago. distutils understands '-j N', so just pass along
> ${PARALLEL_MAKE} to setup.py build.

Does distutils *only* understand -j?  It's not unusual to set 
PARALLEL_MAKE to something like '-j10 -l5' to factor in the load average.

If distutils doesn't handle -l then it's safer to use a function in 
oe.utils instead:

... ${@oe.utils.parallel_make_argument(d, "-j %d")} ...

Ross

