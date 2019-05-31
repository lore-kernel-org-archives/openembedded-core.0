Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id C5B6B7D007
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 21:50:14 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id h1so7406315wro.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 14:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=VXqvdgTQc56eG2yeCOLqpIj9FcGkjpJQPlBywNMAiZ8=;
	b=dOiMivS5QiOgjwWuv0sV25Z1kn3q2zzl0gw09fJMNiuRR6CnMCEBRt9X8JyJwFdCkX
	m+qZUKnyT5m6KQ6apcWMzKkvIvSCZCoh/5ODHM+wUD+fI+H8O1+b0PMas8yBU8jxqJ0F
	Q6vZ64gk+8BYjsVuyz3OZaLk/6bvGQw/x5ySQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=VXqvdgTQc56eG2yeCOLqpIj9FcGkjpJQPlBywNMAiZ8=;
	b=nBo9W1gzsNsWHNg4TZfManYHt9ryDzltB3nANkOPkymR2pnsVdhco3/T+6YJDyzANJ
	kp56Q0q+oJoEvdxTQQmAg3x8yTFYsZYpCFhn7tXe/VqnsMgzS2g+vPOaBNN+0GNWjcb+
	TeyUL60xZ9KBVnFUGSkgAC0HHwmSWkIY7zNpXFy38DRYoX20eojWTha18xhBxmA50lHg
	6HKVkR3JAyVKvJns6Be9J0JxCdnyyx6PLt+bN+iUSfhzgrTsj6GRMx9wRKCkx3hiQm0g
	GQ7kE3Cj5VIxT7h7ILwseocxRvOQElT1HpxaDXfiLftpWvyvkjtVmnrSJMV3gRVVC/qB
	PyHQ==
X-Gm-Message-State: APjAAAUE4aDV5GMHAePQOe3kaVp31ZlxmKBsRoZzh/a+vw+aOx5Fi48W
	REWtAT8ApUBJOiR2cOpVtw5CCg==
X-Google-Smtp-Source: APXvYqzkZhrF0CMTHzVL4zYrJM1NqQuHpJ2EDhYExy6mv8K4CvpSi5u38gT2BPtIyPH+YXsMCvUO9g==
X-Received: by 2002:adf:9c8e:: with SMTP id d14mr8259245wre.215.1559339415446; 
	Fri, 31 May 2019 14:50:15 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a4sm15432078wrf.78.2019.05.31.14.50.14
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 31 May 2019 14:50:14 -0700 (PDT)
Message-ID: <d30ad8bb6247dadd7199cff103f8739ece90af7f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sakib Sajal <sakib.sajal@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2019 22:50:13 +0100
In-Reply-To: <20190531202552.21421-2-sakib.sajal@windriver.com>
References: <20190531202552.21421-1-sakib.sajal@windriver.com>
	<20190531202552.21421-2-sakib.sajal@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] ptest-runner: close all fds in child process.
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
X-List-Received-Date: Fri, 31 May 2019 21:50:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-05-31 at 16:25 -0400, Sakib Sajal wrote:
> When running 'ptest-runner bash', a test named vredir fails
> due to too many open file descriptors.
> The test sets the maximum number of open file descriptors
> to 6 (ulimit -n 6). The test passes by interactively calling
> run-ptest, but not when using ptest-runner.
> Security-focused applications will close all unused file descriptors
> in
> the child after forking but before execing.
> 
> From the failed ptest log:
>    run-vredir
>    87,88c87,88
>    < ./vredir6.sub: line 10: /dev/null: Too many open files
>    < ./vredir6.sub: line 13: /dev/null: Too many open files
>    FAIL: run-vredir
> 
> Upstream-Status: Submitted [yocto@yoctoproject.org]
> 
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> Signed-off-by: Randy Macleod <randy.macleod@windriver.com>

Thanks, this looks like a good fix.

Since I believe Anibal has merged this into the upstream source, could
you send a patch which updates the revision ptest-runner2 is using
instead please? That just then saves adding and then dropping the
patch.

Cheers,

Richard


