Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5E8BA7FA0E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 20:52:42 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id c17so4001105wmk.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Nov 2019 12:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=7fEGNw75/OwhxTEuKdAUE5jkmTmIWRekb09od5P/ukw=;
	b=J0mTxlokNIaY4CfjcXV5raAl/0oLi8pDxTlxYwi4VXBJVfdyeHkh6fXwDh5wlp04k5
	caCJ+kAv7PyYR+pmYfrJPMWRZx178yU+aMiJQ5CbwTk9x2jVjsi0xmp5EarM7FuMunvY
	6wcV7diCt0foU3FK/L+QtMidTfUBzmQQTodgc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=7fEGNw75/OwhxTEuKdAUE5jkmTmIWRekb09od5P/ukw=;
	b=BLLmEzOHk+HflrqOrARqSLBGB4qwZ02DYWrUOOb44BBzvINS8qwKYDGNx7xXeiR+7g
	4YpYmyxutgVE9/209UUp0PxnxuIvG8mAS5UlOCFVyahJELhWoO0N7jphbxtY/Jbsv23O
	YmxOuB678a0ZVDUQg6Bim21rGwSz74JlZbs/xdCYS+4L6Uyo2BCOPJ1XLePLVJdDHhWD
	q6GTBlsDB/4CuuY2NB9osW1/XRM/+hcWzuYRwpQ9IB6mxhnohRipRqCLj143N3OiVO33
	ItK5wakOmJhBnvJ0U4LswfXoJHIDmB1fEDb9cGY7qOfIgdAfq5Q6jg1hGwsp5n4ocJvQ
	ZNYQ==
X-Gm-Message-State: APjAAAVMUmrI+xzzxYo7LAN9u1KqGPuv2B2X6ZfTCLkllT5AGpqZjj+I
	PckJ2l+lww+LkVYuEwlR02DgGW8F5D8=
X-Google-Smtp-Source: APXvYqxT6WKw6AhOzFiG6gG497aTYIDmsBXZzNhHD/gJPEe92oNP+o/kydN9Y3HLCQTufXCZWBGYuA==
X-Received: by 2002:a1c:720b:: with SMTP id n11mr4494725wmc.60.1573159962973; 
	Thu, 07 Nov 2019 12:52:42 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l10sm5539120wrg.90.2019.11.07.12.52.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 07 Nov 2019 12:52:42 -0800 (PST)
Message-ID: <17ac19c3d8e4b4b110312fe6005e83684b671034.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Seebs <seebs@seebs.net>
Date: Thu, 07 Nov 2019 20:52:41 +0000
In-Reply-To: <20191107143430.39e16813@seebsdell>
References: <20191107200444.22913-1-richard.purdie@linuxfoundation.org>
	<20191107143430.39e16813@seebsdell>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pseudo: Add statx support to fix fedora30 issues
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
X-List-Received-Date: Thu, 07 Nov 2019 20:52:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-11-07 at 14:34 -0600, Seebs wrote:
> On Thu,  7 Nov 2019 20:04:44 +0000
> Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> 
> > Modern distros (e.g. fedora30) are starting to use the new statx()
> > syscall through the newly exposed glibc wrapper function in
> > software
> > like coreutils (e.g. the ls command). Add support to intercept this
> > to pseudo.
> 
> I think this should be okay. If there's no real statx() wrapper, the
> real_statx() call probably fails, but also things probably won't have
> thought it existed/worked.

That was my thinking...

> Worth double-checking that things still run with this in place on a
> system that doesn't have a statx wrapper, when configuring and
> building things like coreutils that will check for it.

coreutils looks to be using a standard configure check for the statx
function.

Even in OE, we'd not want to configure/compile with pseudo loaded and
active so I think we should be ok...

Cheers,

Richard




