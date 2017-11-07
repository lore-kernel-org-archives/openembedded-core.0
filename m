Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 203ED6007A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Nov 2017 21:26:58 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id l22so539077wrc.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Nov 2017 13:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KfdOs1fRLqnlDZ0dWWvHQsSipwkpqRpd9j/bc36An/k=;
	b=B/DJNJOXpaaK9V+Ukrj71EX1OQ2k5n7uj8kiJogg7jYbnvyioE/BHbVa9kCR6qbm9X
	WvZm9A+dbInIwbZpzhH4HhZXmuRCOFoycKWQDZ7WKN3BqdV7dC+e10DH7l1+FDsh3qRF
	ouNwN0nQK5QPxlO+oisCDdACmFy66LF/4Q9Nwc8+xkqP+zEdztBVEUHNfyjGuBy9L1se
	0h0EROIFQ0yprb4m75A84fEU2f4Dmdms1qplaDxlqHYuISeawWWoqcaVVZZPeUfJOlZq
	JnQW3xxmG5U76FmQpe7OiaOS+pjX0RITetGNQ8hde/yUwyFlHANQSJdEEUxD1zUd5LIE
	UPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KfdOs1fRLqnlDZ0dWWvHQsSipwkpqRpd9j/bc36An/k=;
	b=sgbsUHkEvvxZNvOtwARfMZfYcU0OaJTBvo8fGLqhMRbVNxzvOxujfHI2ChY7dcl7Ci
	nQVpQa7qs84pIrYUndvPo0CkCTRvtKyoKthwXpfCAoYjmn2JivPXbAm3u76gXa6UmXQI
	dcK36hTgrDmm/oFPIFOYO+buSsecCXpl2GWE9YAnd5TGn7FLPzHNGCh07GdD4HMRmcEr
	9is8USMkY3rRnRuKP766I31IxKsqW2Lj3EzeDs6BlzugI801TLxddoj2s4nJwmgTkJTv
	PARQcjYN/ziLZVtEYNgnrt3bhCIrjYldALmg8dWsmkLgaWlEvKpQjSxy7Y5OCAc09TgM
	sWqQ==
X-Gm-Message-State: AJaThX6SyQo2iYfvdc/zFov4D401SzQMbAOsnKP9pS3xuRKGxT3yCK+y
	lmDW+BwAMvnNwlJolupbczylivoJwqo6HiIgGQ8=
X-Google-Smtp-Source: ABhQp+T8mJ8S3LW2ezK0j32n4OLAAnpB1s2kuXT+pw7RuXRzZCY7+BmBWz4iY8Noq2nAXksAxwP7qF9H4Wiu6tq9K2w=
X-Received: by 10.223.146.197 with SMTP id 63mr85123wrn.180.1510090019700;
	Tue, 07 Nov 2017 13:26:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.199.140 with HTTP; Tue, 7 Nov 2017 13:26:59 -0800 (PST)
In-Reply-To: <1509740960-11858-1-git-send-email-armccurdy@gmail.com>
References: <1509740960-11858-1-git-send-email-armccurdy@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 7 Nov 2017 13:26:59 -0800
Message-ID: <CAJ86T=XzAMk3NzE7sDauXEcu0Arbkcfjao_KPhE5c-5dcX2hsw@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Cc: Armin Kuster <akuster@mvista.com>
Subject: Re: [morty][PATCH] libevdev: add libcheck dependency
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
X-List-Received-Date: Tue, 07 Nov 2017 21:26:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 3, 2017 at 1:29 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> The libevdev configure script contains an unconditional check for
> libcheck. If libcheck is found, libevdev unit tests will be built.
>
> Without a dependency, the presence of libcheck in sysroot is non
> deterministic (in morty and earlier) and builds can fail if libcheck
> is available during do_configure but not during do_compile.
>
> (In pyro and later, the libcheck dependency is not required to make
> libevdev builds deterministic due to recipe specific sysroots).

Ping. CCing Armin.

> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/recipes-support/libevdev/libevdev_1.5.2.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-support/libevdev/libevdev_1.5.2.bb b/meta/recipes-support/libevdev/libevdev_1.5.2.bb
> index c76e1d7..381d252 100644
> --- a/meta/recipes-support/libevdev/libevdev_1.5.2.bb
> +++ b/meta/recipes-support/libevdev/libevdev_1.5.2.bb
> @@ -6,6 +6,8 @@ LICENSE = "MIT-X"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=75aae0d38feea6fda97ca381cb9132eb \
>                      file://libevdev/libevdev.h;endline=21;md5=7ff4f0b5113252c2f1a828e0bbad98d1"
>
> +DEPENDS = "libcheck"
> +
>  SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz"
>
>  SRC_URI[md5sum] = "96ad6edb5ce5c4428f1b183cc180ff8c"
> --
> 1.9.1
>

