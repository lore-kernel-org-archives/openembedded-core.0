Return-Path: <peter@berginkonsult.se>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF13CC35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 21:45:50 +0000 (UTC)
Received: from mailrelay5-2.pub.mailoutpod3-cph3.one.com (mailrelay5-2.pub.mailoutpod3-cph3.one.com [46.30.211.250])
 by mx.groups.io with SMTP id smtpd.web10.7250.1742420744184737368
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 14:45:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=rsa2 header.b=hS0xIf4+;
 dkim=pass header.i=@berginkonsult.se header.s=ed2 header.b=0gtagYJL;
 spf=none, err=SPF record not found (domain: berginkonsult.se, ip: 46.30.211.250, mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1742420741; x=1743025541;
	d=berginkonsult.se; s=rsa2;
	h=in-reply-to:from:references:cc:to:subject:mime-version:date:message-id:
	 content-type:from;
	bh=wy6nFLGfXlyqL8/c1+hFxkCuEoXMSSGONAPB2i2SQyc=;
	b=hS0xIf4+xA2nmBmbo7YG6JstEzm5rraEJX+r4eA1898UyGSm2RTNoziBicCNfV5RwIN+9VMujsCA7
	 oAanTr36HnXTqFjuBdWtEd4RYi6YpIyCLqAxtWSjCzClXU/ezZt9zQx8BaTzwoLIanIuYCvVRQ52ZM
	 NSt8mIlwkR6ieH8h5tFyay0fQJqCwsCyqcQD9aHpVK30v2ZFKeyIAlwaJ4VmIUfjCulgEmCPV2Ku0+
	 sytaFE5R1yCa9KE/G3ilnJpUINdmHMKDnBUspGAjEATQIjNFwUMFq5DNd3K0xnIK3hpC9t7HXLyf9a
	 uiuXly0RxEQ9zzm85VPulKCgaAxIycg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1742420741; x=1743025541;
	d=berginkonsult.se; s=ed2;
	h=in-reply-to:from:references:cc:to:subject:mime-version:date:message-id:
	 content-type:from;
	bh=wy6nFLGfXlyqL8/c1+hFxkCuEoXMSSGONAPB2i2SQyc=;
	b=0gtagYJLlpvtrKp4yYJAnYeg1oHGwR5bF+MoQ5nuxhJiRcJgRnVaCdExaExT427PF2fzEH4anNiRZ
	 ZI82CnSDg==
X-HalOne-ID: 7f7dff5d-050b-11f0-9bbc-d7c209f8bd06
Received: from [192.168.100.34] (c83-191-168-223.bredband.tele2.se [83.191.168.223])
	by mailrelay5.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id 7f7dff5d-050b-11f0-9bbc-d7c209f8bd06;
	Wed, 19 Mar 2025 21:45:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------4cNGJi1hCe3ywo00UMdwfQ3j"
Message-ID: <5b6fc9d2-2f13-4bec-ac47-3a4a8002a891@berginkonsult.se>
Date: Wed, 19 Mar 2025 22:45:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] pkg-config-native,librsvg-native: fix
 EXTRA_NATIVE_PKGCONFIG_PATH
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Alexander Kanavin <alex@linutronix.de>
References: <20250319161327.2701095-1-peter@berginkonsult.se>
 <CANNYZj-mrdUaG0SVu9CWjFF9edGESPNH=9jtJx8gbzuA1NJ-Xg@mail.gmail.com>
Content-Language: en-US
From: Peter Bergin <peter@berginkonsult.se>
In-Reply-To: <CANNYZj-mrdUaG0SVu9CWjFF9edGESPNH=9jtJx8gbzuA1NJ-Xg@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 21:45:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213365

This is a multi-part message in MIME format.
--------------4cNGJi1hCe3ywo00UMdwfQ3j
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2025-03-19 18:17, Alexander Kanavin wrote:
> On Wed, 19 Mar 2025 at 17:14, Peter Bergin via lists.openembedded.org
> <peter=berginkonsult.se@lists.openembedded.org> wrote:
>> This commit will try to resolve this to always append the
>> EXTRA_NATIVE_PKGCONFIG_PATH. It is tested by building
>> librsvg-native and also checking bitbake environment
>> before and after.
> Changes like this make me a bit nervous. Querying pkg-config is *very*
> sensitive to the correct order of paths in variables, and things can
> easily break when rearranging that.
>
> Does target librsvg build ok as well? If so, this can perhaps go on
> the autobuilder.

Yes, librsvg builds as well and shall not be affected as the changes is 
only for native. I get more nervous about having badly formed paths 
among the variables. ;-) I hope we can let the autobuilder mangle this 
to get a verdict. I applied it to my big customer project with a lot of 
native packages (on scarthgap) and have not seen any regression there. I 
also searched for the usage of EXTRA_NATIVE_PKGCONFIG_PATH among my 
layers and only found two librsvg and ibus-native (meta-gnome).

Before:

