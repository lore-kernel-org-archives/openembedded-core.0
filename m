Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id E24746D899
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 18:40:45 +0000 (UTC)
Received: by mail-la0-f50.google.com with SMTP id ec20so2818433lab.23
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 10:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=fVy2cJp08nYD5av6BFcljJkZZIgoKkfvC8JRCgLe8Lo=;
	b=ABSjzPJnsgdm/LaHVGsJUDt8MwBgkpFjwsJuXvnUmOI1OLXBLsCN2VpW5I+Avyg/zA
	dMUauvMKLJWDymenwfnpvERZKTWtnM/aoW4ej5Rc2X0SqzA6re0SPTxrEgFs40G9K0MN
	8XWJtJY2UfeTOOGKI4F0Rz0Z/VvW2TrsvFSsCJNYJgRdM62LWyFmlJQBoynkfRTFDAM7
	SZJgZc52BW/h0NAZLqrNKlNaY/RUjUJBW2ixcmHLUAe1cCUKHoXB2oiiZ0Og0IobBqcm
	KAa1Zcv9Kh4A3AHAJS24oX/cQ+ibh3ZlyAF5m83koIL2xfeaq3r4eGss/C743vVfam4Y
	zwrg==
MIME-Version: 1.0
X-Received: by 10.112.155.106 with SMTP id vv10mr1561760lbb.53.1389897645842; 
	Thu, 16 Jan 2014 10:40:45 -0800 (PST)
Received: by 10.112.77.170 with HTTP; Thu, 16 Jan 2014 10:40:45 -0800 (PST)
In-Reply-To: <A612847CFE53224C91B23E3A5B48BAC7A5548F1DCE@xmail3.se.axis.com>
References: <A612847CFE53224C91B23E3A5B48BAC7A5548F1DCE@xmail3.se.axis.com>
Date: Thu, 16 Jan 2014 13:40:45 -0500
Message-ID: <CADkTA4N45TUxbnEd8RD8B2v7BQbY2fOR5UWMfa53c9CCQEZCSA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Phil Blundell <philb@gnu.org>,
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
X-List-Received-Date: Thu, 16 Jan 2014 18:40:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jan 16, 2014 at 8:58 AM, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
> Background: Back in September, Richard made a commit to
> linux-libc-headers.inc describing why one should not fork the
> linux-libc-headers recipe:
>
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=babbf7a46acaefd9b36031483cafce053f607e66
>
> As a result I created a local bbclass for our layer called
> kernel-headers, which provides a recipe with kernel headers
> that match the actually used version of the Linux kernel.
> This was needed for packages that need to access hardware
> specific features that are not present in the generic kernel
> headers provided by linux-libc-headers.
>
> My intention for this class was that it should be generic
> enough to be able to upstream it to OE Core.
>
> Now, the other day a colleague of mine had a build failure due
> to this class. It turned out that even though the class adds a
> dependency on virtual/kernel and then uses the files that are
> installed to ${STAGING_KERNEL_DIR} when running oe_runmake
> headers_install, the command could fail because the
> ${STAGING_KERNEL_DIR}/scripts was not populated. After asking
> Richard about this, I learned that this is due to problems
> with the sstate cache and not knowing whether a 32 bit host or
> a 64 bit host was used to generate the files. Thus I also
> learned that the scripts are actually built as a result of
> building modules.
>
> Since I did not want my class to depend on modules having been
> built, I looked into modules.bbclass and modules-base.bbclass.
> There I found the function do_make_scripts() which is
> responsible for building  the kernel scripts. However, the
> current setup doesn't lend itself very well to use the
> modules-base.bbclass for something other than modules.
>
> My idea then was to break this part out into a separate class,
> kernel-scripts, which I did. You can find both the
> kernel-scripts and kernel-headers classes here:
>
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=pkj/kernel-headers
>
> When I showed this to Richard he noted that my change was not
> backwards compatible (as I no longer provide the
> do_make_scripts() function from the module-base.bbclass).
> However, there is nothing besides module.bbclass in OE Core
> and meta-oe that use the module-base.bbclass.
>
> Anyway, I made a modified version that does maintain backwards
> compatibility for module-base.bbclass here:
>
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=pkj/kernel-headers-backwards-compatible
>
> This time Richard complained about the extra class
> (kernel-scripts-base.bbclass), and noted that there was no
> way to win... He then suggested that I take the question of
> whether we need to maintain backwards compatibility for
> modules-base.bbclass to the mailing list.

FWIW: I agree that have to many small, single purpose
kernel-*.bbclasses is a pain,
since it provides granularity, but more opportunity for varying behaviour during
kernel builds.

I have uses of the module-base.bbclass and an expectation that it will generate
the scripts, largely around the SDK and some custom kernel recipes. So they
only inherit module.bbclass, and would be impacted if that functionality was
changed to require another inherit.

Speaking of that, we through something like this late last year with
automatically
restoring the scripts into the sysroot, which ended up being reverted:

see b2c948d56241ff7cdea2e9e68b740f305c72f5ca in oe-core

At least the module (and your scripts) class avoid the sstate problems and
compiler dependencies that we hit with that solution.

What are the alternatives to more classes, isn't this something that could be
a .inc routine ? And modules simply includes it, and you can do the same ..
but I suppose a .inc versus a class inherit is largely semantics in
the difference.

bottom line, my rambling says that backwards compatibility matters here, and
that if we can avoid a new class, that would also be a good thing.

Cheers,

Bruce

>
> So, here I am now. I do not know who else use the
> do_make_scripts() function from module-base.bbclass and in what
> way, and whether restructuring the functionality into the new
> kernel-scripts.bbclass without maintaining backwards
> compatibility would be a problem. If you know anything about
> this, please let me know.



>
> Any comments appreciated.
>
> //Peter
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

