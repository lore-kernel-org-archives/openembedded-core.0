Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f41.google.com (mail-yh0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id A3FDC609B2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jan 2015 16:04:18 +0000 (UTC)
Received: by mail-yh0-f41.google.com with SMTP id a41so1581542yho.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Jan 2015 08:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=rgrwFJAEpRUM1Pe5UY9PYDcbPujDeHYTit4LITf4pwk=;
	b=aAXCsLQYZ0JFKgqpBwiJ2IHecwopGsSkN3yJ5y7pRKRxWREN4g5oRkAhoUHRNiStF8
	ftop8vOWBQRF001BWQQ3YRLr1gPjgJ3n8fVsn6CwiG19ORH7qh6vkvjIOnP4HBHTbXGt
	5vE9uSmcV+TNdNUbTBBu6q3aWS8kZj1wJz8DFq+UHwB1sbDJbia6Pon88MLLVYa2mlN3
	zzErzghugFC3vAFU6Gplk+Yp/xkEDUSqANKPiJcvitSJ423l8NTJyU36mbSceCqlBJa6
	mACqOKrbtnkdAhiPyRW/HqCj9l/SltSEp6TvKiG1WjGhf7BtmYOHuokb0D9oDPcqj4RN
	7xDw==
MIME-Version: 1.0
X-Received: by 10.236.109.166 with SMTP id s26mr6907524yhg.67.1420733059559;
	Thu, 08 Jan 2015 08:04:19 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Thu, 8 Jan 2015 08:04:19 -0800 (PST)
In-Reply-To: <20150108154603.GB3441@localhost.localdomain>
References: <1420706622-31273-1-git-send-email-maciej.borzecki@open-rnd.pl>
	<1420706622-31273-2-git-send-email-maciej.borzecki@open-rnd.pl>
	<CAP9ODKqVq_Pg-A+Eb8b2hrH81e1QCGo64NqHf8yOZiQcJKAO7g@mail.gmail.com>
	<20150108154603.GB3441@localhost.localdomain>
Date: Thu, 8 Jan 2015 14:04:19 -0200
X-Google-Sender-Auth: bC4_a3LR9LLR0aNTKBcDcayQKVw
Message-ID: <CAP9ODKpyOivG97sXpTueW3K1tUzn=-rF4QKp1qgFKFCQQ8o_JA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: cherry-pick patch fixing networkd gateway route handling
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
X-List-Received-Date: Thu, 08 Jan 2015 16:04:22 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 8, 2015 at 1:46 PM, Maciej Borzecki
<maciej.borzecki@open-rnd.pl> wrote:
> On 01/08 12:14, Otavio Salvador wrote:
>> On Thu, Jan 8, 2015 at 6:43 AM, Maciej Borzecki
>> <maciej.borzecki@open-rnd.pl> wrote:
>> > Cherry-picking a patch that fixes gateway route handling in
>> > systemd-networkd. The patch adds a source IP to the automatically added gateway
>> > static route, this thus allowing for proper communication in case a static or
>> > IPv4 LL address is used alongside a dynamically obtained one.
>> >
>> > (From systemd rev: 46b0c76e2c355c0d0cc4792abb98cde07b28bc5)
>> >
>> > Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
>> > Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
>> > ---
>> >  ...d-preferred-source-to-dhcp4-gateway-route.patch | 109 +++++++++++++++++++++
>> >  meta/recipes-core/systemd/systemd_216.bb           |   1 +
>> >  2 files changed, 110 insertions(+)
>> >  create mode 100644 meta/recipes-core/systemd/systemd/0001-networkd-add-preferred-source-to-dhcp4-gateway-route.patch
>> >
>> > diff --git a/meta/recipes-core/systemd/systemd/0001-networkd-add-preferred-source-to-dhcp4-gateway-route.patch b/meta/recipes-core/systemd/systemd/0001-networkd-add-preferred-source-to-dhcp4-gateway-route.patch
>> > new file mode 100644
>> > index 0000000..1a9e8ee
>> > --- /dev/null
>> > +++ b/meta/recipes-core/systemd/systemd/0001-networkd-add-preferred-source-to-dhcp4-gateway-route.patch
>> > @@ -0,0 +1,109 @@
>> > +From 46b0c76e2c355c0d0cc4792abb98cde07b28bc53 Mon Sep 17 00:00:00 2001
>> > +From: Emil Renner Berthing <systemd@esmil.dk>
>> > +Date: Fri, 5 Sep 2014 11:56:02 +0200
>> > +Subject: [PATCH] networkd: add preferred source to dhcp4 gateway route
>> > +
>> > +This makes DHCPv4 and IPv4LL coexist peacefully.
>> > +
>> > +[tomegun: apply to both the dhcp routes, use in_addr_is_null() rather than a
>> > +separate variable to indicate when prefsrc should be applied]
>>
>> Missing Upstream-Status field.
>
> I'm guessing
>
> Upstream-Status: backport
>
> is the correct stanza?

Yes, and [<version>] so we know the referenced version when updating it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

