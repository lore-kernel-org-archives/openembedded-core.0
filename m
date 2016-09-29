Return-Path: <seebs@seebs.net>
Received: from mail.plethora.net (mail.plethora.net [184.173.250.112])
	by mail.openembedded.org (Postfix) with ESMTP id D429E60119
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 03:03:53 +0000 (UTC)
Received: from [10.10.10.132] (home.seebs.net [74.122.98.108])
	by mail.plethora.net (Postfix) with ESMTPSA id 19073C495D;
	Wed, 28 Sep 2016 22:03:54 -0500 (CDT)
From: Seebs <seebs@seebs.net>
To: "Robert Yang" <liezhi.yang@windriver.com>
Date: Wed, 28 Sep 2016 22:03:53 -0500
Message-ID: <70B2EE9E-0CDB-44BF-A766-2345A8F34A8B@seebs.net>
In-Reply-To: <23b689b2-d61f-d6db-f49d-86682c9f84fc@windriver.com>
References: <cover.1475043600.git.liezhi.yang@windriver.com>
	<CB05DC3E-85D6-4866-9EA0-7341AC8C5FEC@seebs.net>
	<23b689b2-d61f-d6db-f49d-86682c9f84fc@windriver.com>
MIME-Version: 1.0
X-Mailer: MailMate (1.9.5r5263)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] pseudo: add prefix for log and make log consistent
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
X-List-Received-Date: Thu, 29 Sep 2016 03:03:54 -0000
Content-Type: text/plain; format=flowed

On 28 Sep 2016, at 21:31, Robert Yang wrote:

>
> Hi Peter,
>
> Thanks for the reply, I tested your patch from git repo, it doesn't 
> work,
> the message goes to the terminal:
> Child process exit status 4: lock_held

Huh. I'll have to look more closely, then.

> $ kill -9 `ps aux | grep /usr/bin/pseud | awk '{print $2}'` ; 
> /buildarea/lyang1/test_gen/tmp/sysroots/x86_64-linux/usr/bin/pseudo & 
> /buildarea/lyang1/test_gen/tmp/sysroots/x86_64-linux/usr/bin/pseudo

Hmm.

> If there are gigabytes log messages, will 8 characters prefix "pseudo: 
> "
> contributes a lot to that?

If we've got logging on enough to produce a lot, then it'll be a bit.

And there isn't any reason to prefix *all* the messages. The only reason 
these mattered is that they show up in the middle of a build without 
context. If we take away the very small number of messages that were 
showing up on the console (which should probably be pseudo_debug() 
messages
now anyway), there's no need for the prefixing.

>> pseudo_diag() is sometimes used to produce partial lines. So
>>     pseudo_diag("foo: ");
>>     pseudo_diag("bar\n");
>
> Should pseudo_diag() be used in this way ? I think no according to 
> other log
> utils such as python's logging module.

This is not other log utils. This logging utility *specifically* allows 
for partial
lines, and has extra support for them.

I'll have a look at the diagnostics now that we have that nice quick 
reproducer.

-s

