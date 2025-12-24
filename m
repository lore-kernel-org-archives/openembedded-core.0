Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 148F5E7545F
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 14:12:42 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.120695.1766585558022514574
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Dec 2025 06:12:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Fq6dGCOH;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47bdbc90dcaso38853225e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Dec 2025 06:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766585556; x=1767190356; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZAj3kGrcYDil9U4UpuQiYOdQ3aIJ60tQVrm6hu98TwQ=;
        b=Fq6dGCOH0X1JlfgMndef5WbQ0iXpoR1iR+JHipQULPL53o8AEuq1D9u0nWjVhi9XwV
         vuAhLBNtizkqVuONLbhmwCZaMcDvIFLvmg57XMD4ckA4/gnXX0guNzhDrVC6WWVZkY2D
         635KXDWRXizCKzGndFxci3V/PMJfY8Twh4tZGm8uUcon4/Tq1PmLfoIIe5DDF1Y2PbeQ
         FcHJZWOL79o4cGqEFxWccMx7AJYrEoODYUD0aTGCJvU3logsXv8lLSaUuTtb6l91dSoU
         aC2FPPJJ90JV63gP1rC+yHXQM/W7I8IGumUKGqE+zslivU0giotYBQSXNfT5jWra9DW0
         LdvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766585556; x=1767190356;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZAj3kGrcYDil9U4UpuQiYOdQ3aIJ60tQVrm6hu98TwQ=;
        b=s6PWku2NQ1G+v3DyFcefDHpeJFji8Yquh2MKcbNpSr14IQ70hLsW9qUM1Uv3IfvIaT
         4bMm+lVN/eTNAmUmoN6asmWALFUjJ7x/RPN4OkMcWUnXPo0CTy9Y0QFKbD+Ww/avMme3
         eONz/vLsqydtg4dM9bXPLXlL37ys7zWhmEa+VbBxgj82QuhKw9G9Sf+wki7GXWfibKT4
         umN99Xv/wwMLbnjdA9bKLx8XYodMhHdzToBWFuLhwR5n6Pp1FMuq1QoxfOG3so00TxXE
         1j//ZxG2mVQVb7l4JW1wnb32Qai4tOthdHrBj3+MPBHk1Ayg6u/e7hZIuxTfqaVEKbi0
         rfCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWZXpWYNcE+0ftLa2rXnmLgQSvN3cNQBvwZkrgxn8YN7HM8vISn8WA8n/Zqbb2+TvYu02qhCc86tehFqaKY2mMmA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyP781g57x9mz32TXxCCUDZcGbdDhAQIn2jzHCFlT+S8Z+tZoX+
	CmhVw8TRPFdY6EMqeg2IiaB6FBC95YTh93yssbJRQrLuGivFkdzy6eGe
X-Gm-Gg: AY/fxX7Wnp8yKHF58imMsi7ozNlJU9j0ZY/8Vg9Mr8lFESGH1Ri10dbG6zxGK7sgBw+
	TTYrfsFL87zAycKvZtSNOgtGuqvIYRMU/82uLZV8TDS6AKX6u9KJkRB1LXGZIjPFbw3b6Z4lKK+
	N96rhlb8uS9HdOsXiquGiV9BOEWPqCGJI3DCl9IT+n9ADJUalauE3BUWxt3bRMe2pBy8Zsoq7we
	mPKhYuTZPCUOQICb5793IeM6OFCY8aCdXPTheJ+TXL+FrrFvXVvCB3u3/rsIqJizZ7kX+Ub+Jkw
	47NIU09ZWJOREOQ7PNePmKuRHgITCxEx6CRGQTwgdgNtcwTTjx7FGKb+oI/3amXTePdlaL7zkgU
	mHp2o7WPdtlaTTsbIGLX1f83+vduwRSTdbLcBdRHLSikb4GJissSJ85htndeOgz4kK4wpsPKcTP
	X4E9bc2RzqP/LeZyktr+/pSx16CnY=
X-Google-Smtp-Source: AGHT+IFiRq51IYuyY91SlJ+izmPTX6BZh85CvQVwitUmwTIDej7vewBhe28pJWXClQqATO7yxxL+/Q==
X-Received: by 2002:a05:600c:1991:b0:477:7a78:3016 with SMTP id 5b1f17b1804b1-47d1953318bmr173426015e9.8.1766585555975;
        Wed, 24 Dec 2025 06:12:35 -0800 (PST)
Received: from [10.54.16.211] ([154.47.27.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea227casm34630713f8f.15.2025.12.24.06.12.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Dec 2025 06:12:35 -0800 (PST)
Message-ID: <1577bc78-8649-4962-bee3-04c2321fb457@gmail.com>
Date: Wed, 24 Dec 2025 15:12:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 4/4] oe-selftest: overlayfs: Add a demo case for
 /etc
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
References: <20251222113840.2163929-1-uvv.mail@gmail.com>
 <20251222113840.2163929-4-uvv.mail@gmail.com>
 <DF6FNBU6P0LO.3DX90J7NFTZK4@bootlin.com>
Content-Language: en-US
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <DF6FNBU6P0LO.3DX90J7NFTZK4@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Dec 2025 14:12:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228536

On 24.12.2025 13:07, Mathieu Dubois-Briand wrote:
> On Mon Dec 22, 2025 at 12:38 PM CET, Vyacheslav Yurkov via lists.openembedded.org wrote:
>> From: Vyacheslav Yurkov <uvv.mail@gmail.com>
>>
>> /etc is a special directory. It's possible to create a mount unit for
>> it, but many system services that start early at boot time will not
>> rescan its content when you mount overlay on top. The added test case
>> demonstrates this but adding a sample systemd service and enabling it in
>> overlay.
>>
>> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
>> ---
> Hi Vyacheslav,
>
> Thanks for your patches.
>
> It looks like the added test is failing on the autobuilder, on arm host
> platform, with some wic related error:
>
> 2025-12-24 10:16:24,719 - oe-selftest - INFO - overlayfs.OverlayFSTests.test_etc_mount (subunit.RemotedTestCase)
> 2025-12-24 10:16:24,720 - oe-selftest - INFO -  ... FAIL
> ...
> 39519	/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-904882/tmp/work/qemuarm64-poky-linux/core-image-minimal/1.0/tmp-wic/boot.img
> | ERROR: Couldn't find correct bootimg_dir, exiting
> |
> | WARNING: exit code 1 from a shell command.
> NOTE: recipe core-image-minimal-1.0-r0: task do_image_wic: Failed
> ERROR: Task (/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openembedded-core/meta/recipes-core/images/core-image-minimal.bb:do_image_wic) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 5451 tasks of which 5354 didn't need to be rerun and 1 failed.
> NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-904882/tmp/log/error-report/error_report_20251224101317.txt
> You can send the errors to a reports server by running:
>    send-error-report /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-904882/tmp/log/error-report/error_report_20251224101317.txt [-s server]
> NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.
>
> Summary: 1 task failed:
>    /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openembedded-core/meta/recipes-core/images/core-image-minimal.bb:do_image_wic
>      log: /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-904882/tmp/work/qemuarm64-poky-linux/core-image-minimal/1.0/temp/log.do_image_wic.3087704
> Summary: There was 1 ERROR message, returning a non-zero exit code.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3043
>
> Can you have a look at this?
>
> Thanks,
> Mathieu
>

Hi Mathieu,
It was not supposed to run on arm yet. Did I forget a tag?

There's a ticket to fix it for arm 
https://bugzilla.yoctoproject.org/show_bug.cgi?id=14963 , but I haven't 
addressed it yet.

Slava

