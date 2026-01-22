Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DE1FD3EE6B
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 14:25:09 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38524.1769091901087316287
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jan 2026 06:25:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=StZHmaon;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CAD0CC21AA4;
	Thu, 22 Jan 2026 14:24:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 01784606B6;
	Thu, 22 Jan 2026 14:24:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8255D119B8254;
	Thu, 22 Jan 2026 15:24:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769091898; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5jGZ6eFnZavLNHrWqwiDICsW2oMzF3ld/3JVmd+RkVc=;
	b=StZHmaonALY2spDvZSp/vj99k33VYBblFg750ln2xjT7ct2Sv7Xs4ItvQbNbwN+mnR+9C5
	yWGGgikcEHDOmW9q9k8c4xyfKVQEzWmmdpudghs7Z9l3w5Kf8bgtNQQ4THQ7aANGbgGMWZ
	ZgPStcK5ZrNuBXStuKOrTXbPHY+O5HNsn6Wp+yhiln6RXcl1S/Ua/Q1wcJF+EvD/qDMHWS
	wUQqTyoS0cw3c1+pQTA6YbLYMP0rMWVlNg10JQsKQAE8U2oWzopJUNgfH0GG8mUnEF5D6v
	9CeclBUAtUoxkn8+3na3ruZVpucUm5xRbJe+oLCGr4LyHIiaaN9lzDPKGuTU/g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 Jan 2026 15:24:55 +0100
Message-Id: <DFV6QL85IOND.261RTUSIWUPHO@bootlin.com>
Cc: "MacLeod, Randy" <Randy.MacLeod@windriver.com>, "Kokkonda, Sundeep"
 <sundeep.kokkonda@windriver.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <Harish.Sadineni@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v4 00/16] Enable rust support for linux kernel
References: <20260120182947.857242-1-Harish.Sadineni@windriver.com>
 <843161.1768934499700757613@lists.openembedded.org>
 <DFUD78TMO2O0.1WB04Y9FC5LNH@bootlin.com>
 <ee399b5a-f8ca-453c-a451-c646766b61c8@windriver.com>
In-Reply-To: <ee399b5a-f8ca-453c-a451-c646766b61c8@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 14:25:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229845

Hi,

On Thu Jan 22, 2026 at 12:53 PM CET, Harish via lists.openembedded.org Sadi=
neni wrote:
>
> On 1/21/2026 8:46 PM, Antonin Godard wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender a=
nd know the content is safe.
>>
>> Hi,
>>
>> On Tue Jan 20, 2026 at 7:41 PM CET, Harish via lists.openembedded.org Sa=
dineni wrote:
>>> This patch series was tested on Autobuilder:
>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3193
>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3056
>> Thanks for your efforts on this. However I think it triggers issues in o=
ther
>> builders as you can see from this a-full run (a-full is the complete Aut=
obuilder
>> testing run):
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3101
>>
>> For example, the first failure in the list (beaglebone builder):
>>
>> | error: linking with `/srv/pokybuild/yocto-worker/beaglebone/build/buil=
d/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-rust/1.92.0/wrapper/bui=
ld-rust-ccld` failed: exit status: 1
>> |   |
>> |   =3D note:  "/srv/pokybuild/yocto-worker/beaglebone/build/build/tmp/w=
ork/x86_64-nativesdk-pokysdk-linux/nativesdk-rust/1.92.0/wrapper/build-rust=
-ccld" "-m64" "/tmp/rustcBDQQCc/symbols.o" "<75 object files omitted>" "-Wl=
,--as-needed" "-Wl,-Bstatic" "<sysroot>/lib/rustlib/x86_64-unknown-linux-gn=
u/lib/{libstd-*,libpanic_unwind-*,libobject-*,libmemchr-*,libaddr2line-*,li=
bgimli-*,libcfg_if-*,librustc_demangle-*,libstd_detect-*,libhashbrown-*,lib=
rustc_std_workspace_alloc-*,libminiz_oxide-*,libadler2-*,libunwind-*,liblib=
c-*,librustc_std_workspace_core-*,liballoc-*,libcore-*,libcompiler_builtins=
-*}.rlib" "-Wl,-Bdynamic" "-lgcc_s" "-lutil" "-lrt" "-lpthread" "-lm" "-ldl=
" "-lc" "-L" "/tmp/rustcBDQQCc/raw-dylibs" "-Wl,--eh-frame-hdr" "-Wl,-z,noe=
xecstack" "-L" "/srv/pokybuild/yocto-worker/beaglebone/build/build/tmp/work=
/x86_64-nativesdk-pokysdk-linux/nativesdk-rust/1.92.0/recipe-sysroot/usr/lo=
cal/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib" "-L" =
"<sysroot>/lib/rustlib/x86_64-unknown-linux-gnu/lib" "-o" "/srv/pokybuild/y=
octo-worker/beaglebone/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/=
nativesdk-rust/1.92.0/sources/rustc-1.92.0-src/build/bootstrap/debug/deps/r=
ustdoc-92c720c010da8c74" "-Wl,--gc-sections" "-pie" "-Wl,-z,relro,-z,now" "=
-nodefaultlibs" "-lz" "-lzstd"
>> |   =3D note: some arguments are omitted. use `--verbose` to show all li=
nker arguments
>> |   =3D note: /srv/pokybuild/yocto-worker/beaglebone/build/build/tmp/hos=
ttools/ld: cannot find /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_6=
4-pokysdk-linux/lib/libm.so.6: No such file or directory
>> |           /srv/pokybuild/yocto-worker/beaglebone/build/build/tmp/hostt=
ools/ld: cannot find /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-=
pokysdk-linux/lib/libmvec.so.1: No such file or directory
>> |           collect2: error: ld returned 1 exit status
>>
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/3084
>> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/5052191/raw_in=
line
>>
>> Can you have a look at these failures?
> Thanks for reporting this.
> The error indicates that the linker is unable to locate libm.so.6 and=20
> libmvec.so.6 in the recipe sysroot.
> These libraries are normally provided by glibc, and this issue does not=
=20
> appear to be caused by our patches, as we are not able to reproduce it=20
> locally.
> Could you please re-test the series once more to confirm?
>
> Thanks,
> Harish

Ok, thanks for testing again on your side. It may have been related to anot=
her
commit on my branch as I'm not facing the issues again. I'll re-add the ser=
ies
to my branch - sorry for the false alarm!

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


