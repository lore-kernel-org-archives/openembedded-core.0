Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 72965780D4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 13:12:38 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id u75so152721290qka.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 06:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bENPEdaAYy8bzUcgyhH8SdV03nzkm5LNabGGeGyVONw=;
	b=IAnW16Veh20YJaittl9WUx3FXVmP5CvaesQDk39/WGTIIXmq7Eylf9HPP704rSUK/z
	Xh8iNTJj+YKlAA1zk8AzkDMqrPVaXrJJ9sGu/cTCNJ0RjgDaNG8jiitYkY5BcwzhocZE
	RKfy6wL87/E/kH+s67niDABiSgK1CgUzQ6krM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bENPEdaAYy8bzUcgyhH8SdV03nzkm5LNabGGeGyVONw=;
	b=Ki95xUwHhxi5V5B554g2DUgmVjLG79d6kth2a7tHX4mgXCZsHFoW7neIkui5/p6/Uj
	KuNY84VjfGRJSwDAHOb92cQw3Gr09qef6bkyNHXCOHuRxBh1zZGwmelzW41lKMqFqqz9
	wFc1eftYb57bEugtVT7nAYZDs/Ni0i6ujtv48X+6QmRfBW1XeouzI6kUH5Xe7YcCqNPj
	LC1o+dYICKn7692LD+1DWv50KDtEXZf2WN/m2PTulN4OKnSXlqPLXdsKn7q2QJuz6JhM
	PaZuTEu8663nC4yiljjHqw6um/qGyrw1L5JVqxZleKsvpXUKGJVjYnGlnsN5MNvzIcve
	gKmQ==
X-Gm-Message-State: AODbwcB8Yg4UDM7pvyjzXBlW58rcPO1x+gbm30YZaKokdZ00OKr5+YNg
	eJWz3f/zIptEjkfehpa7KAPPqKu0NNPm
X-Received: by 10.233.232.9 with SMTP id a9mr29971827qkg.238.1495631559397;
	Wed, 24 May 2017 06:12:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.88.135 with HTTP; Wed, 24 May 2017 06:12:18 -0700 (PDT)
In-Reply-To: <16ea8913-19d8-a67a-601a-98cad6657d58@topic.nl>
References: <16ea8913-19d8-a67a-601a-98cad6657d58@topic.nl>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 24 May 2017 15:12:18 +0200
Message-ID: <CAP71WjyNaSFd3Aw5WD9=aKkopAWaofR5b6TUbthzBSusLx45JQ@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: What's the "proper" way to start WiFi networking?
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
X-List-Received-Date: Wed, 24 May 2017 13:12:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 24, 2017 at 2:58 PM, Mike Looijmans <mike.looijmans@topic.nl> wrote:
>
> I was wondering if there were better ways than handcrafting shell scripts to
> do this on a headless embedded board?
>
>
>
> If I put wpa-conf into /etc/network/interfaces it works, but blocks booting
> for a long time if the wifi isn't there.
>
>
> I've been using ifplugd combined with wired ethernet, and this also works
> fine with wireless. Once wpa-supplicant connects to an access point, the
> link reports up and DCHP can start.
>
>
> Starting wpa_supplicant from the commandline runs fine:
>
> /usr/sbin/wpa_supplicant -B -P /var/run/wpa_supplicant.wlan0.pid -i wlan0 -c
> /etc/wpa_topic.conf -D
>
> However, putting this line into a startup script (/etc/rc5.d/...) hangs. It
> doesn't matter whether I start early or late, the wpa_supplicant just hangs
> and waits and doesn't fork into daemon mode like it should. Tried setting
> PATH and redirecting input, invoking through start-stop-daemon, but that
> didn't help.
>
> Appending an ampersand to the command makes the boot continue, but
> wpa_supplicant doesn't work, it won't connect to the access point.

my 2 cents..

after going back and forth for some time, I am now always using
network-manager.. it has very handy command line utilities (nmcli and
nmtui) and is well integrated with systemd. that happens to work well
for me.

i want to believe that connman can do the same thing, but i have never
tried it much..

