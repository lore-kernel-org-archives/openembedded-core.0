Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa08-01.prod.phx3.secureserver.net
	(p3plsmtpa08-01.prod.phx3.secureserver.net [173.201.193.102])
	by mail.openembedded.org (Postfix) with ESMTP id 973D160CFC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 01:55:09 +0000 (UTC)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa08-01.prod.phx3.secureserver.net with 
	id eRv81o00P1mTNtu01Rv9CX; Wed, 13 Aug 2014 18:55:09 -0700
Message-ID: <53EC16FC.8020109@pabigot.com>
Date: Wed, 13 Aug 2014 20:55:08 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <53E9134F.7040108@pabigot.com>	<CAMKF1soHVxmjWW=TBqjh1P0ddPuMkxtmxXdnbLCSMLgQm2=hcQ@mail.gmail.com>	<53EBD76A.3010401@pabigot.com>	<53EBDA75.4040101@pabigot.com>	<CAMKF1soioSe+U1CkB+PDsZyfDyaEFovugjOr+Tw+rGNjK57cJg@mail.gmail.com>	<53EBF375.1070701@pabigot.com>
	<CAMKF1srUa9tUqu7bNXZ0g=yCa0e8E2K5XrzTHUUxB6BbTwYZ6g@mail.gmail.com>
In-Reply-To: <CAMKF1srUa9tUqu7bNXZ0g=yCa0e8E2K5XrzTHUUxB6BbTwYZ6g@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Yocto development with C++11 threads and gcc
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
X-List-Received-Date: Thu, 14 Aug 2014 01:55:14 -0000
Content-Type: multipart/alternative;
	boundary="------------050807030904050208040203"

--------------050807030904050208040203
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/13/2014 07:49 PM, Khem Raj wrote:
>
>
> On Wednesday, August 13, 2014, Peter A. Bigot <pab@pabigot.com 
> <mailto:pab@pabigot.com>> wrote:
>
>     On 08/13/2014 05:05 PM, Khem Raj wrote:
>
>         On Wed, Aug 13, 2014 at 2:36 PM, Peter A. Bigot
>         <pab@pabigot.com> wrote:
>
>             In any case, Khem can you run with this?  It'd be fixed a
>             lot better that
>             way....
>
>         We do not configure target gcc with right matching cpu defaults,
>         atomic instruction strex/ldrex are only added after armv6 but
>         defaults
>         for gcc if not specified is armv5t and hence it does not use
>         the right
>         set as expected by libstdc++ which has been cross compiled. so
>         while
>         you are at it and can reproduce it. Try to add
>
>         EXTRA_OECONF += '${@bb.utils.contains("TUNE_FEATURES", "armv7a", "
>         --with-cpu=armv7-a", "", d)}'
>
>         to gcc-target.inc and see if resulting gcc is any better
>
>
>     I had to make it:
>
>     EXTRA_OECONF += '${@bb.utils.contains("TUNE_FEATURES", "armv7a",
>     "--with-cpu=generic-armv7-a", "", d)}'
>
>
> Sorry a typo there you   need  --with-arch

OK, that works. So do we need to do the same thing for every 
TUNE_FEATURES element that ends up changing the value of -march= in 
TUNE_CCARGS which ends up getting passed into gcc-runtime?

If so would it be better to add a TUNE_ARCH setting to all the 
tune-foo.inc files and use that in both TUNE_CCARGS and the --with-arch= 
flag passed to gcc?  Just to avoid having this stuff hidden inside 
gcc-target.inc where it's pretty obscure.

