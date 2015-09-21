Return-Path: <net147@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 34E1673CBD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 18:04:26 +0000 (UTC)
Received: by padhy16 with SMTP id hy16so122743882pad.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 11:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type;
	bh=ForQ2ibziBdKdWoSlmS6Zj1gJeS6MZc26RUJtkAiMZ8=;
	b=rsYn1Ie0vQW5Z073GmKftbSqZQyQ/+7rJkvFbg6x3yfcTNR3sM5LVpAzZvN1R8DxT8
	lb2adujYd3jZAqrN3oshyEJE+Ni7ogD6DXqrxPC1CBW3l71CuK0+EuR0CYgLBA/a+E4H
	0ZPNQG25DG5TRtEC8lEII+psrl1fPxnSRe9COm2BJAnZvntN1/yzUOqXiDbyU3GVH7rC
	IRcIcATxYBoIrDLpwSwX8a89flZjfeTYccdJraLhpkyZopBF/VH5iK7KwSRkfMM5WlKF
	PQOJsQoy+bq01NcK1Yw7Z7vQCklPCSGZpSSKFc7WeQOPVYHjvP1HEFfSLZEitAE2iUQy
	LfZg==
X-Received: by 10.67.4.230 with SMTP id ch6mr26532801pad.11.1442858667012;
	Mon, 21 Sep 2015 11:04:27 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by smtp.gmail.com with ESMTPSA id
	ql5sm25897811pac.46.2015.09.21.11.04.24
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Sep 2015 11:04:26 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>
References: <1442834624-25775-1-git-send-email-net147@gmail.com>
	<CAMKF1srzh9OqXn60B3wgxRKExNnTK31rFbSvhrCMwoicF8BR_A@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
Message-ID: <560046A4.7000609@gmail.com>
Date: Tue, 22 Sep 2015 04:04:20 +1000
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1srzh9OqXn60B3wgxRKExNnTK31rFbSvhrCMwoicF8BR_A@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: disable problematic GCC 5.2 optimizations
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
X-List-Received-Date: Mon, 21 Sep 2015 18:04:28 -0000
Content-Type: multipart/alternative;
	boundary="------------040408010103000403070801"

--------------040408010103000403070801
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Khem,

On 22/09/2015 3:05 AM, Khem Raj wrote:
>
> Please make it arm specific
>
I have sent V2 that only makes the change for arm.
Interestly, this issue doesn't appear for qemuarm (ARMv5) when running 
under qemu.

