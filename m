Return-Path: <twoerner@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8399078093
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 23:41:02 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id u48so1351097qtc.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 16:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xMxTmZZZJvzsEIzJpLNODgx/nE1HBh3EWUkV3hVNAGM=;
	b=sRl43NhxJWH7b62FW7kNiqzmGXwFZbWwyCurWpSlEWu589nz0S0GGWBBw48dL+Dr3c
	J5Sqmnj0S0ZsLZ7jVj2W3nW1OwmTi6BgibXzu15JQ/9J/J9c/uq905jjPUv2kbEQdxcl
	jc3I7aVZSK+ZzjS3U4AC95rUWcvck4e1bMbTG48ToyeEoe3T+oeOkHr0KXsdnmqpYDFk
	3/37SBRr5GqcVEY6dKadDoqRmPGQ+z2POcLnvDnSoHYYUfU+kaYOgmNDEkSTDzliGpNt
	mUndrAkzLUc9+szJfDgnQkRCIS4zCCYhEbJQirPSTcLNrf0VfXeU/eGGhupTWetp9oeZ
	M2EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xMxTmZZZJvzsEIzJpLNODgx/nE1HBh3EWUkV3hVNAGM=;
	b=gQGDSC0fSwfN1v9NS0/flMKPWF+V9EjI8fZ6G4SfUiaRstEl6gXgwieFoeYsnp1C4y
	2v4LIc4Qxb/OWgcmecojX6ORB3tslQP174nkXDFheZVUdyqminw22l8i4uaP0ddkp9J+
	H+oVpKVWgtm8Sl/PotP8V5N1y3aN7fBYUIhQW2jdjTOMJSDxN0I+qOPO4jEZ5NrYieKs
	qMSzsBVVCV7+F7nYcf02KsbPnQL3+YM+dmhCI/FT1pgkfMVf9Z4teQRYG6pRJKMAmRQa
	d1YdWkbPu4fVO37X4HiS6fltR6Dg+mIpkT1LmSV1EoTw1owB9nKQ2MCoK/jgYeFx0YqL
	TQ8w==
X-Gm-Message-State: AHPjjUj8LID1+zixUcnYnZsP3gzmfcmhJS+Xgz9LbKDqRgqclh5o9B/u
	gUOG8hdvKM5BQqX8KwMEpwPo3vKZemIqeXWJVzv6Tw==
X-Google-Smtp-Source: AOwi7QA5jJvLKA2jZFn7hBVpu45TGx+l14ZMtzHh6aFnw4Yyf+z/1EATJfpZgQc7fjE1Y4HlHiAdIqO8v350c2mI0Lg=
X-Received: by 10.200.47.184 with SMTP id l53mr47361607qta.120.1505778063684; 
	Mon, 18 Sep 2017 16:41:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.74 with HTTP; Mon, 18 Sep 2017 16:41:03 -0700 (PDT)
In-Reply-To: <20170918181847.594b6943@seebsdell>
References: <20170918133410.31388-1-alexander.kanavin@linux.intel.com>
	<CAHUNapTtXFnCurGoVtWKL=7v7Spxj4Hg2JqGh530ktRGgVgOyg@mail.gmail.com>
	<20170918181847.594b6943@seebsdell>
From: Trevor Woerner <twoerner@gmail.com>
Date: Mon, 18 Sep 2017 19:41:03 -0400
Message-ID: <CAHUNapRP0E5Qb909WpJqZm9LncV0-4Kw-kY5Y9CFO-Zd1AUNNA@mail.gmail.com>
To: Seebs <seebs@seebs.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] pseudo: use epoll API on Linux
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
X-List-Received-Date: Mon, 18 Sep 2017 23:41:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 18, 2017 at 7:18 PM, Seebs <seebs@seebs.net> wrote:
> On Mon, 18 Sep 2017 19:16:13 -0400
> Trevor Woerner <twoerner@gmail.com> wrote:
>
>> It doesn't make sense to carry these large patches against pseudo in
>> OE itself. Isn't pseudo one of the tools under The Yocto Project
>> umbrella?
>
> Yes. But the pool of people with the variety of expertise needed to
> maintain it isn't huge, and *normally* I'm more responsive, I'm just
> extra busy the last couple of months.

Would you be open to a co-maintainership? Maybe a co-maintainer who
doesn't push to master directly?

