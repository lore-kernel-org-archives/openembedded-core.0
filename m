Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id CAD2C65CBC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 11:41:29 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20160510114127196_0684;
	Tue, 10 May 2016 11:41:27 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=48373 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1b0643-0004LT-53; Tue, 10 May 2016 07:42:59 -0400
Date: Tue, 10 May 2016 07:40:54 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Bruce Ashfield <bruce.ashfield@gmail.com>
In-Reply-To: <CADkTA4PzYTZhbgm0g=wnjfoK0hEDiDKKWqU7PePb=BxnerAXaw@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1605100727170.9001@localhost.localdomain>
References: <alpine.LFD.2.20.1605090630480.21387@localhost.localdomain>
	<CADkTA4PzYTZhbgm0g=wnjfoK0hEDiDKKWqU7PePb=BxnerAXaw@mail.gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: should a SRC_URI referring to "rday.cfg" look for "rday.scc"?
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
X-List-Received-Date: Tue, 10 May 2016 11:41:31 -0000
Content-Type: multipart/mixed; BOUNDARY="8323328-1217817466-1462880456=:9001"

--8323328-1217817466-1462880456=:9001
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 9 May 2016, Bruce Ashfield wrote:

> On Mon, May 9, 2016 at 6:39 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>         (aside: this is with wind river linux 8 and i dropped bruce a note
>       about it, but i really should keep this stuff on the mailing list.)
>
>         not sure if this is a WRL issue, or more general OE or YP issue, but
>       i was doing a kernel config yesterday, and my SRC_URI included, say,
>       "rday.scc", which incorporated both kernel config fragments and
>       patches, and that worked fine.
>
>         eventually, after massive refactoring, all that was left of that
>       item was some kernel configuration which was already in "rday.cfg", so
>       i edited SRC_URI and replaced "rday.scc" with "rday.cfg", but i left
>       that old "rday.scc" in that directory (with its referent patches),
>       assuming it would be ignored.
>
>         did a clean and configure and got:
>
>         | DEBUG: Executing shell function do_kernel_metadata
>       | ERROR: could not find patch rday.patch, included from
>       .../rday.scc ...
>
>         it *appears* that, even though SRC_URI now refers to (among other
>       things) just "rday.cfg", it looks like the configure step is *still*
>       trying to process "rday.scc", which contains a reference to a now
>       non-existent patch, hence the failure.
>
>         if i just remove (or rename) "rday.scc", then things work fine. is
>       this expected behaviour? is there some reason that if SRC_URI
>       includes, say "derf.cfg", the configuration will automatically look
>       for and try to process "derf.scc"? or am i just doing something silly?
>
>
> There's no automatic inclusions like that. Take a look at your
> meta-series and see if there's an explicit reference to the .scc
> file.
>
> Otherwise, I'll have to try and reproduce it here.

  ah, i just tripped over this again, and here's what's happening. i'm
using overrides to define SRC_URI items in machine-specific
directories, and that works fine, and if i change, say, the .scc or
.cfg files, then do a kernel clean operation and configure again, any
changes i made will be recognized and processed. so far, so good.

  however, i just realized that a related set of SRC_URI files:

  * uio.scc
  * uio.cfg
  * uio.patch

actually apply to *all* my target boards, so i moved those files up
one directory level to be picked up for all builds.

  the SRC_URI reference to this is unchanged, still contains:

SRC_URI += " \
        ... snip ...
        file://uio.scc \
        ... snip ...

but (obviously) the search should *now* find that file in the
general kernel version directory, rather than the board-specific
directory it was in before. not so:

[INFO] Sanitizing .kernel-meta/cfg/mpc8360/kernel_baseline.cfg
[INFO] Sanitizing .kernel-meta/cfg/mpc8360/serial_ucc_uart.cfg
[INFO] Sanitizing .kernel-meta/cfg/uio.cfg
[ERROR] Kern frag .kernel-meta/cfg/uio.cfg does not exist

  it seems that once the configuration process locates the SRC_URI
items the first time, it caches(?) their location, so any *changes*
you make will be picked, but you can't *move* them, even to another
location where they would normally be found based on FILESPATH.

  so ... simple question, what's the command to clear that memory if i
move a SRC_URI item? i did verify that if i *completely* remove the
build directory and start from scratch, then (predictably) it works
fine.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323328-1217817466-1462880456=:9001--
