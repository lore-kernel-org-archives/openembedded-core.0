Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id E889B6AF54
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 18:07:38 +0000 (UTC)
Received: by mail-lb0-f169.google.com with SMTP id q8so3234458lbi.14
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 10:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=qaqN/VznEPH5DLeid7ieiVTr9GWTINHAYMj6C2LZUV0=;
	b=sX/XzazcxMcadUJ2rvMBznGE1GNQ1vzpGWmHw0sX/HcwhItDMJP03nEFPLrg/cSAzU
	piDddjIPSgLvLSbubBCbps8bofGWXd6m23/LTw5Sj++Wkc0R/m0N5CBSE9ce8eeM/9Ch
	Yf5SXvcPBKD4rZxFwE9f/M12Zti103NtZPaa9hzYhWef9U6eWHmdqrBTlht1JgCpTVtb
	66BKXhRX8UfqaiaTCV4wJcqn3P6ylfG1i8akDjGWJQ+kGKt4mt/5ZBzzowyryzATIP5C
	U+c1ud2koUbZ2n2VcquVEkQ6EQIzCs8zLNhk1f/SCZ0DyTYuceWX4nCRAeS4EBiX4wrG
	H4eQ==
MIME-Version: 1.0
X-Received: by 10.112.14.34 with SMTP id m2mr1688280lbc.13.1389982059009; Fri,
	17 Jan 2014 10:07:39 -0800 (PST)
Received: by 10.112.77.170 with HTTP; Fri, 17 Jan 2014 10:07:38 -0800 (PST)
In-Reply-To: <A612847CFE53224C91B23E3A5B48BAC7A5548F20DF@xmail3.se.axis.com>
References: <A612847CFE53224C91B23E3A5B48BAC7A5548F1DCE@xmail3.se.axis.com>
	<CADkTA4N45TUxbnEd8RD8B2v7BQbY2fOR5UWMfa53c9CCQEZCSA@mail.gmail.com>
	<A612847CFE53224C91B23E3A5B48BAC7A5548F20DF@xmail3.se.axis.com>
Date: Fri, 17 Jan 2014 13:07:38 -0500
Message-ID: <CADkTA4PtaD3S_b6ozKmKs8ADiVTRyia=bjy4iCQQcFdA1RhSGA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	"OE Core \(openembedded-core@lists.openembedded.org\)"
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Maintain backwards compatibility or not for module-base.bbclass
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
X-List-Received-Date: Fri, 17 Jan 2014 18:07:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jan 17, 2014 at 8:53 AM, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
> I will aggregate my responses to Koen, Bruce and Phil below.
>
>> -----Original Message-----
>> From: Koen Kooi [mailto:koen@dominion.thruhere.net]
>> Sent: den 16 januari 2014 20:19
>> To: Peter Kjellerstedt

[snip]

>>
>> On Thu, Jan 16, 2014 at 8:58 AM, Peter Kjellerstedt
>> <peter.kjellerstedt@axis.com> wrote:
>> > Anyway, I made a modified version that does maintain backwards
>> > compatibility for module-base.bbclass here:
>> >
>> > http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=pkj/kernel-headers-backwards-compatible
>> >
>> > This time Richard complained about the extra class
>> > (kernel-scripts-base.bbclass), and noted that there was no
>> > way to win... He then suggested that I take the question of
>> > whether we need to maintain backwards compatibility for
>> > modules-base.bbclass to the mailing list.
>>
>> FWIW: I agree that have to many small, single purpose
>> kernel-*.bbclasses is a pain, since it provides granularity, but
>> more opportunity for varying behaviour during kernel builds.
>>
>> I have uses of the module-base.bbclass and an expectation that it
>> will generate the scripts, largely around the SDK and some custom
>> kernel recipes. So they only inherit module.bbclass, and would be
>> impacted if that functionality was changed to require another inherit.
>
> As long as they inherit module (and not add task dependencies on
> do_make_scripts) they should not be affected. It is only if you
> inherit module-base directly and expect the do_make_scripts()
> function to exist that you are affected.

I've seen some direct inherits of module-base, and even one that
referenced the task (to ensure that recordmcount and friends
were in place before using them).

