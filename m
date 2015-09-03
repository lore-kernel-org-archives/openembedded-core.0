Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 3A1E277002
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 11:50:20 +0000 (UTC)
Received: by ioiz6 with SMTP id z6so54403328ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Sep 2015 04:50:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=hewY7FCw0XtKjr7qWIg4yyJftdnFkQk2ahUNGHCrgx4=;
	b=jDTUEJzF4uxwJgDWhdFQBQfsBB1yMETohglcVP6Sv4pLKCzcWcc4psOT/mRQtkKfAD
	KHR/52Uj9CNeHU9mZ5GOhhOh/nWQ88FqvzCDt9MXq/WT7MKSp6ZtGV9/IQPmPJ0CEcfn
	QXH9Kdb6jNjV1MKGYlnLNR50v5x9BW91xCHwZwS2PGyBShkMhrHJ2Kz6IM/IKbmmGnmu
	fzAbchkE9CAraQIsiOvnoUARw4MXV5XEzqFtWgwQ1AA+sNIR9/WZRIPksjf/4lX7MuFu
	3ta7rrT/k2aZAs2MjPubcAO1m3+ult/MNmOyfgf5V8CfcxUBSXXBmYZ9MPEPCpsgRIWY
	7rfg==
X-Gm-Message-State: ALoCoQlA5axbNRWx+mJBKNJO6S56Er6nKpfUDgV8VhTCVHgs7QP4eEZ8j+JZBvR0y0yswIHpMBMA
X-Received: by 10.107.10.11 with SMTP id u11mr15085997ioi.36.1441281021136;
	Thu, 03 Sep 2015 04:50:21 -0700 (PDT)
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com.
	[209.85.213.173])
	by smtp.gmail.com with ESMTPSA id 10sm5417079ios.28.2015.09.03.04.50.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Sep 2015 04:50:19 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igcpb10 with SMTP id pb10so12143768igc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Sep 2015 04:50:19 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.72.19 with SMTP id z19mr11667938igu.19.1441281019287;
	Thu, 03 Sep 2015 04:50:19 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Thu, 3 Sep 2015 04:50:19 -0700 (PDT)
In-Reply-To: <1441262218.9573.12.camel@intel.com>
References: <cover.1441207840.git.patrick.ohly@intel.com>
	<3b40bb267aa67a9c7adae08713d85060129a219b.1441207840.git.patrick.ohly@intel.com>
	<e0cab1af2f3fa08d0a4d202c65fae83a927e1567.1441207840.git.patrick.ohly@intel.com>
	<CAP9ODKrCzcUdfs9+GLsSe-ztS3c5BCmcLBPdmSayw-y9ZzPtkA@mail.gmail.com>
	<1441262218.9573.12.camel@intel.com>
Date: Thu, 3 Sep 2015 08:50:19 -0300
Message-ID: <CAP9ODKoq3ahts8_0WA4K=w=oKhKMhyDB05Zr=6KBQyaA78t3hw@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/10] initramfs-framework: add separate init_verbose log level parameter
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
X-List-Received-Date: Thu, 03 Sep 2015 11:50:21 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 3, 2015 at 3:36 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> On Wed, 2015-09-02 at 13:16 -0300, Otavio Salvador wrote:
>> On Wed, Sep 2, 2015 at 12:48 PM, Patrick Ohly <patrick.ohly@intel.com> wrote:
>> > Using the general purpose "debug" and "verbose" kernel parameters to
>> > increase logging in the init script has the disadvantage that it
>> > also increases logging in other components, making the output hard
>> > to read (in particular with "debug").
>> >
>> > The new init_verbose parameter only affects the init script:
>> >   init_verbose, init_verbose=1, init_verbose=true: enable just some info messages
>> >   init_verbose=2: debug messages
>> >
>> > Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
>> > ---
>> >  meta/recipes-core/initrdscripts/initramfs-framework/init | 16 ++++++++++++++--
>> >  1 file changed, 14 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/init b/meta/recipes-core/initrdscripts/initramfs-framework/init
>> > index e8f4713..cd55ee2 100755
>> > --- a/meta/recipes-core/initrdscripts/initramfs-framework/init
>> > +++ b/meta/recipes-core/initrdscripts/initramfs-framework/init
>> > @@ -14,6 +14,13 @@
>> >  # 'foo=value' as 'bootparam_foo=value'
>> >  # 'foo' as 'bootparam_foo=true'
>> >  # 'foo.bar[=value] as 'foo_bar=[value|true]'
>> > +#
>> > +# Special boot parameters always recognized by initramfs-framework (see modules
>> > +# like "debug" for additional ones):
>> > +# debug: enable debug logging (beware, also enables debug output in other system components)
>> > +# verbose: similar do debug, just less output
>> > +# init_verbose[=true|1|2]: same output as for verbose when no value or true/1 are given,
>> > +#                          same as debug for 2 - only affects logging in initramfs-framework
>>
>> I personally don't see much benefit on this. The debug module is the
>> one used to debug the initramfs-framework script. If we ought to add
>> support for something like this, this should be done there.
>
> So you are saying that the msg/info/debug/fatal functions should be in
> the "debug" module? Or should they be present, but changing the logging
> level should be done by the "debug" module? How would logging work
> before the "debug" module is loaded or when it is not installed at all
> (as in a production image)?
>
> I guess one could have empty stubs in the main "init" and only do
> logging after loading the debug module - that should work, at the loss
> of early log output.

I think we can use the init-verbose and init-debug params but I would
like to see them setting the bootparam_verbose and bootparam_debug so
the init module handles it.

I am not sure if we ought to have this outside of debug module though...

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

