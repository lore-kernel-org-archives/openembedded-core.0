Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 84E097E69E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Jun 2019 08:02:33 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id m3so8684047wrv.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Jun 2019 01:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=Qu+xQMj2narCrqfCfyKIAKLyW4XnTHHu7qVA4xJZ98I=;
	b=eFrgcDGq8PsHkWTmLMCN98hTl8BtS9iG/6cyPR1s4IbzZCrWZqLg4uWrFGM790IWKd
	nr4mMMD2r47wUX+vECUl9vmywoNfjKiRZ6byXpBxc9HiNTWZ1ccSid7JNV/Ei0HZdZVs
	cN2gDKInHbMGfbsLr4Ashv//3YHbAoY6qk1Vo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Qu+xQMj2narCrqfCfyKIAKLyW4XnTHHu7qVA4xJZ98I=;
	b=iAc/7YnK7OyLjkNaedIjxOMQBVM4jTLSO6iWHE0SEgcZk3rhsul1mb3XitHrHqlZSx
	UdRmSL9nglMVBkKPuJenyZC73ItPR0uupJ0R6W5m/87y7j0PoOkOhk48ezvciDne6riC
	0q7nye/yUeupsiFfLnAVgOsqRL30sL0wM3Zh/kBk5BkCBzIxysJlwFWPMuex3kj0XDc7
	/IvjtizDaQcjQNQ72eP2Ng58BUvTd3UsZnV5iMiH9/kxfm+LCmFNre2LkBrgusQ/Cyzk
	LzD+qsQcCk/qS9Mh3/ULsM44bjqNYWQsaYuLV1bClRpsrcLQ6faiiO+7ttMLYoq6Y12H
	oJBQ==
X-Gm-Message-State: APjAAAXfm+Y51GWjF8YkpXMTyoDLdcw8ErqmvOCGjyVGzi7cRYQvyC5C
	X7TTBd0rXv6Y/0A+Vujg8kUTQw==
X-Google-Smtp-Source: APXvYqz04JsG4I2sD8ZZttStt77sQi6OZ8mDZ8mKZFxgerz4KSwOlFK8mZgIOWVoVjiIPP4c6953HA==
X-Received: by 2002:adf:ec8e:: with SMTP id z14mr14662084wrn.125.1561190554313;
	Sat, 22 Jun 2019 01:02:34 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u13sm3406969wrq.62.2019.06.22.01.02.33
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 22 Jun 2019 01:02:33 -0700 (PDT)
Message-ID: <bc86bf2d153a8b527a8dee71a4caf3bb02080be1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jon Mason <jdmason@kudzu.us>, openembedded-core@lists.openembedded.org
Date: Sat, 22 Jun 2019 09:02:32 +0100
In-Reply-To: <20190621192710.15428-1-jdmason@kudzu.us>
References: <20190621192710.15428-1-jdmason@kudzu.us>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH v2] oe_syslog.py: Handle syslogd/klogd restart race
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
X-List-Received-Date: Sat, 22 Jun 2019 08:02:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-06-21 at 15:27 -0400, Jon Mason wrote:
> syslogd and klogd can occasionally take too long to restart, which
> causes tests to fail by starting before the log daemons are
> ready.  To
> work around this problem, poll for up to 30 seconds on the processes
> to
> verify the old ones are killed and the new ones are up and running.
> 
> [YOCTO #13379]
> 
> Signed-off-by: Jon Mason <jdmason@kudzu.us>
> ---
>  meta/lib/oeqa/runtime/cases/oe_syslog.py | 54 +++++++++++++++++++++-
> --
>  1 file changed, 48 insertions(+), 6 deletions(-)

This looks good, thanks. Testing found a small issue:

https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/733

(and many other similar failures)

It looks like its trying to run these tests on core-image-minimal which
doesn't have an ssh server and only gets tested over serial.

The tests need to be skipped there too, so there is some markup missing
from one of the tests as a quick guess.

Hopefully easy to reproduce and fix.

Cheers,

Richard


