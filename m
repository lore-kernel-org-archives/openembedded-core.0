Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 99174731A5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2016 08:32:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u728W8us010283
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 Aug 2016 01:32:08 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 2 Aug 2016 01:32:07 -0700
To: Seebs <seebs@seebs.net>, oe-core <openembedded-core@lists.openembedded.org>
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
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <57A05A86.7000701@windriver.com>
Date: Tue, 2 Aug 2016 16:32:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
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
X-List-Received-Date: Tue, 02 Aug 2016 08:32:13 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/02/2016 02:50 PM, Seebs wrote:
> On 2 Aug 2016, at 1:44, Robert Yang wrote:
>
>> Because the stat() gets 0644 on ${B}/version.c in the second run, so it
>> would run chmod 0644 rather than 0444 on gzip-dbg/version.c.
>
> Why is it calling chmod at all? The goal is apparently to give
> gzip-dbg/version.c the same mode that ${B}/version.c has. Since it's a
> hard link, no chmod call is needed at all.

It is worth trying, I will try to remove os.chown() and os.chmod() from
package.bbclass to see what will happen:

             if not cpath.islink(file):
                 os.link(file, fpath)
                 fstat = cpath.stat(file)
                 os.chmod(fpath, fstat.st_mode)
                 os.chown(fpath, fstat.st_uid, fstat.st_gid)

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
>>> file linked-to, it still feels like this is a usage error. Fundamentally,
>>> we're unpacking a file (${B}/version.c), then linking to it, changing
>>> the link in some way, deleting the link, and expecting the original file
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
> Yes. But it seems that the mode the file is being changed to is dependant on the
> original reported mode. And that's the part that I'm confused by;
> we're relying on the mode of the original file, but we're also changing
> the mode of a hard link to it. This makes no sense to me.
>
> So, I have a likely fix handy. (The difference between mine and the
> version you proposed earlier is that, as I recall, yours does the LINK
> operation on the original file unconditionally, which is in error; it

I had checked pseudo's source code, I didn't find any function that can check
this, and I appreciated that if you can fix it:-).

// Robert

> should only be done when no existing data was found in the database.) I'll
> double-check that again and go through looking for loose ends, because
> I have a vague feeling that I'm overlooking a thing, but I haven't figured out
> what it would be yet.
>
> -s

