Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D5779758DB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 18:12:26 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 17 Jun 2016 11:12:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,484,1459839600"; d="scan'208";a="721069382"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 17 Jun 2016 11:12:27 -0700
To: Andre McCurdy <armccurdy@gmail.com>
References: <1466074764-14109-1-git-send-email-alexander.kanavin@linux.intel.com>
	<1466074764-14109-3-git-send-email-alexander.kanavin@linux.intel.com>
	<CAJ86T=WziMrSqVgrqV-M5OhEUtMTkHaepk=XEzOzVYTXpUrmxg@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <ce379f8b-d7a5-8afe-34ce-86f1a3c1e2dd@linux.intel.com>
Date: Fri, 17 Jun 2016 21:12:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=WziMrSqVgrqV-M5OhEUtMTkHaepk=XEzOzVYTXpUrmxg@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] security_flags.inc: add -fPIC to SECURITY_NO_PIE_CFLAGS
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
X-List-Received-Date: Fri, 17 Jun 2016 18:12:27 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/17/2016 05:38 AM, Andre McCurdy wrote:
>>  SECURITY_CFLAGS ?= "-fstack-protector-strong -pie -fpie ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
>> -SECURITY_NO_PIE_CFLAGS ?= "-fstack-protector-strong ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
>> +SECURITY_NO_PIE_CFLAGS ?= "-fPIC -fstack-protector-strong ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
>
> I don't think this does anything useful. An executable won't be
> position independent unless -pie is passed to the linker, so if
> linking with -pie doesn't work, forcing all object code to be position
> independent is just adding overhead with no benefit.

That's right; there is no security benefit in -fPIC alone.
Sorry for not researching this fully.

I have however disabled NO_PIE for all recipes that use it, and then 
re-enabled it for those that started to fail. This uncovered a few 
recipes where NO_PIE is no longer needed - at least on x86_64. Patch is 
coming :)


Alex

