Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id 189F07450B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2018 20:52:33 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id t27-v6so2679159oij.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2018 13:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lsZx5BY3LWdbi/HGW3jcyvYbgWryTAJcNHxDOFKwMnE=;
	b=UxGcTt7BwZxWrni92p/CcY1qlRiweUchLQ7aMMsyBkp+XQGS5z6PaAKii4gZBzfGuU
	gXoB4B/GSGTuDl2BZJiEGE/at77Yu7/z0zp7exPTq+zkPWYm6SInFOweTRapfd0WfQFs
	zTWXEbhaXVd/KaFcMXCLConCU0quxVHcV2+wcnv409IJP6QHK0j/civGBhJC/gSYhb38
	odnaVpKWpaKdl9g8zS9+8iC3AWomrd/TgVHyJ+XPDw5aXWkaeaI2BXbdcTCQc9KRAm+c
	VBawt0HnVgggm29mFeuFlYMopkpowiouFg08dxzx6VaG7YhpVKNViJJr6MaqZg6CrG9x
	XvLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lsZx5BY3LWdbi/HGW3jcyvYbgWryTAJcNHxDOFKwMnE=;
	b=ga96P7wlbqBfikmVikh1TJW7A2dRwUjAT8igWW+DhjNcxgI3rMKKD6ykJRXlb5JnBx
	HjftjWptK9xDbJiCf90FgdLp2la5W1MTwFh91CZdClVHqXcWfzQ4BYzexXuau92kVeec
	fgZcTB9P731HX7d1Oef5RHHprSamYGajG1oBv5yeZcAq+cH2EWR+YufWOt0AjkcD5uAZ
	lUBNKtEjiLH4YrRtcI/3TAteTNHI4hbr1U5WodMJNzjWlN+0ob9KpTd9/JhB76sYBNUA
	W+o+65M8wh/c51E8Qa6rrmuPpkEjINWJSvc+ZIZ5lWy3Ej9GPG5gxXvZHc6WBrXUEz22
	k7uQ==
X-Gm-Message-State: ALQs6tCQieEZZw35pCo6hoCdlYgUzYkSjSHGvdsAbIOS0/kWEP6IlwmZ
	RSSoMLEutpIngzi2Aayro+FwxbUK+2JyYTiUTJwSOw==
X-Google-Smtp-Source: AIpwx49ZitCH8GXr6xs0M21QAPEniv5a3mLqp1ymf1yh+ZhoiSTxZbyM4iTSzfFpFqh7MJ1Uuk+v01FryzJvKgnlR7c=
X-Received: by 2002:aca:d09:: with SMTP id 9-v6mr2308344oin.170.1523998354628; 
	Tue, 17 Apr 2018 13:52:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.138.17.198 with HTTP; Tue, 17 Apr 2018 13:52:14 -0700 (PDT)
In-Reply-To: <1523983449-32655-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1523983449-32655-1-git-send-email-richard.purdie@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 Apr 2018 21:52:14 +0100
Message-ID: <CAJTo0LYwLeeR0y0x=PdYKCSdvi1hku5q_ixf77Te+bKqC_Lk_Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] uninative: Add allow-shlib-undefined to BUILD_LDFLAGS and drop other workarounds
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
X-List-Received-Date: Tue, 17 Apr 2018 20:52:34 -0000
Content-Type: text/plain; charset="UTF-8"

On 17 April 2018 at 17:44, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> We have a problem when for example, a glibc 2.27 based system builds some
> library like libpopt-native and puts it into sstate then it is reused
> on a pre glibc-2.27 system to build something which depends on popt like
> rpm-native. This results in an error like:
>
> recipe-sysroot-native/usr/lib/libpopt.so: undefined reference to `glob@GLIBC_2.27'

dbus-glib-native is failing on a few builders like this:

| /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm-lsb/build/build/tmp/work/x86_64-linux/dbus-glib-native/0.108-r0/build/dbus/.libs/lt-dbus-binding-tool:
/lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.25' not found
(required by /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm-lsb/build/build/tmp/work/x86_64-linux/dbus-glib-native/0.108-r0/recipe-sysroot-native/usr/lib/libexpat.so.1)

Using the host libc doesn't seem right surely?

Ross

