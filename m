Return-Path: <alexander.kanavin@linux.intel.com>
X-Greylist: delayed 587 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 14 Dec 2017 14:01:48 UTC
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 34DDC60102
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Dec 2017 14:01:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Dec 2017 05:52:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,400,1508828400"; 
   d="scan'208";a="2677527"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga007.jf.intel.com with ESMTP; 14 Dec 2017 05:51:59 -0800
To: Stefan Agner <stefan@agner.ch>
References: <20171213180624.30839-1-stefan@agner.ch>
	<cce87fc26f1e975fe9ee6d9321bbb870@agner.ch>
	<56bd3e44-1478-9095-4fef-3f7453b7ec94@linux.intel.com>
	<a2a011e2de41685295946b44f13102f4@agner.ch>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <74fb0f2c-574b-56be-1bba-6b859ee07029@linux.intel.com>
Date: Thu, 14 Dec 2017 15:52:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <a2a011e2de41685295946b44f13102f4@agner.ch>
Cc: muhammad_shakeel@mentor.com, Stefan Agner <stefan.agner@toradex.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [RFC] opkg: avoid running postinst scripts twice when using systemd
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
X-List-Received-Date: Thu, 14 Dec 2017 14:01:49 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/14/2017 03:11 PM, Stefan Agner wrote:
>
>> I don't think this is correct. Some postinsts are intentionally
>> deferred to first boot, and they need to be run regardless of whether
>> the image supports runtime package management or not.
> 
> Yes I know, the mentioned opkg-keyrings is such a case.
> 
> If there is no package management, then scripts get deployed via
> /etc/*-postinsts, if package management is available then it will take
> care of it.

 From reading the code, that only happens when using rpm. In other cases 
you need to execute _save_postinsts(), regardless of whether package 
management is available on image or not.

Whatever changes you try, do run oe-selftest's 
'test_postinst_rootfs_and_boot' test against them and make sure it 
doesn't regress.


Alex

