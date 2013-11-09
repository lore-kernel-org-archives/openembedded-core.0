Return-Path: <andrea.adami@gmail.com>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id 584B56CC4F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Nov 2013 23:58:04 +0000 (UTC)
Received: by mail-lb0-f175.google.com with SMTP id z5so2381952lbh.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Nov 2013 15:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=KilWcoA+/eSTixnekabLUyi79n3S9Ouk/opxuh8CpEg=;
	b=VFolVltTL7O+kKn/H8jIb12LnRtmgcm6wycMGvZI6uqre0GWB4+d3X0T17CSBTSz1c
	pWLIJIiT61nqLWtqc9pU1LA61PrrGVy058Z1RZ38m6rTH9v/+j8o+rJYV72IrUE9uY0x
	0mkp44U98y22vXwKAii29h4wHrOMgCybTi2sV5xUCLYzGSu+Le10Wb68H0jDyox9Y0RZ
	/e8l4tWQxW4IkTfjsP1DIAbJAIG03JDvqgn5/hD/vgL+9IwcU78ry7cUUS8GlYhAINIb
	T3xkfOuAJMXZVx5YOaVzxojBSJQiLs3Vv4IoYXMEMZcU2P0h2nnadVipALUo4ocDxiiS
	5qeg==
MIME-Version: 1.0
X-Received: by 10.112.52.33 with SMTP id q1mr32322lbo.30.1384041484883; Sat,
	09 Nov 2013 15:58:04 -0800 (PST)
Received: by 10.112.52.74 with HTTP; Sat, 9 Nov 2013 15:58:04 -0800 (PST)
In-Reply-To: <1384037562.22454.0.camel@ted>
References: <1383923945.2345.5.camel@ted> <527D067C.6040709@windriver.com>
	<CAAQYJAsV5rBzNpPneh5TAh5t1RoV_EeDrKGFp2qP3q=o7XsqdA@mail.gmail.com>
	<1384037562.22454.0.camel@ted>
Date: Sun, 10 Nov 2013 00:58:04 +0100
Message-ID: <CAAQYJAthKjkYj+wK6MphLZmTuYrnxiVnxGsmHN3ddeeD+35sfQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "Hart, Darren" <darren.hart@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lib/oe/path: Fix performance issue got copyhardlinktree()
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
X-List-Received-Date: Sat, 09 Nov 2013 23:58:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Nov 9, 2013 at 11:52 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sat, 2013-11-09 at 21:43 +0100, Andrea Adami wrote:
>> On Fri, Nov 8, 2013 at 4:42 PM, Bruce Ashfield
>> <bruce.ashfield@windriver.com> wrote:
>> > On 13-11-08 10:19 AM, Richard Purdie wrote:
>> >>
>> >> With the directory copy was added to avoid race issues, it wasn't noticed
>> >> that
>> >> tar was recursing the directories and copying files too. This is
>> >> completely
>> >> crazy when we hardlink those files in the next command.
>> >>
>> >> Resolve the issue by telling tar not to recurse. This gives a significant
>> >> performance boost to various parts of the system (do_package for
>> >> linux-yocto
>> >> 256s -> 178s for example).
>> >
>> >
>> > Every second makes a difference in this beast .. when adding up a
>> > zillion package runs a week. :)
>> >
>> > Cheers,
>> >
>> > Bruce
>> >
>> >
>> >>
>> >> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> >> ---
>> >> diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
>> >> index 1310e38..d0588ba 100644
>> >> --- a/meta/lib/oe/path.py
>> >> +++ b/meta/lib/oe/path.py
>> >> @@ -93,7 +93,7 @@ def copyhardlinktree(src, dst):
>> >>       if (os.stat(src).st_dev ==  os.stat(dst).st_dev):
>> >>           # Need to copy directories only with tar first since cp will
>> >> error if two
>> >>           # writers try and create a directory at the same time
>> >> -        cmd = 'cd %s; find . -type d -print | tar -cf - -C %s -p
>> >> --files-from - | tar -xf - -C %s' % (src, src, dst)
>> >> +        cmd = 'cd %s; find . -type d -print | tar -cf - -C %s -p
>> >> --files-from - --no-recursion | tar -xf - -C %s' % (src, src, dst)
>> >>           check_output(cmd, shell=True, stderr=subprocess.STDOUT)
>> >>           if os.path.isdir(src):
>> >>               src = src + "/*"
>> >>
>> >>
>> >
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>> After this patch do_populate_sysroot fails:
>
> This should fix it:
>
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t2&id=5237c8e2c1780983c000247ffa0c890b4bb5980a
>
> Cheers,
>
> Richard
>

Yes, thx for the magic fix.
Now with all the last patches my results are much better:

do_install:
Elapsed time: 83.77 seconds CPU usage: 3.0% (worst before 131s)
(avg before:103 seconds CPU usage: 2.9%)

do_populate_sysroot:
Elapsed time: 16.12 seconds CPU usage: 18.5%
(avg before: 95 seconds CPU usage: 6.5%)

Cheers

Andrea

