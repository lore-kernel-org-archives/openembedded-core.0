Received: from mail-ve0-f179.google.com ([209.85.128.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UVJ9p-0002sS-S4
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 12:12:07 +0200
Received: by mail-ve0-f179.google.com with SMTP id oz10so1201351veb.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2013 02:54:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=Igg2Eezds7QwpdRe0E3iE1LeLfwpMuc6vAkxq/Xo6ag=;
	b=XOpJ3sT4FKtBCgF+90c8hOEWSP7l006teTbdFWICzKcn7jEX4QwvbE/UODVQyrR+bG
	D0Y/WPxu0WkHc2GynvYYpOIPaKhRHQUSA6s0n9dPqgj5IqKB+MSNlMMJ0WLyMEB1XZfN
	o7kjXtmPElc7WC84wTrHpBG2tLHCCwKM6SP2bi0yrTF106HgZ40xgj98L2FaNtjfu20x
	kzVyi20+KaxSGZrnWPGbTFnQ2kYMSeNHg8JruCH99WdpoDJJP/Ao31QIF0ejLXVsmhGs
	prlVLBiP3kafBhfnI60Av1CrwLe+WpdoJ223jmCufpzsVQNS83Y6lPPYDI7pjR3rKflv
	8dTg==
X-Received: by 10.220.155.8 with SMTP id q8mr20853194vcw.42.1366883661149;
	Thu, 25 Apr 2013 02:54:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Thu, 25 Apr 2013 02:54:00 -0700 (PDT)
In-Reply-To: <6471223fe7c0d17e2a3209b58f1b1ebdba165a9f.1366802026.git.hongxu.jia@windriver.com>
References: <cover.1366802026.git.hongxu.jia@windriver.com>
	<6471223fe7c0d17e2a3209b58f1b1ebdba165a9f.1366802026.git.hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 Apr 2013 10:54:00 +0100
Message-ID: <CAJTo0LY1H9XzeVps7MXtLLythCfzpnGzc51D_zS44Yum-KKYUg@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
X-Gm-Message-State: ALoCoQmqYi2B5oy+TI2F37iwiJvDkMmbZpwwgVAyl5nzHM/Sp8bmG6h9AhF3ZeN4UKqjmPzQJMXq
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] systemd: fix do_compile failed in parallel builds with system's make 3.28
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Apr 2013 10:12:08 -0000
Content-Type: text/plain; charset=UTF-8

On 25 April 2013 09:16, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> 3, Add `make-native' to systemd's `DEPENDS' to use Yocto's make rather
> than system's to compile systemd.

NACK.

Installing make-native during a build will lead to races over the make
binary, causing strange and non-obvious build failures.

A unpatched 3.82 in certain distros (F16 is the only culprit that I'm
aware of) is a known issue and we'll be adding to the release notes
that if you have a broken make, run "bitbake make-native" *first*.

Opensuse 12.1 has the patches required to fix this
(https://build.opensuse.org/package/show?package=make&project=openSUSE%3A12.1%3AUpdate,
make-parallel-build.patch, added 5 weeks ago) so please update your
distro and this will fix itself.

I'm also told that 12.1 will be EOL in 21 days from now, so you should
consider upgrading to 12.3.

Ross


