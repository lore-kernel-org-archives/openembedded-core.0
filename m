Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 77D156612C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2016 15:12:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u72FCphj022179
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Aug 2016 08:12:52 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 2 Aug 2016 08:12:50 -0700
To: <openembedded-core@lists.openembedded.org>
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
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <9034b8dd-a4dc-e2c4-fcb0-8e488e78296c@windriver.com>
Date: Tue, 2 Aug 2016 10:12:46 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <9BFBB743-6513-4791-9046-6BFBED50A347@seebs.net>
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
X-List-Received-Date: Tue, 02 Aug 2016 15:12:51 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit

On 8/2/16 1:50 AM, Seebs wrote:
> On 2 Aug 2016, at 1:44, Robert Yang wrote:
> 
>> Because the stat() gets 0644 on ${B}/version.c in the second run, so 
>> it
>> would run chmod 0644 rather than 0444 on gzip-dbg/version.c.
> 
> Why is it calling chmod at all? The goal is apparently to give
> gzip-dbg/version.c the same mode that ${B}/version.c has. Since it's a
> hard link, no chmod call is needed at all.
> 
>>> time and not the second? If it does it the second time, the fact that
>>> the underlying file's mode changed won't matter.
>>>
>>> But in this case... While I'm fine with modifying things to track the
>>
>> Thanks, I will send a patch for it.
> 
> I already have a patch for this.
> 
>>> file linked-to, it still feels like this is a usage error. 
>>> Fundamentally,
>>> we're unpacking a file (${B}/version.c), then linking to it, changing
>>> the link in some way, deleting the link, and expecting the original 
>>> file
>>> to be unchanged. That doesn't seem right to me.
> 
>> But that is what the real filesystem works without pseudo:
>> $ touch file1
>> $ ln file1 file2
>> $ chmod 777 file2
>> $ rm -f file2
>>
>> file1 will be 777 on the real filesystem.
> 
> Yes. But it seems that the mode the file is being changed to is 
> dependant on the original reported mode. And that's the part that I'm 
> confused by;
> we're relying on the mode of the original file, but we're also changing
> the mode of a hard link to it. This makes no sense to me.
> 
> So, I have a likely fix handy. (The difference between mine and the
> version you proposed earlier is that, as I recall, yours does the LINK
> operation on the original file unconditionally, which is in error; it
> should only be done when no existing data was found in the database.) 
> I'll double-check that again and go through looking for loose ends, 
> because
> I have a vague feeling that I'm overlooking a thing, but I haven't 
> figured out what it would be yet.

A better way to describe the problem:

I create a file:

$ touch my-special-file
$ chmod 0444 my-special-file

I then run pseudo

$ pseudo ln my-special-file file1
$ stat file1
Access: (0444/-r--r--r--)  Uid: (    0/    root)   Gid: (    0/    root)
$ pseudo rm -f file1
$ # remove pseudo database

At this point the original 'my-special-file' is now 0644, not 0444.  This is
because pseudo changes the perms on the file so that it could pretend to be root.

So if we repeat the last steps:

$ pseudo ln my-special-file file1
$ stat file1
Access: (0644/-r--r--r--)  Uid: (    0/    root)   Gid: (    0/    root)
$ pseudo rm -f file1
$ # remove pseudo database

So the problem is -- pseudo is modifying the 'original' file perms, which on a
new instance of the pseudo database then gets inherited.  So we get
unpredictable results if this is the first time through -- or not the first time
through.

The problem is 'my-special-file' is never owned by pseudo -- but that isn't
really what the problem is -- the problem is because it's a hardlink -- and
pseudo is changing perms to emulate root -- it triggers a QA fault because the
file is 'changing'.

--Mark

> -s
> 