>
>> Speaking of that, we through something like this late last year
>> with automatically restoring the scripts into the sysroot, which
>> ended up being reverted:
>>
>> see b2c948d56241ff7cdea2e9e68b740f305c72f5ca in oe-core
>>
>> At least the module (and your scripts) class avoid the sstate
>> problems and compiler dependencies that we hit with that solution.
>
> Interesting. It looks like it would have been a good solution
> if it had worked...

It worked :) But it introduced complexity when building from sstate,
since the compiler was required to restore them, which meant that
the sstate builds had to depend on gcc, which sort of defeats the
purpose of a quick sstate startup and build .. so we decided to abandon
it and educate people to include module-base.

>
>> What are the alternatives to more classes, isn't this something
>> that could be a .inc routine ? And modules simply includes it, and
>> you can do the same .. but I suppose a .inc versus a class inherit
>> is largely semantics in the difference.
>
> Tbh, I think keeping it as a class makes it more straight forward.
> And class or include file is merely semantics.

Agreed. It really wouldn't help.

>
>> bottom line, my rambling says that backwards compatibility matters
>> here, and that if we can avoid a new class, that would also be a
>> good thing.
>
> But I think that it should be easy enough for any external party
> to adopt to the new class if they do indeed have a direct
> dependency on module-base and expecting to find do_make_scripts()
> there. It is not like we would change it in the middle of Dora
> anyway. Thus I advocate for the change above on the kernel-headers
> branch that does not maintain backwards compatibility.

I think we all agree that it really isn't a hard thing to switch (just as in
the examples I sited, it wouldn't be that hard to fix them), it comes down
to more of a perception thing about how often a layer needs to be adapted
to a changing core structure. Developers understand changing interfaces,
customers and larger companies .. not so much (but I'm stating what we
all know).

So in the end, the question is the extra class "clutter" versus compatibility.
I lean towards the extra class with the compatibility maintained .. but I'm
not adamant about the issue :)

Cheers,

Bruce

>
>> Cheers,
>>
>> Bruce
>
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Phil Blundell
>> Sent: den 16 januari 2014 22:39
>> To: Peter Kjellerstedt
>> Cc: OE Core (openembedded-core@lists.openembedded.org)
>> Subject: Re: [OE-core] RFC: Maintain backwards compatibility or not for
>> module-base.bbclass
>>
>> On Thu, 2014-01-16 at 14:58 +0100, Peter Kjellerstedt wrote:
>> > So, here I am now. I do not know who else use the
>> > do_make_scripts() function from module-base.bbclass and in what
>> > way, and whether restructuring the functionality into the new
>> > kernel-scripts.bbclass without maintaining backwards
>> > compatibility would be a problem. If you know anything about
>> > this, please let me know.
>>
>> I'm not entirely clear why you couldn't maintain compatibility
>> by moving the task in question to a new class but keeping its
>> name the same (i.e. refrain from renaming "do_make_scripts" to
>> "do_kernel_scripts") and having module-base.bbclass simply
>> inherit the newly-added class.  That seems like it ought to be
>> fairly straightforward and uncontroversial.
>
> Well, that is basically what my backwards compatible branch above
> does. However, it introduces two new classes since it needs to
> maintain the split between where the addtask is done and the
> actual function.
>
>> That said, though, I don't think there is any pressing need to
>> maintain backwards compatibility around module-base.bbclass.  In
>> fact, I think it would probably be fine for module-base.bbclass
>> to simply go away altogether and have its functionality subsumed
>> into module.bbclass; the split between those two classes is
>> mostly a relic of yesteryear and I can't think of any good
>> purpose that it serves nowadays.  So I would be happy enough to
>> see that (and the tangly mess that is the kernel classes in
>> general) cleaned up irrespective of what happens with
>> do_make_scripts.
>
> I won't argue with that. However, I do not feel that I am
> comfortable enough about these classes to do it. I had a quick
> look around in OE core, and I believe you are right. The number
> of references to "module-base" were limited, and in most cases
> it should just be a matter of replacing them with "module".
>
>> p.
>
> //Peter
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

