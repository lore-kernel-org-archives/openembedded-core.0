Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-01.prod.phx3.secureserver.net
	(p3plsmtpa07-01.prod.phx3.secureserver.net [173.201.192.230])
	by mail.openembedded.org (Postfix) with ESMTP id A81B86FE64
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Sep 2014 11:37:04 +0000 (UTC)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa07-01.prod.phx3.secureserver.net with 
	id lnd11o00F1mTNtu01nd1QZ; Mon, 01 Sep 2014 04:37:05 -0700
Message-ID: <54045A5D.6080207@pabigot.com>
Date: Mon, 01 Sep 2014 06:37:01 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Yi Qingliang <niqingliang2003@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
References: <CADwFkYeYJVe0KyVY3gipy-cGm4kRhaHoit2WThcKsLnpdyyrOw@mail.gmail.com>	<54006899.3020609@pabigot.com>	<CACS+7ZRyJJUxQLU_qzbaoTo6p=x9AxRLYigPB_cgz+zg4gRq5Q@mail.gmail.com>	<5400E993.3020903@pabigot.com>	<CACS+7ZSFYoi7Osqbh6kfstSeMUJEk61HrXLBV1mCeDc5_QGaLA@mail.gmail.com>	<54012565.1050605@pabigot.com>
	<CADwFkYcxf21JuyXSfsnNDPBdZY2_Xg+fQvv8gh8QnYKE0PsiZw@mail.gmail.com>
In-Reply-To: <CADwFkYcxf21JuyXSfsnNDPBdZY2_Xg+fQvv8gh8QnYKE0PsiZw@mail.gmail.com>
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
X-List-Received-Date: Mon, 01 Sep 2014 11:37:08 -0000
Content-Type: multipart/alternative;
	boundary="------------090904000309080109050609"

--------------090904000309080109050609
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/31/2014 09:31 PM, Yi Qingliang wrote:
> then what's your suggestion for now?

If the s3c6410 is ARMv6 and does not support ARMv6-K instructions, then 
boost 1.56 does not work for your platform.  Try downgrading to 1.55, or 
asking the Boost folks for a patch to update 
boost/atomic/detail/caps_gcc_atomic.hpp so that it supports that 
architecture, which lacks the byte, half-word, and double-word atomic 
ldrex/strex instruction variants.

If the s3c6410 does support ARMv6-K instructions, you can try making 
sure it builds with -march=arvm6k.

I don't know the conditions under which this becomes an OE-Core 
problem.  It's not a gcc problem.

Peter

