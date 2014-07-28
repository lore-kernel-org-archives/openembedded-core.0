Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A47027089C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 17:39:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6SHdUR3026944
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 10:39:30 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Mon, 28 Jul 2014 10:39:30 -0700
Message-ID: <53D68AD1.2010401@windriver.com>
Date: Mon, 28 Jul 2014 12:39:29 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>, "Seebach, Peter"
	<Peter.Seebach@windriver.com>
References: <lymwbtto1t.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <lymwbtto1t.fsf@ensc-virt.intern.sigma-chemnitz.de>
Subject: Re: PSEUDO - SELinux support
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
X-List-Received-Date: Mon, 28 Jul 2014 17:39:34 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/28/14, 12:01 PM, Enrico Scholz wrote:
> [ https://bugzilla.yoctoproject.org/show_bug.cgi?id=6580 ]
>
> Hi,
>
> after upgrade to recent pseudo 1.6+, oe-core stops to build as a
> confined SELinux now.  This happens because SELinux provides more
> than the xattr file api and 'pseudo' does not intercept e.g. writing
> into '/proc/self/attr/fscreate'.

The issue is that there are two ways to set the selinux values.  One is via 
xattr, which we do capture in pseudo -- specifically to allow components to set 
xattrs [including security attributes].  The other is via some random proc file 
entry.  This was previously unknown to me.  There is a slight chance we can 
attempt to capture access to that file as well and act on it within the pseudo 
context.  (This may be more difficult though.)

> IMO, turning off every SELinux related operation in do_install() (which
> is wrapped by 'pseudo') is a clean way to fix and improve building.  If
> OE supports SELinux for targets sometime, the file relabeling should be
> done in do_rootfs() by using a chroot aware 'restorecon' (e.g. which
> reads the file context policy from the chroot but not from system wide
> /etc/selinux).

My feeling is that the security contexts set when pseudo is running should never 
make it to the 'real' filesystem, and should only be stored internally.

If we have programs that are setting security contexts on the system, as a 
host-tool -- this will end up being host-contamination as well.

As for the restorecon, there are otherways of setting security contexts as well. 
  Look at the 'Tizen' smack stuff as an example.  During the package installs 
they run through a series of rpm(4) plugins that evaluate what was installed and 
assign an appropriate security context.  While these are not selinux contexts, 
the interface is similar.

> Unfortunately, I do not know a way to make applications think they are
> running without SELinux.  But patching 'pseudo' to return faked values
> for 'is_selinux_enabled()' seems to be a good solution.

This could work, but I think it's only part of the solution.  We need to tell 
applications to stop spewing contexts that have nothing to do with the (virtual) 
filesystem we're working with.  We also need to get a reasonable way to make 
sure pseudo is capturing all of the contexts it can.

My other concern with the is_selinux_enabled is that it's not an API within the 
libc functions.  So would defining this cause any issues?  I'm not sure either way.

At a minimum, telling a pseudo running session that selinux is not enabled (at 
the host level) is probably the correct behavior.

Intercepting xattr is needed, and potentially access to the special proc files 
may also be needed... [once we intercept though, what do we do with the data?]

> Bug #6580 mentioned at the beginning contains some discussion and a
> patch.  What do other people think about it?

We definitely need input on this for people's use cases so that we can come up 
with a reasonable solution.

As mentioned in the bug, pseudo was not originally designed to work in any type 
of selinux enforcing mode.  If it happened to work, great -- but we didn't do 
any engineering there.  We knew that some levels of selinux support and grsec 
support would cause pseudo to not be able to LD_PRELOAD, which would fail.

The recommendation has always been to put your build machines behind a firewall, 
and put selinux into permissive mode (or disable it).  But if we can try to make 
the level of accidental functionality continue to work, I'm all for it.

--Mark


