Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f48.google.com (mail-vk0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id 9EB7B6025E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 00:26:47 +0000 (UTC)
Received: by mail-vk0-f48.google.com with SMTP id t8so52415933vke.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Feb 2017 16:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=ULu3lEjDtQx0TObSUMyZTU4kEfELe3rnVgQKpsBfOUI=;
	b=JM28WI0HUxWWJ89I9mw5+PE5y33ZQOCZ6A9ZIPlyZhl3u1JYIg7nE1TCOLsT9gprsi
	leZs72n/nQDXAPbqxM8Wmi2XVqDjoDpvCa6gVTnlZC9Mo1fiWh14FMlR/iNxUXRiSKIo
	ANJAmLTuq6MuDN9svm8GgxOgCWo2mBzXfAu+hp8X6q6fSRyx1LfHBV16NHL5T46ln3Gu
	sSUHRxh8qm+y42mA8DZU/sWcoYlT0D/rUuRPyfSQnPNRAD4TdGzXa9e13lBcKEn1vbbx
	h1D9OcMqFmBWYbKUrytaqDC1yXZUDBtreLF2WIqTNa/KTPOtHmQc8Otc4MnG2zZRhAFR
	wjaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=ULu3lEjDtQx0TObSUMyZTU4kEfELe3rnVgQKpsBfOUI=;
	b=mpqrwgMMF5u34W7JKwfVvYqZVGxHp+jwz25ezjyNQhFQbfCLyQ01B6D9EVGCMRzmvZ
	uMeHvZUhjNB8wM2vAPzNxss+tXGX5IooWSCM2P3YSZbg1T3zw2RnR9Aw8ZqfqI8fq5ag
	wYXeJFHD26qs7K8p1WPcBs7sJozuZBfAyR1ervWUZJYrhvDB4uDg5+W3DXAKzaemt2xM
	b+0R2o9b85kSaRKU//ufbnOo0gGKyDXlsNpsg/iSv0NWsu9azAF3VUgqIpzP17nS+Y3m
	g9Ag9avcDPrI903sCpeWl90d2KBVEcrzKBGbLoDP7rK2farI1mLWwKCmM03dNwMyvogf
	AE4g==
X-Gm-Message-State: AMke39nKfppKzpcTC5FnvU0BXdLb/F6ueUb1CJhGmyGEQqBSOp/MnAVZIS66foGzsD6LQVl8aTEAtrDIvJacpg==
X-Received: by 10.31.41.73 with SMTP id p70mr9761307vkp.68.1486945607214; Sun,
	12 Feb 2017 16:26:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.91.68 with HTTP; Sun, 12 Feb 2017 16:26:46 -0800 (PST)
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Mon, 13 Feb 2017 01:26:46 +0100
Message-ID: <CALbNGRSgxbz1F2YLzQ-F2Fn+01hiA4LAoDgQuQ-qLg9KMVTHAw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Does recipe specific sysrooot (or whatelse in current oe) break native dependencies?
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
X-List-Received-Date: Mon, 13 Feb 2017 00:26:47 -0000
Content-Type: text/plain; charset=UTF-8

Hi

I try to get meta-qt5-extra fit for latest oe-core (RSS). One thing
that causes my attention is that many recipes's configure can be fixed
by adding gettext-native. This seems odd to me because all of these
recipes depend upon kdoctools which depends on gettext-native.
For instance for kconfigwidgets depending on kdoctools:

* in kdoctool'sworkdir/recipe-sysroot-native/usr/bin there is a gettext binary
* but in kconfigwidgets'sworkdir/recipe-sysroot-native/usr/bin there
isn't a gettext binary

Is it possible that recipe specific sysroot broke native dependency chain?

One note which might be important for this issue: In meta-qt5-extra I
chose a the following design decision: If there is a pair of
native/cross recipes
* each cross recipe depends on native recipe
* all other recipes depend on cross recipes

This reduced maintenance efforts (I don't have to care if a recipe
depends on cross libs or native executables) and avoids race trouble
with cmake's toolchain path sequence 1. cross 2. native

So what goes wrong here - or where am I mistaken?

Andreas

