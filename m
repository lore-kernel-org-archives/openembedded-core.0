Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 7C88060196
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 21:37:04 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	s74Lb5QX001776; Mon, 4 Aug 2014 16:37:05 -0500
Received: from weregild.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014080416370569-629264 ;
	Mon, 4 Aug 2014 16:37:05 -0500 
From: Richard Tollerton <rich.tollerton@ni.com>
To: Otavio Salvador <otavio@ossystems.com.br>
In-Reply-To: <CAP9ODKogEJndSRNm0EgX4KzVt7=Fej10fT1yKZBFwU-+jk2PAw@mail.gmail.com>
References: <cover.1407177403.git.ben.shelton@ni.com>
	<13060467d5be9274cbe18b3791bbf10f5a2d7abb.1407177403.git.ben.shelton@ni.com>
	<CAP9ODKrG3dvq5JZo7jRXuwvdVxADXXVgq4vkR-nLwJThko42yA@mail.gmail.com>
	<87zjfkvtrj.fsf@weregild.amer.corp.natinst.com>
	<CAP9ODKogEJndSRNm0EgX4KzVt7=Fej10fT1yKZBFwU-+jk2PAw@mail.gmail.com>
User-Agent: Notmuch/0.18.1 (http://notmuchmail.org) Emacs/24.3.1
	(x86_64-unknown-linux-gnu)
Date: Mon, 04 Aug 2014 16:37:05 -0500
Message-ID: <87vbq8vsvy.fsf@weregild.amer.corp.natinst.com>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 08/04/2014 04:37:05 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 08/04/2014 04:37:05 PM,
	Serialize complete at 08/04/2014 04:37:05 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.27,
	0.0.0000
	definitions=2014-08-04_04:2014-08-04, 2014-08-04,
	1970-01-01 signatures=0
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
X-List-Received-Date: Mon, 04 Aug 2014 21:37:09 -0000
Content-Type: text/plain

Otavio Salvador <otavio@ossystems.com.br> writes:

> On Mon, Aug 4, 2014 at 6:18 PM, Richard Tollerton <rich.tollerton@ni.com> wrote:
>> Otavio Salvador <otavio@ossystems.com.br> writes:
>>
>>> I am not sure about this one. I see the value you are adding here but
>>> I worry how often something can be connected during this process and
>>> change the contents along the way. Did you see something as that
>>> during your tests?
>>
>> No, but point taken. I didn't really test "physical" hotplug during
>> bootup -- and in particular, for this to be a persisting issue, the
>> added/removed device must be removed/added during this boot -- but I
>> suppose that is totally possible.
>>
>> This reflects an underlying race condition, starting at the computation
>> of NEWDATA/OLDDATA in the udev initscript, and ending in the tarball
>> creation in udev-cache. I suppose that we can mitigate this by spinning
>> in udev-cache until the devcache stops changing...? Cheesy, untested,
>> dirty RFC follows:
>
> You need to check the list of files taken by 'tar' and compare. This
> mitigates it but does not really solves the issue.

Hmm, I'm confused. If we relied entirely on /dev contents, how would we
detect (and correct for) if a device was removed between the execution
of udev and of udev-cache?

> Maybe we could "copy" the nodes to a tmp area and use this as a
> snapshot? The copy should be fast and makes it mostly "atomic".

I agree that the copy of the contents of /dev needs to be as fast as
possible -- your about using tmpfs as a staging area is well taken. But
beyond that, it seems to me that the root issue you articulated is about
ensuring adequate synchronization of udev.cache and the tarball;
rereading CMP_FILE_LIST in udev-cache thus seems unavoidable.

> -- 
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

-- 
Richard Tollerton <rich.tollerton@ni.com>

