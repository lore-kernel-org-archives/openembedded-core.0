Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0B54D6B079
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Dec 2018 10:29:56 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id r11-v6so10285186wmb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Dec 2018 02:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=n95rb6Sp+79g4m6FcA2I1jpvtGFYjeaWfd5nABeCUNw=;
	b=f0V9/OQyRDwm8D/xGdPLdoahOxMPHzD79x0zXVSEPB7PpRm87jDNFqZe9sS5L4YzQE
	lkvMkjYfMflFk1E+vcD9HAILhFMP8GlDio0G55jWH1po51glDENPS+s66CGtyypicby/
	5ZUhV7DZYLJtG/5IxL4EsSVzHEA47/WUX3Qaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=n95rb6Sp+79g4m6FcA2I1jpvtGFYjeaWfd5nABeCUNw=;
	b=daqsAi2AGRJ5C/7LNXQEh1bNTPnb7f22XXDAuWRgsKDUWaU6WrpnFo2VGPuoXip50/
	wEmzlg43Yge868TE3PHRYmjyr3chfHSrqT2E40B3gVtxrrIAGt0SmrxOgKFWIkPYclRR
	n69R6UAm3u9U8vw2o5tS9KjwFXvyf/TLibnbEQ38VJ+7rWyjAzIxkny5pglKyv+AJXuD
	+JRcQ9eR+U417wccksfDE7EhqJiMmBZqF5ZQGS/xMFWw3AI8jSSw6D1aREggtqverVlh
	80JAwft8FN6hDH5dcIzTdSjqn12hRNDzk+H2AOj9VZ3ShA0fcMdglqdObfRNKlef4Xts
	DEoQ==
X-Gm-Message-State: AA+aEWbHHqzpPIa7u6OfrpYlY5pJWa/PyPTUkvvAahskPmlyQesSnjcy
	q2IT0XxnCm8Q09epNzfC04QjkC7tZbTTJw==
X-Google-Smtp-Source: AFSGD/Vsf5hlEc/4hZi+x7cTTw4rMNxqlR0P2kx4zzchqxcU9QSRh6WkESlnw0i9iIpdi7RUrfhS0A==
X-Received: by 2002:a1c:8548:: with SMTP id h69mr9512326wmd.11.1544437797609; 
	Mon, 10 Dec 2018 02:29:57 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a18sm13215271wrp.13.2018.12.10.02.29.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 10 Dec 2018 02:29:56 -0800 (PST)
Message-ID: <37ad7314e33e17f8d20004e609c32fb03b90dfdc.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 10 Dec 2018 10:29:55 +0000
In-Reply-To: <bb3ede855b1af3d681a1007ccfff34be43cf6c27.1544408339.git.liezhi.yang@windriver.com>
References: <cover.1544408339.git.liezhi.yang@windriver.com>
	<bb3ede855b1af3d681a1007ccfff34be43cf6c27.1544408339.git.liezhi.yang@windriver.com>
User-Agent: Evolution 3.30.1-1build1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/4] base.bbclass: Remove invalid ccache related code
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
X-List-Received-Date: Mon, 10 Dec 2018 10:29:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2018-12-09 at 18:24 -0800, Robert Yang wrote:
> The code is in setup_hosttools_dir(), it searches ccache in PATH in
> reverse order, I can't figure out what it is used for, maybe it is
> aimed to use host's ccache rather than recipe-sysroot-
> native/usr/bin/ccache, but the later one isn't in original PATH, so
> remove the code.
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/base.bbclass | 2 --
>  1 file changed, 2 deletions(-)

We should document it and I think its still needed.

Some distros have a "gcc" which automatically wraps ccache behind the
scenes. This code lets us find the real gcc and bypass ccache.

There would be oe-selftest failures on such a distro if we didn't do
that.

Cheers,

Richard


