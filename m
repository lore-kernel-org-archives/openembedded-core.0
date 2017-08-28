Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0B99D7826D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Aug 2017 10:41:46 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Aug 2017 03:41:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,441,1498546800"; d="scan'208";a="1211356256"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 28 Aug 2017 03:41:46 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Trevor Woerner <twoerner@gmail.com>, seebs@seebs.net
References: <CAHUNapTr=oOvVTHvwxGJ2uPZB7Kbs4rBh9U8ZGzdNd0HuHi=1g@mail.gmail.com>
	<1503423645.32591.120.camel@linuxfoundation.org>
	<96bce0e3-a699-4993-3748-a0fc19684ffa@linux.intel.com>
	<CAHUNapRMGUyRN0omktP7x2sgk1QuHh9C-j13Am4Wo3eWYe04=w@mail.gmail.com>
	<e165f760-1c1e-1a5f-2fba-f8c293a16278@intel.com>
	<1503849667.32591.272.camel@linuxfoundation.org>
	<1503850064.32591.275.camel@linuxfoundation.org>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <a8c771fb-2b49-131d-cbc4-d885a6701279@linux.intel.com>
Date: Mon, 28 Aug 2017 13:38:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1503850064.32591.275.camel@linuxfoundation.org>
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
X-List-Received-Date: Mon, 28 Aug 2017 10:41:47 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/27/2017 07:07 PM, Richard Purdie wrote:
>>> On 08/22/2017 09:46 PM, Trevor Woerner wrote:
>>>> $ strace -p 43675
>> Process 43675 attached
>> read(1025,
> 
> And the answer is staring me in the face. select() only supports FDs up
> to 1024. 1025 > 1024 which is > FD_SETSIZE.
> 
> Therefore pseudo hangs when we run into large numbers of fds :/.
> 
> https://access.redhat.com/solutions/488623
> 
> So I think we might at least understand what is breaking. It may be
> using poll/epoll would work instead?

What I don't understand is how exceeding the fd limit in select() leads 
to read() that never finishes. Can you clarify the sequence please?

Alex

