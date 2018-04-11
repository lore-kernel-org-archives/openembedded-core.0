Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C7FB5747BE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 10:16:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Apr 2018 03:16:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,435,1517904000"; d="scan'208";a="42463361"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 11 Apr 2018 03:16:05 -0700
To: Andre McCurdy <armccurdy@gmail.com>
References: <20180410120747.41814-1-alexander.kanavin@linux.intel.com>
	<20180410120747.41814-3-alexander.kanavin@linux.intel.com>
	<CAJ86T=X4cBT=RpXzvyuoOiFVX-fj_8tXO8y6JnAa08R_CBkKeA@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <0de624d1-6617-97a7-244d-5d65b8bceadf@linux.intel.com>
Date: Wed, 11 Apr 2018 13:09:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=X4cBT=RpXzvyuoOiFVX-fj_8tXO8y6JnAa08R_CBkKeA@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 3/5] openssl: update to 1.1.1
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
X-List-Received-Date: Wed, 11 Apr 2018 10:16:07 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/11/2018 12:20 AM, Andre McCurdy wrote:
>> -#| engines/afalg/e_afalg.c: In function 'eventfd':
>> -#| engines/afalg/e_afalg.c:110:20: error: '__NR_eventfd' undeclared (first use in this function)
>> -#|      return syscall(__NR_eventfd, n);
>> -#|                     ^~~~~~~~~~~~
>> -EXTRA_OECONF_aarch64 += "no-afalgeng"
>> +# This prevents openssl from using getrandom() which is not available on older glibc versions
>> +# (native versions can be built with newer glibc, but then relocated onto a system with older glibc)
>> +EXTRA_OECONF_class-native += "--with-rand-seed=devrandom"
>> +EXTRA_OECONF_class-nativesdk += "--with-rand-seed=devrandom"
> 
> Better to avoid += with an over-ride since it doesn't do what most new
> users etc expect. Better to use _append instead (or just the over-ride
> on it's own, if over-riding the original value is what you intended to
> do).

Thanks, I will fix this. The whole += vs. _append is a design 
shortcoming in bitbake I'd say, as it's a regular source of confusion, 
and can't be automatically QA'd.

Alex

