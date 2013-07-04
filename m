Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f174.google.com (mail-ve0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id 16924607F8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 16:19:49 +0000 (UTC)
Received: by mail-ve0-f174.google.com with SMTP id oz10so1153035veb.33
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2013 09:19:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=qiF8MdlnoV+SAZ6N7YfoRt33cBlIRrhMJhrdHBqnQ4I=;
	b=B/dU0bpO7gVHYcSF3jmAgPnv+moPCbrxB+0ig9YOhEQQb2c42xuf11NE5jZ9Wr7U6J
	hwuDrTfKXU2PYQYNkNCI6oM1dpt5aAsCjlLJhT/MMOC4MgyQEKHgo84B34I0dNIh1w9x
	mFTb//5knBu3ET5NgexxRuBhz5NRzLKONbWl4k7bMfTyq7aAkE6Zjc0XsO8mG2BTO2pD
	vOhIZ00C/1XFt5bzT0Y5+0f1MczA85ivTXkn873ICBR5HDlYC1xK/xOZWopzBqQ/+DU2
	NPFRDjBoaT+fuFOUYBfkjxn3zns5SDIWAfZGy4rXmNiEfJ2qTbNRq6fNt6UhuLkbSMTD
	v9QA==
X-Received: by 10.220.58.195 with SMTP id i3mr3633913vch.38.1372954789644;
	Thu, 04 Jul 2013 09:19:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Thu, 4 Jul 2013 09:19:29 -0700 (PDT)
In-Reply-To: <7f29d9fb091f4cdf71626dfdf5bec69579096a67.1372950678.git.radu.moisan@intel.com>
References: <cover.1372950678.git.radu.moisan@intel.com>
	<7f29d9fb091f4cdf71626dfdf5bec69579096a67.1372950678.git.radu.moisan@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 4 Jul 2013 17:19:29 +0100
Message-ID: <CAJTo0LbPFKsKUJfaVOK5K=1wEfeNYEK4Uxh5DTMDdPqc6xg2Bw@mail.gmail.com>
To: Radu Moisan <radu.moisan@intel.com>
X-Gm-Message-State: ALoCoQn70dvjMc3dR/FOTDzNRd28BHTjRHwpyd/NKQchNbsr6xeJ2dA3pt+4bGVJYVUMin02KKRH
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 04/10] rxvt-unicode: Upgrade to v9.18
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
X-List-Received-Date: Thu, 04 Jul 2013 16:19:49 -0000
Content-Type: text/plain; charset=UTF-8

On 4 July 2013 16:13, Radu Moisan <radu.moisan@intel.com> wrote:
>  do_configure_prepend () {
> -       cp aclocal.m4 acinclude.m4
> +       cp ${S}/aclocal.m4 ${S}/acinclude.m4
>  }

That's the right fix.  The rationale for this pattern is that
aclocal.m4 is a generated file, created by the aclocal binary, which
contains all of the macros used by rxvt from /usr/share/aclocal (i.e.
the X macros).  Thus, it will be destroyed at configure time.
acinclude.m4 is for local macros and is a source file.

Typically you see this pattern in packages which ship a non-pristine
aclocal.m4, so when we re-generate it macros are lost.  That normally
means that the package won't build though.

Ross

