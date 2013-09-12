Return-Path: <christian.babeux@0x80.ca>
Received: from mail-ve0-f176.google.com (mail-ve0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id 0A36A61864
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 22:12:35 +0000 (UTC)
Received: by mail-ve0-f176.google.com with SMTP id jx11so374248veb.21
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 15:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x80.ca; s=google;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=hEW8iEBWwupbVAT3nravExgss9Hoz2mv0d63B26AEwU=;
	b=IXZZlAGhapLWNdchd0ka/QQmfHGI6DZSDbH5IUxNwwok9kVYcq5j9/5LcDB5vs5J/I
	1l33SF4ylcwQ5ZmNzr8o0jHldKJjOqDHoplVnJRDl4s9OG1g5RU+5hG4QQshQzpv6PEs
	4HXdJQ+S5gHV/kWSt8HoDorwmw8Wvx3zd2hTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=hEW8iEBWwupbVAT3nravExgss9Hoz2mv0d63B26AEwU=;
	b=ihabZGuS8UXjdQ0/DOGlMbm/pr4D2R/wP7V5cqhTf+fNwthZAw0LFRmSAmG7rHFmPV
	r6NpHihm7Q3A6kgMph4obHXO48F7AHMdR8RGwS8GHF06LwJpE18o84eZRmxUVGZkv0yY
	yd8hOzaYpoDXPdcPI4SR7AflZEb3ZYQrFIV1oHkSuT5cBJzfjefNW6iAtmSER1sgtPct
	SpO8tL6YE+YeT6NAFRDUq8ow/DOT2TQWWllYiQuDirZpdTxjpiaEBCXDNeQZRJRWJc/y
	AtLtvN060xk3UZPf93ds5axG2mnJy87EgNlobJ0/6CMAbhDp6YdUBXr/yJlt6cggX67S
	MP2w==
X-Gm-Message-State: ALoCoQn0ybzSId+5itQYiOTo2+d0XI9wkR8pBRvWxNcDzOYLHXHsGXjLqMeBy5i8YDdU50/4ZmU1
MIME-Version: 1.0
X-Received: by 10.221.56.194 with SMTP id wd2mr8734610vcb.7.1379023957132;
	Thu, 12 Sep 2013 15:12:37 -0700 (PDT)
Sender: christian.babeux@0x80.ca
Received: by 10.59.4.6 with HTTP; Thu, 12 Sep 2013 15:12:37 -0700 (PDT)
X-Originating-IP: [173.246.22.188]
In-Reply-To: <52320655.3080103@seefeld.name>
References: <1378948190-16620-1-git-send-email-stefan_seefeld@mentor.com>
	<1378948190-16620-2-git-send-email-stefan_seefeld@mentor.com>
	<CAGDH53kUE8aB_MoRvsxhA7jhvTpvT0+DYCGNmZnVdMFLgreR7w@mail.gmail.com>
	<52320655.3080103@seefeld.name>
Date: Thu, 12 Sep 2013 18:12:37 -0400
X-Google-Sender-Auth: 5cn1BKldjZMFAxvFBT-K9Izf-5s
Message-ID: <CAGDH53myHLkfCS51wXj6jV+cXLF1=2NqsHD86Wv6ovjRbtJuOA@mail.gmail.com>
From: Christian Babeux <christian.babeux@efficios.com>
To: Stefan Seefeld <stefan@seefeld.name>
Cc: "lttng-dev@lists.lttng.org" <lttng-dev@lists.lttng.org>,
	Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Enable ptest support for lttng.
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
X-List-Received-Date: Thu, 12 Sep 2013 22:12:37 -0000
Content-Type: text/plain; charset=UTF-8

> Still, I think it's good to include these tests. If anything they may
> just provide more motivation to address the underlying issue. :-)

Absolutely! I'll start a thread on lttng-dev to see how we can deal
with the current testsuite limitations.

>>> ++prove --merge -v --exec '' - < $1 | sed \
>>> ++  -e 's|^ok \(.*\)|PASS: \1|' \
>>> ++  -e 's|^not ok \(.*\)|FAIL: \1|' \
>>> ++  | egrep -h 'PASS|FAIL'
>> This is sadly needed because we are using TAP as our standardized test
>> output format across the multiples lttng codebases.
>
> Do you think it would be worthwhile submitting this patch upstream ?

This is pretty much OpenEmbedded specific and I don't think it is of
much use outside of ptest support.

> (The output format of prove is not the easiest to understand, and even
> with the above some information may be lost. A more robust fix would
> probably include a dedicated TAP formatter plugin
> (http://perldoc.perl.org/TAP/Formatter/Console.html) that produces
> ptest-compatible output.

Yes that would be a cleaner way of dealing with it. We would only need
to feed the appropriate 'testlist' file to this script and get proper
conversion of TAP to Automake-style test output. I'm wondering if such
a script would be useful for other projects/recipes using TAP tests
within oe/yocto?

Thanks,

Christian Babeux
EfficiOS Inc.
http://www.efficios.com

