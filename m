Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 423926D74B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Sep 2019 12:11:14 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id q17so4417128wrx.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Sep 2019 05:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=IbTpqU+fDcXTFRCCq1Mhud6rFcfN5X7eSeYD89UUAJQ=;
	b=FQkmqWTLnG4nRRG+pLvkxInqXdNLpzr6LIoxqnRa2ESYCAYh1fldeUBXdlAP9Wv7fU
	4qQL+Hq3SuyafUNZLwW0GA6aZdjr73Ra4QoR0ijPKUOzmJbcuuGqPF8z2LGvccQEdH4R
	rtOB4+Hbo+bpEIgk1Ptbi7jMeJm8m9TPy6e9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=IbTpqU+fDcXTFRCCq1Mhud6rFcfN5X7eSeYD89UUAJQ=;
	b=unCBWKPO+RvBBTLZEA6ZC8hnyY31D0utBlP2Bzf7Zz8gdluRgNybn9ic+QcEBkhsac
	XVoj2TFsz22/i4XJiKicvcVs01FY++uDtmJ0/Wvz45XXqpPZw+AmsH1DpztPSBc4MWa8
	etqqtNMwzgSxMnaHHXE9tnBehyn0zO4m4/klqr/YpvI8ftabUqCk3EQfADhWFGDJ7rS6
	2/vYByY/0wBRyT78N5gOUS+BW3QNkV3UE0niZcKt7qoLrCwOQJIbvXAAXSOJC6CYGb2M
	r76xmaem/fpYbH1bNBa3vm1Y8aAgtfjyJKg4w1zSM3AoeIndzGzo9ZpOxY3sYd/D+VrL
	4Xng==
X-Gm-Message-State: APjAAAUVCD9LFcY2MCnQ5pSxdjHQNQyH1fEP428g13ZEUC8Zj4laBMu/
	Qwt+XysIoDvG6MjL8CgYpcBoEHwJ5SJFLQ==
X-Google-Smtp-Source: APXvYqx688jZw3/lAvBIpJtoQZlUrM3av1NzRodOU5qjLJ4ishEbIAK5S1q4nKmEDa23rWUnK+6c5A==
X-Received: by 2002:a05:6000:152:: with SMTP id
	r18mr994416wrx.153.1567858274894; 
	Sat, 07 Sep 2019 05:11:14 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u83sm15614165wme.0.2019.09.07.05.11.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Sep 2019 05:11:14 -0700 (PDT)
Message-ID: <0ba5d758a811e64fe594e655f4eecfdee5ceb4a9.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Trevor Gamblin <Trevor.Gamblin@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 07 Sep 2019 13:11:13 +0100
In-Reply-To: <20190906185159.4923-1-Trevor.Gamblin@windriver.com>
References: <20190906185159.4923-1-Trevor.Gamblin@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH v2] libevent: add granularity to ptest log
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
X-List-Received-Date: Sat, 07 Sep 2019 12:11:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-09-06 at 14:51 -0400, Trevor Gamblin wrote:
> From: Trevor Gamblin <trevor.gamblin@windriver.com>
> 
> The libevent ptest used to report only a global pass or a fail
> result.
> Count individual PASS, FAIL, SKIP results. The SKIP results now
> include tests that are disabled in the libevent code.
> 
> libevent's ptest output did not comply with the automake-style output
> "result: testname", and reported a FAIL status at the end of the test
> run if any of the libevent tests failed. This patch makes the log
> consistent with the automake style:
> 
>     PASS: http/cancel_by_host_no_ns
>     PASS: http/cancel_inactive_server
>     PASS: http/cancel_by_host_no_ns_inactive_server
>     SKIPPED: http/cancel_by_host_server_timeout
>     SKIPPED: http/cancel_server_timeout
> 
> and provides a summary as follows:
> 
>     === Test Summary ===
>     TOTAL: 316
>     PASSED: 300
>     FAILED: 0
>     SKIPPED: 16
>     DURATION: 87
>     END: /usr/lib/libevent/ptest
> 
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>

Thanks for this, it is a definite improvement on what was there before.
Results from the autobuilder run:

https://autobuilder.yocto.io/pub/non-release/20190907-4/testresults/testresult-report.txt

Cheers,

Richard


