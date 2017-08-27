Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DECC16E5CB
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Aug 2017 16:07:49 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7RG7iQC013443
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sun, 27 Aug 2017 17:07:45 +0100
Message-ID: <1503850064.32591.275.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alexander.kanavin@intel.com>, Trevor Woerner
	<twoerner@gmail.com>, Alexander Kanavin
	<alexander.kanavin@linux.intel.com>, seebs@seebs.net
Date: Sun, 27 Aug 2017 17:07:44 +0100
In-Reply-To: <1503849667.32591.272.camel@linuxfoundation.org>
References: <CAHUNapTr=oOvVTHvwxGJ2uPZB7Kbs4rBh9U8ZGzdNd0HuHi=1g@mail.gmail.com>
	<1503423645.32591.120.camel@linuxfoundation.org>
	<96bce0e3-a699-4993-3748-a0fc19684ffa@linux.intel.com>
	<CAHUNapRMGUyRN0omktP7x2sgk1QuHh9C-j13Am4Wo3eWYe04=w@mail.gmail.com>
	<e165f760-1c1e-1a5f-2fba-f8c293a16278@intel.com>
	<1503849667.32591.272.camel@linuxfoundation.org>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Sun, 27 Aug 2017 17:07:45 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
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
X-List-Received-Date: Sun, 27 Aug 2017 16:07:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2017-08-27 at 17:01 +0100, Richard Purdie wrote:
> On Wed, 2017-08-23 at 15:46 +0300, Alexander Kanavin wrote:
> > 
> > On 08/22/2017 09:46 PM, Trevor Woerner wrote:
> > > $ strace -p 43675
> Process 43675 attached
> read(1025,

And the answer is staring me in the face. select() only supports FDs up
to 1024. 1025 > 1024 which is > FD_SETSIZE.

Therefore pseudo hangs when we run into large numbers of fds :/.

https://access.redhat.com/solutions/488623

So I think we might at least understand what is breaking. It may be
using poll/epoll would work instead?

Cheers,

Richard





