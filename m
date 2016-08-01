Return-Path: <seebs@seebs.net>
Received: from mail.plethora.net (mail.plethora.net [184.173.250.112])
	by mail.openembedded.org (Postfix) with ESMTP id 723886FFF7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 18:17:13 +0000 (UTC)
Received: from [10.10.10.132] (home.seebs.net [74.122.98.108])
	by mail.plethora.net (Postfix) with ESMTPSA id F2C16C495D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 13:17:13 -0500 (CDT)
From: Seebs <seebs@seebs.net>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Mon, 01 Aug 2016 13:17:13 -0500
Message-ID: <39329191-8DC4-43B6-9B38-5AD173C8F0DC@seebs.net>
In-Reply-To: <579F0EE8.3080009@windriver.com>
References: <577B8AA9.5040808@windriver.com>
	<dc216358-8a1f-1490-2fc0-db22f98741c3@windriver.com>
	<579B07F9.9000708@windriver.com>
	<B3108E03-1852-4237-8320-E2BFEC66F9B3@seebs.net>
	<579EE4BB.6070709@windriver.com>
	<F5BAFB71-1FCC-4F9D-999C-5960E8CD7213@seebs.net>
	<579F0EE8.3080009@windriver.com>
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
X-List-Received-Date: Mon, 01 Aug 2016 18:17:14 -0000
Content-Type: text/plain; format=flowed

On 1 Aug 2016, at 3:57, Robert Yang wrote:

> How about we track the src when hardlink, for example:

I don't think I like this.

Fundamentally, the problem here is making a hard link to a file outside 
of pseudo, and then modifying the file.

Consider, if you will, what happens if you replace "chmod 0777 file2"
with:
	# echo "# last line" >> file2

The problem here isn't pseudo's tracking; it's that we're making a hard 
link to a file, modifying the hard link, deleting the hard link, and 
expecting the original file to have the same attributes it had before
this all happened.

-s

