Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id E3F5C7F2ED
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 13:00:59 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id t9so3764136wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 06:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=PksmBxm6Sk/BGJTWRkP34nvt2eaiV9NhwECzhkwz4xw=;
	b=Fh06Eg764fMOOu/YbCdcQF9WXko3XdW5p+1PS/fY1ZNOZKA0X/rZ58DwXxHLEUI7gR
	o/YSEk+POZcmEVPOuEBCa5vMSxH+sbB8qnTvUFGjHP5W/7bXDLf3WRC0MyCS0FbDAlaM
	jSXsii6CNLvKPme1DHeXjxQA3SWd9D6YdAbeE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=PksmBxm6Sk/BGJTWRkP34nvt2eaiV9NhwECzhkwz4xw=;
	b=ldjlcZxPVwXFMfqxgYhAwp5rJz6/SphioU6fH7POPG4834DqOB8LKV/OOM6HAKMr4p
	7x+u0Omok6ozqKJo1UjyIGl0KwykeibcDfZVyH6EEgasZDW/zzVw9WnnW0X8xD2j3yVh
	J0t+08N100FTfo+zS4Q2yBWVKxc9cWOH2ybxCPxLSG/rnrjKmjhMuI5G9T1u9dJshLbW
	DyX+F3K29vbn13FpMVAPZc+jGJ2b8QovfI5cEYXJi1WopnT5YlUGo3/T0qFhSi6QP7JY
	dnhjQsIOkXFB3P1RUg/mXuEwwepCZHW7JRVo+nfvTanl1T0wGpxbaj2xBIE8vXde6LG2
	9oUw==
X-Gm-Message-State: APjAAAVRaLGSFllgN51KHezHMZxHYTf6x1x34Ikbb6yVRatqpLGzFRnM
	UILSMKMvrxjCBHrv+9lEFuQXkw==
X-Google-Smtp-Source: APXvYqw4lxLayyIOTtYSKzqiIFfmcdiUSoFXrKe/o/HLSTm3QkI68RuMGTM6b/9TITl28yNJhaCMHw==
X-Received: by 2002:a05:600c:2111:: with SMTP id
	u17mr12034999wml.64.1567083660487; 
	Thu, 29 Aug 2019 06:01:00 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r190sm3533609wmf.0.2019.08.29.06.00.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 29 Aug 2019 06:00:59 -0700 (PDT)
Message-ID: <8d8cedd858a086ac4ab39f59e4a7b479b2337de9.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Daniel Klauer <daniel.klauer@gin.de>
Date: Thu, 29 Aug 2019 14:00:58 +0100
In-Reply-To: <a43ec955-3565-0db1-baa5-0f7f268c8a0b@gin.de>
References: <e90a6dec179ce0b8d20b6181b724df5ff6351da4.camel@linuxfoundation.org>
	<a43ec955-3565-0db1-baa5-0f7f268c8a0b@gin.de>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] uboot-sign: Refactor do_deploy prefunc to do_deploy_prepend
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
X-List-Received-Date: Thu, 29 Aug 2019 13:01:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-08-29 at 11:05 +0200, Daniel Klauer wrote:
> > That commit message isn't correct.
> > 
> > It removes cleandirs for the prefunc at the start of the prefunc and
> > cleandirs for the main function at the start of that main function.
> 
> Oh ok, so the prefuncs/postfuncs can have their own [cleandirs], that's
> interesting.
> 
> How about the following (trying to find a good way to explain it):

Yes, that sounds fine. The bit in brackets probably isn't needed.

Cheers,

Richard

> 
> -----
> When inherited by the u-boot recipe (UBOOT_PN), uboot-sign.bbclass adds
> a concat_dtb step, which places additional files into ${DEPLOYDIR}
> before do_deploy.
> 
> The use of prefuncs for this prevents us from adding
>   do_deploy[cleandirs] = "${DEPLOYDIR}"
> because that would remove the files produced by the prefunc.
> (Each of prefuncs/task/postfuncs functions has their own cleandirs, and
> each function's cleandirs are removed at the start of that function.)
> 
> Thus, it seems good to make concat_dtb a part of do_deploy, such that it
> runs after removal of do_deploy's cleandirs. As before, care is taken to
> not interfere with the kernel's do_deploy definition, since concat_dtb
> was only needed for u-boot.
> -----
> 