>
>
> On Sat, Aug 30, 2014 at 9:14 AM, Peter A. Bigot <pab@pabigot.com 
> <mailto:pab@pabigot.com>> wrote:
>
>     On 08/29/2014 04:18 PM, Dan McGregor wrote:
>
>         On 29 August 2014 14:58, Peter A. Bigot <pab@pabigot.com
>         <mailto:pab@pabigot.com>> wrote:
>
>             On 08/29/2014 03:36 PM, Dan McGregor wrote:
>
>                 On 29 August 2014 05:48, Peter A. Bigot
>                 <pab@pabigot.com <mailto:pab@pabigot.com>> wrote:
>
>                     On 08/29/2014 06:28 AM, Yi Qingliang wrote:
>
>                     hardware: samsung s3c6410
>
>                     after updated to latest poky, the boost compile fail!
>
>                     error info:
>                     libs/atomic/src/lockpool.cpp:127:5: error:
>                     'thread_fence' is not a member
>                     of
>                     'boost::atomics::detail'
>                     libs/atomic/src/lockpool.cpp:138:5: error:
>                     'signal_fence' is not a member
>                     of
>                     'boost::atomics::detail'
>
>
>                     after dig into it, I found that:
>                     the marco 'BOOST_ATOMIC_FLAG_LOCK_FREE' is 0, so
>                     it don't include
>                     'operations_lockfree.hpp' which has 'thread_fence'
>                     and 'signal_fence',
>                     but
>                     pthread.h at line 21.
>
>                     in file 'caps_gcc_atomic.hpp',
>                     'BOOST_ATOMIC_FLAG_LOCK_FREE' is set to
>                     '0',
>                     the author think if '__GCC_ATOMIC_BOOL_LOCK_FREE'
>                     is 1, the atomic serial
>                     function gcc provided is not lock free.
>
>
>                     This is the sort of GCC internal header indicator
>                     that would have changed
>                     value as a result of:
>
>
>                     http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-devtools/gcc/gcc-configure-common.inc?id=0ba6ab39f187ecd4261f08e768f365f461384a3a
>
>
>
>                     at the end of 'caps_gcc_atomic.hpp', it defined
>                     'BOOST_ATOMIC_THREAD_FENCE'
>                     as 2.
>
>                     so the conflict is: BOOST_ATOMIC_THREAD_FENCE and
>                     BOOST_ATOMIC_FLAG_LOCK_FREE
>
>                     I don't know it is the new poky problem, or the
>                     boost problem, any idea?
>
>
>                     My guess is that Boost is making assumptions about
>                     what the internal GCC
>                     predefined symbols mean that aren't entirely
>                     accurate.  There are several
>                     flags that are used in the libstdc++ headers to
>                     indicate whether the
>                     compiler is using lock-free instructions.
>
>                     Boost-1.56 builds without error for my beaglebone
>                     target with poky at:
>
>                     * 669c07d (HEAD, origin/master, origin/HEAD,
>                     master/upstream, master/dev)
>                     [Wed Aug 27 14:24:52 2014 +0100] bitbake:
>                     build/data: Write out more
>                     complete python run files
>
>                     so it may have something to do with your target
>                     machine.
>
>                 It absolutely does. I found that armv6 breaks, but
>                 armv6zk and newer work.
>
>
>             Interesting.  There are no armv6zk tune features I can see
>             in poky, though
>             google suggests it applies to the Raspberry Pi.
>
>             The problem then must be with the first override in this:
>
>             # ARMv6+ adds atomic instructions that affect the ABI in
>             libraries built
>             # with TUNE_CCARGS in gcc-runtime.  Make the compiler
>             default to a
>             # compatible architecture.  armv6 and armv7a cover the
>             minimum tune
>             # features used in OE.
>             EXTRA_OECONF_append_armv6 = " --with-arch=armv6"
>             EXTRA_OECONF_append_armv7a = " --with-arch=armv7-a"
>
>             ARMv6 has LDREX/STREX, but ARMv6K adds {LD,ST}REX{B,H,D}. 
>             The same problem
>             addressed above is likely to happen if the libraries are
>             built with armv6k
>             but the compiler doesn't default to it.
>
>             There are no armv6k tune parameters I can locate in poky. 
>             What layers have
>             the tune configurations that are causing problems?
>
>         For me meta-raspberrypi failed to build. Its tuning is
>         -march=armv6
>         -mtune=arm1176zjf-s by default. I forced it to -march=armv6zk
>         -mtune=arm1176jzf-s, and that worked.
>
>
>     tl;dr: for now, this can be claimed to be a boost problem, but it
>     may rapidly become an OE problem.
>
>     OK, so there's several issues here.
>
>     Extracting the predefined symbols from gcc 4.9.1 with:
>
>        arm-poky-linux-gnueabi-g++ -march=armv6 -dM -E -xc++ /dev/null
>
>     and similarly with -march=armv6k shows that the values of these
>     atomic-related predefines are different (- = arvm6, + = armv6k):
>
>     -#define __GCC_ATOMIC_BOOL_LOCK_FREE 1
>     -#define __GCC_ATOMIC_CHAR16_T_LOCK_FREE 1
>     +#define __GCC_ATOMIC_BOOL_LOCK_FREE 2
>     +#define __GCC_ATOMIC_CHAR16_T_LOCK_FREE 2
>     -#define __GCC_ATOMIC_CHAR_LOCK_FREE 1
>     +#define __GCC_ATOMIC_CHAR_LOCK_FREE 2
>     -#define __GCC_ATOMIC_LLONG_LOCK_FREE 1
>     +#define __GCC_ATOMIC_LLONG_LOCK_FREE 2
>     -#define __GCC_ATOMIC_SHORT_LOCK_FREE 1
>     +#define __GCC_ATOMIC_SHORT_LOCK_FREE 2
>     +#define __GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 1
>     +#define __GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 1
>     +#define __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 1
>
>     (armv6zk is the same as armv6k for atomic-related capabilities.)
>
>     boost/atomic/detail/caps_gcc_atomic.hpp apparently does not
>     provide an implementation of thread_fence or signal_fence for the
>     armv6 configuration, only for the armv6k and later ones.
>
>     That's a boost problem.
>
>     The fact that -mtune=arm1176jzf-s apparently doesn't enable the
>     armv6k features even though gcc's source code implies it should is
>     an anomaly.  (Check this by substituting -mtune=arm1176jzf-s for
>     -march=armv6 and verifying that the predefined symbols are the
>     same for both configurations.)
>
>     If that anomaly is ever resolved, or if meta-raspberrypi chooses
>     to switch to -march=armv6zk, then gcc-configure-common.inc almost
>     certainly need to recognize armv6k as an override distinct from
>     armv6: mutex-related code built for armv6k via gcc-runtime will
>     result in a different ABI from mutex-related code built for armv6
>     (what gcc will produce for builds that do not use OE's tuning
>     parameters).
>
>     If the solution to the boost problem is to change meta-raspberrypi
>     to use -march=armv6k then gcc-configure-common.inc will need to be
>     updated as well. Probably OE should recognize it as a distinct ARM
>     architecture too.
>
>
>     Peter
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


