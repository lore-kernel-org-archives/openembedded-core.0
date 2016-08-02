Return-Path: <seebs@seebs.net>
Received: from mail.plethora.net (mail.plethora.net [184.173.250.112])
	by mail.openembedded.org (Postfix) with ESMTP id 315976E660
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2016 03:39:57 +0000 (UTC)
Received: from [10.10.10.132] (home.seebs.net [74.122.98.108])
	by mail.plethora.net (Postfix) with ESMTPSA id BA4A4C495D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 22:39:58 -0500 (CDT)
From: Seebs <seebs@seebs.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 01 Aug 2016 22:39:57 -0500
Message-ID: <4EB298F7-9562-43AC-B87A-82E32D429705@seebs.net>
In-Reply-To: <0d7860ce-f28b-a019-d5e5-6c4d3af0e513@windriver.com>
References: <577B8AA9.5040808@windriver.com>
	<dc216358-8a1f-1490-2fc0-db22f98741c3@windriver.com>
	<579B07F9.9000708@windriver.com>
	<B3108E03-1852-4237-8320-E2BFEC66F9B3@seebs.net>
	<579EE4BB.6070709@windriver.com>
	<F5BAFB71-1FCC-4F9D-999C-5960E8CD7213@seebs.net>
	<579F0EE8.3080009@windriver.com>
	<39329191-8DC4-43B6-9B38-5AD173C8F0DC@seebs.net>
	<1470081674.9142.108.camel@linuxfoundation.org>
	<BDA8434F-AE7B-4D8D-B6C3-2D4ED599E9E8@seebs.net>
	<1470092106.9142.113.camel@linuxfoundation.org>
	<0d7860ce-f28b-a019-d5e5-6c4d3af0e513@windriver.com>
MIME-Version: 1.0
X-Mailer: MailMate (1.9.4r5234)
Subject: Re: About pseudo's chmod
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
X-List-Received-Date: Tue, 02 Aug 2016 03:39:58 -0000
Content-Type: text/plain; format=flowed

On 1 Aug 2016, at 18:36, Mark Hatle wrote:

> Would it makes sense to track the xattrs and linked files and such 
> using some
> type of inode reference (virtual or otherwise)?
>
> Since in the case of a hard link, on a normal Linux style filesystem, 
> there will
> be a single inode that has a reference count higher then 1.  Thus you 
> can know
> the modes, xattrs, etc for that inode.. then the file points to the 
> inode with
> reference counts.  (this might require a rework on internal 
> structures.. but
> also might solve the problem.)

Well, that *is* how we track xattrs. And everything else, we do use 
device and inode, but, we maintain one row for each path, and delete the 
individual path rows.

This gets back to one of the original design goals, which was to avoid
all the horrific things that happen to fakeroot because it's only 
tracking
device/inode. We *want* the multiple path entries so we can report 
apparent database problems.

(Side note: There's some performance optimizations that have reduced 
stability/robustness, and I have plans involving making pseudo smarter
about those, and/or allowing configuration to prefer being more 
cautious.)

-s

