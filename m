Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 8651873964
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 04:56:37 +0000 (UTC)
Received: by ieclw3 with SMTP id lw3so16933267iec.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 21:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=1IrHwSDT5zNhqsSaknn8fLTqYk/Zw9NAKywqbmXIfqw=;
	b=RRfYmIEc/owxN5z2XGy8S8gFDnADSRNXepPYQbi/zEaS/T+a2xZ5fhrG8fFgZ2QnXq
	cKdwLvDocVzjjftM4NYG6lfUaPHU5jVK3dcW7izSxCZh3V02UKGg+Ex7cJMWvxlKxQRe
	5RUAE+zj7yMMWKDVvJfdinNZpNpYBJX9/liR3NGyn7/QhBEdF3mbJoXd1RprZ4JwV3kl
	LKs9VgiG1W9to+Ss1ThQZh4zl/OWURp8iWqYLMNisDE/FBysNZKLOCN1LdALtem1CJkF
	EvMmGyQpBAJ/b2Y5ev0J8XfiGdJhXGfTd1Tsj9or9/EbJm12jNUeW4wwvaaJBRZ8CKmW
	buPw==
X-Received: by 10.42.93.83 with SMTP id w19mr45919054icm.37.1426136197972;
	Wed, 11 Mar 2015 21:56:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.117.7 with HTTP; Wed, 11 Mar 2015 21:56:07 -0700 (PDT)
In-Reply-To: <60821.10.252.136.167.1426133918.squirrel@linux.intel.com>
References: <1426109339-12975-1-git-send-email-randy.e.witt@linux.intel.com>
	<13FDACD4-FC30-49CD-AC52-9D614F407C5D@gmail.com>
	<60821.10.252.136.167.1426133918.squirrel@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Mar 2015 21:56:07 -0700
Message-ID: <CAMKF1spWmF=BS3oZj5aqd2mh6GC5P81+x2kgw=YRAgr6+oLcuA@mail.gmail.com>
To: Randy Witt <randy.e.witt@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Instruct the journal to always be volatile
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
X-List-Received-Date: Thu, 12 Mar 2015 04:56:38 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 11, 2015 at 9:18 PM,  <randy.e.witt@linux.intel.com> wrote:
>>
>>> On Mar 11, 2015, at 2:28 PM, Randy Witt <randy.e.witt@linux.intel.com>
>>> wrote:
>>>
>>> When the storage mode for the journal is "auto" if /var/log/journal
>>> exists then the journal will flush to /var/log/journal assuming that
>>> /var/log/journal is persistent.
>>>
>>> However /var/log -> /var/volatile/log in poky, so even though
>>> /var/log/journal exists, it is still volatile.
>>>
>>> Since this can cause ordering issues due to /var/volatile needing to be
>>> mounted before the journal actually writes to it, just specify that the
>>> journal
>>> should always be volatile and never try to write to "persistent"
>>> storage. The journal will exist in /run/log/journal only.
>>>
>>> This also disables the "After" of the journal on var-volatile.mount
>>> since the ordering is no longer necessary when the journal is only
>>> stored in /run/log/journal.
>>>
>>> [Yocto #7388]
>>
>>
>> This is not right. What if I want persistent logs.? the options is just
>> gone. Both cases should work. /var/volatile should only be used
>> when doing ro-rfs its not FHS specified anyway. Lets not go with this
>> patch.
> The distro could still change it with a bbappend or additional
> configuration files just like other settings. We don't have an option for
> a persistent journal so I'm curious, how would both cases work currently?
>

No they dont and I have posted a patch which potentially should.

> Currently if a persistent journal is desired, the /var/log symlink has to
> be changed to point to persistent storage, or /var/volatile has to be
> dropped from /etc/fstab. These are also configuration changes.
>
> The lesser of the two evils seems to be making it so that the journal
> works in the volatile case, which is all we've ever supported in poky. If
> a user wanted a non-volatile journal it was left to them to do.

poky is not only the distro thats fed with OE-Core there are several
open ones and several
which are maintained by companies

>
> I agree that the journal should be persistent, but I also agree with
> Richard that seems to be too big of a change in behavior when we're so
> close to the release point.

what makes you think the change you posted is not intrusive, we have a
regression compared to last release,
this patch does not fix the regression, it infact pacifies some errors
which are new and creates yet another behavior.  think of people who
will be migrating from 1.7 to 1.8  problems should be solved in best
possible way.
I am fine with whatever is accepted solution. I have no interest in
push one or the other
I do have a solution which fixes my problems therefore I am less
concerned. Carrying a couple of local reverts it not a big of a deal.

-Khem

