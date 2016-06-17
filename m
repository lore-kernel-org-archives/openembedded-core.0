Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id BDC78607A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 20:47:26 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id k184so516762wme.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 13:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=D4Jta4S1ebr4YB1HYZuXo7GpWe8DkhLQkFhkBEWE0do=;
	b=FzYq1tK66luyWn7CmhtN8ro7zZdmiTrOW38MffTbhkmddBeI191F5TM3MdQDiR9O1e
	uYnx+SwcMCvFZK4A3vp7M3fepY2G7NvqCy9G6t/WttCul3AqTP8zMNZ+H44oqn4U0FMv
	GPVskIAKQSTm12ystIvbjoTLRZWo/4EpTUAUvDt65VC3zHlEv82pSzRll5JvCy3j1g4O
	UW1Oh/zs2o/mm/yX2EoOmzIo7XQaQ+bzTeSHsPFXU8izS2JyhdgpsdumP+nKuY+//Keh
	1MksTZAjUcbcv/ppKIrJ0cJ8lt66y1h3fPS4lLo4bb6YvEszRS6bb06NVzjE9rEnU6bC
	jI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=D4Jta4S1ebr4YB1HYZuXo7GpWe8DkhLQkFhkBEWE0do=;
	b=LT0BWC1qWq8nGSVFdCNMsaunIFyndruqfEasraioQ4TU4fR5YP+U72F5X/7XsKkqGp
	xlh4FUpXb/gG/xkHulkGaBdXZuLFjiLu81W4Z0X+NHI0I8hsEZ0TwtuR1cA0v54mYgxo
	L/wsrorU+HBEUCFx7B8g2UXnrBJtAzmiOV0QyPcdXJMeeq4s2NIN1mtS19gQqvrJ2O9B
	XcifTBRU4D6bVc8jO9+rAvV2bI5y/mNPlmEI39YbPHYldl+BGH/t6XrumHdMBEQoQ5PA
	FAhf/HdiYbZhpSLNoIBhGhM3qRRIgSzp1d6if2zdTmXdk/UvSg3TK97oS3Hp5NqdKELc
	On5Q==
X-Gm-Message-State: ALyK8tILsz5VdEFyVlJs8jG42fX1Kjy3fQ2z0RlOGEFRnQO6rd+LaJGMOKZ+5mZSrUUvrPwz/xG+EgbV4iFm7w==
X-Received: by 10.28.44.87 with SMTP id s84mr315969wms.61.1466196445663; Fri,
	17 Jun 2016 13:47:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.6.165 with HTTP; Fri, 17 Jun 2016 13:47:25 -0700 (PDT)
In-Reply-To: <1466067888.19334.33.camel@intel.com>
References: <1465917529-18674-1-git-send-email-ross.burton@intel.com>
	<1466067888.19334.33.camel@intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 17 Jun 2016 13:47:25 -0700
Message-ID: <CAJ86T=VjjY5j9-Bdp9Yi4+gqaFAwfee72gM2czQyf9MZwLnLdA@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes/rm_work: use the idle I/O scheduler class
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
X-List-Received-Date: Fri, 17 Jun 2016 20:47:27 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 16, 2016 at 2:04 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> On Tue, 2016-06-14 at 16:18 +0100, Ross Burton wrote:
>> As rm_work is just cleanup it shouldn't starve more important tasks such as
>> do_compile of I/O, so use BB_TASK_IONICE_LEVEL to run the task in the idle
>> scheduler class.
>
> Whether that's desirable depends a lot on the goals for rm_work: when I
> tried to use it for TravisCI to get around some pretty tight disk space
> constraints, I found that do_rm_work was often not scheduled early
> enough because other tasks generating more files had higher priority.
>
> Reducing the IO priority of do_rm_work may have the same effect: it
> runs, but then instead of removing files, the system produces more of
> them, thus increasing the risk of exhausting the disk space.
>
> I suspect a lot of benchmarking will be needed to determine what really
> works well and what doesn't.
>
> I ended up writing a custom scheduler for running under TravisCI:
> https://github.com/01org/meta-intel-iot-security/blob/master/scripts/rmwork.py

I like the idea of BB_NUMBER_COMPILE_THREADS. Would it be appropriate
to add support for that to the default scheduler?

> That orders do_rm_work before any other task and also orders all tasks
> related to single recipe so that they run together, thus making it
> possible to clean up after do_build sooner. As an additional tweak it
> distinguishes between "compile" and "cleanup" tasks and can run
> "cleanup" tasks when the normal scheduler wouldn't because
> BB_NUMBER_THREADS is reached.
>
> But it has the same problem: not enough benchmarking to really quantify
> the effect. All I know is that I stopped running out of disk space under
> TravisCI ;-}
>
> --
> Best Regards, Patrick Ohly
>
> The content of this message is my personal opinion only and although
> I am an employee of Intel, the statements I make here in no way
> represent Intel's position on the issue, nor am I authorized to speak
> on behalf of Intel on this matter.
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

