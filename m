Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 407206FFF7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2016 01:52:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u721qkJR007879
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 1 Aug 2016 18:52:46 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 1 Aug 2016 18:52:45 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Seebs
	<seebs@seebs.net>, oe-core <openembedded-core@lists.openembedded.org>
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
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <579FFCEB.6090200@windriver.com>
Date: Tue, 2 Aug 2016 09:52:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1470092106.9142.113.camel@linuxfoundation.org>
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
X-List-Received-Date: Tue, 02 Aug 2016 01:52:52 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/02/2016 06:55 AM, Richard Purdie wrote:
> On Mon, 2016-08-01 at 15:17 -0500, Seebs wrote:
>> On 1 Aug 2016, at 15:01, Richard Purdie wrote:
>>
>>> No, we're actually expecting it to retain the mode it was given via
>>> the
>>> hardlink under pseudo.
>>>
>>> This is what a real world system would do and in this case we could
>>> track it via pseudo since pseudo is loaded when the hardlink is
>>> created. It would be unreasonable for pseudo to track all hardlinks
>>> but
>>> tracking ones created under it does seem reasonable?
>>
>> Hmm. Well, strictly speaking, the link created under pseudo *does*
>> get
>> tracked. Hmm. But an implicit request to track also the thing linked
>> to
>> is not a horrible idea. Although you'd still be able to beat it:
>>
>> 	$ touch file1
>> 	$ ln file1 file2
>> 	$ pseudo
>> 	# ln file2 file3
>> 	# chmod 777 file3
>> 	# rm file2 file3
>> 	# ls -l file1
>>
>> The general case of "find everything this link also refers to" is
>> clearly out of scope.
>
> Agreed.
>
>>   That said... Hmm. I think my main feeling is, if we want
>> to link to the file, and we want the changes to the linked file to
>> survive, we should probably either create that file under pseudo, or
>> explicitly claim it with pseudo when we start wanting to do the
>> tracking.
>> (You can trivially do this to a tree with chown -R root tree).
>
> The trouble is that for speed, we do create trees of hardlinked files
> and play games with those and sstate amongst other things. Its
> obviously faster to do this than make physical copies of the files.
> Given what I know of the code paths, I suspect that tracking the source
> of a hardlink would make life much easier for us. Obviously we can go
> and start adding "chown -R" calls everywhere but that seems a little
> ugly to me and doesn't do performance any favours.
>
> Is there any significant downside if we do track the source of
> hardlinks?

AFAIK, no.

And when remove file2, but file1's permission is changed, it should
be considered as a bug.

// Robert

>
> Cheers,
>
> Richard
>
>
>
>

