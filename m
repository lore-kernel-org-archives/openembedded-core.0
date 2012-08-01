Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <b08248@gmail.com>) id 1Swbr9-0007tN-Fe
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 18:33:07 +0200
Received: by vcbfy27 with SMTP id fy27so6730801vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 09:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=2tPXd+foBfLbHItrVpdsYjV7oRWE3kx46fiYi7RKivU=;
	b=adS4T398JwXp/Sh5CKc+65ejHbm0kVM6calu7D5H3BdYWazrWreFqgC2gM3DaparIx
	ofYLvK6Dkq8aUygLHEh8NI9ANM5mDXd0fM6NLtWm6GRvCepWJ1ef9nAkiy8xLDJeWQyH
	k5KMp2rQNxCeQN8ywKT22Pu5esCn+T8UZJvV1gtMcgKQnJMAQA2crG2N6IjZFCalRY3m
	fkgeoC6P8ogTxk1roG0o/3WptFp83d18aMtoZPP3bnsThjpTcnwDJN2gpvQ8HJ7AdN03
	Gm0F8OkDIh2ix0F61fka9LMBqMGKv9Gp2tOZXImDPGr4Oy1fNsJdxp59/Wj/2RCHF070
	CFjQ==
MIME-Version: 1.0
Received: by 10.220.150.16 with SMTP id w16mr17278031vcv.65.1343838088619;
	Wed, 01 Aug 2012 09:21:28 -0700 (PDT)
Received: by 10.58.231.106 with HTTP; Wed, 1 Aug 2012 09:21:28 -0700 (PDT)
In-Reply-To: <CADkTA4N_mFVkWx7G=E8BoCDYktkNXxO-zLrw_r9e0sO-wE5FjQ@mail.gmail.com>
References: <CALRxmdDhE8GQPYde27786kKU35p4dRrTmaGbmauVDxTrMQ6N6Q@mail.gmail.com>
	<50183924.8010309@windriver.com>
	<CADkTA4N_mFVkWx7G=E8BoCDYktkNXxO-zLrw_r9e0sO-wE5FjQ@mail.gmail.com>
Date: Wed, 1 Aug 2012 11:21:28 -0500
Message-ID: <CALRxmdDzaizHQ8m1NFRp2-Ucn9Pm6vZJX=pTTdZ5aLx-61OUzw@mail.gmail.com>
From: Stuart Yoder <b08248@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: static busybox?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Aug 2012 16:33:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jul 31, 2012 at 3:07 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Tue, Jul 31, 2012 at 3:59 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>> On 7/31/12 1:14 PM, Stuart Yoder wrote:
>>>
>>> We are doing some work with LXC (containers) and one of the templates
>>> is for busybox.  For LXC, the busybox package needs to be built statically
>>> and
>>> there is a config option for this.
>>>
>>> A couple possible approaches:
>>>
>>>     -create a new 'busybox_static' recipe that the lxc package
>>>      depends on that turns on the needed build options.   Pretty
>>>      straightforward, but now there are 2 variants of the busybox
>>>      package.
>>>
>>>     -somehow propagate some configuration options through to
>>>      the standard busybox recipe so it turns on the config
>>>      option to build things statically.   Not sure how to
>>>      do this, and seems like it could get pretty messy.
>>>
>>> Any thoughts?
>>
>>
>> We've been talking about this as well..  I'm currently of the opinion that
>> the kernel's config fragement processing be added to busybox.  This way
>> someone can simply add a configuration fragment via a bbappend, or other
>> approach and it'll pick it up.   That same can be used to specify how to
>> enable other optional pieces of busybox.
>
> merge_config.pl can be yanked out of the kernel source tree (it's upstream) and
> packaged as something for use by busy box.
>
> I wouldn't recommend all the scaffolding that the kernel has (it's
> overkill, since
> there are more configs, patches and git manipulations in play for the
> kernel), but a\
> simple scheme to collect the fragments from the SRC_URI and fire them through
> merge_config.pl would be a pretty simple python routine.

So how would this work from the user's point of view?   I somehow
need to get busybox's CONFIG_STATIC config option set.   Does the lxc
recipe somehow
specify this?   Or does the lxc recipe reference a busybox-static
dependency that sets the option?

Stuart


