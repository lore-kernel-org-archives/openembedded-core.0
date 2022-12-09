Return-Path: <ola.x.nilsson@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A3F7C4332F
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 10:38:18 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.10199.1670582289172020695
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Dec 2022 02:38:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=fY4X/rGj;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: ola.x.nilsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1670582289;
  x=1702118289;
  h=references:from:to:cc:subject:date:in-reply-to:
   message-id:mime-version;
  bh=z8sJd+ZQuAEmpEJ0noXTiBgttagRXUwg5lN9AP5lSPE=;
  b=fY4X/rGj302CEfrcj2RdJruDSgEIT2GWAPG2gQ5Ul2ZuNlSFyfG/6w92
   6llSv4efe2TEhvOH7CF0w/Snn+KGVbTZ//A1ZPTqUxo95eIDhp1maHP0C
   YdCFLuE28BWH0w/kEABivsRZpr6tzYQazCHqoZDjJqVEGhhUlegW0bXxH
   KbGxr4RuuzvCsqOe7YLjIJXULLznPes8ztgHX3KnzvY8B5cb3XslI7q/h
   OFJCC8ywFiahfS3wE61UT98GTsfeA9rlX4tprNoasHNQtwRWNNbgCXcsB
   fXfQFcGfPtG5v7iMMazyo9HCExOC/pxWUMJYdBx/VDq27v5cytHjd24zy
   A==;
References: <20221208071136.1967696-1-olani@axis.com>
 <20221208071136.1967696-4-olani@axis.com>
 <CANNYZj_NFOejE6Xe2xHTTWkuMVY2TmPGpXTZYT=3+5V1Y2u3Xg@mail.gmail.com>
User-agent: mu4e 1.8.8; emacs 29.0.60
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH RFC 3/3] time64.conf: Include to enable 64 bit
 time flags
Date: Fri, 9 Dec 2022 11:36:03 +0100
Organization: Axis Communications AB
In-Reply-To: <CANNYZj_NFOejE6Xe2xHTTWkuMVY2TmPGpXTZYT=3+5V1Y2u3Xg@mail.gmail.com>
Message-ID: <jwqwn70c168.fsf@axis.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 10:38:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174443


On Thu, Dec 08 2022, Alexander Kanavin wrote:

> On Thu, 8 Dec 2022 at 08:11, Ola x Nilsson <olani@axis.com> wrote:
>> +GLIBC_64BIT_TIME_FLAGS:pn-glibc = ""
>> +GLIBC_64BIT_TIME_FLAGS:pn-glibc-tests = ""
>> +# pipewire-v4l2 explicitly sets _FILE_OFFSET_BITS=32 to get access to
>> +# both 32 and 64 bit file APIs.  But it does not handle the time side?
>> +# Needs further investigation
>> +GLIBC_64BIT_TIME_FLAGS:pn-pipewire = ""
>> +GLIBC_64BIT_TIME_FLAGS:pn-gcc-sanitizers = ""
>> +
>> +INSANE_SKIP:libstd-rs[_usr_lib_rustlib_armv7-poky-linux-gnueabihf_lib_libstd.so]
>> = "clock_gettime gettime fcntl fstat64 fstatat64 getsockopt ioctl
>> lstat64 nanosleep prctl recvmsg sendmsg setsockopt stat64"
>> +INSANE_SKIP:librsvg[_usr_bin_rsvg-convert] = "fcntl fstat64 prctl stat64 clock_gettime"
>> +INSANE_SKIP:librsvg[_usr_lib_librsvg-2.so.2.48.0] = "fcntl lstat64
>> setsockopt sendmsg fstat64 getsockopt ioctl nanosleep timegm
>> fstatat64 prctl mktime gmtime_r recvmsg stat64 clock_gettime
>> localtime_r"
>> +
>> +# libpulsedsp.so is a preload-library that hooks libc functions
>> +INSANE_SKIP:pulseaudio[_usr_lib_pulseaudio_libpulsedsp.so] = "setsockopt fcntl"
>
> Some of these perhaps need a ticket in bugzilla, and there should be a
> meta-ticket for Y2038 that tracks individual issues (by depending on
> them). Can you arrange that please?

I can file tickets if that's the way we want to go.  I'm not really at
that point yet, these are just for the packages that were included in
our products.  I've just done one plain poky build to make sure this
stuff worked so far.

-- 
Ola x Nilsson

