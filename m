Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 20AAD76FE2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Oct 2015 14:30:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t92EUvkF015917; Fri, 2 Oct 2015 15:30:57 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id l6ozB73pm4QK; Fri,  2 Oct 2015 15:30:57 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t92EUhmg015894
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 2 Oct 2015 15:30:55 +0100
Message-ID: <1443796243.14733.84.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Fri, 02 Oct 2015 15:30:43 +0100
In-Reply-To: <560E9351.90003@windriver.com>
References: <1443723968-43906-1-git-send-email-mark.hatle@windriver.com>
	<1443738661.14733.71.camel@linuxfoundation.org>
	<560E9351.90003@windriver.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: david.reyna@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] "Finish" the IMAGE_GEN_DEBUGFS implementation
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
X-List-Received-Date: Fri, 02 Oct 2015 14:30:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-10-02 at 09:23 -0500, Mark Hatle wrote:
> On 10/1/15 5:31 PM, Richard Purdie wrote:
> > On Thu, 2015-10-01 at 13:26 -0500, Mark Hatle wrote:
> >> It was noticed today that the IMAGE_GEN_DEBUGFS implementation was not 
> >> complete.  The version that was merged back in May only contained the 
> >> filesystem generation pieces, but not the pieces for creating the image
> >> from that filesystem.
> >>
> >> The code has been tested and is working.  The only thing that I don't 
> >> particularly like is that the processing code and loop is a duplicate of
> >> the code that runs just before.  Unfortunately the only way around this
> >> is to change the way that way the parallel bits are processed to support
> >> multiple datastores..  (or create "another" function..)
> >>
> >> Any feedback appreciated, but without this the feature is broken!
> > 
> > Could we not make a function which these two code points then call?
> 
> The duplicate piece is because the existing setup and loop depend on the local
> self.d value(s).  In order to do this, we need to temporarily modify self.d and
> run this under an alternative datastore, and then put it back to the original value.
> 
> If I don't duplicate the:
> 
>             for image_cmds in debugfs_image_cmd_groups:
> ...
>                 results = list(pool.imap(generate_image, image_cmds))
> ...
>                 for image_type, subimages, script in image_cmds:
>                     bb.note("Creating debugfs symlinks for %s image ..." %
> image_type)
>                     self._create_symlinks(subimages)
> 
> there is no concept of two different datastores.
> 
> The alternative we have is to include a reference to the datastore itself in the
> 'image_cmds'.  Then we could support any number of datastores as appropriate for
> the commands.  (This of course will require additional changes to be able to
> pass that datastore to the various users.)

Ah, right. Going from memory, we can't share a datastore with a
multiprocessing pool. We could do that with a multithreaded pool but I'm
nervous about that for two reasons, one that we've had bad interaction
between threads and processes in the past and secondly around locking
and data usage in the threads.

So not an easy problem...

Cheers,

Richard


