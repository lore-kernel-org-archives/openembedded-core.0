Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id DF906602D9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 18:51:55 +0000 (UTC)
Received: by mail-ob0-f174.google.com with SMTP id fz5so90341074obc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 10:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=+jLi37A7DVebmFyUeu2FJwpF7DNhRPjP7teHxwodfec=;
	b=X8O1j/agXkMctY9PKModHzVavOuoL9ehjqI+S5dG346W2lZ3f4RnF618WAoXxIx/fr
	axy9hiqB1kAyaxL/k/rYzp6NPQxdk6ssCP09xEmhKKdiwJp5fz/lkw7v1JdekWdmc/IT
	gpEgGR8SbaCJ5tym+ea1GdryBFusrwsKpNBhvxgIHLKQil4IF7xnGJpJ2OCTUJ61XTX2
	sqkI7sG35DKEVGCWlrEm9il6n62pIumTbRzjbTtjLN12k31qIEC3h07/Fip2zNy1UjP1
	mh60IQ5gikFar2/bPUTiEe1iE7PsZr1dDzJtZBTJxqnpyptmtNqvpUOgmq1lVHCBLZU8
	waWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=+jLi37A7DVebmFyUeu2FJwpF7DNhRPjP7teHxwodfec=;
	b=YPA2MtlyZgrDeuBNiTEux3LAY4wGw2MzexWSlm6iOwG6zPRBUopp3AenFM5RaMKnvI
	lf+sNyKKu3/3e2chBshapoAUXfZq4vutKHRRITBFwtUKgBHvBZ0ckd5JGodcIBIpnwcf
	cEqV1EFs8Ugd/yZj5PusCb91F1Ypyn26rEq8PQOYaIA98ur9/jefqhGMR31Pyc0dYtPs
	hoXItS/MG/Y8pMPonTIEkx03dAqd5yZu9yjcQycSv8bFXlYPHNw9E0FU/XJrYBCs0hVC
	5qvFhDTOi1vGPWCHQIxSEe9EkCQdU8KikaJLfKVNhEM0K06d2OPE/3845rnJl7lqnkXZ
	0/FA==
X-Gm-Message-State: AD7BkJIOIrO1xv6+7iQspcc63a5WeO5OX9Uj78F1vgzwSMgww0PHJADZT1WCcjx6i3zHQ7nzyxyjDxNcFaSbOg==
MIME-Version: 1.0
X-Received: by 10.60.150.163 with SMTP id uj3mr3031513oeb.67.1457635916290;
	Thu, 10 Mar 2016 10:51:56 -0800 (PST)
Received: by 10.182.50.196 with HTTP; Thu, 10 Mar 2016 10:51:56 -0800 (PST)
In-Reply-To: <56E19A2B.60002@mlbassoc.com>
References: <56E1028C.6080605@mlbassoc.com>
	<E219D57B-2F63-40DE-9C33-161AE6F738CC@gmail.com>
	<56E19A2B.60002@mlbassoc.com>
Date: Thu, 10 Mar 2016 10:51:56 -0800
Message-ID: <CAOLEWZUzHr6juwASEUGrkvzTMmaxf_PTer=S9CyXRtNpNY3v-Q@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: Re: Problems with perl 5.22
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
X-List-Received-Date: Thu, 10 Mar 2016 18:51:57 -0000
Content-Type: text/plain; charset=UTF-8

As another point of information, I'm having similar issue with perl
5.22.1 on some arm boxes (native Gentoo builds) and even some odd
build differences between amd box and intel corei5 9 (I know,
weird...).

The issue I'm hitting is basically a horribly broken upstream
Configure script, and in my case it misdetects some libc functions as
"not available" and substitutes even more horribly broken replacement
functions.  Hacking the resulting config file *after* configure makes
it build successfully; seems to run okay but I'm not trying anything
like amanda to actually test it.

Like I said, it doesn't sound like your description but please
check/fix these two defines, or any others that are incorrect; this is
my ebuild post-configure hack:

sed -i \
                -e "s|d_fork='undef'|d_fork='define'|" \
                -e "s|d_memcpy='undef'|d_memcpy='define'|" \
                        "${S}"/config.sh

Steve

On Thu, Mar 10, 2016 at 8:00 AM, Gary Thomas <gary@mlbassoc.com> wrote:
> On 2016-03-10 16:54, Jens Rehsack wrote:
>>
>>
>>> Am 10.03.2016 um 06:13 schrieb Gary Thomas <gary@mlbassoc.com>:
>>>
>>> I'm working on a package (amanda - the Advanced Maryland Archiving
>>> system) that is written heavily in perl with swig interfaces to C.
>>> This code ran great until the update to perl 5.22; it now dies a
>>> horrible death on almost every activity.  These failures seem to
>>> always be in the swig generated wrappers, but that may just be
>>> where most of the work gets done.
>>>
>>> I've narrowed this down to exactly the change to perl 5.22 from
>>> 5.20. Using bisect as well as experimentation (e.g. trying all
>>> the compiler combinations that have occurred since a last good
>>> version) and I can go from working to failing by only the change
>>> in perl.
>>>
>>> The interesting (scary) thing is that I've built amanda for my
>>> target natively on my board running debian, including perl 5.22.
>>> This means I can't say definitively  that perl 5.22 is the culprit
>>> as on debian it runs fine.  So, it's got something to do with the
>>> OE environment/porting/packaging of perl and not just the revision.
>>>
>>> I've also tested this on multiple architectures (ARM, PowerPC) with
>>> the same results - with perl 5.20 amanda works, with perl 5.22 it fails.
>>>
>>> I've compared the actual 5.22.1 sources used by OE-core and debian
>>> and they are subtly different, although I can't pinpoint any change
>>> that might be responsible.
>>>
>>> For the moment, I can just fall back to perl 5.20 for my target
>>> that needs to run amanda, but this isn't a real solution (e.g.
>>> in this state I can't propose my recipe to any layer as it's
>>> totally broken with the current OE-core).  I'd like to see this
>>> fixed but the amanda code (swig wrappers) are horribly complex
>>> which makes debugging quite the challenge, not to mention they
>>> may be about the only way to uncover the bug, whether it's in
>>> amanda or perl.
>>>
>>> Any suggestions on how to move forward?
>>
>>
>> Since I have no clue what's wrong and how it fails (backtrace
>> would point in some directions), several ideas might work:
>
>
> The problem here is that the failures happen in the swig generated
> files which are very difficult to debug (and don't really track
> in the -dbg packages)
>
>>
>> How clean is your build location (we realize that often between
>> updates some files remain in our target images until we wipe
>> tmp/ - cleansstate for image doesn't help ...)?
>
>
> 100% clean, I've started from scratch many times
>
>>
>> Did you prove the library path's of your *.so's? Perl does
>> almost everything within libperl.so - build against wrong version
>> causes in weird crashes (scan DBI mailing list for admin's
>> build issues of DBI on AIX/HP-UX ...).
>
>
> As I said, this all works fine when I build [from scratch] with
> perl-5.20 and not [from scratch] with perl 5.22
>
>>
>> Maybe share your recipe can help to reproduce the problem
>> elsewhere and debug locally.
>>
>
> I'd be happy to share, perhaps privately if you're inclined?
> It's a complicated setup and testing can be a bit tedious, but
> I'm happy for any help.
>
>
> --
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

