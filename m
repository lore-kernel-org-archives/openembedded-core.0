Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id 6AE9E60290
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 04:41:08 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 60E5C2E8938;
	Mon, 26 Mar 2018 23:41:10 -0500 (CDT)
Date: Mon, 26 Mar 2018 23:41:08 -0500
From: Seebs <seebs@seebs.net>
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20180326234108.4b52c066@seebsdell>
In-Reply-To: <CAJ86T=X8bq6MKdvnq7sPFzjKN3ZgEJL70xHGCgSNBuC7ppi51w@mail.gmail.com>
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<alpine.LRH.2.00.1803241306460.40806@sjc-ads-6991.cisco.com>
	<CAJTo0LbCLW+VH+hGz+D9GQZHZ5sb3NEiN6C-FmNBQHzHmddEeQ@mail.gmail.com>
	<alpine.LRH.2.00.1803241637120.40806@sjc-ads-6991.cisco.com>
	<CAJ86T=VB0axF8Lc-fEGuodFOLF_=UexUoGVoHt6+A9+m3bVs4w@mail.gmail.com>
	<alpine.LRH.2.00.1803242204010.40806@sjc-ads-6991.cisco.com>
	<CAJ86T=WBP_Cw133Z1s0LxjL-sgp3YQmuYGx7eBxUFACUJP++nw@mail.gmail.com>
	<CALbNGRREDMPeqY5WXmen77eEDQJwVu_QnkbDFCyPz0BOyUsL4A@mail.gmail.com>
	<20180326143107.48f153a5@seebsdell>
	<CAJ86T=X4u0=82wPCdwngRwQL-==trUDVfuH-4FGC-2G6AmfVgg@mail.gmail.com>
	<20180326160746.1dce7ae9@seebsdell>
	<CAJ86T=VaJyJYbBTkjR1yUTSJPCFSjgZCZZkYbyGEaTWYCg+u7A@mail.gmail.com>
	<20180326203209.2da967eb@seebsdell>
	<CAJ86T=VqLZrmyLBYD4ovQc9eNJQx5Rqp8YK+=3hPHgmjqqa55w@mail.gmail.com>
	<20180326210734.165ac038@seebsdell>
	<CAJ86T=X8bq6MKdvnq7sPFzjKN3ZgEJL70xHGCgSNBuC7ppi51w@mail.gmail.com>
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: pseudo: host user contamination
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
X-List-Received-Date: Tue, 27 Mar 2018 04:41:09 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 26 Mar 2018 19:59:09 -0700
Andre McCurdy <armccurdy@gmail.com> wrote:

> The syscall manpage is from the kernel manpages, not glibc.

>   http://man7.org/linux/man-pages/man2/syscall.2.html

And yet! glibc is setting those registers in its code. Why? If that's a
kernel thing and libc doesn't need to do it, why is libc doing it?

If it's "useful background information", what exactly is it "useful"
for?

> Personally, I've read the manpage, I've read code in glibc and musl,
> I've straced coreutils mv and various little test programs on 32bit
> ARM plus 32bit and 64bit x86 and written a wrapper for libc syscall()
> which either intercepts or passes through syscalls.

Okay, you've read the code in glibc and understand it. So, why does the
glibc code have that register-setting assembly, if that register-setting
assembly doesn't matter?

You've told me several times that we don't need to think about the
register-setting code. So why did glibc include it?

> Everything I've
> found seems to be consistent to the point that I've satisfied myself
> that I have a pretty clear understanding of how libc syscall() works,
> including why ARM EABI sometimes needs an extra argument to offset
> 64bit values - and when it matters for a wrapper and when it doesn't.
> I don't think there's much more I can do.

Okay, you say you understand why ARM EABI "sometimes" needs an argument
to offset things. What are the circumstances? Is it specific to 32-bit
targets? On a target with 64-bit pointers, would it apply also to
64-bit pointers, or is it exclusively for 64-bit integers?

Because it seems to me that on a 64-bit target, renameat2() would in
fact be passing a 64-bit object as the second argument. And if there's
a reason that this doesn't count as a 64-bit argument passed after an
odd number of 32-bit arguments, I'd like to know specifically what that
reason is before I go relying on it to stay true forever.

-s

