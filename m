Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 32DB46056B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 06:17:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 May 2018 23:17:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,435,1520924400"; d="scan'208";a="44340516"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 23 May 2018 23:17:47 -0700
To: changqing.li@windriver.com, openembedded-core@lists.openembedded.org
References: <1527128327-337273-1-git-send-email-changqing.li@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <56ab211d-9139-633f-ea4b-928ae39d2205@linux.intel.com>
Date: Thu, 24 May 2018 09:17:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1527128327-337273-1-git-send-email-changqing.li@windriver.com>
Subject: Re: [PATCH] liberation-fonts/cantarell-fonts: fix postinst failed warning
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
X-List-Received-Date: Thu, 24 May 2018 06:17:48 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05/24/2018 05:18 AM, changqing.li@windriver.com wrote:
> in update_font_cache, it runs:
> qemuwrapper -L $D -E LD_LIBRARY_PATH=$D/${libdir}:$D/${base_libdir} -E ${fontconfigcacheenv} $D${bindir}/fc-cache --sysroot=$D --system-only
> 
> qemuwrapper sets LD_LIBRARY_PATH=$D/${libdir}:$D/${base_libdir} for fc-cache,
> if inherit allarch, ${base_libdir} is "/lib", ${libdir} is "/usr/lib",
> but in this case, fc-cache need /lib64 and /usr/lib64 to run,
> So fc-cache doesn't work, and caused the warning.
> so remove allarch from these two recipes who both inherit allarch and fontcahe to fix this problem.

We have discussed and attempted to fix this several times before, 
including the way you do above. Removing allarch is not right, as the 
content of the recipe is arch-independent and so should be built only once.

The right way to deal with this is to fix qemuwrapper-cross, so that it 
sets the library paths itself, rather than gets them from 
postinst_intercept.

Alex

