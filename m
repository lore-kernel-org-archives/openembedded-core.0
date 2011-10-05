Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RBUus-0003ag-Kf for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 19:05:58 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p95H6pFf001886; Wed, 5 Oct 2011 18:06:51 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id W4GhtQHgKRYs; Wed,  5 Oct 2011 18:06:51 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p95H6luF001880
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Wed, 5 Oct 2011 18:06:49 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: McClintock Matthew-B29882 <B29882@freescale.com>, Patches and
	discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 05 Oct 2011 18:00:11 +0100
In-Reply-To: <CAEsOVNeR+DL15jM9TBc9mZkBe4uhD3xJvt=5jrqss+t+k9R-Bg@mail.gmail.com>
References: <1317322353-30258-1-git-send-email-msm@freescale.com>
	<4E8A0B81.1080507@gmail.com>
	<CAEsOVNcvCgboed7tx68aT_CemeN_pVd_k0JM_cWVDiMtRrCG0w@mail.gmail.com>
	<4E8A2667.4090700@gmail.com>
	<CAEsOVNdahRcHTCfVhaqFZiVaKhAtM2a6L6GTm61RtsGoJxjB6A@mail.gmail.com>
	<1317814486.14671.136.camel@ted>
	<CAEsOVNeR+DL15jM9TBc9mZkBe4uhD3xJvt=5jrqss+t+k9R-Bg@mail.gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317834019.6398.18.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH v2 10/16] Fix mdadm for powerpc64
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Oct 2011 17:05:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-10-05 at 16:53 +0000, McClintock Matthew-B29882 wrote:
> On Wed, Oct 5, 2011 at 6:34 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > I dug into this a bit. To quote asm/types.h:
> >
> > /*
> >  * This is here because we used to use l64 for 64bit powerpc
> >  * and we don't want to impact user mode with our change to ll64
> >  * in the kernel.
> >  */
> > #if defined(__powerpc64__) && !defined(__KERNEL__)
> > # include <asm-generic/int-l64.h>
> > #else
> > # include <asm-generic/int-ll64.h>
> > #endif
> >
> > So ppc64 kernel space uses ll64 and userspace uses l64.
> >
> > This means __u64 is a long for ppc64 but a long long for x86_64. The
> > format errors occurs rightly because a ull is being printed from a ul
> > variable. This will happen to work but its messy.
> 
> Sorry, I'm missing if you are suggesting a solution here... do I need
> to take an alternate approach? The alternative is to patch the
> printfs?

That is the alternative that could probably make it upstream.

I did this mainly to understand what the difference between x86_64 and
ppc64 was so in future I can better spot problem areas and perhaps
others can too.

I'll take the patch but I'd like to include more information about the
reason for the problem in the commit message and strongly hint that it
would be great to get these issues fixed upstream, properly.

Cheers,

Richard



