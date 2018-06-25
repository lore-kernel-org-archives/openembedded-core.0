Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot0-f193.google.com (mail-ot0-f193.google.com
	[74.125.82.193])
	by mail.openembedded.org (Postfix) with ESMTP id 936E0746B2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 13:25:08 +0000 (UTC)
Received: by mail-ot0-f193.google.com with SMTP id i17-v6so4148983otl.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 06:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lA5kgTjMZj3GxzuqCebq/NgNdVUh1PlOF4aRf7uiiwE=;
	b=K6Dh8JXwkdsOZOW4xi+1RFTyFS/PaQZBVORAiG9j3TYZJLxwyOS35Y3yOOHKGDoGa4
	+j6JOlbW5R0/n5dq337BINyaV+uH5ja7AwkBij3QFD0WhegCA8D9r1ey82R5DFhtuqyp
	kPVXn44k5bQVlYwVG7TGR/cK12ZVIAHtA5qN55Bcw83cl5+h6xk4ZI04HRH2/7tA+vog
	M/IvTVuOa+oZrYy+On2DaEoBx9hAf2gC57DZhZeYtHnm0PzFRxCDZmn6D0xH0S0cUc0B
	j6jatuM+6Va9pEju1m1AVsZVA/vdFtx+1s85hW00OcpIjkVQH+uNxfDCY6uv7JjB00SN
	sHZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lA5kgTjMZj3GxzuqCebq/NgNdVUh1PlOF4aRf7uiiwE=;
	b=WRPiAgg/cxgP0ogt14EupeddajG/I5S3lpUQJ8RUOjjBKoAvRBPC6ohgZQ3XxZRr1F
	6LXKAefph9G9uvZzuiWcHOFa1C3wKn/f6dTyLOT3RhujGLaCQrJo0ehe62AUQBajzHe9
	qts2G/zwKmsqqMEu8rWUOHGu4qTMwLW7llcnyNFWi2RaYdfcHrftx+gEya77zPcL74K2
	HWsWDIP/oqUMKnixbXQ1Yv0lpgBxv4SIRdZSH1LoEiXtvGAwyX13O9anlwnuSfJTlduI
	QTt6oNj5NAV9zUpErHKbxkfkrSOuf9rwqKo2ExsWY99RH0Fqn4441Zgnql6akasymqYR
	y6vQ==
X-Gm-Message-State: APt69E3GAhT7Y2ol2sDZFzkwBnZGU2UAnF1hfjBHuz06+Tbf6r8qSjLH
	BDuc0TJHd2tDDpFpHcpcLz6hg5PesQd36oBpDeA=
X-Google-Smtp-Source: AAOMgpcpfaxQW/T8FzLTMuE7esACzN7Q3WQDMNBskKmy4jAttWhzTjw2nXt5j+unVSJuP+luqAiKeSvSS0oVN3s8Zgs=
X-Received: by 2002:a9d:4115:: with SMTP id o21-v6mr43024ote.259.1529933109701;
	Mon, 25 Jun 2018 06:25:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90c5:0:0:0:0:0 with HTTP; Mon, 25 Jun 2018 06:25:09
	-0700 (PDT)
In-Reply-To: <20180625092738.17962-1-olofjn@axis.com>
References: <20180625092738.17962-1-olofjn@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 25 Jun 2018 15:25:09 +0200
Message-ID: <CANNYZj_kMAYH6=EcXM4ACwZhUp3qzzZdv9k6nev-v2oitWO6SQ@mail.gmail.com>
To: Olof Johansson <olof.johansson@axis.com>
Cc: Olof Johansson <olofjn@axis.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpm: Avoid leaking temporary scriplet files
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
X-List-Received-Date: Mon, 25 Jun 2018 13:25:08 -0000
Content-Type: text/plain; charset="UTF-8"

2018-06-25 11:27 GMT+02:00 Olof Johansson <olof.johansson@axis.com>:
> RPM writes each package scriptlet (post-/preinstall) to /var/tmp/rpm-tmp.XXXXXX
>  --- a lot of files get created. When debugging is enabled, these temporary
> scriptlet files aren't cleaned up at all and after a while this results in the
> filesystem resources are eaten up (like running out of available inodes).
>
> This is a quick fix to avoid this. It does degrade functionality for
> those working with debugging pre-/postintall scripts.

It's better to clean them up in meta/lib/oe/rootfs.py, instead of
forever carrying a custom patch to rpm.

Alex

