Return-Path: <seebs@seebs.net>
Received: from mail.plethora.net (mail.plethora.net [184.173.250.112])
	by mail.openembedded.org (Postfix) with ESMTP id 81A6D731C6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 20:17:58 +0000 (UTC)
Received: from [10.10.10.132] (home.seebs.net [74.122.98.108])
	by mail.plethora.net (Postfix) with ESMTPSA id CBA5AC4E05
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 15:17:59 -0500 (CDT)
From: Seebs <seebs@seebs.net>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Mon, 01 Aug 2016 15:17:59 -0500
Message-ID: <BDA8434F-AE7B-4D8D-B6C3-2D4ED599E9E8@seebs.net>
In-Reply-To: <1470081674.9142.108.camel@linuxfoundation.org>
References: <577B8AA9.5040808@windriver.com>
	<dc216358-8a1f-1490-2fc0-db22f98741c3@windriver.com>
	<579B07F9.9000708@windriver.com>
	<B3108E03-1852-4237-8320-E2BFEC66F9B3@seebs.net>
	<579EE4BB.6070709@windriver.com>
	<F5BAFB71-1FCC-4F9D-999C-5960E8CD7213@seebs.net>
	<579F0EE8.3080009@windriver.com>
	<39329191-8DC4-43B6-9B38-5AD173C8F0DC@seebs.net>
	<1470081674.9142.108.camel@linuxfoundation.org>
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
X-List-Received-Date: Mon, 01 Aug 2016 20:17:59 -0000
Content-Type: text/plain; format=flowed

On 1 Aug 2016, at 15:01, Richard Purdie wrote:

> No, we're actually expecting it to retain the mode it was given via 
> the
> hardlink under pseudo.
>
> This is what a real world system would do and in this case we could
> track it via pseudo since pseudo is loaded when the hardlink is
> created. It would be unreasonable for pseudo to track all hardlinks 
> but
> tracking ones created under it does seem reasonable?

Hmm. Well, strictly speaking, the link created under pseudo *does* get 
tracked. Hmm. But an implicit request to track also the thing linked to 
is not a horrible idea. Although you'd still be able to beat it:

	$ touch file1
	$ ln file1 file2
	$ pseudo
	# ln file2 file3
	# chmod 777 file3
	# rm file2 file3
	# ls -l file1

The general case of "find everything this link also refers to" is 
clearly out of scope. That said... Hmm. I think my main feeling is, if 
we want
to link to the file, and we want the changes to the linked file to
survive, we should probably either create that file under pseudo, or 
explicitly claim it with pseudo when we start wanting to do the 
tracking.
(You can trivially do this to a tree with chown -R root tree).

-s

