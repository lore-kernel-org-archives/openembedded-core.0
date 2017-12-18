Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 51BCD7199D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Dec 2017 13:50:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Dec 2017 05:50:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,422,1508828400"; 
   d="scan'208";a="3649323"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga007.jf.intel.com with ESMTP; 18 Dec 2017 05:50:03 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <20171213153307.26576-1-alexander.kanavin@linux.intel.com>
	<20171213153307.26576-2-alexander.kanavin@linux.intel.com>
	<CAJTo0Lb22=fxt6RpCcTOv3gA5MRvGks6+X9v36syu1Vq0z-ibA@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <6dc10e26-4882-9a64-29e7-8bb200491d72@linux.intel.com>
Date: Mon, 18 Dec 2017 15:50:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lb22=fxt6RpCcTOv3gA5MRvGks6+X9v36syu1Vq0z-ibA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/15] rpm: update to 4.14.0
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
X-List-Received-Date: Mon, 18 Dec 2017 13:50:03 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 12/16/2017 02:24 AM, Burton, Ross wrote:
> This is causing the signing selftest to fail:
> 
> 2017-12-15 06:04:10,233 - oe-selftest - INFO - 
> ======================================================================
> 2017-12-15 06:04:10,233 - oe-selftest - INFO - FAIL: 
> test_signing_packages (signing.Signing)
> 2017-12-15 06:04:10,233 - oe-selftest - INFO - 
> ----------------------------------------------------------------------
> 2017-12-15 06:04:10,233 - oe-selftest - INFO - Traceback (most recent 
> call last):
>    File 
> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/core/decorator/__init__.py", 
> line 32, in wrapped_f
>      return func(*args, **kwargs)
>    File 
> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/cases/signing.py", 
> line 90, in test_signing_packages
>      self.assertIn('rsa sha1 (md5) pgp md5 OK', ret.output, 'Package 
> signed incorrectly.')
> AssertionError: 'rsa sha1 (md5) pgp md5 OK' not found in 
> '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/build/tmp/deploy/rpm/core2_64/ed-1.14.2-r0.0.core2_64.rpm: 
> digests signatures OK' : Package signed incorrectly.
> 
> I spoke to Mark Hatle and he said that this suggests the only keys are 
> the internal digest signatures, the other keys were not used.

Actually, it's just rpm upstream changing the output formatting:
https://github.com/rpm-software-management/rpm/commit/a5da512b5c62b04b10a6ea6cedbfa363371741b3?diff=unified

I'll resend the patch with the fix to the reference output in the test.


Alex

