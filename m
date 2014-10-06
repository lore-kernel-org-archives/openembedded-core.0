Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 55911713B4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Oct 2014 22:08:59 +0000 (UTC)
Received: by mail-qg0-f54.google.com with SMTP id z107so4513012qgd.27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Oct 2014 15:09:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/tDlWxQAWStIU2Gq7liSbkTd2pw7T/9UF4sYSFtplR8=;
	b=UPWeWt793k0UYJfGWuVS5C4Q5bJLp4SskwnFUIUheZPBaV+cW1Gq4nJgDhX8kAwnDO
	+sa2tk0bPpTqDEEZDTmLk77W9FyE3HYhPlaK+byy5fIFdQ+vmOh92wPw2mISY9w/wams
	2Yc5pfV+FU/KJwFJCAuaDfRXslX0OlVFyuZV1NNASXtORCyySShnlpYU38uJd9iDnger
	SLSocfAQ4EGc9xcGx/tj9IXBrmVAH+YxpFmn0XYNBesa/2LeqtxZFS3yveJAvbT6/m8L
	+h6722KRKUwlLOgir1PKDOwvjQVEdo9lhneQQKk3rSFr7wXuIKzV+qyMp/1lYlvuUmP9
	5whg==
X-Gm-Message-State: ALoCoQl6yZgHe9/ySmO5FT02Zv7PsqxEN60639CGzKGnf9+a81oZi48kv+5zQYgIBN2dWGTYESCO
X-Received: by 10.224.121.80 with SMTP id g16mr35475377qar.64.1412633340773;
	Mon, 06 Oct 2014 15:09:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.106.134 with HTTP; Mon, 6 Oct 2014 15:08:40 -0700 (PDT)
In-Reply-To: <126742226.547.1412000986930.JavaMail.zimbra@tpip.net>
References: <126742226.547.1412000986930.JavaMail.zimbra@tpip.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 6 Oct 2014 23:08:40 +0100
Message-ID: <CAJTo0LaxiXU+Q-+kDKpYkm0_ER-KgRof9kAyrF8BEnH9POjvDQ@mail.gmail.com>
To: Andreas Schultz <aschultz@tpip.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [poky] bogus dependency from systemd to systemd-binfmt
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
X-List-Received-Date: Mon, 06 Oct 2014 22:09:00 -0000
Content-Type: text/plain; charset=UTF-8

On 29 September 2014 15:29, Andreas Schultz <aschultz@tpip.net> wrote:
> With the current recipes a dependency from systemd to systemd-binfmt is
> generated. systemd does work fine without systemd-binfmt and binfmt is
> not required for a working system. So, this dependency should not be there.

It's more than just a bogus dependency:

$ rpm -qpl systemd-binfmt-216+git0+5d0ae62c66-r0.26.corei7_64.rpm
/etc
/etc/binfmt.d
/lib
/lib/systemd
/lib/systemd/system
/lib/systemd/system/proc-sys-fs-binfmt_misc.automount
/lib/systemd/system/proc-sys-fs-binfmt_misc.mount
/lib/systemd/system/shutdown.target
/lib/systemd/system/systemd-binfmt.service
/lib/systemd/systemd-binfmt
/usr
/usr/lib
/usr/lib/binfmt.d

Pretty certain shutdown.target doesn't belong in systemd-binfmt!

Right now I can't see a reason to move unit files around and add
dependencies based on *conflicts*, so I'll send a patch removing that
path entirely unless someone has a counter-argument.

Ross

