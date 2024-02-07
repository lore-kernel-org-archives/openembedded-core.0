Return-Path: <baruch@tkos.co.il>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFA7DC4828F
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 09:30:50 +0000 (UTC)
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by mx.groups.io with SMTP id smtpd.web11.16713.1707298241243343942
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Feb 2024 01:30:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tkos.co.il header.s=default header.b=g9+OC5Jd;
 spf=pass (domain: tkos.co.il, ip: 84.110.109.230, mailfrom: baruch@tkos.co.il)
Received: from localhost (unknown [10.0.8.2])
	by mail.tkos.co.il (Postfix) with ESMTP id DB4DF440845;
	Wed,  7 Feb 2024 11:30:08 +0200 (IST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
	s=default; t=1707298208;
	bh=tFGe0AhQx0YTyzX3WbAIC+GUZMNMoy+X2c7JlGQW/V0=;
	h=From:To:Cc:Subject:Date:From;
	b=g9+OC5JdjdU2rmTk9eOzlVWe9pCgqdCTfVtfSZuq4eRgaLFtK1k+3HN6gHrWvLjWz
	 8j95YGllKCa3jB818ZrNe1IiKkY3Mqf+B8mTNvfoZ/HfZG0P0qjKKo9uAPUFe1FJid
	 YjChOrbjuZ9xpxeAF12+tBsRuP0jn7Io3+Vm4SnwaQcZ1yVLqH9vvVxJk/DFUOco8a
	 fq892H+Ns8i50SQ+A/r4kPYLbRH/iFjLywo+5sf2l2+RyO1WzQWZqEh/pB2VXYeIOj
	 HEHUbfmbfUIOirFn86f+DlFojJxwj+HbON/6shCrmNDxndY/xcqk+C18RKOdjGN4nN
	 7EJxkJj0qQg2g==
User-agent: mu4e 1.10.8; emacs 29.1
From: Baruch Siach <baruch@tkos.co.il>
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: overlayfs-etc compatibility with volatile-bind
Date: Wed, 07 Feb 2024 11:28:34 +0200
Message-ID: <87sf24vcxu.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 09:30:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195046

Hi Vyacheslav Yurkov,

overlayfs-etc generates a 'preinit' script that unconditionally remounts
root to make it writable. Later systemd-fstab-generator generates a
mount unit (-.mount) that restores read-only as set in /etc/fstab.

I added an entry to VOLATILE_BINDS for the /home directory. The volatile-binds
recipe creates a systemd mount unit with the condition

  ConditionPathIsReadWrite=!/home

The trouble is that there is no dependency between the rootfs mount unit and
the /home unit. When the /home unit runs first, the condition is false, and
the unit fails. If I later start the /home unit manually, it succeeds, because
rootfs is read-only now.

What is the purpose of mounting root rw in 'preinit'?

Is there any other alternative to make volatile-binds do the right thing?

Thanks,
baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

