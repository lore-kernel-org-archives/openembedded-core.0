Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by mx.groups.io with SMTP id smtpd.web11.9371.1591791469444157218
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2020 05:17:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: nod.at, ip: 195.201.40.130, mailfrom: richard@nod.at)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id C5BA76089320;
	Wed, 10 Jun 2020 14:17:46 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id IpDlWlyqNWrX; Wed, 10 Jun 2020 14:17:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 66902608932D;
	Wed, 10 Jun 2020 14:17:46 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id nkvDk4-QrrsO; Wed, 10 Jun 2020 14:17:46 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 369D86089320;
	Wed, 10 Jun 2020 14:17:46 +0200 (CEST)
Date: Wed, 10 Jun 2020 14:17:45 +0200 (CEST)
From: "Richard Weinberger" <richard@nod.at>
To: openembedded-core@lists.openembedded.org
Cc: mkelly@xevo.com, richard.purdie@linuxfoundation.org, 
	Alexander Haubner <alexander.haubner@sigmatek.at>
Message-ID: <1855985738.3034.1591791465954.JavaMail.zimbra@nod.at>
Subject: nativesdk-meson issues
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF68 (Linux)/8.8.12_GA_3809)
Thread-Index: 1N9qLHekWBiVpCQUkRkQdQeVoWHGbg==
Thread-Topic: nativesdk-meson issues
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi!

While investigating build issues I traced the root cause back to nativesdk-meson.
We are on Yocto zeus with meson-0.54.2 backported from openembedded-core master,
but this should not matter.

1. meson wrapping

nativesdk-meson creates a shell wrapper which adds --cross-file=... to the meson command.
Maybe this used to work on older meson releases, on recent meson it causes problems since
--cross-file= is only accepted by the "setup" command, which is default in meson.
As soon you want to use a different command such as "test", meson rejects --cross-file.
We noticed because our test infrastructure makes use of meson test.

2. meson.cross generation

The way you generate the cross file makes meson think it does native instead
of a cross build.
Our target arch is aarch64, although meson writes during setup:
Build machine cpu family: x86_64
Build machine cpu: x86_64
Host machine cpu family: x86_64
Host machine cpu: x86_64
Target machine cpu family: x86_64
Target machine cpu: x86_64

...and does not switch to cross mode.


I suggest dropping the wrapper and ship a good enough meson.cross file with the SDK
but please do not force everyone to use it.
For example in our case we need to set exe_wrapper, root, sys_root, and pkg_config_libdir
in our cross file.
If you think this is a reasonable apporach, I'll happily send patches. :-)

Thanks,
//richard