I am wondering if this issue affects platforms other than ARM on real 
boards depending on TUNE_FEATURES and TARGET_FPU.
> On Sep 21, 2015 4:22 AM, "Jonathan Liu" <net147@gmail.com 
> <mailto:net147@gmail.com>> wrote:
>
>     This fixes systemd failing to start on Raspberry Pi 2 if it is
>     compiled
>     with GCC 5.2.
>
>     It would try to start "Journal Service" and "udev Kernel Device
>     Manager"
>     but fail repeatedly.
>
>     [YOCTO #8291]
>
>     Signed-off-by: Jonathan Liu <net147@gmail.com
>     <mailto:net147@gmail.com>>
>     ---
>      meta/recipes-core/systemd/systemd_225.bb <http://systemd_225.bb>
>     | 3 +++
>      1 file changed, 3 insertions(+)
>
>     diff --git a/meta/recipes-core/systemd/systemd_225.bb
>     <http://systemd_225.bb> b/meta/recipes-core/systemd/systemd_225.bb
>     <http://systemd_225.bb>
>     index f7d4c7d..4a19ff4 100644
>     --- a/meta/recipes-core/systemd/systemd_225.bb <http://systemd_225.bb>
>     +++ b/meta/recipes-core/systemd/systemd_225.bb <http://systemd_225.bb>
>     @@ -123,6 +123,9 @@ EXTRA_OECONF = " --with-rootprefix=${rootprefix} \
>      # uclibc does not have NSS
>      EXTRA_OECONF_append_libc-uclibc = " --disable-myhostname "
>
>     +# disable problematic GCC 5.2 optimizations [YOCTO #8291]
>     +FULL_OPTIMIZATION += "-fno-schedule-insns -fno-schedule-insns2"
>     +
>      do_configure_prepend() {
>             export NM="${HOST_PREFIX}gcc-nm"
>             export AR="${HOST_PREFIX}gcc-ar"
>     --
>     2.5.0<http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>
Regards,
Jonathan

--------------040408010103000403070801
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">Hi Khem,<br>
      <br>
      On 22/09/2015 3:05 AM, Khem Raj wrote:<br>
    </div>
    <blockquote
cite="mid:CAMKF1srzh9OqXn60B3wgxRKExNnTK31rFbSvhrCMwoicF8BR_A@mail.gmail.com"
      type="cite">
      <p dir="ltr">Please make it arm specific </p>
    </blockquote>
    I have sent V2 that only makes the change for arm.<br>
    Interestly, this issue doesn't appear for qemuarm (ARMv5) when
    running under qemu.<br>
    <br>
    I am wondering if this issue affects platforms other than ARM on
    real boards depending on TUNE_FEATURES and TARGET_FPU.<br>
    <blockquote
cite="mid:CAMKF1srzh9OqXn60B3wgxRKExNnTK31rFbSvhrCMwoicF8BR_A@mail.gmail.com"
      type="cite">
      <div class="gmail_quote">On Sep 21, 2015 4:22 AM, "Jonathan Liu"
        &lt;<a moz-do-not-send="true" href="mailto:net147@gmail.com">net147@gmail.com</a>&gt;
        wrote:<br type="attribution">
        <blockquote class="gmail_quote" style="margin:0 0 0
          .8ex;border-left:1px #ccc solid;padding-left:1ex">This fixes
          systemd failing to start on Raspberry Pi 2 if it is compiled<br>
          with GCC 5.2.<br>
          <br>
          It would try to start "Journal Service" and "udev Kernel
          Device Manager"<br>
          but fail repeatedly.<br>
          <br>
          [YOCTO #8291]<br>
          <br>
          Signed-off-by: Jonathan Liu &lt;<a moz-do-not-send="true"
            href="mailto:net147@gmail.com">net147@gmail.com</a>&gt;<br>
          ---<br>
           meta/recipes-core/systemd/<a moz-do-not-send="true"
            href="http://systemd_225.bb" rel="noreferrer"
            target="_blank">systemd_225.bb</a> | 3 +++<br>
           1 file changed, 3 insertions(+)<br>
          <br>
          diff --git a/meta/recipes-core/systemd/<a
            moz-do-not-send="true" href="http://systemd_225.bb"
            rel="noreferrer" target="_blank">systemd_225.bb</a>
          b/meta/recipes-core/systemd/<a moz-do-not-send="true"
            href="http://systemd_225.bb" rel="noreferrer"
            target="_blank">systemd_225.bb</a><br>
          index f7d4c7d..4a19ff4 100644<br>
          --- a/meta/recipes-core/systemd/<a moz-do-not-send="true"
            href="http://systemd_225.bb" rel="noreferrer"
            target="_blank">systemd_225.bb</a><br>
          +++ b/meta/recipes-core/systemd/<a moz-do-not-send="true"
            href="http://systemd_225.bb" rel="noreferrer"
            target="_blank">systemd_225.bb</a><br>
          @@ -123,6 +123,9 @@ EXTRA_OECONF = "
          --with-rootprefix=${rootprefix} \<br>
           # uclibc does not have NSS<br>
           EXTRA_OECONF_append_libc-uclibc = " --disable-myhostname "<br>
          <br>
          +# disable problematic GCC 5.2 optimizations [YOCTO #8291]<br>
          +FULL_OPTIMIZATION += "-fno-schedule-insns
          -fno-schedule-insns2"<br>
          +<br>
           do_configure_prepend() {<br>
                  export NM="${HOST_PREFIX}gcc-nm"<br>
                  export AR="${HOST_PREFIX}gcc-ar"<br>
          --<br>
          2.5.0<a moz-do-not-send="true"
            href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
            rel="noreferrer" target="_blank"></a><br>
        </blockquote>
      </div>
    </blockquote>
    Regards,<br>
    Jonathan<br>
  </body>
</html>

--------------040408010103000403070801--
