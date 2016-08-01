Return-Path: <seebs@seebs.net>
Received: from mail.plethora.net (mail.plethora.net [184.173.250.112])
	by mail.openembedded.org (Postfix) with ESMTP id D82726AC3C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 08:42:28 +0000 (UTC)
Received: from [10.10.10.132] (home.seebs.net [74.122.98.108])
	by mail.plethora.net (Postfix) with ESMTPSA id 2552AC4993
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 03:42:29 -0500 (CDT)
From: Seebs <seebs@seebs.net>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Mon, 01 Aug 2016 03:42:28 -0500
Message-ID: <F5BAFB71-1FCC-4F9D-999C-5960E8CD7213@seebs.net>
In-Reply-To: <579EE4BB.6070709@windriver.com>
References: <577B8AA9.5040808@windriver.com>
	<dc216358-8a1f-1490-2fc0-db22f98741c3@windriver.com>
	<579B07F9.9000708@windriver.com>
	<B3108E03-1852-4237-8320-E2BFEC66F9B3@seebs.net>
	<579EE4BB.6070709@windriver.com>
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
X-List-Received-Date: Mon, 01 Aug 2016 08:42:29 -0000
Content-Type: text/plain; format=flowed

On 1 Aug 2016, at 0:57, Robert Yang wrote:

> Sorry, the steps were wrong, they should be:
> 1) Out of pseudo:
>    $ umask 0022
>    $ touch file1
> 2) Under pseudo:
>    $ ln file1 file2
>    $ chmod 777 file2
>    $ ls -l file1 file2
>    We can see that both file1 and file2's mode is 0777.
>    But if we remove file2:
>    $ rm -f file2
>    $ ls file1
>    Now file1's permission is 0755, not 0777 or 0644, it should be 0777 
> here.

The short answer is: If you aren't tracking a file in pseudo, we don't 
make promises about its behavior. Normally, we don't touch them, but if 
there's hard links to them that are being touched, well. And having a 
hard link that is tracked, and another that isn't, is probably 
impossible to support. I definitely don't want to keep database entries 
for files that have been deleted, that way lies madness and possible 
database corruption; for instance, if we do that, and you make a new 
file of the same type, it'll show up as having those permissions, with 
only a path-mismatch warning in the database to suggest what went wrong.

I would say that the probable correct answer is either "make the 
original file be tracked" or "don't use hard links in this case".

Note that, under older pseudo, the file would have ended up 0777. The 
behavior of silently masking out 022 from underlying filesystem 
permissions is entirely intentional. During some debugging quite a while 
back, we discovered a quirk in oe-core, plus a strange behavior of
GNU tar, which between them resulted in some sstage directories getting
unpacked with mode 0777.

And we *really* don't want the build system generating files which other 
users can modify, especially not in stuff that's intended to go into a 
root filesystem. So stripping out those bits in the underlying 
filesystem is intentional.

If you were actually root, yes, the original file would have its mode 
changed to 0777. But we should never be *caring* about the mode bits on
raw files outside of pseudo, except that we want them to allow owner
write permissions and not allow group or other write permissions. If the
file's permissions matter to the build system or generated stuff, the
file should be tracked by pseudo.

-s