>
> to get gcc to build but at runtime I then get:
>
>
>     beaglebone[16]$ g++ -std=c++11 -pthread test.cc && ./a.out
>     Assembler messages:
>     Error: unknown cpu `generic-armv7-a'
>     Error: unrecognized option -mcpu=generic-armv7-a
>
>     which indicates the flag's being passed to the assembler which
>     doesn't recognize it even though g++ is happy with it.  I suppose
>     we could hack binutils to substitute whatever spelling it wants to
>     see.
>
>     (Also tried --with-cpu=arm7, but that generates assembler errors
>     related to unsupported RM mode "bx lr").
>
>     The approach bothers me, though.  Instead of explicitly changing
>     gcc-target to match gcc-runtime, shouldn't it be a general rule
>     that gcc-runtime not apply OE-specific target flags that aren't
>     going to be used by direct invocations of the compiler outside of
>     the OE build environment?  That seems a little more robust, as the
>     default target flags may be changed upstream or by bbappends
>     within OE, and having to make them match in gcc-runtime as well
>     would be a headache.
>

Just to record one reason why this isn't trivial: although it's possible 
to strip ${TARGET_CC_ARCH} from ${CXX}, doing so removes 
-mfloat-abi=hard which makes gcc-runtime try to build a library that 
supports soft float, and the compiler didn't generate the necessary 
gnu/stubs-soft.h header for that.

>
>     And would we need similar overrides for other architectures?
>     There's something similar already in gcc-configure-common.inc for
>     mips64.
>
>     Peter
>


--------------050807030904050208040203
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 08/13/2014 07:49 PM, Khem Raj wrote:<br>
    </div>
    <blockquote
cite="mid:CAMKF1srUa9tUqu7bNXZ0g=yCa0e8E2K5XrzTHUUxB6BbTwYZ6g@mail.gmail.com"
      type="cite"><br>
      <br>
      On Wednesday, August 13, 2014, Peter A. Bigot &lt;<a
        moz-do-not-send="true" href="mailto:pab@pabigot.com">pab@pabigot.com</a>&gt;
      wrote:<br>
      <blockquote class="gmail_quote" style="margin:0 0 0
        .8ex;border-left:1px #ccc solid;padding-left:1ex">
        On 08/13/2014 05:05 PM, Khem Raj wrote:<br>
        <blockquote class="gmail_quote" style="margin:0 0 0
          .8ex;border-left:1px #ccc solid;padding-left:1ex">
          On Wed, Aug 13, 2014 at 2:36 PM, Peter A. Bigot &lt;<a
            moz-do-not-send="true">pab@pabigot.com</a>&gt; wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">
            In any case, Khem can you run with this?  It'd be fixed a
            lot better that<br>
            way....<br>
          </blockquote>
          We do not configure target gcc with right matching cpu
          defaults,<br>
          atomic instruction strex/ldrex are only added after armv6 but
          defaults<br>
          for gcc if not specified is armv5t and hence it does not use
          the right<br>
          set as expected by libstdc++ which has been cross compiled. so
          while<br>
          you are at it and can reproduce it. Try to add<br>
          <br>
          EXTRA_OECONF += '${@bb.utils.contains("TUNE_FEATURES",
          "armv7a", "<br>
          --with-cpu=armv7-a", "", d)}'<br>
          <br>
          to gcc-target.inc and see if resulting gcc is any better<br>
        </blockquote>
        <br>
        I had to make it:<br>
        <br>
        EXTRA_OECONF += '${@bb.utils.contains("TUNE_FEATURES", "armv7a",
        "--with-cpu=generic-armv7-a", "", d)}'<br>
        <br>
      </blockquote>
      <div><br>
      </div>
      <div>Sorry a typo there you   need  --with-arch</div>
    </blockquote>
    <br>
    OK, that works. So do we need to do the same thing for every
    TUNE_FEATURES element that ends up changing the value of -march= in
    TUNE_CCARGS which ends up getting passed into gcc-runtime?<br>
    <br>
    If so would it be better to add a TUNE_ARCH setting to all the
    tune-foo.inc files and use that in both TUNE_CCARGS and the
    --with-arch= flag passed to gcc?  Just to avoid having this stuff
    hidden inside gcc-target.inc where it's pretty obscure.<br>
    <br>
    <blockquote
cite="mid:CAMKF1srUa9tUqu7bNXZ0g=yCa0e8E2K5XrzTHUUxB6BbTwYZ6g@mail.gmail.com"
      type="cite"><br>
      <div>to get gcc to build but at runtime I then get:</div>
      <blockquote class="gmail_quote" style="margin:0 0 0
        .8ex;border-left:1px #ccc solid;padding-left:1ex">
        <br>
        beaglebone[16]$ g++ -std=c++11 -pthread test.cc &amp;&amp;
        ./a.out<br>
        Assembler messages:<br>
        Error: unknown cpu `generic-armv7-a'<br>
        Error: unrecognized option -mcpu=generic-armv7-a<br>
        <br>
        which indicates the flag's being passed to the assembler which
        doesn't recognize it even though g++ is happy with it.  I
        suppose we could hack binutils to substitute whatever spelling
        it wants to see.<br>
        <br>
        (Also tried --with-cpu=arm7, but that generates assembler errors
        related to unsupported RM mode "bx lr").<br>
        <br>
        The approach bothers me, though.  Instead of explicitly changing
        gcc-target to match gcc-runtime, shouldn't it be a general rule
        that gcc-runtime not apply OE-specific target flags that aren't
        going to be used by direct invocations of the compiler outside
        of the OE build environment?  That seems a little more robust,
        as the default target flags may be changed upstream or by
        bbappends within OE, and having to make them match in
        gcc-runtime as well would be a headache.<br>
      </blockquote>
    </blockquote>
    <br>
    Just to record one reason why this isn't trivial: although it's
    possible to strip ${TARGET_CC_ARCH} from ${CXX}, doing so removes
    -mfloat-abi=hard which makes gcc-runtime try to build a library that
    supports soft float, and the compiler didn't generate the necessary
    gnu/stubs-soft.h header for that.<br>
    <br>
    <blockquote
cite="mid:CAMKF1srUa9tUqu7bNXZ0g=yCa0e8E2K5XrzTHUUxB6BbTwYZ6g@mail.gmail.com"
      type="cite">
      <blockquote class="gmail_quote" style="margin:0 0 0
        .8ex;border-left:1px #ccc solid;padding-left:1ex">
        <br>
        And would we need similar overrides for other architectures?
        There's something similar already in gcc-configure-common.inc
        for mips64.<br>
        <br>
        Peter<br>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------050807030904050208040203--
