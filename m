Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EF867605B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 02:25:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2A2PEGO013655
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 9 Mar 2016 18:25:14 -0800 (PST)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 9 Mar 2016 18:25:13 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
References: <cover.1457522031.git.hongxu.jia@windriver.com>
	<d32227aaa1bf8acd225f695857056f1b5dc77efc.1457522031.git.hongxu.jia@windriver.com>
	<1457544388.2804.179.camel@linuxfoundation.org>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <56E0DB07.1080905@windriver.com>
Date: Thu, 10 Mar 2016 10:25:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1457544388.2804.179.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/1] tune-ppce500v2.inc: explicitly set gcc float
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
X-List-Received-Date: Thu, 10 Mar 2016 02:25:16 -0000
Content-Type: multipart/alternative;
	boundary="------------070805070003050807080606"

--------------070805070003050807080606
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/10/2016 01:26 AM, Richard Purdie wrote:
>> +
>> >+# For powerpc*-*-*spe*, default to with_cpu=8548 if
>> >+# --enable-e500-double, and to 8540 otherwise.
>> >+EXTRA_OECONF_GCC_FLOAT += "${@get_gcc_float_setting(bb, d)}"
> This is good to understand what is breaking but the patch as it stands
> can't be merged as the gcc recipe intentionally doesn't do this, its
> only done in gcc-target.inc.

Yes, that is also my worry about, I am not sure why its only
done in gcc-tareget.inc.

> Why?
>
> The theory is we should be building one gcc-cross-powerpc, not multiple
> different variants. I did just try a build and realised that switching
> machines between p1022ds and qemuppc does rebuild gcc-cross-powerpc but
> that is a bug. Adding the above is just going to make this harder to
> fix, and will certainly break the SDK gcc-cross-canadian-gcc.
>
> I'm not sure how we should fix this, particularly given that gcc-cross
> -powerpc already isn't working properly but the avoid fix isn't right.

1. How about directly fix python3. Allow the platform triplet 
'powerpc-linux-gnuspev1',
     It should not have any side effect on python3

diff --git a/configure.ac b/configure.ac
index 9eb3d22..9b4e8ab 100644
--- a/configure.ac
+++ b/configure.ac
@@ -850,7 +850,7 @@ fi
  rm -f conftest.c conftest.out

  if test x$PLATFORM_TRIPLET != x && test x$MULTIARCH != x; then
-  if test x$PLATFORM_TRIPLET != x$MULTIARCH; then
+  if test x$PLATFORM_TRIPLET != x$MULTIARCH && test 
xpowerpc-linux-gnuspev1 != x$MULTIARCH; then
      AC_MSG_ERROR([internal configure error for the platform triplet, 
please file a bug report])
    fi
  fi

2. Since the above only done in gcc-tareget.inc, how about apply the 
following
fix to gcc-cross.inc and gcc-cross-canadian.inc, we do not check cpu 
while powerpc pse.

diff --git a/gcc/config/rs6000/t-linux b/gcc/config/rs6000/t-linux
index 4cb63bd..5e10fa4 100644
--- a/gcc/config/rs6000/t-linux
+++ b/gcc/config/rs6000/t-linux
@@ -5,7 +5,7 @@ ifneq (,$(findstring powerpc64,$(target)))
  MULTILIB_OSDIRNAMES := .=../lib64$(call if_multiarch,:powerpc64-linux-gnu)
  else
  ifneq (,$(findstring spe,$(target)))
-MULTIARCH_DIRNAME := powerpc-linux-gnuspe$(if $(findstring 
8548,$(with_cpu)),,v1)
+MULTIARCH_DIRNAME := powerpc-linux-gnuspe
  else
  MULTIARCH_DIRNAME := powerpc-linux-gnu
  endif

I know both of them are workaround.

//Hongxu
> Cheers,
>
> Richard
>
>
>
>


--------------070805070003050807080606
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 03/10/2016 01:26 AM, Richard Purdie
      wrote:<br>
    </div>
    <blockquote cite="mid:1457544388.2804.179.camel@linuxfoundation.org"
      type="cite">
      <blockquote type="cite" style="color: #000000;">
        <pre wrap="">+
