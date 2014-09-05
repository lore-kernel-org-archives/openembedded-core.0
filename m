Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa09-03.prod.phx3.secureserver.net
	(p3plsmtpa09-03.prod.phx3.secureserver.net [173.201.193.232])
	by mail.openembedded.org (Postfix) with ESMTP id A89EE713E9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Sep 2014 21:51:55 +0000 (UTC)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa09-03.prod.phx3.secureserver.net with 
	id nZrs1o00P1mTNtu01ZrtY0; Fri, 05 Sep 2014 14:51:54 -0700
Message-ID: <540A3078.9060706@pabigot.com>
Date: Fri, 05 Sep 2014 16:51:52 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Gary Robertson <gary.robertson@linaro.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CAF7YWnxMgNYAFH9=TFJvxwumF36KH=nDnZPPUKn3iazOwh1wJA@mail.gmail.com>
In-Reply-To: <CAF7YWnxMgNYAFH9=TFJvxwumF36KH=nDnZPPUKn3iazOwh1wJA@mail.gmail.com>
Cc: Mike Holmes <mike.holmes@linaro.org>
Subject: Re: Autoconf problems in OE build of LTP realtime tests
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
X-List-Received-Date: Fri, 05 Sep 2014 21:52:01 -0000
Content-Type: multipart/alternative;
	boundary="------------070402060500000602060306"

--------------070402060500000602060306
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 09/05/2014 03:36 PM, Gary Robertson wrote:
> Dear OE developers,
>
> Linaro Networking Group is building root filesystem images containing  
> the LTP test suite, using the current recipe at 
> openembedded-core/meta/recipes-extended/ltp/ltp_20140422.bb 
> <http://ltp_20140422.bb>. This build uses autoconf to probe mutex 
> feature support for protocol specification, priority inheritance, and 
> robust mutexes.  The macros used for this can be found in 
> ltp/testcases/realtime/m4/check.m4 from the LTP git repository.
>
> We are cross-building for the armv7a architecture using the machine 
> definition found in 
> meta-linaro/meta-linaro/conf/machine/genericarmv7a.conf. The 
> development host platform is an Ubuntu 12.04 x86_64 platform with all 
> software kept regularly updated from the Ubuntu repositories.
>
> The macros in check.m4 use the AC_TRY_COMPILE function macro to 
> attempt compilation of POSIX function calls utilizing the features 
> being probed - such that if the compilation fails the features are 
> deemed to be unsupported... and if compilation succeeds the features 
> are deemed supported.
>
> Native compilation of the same code used in the probes, and execution 
> of the resulting program - shows support for all the probed mutex 
> features on both the development host as well as the armv7a target 
> platform... that is when this probe code is built on either the host 
> or target machine and then executed in that environment... so support 
> is there in both environments.
>
> Despite the presence of this support the AC_TRY_COMPILE macro is 
> indicating a lack of support for the probed features during the 
> cross-build process.
>
> I am not personally familiar with the detailed function of the 
> autoconf macros, and I can find no documentation about how OE 
> interacts with those macros in order to coerce them into configuring 
> for the target machine in a cross-build environment... so I am hoping 
> the autoconf experts at OE can shed some light on this and at least 
> provide some clues as to where to look for the problem and possible 
> resolution.  Any insight you can provide in this matter would be 
> appreciated.

Any mention of "armv7a" and "mutex" points me to 
http://cgit.openembedded.org/openembedded-core/commit/?id=0ba6ab39f187ecd4261f08e768f365f461384a3a 
which fixed a problem where the compiler and runtime disagreed about the 
capabilities of the target processor unless special flags were passed to 
the compiler.  Presence of armv7a enables mutex-related instructions 
which affect what support is provided in the C runtime system; absence 
of armv7 at compile-time will result in attempts to locate alternative 
implementations that are not present.

It's possible that a similar issue is hitting you, depending on what 
options are present in the test compile and whether the libraries linked 
to were built with compatible options.

