Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 11F1C7F88E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 16:44:06 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id l17so18112041wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 08:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=7fZzfk8Aidg4pZiHSgvFqKOs6xXyQx1tnGk00cdkY/s=;
	b=CGvlWpgH3meHUxUfeYMjlw2cHsG4EQD7Q4LDeEe1yGgoZTtiG5q2SEEQuuj9aBVaNb
	98Cz7V4EuYUTaEs+RrFzbiJMhZ/Lj+EiFiTTCQKMSdb/6/jAvUJqfUq25wyK1t69pc2G
	OMiVl2opaCLlJGadhX4InVMUSGJBL7f+2f6pg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=7fZzfk8Aidg4pZiHSgvFqKOs6xXyQx1tnGk00cdkY/s=;
	b=ho9fKoBKq9dctf1jWEDwuUQUuU5I012tZGVbMmR4gH2kEfCaYHlA1BBBpM61fNCH4P
	FVOxffSYJ2l21RldRbxQL0ZgGcp6k5zBJHSQXdke0rXz2sW832CPMuTZc/uSxy1KpRzG
	4xHsoBL56bnIyUg8zMVCtJLjGq/j5xrkZZ1pPVXKhWZhwWciltUSScKlv+mMgdwJmrRq
	n9HpRTsJ6sXM4Q4bNlGl18aDbvIF4iKHuA1Jx8VO+vHKwEmL66r1WMzCvE/zOMybA1+H
	yXpfRw8nnmJhoXrkTUrckB/cyi8lfsy7OuC6v6FCkLTE5lE/Y4YOLXPcXgHzluvIL77B
	EMVQ==
X-Gm-Message-State: APjAAAWRCM0op6r3T6v8ZAYc2zAncpJRA7x0VGh3jgGNvFpoYxD4ObLS
	a1aOQwCZnD3XU4fJEvlyPbKJCw==
X-Google-Smtp-Source: APXvYqzjIsJ1/uFdk7N7F8v7vlbN34WBKeCjuzn21JK38bFew1apzQxsf2GyE5shxgH9jfONpVlgFw==
X-Received: by 2002:a1c:2e8f:: with SMTP id
	u137mr30926182wmu.105.1574095446804; 
	Mon, 18 Nov 2019 08:44:06 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r2sm18534101wma.44.2019.11.18.08.44.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 08:44:06 -0800 (PST)
Message-ID: <9cefac866172047d73121778c13de58fc215904d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 16:44:04 +0000
In-Reply-To: <20191118142852.22981-9-alex.kanavin@gmail.com>
References: <20191118142852.22981-1-alex.kanavin@gmail.com>
	<20191118142852.22981-9-alex.kanavin@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 09/13] Revert "devtool/standard.py: Not filtering devtool workspace for devtool finish"
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
X-List-Received-Date: Mon, 18 Nov 2019 16:44:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-11-18 at 15:28 +0100, Alexander Kanavin wrote:
> This reverts commit 41d225f4a37d02e9f79bdbfb79caac8cd3d291ce.
> 
> Unfortunately this change broke 'devtool upgrade' functionality,
> causing 'devtool finish' to write out an upgraded recipe that no
> longer includes the original upstream source in SRC_URI.
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  scripts/lib/devtool/standard.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/lib/devtool/standard.py
> b/scripts/lib/devtool/standard.py
> index 8d9c1a30225..1c0cd8ab51b 100644
> --- a/scripts/lib/devtool/standard.py
> +++ b/scripts/lib/devtool/standard.py
> @@ -2021,7 +2021,7 @@ def finish(args, config, basepath, workspace):
>      remove_work=args.remove_work
>      tinfoil = setup_tinfoil(basepath=basepath, tracking=True)
>      try:
> -        rd = parse_recipe(config, tinfoil, args.recipename, True,
> False)
> +        rd = parse_recipe(config, tinfoil, args.recipename, True)
>          if not rd:
>              return 1

Are we missing a test case for something here?

If yes, would that be worth noting in bugzilla whilst we know about it?

Cheers,

Richard