--------------090904000309080109050609
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 08/31/2014 09:31 PM, Yi Qingliang
      wrote:<br>
    </div>
    <blockquote
cite="mid:CADwFkYcxf21JuyXSfsnNDPBdZY2_Xg+fQvv8gh8QnYKE0PsiZw@mail.gmail.com"
      type="cite">
      <div dir="ltr">then what's your suggestion for now?</div>
    </blockquote>
    <br>
    If the s3c6410 is ARMv6 and does not support ARMv6-K instructions,
    then boost 1.56 does not work for your platform.  Try downgrading to
    1.55, or asking the Boost folks for a patch to update
    boost/atomic/detail/caps_gcc_atomic.hpp so that it supports that
    architecture, which lacks the byte, half-word, and double-word
    atomic ldrex/strex instruction variants.<br>
    <br>
    If the s3c6410 does support ARMv6-K instructions, you can try making
    sure it builds with -march=arvm6k.<br>
    <br>
    I don't know the conditions under which this becomes an OE-Core
    problem.  It's not a gcc problem.<br>
    <br>
    Peter<br>
    <br>
    <blockquote
cite="mid:CADwFkYcxf21JuyXSfsnNDPBdZY2_Xg+fQvv8gh8QnYKE0PsiZw@mail.gmail.com"
      type="cite">
      <div class="gmail_extra"><br>
        <br>
        <div class="gmail_quote">On Sat, Aug 30, 2014 at 9:14 AM, Peter
          A. Bigot <span dir="ltr">&lt;<a moz-do-not-send="true"
              href="mailto:pab@pabigot.com" target="_blank">pab@pabigot.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">
            <div class="HOEnZb">
              <div class="h5">On 08/29/2014 04:18 PM, Dan McGregor
                wrote:<br>
                <blockquote class="gmail_quote" style="margin:0 0 0
                  .8ex;border-left:1px #ccc solid;padding-left:1ex">
                  On 29 August 2014 14:58, Peter A. Bigot &lt;<a
                    moz-do-not-send="true" href="mailto:pab@pabigot.com"
                    target="_blank">pab@pabigot.com</a>&gt; wrote:<br>
                  <blockquote class="gmail_quote" style="margin:0 0 0
                    .8ex;border-left:1px #ccc solid;padding-left:1ex">
                    On 08/29/2014 03:36 PM, Dan McGregor wrote:<br>
                    <blockquote class="gmail_quote" style="margin:0 0 0
                      .8ex;border-left:1px #ccc solid;padding-left:1ex">
                      On 29 August 2014 05:48, Peter A. Bigot &lt;<a
                        moz-do-not-send="true"
                        href="mailto:pab@pabigot.com" target="_blank">pab@pabigot.com</a>&gt;
                      wrote:<br>
                      <blockquote class="gmail_quote" style="margin:0 0
                        0 .8ex;border-left:1px #ccc
                        solid;padding-left:1ex">
                        On 08/29/2014 06:28 AM, Yi Qingliang wrote:<br>
                        <br>
                        hardware: samsung s3c6410<br>
                        <br>
                        after updated to latest poky, the boost compile
                        fail!<br>
                        <br>
                        error info:<br>
                        libs/atomic/src/lockpool.cpp:127:5: error:
                        'thread_fence' is not a member<br>
                        of<br>
                        'boost::atomics::detail'<br>
                        libs/atomic/src/lockpool.cpp:138:5: error:
                        'signal_fence' is not a member<br>
                        of<br>
                        'boost::atomics::detail'<br>
                        <br>
                        <br>
                        after dig into it, I found that:<br>
                        the marco 'BOOST_ATOMIC_FLAG_LOCK_FREE' is 0, so
                        it don't include<br>
                        'operations_lockfree.hpp' which has
                        'thread_fence' and 'signal_fence',<br>
                        but<br>
                        pthread.h at line 21.<br>
                        <br>
                        in file 'caps_gcc_atomic.hpp',
                        'BOOST_ATOMIC_FLAG_LOCK_FREE' is set to<br>
                        '0',<br>
                        the author think if
                        '__GCC_ATOMIC_BOOL_LOCK_FREE' is 1, the atomic
                        serial<br>
                        function gcc provided is not lock free.<br>
                        <br>
                        <br>
                        This is the sort of GCC internal header
                        indicator that would have changed<br>
                        value as a result of:<br>
                        <br>
                        <br>
                        <a moz-do-not-send="true"
