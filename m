Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa12-04.prod.phx3.secureserver.net
	(p3plsmtpa12-04.prod.phx3.secureserver.net [68.178.252.233])
	by mail.openembedded.org (Postfix) with ESMTP id DE15E6017E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Sep 2014 09:55:41 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa12-04.prod.phx3.secureserver.net with 
	id wZvg1o00D0BVjqb01Zvggt; Sun, 28 Sep 2014 02:55:41 -0700
Message-ID: <5427DB1C.3000007@pabigot.com>
Date: Sun, 28 Sep 2014 04:55:40 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: Yi Qingliang <niqingliang2003@gmail.com>
References: <CADwFkYeYJVe0KyVY3gipy-cGm4kRhaHoit2WThcKsLnpdyyrOw@mail.gmail.com>	<54006899.3020609@pabigot.com>	<CACS+7ZRyJJUxQLU_qzbaoTo6p=x9AxRLYigPB_cgz+zg4gRq5Q@mail.gmail.com>	<5400E993.3020903@pabigot.com>	<CACS+7ZSFYoi7Osqbh6kfstSeMUJEk61HrXLBV1mCeDc5_QGaLA@mail.gmail.com>	<54012565.1050605@pabigot.com>	<CADwFkYcxf21JuyXSfsnNDPBdZY2_Xg+fQvv8gh8QnYKE0PsiZw@mail.gmail.com>	<54045A5D.6080207@pabigot.com>
	<CADwFkYfAyGNjuvw-SKRZ+OFXSrnnwyw65tre7WLfT2xqVpbR1Q@mail.gmail.com>
In-Reply-To: <CADwFkYfAyGNjuvw-SKRZ+OFXSrnnwyw65tre7WLfT2xqVpbR1Q@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Sun, 28 Sep 2014 09:55:48 -0000
Content-Type: multipart/alternative;
	boundary="------------040201020206010302020409"

--------------040201020206010302020409
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 09/27/2014 08:48 PM, Yi Qingliang wrote:
>
> https://github.com/boostorg/atomic/commit/415db7054723291042e4ff1ffa8fdd5bc8b07163
>
>  Please, see if it helps in your case.
> https://svn.boost.org/trac/boost/ticket/10446

This is probably a good patch to apply to boost 1.56 in OE, but it's too 
large to qualify as "obvious".  I use neither armv6 hosts nor Boost and 
am not actively working OE at this time, so I can't verify that it works 
on the target.  Perhaps you, Dan, or somebody else will be willing to 
create a recipe patch, validate it, and submit it here.

Peter

