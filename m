Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7505D7462D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2018 16:28:16 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id b189-v6so8616085lfe.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2018 09:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qkjqwxT7OzcBUQw3xePsUsj3PwGFSZ3HFhUvAipkxLE=;
	b=HUIU6X+uDeZuzYtbH3eVoAZtQfveWfwA0XNSGyuNVcqg17Nlfk5CtcOoo2qCFLD7J8
	H9oMQF7A7QJfn6hw5kRxM77O5oLQfRKNb1RDCD59gyv6XDfdCGYdE+aXIHUqP6UyAPek
	Gg1tmxrUtdf/qJeqz0+wncHSNSW4Sh0Q1XAQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qkjqwxT7OzcBUQw3xePsUsj3PwGFSZ3HFhUvAipkxLE=;
	b=ox8ZR8CgzthvyDcOw+XrRd8qbi3lfEM0b3nYeqL9uDfu7SBPFckShfvWxr+CbbcVFV
	1t1I0Ag0JTXdELnB1OIuvI/2vfQVZpmgaHBxkTNGZHIYKckbqjJZtKOVdMvATO7PN0uJ
	vF0nWwy/UYGgYgzzAxK9cT6NXN6R+wxQS6nREJPyJCjyVt6ltAKdGAZ+N0hBv0VnNgUi
	RT1CVx+1b9A+GyGT/mRQh6l3onvCRlHqtRgfZ5zpk77JvXG4yeV1RRGTYNJo6/HzQeqO
	lyS69G1Y76d6Nx5rkJKbDmROLDPbXp1bsAZhVEgAE5bMJd3djQ0WXmbsBaU2tLXMXLtB
	Dviw==
X-Gm-Message-State: ALQs6tBbLWdt+741bZ+a50lM0l8+9f+WO/QtGysMjFxYc/feDC6hjfcc
	/O/XdB9D5ibEmRsMa6+/h1EYel3MWjLPWHlvF+ThZw==
X-Google-Smtp-Source: AIpwx48cfjS8Avr/B+038RIA9bVw5ppVuIz9bKG6m7Flm+e/GLLAbX+UL+jDXyFa3Mlbf4SNyjH2dZWSY1T1MBUrP6g=
X-Received: by 10.46.155.204 with SMTP id w12mr1113333ljj.76.1523550497402;
	Thu, 12 Apr 2018 09:28:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:9b03:0:0:0:0:0 with HTTP; Thu, 12 Apr 2018 09:27:56
	-0700 (PDT)
In-Reply-To: <00c42779-b82f-f318-4e02-86c5ee9509d6@gmail.com>
References: <20180410112040.13506-1-ramon.fried@linaro.org>
	<CAP71WjxWzSc8pCSv=_NcRNna-pA8mMNUhhhM+X9M7ShO0XK39A@mail.gmail.com>
	<00c42779-b82f-f318-4e02-86c5ee9509d6@gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 12 Apr 2018 18:27:56 +0200
Message-ID: <CAP71WjzdmVAP021gUxMUj-KibYaDWdHTo2jOp3vqjvnutUaE0w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Ramon Fried <rfried@codeaurora.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xserver-nodm-init: Respawn service in case of failure
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
X-List-Received-Date: Thu, 12 Apr 2018 16:28:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 12, 2018 at 5:55 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On 4/10/18 12:48 PM, Nicolas Dechesne wrote:
>> On Tue, Apr 10, 2018 at 1:20 PM, Ramon Fried <ramon.fried@linaro.org> wrote:
>>> From: Ramon Fried <rfried@codeaurora.org>
>>>
>>> It appears that sometimes xserver-nodm.service is starting before
>>> display driver finished loading causing the following failure in
>>> Xorg log:
>>> (EE) open /dev/dri/card0: No such file or directory
>>>
>>> The introduced by this patch is to restart the service,
>>> hopefully the display driver will finish loading.
>>>
>>> Signed-off-by: Ramon Fried <rfried@codeaurora.org>
>>
>> we are seeing this issue on Dragonboard with meta-qcom BSP, where all
>> drivers needed for display/gpu are modules, so the display
>> initialization comes up 'late' in the boot. I had a discussion with
>> some upstream gnome folks who indicated that a similar race can be
>> observed on any hardware, it is not uncommon, and that's why they use
>> Restart=always in gdm.service as well, so that it keep trying until
>> the display comes up.
>>
>> it sounds reasonable change to me.
>
> Restarting service always seems like a workaround here. I wonder if the
> kernel modules tied themselves to systemd-modules-load.service then the
> dependencies should
> sort themselves out. Alternatively we can also create a dependency on
> device being made available.

I would tend to agree that restart is a workaround, but since
gdm.service does that too, i thought it wasn't so bad..

we tried with a udev rule like that:

ACTION=="add", SUBSYSTEM=="drm", KERNEL=="card0", TAG+="systemd",
ENV{SYSTEMD_WANTS}+="xserver-nodm.service"

and it works well too.

between the two, i still prefer the restart=always..

>
>>
>> Reviewed-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
>>
>>> ---
>>>  .../x11-common/xserver-nodm-init/xserver-nodm.service.in                 | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service.in b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service.in
>>> index 324a26f549..87dc4f8fcd 100644
>>> --- a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service.in
>>> +++ b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service.in
>>> @@ -5,6 +5,7 @@ Description=Xserver startup without a display manager
>>>  EnvironmentFile=/etc/default/xserver-nodm
>>>  User=@USER@
>>>  ExecStart=/etc/xserver-nodm/Xserver
>>> +Restart=always
>>>
>>>  [Install]
>>>  Alias=display-manager.service
>>> --
>>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>>> a Linux Foundation Collaborative Project
>>>
>

