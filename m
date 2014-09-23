Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 4208F609BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 11:36:35 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id z107so4252867qgd.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 04:36:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=+lLv/ZI5aCXVDt7jnQ3hjQ6cOJHGOygK18hKDOwQOOQ=;
	b=MPI7SopxswF8vTZtLZyH0D9cy6+PrAj+TEiUad0968jENnUBHmiOZmI6oYR28gr9xd
	ZYzvECBTQGXfS2NgavjYfSXo2OETdOIjN2Mopv/vmzRvww2Jj5Kt35e+mUoqbkOiAeuF
	CFdX+1nxA8SgSMBW6eR2Bx4h2RXmry9NAiVHnMRrSBGZZbGKuwHjD7Qrb59/MQISKHrv
	yNR6U8FYCGMGgi0ZmbrTI2yrt4yTgI2G6Lt2ukNXPntmNvEfwjDAqbEVHP6whVNGMtKY
	xZriyYHHEarOU7BPmPt2xq4oijxbFWUy+CNQdd+rLTGbtbYJX1lKOXEt2bmyrLcraGzo
	PjyQ==
X-Gm-Message-State: ALoCoQlWZOG6snAgm3E7tNTdh/AxK9PteH+RCNz9fVOurNl1SDXrSMGCYxpeqsuEIiXE76aPwA8D
X-Received: by 10.224.103.65 with SMTP id j1mr31132806qao.17.1411472196808;
	Tue, 23 Sep 2014 04:36:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Tue, 23 Sep 2014 04:36:16 -0700 (PDT)
In-Reply-To: <fef1ff5442c6c1f0d4f7f8f600c996b2d0685fa9.1411446614.git.liezhi.yang@windriver.com>
References: <cover.1411446614.git.liezhi.yang@windriver.com>
	<fef1ff5442c6c1f0d4f7f8f600c996b2d0685fa9.1411446614.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Sep 2014 12:36:16 +0100
Message-ID: <CAJTo0LZxEZJ-myh8hW6dkXNG2ta-GTSPqRjEwBDnHtd656JAQw@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] ncurses: enable-pc-files requires PKG_CONFIG_LIBDIR existed
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
X-List-Received-Date: Tue, 23 Sep 2014 11:36:41 -0000
Content-Type: text/plain; charset=UTF-8

On 23 September 2014 05:31, Robert Yang <liezhi.yang@windriver.com> wrote:
> The configure.in checks:
> [snip]
> if test -n "$PKG_CONFIG_LIBDIR" && test -d "$PKG_CONFIG_LIBDIR" ; then
> [snip]
>
> Create PKG_CONFIG_LIBDIR in do_configure will fix the problem.
>
> We can reproduce the problem by:
> Set SSTATE_DIR=/path/to/sstate-cache
> 1) In build1, make sure everything is ready in SSTATE_DIR
> $ bitbake ncurses
> 2) In build2, rebuild ncurses only:
> $ bitbake ncurses -ccleansstate && bitbake ncurses

With this fixed I expect you can remove what looks like a bad
assignment of PKG_CONFIG_LIBDIR in _install_cfgs.  Also note that it's
currently detecting the wrong path at configure time and the
install_cfgs assignment is forcing the right path.

Ross