href="http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-devtools/gcc/gcc-configure-common.inc?id=0ba6ab39f187ecd4261f08e768f365f461384a3a"
                          target="_blank">http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-devtools/gcc/gcc-configure-common.inc?id=0ba6ab39f187ecd4261f08e768f365f461384a3a</a><br>
                        <br>
                        <br>
                        <br>
                        at the end of 'caps_gcc_atomic.hpp', it defined<br>
                        'BOOST_ATOMIC_THREAD_FENCE'<br>
                        as 2.<br>
                        <br>
                        so the conflict is: BOOST_ATOMIC_THREAD_FENCE
                        and<br>
                        BOOST_ATOMIC_FLAG_LOCK_FREE<br>
                        <br>
                        I don't know it is the new poky problem, or the
                        boost problem, any idea?<br>
                        <br>
                        <br>
                        My guess is that Boost is making assumptions
                        about what the internal GCC<br>
                        predefined symbols mean that aren't entirely
                        accurate.  There are several<br>
                        flags that are used in the libstdc++ headers to
                        indicate whether the<br>
                        compiler is using lock-free instructions.<br>
                        <br>
                        Boost-1.56 builds without error for my
                        beaglebone target with poky at:<br>
                        <br>
                        * 669c07d (HEAD, origin/master, origin/HEAD,
                        master/upstream, master/dev)<br>
                        [Wed Aug 27 14:24:52 2014 +0100] bitbake:
                        build/data: Write out more<br>
                        complete python run files<br>
                        <br>
                        so it may have something to do with your target
                        machine.<br>
                      </blockquote>
                      It absolutely does. I found that armv6 breaks, but
                      armv6zk and newer work.<br>
                    </blockquote>
                    <br>
                    Interesting.  There are no armv6zk tune features I
                    can see in poky, though<br>
                    google suggests it applies to the Raspberry Pi.<br>
                    <br>
                    The problem then must be with the first override in
                    this:<br>
                    <br>
                    # ARMv6+ adds atomic instructions that affect the
                    ABI in libraries built<br>
                    # with TUNE_CCARGS in gcc-runtime.  Make the
                    compiler default to a<br>
                    # compatible architecture.  armv6 and armv7a cover
                    the minimum tune<br>
                    # features used in OE.<br>
                    EXTRA_OECONF_append_armv6 = " --with-arch=armv6"<br>
                    EXTRA_OECONF_append_armv7a = " --with-arch=armv7-a"<br>
                    <br>
                    ARMv6 has LDREX/STREX, but ARMv6K adds
                    {LD,ST}REX{B,H,D}.  The same problem<br>
                    addressed above is likely to happen if the libraries
                    are built with armv6k<br>
                    but the compiler doesn't default to it.<br>
                    <br>
                    There are no armv6k tune parameters I can locate in
                    poky.  What layers have<br>
                    the tune configurations that are causing problems?<br>
                    <br>
                  </blockquote>
                  For me meta-raspberrypi failed to build. Its tuning is
                  -march=armv6<br>
                  -mtune=arm1176zjf-s by default. I forced it to
                  -march=armv6zk<br>
                  -mtune=arm1176jzf-s, and that worked.<br>
                </blockquote>
                <br>
              </div>
            </div>
            tl;dr: for now, this can be claimed to be a boost problem,
            but it may rapidly become an OE problem.<br>
            <br>
            OK, so there's several issues here.<br>
            <br>
            Extracting the predefined symbols from gcc 4.9.1 with:<br>
            <br>
               arm-poky-linux-gnueabi-g++ -march=armv6 -dM -E -xc++
            /dev/null<br>
            <br>
            and similarly with -march=armv6k shows that the values of
            these atomic-related predefines are different (- = arvm6, +
            = armv6k):<br>
            <br>
            -#define __GCC_ATOMIC_BOOL_LOCK_FREE 1<br>
            -#define __GCC_ATOMIC_CHAR16_T_LOCK_FREE 1<br>
            +#define __GCC_ATOMIC_BOOL_LOCK_FREE 2<br>
            +#define __GCC_ATOMIC_CHAR16_T_LOCK_FREE 2<br>
            -#define __GCC_ATOMIC_CHAR_LOCK_FREE 1<br>
            +#define __GCC_ATOMIC_CHAR_LOCK_FREE 2<br>
            -#define __GCC_ATOMIC_LLONG_LOCK_FREE 1<br>
            +#define __GCC_ATOMIC_LLONG_LOCK_FREE 2<br>
            -#define __GCC_ATOMIC_SHORT_LOCK_FREE 1<br>
            +#define __GCC_ATOMIC_SHORT_LOCK_FREE 2<br>
            +#define __GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 1<br>
            +#define __GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 1<br>
            +#define __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 1<br>
            <br>
            (armv6zk is the same as armv6k for atomic-related
            capabilities.)<br>
            <br>
            boost/atomic/detail/caps_gcc_atomic.hpp apparently does not
            provide an implementation of thread_fence or signal_fence
            for the armv6 configuration, only for the armv6k and later
            ones.<br>
            <br>
            That's a boost problem.<br>
            <br>
            The fact that -mtune=arm1176jzf-s apparently doesn't enable
            the armv6k features even though gcc's source code implies it
            should is an anomaly.  (Check this by substituting
            -mtune=arm1176jzf-s for -march=armv6 and verifying that the
            predefined symbols are the same for both configurations.)<br>
            <br>
            If that anomaly is ever resolved, or if meta-raspberrypi
            chooses to switch to -march=armv6zk, then
            gcc-configure-common.inc almost certainly need to recognize
            armv6k as an override distinct from armv6: mutex-related
            code built for armv6k via gcc-runtime will result in a
            different ABI from mutex-related code built for armv6 (what
            gcc will produce for builds that do not use OE's tuning
            parameters).<br>
            <br>
            If the solution to the boost problem is to change
            meta-raspberrypi to use -march=armv6k then
            gcc-configure-common.inc will need to be updated as well. 
            Probably OE should recognize it as a distinct ARM
            architecture too.
            <div class="HOEnZb">
              <div class="h5"><br>
                <br>
                Peter<br>
                -- <br>
                _______________________________________________<br>
                Openembedded-core mailing list<br>
                <a moz-do-not-send="true"
                  href="mailto:Openembedded-core@lists.openembedded.org"
                  target="_blank">Openembedded-core@lists.openembedded.org</a><br>
                <a moz-do-not-send="true"
                  href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                  target="_blank">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
              </div>
            </div>
          </blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------090904000309080109050609--
