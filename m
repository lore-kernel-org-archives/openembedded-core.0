Return-Path: <danismostlikely@gmail.com>
Received: from mail-qa0-f41.google.com (mail-qa0-f41.google.com
	[209.85.216.41])
	by mail.openembedded.org (Postfix) with ESMTP id 826367054E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 20:36:48 +0000 (UTC)
Received: by mail-qa0-f41.google.com with SMTP id m5so2696488qaj.14
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 13:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=c8fewc+Bc3D26WVXkI4luHg+SvfPG8vKSZ3dynNMLZM=;
	b=Fk9uQvIYtDwbFdfvYP9fE1Jvfow7BvYFPfSWhH+GAWkJCpTkQL7ZKOwAo5BPDKs001
	e+5+Jl0wAUSAjZ5kQqEGQsdBoWe3igyfPVp0yuJo8LdOA2rnHiQNzk/vyRyptWLp8AM8
	XR5hAA9VbekCU6/eoSQSKpYv1DSG2fqo28On6HspJzmGSVsjPeWM1Mv7GUPGEktHmmJo
	gzhaIwUe1hqD/XoMmf9JjtGIFqx+nKMyxs2FIz97KhFpTiKMP/wr0sn3M4G495G6fal0
	BI6a66qNVD+I3T8LZVEfwr6Obs1rpAM1t1z5VrcgGEBDAS+e1ZdKmeg9TiHMZypQmJDr
	qBvQ==
MIME-Version: 1.0
X-Received: by 10.140.104.162 with SMTP id a31mr19744327qgf.104.1409344609779; 
	Fri, 29 Aug 2014 13:36:49 -0700 (PDT)
Received: by 10.96.205.134 with HTTP; Fri, 29 Aug 2014 13:36:49 -0700 (PDT)
In-Reply-To: <54006899.3020609@pabigot.com>
References: <CADwFkYeYJVe0KyVY3gipy-cGm4kRhaHoit2WThcKsLnpdyyrOw@mail.gmail.com>
	<54006899.3020609@pabigot.com>
Date: Fri, 29 Aug 2014 14:36:49 -0600
Message-ID: <CACS+7ZRyJJUxQLU_qzbaoTo6p=x9AxRLYigPB_cgz+zg4gRq5Q@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: boost 1.56 compile fail
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
X-List-Received-Date: Fri, 29 Aug 2014 20:36:52 -0000
Content-Type: text/plain; charset=UTF-8

On 29 August 2014 05:48, Peter A. Bigot <pab@pabigot.com> wrote:
> On 08/29/2014 06:28 AM, Yi Qingliang wrote:
>
> hardware: samsung s3c6410
>
> after updated to latest poky, the boost compile fail!
>
> error info:
> libs/atomic/src/lockpool.cpp:127:5: error: 'thread_fence' is not a member of
> 'boost::atomics::detail'
> libs/atomic/src/lockpool.cpp:138:5: error: 'signal_fence' is not a member of
> 'boost::atomics::detail'
>
>
> after dig into it, I found that:
> the marco 'BOOST_ATOMIC_FLAG_LOCK_FREE' is 0, so it don't include
> 'operations_lockfree.hpp' which has 'thread_fence' and 'signal_fence', but
> pthread.h at line 21.
>
> in file 'caps_gcc_atomic.hpp', 'BOOST_ATOMIC_FLAG_LOCK_FREE' is set to '0',
> the author think if '__GCC_ATOMIC_BOOL_LOCK_FREE' is 1, the atomic serial
> function gcc provided is not lock free.
>
>
> This is the sort of GCC internal header indicator that would have changed
> value as a result of:
>
> http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-devtools/gcc/gcc-configure-common.inc?id=0ba6ab39f187ecd4261f08e768f365f461384a3a
>
>
>
> at the end of 'caps_gcc_atomic.hpp', it defined 'BOOST_ATOMIC_THREAD_FENCE'
> as 2.
>
> so the conflict is: BOOST_ATOMIC_THREAD_FENCE and
> BOOST_ATOMIC_FLAG_LOCK_FREE
>
> I don't know it is the new poky problem, or the boost problem, any idea?
>
>
> My guess is that Boost is making assumptions about what the internal GCC
> predefined symbols mean that aren't entirely accurate.  There are several
> flags that are used in the libstdc++ headers to indicate whether the
> compiler is using lock-free instructions.
>
> Boost-1.56 builds without error for my beaglebone target with poky at:
>
> * 669c07d (HEAD, origin/master, origin/HEAD, master/upstream, master/dev)
> [Wed Aug 27 14:24:52 2014 +0100] bitbake: build/data: Write out more
> complete python run files
>
> so it may have something to do with your target machine.

It absolutely does. I found that armv6 breaks, but armv6zk and newer work.


> Peter
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

