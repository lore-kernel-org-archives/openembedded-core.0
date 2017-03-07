Return-Path: <msm-oss@mcclintock.net>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id E8B7277853
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Mar 2017 20:53:36 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id o126so5081433pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Mar 2017 12:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mcclintock.net; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2RNKNmIc3dAqZrTQLrYrtFlrcRlg6+BcpTUchBotOlo=;
	b=b1ZKh6RbHsUhY7Bloq0hnvo9W/LDA+iylXbqB3TeETevpQodk6ajAv0HniKABW9+of
	K80M3vJbmb78AGm3hvQ/f0JYlgvARRGBv7Fr/n8fI17KegOfShXDHNYhyDpzf0DvDryc
	m6QUxjMqTm1wX/o2CWrg2vEKG7aX5RBHtcSlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2RNKNmIc3dAqZrTQLrYrtFlrcRlg6+BcpTUchBotOlo=;
	b=GbzHVGxjuF9xdMGaY73Co3nZcVTEutg/muNr56LgLVGWpDr+gr8q7Wih67DxbVngwk
	uGX5U4tQvrasNRDUbtQfcUGzw61w135FshxS+zu6mTdSGFZqp+JdESbWZFWMP20hNaWa
	+ZPnul/8s95hnjf+EiTt5t4afz1R2tZm95Mv3Dn50GTN4rsMFiCEefPUNK3DAIQPxAl/
	3sYc4Z8oMAM0Upu1+Vni+2uyT1JmFHyXAY9GOK+8JGnnwK5pQJwNTVz+Okmf6CL4Eg0c
	FibFxZVX7ekEtKaSABE6APHa8fyEej5W1cMJ2QcGjBe5RH2iJ8/4nx2D3cT7bNFbMqI6
	3hRg==
X-Gm-Message-State: AMke39kBDvh/E4w/mA5ez0ZBnvuwtOkCEfZu9CbWZ8JHd7jcLIoCToceWm/bMrpi0MBlZhZyaHhMo1q9iK6rSw==
X-Received: by 10.84.245.8 with SMTP id i8mr3198342pll.131.1488920018016; Tue,
	07 Mar 2017 12:53:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.177.198 with HTTP; Tue, 7 Mar 2017 12:53:16 -0800 (PST)
In-Reply-To: <1488919643.22968.47.camel@linuxfoundation.org>
References: <1488916121-30447-1-git-send-email-msm-oss@mcclintock.net>
	<1488919643.22968.47.camel@linuxfoundation.org>
From: Matthew McClintock <msm-oss@mcclintock.net>
Date: Tue, 7 Mar 2017 14:53:16 -0600
Message-ID: <CAEsOVNeAYACmJ+hr0CsuzTRTB_qPt0J68eBMHeLKP22gtxhjdA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] utility-task: Add do_patchall task
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
X-List-Received-Date: Tue, 07 Mar 2017 20:53:37 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 7, 2017 at 2:47 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2017-03-07 at 13:48 -0600, Matthew McClintock wrote:
>> This is useful in a few scenarios:
>>
>> 1) A developer wants to be able to grep all the code in a particular
>> without having to run patch on various components until they guess
>> the
>> right one (e.g. which component is generating an error/warning?)
>>
>> 2) Other code scanning tools that can be run without requiring a full
>> image to be built (legal, static code analysis, etc)
>>
>> Signed-off-by: Matthew McClintock <msm-oss@mcclintock.net>
>> ---
>>  meta/classes/utility-tasks.bbclass | 7 +++++++
>>  meta/conf/documentation.conf       | 1 +
>>  2 files changed, 8 insertions(+)
>
> I have mixed feelings on this. Whilst I can see the attraction, extra
> tasks like this do actually have a parsing overhead. We already have a
> lot of them and its only a question of time before someone wants
> another XXXall task adding.
>
> I'm wondering if we can solve this at the bitbake level instead with a
> new parameter instead? That would allow us to delete tasks and speed up
> parsing rather than slow things down.

Can you drop a few hints as to where to look to add this to bitbake? I
can look at it a bit further.

One other thing we were thinking about was doing for only things that
will run on or be on the target (e.g. skipping the toolchain side).

-M

