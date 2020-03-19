Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id B18D160B47
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2020 17:12:59 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id g62so3245413wme.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2020 10:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=UY0dysY7GUMURCFuLyE4nfF8PaCnLxBnvxJhuvjT8IE=;
	b=Yf1IVb9TiU6e2iCSOD/n1h8llJgFsmb5X71CufQs85jYY3r/V1dBE6+Daop4TXk2TD
	ZcDcXb/AUJrtfBjSj/QlJd6mCWwVzfgnOwCdcQ0D0b7MA/VoPIk6CWyFydrpZq/PZjaf
	V7mgaT9JG9kWff6ZSQQJaT3cVC3ZKE0t46Dq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=UY0dysY7GUMURCFuLyE4nfF8PaCnLxBnvxJhuvjT8IE=;
	b=eM8vQVHA0iJS20uXUsDtOVHNJ03KpAFGFLe5iGss779bimueinKBsvY45DXh6NZMOi
	g+P+L2gXzvsINSK6RtglStXtOj7hfcdh242beBlgWe9XA3ThkoX+LC9PK59+tJM1s1eT
	FmD/6SQQiRaNV765k6ftfyKdsHwhwVuWEBweLy6sAu3tn/K5vhk9lVlfbwYQ/gg0DbCR
	FnnjAPxPPTXVt7CnHA2pK4rObyDpwVRFDt2POpznKGLfLx5Dtosq9XOABAFSfcdMliZF
	o5+ZJPbIOHgrF737Wkz6cB0zwKNJYiNqxnE7Hq4BRwX/02kPLVrH9Nb6Tsshwr6U/4o4
	mlIw==
X-Gm-Message-State: ANhLgQ39ktRetTXKWQRRbo+dOotTqCpL7y1GUOYXRe3Bt6DhVNTTreS7
	BJ6EOrLDa5DNceHdjBT0dJG1Sw==
X-Google-Smtp-Source: ADFU+vuKoA7+v+BP9i1FfEiRpV5SN3PRlZkNKGCKbUybMW0QEil1OqtB3rW443c4dxWHG6Rwds5CYA==
X-Received: by 2002:a1c:7405:: with SMTP id p5mr5089392wmc.73.1584637980235;
	Thu, 19 Mar 2020 10:13:00 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id k84sm4056790wmk.2.2020.03.19.10.12.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Mar 2020 10:12:59 -0700 (PDT)
Message-ID: <21fcbda1e8b274ba75534159179ca9535c618d68.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Khem Raj <raj.khem@gmail.com>, 
	Armin Kuster <akuster808@gmail.com>, Jerome Neanne <jneanne@baylibre.com>, 
	Quentin Schulz <quentin.schulz@streamunlimited.com>
Date: Thu, 19 Mar 2020 17:12:57 +0000
In-Reply-To: <20200319164403.29605-1-brgl@bgdev.pl>
References: <20200319164403.29605-1-brgl@bgdev.pl>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 0/2] image.bbclass: support two-stage deployment of image artifacts
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
X-List-Received-Date: Thu, 19 Mar 2020 17:13:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-03-19 at 17:44 +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> This is a follow-up to the discussion I started on the OE-core
> mailing
> list a couple days ago[1]. These patches propose to split the
> deployment
> of image artifacts into two stages where the first one includes all
> "regular" images and takes place before do_image_complete and the
> second
> is mostly aimed at wic right now and happens after do_image_complete.
> 
> These patches work but I'm sending them as RFC mostly to continue the
> discussion about possible solutions for the circular dependencies
> between
> the rootfs and initramfs.
> 
> [1] 
> http://lists.openembedded.org/pipermail/openembedded-core/2020-March/294094.html

This works fine until we have some new image type which then has to
depend on happening after wic. We then add a three stage process and so
on. Basically this feels like we're hardcoding something for one
specific use case which will later break and not scale to other
problems/solutions.

Sorry, I'm not convinced this is the right way to move forward. I will
try and have a think about what the right way is but sadly I don't get
much time to spend on specific problems like this :(

Cheers,

Richard