I tried setting up a meta-linaro + meta-linaro-toolchain build to see if 
I could reproduce it, but meta-linaro appears to not be up to date with 
the removal of eglibc from oe-core.

The autoconf test should have left information in the config.log file 
showing how it tried to build the application.  Having that information 
would help with diagnosis.

Hope this is some help.

Peter

--------------070402060500000602060306
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 09/05/2014 03:36 PM, Gary Robertson
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAF7YWnxMgNYAFH9=TFJvxwumF36KH=nDnZPPUKn3iazOwh1wJA@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div>
          <div>
            <div>
              <div>
                <div>Dear OE developers,<br>
                </div>
                <div><br>
                </div>
                Linaro Networking Group is building root filesystem
                images containing  the LTP test suite, using the current
                recipe at openembedded-core/meta/recipes-extended/ltp/<a
                  moz-do-not-send="true" href="http://ltp_20140422.bb">ltp_20140422.bb</a>. 
                This build uses autoconf to probe mutex feature support
                for protocol specification, priority inheritance, and
                robust mutexes.  The macros used for this can be found
                in ltp/testcases/realtime/m4/check.m4 from the LTP git
                repository.<br>
                <br>
              </div>
              We are cross-building for the armv7a architecture using
              the machine definition found in
              meta-linaro/meta-linaro/conf/machine/genericarmv7a.conf. 
              The development host platform is an Ubuntu 12.04 x86_64
              platform with all software kept regularly updated from the
              Ubuntu repositories.<br>
              <br>
            </div>
            The macros in check.m4 use the AC_TRY_COMPILE function macro
            to attempt compilation of POSIX function calls utilizing the
            features being probed - such that if the compilation fails
            the features are deemed to be unsupported... and if
            compilation succeeds the features are deemed supported.<br>
            <br>
          </div>
          Native compilation of the same code used in the probes, and
          execution of the resulting program - shows support for all the
          probed mutex features on both the development host as well as
          the armv7a target platform... that is when this probe code is
          built on either the host or target machine and then executed
          in that environment... so support is there in both
          environments.<br>
          <br>
        </div>
        Despite the presence of this support the AC_TRY_COMPILE macro is
        indicating a lack of support for the probed features during the
        cross-build process.<br>
        <br>
        I am not personally familiar with the detailed function of the
        autoconf macros, and I can find no documentation about how OE
        interacts with those macros in order to coerce them into
        configuring for the target machine in a cross-build
        environment... so I am hoping the autoconf experts at OE can
        shed some light on this and at least provide some clues as to
        where to look for the problem and possible resolution.  Any
        insight you can provide in this matter would be appreciated.<br>
      </div>
    </blockquote>
    <br>
    Any mention of "armv7a" and "mutex" points me to
    <a class="moz-txt-link-freetext" href="http://cgit.openembedded.org/openembedded-core/commit/?id=0ba6ab39f187ecd4261f08e768f365f461384a3a">http://cgit.openembedded.org/openembedded-core/commit/?id=0ba6ab39f187ecd4261f08e768f365f461384a3a</a>
    which fixed a problem where the compiler and runtime disagreed about
    the capabilities of the target processor unless special flags were
    passed to the compiler.  Presence of armv7a enables mutex-related
    instructions which affect what support is provided in the C runtime
    system; absence of armv7 at compile-time will result in attempts to
    locate alternative implementations that are not present.<br>
    <br>
    It's possible that a similar issue is hitting you, depending on what
    options are present in the test compile and whether the libraries
    linked to were built with compatible options.<br>
    <br>
    I tried setting up a meta-linaro + meta-linaro-toolchain build to
    see if I could reproduce it, but meta-linaro appears to not be up to
    date with the removal of eglibc from oe-core.<br>
    <br>
    The autoconf test should have left information in the config.log
    file showing how it tried to build the application.  Having that
    information would help with diagnosis.<br>
    <br>
    Hope this is some help.<br>
    <br>
    Peter<br>
  </body>
</html>

--------------070402060500000602060306--
