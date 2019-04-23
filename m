Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id AB3507D013
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 15:52:51 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id k64so927040itb.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 08:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=+dTYCtK+Q+uTMwRs2wH+xFo6VZNC0EwD89FzkAaMCHo=;
	b=Hvkum9nRIqQa6Gn8My83TI17GlVt2xPnZyAIBNGr4YOeTTFxfPgjhX2Ahc8RrN3oGj
	VD8/SJRTqHvCQD72+EMh63PcjI+G/zd6nFsvlKDHIvRnr7+c0asb+NYG47ZZdN9tFOX4
	ZZ/ImDREw8SfH/unGXPkcrvpu4JoseYJOnpY2X2/yEdL0OACPBi7rSknaBRcArJ0/ftd
	vB5Cp/u8I7Q2E3ywydbBrwwQW1U2HElocFVrjWQ7JYF+ZW02pVu1lp3E5Sp63SHLLpju
	vWcZNM1b+t43nmKA3Km4VcOihE1kvz2OfZyb6mAdkfZ17XZ/D4hQitazohl6bKLyHJzY
	/1VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=+dTYCtK+Q+uTMwRs2wH+xFo6VZNC0EwD89FzkAaMCHo=;
	b=BZ7xRPwgliR0YRvgr0HYQx5p9nP2bit2UaNL+PFJfOxutjBYJ1r6cLSt6ptXBnHdtA
	ipCp4Di4nIHcGbTsNhb+S1tGDz5vAgt5HT9BiA/8mxD2zzfdLP7rSSHZvEYiw0aZoYjd
	WVQegKAOinfqPcLP1pn4iIRxI9qY+D+xqDR2eRZ8n93Jt0mXNWriGGO7PYdBEJMd2emQ
	q6pRu5y4BEqhF+itv/sYufU9m67BhMc0zKiFH+sw+yogICrOj4aBhdNJAt97wUk9FZo+
	WCcP5U5iH+BVaPe4mvn9sdgFGnei6OyEfsJKz4kyv20iDiZCWcNlDdSwI72EITTMU54K
	NMTQ==
X-Gm-Message-State: APjAAAWQ6x0Pp4NC4yeJasTuDn59csuCE9HocoKhR0xgNT/e09VGmnut
	3argCXSFe711BkWxC9qkabAb7lPG4efXu4woU12ItQ==
X-Google-Smtp-Source: APXvYqylCTd9Cd5JUjBCHfS4aquny5t3imdO74fbzdAWq+bCTPjaMkuR6SXfgjH52t8yI/lwgrFgCBCdh6NEtsI8094=
X-Received: by 2002:a05:660c:111:: with SMTP id
	w17mr2500096itj.62.1556034773007; 
	Tue, 23 Apr 2019 08:52:53 -0700 (PDT)
MIME-Version: 1.0
References: <1555664043-329543-1-git-send-email-mingli.yu@windriver.com>
In-Reply-To: <1555664043-329543-1-git-send-email-mingli.yu@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Apr 2019 16:52:42 +0100
Message-ID: <CAJTo0LYQeSCoShBRc5SJ9C1+qyFAgxYn7uVYAshFrFGGQAos=Q@mail.gmail.com>
To: Mingli Yu <mingli.yu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glib-2.0: fix ptest failures
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
X-List-Received-Date: Tue, 23 Apr 2019 15:52:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 19 Apr 2019 at 09:54, <mingli.yu@windriver.com> wrote:
> From: Mingli Yu <Mingli.Yu@windriver.com>
>
> * Set G_TEST_BUILDDIR to mark we run the tests
>   out of builddir to make it can skip the test_non_utf8_printf
>   to fix below test error as test_non_utf8_printf needed
>   to run under builddir per https://gitlab.gnome.org/GNOME/glib/blob/mast=
er/glib/tests/gdatetime.c#L1440.
>   | GLib:ERROR:../glib-2.58.3/glib/tests/gdatetime.c:1477:test_non_utf8_p=
rintf: assertion failed (__p =3D=3D ("10\346\234\210")): ("Oct" =3D=3D "10\=
346\234\210")
>   | Bail out! GLib:ERROR:../glib-2.58.3/glib/tests/gdatetime.c:1477:test_=
non_utf8_printf: assertion failed (__p =3D=3D ("10\346\234\210")): ("Oct" =
=3D=3D "10\346\234\210")
>   | FAIL: glib/gdatetime.test (Child process killed by signal 6)

As per the link:

/* If running uninstalled (G_TEST_BUILDDIR is set), skip this test, since w=
e
   * need the translations to be installed. We can=E2=80=99t mess around wi=
th
   * bindtextdomain() here, as the compiled .gmo files in po/ are not in th=
e
   * right installed directory hierarchy to be successfully loaded by
gettext. */

Setting G_TEST_BUILDDIR isn't right as we're not running uninstalled.
This is a gross hack, and not a fix.

Ross

