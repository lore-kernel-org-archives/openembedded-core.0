Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f51.google.com (mail-yh0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id D140C609C0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 21:22:05 +0000 (UTC)
Received: by mail-yh0-f51.google.com with SMTP id f73so17536yha.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Aug 2014 14:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=9zUfrMWdTfafv5GEDE5UXw64S/aSLaVM4fV2+zB8ucw=;
	b=VQKaPyCnwftt2iOEVFKtaQ9Z0z76/ISbRB9T04Z2giwwEm+WwlP214Sk1elPh5rgs/
	Z32qLFf9b3Z7QERzWJE+UqQmUpefUEBXlzJn14X0PgG2Q4f8gLD7Mh0XB+uXIgTagmYO
	Hjbo4RNnYcPjgT47rxuSx33MA8Hv2cLjYFsYICQxOxIeMF+lQW49MiF66UT01khnaaOM
	xLNDI7iTrpr4h50yudC+/jitkMSqQzQudN7Z2+Io6bQIwOCOjNhGBFQffL+RzCK+dtcB
	WxAxuVvM0IHigyQQuf0EOjwiN3lDeWqDF9x3/K0dbXtG+XAB8FmxpsYYFZhGwYcaYYjX
	sS1g==
MIME-Version: 1.0
X-Received: by 10.236.103.135 with SMTP id f7mr42140295yhg.102.1407187326267; 
	Mon, 04 Aug 2014 14:22:06 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Mon, 4 Aug 2014 14:22:06 -0700 (PDT)
In-Reply-To: <87zjfkvtrj.fsf@weregild.amer.corp.natinst.com>
References: <cover.1407177403.git.ben.shelton@ni.com>
	<13060467d5be9274cbe18b3791bbf10f5a2d7abb.1407177403.git.ben.shelton@ni.com>
	<CAP9ODKrG3dvq5JZo7jRXuwvdVxADXXVgq4vkR-nLwJThko42yA@mail.gmail.com>
	<87zjfkvtrj.fsf@weregild.amer.corp.natinst.com>
Date: Mon, 4 Aug 2014 18:22:06 -0300
X-Google-Sender-Auth: h44LUOiMrnq0m-ekrWRNGCa5s08
Message-ID: <CAP9ODKogEJndSRNm0EgX4KzVt7=Fej10fT1yKZBFwU-+jk2PAw@mail.gmail.com>
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
X-List-Received-Date: Mon, 04 Aug 2014 21:22:08 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 4, 2014 at 6:18 PM, Richard Tollerton <rich.tollerton@ni.com> wrote:
> Otavio Salvador <otavio@ossystems.com.br> writes:
>
>> I am not sure about this one. I see the value you are adding here but
>> I worry how often something can be connected during this process and
>> change the contents along the way. Did you see something as that
>> during your tests?
>
> No, but point taken. I didn't really test "physical" hotplug during
> bootup -- and in particular, for this to be a persisting issue, the
> added/removed device must be removed/added during this boot -- but I
> suppose that is totally possible.
>
> This reflects an underlying race condition, starting at the computation
> of NEWDATA/OLDDATA in the udev initscript, and ending in the tarball
> creation in udev-cache. I suppose that we can mitigate this by spinning
> in udev-cache until the devcache stops changing...? Cheesy, untested,
> dirty RFC follows:

You need to check the list of files taken by 'tar' and compare. This
mitigates it but does not really solves the issue.

Maybe we could "copy" the nodes to a tmp area and use this as a
snapshot? The copy should be fast and makes it mostly "atomic".

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

