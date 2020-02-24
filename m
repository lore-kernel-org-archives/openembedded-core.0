Return-Path: <alex.kiernan@gmail.com>
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
	[209.85.166.176])
	by mail.openembedded.org (Postfix) with ESMTP id 57B5761617
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 19:14:25 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id g12so8681678ild.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 11:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7iYw5evqrfbi85Ko2FgLlWnl13Vry2vacRRLYGXAD6w=;
	b=iycSqV5KyGE0m1Ko6zLN0sFg6eGE6Jc1GOBZUaKBbnV1Rrr2KmC1YSBLcMn4y3SayJ
	a0LUQGlg1GgU0YhvEbUZBAzT8Q96YXof3gY2T0hh7B5KqnWJj4t6XkMYrwq+AEdcCPDJ
	0/5eputU1P7T0qslpiDDJ14XwPSlbRm7nkJ/ziqK9UbeQR/iyolVe9m0Nwan32wkcqjq
	X9qbgp1z8BGSLGQlJakqtTmB0Yh9sa49PlQLaHcdesJBf+pCR/D7z3bPRR6o9IrLUFSz
	I6J1G0my2n9i1vgXjHjypM3bsiNiSsA+A4zlRrfdL4urr9jnowZ75InajbsDFIukbBN/
	P6ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7iYw5evqrfbi85Ko2FgLlWnl13Vry2vacRRLYGXAD6w=;
	b=Tb8UURTnWYz6LXJKbU0grTRQwQUpVH1bWFIDDv1qTIcSkFvJv2IC1/d4eobSg6Fzzc
	ZwXuKjtjwtKmLXPbIh0Tuwn488qTnB0Mt2Pxe6pOEwPzZzmjPr+cn044p95UGLjeqL0y
	ZvMlduIvyTBaA9TyvATejUj37rNft7KicCW6zpBuJ8k8WsFPqXa3KbFZuZck1J6SuVx9
	Yq44O3Dhan3chOrw2qbIPwW+Y3jgHgE2Mlp9+aFIizxcAdMcgNAiVWc6elXKan0Kkoyr
	tzAquDkVQqfVKMti8Uy7Vl9zmk0g01aOV+kNZH/faaRmbtgRi1vGD+6gG4zYIjn07owq
	UdJg==
X-Gm-Message-State: APjAAAWDCHuaLaNP1bIq25J/wo/VZdtvVqZiNSzkNxigx7uNmy0+Qqjg
	8GhFERckUL4RvtE/MPzDv92heI/WrC7rwkfjoqepUOZ9
X-Google-Smtp-Source: APXvYqyV/A/R4zKRnjxsQaUm7Yn9ML2HFMLhbx9w8iJNP/6LTrgxiy0YPM/pta1uXojpFUx4hWFVwDMXz8mlpCHMTWY=
X-Received: by 2002:a92:5c8f:: with SMTP id d15mr21171047ilg.102.1582571665733;
	Mon, 24 Feb 2020 11:14:25 -0800 (PST)
MIME-Version: 1.0
References: <alpine.LFD.2.21.2002241402001.5567@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.21.2002241402001.5567@localhost.localdomain>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 24 Feb 2020 19:14:15 +0000
Message-ID: <CAO5Uq5RHxyNcEJ0kUx-A6VdSGd3Cn5dmVprWb_yz0oiFz4vVAQ@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: why would systemd-systemctl-native need underlying sysvinit?
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
X-List-Received-Date: Mon, 24 Feb 2020 19:14:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 24, 2020 at 7:06 PM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>
>   in midst of migrating old YP layer to newer one and running across
> all sorts of oddities. in this case, in current master branch of
> oe-core, we have:
>
> recipes-bsp/keymaps/keymaps_1.0.bb:PACKAGE_WRITE_DEPS_append = "
> ${@bb.utils.contains('DISTRO_FEATURES','systemd sysvinit','systemd-systemctl-native','',d)}"
>

commit ee3ac7c64ed4c96062e7d21eed1355d4b60b78c4
Author: Jonas Bonn <jonas@norrbonn.se>
Date:   Tue Jan 29 08:24:42 2019 +0100

    keymaps: tighten package write dependency

    The dependency on systemd-systemctl-native is only needed if _both_
    systemd and sysvinit are in play.

    (From OE-Core rev: 3ea08f4b24f8a49c3d5039b62b39d6419cfe234c)

    Signed-off-by: Jonas Bonn <jonas@norrbonn.se>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

which is then obvious once you read the source:

pkg_postinst_${PN} () {
        if ${@bb.utils.contains('DISTRO_FEATURES','systemd
sysvinit','true','false',d)}; then
                if [ -n "$D" ]; then
                        OPTS="--root=$D"
                fi
                systemctl $OPTS mask keymap.service
        fi
}

And then the commit which added that makes it even clearer:

commit c57427b4a7991e33b806d4fd0956b6010ed52f62
Author: Chen Qi <Qi.Chen@windriver.com>
Date:   Wed Sep 3 15:09:17 2014 +0800

    keymaps: mask keymap when necessary

    When 'sysvinit' and 'systemd' are both in DISTRO_FEATURES, we need
    to prevent the init script from running via systemd.
    This is because that the functionality of the init script has implemented
    in systemd internally.

    (From OE-Core rev: 8cfba07e24dae3d1837ccb5cb04e11f362519b0a)

    Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>


I'd guess the others are similar.

-- 
Alex Kiernan

