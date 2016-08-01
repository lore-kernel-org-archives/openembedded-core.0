Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 453A5731CB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 05:57:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u715vHUh027221
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 31 Jul 2016 22:57:18 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 31 Jul 2016 22:57:17 -0700
To: Seebs <seebs@seebs.net>, oe-core <openembedded-core@lists.openembedded.org>
References: <577B8AA9.5040808@windriver.com>
	<dc216358-8a1f-1490-2fc0-db22f98741c3@windriver.com>
	<579B07F9.9000708@windriver.com>
	<B3108E03-1852-4237-8320-E2BFEC66F9B3@seebs.net>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <579EE4BB.6070709@windriver.com>
Date: Mon, 1 Aug 2016 13:57:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <B3108E03-1852-4237-8320-E2BFEC66F9B3@seebs.net>
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
X-List-Received-Date: Mon, 01 Aug 2016 05:57:23 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Peter,

Thanks for the reply.

On 07/30/2016 12:02 AM, Seebs wrote:
> On 29 Jul 2016, at 2:38, Robert Yang wrote:
>
>> It got 0644 but not 0444 in the second build was because pseudo's unlink
>> doesn't take core of hard links, for example:
>> $ umask 0022
>> $ touch file1
>> $ ln file1 file2
>> $ chmod 0777 file1
>> $ ls -l file1 file2
>> We can see that both file1 and file2's mode is 0777.
>
>> But if we remove file1:
>> $ rm -f file1
>> $ ls file2
>> Now file2's mode is 0644 since the info had been removed from database.
>
> I don't get that result. Before the remove, I see:
>
> sqlite> select * from files;
> 1|/home/seebs/pseudo/f1|2054|2757274|0|0|33279|0|0
> 2|/home/seebs/pseudo/f2|2054|2757274|0|0|33279|0|0
>
> So both files have the correct information stored for them. This is
> because chmod-type operations on files update everything with the same
> device and inode.

Sorry, the steps were wrong, they should be:
1) Out of pseudo:
    $ umask 0022
    $ touch file1
2) Under pseudo:
    $ ln file1 file2
    $ chmod 777 file2
    $ ls -l file1 file2
    We can see that both file1 and file2's mode is 0777.
    But if we remove file2:
    $ rm -f file2
    $ ls file1
    Now file1's permission is 0755, not 0777 or 0644, it should be 0777 here.

>
>> After talked with RP online, there isn't any file systems that can support
>> different modes on different references for the same inode, so pseudo's
>> chmod should update all the references' mode
>
> Yes.
>
>> in another word, it should
>> not remove the info from database if links count is greater than 1.
>
> This doesn't seem right to me. I can't produce any failures from the
> current code that match the behavior you're describing; updates like
> chmod always propogate to all the links.
>
> On the other hand, if f1 *already exists*, and was not being tracked
> by pseudo, then we do indeed see a similar problem. The underlying file's
> mode is actually changed.
>
> I do not think it would be a good idea at all to stop removing entries from the
> database when they become invalid. It seems to me that if we're hard linking to
> a file inside pseudo, we should probably be tracking that file. Although if we

Yes, I agree that we need track the src file when hard link.

// Robert

> track the file, now we'll just continue to see it as mode 777, because we
> changed the mode of the file.
>
> Consider, for a moment, what happens if you do this *without* pseudo involved.
> Unpack an archive containing a file "foo", mode 444.
>
> $ ln foo bar
> $ chmod 777 bar
> $ rm bar
> $ ls -l foo
>
> You'll find that foo's mode is now 0777. So it'd change either way; the
> difference is that, when pseudo's doing this, it masks out group and
> other write bits on the filesystem. (Because we don't want other people to be
> able to overwrite things in the build tree just because they'd be writeable on
> the target filesystem.)
>
> -s

