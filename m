Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 08FB27DE54
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 16:44:15 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id q132so6077281itc.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 09:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xZeWgVmZ4/fOW6lB1J0SPvi5ayt7psDJjSF2S0zhEKU=;
	b=Q5SY+YOgo4gyiEIrtGGViheM8K4yMUGoWUClZ8+BoY+r0AdszLHb2uCi6p9cEwJv7J
	ssJ85WBuDj6YbgH3v4Cz34yVvjpPR+db4nIUck5QUQpFVHxkq4QTsakyXp42FhnsdqfU
	sOOGdbO0KVy9z28JICf8Dd1s1JIjQyplDXEqXCRWtlgTr7KC1/FGFzsXB19QETK1A15c
	+KkpbMPh9vjh7MVauM/zdbHGPbcuat7a3AginSLHgUUuYl/KIjcz4CtjW5zqI/KCJKro
	jtNd6Ae1dELNTERN5f6CScwa/4fqMOjJc8go+DeKMmxnZzx2RLZvA/1hjvNnULBDuUcJ
	GtcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xZeWgVmZ4/fOW6lB1J0SPvi5ayt7psDJjSF2S0zhEKU=;
	b=ou0sAUrbAWQMokPziHTI0XnBaMQWpqI2HZuXnl+6+rYC7V7fQc7HBD61+rNjFgBp8Y
	4uGJQ5LPXM15fAecZaTUhVLwJVbQ+X4lQ2RKMwqJ8Sp8jCuIQFVTJXqeyK688rtPoVaK
	7LYAdNfFmlYqQjcyHHS8lRZ4q063GEgNrjwD39S3ZCLd6vxYKKhJ9uw8IEofLl9T365G
	3htyGlm23XHJzIwKVyWdgJBBNyY6peQLqaQL0+6qI1m1GlQNKJ67S9FuUyqTRJaIFzr/
	e8TF3Qu9myvXmXitnPAWF3qGnPBFlSlY+OtdyJ6pZ+2qOnBxjcOMTIMXr03RCnIm0Bxm
	L9rg==
X-Gm-Message-State: APjAAAUKHc9W/I/EpAbIpUS5rY1w8bcQb1V6nkfQSeI+2ODXIZgrDldd
	UMZCEWPm35lzBaxvDU/PgxaHukuAROYISD2IKHVmCg==
X-Google-Smtp-Source: APXvYqyFl6F2Z9YRBs5EL8ptOcosXDrxrsHdzuYWs8jVrxbjTGmlxoL20wNjqN29n5jpzT0XrOUa8qaXHpZ+7PGG9Ms=
X-Received: by 2002:a24:4145:: with SMTP id x66mr4585386ita.130.1557852257025; 
	Tue, 14 May 2019 09:44:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190514035716.27376-1-Randy.MacLeod@windriver.com>
	<20190514035716.27376-2-Randy.MacLeod@windriver.com>
In-Reply-To: <20190514035716.27376-2-Randy.MacLeod@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 14 May 2019 09:44:05 -0700
Message-ID: <CAJTo0LZ1Lf_eyr9ERBntSKhkAuifcE99o3=uO8Lgji30WsGxJg@mail.gmail.com>
To: Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] valgrind: do not strip the package or ptests
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
X-List-Received-Date: Tue, 14 May 2019 16:44:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 May 2019 at 20:57, Randy MacLeod <Randy.MacLeod@windriver.com> wrote:
> About half the ptests will fail if the executables deployed
> as part of the ptest package are stripped. Currently
> there is no easy way to only strip the main valgrind
> package so leave it and the ptests *all* unstripped.

What's the disk usage impact of an unstripped valgrind package?

Ross

