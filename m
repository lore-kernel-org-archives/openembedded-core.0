Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C015B700F0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 22:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u71MtBFl023615; Mon, 1 Aug 2016 23:55:11 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id cDNI2RYlt4Oa; Mon,  1 Aug 2016 23:55:11 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u71Mt6wY023612
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 1 Aug 2016 23:55:08 +0100
Message-ID: <1470092106.9142.113.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Seebs <seebs@seebs.net>, oe-core <openembedded-core@lists.openembedded.org>
Date: Mon, 01 Aug 2016 23:55:06 +0100
In-Reply-To: <BDA8434F-AE7B-4D8D-B6C3-2D4ED599E9E8@seebs.net>
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
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
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
X-List-Received-Date: Mon, 01 Aug 2016 22:55:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-08-01 at 15:17 -0500, Seebs wrote:
> On 1 Aug 2016, at 15:01, Richard Purdie wrote:
> 
> > No, we're actually expecting it to retain the mode it was given via
> > the
> > hardlink under pseudo.
> > 
> > This is what a real world system would do and in this case we could
> > track it via pseudo since pseudo is loaded when the hardlink is
> > created. It would be unreasonable for pseudo to track all hardlinks
> > but
> > tracking ones created under it does seem reasonable?
> 
> Hmm. Well, strictly speaking, the link created under pseudo *does*
> get 
> tracked. Hmm. But an implicit request to track also the thing linked
> to 
> is not a horrible idea. Although you'd still be able to beat it:
> 
> 	$ touch file1
> 	$ ln file1 file2
> 	$ pseudo
> 	# ln file2 file3
> 	# chmod 777 file3
> 	# rm file2 file3
> 	# ls -l file1
> 
> The general case of "find everything this link also refers to" is 
> clearly out of scope.

Agreed.

>  That said... Hmm. I think my main feeling is, if we want
> to link to the file, and we want the changes to the linked file to
> survive, we should probably either create that file under pseudo, or 
> explicitly claim it with pseudo when we start wanting to do the 
> tracking.
> (You can trivially do this to a tree with chown -R root tree).

The trouble is that for speed, we do create trees of hardlinked files
and play games with those and sstate amongst other things. Its
obviously faster to do this than make physical copies of the files.
Given what I know of the code paths, I suspect that tracking the source
of a hardlink would make life much easier for us. Obviously we can go
and start adding "chown -R" calls everywhere but that seems a little
ugly to me and doesn't do performance any favours.

Is there any significant downside if we do track the source of
hardlinks?

Cheers,

Richard





