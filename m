Return-Path: <seebs@seebs.net>
Received: from mail.plethora.net (mail.plethora.net [184.173.250.112])
	by mail.openembedded.org (Postfix) with ESMTP id 984466E660
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2016 03:37:28 +0000 (UTC)
Received: from [10.10.10.132] (home.seebs.net [74.122.98.108])
	by mail.plethora.net (Postfix) with ESMTPSA id 0E973C495D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 22:37:29 -0500 (CDT)
From: Seebs <seebs@seebs.net>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Mon, 01 Aug 2016 22:37:28 -0500
Message-ID: <272C641C-9B84-42EA-9689-77DE8510C0A9@seebs.net>
In-Reply-To: <1470092106.9142.113.camel@linuxfoundation.org>
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
X-List-Received-Date: Tue, 02 Aug 2016 03:37:28 -0000
Content-Type: text/plain; format=flowed

On 1 Aug 2016, at 17:55, Richard Purdie wrote:

> The trouble is that for speed, we do create trees of hardlinked files
> and play games with those and sstate amongst other things.

Yeah. One concern would be ownership: If the things we're hardlinking to
weren't created/tracked by pseudo initially, they're going to show up as 
owned by the actual user doing the build. So hardlinks to them will 
also.

So it may be more reasonable to just create those things under pseudo
also, in which case they're already tracked.

> Its
> obviously faster to do this than make physical copies of the files.
> Given what I know of the code paths, I suspect that tracking the 
> source
> of a hardlink would make life much easier for us. Obviously we can go
> and start adding "chown -R" calls everywhere but that seems a little
> ugly to me and doesn't do performance any favours.

> Is there any significant downside if we do track the source of
> hardlinks?

Hmm. I'm not sure. It'll make things more complicated, but only 
marginally. The net impact would be fewer surprises in common cases, but 
the uncommon cases would get *really* weird. But it seems reasonable.
(At least for the case where there isn't an existing entry.) I'll
poke at this a bit, I think.

-s

