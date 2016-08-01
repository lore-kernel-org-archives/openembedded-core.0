Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2D175700F0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 20:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u71K1Iqh017426; Mon, 1 Aug 2016 21:01:18 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id VZS2jLTF9t9X; Mon,  1 Aug 2016 21:01:18 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u71K1En7017423
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 1 Aug 2016 21:01:16 +0100
Message-ID: <1470081674.9142.108.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Seebs <seebs@seebs.net>, oe-core <openembedded-core@lists.openembedded.org>
Date: Mon, 01 Aug 2016 21:01:14 +0100
In-Reply-To: <39329191-8DC4-43B6-9B38-5AD173C8F0DC@seebs.net>
References: <577B8AA9.5040808@windriver.com>
	<dc216358-8a1f-1490-2fc0-db22f98741c3@windriver.com>
	<579B07F9.9000708@windriver.com>
	<B3108E03-1852-4237-8320-E2BFEC66F9B3@seebs.net>
	<579EE4BB.6070709@windriver.com>
	<F5BAFB71-1FCC-4F9D-999C-5960E8CD7213@seebs.net>
	<579F0EE8.3080009@windriver.com>
	<39329191-8DC4-43B6-9B38-5AD173C8F0DC@seebs.net>
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
X-List-Received-Date: Mon, 01 Aug 2016 20:01:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-08-01 at 13:17 -0500, Seebs wrote:
> On 1 Aug 2016, at 3:57, Robert Yang wrote:
> 
> > How about we track the src when hardlink, for example:
> 
> I don't think I like this.
> 
> Fundamentally, the problem here is making a hard link to a file
> outside 
> of pseudo, and then modifying the file.
> 
> Consider, if you will, what happens if you replace "chmod 0777 file2"
> with:
> 	# echo "# last line" >> file2
> 
> The problem here isn't pseudo's tracking; it's that we're making a
> hard 
> link to a file, modifying the hard link, deleting the hard link, and 
> expecting the original file to have the same attributes it had before
> this all happened.

No, we're actually expecting it to retain the mode it was given via the
hardlink under pseudo. 

This is what a real world system would do and in this case we could
track it via pseudo since pseudo is loaded when the hardlink is
created. It would be unreasonable for pseudo to track all hardlinks but
tracking ones created under it does seem reasonable?

Cheers,

Richard


