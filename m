Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A0838780F9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Aug 2017 16:22:35 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7SGMWmM029647
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 28 Aug 2017 17:22:33 +0100
Message-ID: <1503937352.32591.292.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, Trevor Woerner
	<twoerner@gmail.com>, seebs@seebs.net
Date: Mon, 28 Aug 2017 17:22:32 +0100
In-Reply-To: <ce197f69-4a7a-3df6-c860-4433e97ab583@linux.intel.com>
References: <CAHUNapTr=oOvVTHvwxGJ2uPZB7Kbs4rBh9U8ZGzdNd0HuHi=1g@mail.gmail.com>
	<1503423645.32591.120.camel@linuxfoundation.org>
	<96bce0e3-a699-4993-3748-a0fc19684ffa@linux.intel.com>
	<CAHUNapRMGUyRN0omktP7x2sgk1QuHh9C-j13Am4Wo3eWYe04=w@mail.gmail.com>
	<e165f760-1c1e-1a5f-2fba-f8c293a16278@intel.com>
	<1503849667.32591.272.camel@linuxfoundation.org>
	<1503850064.32591.275.camel@linuxfoundation.org>
	<a8c771fb-2b49-131d-cbc4-d885a6701279@linux.intel.com>
	<1503931429.32591.284.camel@linuxfoundation.org>
	<5704e6f0-f4eb-5493-5281-eef0866197e3@linux.intel.com>
	<ce197f69-4a7a-3df6-c860-4433e97ab583@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Mon, 28 Aug 2017 17:22:33 +0100 (BST)
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
X-List-Received-Date: Mon, 28 Aug 2017 16:22:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-08-28 at 18:27 +0300, Alexander Kanavin wrote:
> On 08/28/2017 06:14 PM, Alexander Kanavin wrote:
> > 
> > On 08/28/2017 05:43 PM, Richard Purdie wrote:
> > 
> > > 
> > > The bitfield operation that says "can I read this fd?" probably
> > > overflows into the next data item in the structure (I haven't
> > > checked
> > > exactly how it fails). It may be "set", certainly the case I
> > > debugged
> > > had to have thought it was and the code thinks "fd 1025 is ready
> > > for
> > > reading" when in fact it may not be. The code then calls read()
> > > on it
> > > and if it wasn't ready for reading, it would block.
> > Right; what I am getting at is that we might have a bug here 
> > (specifically the absence of check against FD_SETSIZE), rather
> > than 
> > something that needs to be solved by switching to poll().
> > 
> > Does the code use that constant anywhere?
> 
>
> Actually, wait: "Executing FD_CLR() or FD_SET() with a value of fd
> that is negative or is equal to or larger than FD_SETSIZE will result
> in undefined behavior." (man select)
> 
> This means that select() cannot be used with fd >= FD_SETSIZE at all?

Correct. The code has no guards on this happening.

Cheers,

Richard

