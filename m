Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 522067EC48
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 22:58:31 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id k1so713493wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 15:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=LZd1rZV4QjSDZx8MHaO8IQe6rQzSgtDXjyXNr5m0jVc=;
	b=HyozvwFJtHrdHcpS7rgdjROaHdNDUzw9/JgSqqMvJCodkoJlzYIpV5XgIyMrwAN1Oi
	pPcrkZOTzlPaRMqmcfo5/9KP5hR31vCqPf+weTtixpQPLMl3mmqtCYQGLTydaNIh4hnH
	O7pHZBohfjFANwgmMuvzbtlJb0+jbfBBCwVkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=LZd1rZV4QjSDZx8MHaO8IQe6rQzSgtDXjyXNr5m0jVc=;
	b=B/ypznCLLM5kaFKOw/UnUD8k4jF8UTx0PaVUYSD/Mh2LbXrktssjVEh7vpmAeFuxQI
	1T6iuNwQEh92cyoyzzl16ZtmaH07yfbTXr8xQmhyTA00dfANT2FKsXcBgwGSiH1i78DZ
	VMdFCymm59DnFnTd2JITpAcZsx8Irn4rOqECRD/dSTrhZhiah1AWRSc3g6upF9K+DqTL
	Bzc6gWdt8fF621BrQFR05HG+Ao2oM5qA9ST7wV9Y4VLbhOhtzEHvD6J4ZXi3j6kRVEnp
	WvY838RCgOVjCu5rTde1jqDwA7bzt6F2lc5681ePuYgm9AWV6QFDL5IhnDArLQvHhXqu
	OW/g==
X-Gm-Message-State: APjAAAUbtAVgffyd5YcjJxZCuB9BrXGLJ05hrqQEOKYslTYwPRoe/Lbk
	KaANmeojf8l52AyStHFLMjKKBw==
X-Google-Smtp-Source: APXvYqx2HhvklkdkO4yF6sc8W4B6ck0+ZeGu0cm50fbiQXXVP6ASoT0Cq7u5jIuVNJhDfL5TCV49jA==
X-Received: by 2002:a1c:9d15:: with SMTP id g21mr864553wme.96.1566946711956;
	Tue, 27 Aug 2019 15:58:31 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id b144sm756254wmb.3.2019.08.27.15.58.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 27 Aug 2019 15:58:31 -0700 (PDT)
Message-ID: <0f501dcaee763d8d33152fbd82af53385b8d0dc9.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jason Wessel <jason.wessel@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2019 23:58:30 +0100
In-Reply-To: <20190821002750.52062-1-jason.wessel@windriver.com>
References: <20190821002750.52062-1-jason.wessel@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] serial-getty@.service: Allow device to fast fail if it does not exist
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
X-List-Received-Date: Tue, 27 Aug 2019 22:58:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-08-20 at 17:27 -0700, Jason Wessel wrote:
> Some BSPs use a USB serial port which may or may not actually be
> plugged all the time.  It is quite useful to have a USB serial port
> have a getty running but it does not make sense to wait for it for 90
> seconds before completing the system startup if it might never get
> plugged in.  The typical example is that a USB serial device might
> only need to be plugged in when debugging, upgrading, or initially
> configuring a device.
> 
> This change is somewhat subtle.  Systemd uses the "BindsTo" directive
> to ensure existence of the device in order to start the service as
> well as to terminate the service if the device goes away.  The
> "After"
> directive makes that same relationship stronger, and has the
> undesired
> side effect that systemd will wait until its internal time out value
> for the device to come on line before executing a fail operation or
> letting other tasks and groups continue.  This is certainly the kind
> of behavior we want for a disk, but not for serial ports in general.
> 
> The kernel module loader and device detection will have run a long
> time before the getty startup.  By the time the getty startup occurs
> the system has all the serial devices its going to get.
> 
> If you want to observe the problem with qemu, it is easy to
> replicate.
> Simply add the following line to your local.conf for a x86-64 qemu
> build.
> 
>     SERIAL_CONSOLES="115200;ttyS0 115200;ttyUSB0"
> 
> Login right after the system boots and observe:
> 
>    root@qemux86-64:~# systemctl list-jobs |cat
>    JOB UNIT                                 TYPE  STATE
>      1 multi-user.target                    start waiting
>     69 serial-getty@ttyUSB0.service         start waiting
>     64 getty.target                         start waiting
>     71 dev-ttyUSB0.device                   start running
>     62 systemd-update-utmp-runlevel.service start waiting
> 
>    5 jobs listed.
> 
> You can see above that the dev-ttyUSB0.device will block for 1min 30
> seconds.  While that might not be a problem for this reference build.
> It is certainly a problem for images that have software watchdogs
> that
> verify the system booted up all the way to systemd completion in less
> than 90 seconds.
> 
> This other nice effect of this change is that the fast fail device
> extend to additional serial ports that may not exist on ARM BSPs or
> that might be configured in or out by the dtb files on different
> boards.
> 
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  .../systemd/systemd-serialgetty/serial-getty@.service           | 2
> +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Hi Jason,

Somehow this change is responsible for this build failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/976

(steps 5c and 7c so failure during testimage).

I have bisected it to this change, I haven't looked into why.

Cheers,

Richard


