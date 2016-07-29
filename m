Return-Path: <seebs@seebs.net>
X-Greylist: delayed 437 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 29 Jul 2016 16:09:24 UTC
Received: from mail.plethora.net (mail.plethora.net [184.173.250.112])
	by mail.openembedded.org (Postfix) with ESMTP id B12BA607A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 16:09:24 +0000 (UTC)
Received: from [10.10.10.132] (home.seebs.net [74.122.98.108])
	by mail.plethora.net (Postfix) with ESMTPSA id B3B3EC4B7B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 11:02:08 -0500 (CDT)
From: Seebs <seebs@seebs.net>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Fri, 29 Jul 2016 11:02:08 -0500
Message-ID: <B3108E03-1852-4237-8320-E2BFEC66F9B3@seebs.net>
In-Reply-To: <579B07F9.9000708@windriver.com>
References: <577B8AA9.5040808@windriver.com>
	<dc216358-8a1f-1490-2fc0-db22f98741c3@windriver.com>
	<579B07F9.9000708@windriver.com>
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
X-List-Received-Date: Fri, 29 Jul 2016 16:09:28 -0000
Content-Type: text/plain; format=flowed

On 29 Jul 2016, at 2:38, Robert Yang wrote:

> It got 0644 but not 0444 in the second build was because pseudo's 
> unlink
> doesn't take core of hard links, for example:
> $ umask 0022
> $ touch file1
> $ ln file1 file2
> $ chmod 0777 file1
> $ ls -l file1 file2
> We can see that both file1 and file2's mode is 0777.

> But if we remove file1:
> $ rm -f file1
> $ ls file2
> Now file2's mode is 0644 since the info had been removed from 
> database.

I don't get that result. Before the remove, I see:

sqlite> select * from files;
1|/home/seebs/pseudo/f1|2054|2757274|0|0|33279|0|0
2|/home/seebs/pseudo/f2|2054|2757274|0|0|33279|0|0

So both files have the correct information stored for them. This is
because chmod-type operations on files update everything with the same
device and inode.

> After talked with RP online, there isn't any file systems that can 
> support
> different modes on different references for the same inode, so 
> pseudo's
> chmod should update all the references' mode

Yes.

> in another word, it should
> not remove the info from database if links count is greater than 1.

This doesn't seem right to me. I can't produce any failures from the
current code that match the behavior you're describing; updates like
chmod always propogate to all the links.

On the other hand, if f1 *already exists*, and was not being tracked
by pseudo, then we do indeed see a similar problem. The underlying 
file's
mode is actually changed.

I do not think it would be a good idea at all to stop removing entries 
from the database when they become invalid. It seems to me that if we're 
hard linking to a file inside pseudo, we should probably be tracking 
that file. Although if we track the file, now we'll just continue to see 
it as mode 777, because we changed the mode of the file.

Consider, for a moment, what happens if you do this *without* pseudo 
involved. Unpack an archive containing a file "foo", mode 444.

$ ln foo bar
$ chmod 777 bar
$ rm bar
$ ls -l foo

You'll find that foo's mode is now 0777. So it'd change either way; the
difference is that, when pseudo's doing this, it masks out group and
other write bits on the filesystem. (Because we don't want other people 
to be able to overwrite things in the build tree just because they'd be 
writeable on the target filesystem.)

-s

