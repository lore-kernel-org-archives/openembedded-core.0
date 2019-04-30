Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1908A7C410
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 13:56:34 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id g24so7371741otq.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 06:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=B4dGPten57oq5VBWi3uQasQtwZ6Sceg/cB2wU0/yNVY=;
	b=rfDdsN+TkyibadMiwNDIca2Z9qMCXMmQGMSvvIXoeADhfe0ODdWSmEEnrwallwXokW
	tJzxS9f8061z692YmYtZZKHiJJoxuj8dHoMj5xizgBPAORZ8lLhiG/GvzqC5nZzVIO66
	O2Gnt/UR2pXoD87w96vvqE5fI/kGyOF/g27wEzy5ljLeoqI51EVSkuSUnInr3H+a+/0d
	dYzd1jbLB/k3RL2DSkvRB9Eiqaj8lB3zhV/HDnOILorsqVDbnRZBS0Y5HvEj0sDqM+AE
	B7Hy+awPmUe4EQKIdeZ2jIDxArOxIep2sNBFIkvBNGUzn7Uru2R7CxZwfQeH6uFC7J3j
	dsIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=B4dGPten57oq5VBWi3uQasQtwZ6Sceg/cB2wU0/yNVY=;
	b=DZaBqeSECqS/MylGZxJ82lfDWhp8wpSERjdrwLJtegaC5G00cGwsbBMfkzhFA8pM6Q
	QvPvCc3cGhvvI11jWpU5lezZPMQC9gV/klyfJIWRh5Ogl9Rtjq9tU6sWsDgh+qRtZf8A
	rQkewl9k81J4UIhfpullEvO5QfuYuPeWtBaIFbnE7U4V1MY+anndHG1kj818t+pnk+sM
	YIZIvD+kDFIMvUMYPmsW+QMsxZVsHyo9cNX3TTxCmpsn3+P0gmVe2ka539+rB6M+7BF+
	NY81FD4KdfrGLUbGl5/j/AqKo0ToE2TW5VCU4gwyDNez09ZooexnIzYD4Sf8Fyaqd+8x
	bgbg==
X-Gm-Message-State: APjAAAW2CxGk096YEH7S94ALqCuz5Wbd+04atjBXAWb4cjMjfakpERkO
	GX0Pn3PJGrgBDNzmuuYiRr0ykVm9O9qw89eX2x8=
X-Google-Smtp-Source: APXvYqw2Z6bQTwO/Gqg6fRcKgraOgBSZZuvwCjH1MjAwW5O0a+cmti0h0Ld47wNoA2t4LHPZhehgvQ3T467jmasljnE=
X-Received: by 2002:a05:6830:1647:: with SMTP id
	h7mr7584372otr.360.1556632594312; 
	Tue, 30 Apr 2019 06:56:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190430115323.25661-1-m.felsch@pengutronix.de>
	<20190430115323.25661-2-m.felsch@pengutronix.de>
In-Reply-To: <20190430115323.25661-2-m.felsch@pengutronix.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 30 Apr 2019 15:56:23 +0200
Message-ID: <CANNYZj_OAjN7M34TbktARfHm-n5vhFoc6C5f9KYRt2H6e1mYNg@mail.gmail.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] mesa: make gallium swrast target optional
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
X-List-Received-Date: Tue, 30 Apr 2019 13:56:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 30 Apr 2019 at 14:10, Marco Felsch <m.felsch@pengutronix.de> wrote:
> -GALLIUMDRIVERS = "swrast"
> +GALLIUMDRIVERS = ""
> +GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'swrast', ',swrast', '', d)}"
>  GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
>  GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'kmsro', ',kmsro', '', d)}"

This adds a leading , to the list of drivers; is that correctly handled?

Alex

