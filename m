Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f54.google.com (mail-yh0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id 29A226FDE1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 21:41:00 +0000 (UTC)
Received: by mail-yh0-f54.google.com with SMTP id v1so33397yhn.27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Aug 2014 14:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=aF3N0mXfrdMzWVOXSwyjQqMIaXeGlNXbT3gHrxnkfI4=;
	b=JCJ7WejQ2wsbK61TSDx8TIk7P+HgVVM/EZjY8rHcrrn/dVSVblnpm/JYROTvPshOsC
	XL8aqrnPFTL9u3lel8Os7oIMSuqOyYJ/rM2RJNLparXDidfNEL+aUh2TRaXugXLyqK69
	PwRF9FMVXklQLTHxdW3RRS4pGNV70o6Xvvc8W5AI0DJvvbi/GoK9/SG4e7pxISXsz+mI
	R4HuSBoQEOv1DLTb6/ia6bB+lJNuUS9/vBsfyq//YGT6Odvs4pschfPf7gb6mr81fuDr
	ZUFGROW63sz7Mh+0bVa1o850XOJp4m+1QtVGZj/brwXuZp1yzu0/kXo/5kanHMkjiX1a
	aZOA==
MIME-Version: 1.0
X-Received: by 10.236.216.16 with SMTP id f16mr42419515yhp.90.1407188461255;
	Mon, 04 Aug 2014 14:41:01 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Mon, 4 Aug 2014 14:41:01 -0700 (PDT)
In-Reply-To: <87vbq8vsvy.fsf@weregild.amer.corp.natinst.com>
References: <cover.1407177403.git.ben.shelton@ni.com>
	<13060467d5be9274cbe18b3791bbf10f5a2d7abb.1407177403.git.ben.shelton@ni.com>
	<CAP9ODKrG3dvq5JZo7jRXuwvdVxADXXVgq4vkR-nLwJThko42yA@mail.gmail.com>
	<87zjfkvtrj.fsf@weregild.amer.corp.natinst.com>
	<CAP9ODKogEJndSRNm0EgX4KzVt7=Fej10fT1yKZBFwU-+jk2PAw@mail.gmail.com>
	<87vbq8vsvy.fsf@weregild.amer.corp.natinst.com>
Date: Mon, 4 Aug 2014 18:41:01 -0300
X-Google-Sender-Auth: jUnQRnUkztlvPNltRIi3keryzac
Message-ID: <CAP9ODKpfNPDebFZyzv-w0EFLkjJYe-njKQoF_FYpGdfb2rS+Uw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Tollerton <rich.tollerton@ni.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 08/20] udev-cache: Create cache asynchronously
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
X-List-Received-Date: Mon, 04 Aug 2014 21:41:01 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 4, 2014 at 6:37 PM, Richard Tollerton <rich.tollerton@ni.com> wrote:
> Otavio Salvador <otavio@ossystems.com.br> writes:
>
>> On Mon, Aug 4, 2014 at 6:18 PM, Richard Tollerton <rich.tollerton@ni.com> wrote:
>>> Otavio Salvador <otavio@ossystems.com.br> writes:
>>>
>>>> I am not sure about this one. I see the value you are adding here but
>>>> I worry how often something can be connected during this process and
>>>> change the contents along the way. Did you see something as that
>>>> during your tests?
>>>
>>> No, but point taken. I didn't really test "physical" hotplug during
>>> bootup -- and in particular, for this to be a persisting issue, the
>>> added/removed device must be removed/added during this boot -- but I
>>> suppose that is totally possible.
>>>
>>> This reflects an underlying race condition, starting at the computation
>>> of NEWDATA/OLDDATA in the udev initscript, and ending in the tarball
>>> creation in udev-cache. I suppose that we can mitigate this by spinning
>>> in udev-cache until the devcache stops changing...? Cheesy, untested,
>>> dirty RFC follows:
>>
>> You need to check the list of files taken by 'tar' and compare. This
>> mitigates it but does not really solves the issue.
>
> Hmm, I'm confused. If we relied entirely on /dev contents, how would we
> detect (and correct for) if a device was removed between the execution
> of udev and of udev-cache?
>
>> Maybe we could "copy" the nodes to a tmp area and use this as a
>> snapshot? The copy should be fast and makes it mostly "atomic".
>
> I agree that the copy of the contents of /dev needs to be as fast as
> possible -- your about using tmpfs as a staging area is well taken. But
> beyond that, it seems to me that the root issue you articulated is about
> ensuring adequate synchronization of udev.cache and the tarball;
> rereading CMP_FILE_LIST in udev-cache thus seems unavoidable.

Yes, that's why I think we need:

 - copy contents to a staging area
 - generate the tarball

This way we avoid the following steps:

 - generate the list of contents
 - generate the tarball
 - generate tarball's contents
 - compare, loop if does not match.

Makes sense?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

