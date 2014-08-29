Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-02.prod.phx3.secureserver.net
	(p3plsmtpa07-02.prod.phx3.secureserver.net [173.201.192.231])
	by mail.openembedded.org (Postfix) with ESMTP id 714EF70281
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 11:48:42 +0000 (UTC)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa07-02.prod.phx3.secureserver.net with 
	id kboh1o0091mTNtu01bohN9; Fri, 29 Aug 2014 04:48:42 -0700
Message-ID: <54006899.3020609@pabigot.com>
Date: Fri, 29 Aug 2014 06:48:41 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CADwFkYeYJVe0KyVY3gipy-cGm4kRhaHoit2WThcKsLnpdyyrOw@mail.gmail.com>
In-Reply-To: <CADwFkYeYJVe0KyVY3gipy-cGm4kRhaHoit2WThcKsLnpdyyrOw@mail.gmail.com>
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
X-List-Received-Date: Fri, 29 Aug 2014 11:48:43 -0000
Content-Type: multipart/alternative;
	boundary="------------020202080407070102080200"

--------------020202080407070102080200
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 08/29/2014 06:28 AM, Yi Qingliang wrote:
> hardware: samsung s3c6410
>
> after updated to latest poky, the boost compile fail!
>
> error info:
> libs/atomic/src/lockpool.cpp:127:5: error: 'thread_fence' is not a 
> member of 'boost::atomics::detail'
> libs/atomic/src/lockpool.cpp:138:5: error: 'signal_fence' is not a 
> member of 'boost::atomics::detail'
>
>
> after dig into it, I found that:
> the marco 'BOOST_ATOMIC_FLAG_LOCK_FREE' is 0, so it don't include 
> 'operations_lockfree.hpp' which has 'thread_fence' and 'signal_fence', 
> but pthread.h at line 21.
>
> in file 'caps_gcc_atomic.hpp', 'BOOST_ATOMIC_FLAG_LOCK_FREE' is set to 
> '0', the author think if '__GCC_ATOMIC_BOOL_LOCK_FREE' is 1, the 
> atomic serial function gcc provided is not lock free.

This is the sort of GCC internal header indicator that would have 
changed value as a result of:

http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-devtools/gcc/gcc-configure-common.inc?id=0ba6ab39f187ecd4261f08e768f365f461384a3a

>
> at the end of 'caps_gcc_atomic.hpp', it defined 
> 'BOOST_ATOMIC_THREAD_FENCE' as 2.
>
> so the conflict is: *BOOST_ATOMIC_THREAD_FENCE* and 
> *BOOST_ATOMIC_FLAG_LOCK_FREE*
> *
> *
> I don't know it is the new poky problem, or the boost problem, any idea?

My guess is that Boost is making assumptions about what the internal GCC 
predefined symbols mean that aren't entirely accurate.  There are 
several flags that are used in the libstdc++ headers to indicate whether 
the compiler is using lock-free instructions.

Boost-1.56 builds without error for my beaglebone target with poky at:

* 669c07d (HEAD, origin/master, origin/HEAD, master/upstream, 
master/dev) [Wed Aug 27 14:24:52 2014 +0100] bitbake: build/data: Write 
out more complete python run files

so it may have something to do with your target machine.

Peter

--------------020202080407070102080200
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 08/29/2014 06:28 AM, Yi Qingliang
      wrote:<br>
    </div>
    <blockquote
cite="mid:CADwFkYeYJVe0KyVY3gipy-cGm4kRhaHoit2WThcKsLnpdyyrOw@mail.gmail.com"
      type="cite">
      <div dir="ltr">hardware: samsung s3c6410<br>
        <br>
        after updated to latest poky, the boost compile fail!<br>
        <br>
        error info:
        <div>
          <div>libs/atomic/src/lockpool.cpp:127:5: error: 'thread_fence'
            is not a member of 'boost::atomics::detail'<br>
          </div>
          <div>libs/atomic/src/lockpool.cpp:138:5: error: 'signal_fence'
            is not a member of 'boost::atomics::detail'</div>
        </div>
        <div><br>
        </div>
        <div><br>
        </div>
        <div>after dig into it, I found that:</div>
        <div>the marco 'BOOST_ATOMIC_FLAG_LOCK_FREE' is 0, so it don't
          include 'operations_lockfree.hpp' which has 'thread_fence' and
          'signal_fence', but pthread.h at line 21.<br>
          <br>
        </div>
        <div>in file 'caps_gcc_atomic.hpp',
          'BOOST_ATOMIC_FLAG_LOCK_FREE' is set to '0', the author think
          if '__GCC_ATOMIC_BOOL_LOCK_FREE' is 1, the atomic serial
          function gcc provided is not lock free.</div>
      </div>
    </blockquote>
    <br>
    This is the sort of GCC internal header indicator that would have
    changed value as a result of:<br>
    <br>
<a class="moz-txt-link-freetext" href="http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-devtools/gcc/gcc-configure-common.inc?id=0ba6ab39f187ecd4261f08e768f365f461384a3a">http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-devtools/gcc/gcc-configure-common.inc?id=0ba6ab39f187ecd4261f08e768f365f461384a3a</a><br>
    <br>
    <blockquote
cite="mid:CADwFkYeYJVe0KyVY3gipy-cGm4kRhaHoit2WThcKsLnpdyyrOw@mail.gmail.com"
      type="cite">
      <div dir="ltr"><br>
        <div>at the end of 'caps_gcc_atomic.hpp', it defined
          'BOOST_ATOMIC_THREAD_FENCE' as 2.</div>
        <div><br>
        </div>
        <div>so the conflict is: <b>BOOST_ATOMIC_THREAD_FENCE</b> and <b>BOOST_ATOMIC_FLAG_LOCK_FREE</b></div>
        <div><b><br>
          </b></div>
        <div>I don't know it is the new poky problem, or the boost
          problem, any idea?</div>
      </div>
    </blockquote>
    <br>
    My guess is that Boost is making assumptions about what the internal
    GCC predefined symbols mean that aren't entirely accurate.  There
    are several flags that are used in the libstdc++ headers to indicate
    whether the compiler is using lock-free instructions.<br>
    <br>
    Boost-1.56 builds without error for my beaglebone target with poky
    at:<br>
    <br>
    * 669c07d (HEAD, origin/master, origin/HEAD, master/upstream,
    master/dev) [Wed Aug 27 14:24:52 2014 +0100] bitbake: build/data:
    Write out more complete python run files<br>
    <br>
    so it may have something to do with your target machine.<br>
    <br>
    Peter<br>
  </body>
</html>

--------------020202080407070102080200--
