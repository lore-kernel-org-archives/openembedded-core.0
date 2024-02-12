Return-Path: <baruch@tkos.co.il>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D49D8C4829E
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 18:45:20 +0000 (UTC)
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by mx.groups.io with SMTP id smtpd.web10.14584.1707763519751476882
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 10:45:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tkos.co.il header.s=default header.b=TFQ25RLp;
 spf=pass (domain: tkos.co.il, ip: 84.110.109.230, mailfrom: baruch@tkos.co.il)
Received: from localhost (unknown [10.0.8.2])
	by mail.tkos.co.il (Postfix) with ESMTP id 8DD54440865;
	Mon, 12 Feb 2024 20:44:38 +0200 (IST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
	s=default; t=1707763478;
	bh=mojmCvADg/kgz60BBC2G/pkeb+p+X2TWBjD/4NjSef0=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:From;
	b=TFQ25RLpDt7VuNxZsIu9VYafSZQWCbb1LfnWGJ3+QMdy2lORdW0M12/5s6TNpL2Ag
	 ta/iPSAf0T570MSLXFBrZ2NZ+zMuX/PUJFhYZzoqNC43ij5rQAUL2dk0eaty0vP4SD
	 dwh0pypW9kcANs+7azAWnJeXTReky9GMkMhnoAE1yWBeDZkN6s/pvHorcPFXRfD4FI
	 /8vReQV0aHsA+ACuiQvumWY9Id1QEWUCIKvAF5J9GBO5+XfQwzXfoZSOWxKNvmHdhz
	 IirUO2uRuEQh4s3F/g9nZ+RuEKAOgEQ46Zq+T36XQn6IN9kX7yXw3CEzQ2s8LpCwai
	 IrAHrnHEmDeFw==
References: <391a7b90f3cb6a7b276904b69a2251bf0d3849c9.1707376966.git.baruch@tkos.co.il>
 <5066577e-7447-4f4f-8212-7729a3ada8ba@gmail.com> <87cyt35dcy.fsf@tarshish>
 <33d0888f-281c-4bc1-8a03-3bc3fcd182d6@gmail.com> <87o7cl3gn7.fsf@tarshish>
 <27fd5d45-08e2-47f6-9038-187dfc9562b8@gmail.com>
User-agent: mu4e 1.10.8; emacs 29.1
From: Baruch Siach <baruch@tkos.co.il>
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] overlayfs-etc: take read-only-rootfs into account
Date: Mon, 12 Feb 2024 20:40:18 +0200
In-reply-to: <27fd5d45-08e2-47f6-9038-187dfc9562b8@gmail.com>
Message-ID: <87frxx34k0.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 18:45:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195357

Hi Slava,

On Mon, Feb 12 2024, Vyacheslav Yurkov wrote:
> On 12.02.2024 15:21, Baruch Siach wrote:
>> I reproduced the test failure. The output does not give much of a clue
>> as to the cause of failure. How can I run the same qemu command
>> interactively? Is qemu test console output saved somewhere? This log
>> might be useful.
>>
>> Thanks,
>> baruch
>
> It could be that it failed, because qemu needs sudo for a few commands (or
> respective permissions for the user you run test under). These are included in
> my /etc/sudoers:
> poky/scripts/runqemu-ifup
> poky/scripts/runqemu-ifdown
> poky/scripts/runqemu-gen-tapdevs
>
> Could you please verify if it works after that? If yes, I'll extend the
> mentioned wiki page.

I think the failure is because /data does not exist in generated
rootfs. That explains why sda1/sda2 are mounted but not sda3. With that
insight I updated the patch to use an optional variable as you
suggested. Patch v2 passed the test here.

> As for the interactive run, this command works for me:
> runqemu
> ../build-st/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs.wic

Thanks for the tip.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

