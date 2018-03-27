Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id D3C39785A3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 16:46:46 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 1A74D2E892B;
	Tue, 27 Mar 2018 11:46:48 -0500 (CDT)
Date: Tue, 27 Mar 2018 11:46:46 -0500
From: Seebs <seebs@seebs.net>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Message-ID: <20180327114646.3e7fe6c5@seebsdell>
In-Reply-To: <lyr2o5o57m.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20180324142427.53da953d@seebsdell>
	<CAJ86T=U+0aG2gv6w_fJGCiN-VbO06is6-0gc+0bq+yvjBP=tNA@mail.gmail.com>
	<20180324145044.168f7e3f@seebsdell>
	<alpine.LRH.2.00.1803241306460.40806@sjc-ads-6991.cisco.com>
	<CAJTo0LbCLW+VH+hGz+D9GQZHZ5sb3NEiN6C-FmNBQHzHmddEeQ@mail.gmail.com>
	<alpine.LRH.2.00.1803241637120.40806@sjc-ads-6991.cisco.com>
	<CAJ86T=VB0axF8Lc-fEGuodFOLF_=UexUoGVoHt6+A9+m3bVs4w@mail.gmail.com>
	<alpine.LRH.2.00.1803242204010.40806@sjc-ads-6991.cisco.com>
	<CAJ86T=WBP_Cw133Z1s0LxjL-sgp3YQmuYGx7eBxUFACUJP++nw@mail.gmail.com>
	<CALbNGRREDMPeqY5WXmen77eEDQJwVu_QnkbDFCyPz0BOyUsL4A@mail.gmail.com>
	<20180326143107.48f153a5@seebsdell>
	<CAJ86T=X4u0=82wPCdwngRwQL-==trUDVfuH-4FGC-2G6AmfVgg@mail.gmail.com>
	<ly370lpt0f.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20180327105028.188e6bdc@seebsdell>
	<lyr2o5o57m.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Tue, 27 Mar 2018 16:46:46 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 27 Mar 2018 18:26:05 +0200
Enrico Scholz <enrico.scholz@sigma-chemnitz.de> wrote:

> Perhaps we have different man pages but e.g. [1] mentions only
> registers in the context of the kernel interface but not when
> entering/leaving syscall(2) itself.

And yet, it's syscall(2) doing the thing... or possibly it's not,
because it turns out I don't read IA64 assembly.

> When, then this is completely undocumented and a glibc-only thing.
> Other implementations[2] follow the behavior described in the man page
> and do not set some magic registers on return.

> I did not found the glibc syscall implementation for MIPS atm.

Hmm. In MIPS, it does appear that glibc's syscall is *using* the return
register, rather than writing to it.

Yeah, I misread the IA64 code.

I'm gonna go ahead and try to implement a wrapper. Until I've got test
cases available, it's gonna be a custom wrapper, that will ENOTSUP for
renameat2, and try to pass other things on naively.

But I think Andre and Enrico are right that the code in glibc is not
doing what I interpreted it as doing.

-s

