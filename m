Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8108D7EFD5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 08:24:14 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f17so40737340wme.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 01:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=Cs1sv3IX8dAqGEC/Xv4ZHx7TRRR6mR7twHnzm8QUjDM=;
	b=LfN+lLQiPfips4dkdXbPBEkDgYmzDNnNaMrh0b91bOViAy7uJUry2+UoNM6CuwQKUL
	WwnwDRkC0QQUtezvhROeJ2Z7BQkS6s1buQMAZ6RsN7GtBhFK2K8/N4Slz/z40XVWvh9v
	hR9W+VUrAahqALTDPq/f+vRwPRIa4MOtUvEps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Cs1sv3IX8dAqGEC/Xv4ZHx7TRRR6mR7twHnzm8QUjDM=;
	b=amcM9ujQUXST7sZ1wq6SIhGJM/voA1aqruqgLJs5wIcJZ3xuNoE+0/oc/OQDIWCWg6
	D59W9zpc3UC/pV0+TFTF79ZWPnCJaLrfNxaegwzH9LUy+5iwHxT9e+ALRZ1Q9S6bz3hk
	qhd73vJVhw1tVL+fCKIYXXrgvEleGXJ4ssEM+ddoxS4HGAPk1NrCqd3V3e1C+vK6eiZt
	NQ+3MRORUMcZdQQyvVm46WNqpb76KIzeEUxUv8Lbc1xwcY8PC4Q2wZnqvg8td6sNkQ3y
	9iSTKPoZ9ENp4mR3Fe8d6kaSDvUOAkV+2ZzfdBRLvJdPag1MdujyrFScNca1M6Q+d5kY
	lp/w==
X-Gm-Message-State: APjAAAW/bmlv82qV1hv8WC7LYGNtwUmpDwDGv9G+lylHWa977XXNhQtI
	nrUxWuhxNXMXFJg3GqzCunTnAw==
X-Google-Smtp-Source: APXvYqyRw8wb77RzCJPbGVtFsWhPHmUMX9pi2f2TfkKXWEAIrgDaIu1T6ojjoRaYwWjiiOS1F7wTVA==
X-Received: by 2002:a1c:480a:: with SMTP id v10mr72713148wma.120.1563956655252;
	Wed, 24 Jul 2019 01:24:15 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t185sm39279217wma.11.2019.07.24.01.24.14
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 24 Jul 2019 01:24:14 -0700 (PDT)
Message-ID: <531504ebcdae52b7ce1fe8221417d4026c0f9ceb.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Bunk <bunk@stusta.de>, Khem Raj <raj.khem@gmail.com>
Date: Wed, 24 Jul 2019 09:24:13 +0100
In-Reply-To: <20190721152022.GA5474@localhost>
References: <20190720180058.10672-1-raj.khem@gmail.com>
	<20190720180058.10672-3-raj.khem@gmail.com>
	<20190721152022.GA5474@localhost>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V4 3/4] elfutils: Fix eu-* utils builds for musl
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
X-List-Received-Date: Wed, 24 Jul 2019 08:24:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2019-07-21 at 18:20 +0300, Adrian Bunk wrote:
> On Sat, Jul 20, 2019 at 11:00:57AM -0700, Khem Raj wrote:
> > ...
> > ++#if !defined(FNM_EXTMATCH)
> > ++# define FNM_EXTMATCH (0)
> > ++#endif
> > ...
> 
> As already said in [1] this is expected to result in broken code,
> and the upstream testsuite also confirms this.

I've taken the patches as they don't make things worse. I am a bit
concerned about a few places musl is building up problematic patches
though (systemd, elfutils, ltp come to mind).

Cheers,

Richard


