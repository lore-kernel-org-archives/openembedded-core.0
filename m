Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id DCAD4785A3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 16:40:17 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id D7BD02E892B;
	Tue, 27 Mar 2018 11:40:18 -0500 (CDT)
Date: Tue, 27 Mar 2018 11:40:14 -0500
From: Seebs <seebs@seebs.net>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Message-ID: <20180327114014.0f0cc48a@seebsdell>
In-Reply-To: <lymuyto4rv.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<lyk1u2re5q.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LaU41nPj1U2puHTvW272u0skdFk-gkuz3_-hXWWbxEqAg@mail.gmail.com>
	<lyd0zurcw4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20180323112820.12bc94a4@seebsdell>
	<lyy3idoa10.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20180327105539.224458a8@seebsdell>
	<lymuyto4rv.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
X-List-Received-Date: Tue, 27 Mar 2018 16:40:18 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 27 Mar 2018 18:35:32 +0200
Enrico Scholz <enrico.scholz@sigma-chemnitz.de> wrote:

> Does this really matter here?  Because the caller has to set them
> accordingly the ABI, you can extract the arguments by
> 
> 	int olddirfd        = va_arg(ap, int);
> 	char const *oldpath = va_arg(ap, char consr *);
> 	int newdirfd        = va_arg(ap, int);
> 	char const *newpath = va_arg(ap, char consr *);
>         unsigned int flags  = va_arg(ap, unsigned int);
> 
> There are no 64 bit arguments (on 32 bit platforms) which might
> require a special treatment as described in [1]
> "Architecture-specific requirements".

Okay, ignore the pointer case, and pretend it's the 64-bit value case,
since we have specific-ish documentation for that.

Look at the example for SYS_readahead, stating that the caller must
pass an extra value.

At that point, if you have a series of va_arg calls corresponding to
the values that would have been arguments had they not passed the extra
value, I don't think you get the expected arguments. So far as I can
tell, if the caller actually wrote
	varargsfunc(SYS_readahead, 0, uint64_t_value, ...)
and the function did
	va_arg(ap, uint64_t);
they would not get the value passed as the third argument, because the
calls to va_arg don't match the arguments passed.

If you could just ignore this, the SYS_readahead example wouldn't have
to exist; you could just follow the ABI and provide a 64-bit value.

-s

