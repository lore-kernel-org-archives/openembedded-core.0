Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id B469B71E4B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Aug 2017 15:17:58 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Aug 2017 08:17:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,442,1498546800"; d="scan'208";a="145360645"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 28 Aug 2017 08:17:58 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Trevor Woerner <twoerner@gmail.com>, seebs@seebs.net
References: <CAHUNapTr=oOvVTHvwxGJ2uPZB7Kbs4rBh9U8ZGzdNd0HuHi=1g@mail.gmail.com>
	<1503423645.32591.120.camel@linuxfoundation.org>
	<96bce0e3-a699-4993-3748-a0fc19684ffa@linux.intel.com>
	<CAHUNapRMGUyRN0omktP7x2sgk1QuHh9C-j13Am4Wo3eWYe04=w@mail.gmail.com>
	<e165f760-1c1e-1a5f-2fba-f8c293a16278@intel.com>
	<1503849667.32591.272.camel@linuxfoundation.org>
	<1503850064.32591.275.camel@linuxfoundation.org>
	<a8c771fb-2b49-131d-cbc4-d885a6701279@linux.intel.com>
	<1503931429.32591.284.camel@linuxfoundation.org>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <5704e6f0-f4eb-5493-5281-eef0866197e3@linux.intel.com>
Date: Mon, 28 Aug 2017 18:14:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1503931429.32591.284.camel@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: long (never ending?) do_install for adwaita-icon-theme
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
X-List-Received-Date: Mon, 28 Aug 2017 15:17:58 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/28/2017 05:43 PM, Richard Purdie wrote:

> The bitfield operation that says "can I read this fd?" probably
> overflows into the next data item in the structure (I haven't checked
> exactly how it fails). It may be "set", certainly the case I debugged
> had to have thought it was and the code thinks "fd 1025 is ready for
> reading" when in fact it may not be. The code then calls read() on it
> and if it wasn't ready for reading, it would block.

Right; what I am getting at is that we might have a bug here 
(specifically the absence of check against FD_SETSIZE), rather than 
something that needs to be solved by switching to poll().

Does the code use that constant anywhere?

Alex

