Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id D25D97ED5C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2019 22:45:04 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id l16so16214780wrv.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Sep 2019 15:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=RUFxkvlIPtYGp5LuvjcbT+PpGjYEu04IaekFBnMYccA=;
	b=E6Gb/sm3ajV77H/WkKVkPairtLi+1jEe4ZeNZlykmNECLE+WVzocRG5dYhUS6wAQG3
	6NCiceDlO9xjJ1QgGDTHTUoeHary5bifRYGT1EpWZB5ztagtkoMUASXc7EGKhHd3WCSx
	0fm6FvJRHzowTZW0vwo0mq+eyBuZq4UJNuqpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=RUFxkvlIPtYGp5LuvjcbT+PpGjYEu04IaekFBnMYccA=;
	b=PMWjXXOB4iU34z34OTa+0lx6tV6dopY0GhZ6CuX8hTIhdXJaj0DT1T/i4UQtg5EIfW
	40X7+IAk/WciaA4LqH89h/GGHtuhgMY0cufcnFGtaGwFlC9f1IkXaWRTU0QaiTSkaPcr
	5U88qlh4FTPtNeUpWtzragnLOW/yircTE4Lc75R6kmrhB+QgDHivZG02SC5FtilO1r5e
	iZw3nkVYrH40H6PDEPRlafoOmnvlOgouu4UYCxpmT2YTZK3+0XiKs0UFGij2h8Au5sOv
	PDWTq06UXx+fn4BfLRrIu9sszSQ6GDruXa0dyuY5TgZnDfGFKLox1L4F9cJ5er/LTWSG
	iG2w==
X-Gm-Message-State: APjAAAWx5gLjfcfqDOwqC3mNpG9uCXkv+xH1k+ab8MVcpJo1XmHsqx31
	pUkeTF3uiLSGmpsOuNX9pN3+5g==
X-Google-Smtp-Source: APXvYqwJfWiD9mm0Xc7tHEDIS9hFe4s/wrm28zYlK4TN+4DEZ38ZnLlOkKYC5dwSf2bkIHUZFJtGnw==
X-Received: by 2002:a5d:66c5:: with SMTP id k5mr22652567wrw.304.1568069104715; 
	Mon, 09 Sep 2019 15:45:04 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	f143sm728059wme.40.2019.09.09.15.45.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Sep 2019 15:45:03 -0700 (PDT)
Message-ID: <051c15fb11bbfca43d4c352e19928eceefbe27cd.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Trevor Gamblin <Trevor.Gamblin@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 09 Sep 2019 23:45:03 +0100
In-Reply-To: <20190909151620.36435-1-Trevor.Gamblin@windriver.com>
References: <20190909151620.36435-1-Trevor.Gamblin@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] libevent: don't treat test stats line as pass/fail in ptest
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
X-List-Received-Date: Mon, 09 Sep 2019 22:45:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-09-09 at 11:16 -0400, Trevor Gamblin wrote:
> From: Trevor Gamblin <trevor.gamblin@windriver.com>
> 
> The libevent "regress" test outputs its own pass/fail results,
> e.g. "2/300 TESTS FAILED. (31 skipped)", which will be
> miscounted as an extra test fail in the ptest log. Fixed this
> to ignore the libevent results line when counting actual
> pass/fail results.
> 
> Also removed the for loop in run-ptest and targeted only the
> libevent "regress" test, as the other tests being run were
> related to performance and did not provide a relevant pass/fail
> output.

Can you put a comment into the runner script about why we're not
running these other tests please? This is so that someone looking at
the script in the future can immediately see we're not running them
intentionally.

Thanks,

Richard