/work/yocto/poky/build/aarch64$ bitbake librsvg-native -e | grep 
'PKG_CONFIG_PATH='
export 
PKG_CONFIG_PATH="/work/yocto/poky/build/aarch64/tmp/work/x86_64-linux/librsvg-native/2.59.2/recipe-sysroot-native/usr/lib/pkgconfig:/work/yocto/poky/build/aarch64/tmp/work/x86_64-linux/librsvg-native/2.59.2/recipe-sysroot-native/usr/share/*pkgconfig/work*/yocto/poky/build/aarch64/tmp/work/x86_64-linux/librsvg-native/2.59.2/build/meson-uninstalled*:*"

With patch:

/work/yocto/poky/build/aarch64$ bitbake librsvg-native -e | grep 
'PKG_CONFIG_PATH='
export 
PKG_CONFIG_PATH="/work/yocto/poky/build/aarch64/tmp/work/x86_64-linux/librsvg-native/2.59.2/recipe-sysroot-native/usr/lib/pkgconfig:/work/yocto/poky/build/aarch64/tmp/work/x86_64-linux/librsvg-native/2.59.2/recipe-sysroot-native/usr/share/*pkgconfig:/work*/yocto/poky/build/aarch64/tmp/work/x86_64-linux/librsvg-native/2.59.2/build/meson-uninstalled"

Best regards,
/Peter
--------------4cNGJi1hCe3ywo00UMdwfQ3j
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2025-03-19 18:17, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANNYZj-mrdUaG0SVu9CWjFF9edGESPNH=9jtJx8gbzuA1NJ-Xg@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">On Wed, 19 Mar 2025 at 17:14, Peter Bergin via lists.openembedded.org
<a class="moz-txt-link-rfc2396E" href="mailto:peter=berginkonsult.se@lists.openembedded.org">&lt;peter=berginkonsult.se@lists.openembedded.org&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">This commit will try to resolve this to always append the
EXTRA_NATIVE_PKGCONFIG_PATH. It is tested by building
librsvg-native and also checking bitbake environment
before and after.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Changes like this make me a bit nervous. Querying pkg-config is *very*
sensitive to the correct order of paths in variables, and things can
easily break when rearranging that.

Does target librsvg build ok as well? If so, this can perhaps go on
the autobuilder.
</pre>
    </blockquote>
    <p>Yes, librsvg builds as well and shall not be affected as the
      changes is only for native. I get more nervous about having badly
      formed paths among the variables. ;-) I hope we can let the
      autobuilder mangle this to get a verdict. I applied it to my big
      customer project with a lot of native packages (on scarthgap) and
      have not seen any regression there. I also searched for the usage
      of EXTRA_NATIVE_PKGCONFIG_PATH among my layers and only found two
      librsvg and ibus-native (meta-gnome).<br>
    </p>
    <p>Before:<br>
    </p>
    <p>/work/yocto/poky/build/aarch64$ bitbake librsvg-native -e | grep
      'PKG_CONFIG_PATH='<br>
      export
PKG_CONFIG_PATH="/work/yocto/poky/build/aarch64/tmp/work/x86_64-linux/librsvg-native/2.59.2/recipe-sysroot-native/usr/lib/<a class="moz-txt-link-freetext" href="pkgconfig:/work/yocto/poky/build/aarch64/tmp/work/x86_64-linux/librsvg-native/2.59.2/recipe-sysroot-native/usr/share/">pkgconfig:/work/yocto/poky/build/aarch64/tmp/work/x86_64-linux/librsvg-native/2.59.2/recipe-sysroot-native/usr/share/</a><b>pkgconfig/work</b>/yocto/poky/build/aarch64/tmp/work/x86_64-linux/librsvg-native/2.59.2/build/meson-uninstalled<b>:</b>"<br>
      <br>
      With patch:</p>
    <p>/work/yocto/poky/build/aarch64$ bitbake librsvg-native -e | grep
      'PKG_CONFIG_PATH='<br>
      export
PKG_CONFIG_PATH="/work/yocto/poky/build/aarch64/tmp/work/x86_64-linux/librsvg-native/2.59.2/recipe-sysroot-native/usr/lib/<a class="moz-txt-link-freetext" href="pkgconfig:/work/yocto/poky/build/aarch64/tmp/work/x86_64-linux/librsvg-native/2.59.2/recipe-sysroot-native/usr/share/">pkgconfig:/work/yocto/poky/build/aarch64/tmp/work/x86_64-linux/librsvg-native/2.59.2/recipe-sysroot-native/usr/share/</a><b><a class="moz-txt-link-freetext" href="pkgconfig:/work">pkgconfig:/work</a></b>/yocto/poky/build/aarch64/tmp/work/x86_64-linux/librsvg-native/2.59.2/build/meson-uninstalled"<br>
    </p>
    Best regards,<br>
    /Peter<br>
  </body>
</html>

--------------4cNGJi1hCe3ywo00UMdwfQ3j--