>
>
> On Mon, Sep 1, 2014 at 7:37 PM, Peter A. Bigot <pab@pabigot.com 
> <mailto:pab@pabigot.com>> wrote:
>
>     On 08/31/2014 09:31 PM, Yi Qingliang wrote:
>>     then what's your suggestion for now?
>
>     If the s3c6410 is ARMv6 and does not support ARMv6-K instructions,
>     then boost 1.56 does not work for your platform.  Try downgrading
>     to 1.55, or asking the Boost folks for a patch to update
>     boost/atomic/detail/caps_gcc_atomic.hpp so that it supports that
>     architecture, which lacks the byte, half-word, and double-word
>     atomic ldrex/strex instruction variants.
>
>     If the s3c6410 does support ARMv6-K instructions, you can try
>     making sure it builds with -march=arvm6k.
>
>     I don't know the conditions under which this becomes an OE-Core
>     problem.  It's not a gcc problem.
>
>     Peter
>
>
>>
>>
>>     On Sat, Aug 30, 2014 at 9:14 AM, Peter A. Bigot <pab@pabigot.com
>>     <mailto:pab@pabigot.com>> wrote:
>>
>>         On 08/29/2014 04:18 PM, Dan McGregor wrote:
>>
>>             On 29 August 2014 14:58, Peter A. Bigot <pab@pabigot.com
>>             <mailto:pab@pabigot.com>> wrote:
>>
>>                 On 08/29/2014 03:36 PM, Dan McGregor wrote:
>>
>>                     On 29 August 2014 05:48, Peter A. Bigot
>>                     <pab@pabigot.com <mailto:pab@pabigot.com>> wrote:
>>
>>                         On 08/29/2014 06:28 AM, Yi Qingliang wrote:
>>
>>                         hardware: samsung s3c6410
>>
>>                         after updated to latest poky, the boost
>>                         compile fail!
>>
>>                         error info:
>>                         libs/atomic/src/lockpool.cpp:127:5: error:
>>                         'thread_fence' is not a member
>>                         of
>>                         'boost::atomics::detail'
>>                         libs/atomic/src/lockpool.cpp:138:5: error:
>>                         'signal_fence' is not a member
>>                         of
>>                         'boost::atomics::detail'
>>
>>
>>                         after dig into it, I found that:
>>                         the marco 'BOOST_ATOMIC_FLAG_LOCK_FREE' is 0,
>>                         so it don't include
>>                         'operations_lockfree.hpp' which has
>>                         'thread_fence' and 'signal_fence',
>>                         but
>>                         pthread.h at line 21.
>>
>>                         in file 'caps_gcc_atomic.hpp',
>>                         'BOOST_ATOMIC_FLAG_LOCK_FREE' is set to
>>                         '0',
>>                         the author think if
>>                         '__GCC_ATOMIC_BOOL_LOCK_FREE' is 1, the
>>                         atomic serial
>>                         function gcc provided is not lock free.
>>
>>
>>                         This is the sort of GCC internal header
>>                         indicator that would have changed
>>                         value as a result of:
>>
>>
>>                         http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-devtools/gcc/gcc-configure-common.inc?id=0ba6ab39f187ecd4261f08e768f365f461384a3a
>>
>>
>>
>>                         at the end of 'caps_gcc_atomic.hpp', it defined
>>                         'BOOST_ATOMIC_THREAD_FENCE'
>>                         as 2.
>>
>>                         so the conflict is: BOOST_ATOMIC_THREAD_FENCE and
>>                         BOOST_ATOMIC_FLAG_LOCK_FREE
>>
>>                         I don't know it is the new poky problem, or
>>                         the boost problem, any idea?
>>
>>
>>                         My guess is that Boost is making assumptions
>>                         about what the internal GCC
>>                         predefined symbols mean that aren't entirely
>>                         accurate.  There are several
>>                         flags that are used in the libstdc++ headers
>>                         to indicate whether the
>>                         compiler is using lock-free instructions.
>>
>>                         Boost-1.56 builds without error for my
>>                         beaglebone target with poky at:
>>
>>                         * 669c07d (HEAD, origin/master, origin/HEAD,
>>                         master/upstream, master/dev)
>>                         [Wed Aug 27 14:24:52 2014 +0100] bitbake:
>>                         build/data: Write out more
>>                         complete python run files
>>
>>                         so it may have something to do with your
>>                         target machine.
>>
>>                     It absolutely does. I found that armv6 breaks,
>>                     but armv6zk and newer work.
>>
>>
>>                 Interesting.  There are no armv6zk tune features I
>>                 can see in poky, though
>>                 google suggests it applies to the Raspberry Pi.
>>
>>                 The problem then must be with the first override in this:
>>
>>                 # ARMv6+ adds atomic instructions that affect the ABI
>>                 in libraries built
>>                 # with TUNE_CCARGS in gcc-runtime. Make the compiler
>>                 default to a
>>                 # compatible architecture.  armv6 and armv7a cover
>>                 the minimum tune
>>                 # features used in OE.
>>                 EXTRA_OECONF_append_armv6 = " --with-arch=armv6"
>>                 EXTRA_OECONF_append_armv7a = " --with-arch=armv7-a"
>>
>>                 ARMv6 has LDREX/STREX, but ARMv6K adds
>>                 {LD,ST}REX{B,H,D}.  The same problem
>>                 addressed above is likely to happen if the libraries
>>                 are built with armv6k
>>                 but the compiler doesn't default to it.
>>
>>                 There are no armv6k tune parameters I can locate in
>>                 poky.  What layers have
>>                 the tune configurations that are causing problems?
>>
>>             For me meta-raspberrypi failed to build. Its tuning is
>>             -march=armv6
>>             -mtune=arm1176zjf-s by default. I forced it to -march=armv6zk
>>             -mtune=arm1176jzf-s, and that worked.
>>
>>
>>         tl;dr: for now, this can be claimed to be a boost problem,
>>         but it may rapidly become an OE problem.
>>
>>         OK, so there's several issues here.
>>
>>         Extracting the predefined symbols from gcc 4.9.1 with:
>>
>>            arm-poky-linux-gnueabi-g++ -march=armv6 -dM -E -xc++ /dev/null
>>
>>         and similarly with -march=armv6k shows that the values of
>>         these atomic-related predefines are different (- = arvm6, + =
>>         armv6k):
>>
>>         -#define __GCC_ATOMIC_BOOL_LOCK_FREE 1
>>         -#define __GCC_ATOMIC_CHAR16_T_LOCK_FREE 1
>>         +#define __GCC_ATOMIC_BOOL_LOCK_FREE 2
>>         +#define __GCC_ATOMIC_CHAR16_T_LOCK_FREE 2
>>         -#define __GCC_ATOMIC_CHAR_LOCK_FREE 1
>>         +#define __GCC_ATOMIC_CHAR_LOCK_FREE 2
>>         -#define __GCC_ATOMIC_LLONG_LOCK_FREE 1
>>         +#define __GCC_ATOMIC_LLONG_LOCK_FREE 2
>>         -#define __GCC_ATOMIC_SHORT_LOCK_FREE 1
>>         +#define __GCC_ATOMIC_SHORT_LOCK_FREE 2
>>         +#define __GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 1
>>         +#define __GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 1
>>         +#define __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 1
>>
>>         (armv6zk is the same as armv6k for atomic-related capabilities.)
>>
>>         boost/atomic/detail/caps_gcc_atomic.hpp apparently does not
>>         provide an implementation of thread_fence or signal_fence for
>>         the armv6 configuration, only for the armv6k and later ones.
>>
>>         That's a boost problem.
>>
>>         The fact that -mtune=arm1176jzf-s apparently doesn't enable
>>         the armv6k features even though gcc's source code implies it
>>         should is an anomaly.  (Check this by substituting
>>         -mtune=arm1176jzf-s for -march=armv6 and verifying that the
>>         predefined symbols are the same for both configurations.)
>>
>>         If that anomaly is ever resolved, or if meta-raspberrypi
>>         chooses to switch to -march=armv6zk, then
>>         gcc-configure-common.inc almost certainly need to recognize
>>         armv6k as an override distinct from armv6: mutex-related code
>>         built for armv6k via gcc-runtime will result in a different
>>         ABI from mutex-related code built for armv6 (what gcc will
>>         produce for builds that do not use OE's tuning parameters).
>>
>>         If the solution to the boost problem is to change
>>         meta-raspberrypi to use -march=armv6k then
>>         gcc-configure-common.inc will need to be updated as well. 
>>         Probably OE should recognize it as a distinct ARM
>>         architecture too.
>>
>>
>>         Peter
>>         -- 
>>         _______________________________________________
>>         Openembedded-core mailing list
>>         Openembedded-core@lists.openembedded.org
>>         <mailto:Openembedded-core@lists.openembedded.org>
>>         http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>
>
>
>


--------------040201020206010302020409
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 09/27/2014 08:48 PM, Yi Qingliang
      wrote:<br>
    </div>
    <blockquote
cite="mid:CADwFkYfAyGNjuvw-SKRZ+OFXSrnnwyw65tre7WLfT2xqVpbR1Q@mail.gmail.com"
      type="cite">
      <div dir="ltr"><br>
         <a moz-do-not-send="true"
href="https://github.com/boostorg/atomic/commit/415db7054723291042e4ff1ffa8fdd5bc8b07163"
          target="_blank">https://github.com/boostorg/atomic/commit/415db7054723291042e4ff1ffa8fdd5bc8b07163</a><br>
        <br>
         Please, see if it helps in your case.
        <div class="">
          <div id=":bb" class="" tabindex="0"><a moz-do-not-send="true"
              href="https://svn.boost.org/trac/boost/ticket/10446"
              target="_blank">https://svn.boost.org/trac/boost/ticket/10446</a><br>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    This is probably a good patch to apply to boost 1.56 in OE, but it's
    too large to qualify as "obvious".  I use neither armv6 hosts nor
    Boost and am not actively working OE at this time, so I can't verify
    that it works on the target.  Perhaps you, Dan, or somebody else
    will be willing to create a recipe patch, validate it, and submit it
    here.<br>
    <br>
    Peter<br>
    <br>
    <blockquote
cite="mid:CADwFkYfAyGNjuvw-SKRZ+OFXSrnnwyw65tre7WLfT2xqVpbR1Q@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div><span class=""><font color="#888888"><br>
            </font></span></div>
      </div>
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On Mon, Sep 1, 2014 at 7:37 PM, Peter
          A. Bigot <span dir="ltr">&lt;<a moz-do-not-send="true"
              href="mailto:pab@pabigot.com" target="_blank">pab@pabigot.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">
            <div bgcolor="#FFFFFF" text="#000000"><span class="">
                <div>On 08/31/2014 09:31 PM, Yi Qingliang wrote:<br>
                </div>
                <blockquote type="cite">
                  <div dir="ltr">then what's your suggestion for now?</div>
                </blockquote>
                <br>
              </span> If the s3c6410 is ARMv6 and does not support
              ARMv6-K instructions, then boost 1.56 does not work for
              your platform.  Try downgrading to 1.55, or asking the
              Boost folks for a patch to update
              boost/atomic/detail/caps_gcc_atomic.hpp so that it
              supports that architecture, which lacks the byte,
              half-word, and double-word atomic ldrex/strex instruction
              variants.<br>
              <br>
              If the s3c6410 does support ARMv6-K instructions, you can
              try making sure it builds with -march=arvm6k.<br>
              <br>
              I don't know the conditions under which this becomes an
              OE-Core problem.  It's not a gcc problem.<span
                class="HOEnZb"><font color="#888888"><br>
                  <br>
                  Peter</font></span>
              <div>
                <div class="h5"><br>
                  <br>
                  <blockquote type="cite">
                    <div class="gmail_extra"><br>
                      <br>
                      <div class="gmail_quote">On Sat, Aug 30, 2014 at
                        9:14 AM, Peter A. Bigot <span dir="ltr">&lt;<a
                            moz-do-not-send="true"
                            href="mailto:pab@pabigot.com"
                            target="_blank">pab@pabigot.com</a>&gt;</span>
                        wrote:<br>
                        <blockquote class="gmail_quote" style="margin:0
                          0 0 .8ex;border-left:1px #ccc
                          solid;padding-left:1ex">
                          <div>
                            <div>On 08/29/2014 04:18 PM, Dan McGregor
                              wrote:<br>
                              <blockquote class="gmail_quote"
                                style="margin:0 0 0 .8ex;border-left:1px
                                #ccc solid;padding-left:1ex"> On 29
                                August 2014 14:58, Peter A. Bigot &lt;<a
                                  moz-do-not-send="true"
                                  href="mailto:pab@pabigot.com"
                                  target="_blank">pab@pabigot.com</a>&gt;
                                wrote:<br>
                                <blockquote class="gmail_quote"
                                  style="margin:0 0 0
                                  .8ex;border-left:1px #ccc
                                  solid;padding-left:1ex"> On 08/29/2014
                                  03:36 PM, Dan McGregor wrote:<br>
                                  <blockquote class="gmail_quote"
                                    style="margin:0 0 0
                                    .8ex;border-left:1px #ccc
                                    solid;padding-left:1ex"> On 29
                                    August 2014 05:48, Peter A. Bigot
                                    &lt;<a moz-do-not-send="true"
                                      href="mailto:pab@pabigot.com"
                                      target="_blank">pab@pabigot.com</a>&gt;

                                    wrote:<br>
                                    <blockquote class="gmail_quote"
                                      style="margin:0 0 0
                                      .8ex;border-left:1px #ccc
                                      solid;padding-left:1ex"> On
                                      08/29/2014 06:28 AM, Yi Qingliang
                                      wrote:<br>
                                      <br>
                                      hardware: samsung s3c6410<br>
                                      <br>
                                      after updated to latest poky, the
                                      boost compile fail!<br>
                                      <br>
                                      error info:<br>
                                      libs/atomic/src/lockpool.cpp:127:5:
                                      error: 'thread_fence' is not a
                                      member<br>
                                      of<br>
                                      'boost::atomics::detail'<br>
                                      libs/atomic/src/lockpool.cpp:138:5:
                                      error: 'signal_fence' is not a
                                      member<br>
                                      of<br>
                                      'boost::atomics::detail'<br>
                                      <br>
                                      <br>
                                      after dig into it, I found that:<br>
                                      the marco
                                      'BOOST_ATOMIC_FLAG_LOCK_FREE' is
                                      0, so it don't include<br>
                                      'operations_lockfree.hpp' which
                                      has 'thread_fence' and
                                      'signal_fence',<br>
                                      but<br>
                                      pthread.h at line 21.<br>
                                      <br>
                                      in file 'caps_gcc_atomic.hpp',
                                      'BOOST_ATOMIC_FLAG_LOCK_FREE' is
                                      set to<br>
                                      '0',<br>
                                      the author think if
                                      '__GCC_ATOMIC_BOOL_LOCK_FREE' is
                                      1, the atomic serial<br>
                                      function gcc provided is not lock
                                      free.<br>
                                      <br>
                                      <br>
                                      This is the sort of GCC internal
                                      header indicator that would have
                                      changed<br>
                                      value as a result of:<br>
                                      <br>
                                      <br>
                                      <a moz-do-not-send="true"
href="http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-devtools/gcc/gcc-configure-common.inc?id=0ba6ab39f187ecd4261f08e768f365f461384a3a"
                                        target="_blank">http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-devtools/gcc/gcc-configure-common.inc?id=0ba6ab39f187ecd4261f08e768f365f461384a3a</a><br>
                                      <br>
                                      <br>
                                      <br>
                                      at the end of
                                      'caps_gcc_atomic.hpp', it defined<br>
                                      'BOOST_ATOMIC_THREAD_FENCE'<br>
                                      as 2.<br>
                                      <br>
                                      so the conflict is:
                                      BOOST_ATOMIC_THREAD_FENCE and<br>
                                      BOOST_ATOMIC_FLAG_LOCK_FREE<br>
                                      <br>
                                      I don't know it is the new poky
                                      problem, or the boost problem, any
                                      idea?<br>
                                      <br>
                                      <br>
                                      My guess is that Boost is making
                                      assumptions about what the
                                      internal GCC<br>
                                      predefined symbols mean that
                                      aren't entirely accurate.  There
                                      are several<br>
                                      flags that are used in the
                                      libstdc++ headers to indicate
                                      whether the<br>
                                      compiler is using lock-free
                                      instructions.<br>
                                      <br>
                                      Boost-1.56 builds without error
                                      for my beaglebone target with poky
                                      at:<br>
                                      <br>
                                      * 669c07d (HEAD, origin/master,
                                      origin/HEAD, master/upstream,
                                      master/dev)<br>
                                      [Wed Aug 27 14:24:52 2014 +0100]
                                      bitbake: build/data: Write out
                                      more<br>
                                      complete python run files<br>
                                      <br>
                                      so it may have something to do
                                      with your target machine.<br>
                                    </blockquote>
                                    It absolutely does. I found that
                                    armv6 breaks, but armv6zk and newer
                                    work.<br>
                                  </blockquote>
                                  <br>
                                  Interesting.  There are no armv6zk
                                  tune features I can see in poky,
                                  though<br>
                                  google suggests it applies to the
                                  Raspberry Pi.<br>
                                  <br>
                                  The problem then must be with the
                                  first override in this:<br>
                                  <br>
                                  # ARMv6+ adds atomic instructions that
                                  affect the ABI in libraries built<br>
                                  # with TUNE_CCARGS in gcc-runtime. 
                                  Make the compiler default to a<br>
                                  # compatible architecture.  armv6 and
                                  armv7a cover the minimum tune<br>
                                  # features used in OE.<br>
                                  EXTRA_OECONF_append_armv6 = "
                                  --with-arch=armv6"<br>
                                  EXTRA_OECONF_append_armv7a = "
                                  --with-arch=armv7-a"<br>
                                  <br>
                                  ARMv6 has LDREX/STREX, but ARMv6K adds
                                  {LD,ST}REX{B,H,D}.  The same problem<br>
                                  addressed above is likely to happen if
                                  the libraries are built with armv6k<br>
                                  but the compiler doesn't default to
                                  it.<br>
                                  <br>
                                  There are no armv6k tune parameters I
                                  can locate in poky.  What layers have<br>
                                  the tune configurations that are
                                  causing problems?<br>
                                  <br>
                                </blockquote>
                                For me meta-raspberrypi failed to build.
                                Its tuning is -march=armv6<br>
                                -mtune=arm1176zjf-s by default. I forced
                                it to -march=armv6zk<br>
                                -mtune=arm1176jzf-s, and that worked.<br>
                              </blockquote>
                              <br>
                            </div>
                          </div>
                          tl;dr: for now, this can be claimed to be a
                          boost problem, but it may rapidly become an OE
                          problem.<br>
                          <br>
                          OK, so there's several issues here.<br>
                          <br>
                          Extracting the predefined symbols from gcc
                          4.9.1 with:<br>
                          <br>
                             arm-poky-linux-gnueabi-g++ -march=armv6 -dM
                          -E -xc++ /dev/null<br>
                          <br>
                          and similarly with -march=armv6k shows that
                          the values of these atomic-related predefines
                          are different (- = arvm6, + = armv6k):<br>
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
                          (armv6zk is the same as armv6k for
                          atomic-related capabilities.)<br>
                          <br>
                          boost/atomic/detail/caps_gcc_atomic.hpp
                          apparently does not provide an implementation
                          of thread_fence or signal_fence for the armv6
                          configuration, only for the armv6k and later
                          ones.<br>
                          <br>
                          That's a boost problem.<br>
                          <br>
                          The fact that -mtune=arm1176jzf-s apparently
                          doesn't enable the armv6k features even though
                          gcc's source code implies it should is an
                          anomaly.  (Check this by substituting
                          -mtune=arm1176jzf-s for -march=armv6 and
                          verifying that the predefined symbols are the
                          same for both configurations.)<br>
                          <br>
                          If that anomaly is ever resolved, or if
                          meta-raspberrypi chooses to switch to
                          -march=armv6zk, then gcc-configure-common.inc
                          almost certainly need to recognize armv6k as
                          an override distinct from armv6: mutex-related
                          code built for armv6k via gcc-runtime will
                          result in a different ABI from mutex-related
                          code built for armv6 (what gcc will produce
                          for builds that do not use OE's tuning
                          parameters).<br>
                          <br>
                          If the solution to the boost problem is to
                          change meta-raspberrypi to use -march=armv6k
                          then gcc-configure-common.inc will need to be
                          updated as well.  Probably OE should recognize
                          it as a distinct ARM architecture too.
                          <div>
                            <div><br>
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
                </div>
              </div>
            </div>
          </blockquote>
        </div>
        <br>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------040201020206010302020409--
