Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 227AB782A7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Aug 2017 16:36:11 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id j68so7918364pfc.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Aug 2017 09:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PbecoOaALJO3FUPKpIScA1ZaMsaUBl+ka4UeLBSkmj0=;
	b=aNlcwWdUmWjkbK9gAs1kFQPLS4+9UNjp2xrpUL39zZTiqDUpvAPNUZlOc45XezRDk+
	GgAJDM2VnUEpXFoUhE1qw/QukT0XuEh2D/HR38uIlhMLf62YmoiQharrnF48dHQjbg6H
	oPa0KEfd4rzTfprPAjVXpF5uo9ASNRddO5rl5WVROqfjwsQLGXSnhlxA0WgPpnK3AYRF
	3nintxEUhzkOlONyVBiOQJMDzb7lKm6w2Yqudw9y4Qs6ur3u1Thp+un1MHjX7tlYcVTY
	5+hziLyGqTDh4KRPTG5BXIPXAd16Po2ebVCtemPTYux8j1/CvINdGMFpe7ZCdKI4h5DF
	rU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PbecoOaALJO3FUPKpIScA1ZaMsaUBl+ka4UeLBSkmj0=;
	b=EdcYALNWOzH2xok84PwcLc+p1lojsn6OPH5B9FmG3pSq//mj3HL3E7/RVC9NidtyYu
	JzU3uLpBMxG1MK8e2tABHAedEyiQY+G6fh39EUYg0F2ZVd/IdEKCwZ7swPN9Syb42bH8
	LTC2X3kO3BAXQjT8BkS0k/znE/ZmqZZO7IO3XIv6y69fLp7EjDrCU9+6T6KY4zmHlmkN
	0Y44Vql1usKhWR+6xTVvYjo9sdUdOyyAZ+lzdA7WiMIb4F4BulajJ86Z8KQrNeOLNxGB
	zEhqPD/juWahKtSnfb07F+gX0z0K5m7oZfiuMk1zVHBxay9UGk8EvsR7txkGQ9oUlk3T
	AdcQ==
X-Gm-Message-State: AHYfb5gF2IVuAnxTyeNGoWF757zr+F4yl8xxNDKiZa8f4+YFhjzvMbJ7
	8nzeC6ybgQTPJzWiSO7NO+FaOLHHcQ==
X-Received: by 10.99.3.197 with SMTP id 188mr22335241pgd.288.1502642173354;
	Sun, 13 Aug 2017 09:36:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Sun, 13 Aug 2017 09:35:41 -0700 (PDT)
In-Reply-To: <1502613383.18633.287.camel@linuxfoundation.org>
References: <1502421401-112341-1-git-send-email-zhixiong.chi@windriver.com>
	<1502613383.18633.287.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 13 Aug 2017 09:35:41 -0700
Message-ID: <CAMKF1sqWL=M367APQ5-L1rw_41Ear+JjXJjVdudcY6uNexXEbQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: add ld.so locks in _libc_fork
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
X-List-Received-Date: Sun, 13 Aug 2017 16:36:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 13, 2017 at 1:36 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2017-08-11 at 11:16 +0800, Zhixiong Chi wrote:
>> The patch in this Bugzilla entry was requested by a customer:
>>   https://sourceware.org/bugzilla/show_bug.cgi?id=4578
>>   https://www.sourceware.org/bugzilla/show_bug.cgi?id=19282
>
> I'm a little nervous about accepting a patch which has been sitting in
> the glibc bugzilla for around 10 years. Any idea why upstream haven't
> taken this?
>

patches look sane to me. I would like to see if we can reproduce the
issue on x86 using the
testcases from bugzilla

> Cheers,
>
> Richard
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

