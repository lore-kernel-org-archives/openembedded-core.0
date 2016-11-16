Return-Path: <ml@embed.me.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4217A719B0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 10:19:15 +0000 (UTC)
To: "Burton, Ross" <ross.burton@intel.com>
References: <0e379627-328b-cd37-0310-67a14156d90e@embed.me.uk>
	<CAJTo0LaY5K8gY97hXbLgGkaRNbKGv-DwvLU0H1jt8oSkXg+rug@mail.gmail.com>
	<be2d8fe9-686b-b174-48a3-f609f36f0969@embed.me.uk>
	<CAJTo0LZoieB7vWei+fM=3vWzm1j4wgGmvyxE_5X0H-ZYdsZmaw@mail.gmail.com>
From: Jack Mitchell <ml@embed.me.uk>
Message-ID: <977eace4-b716-70f8-c9f3-837f0b6c239a@embed.me.uk>
Date: Wed, 16 Nov 2016 10:20:18 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZoieB7vWei+fM=3vWzm1j4wgGmvyxE_5X0H-ZYdsZmaw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: libtool --with-libtool-sysroot
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
X-List-Received-Date: Wed, 16 Nov 2016 10:19:16 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/16 17:33, Burton, Ross wrote:
>
> On 11 November 2016 at 17:31, Jack Mitchell <ml@embed.me.uk
> <mailto:ml@embed.me.uk>> wrote:
>
>     How would one check which libtool was being used, or influence which
>     one autotools chooses?
>
>
> One common problem is a makefile or configure using "libtool" directly
> instead of $(LIBTOOL).
>
> Grep the generated Makefiles for "libtool", the only instance where it
> is executed should be in an assignment to LIBTOOL.  For example, glib:
>
> LIBTOOL = $(top_builddir)/x86_64-poky-linux-libtool
>

I got to the bottom of this, I was switching between native and cross 
compiling but only running 'autoreconf -i' so it was detecting libtool 
was already present from previous native runs and not replacing it with 
our 'cross' version of libtool. I feel like there should be a binary 
compatibility check in there to auto overwrite if they don't match, but 
hey ho.

Always use autoreconf -if to force update of all the required autotools 
scripts in future.

Cheers,
Jack.

