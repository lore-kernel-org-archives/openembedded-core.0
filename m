Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f176.google.com (mail-it1-f176.google.com
	[209.85.166.176])
	by mail.openembedded.org (Postfix) with ESMTP id 9E5196BD08
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Mar 2019 12:04:07 +0000 (UTC)
Received: by mail-it1-f176.google.com with SMTP id g17so9763211ita.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Mar 2019 05:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0Og+eLV8yNGX8W++/6yEoDy/1x0C/k1m/Ob5kLnyxHc=;
	b=DGDhS4e1Nhgjhq97L+XOtxM7712hEP7kC1sltNBBXNXFFi7dU2upV/AqiRlQyqBSpg
	1N8YZZIgZkXgNvQefE6bpdX7bZ4M+cedMGiE461ktQu0Pk4KNTTOvm9N6ZRP2AAzC9SA
	b9p+O7jLGDu+tt1SQCwlw6qCoyoKYr+4yxlDunTmWPRtTGeJr5WBUCj5WjBNiV6mFOG9
	iWWxLmLOeskqzbgg7oxxmgoweqhpre/UOwqoTbJwkrhW4+f8gziHxwcbbmqsxEil2i2H
	/WgUbwHoyOlO2gtQbMqE9or1WEGd6ks+dMCgY1cuwEvdCvbKy/6RTreQvrds/R1eIl1m
	s/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0Og+eLV8yNGX8W++/6yEoDy/1x0C/k1m/Ob5kLnyxHc=;
	b=Qi1ZhRugk9wbkISdJisycpxK5WcITJ4hFf3Kj++7QkIaQUdaTGEiOXHTGfJXEakW1N
	wTpmgTYJW+5aZkcES8b1DuHP2DfOowMA3CkSH7D+s+NBP6N/TS+xvVL/pTcwstPvtH7T
	6vvQTYh5exmVqa88oZnJLJXh88JaxTdjfEVdzpG9jToq8vY3655L96BUhNHkCXS31xou
	S8tUO7+v1AgzZfNwOiIIiZCY+4Q917AMhpCGXSsZjODObuLVF2IhAzVvGKi1MuG/U5zg
	ymI7HQ3hYTTVyCQjvaq6oGU8bgHwMazZD8NMxHTfcgVwUscNJZFk4U8VMF8Yu7rqzpnP
	4W0Q==
X-Gm-Message-State: APjAAAWokjUpe9dwXxbJLXFNTbqonCkG4uBlgLMTx5gnqTPQo+2b8bNl
	qTC6YGrsYE9cazACi6JxtiwnVEx2Akoj0Owwt3Yig31y
X-Google-Smtp-Source: APXvYqxIl60RdQuoSw8/ZE4ItMkfbE9Mw2WFEU6KIF+zYfxgmA+U8AKHvP8VwR+bhuNhoNDTh6IbRd+SZg1JRbk22vg=
X-Received: by 2002:a24:7294:: with SMTP id x142mr1664940itc.26.1552651448438; 
	Fri, 15 Mar 2019 05:04:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190314191924.44162-1-joe.slater@windriver.com>
	<CAJTo0LafGyAEuh8hbQoXNQCR5bJ9YBmMDJV-idGZ0OPMkTGQoQ@mail.gmail.com>
	<20190315104306.GA14180@localhost> <20190315115010.GA29190@localhost>
In-Reply-To: <20190315115010.GA29190@localhost>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 15 Mar 2019 12:03:56 +0000
Message-ID: <CAJTo0LZzUx+nPMaGzXi=3QuyK9ECmJSmxwxfQznMZTtdoOOFhg@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] puzzles: fix uninitialized variable compiler error
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
X-List-Received-Date: Fri, 15 Mar 2019 12:04:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 15 Mar 2019 at 11:50, Adrian Bunk <bunk@stusta.de> wrote:
> For the root cause I filed
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=89723

Cookie for Mr Bunk!  Thanks.

Ross