<span class="moz-txt-citetags">&gt; </span>+# For powerpc*-*-<b class="moz-txt-star"><span class="moz-txt-tag">*</span>spe<span class="moz-txt-tag">*</span></b>, default to with_cpu=8548 if
<span class="moz-txt-citetags">&gt; </span>+# --enable-e500-double, and to 8540 otherwise.
<span class="moz-txt-citetags">&gt; </span>+EXTRA_OECONF_GCC_FLOAT += "${@get_gcc_float_setting(bb, d)}"
</pre>
      </blockquote>
      <pre wrap="">This is good to understand what is breaking but the patch as it stands
can't be merged as the gcc recipe intentionally doesn't do this, its
only done in gcc-target.inc.
</pre>
    </blockquote>
    <br>
    Yes, that is also my worry about, I am not sure why its only<br>
    done in gcc-tareget.inc.<br>
    <br>
    <blockquote cite="mid:1457544388.2804.179.camel@linuxfoundation.org"
      type="cite">
      <pre wrap="">
Why?

The theory is we should be building one gcc-cross-powerpc, not multiple
different variants. I did just try a build and realised that switching
machines between p1022ds and qemuppc does rebuild gcc-cross-powerpc but
that is a bug. Adding the above is just going to make this harder to
fix, and will certainly break the SDK gcc-cross-canadian-gcc.

I'm not sure how we should fix this, particularly given that gcc-cross
-powerpc already isn't working properly but the avoid fix isn't right.
</pre>
    </blockquote>
    <br>
    1. How about directly fix python3. Allow the platform triplet
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    'powerpc-linux-gnuspev1',<br>
        It should not have any side effect on python3<br>
    <br>
    diff --git a/configure.ac b/configure.ac<br>
    index 9eb3d22..9b4e8ab 100644<br>
    --- a/configure.ac<br>
    +++ b/configure.ac<br>
    @@ -850,7 +850,7 @@ fi<br>
     rm -f conftest.c conftest.out<br>
     <br>
     if test x$PLATFORM_TRIPLET != x &amp;&amp; test x$MULTIARCH != x;
    then<br>
    -  if test x$PLATFORM_TRIPLET != x$MULTIARCH; then<br>
    +  if test x$PLATFORM_TRIPLET != x$MULTIARCH &amp;&amp; test
    xpowerpc-linux-gnuspev1 != x$MULTIARCH; then<br>
         AC_MSG_ERROR([internal configure error for the platform
    triplet, please file a bug report])<br>
       fi<br>
     fi<br>
    <br>
    2. Since the above only done in gcc-tareget.inc, how about apply the
    following<br>
    fix to gcc-cross.inc and gcc-cross-canadian.inc, we do not check cpu
    while powerpc pse.<br>
    <br>
    diff --git a/gcc/config/rs6000/t-linux b/gcc/config/rs6000/t-linux<br>
    index 4cb63bd..5e10fa4 100644<br>
    --- a/gcc/config/rs6000/t-linux<br>
    +++ b/gcc/config/rs6000/t-linux<br>
    @@ -5,7 +5,7 @@ ifneq (,$(findstring powerpc64,$(target)))<br>
     MULTILIB_OSDIRNAMES := .=../lib64$(call
    if_multiarch,:powerpc64-linux-gnu)<br>
     else<br>
     ifneq (,$(findstring spe,$(target)))<br>
    -MULTIARCH_DIRNAME := powerpc-linux-gnuspe$(if $(findstring
    8548,$(with_cpu)),,v1)<br>
    +MULTIARCH_DIRNAME := powerpc-linux-gnuspe<br>
     else<br>
     MULTIARCH_DIRNAME := powerpc-linux-gnu<br>
     endif<br>
    <br>
    I know both of them are workaround.<br>
    <br>
    //Hongxu<br>
    <blockquote cite="mid:1457544388.2804.179.camel@linuxfoundation.org"
      type="cite">
      <pre wrap="">
Cheers,

Richard




</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------070805070003050807080606--
