Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9DE676004D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jan 2019 12:07:05 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id i20so26536995otl.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jan 2019 04:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=X0c7Fm4pRFh52cryJqtPVB4EqTLLpJDxcZFYKYxhRqI=;
	b=EOhZqparBiJ8RfsaUFMnnX0BwkM4WzjvS/ZGo2ygMUWaTBa0PMnxVNMQE13XfUWkTs
	SQU98L7lruwnNwzfqD8fr8pDdvScYFGmMmZ6rFjnXzabpSmTpnmG9YGaRYL9FEZb97gf
	ZUHFVN8Ij2M/Uf7lYDguzn+0zuOrqOBh3/YEryVXRJaOmng4AkCcctfMIGkoIAqf3f4b
	1H62lcKYFQkptYdCLXi5BTtVK3a/zR+CIsLoVcGI44q/L6PZ8JG1oLn9n7YjTeg+ZhRg
	CVov9FG5AIF68m8YZJaiJ+3P07xxzkZdPH7F6dYAJSBtRaw/l0s2rFH++qR2SQO7KFxz
	ucxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=X0c7Fm4pRFh52cryJqtPVB4EqTLLpJDxcZFYKYxhRqI=;
	b=YyNwBCyrXe9TgvK5mLqF755WC9N1QBq8mdzyLh4MN6XhkIRE5S+Xu/VDVaZghtla5m
	/nDIJ4q0Nd3ZM//QLipFodbV6+GpJTqftNGd9wYJZTEB2PK4yz2kYQ0kQrUrpkcH6E49
	GHYgB78Q71ntq6TZFhdm9irJSksGO0fN5TjQwRmi+xgVUDJSrfuhsJCpSIEvEd+rfSro
	0BoocGDkPA63ObGRVV34PDcFlaFtZ3Q+A/xHfsZC6Dh+zTtrFxY+IJw66iGO8Uvr8fof
	6qyxKBWrULOBJG96fUDzaFNp4W4kA7TzJZJutz3MKVLQ/3V2wSYfxFbTMO3NDGx0Z8j8
	Y4SQ==
X-Gm-Message-State: AJcUukdlUyBvhBoYAhGewmBOuzE34Lq3guwSHcjgMH/WpWyMJn80WsQP
	V1pUvI9WTAN4r+++Pfw4BboQBEgMUu/FFNThgDu0sg==
X-Google-Smtp-Source: ALg8bN7AQkP4RWqQJhJZGtfpZl/iRx8I2illchNdtnkG7owzQh/+OategH5P3KGy4FAqdmII8bOlpIyur8fSceKoz9o=
X-Received: by 2002:a9d:c06:: with SMTP id 6mr31580009otr.326.1546430826500;
	Wed, 02 Jan 2019 04:07:06 -0800 (PST)
MIME-Version: 1.0
References: <20181231120559.25470-1-jonas@norrbonn.se>
	<20181231120559.25470-8-jonas@norrbonn.se>
In-Reply-To: <20181231120559.25470-8-jonas@norrbonn.se>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 2 Jan 2019 13:06:55 +0100
Message-ID: <CANNYZj8+prvjmkR2-tkh9CK8zuZ+BQWftgSpkGUgw8rRChkUZw@mail.gmail.com>
To: Jonas Bonn <jonas@norrbonn.se>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/7] systemd: do not pre-enable services, rely on presets
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
X-List-Received-Date: Wed, 02 Jan 2019 12:07:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 Dec 2018 at 13:07, Jonas Bonn <jonas@norrbonn.se> wrote:
> diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
> index 70e687c92e..7b4c5c56aa 100644
> --- a/meta/recipes-core/systemd/systemd_239.bb
> +++ b/meta/recipes-core/systemd/systemd_239.bb
> @@ -298,6 +298,8 @@ do_install() {
>         # duplicate udevadm for postinst script
>         install -d ${D}${libexecdir}
>         ln ${D}${base_bindir}/udevadm ${D}${libexecdir}/${MLPREFIX}udevadm
> +
> +       rm -rf ${D}${sysconfdir}/systemd/system
>  }

Apologies, but this is a hack. You need to tell systemd to not install
the files in the first place, if they are unneeded, instead of
removing them after the fact, which is a maintainability issue
(specifically, anyone looking at the recipe would be totally puzzled
by this removal).

If systemd always installs the files, you should add a configure
option, and send the patch upstream *first*.

Alex

