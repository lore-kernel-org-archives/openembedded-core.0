Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6A8456076F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Oct 2017 14:28:44 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Oct 2017 07:28:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,469,1500966000"; d="scan'208";a="158391091"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 02 Oct 2017 07:28:44 -0700
To: openembedded-core@lists.openembedded.org,
	Otavio Salvador <otavio@ossystems.com.br>
References: <20171002141814.29709-1-otavio@ossystems.com.br>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <28ebae92-b3c1-7664-87f7-4c326711e647@linux.intel.com>
Date: Mon, 2 Oct 2017 17:25:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171002141814.29709-1-otavio@ossystems.com.br>
Subject: Re: [PATCH v2] lib/oe/package_manager.py (rpm): Allow use of non-signed packages
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
X-List-Received-Date: Mon, 02 Oct 2017 14:28:45 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/02/2017 05:18 PM, Otavio Salvador wrote:
> When we wish to use the package feed for local development, it does
> not uses GPG signed feeds by default but dnf uses package signature
> check. We need to configure the GPG signature check out so it works
> out of box.
> 
> With this patch, installing non-signed packages works:
> 
> $: dnf install <package>

This patch is still wrong, and for exact same reasons. You didn't change 
it at all compared to v1! I already spelled the reasons out, so I can 
repeat them quickly:

The patch adds 'gpgcheck=0' when repo feed signing is disabled, which 
will also disable package verification at runtime, ignoring the 
altogether different build setting controlling that. As I've already 
explained to you, package signing and feed signing are two different 
things, with their own sets of options.

Test case:

- enable package signing, disable package feed signing, check that the 
resulting dnf.conf file has package verification enabled (it won't).



Alex

