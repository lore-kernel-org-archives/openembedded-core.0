Return-Path: <seebs@seebs.net>
Received: from mail.plethora.net (mail.plethora.net [184.173.250.112])
	by mail.openembedded.org (Postfix) with ESMTP id B624E65CC2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2016 19:53:16 +0000 (UTC)
Received: from [10.10.10.132] (home.seebs.net [74.122.98.108])
	by mail.plethora.net (Postfix) with ESMTPSA id 34D30C4993
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2016 14:53:17 -0500 (CDT)
From: Seebs <seebs@seebs.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 02 Aug 2016 14:53:16 -0500
Message-ID: <C4E294A6-694F-4505-8B79-1FC5FFA9F346@seebs.net>
In-Reply-To: <dc38a32e-ba20-f2f3-cd77-73afe3db825a@windriver.com>
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
	<579FFCEB.6090200@windriver.com>
	<47AE4E78-D57B-44C1-B5D5-4509B15AD3BC@seebs.net>
	<57A03888.1@windriver.com>
	<E145B74B-3968-45C3-A0B0-D557C76ADC38@seebs.net>
	<57A04154.1050909@windriver.com>
	<9BFBB743-6513-4791-9046-6BFBED50A347@seebs.net>
	<9034b8dd-a4dc-e2c4-fcb0-8e488e78296c@windriver.com>
	<5B4A0BBD-1322-4DE4-85DB-3D7216CB6BC4@seebs.net>
	<dc38a32e-ba20-f2f3-cd77-73afe3db825a@windriver.com>
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
X-List-Received-Date: Tue, 02 Aug 2016 19:53:16 -0000
Content-Type: text/plain; format=flowed

On 2 Aug 2016, at 14:39, Mark Hatle wrote:

> The alternative to the 'ln' is a 'cp' operation.  This is how it used 
> to work
> until optimizations were added a few releases ago.  It was observed 
> that this
> saves a large amount of space -- but it had the unintended consequence 
> of
> suddenly files are now changes as the do_install/do_package processing
> manipulates files and modes change...

Yeah, and I think if we just dropped the copy of permissions, this
would at least temporarily go away.

> I almost wonder if in pseudo we should avoid changing any modes 
> internal to the
> file -- until something tries to write to the file.  (Can we even 
> capture that
> and try to fix it?  If not, what we're doing is likely the only 
> answer.)

I don't think we usefully can.

Hmm.

So it occurs to me, there's only a few cases where we actually have any
reason to make on-filesystem permissions changes at all. Say, execute 
bits for executables. Otherwise, we could in theory just not bother 
writing
changes to the disk, because the disk permissions are irrelevant.

-s

