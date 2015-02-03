Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f41.google.com (mail-yh0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id 973906E5DE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 11:00:02 +0000 (UTC)
Received: by mail-yh0-f41.google.com with SMTP id f73so18188674yha.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Feb 2015 03:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=00UhdBmrJir5hzT22f9hVKGj6FFuBNmO9Li3CvqGKZw=;
	b=XEuRE6PeXwSZrDp4nck9JEeGX8CQi6i7PvamS7YlBBIbR6N5aawd8r8zDSMVpq2DxH
	QL0cGC7GChudtzs0Z3BVSGYCAotEQeCAMuBOKQXhkdZ5AQ0D9ebMbT3CP+XJPKZ23VH5
	6x4X7BBjaMdzlZIp0enwXRCyDviA1EwS/KLqdd3IRJbylWelbTog6gT18cFS1NO0HcxY
	UkP1WzT2E6ep7oXu+zwywuJ3mZsxlmTye0gHe2EQX3/Z5dBMlqU3iD9vIvzneZVq+T6P
	ad0lB2m9WQazagVRp894pQP2Ou9IN/dGdYUPTodpfbRoJigWL1daSHqQ+Kvw9z38xKd0
	678w==
MIME-Version: 1.0
X-Received: by 10.236.199.103 with SMTP id w67mr9880509yhn.37.1422961203934;
	Tue, 03 Feb 2015 03:00:03 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.143 with HTTP; Tue, 3 Feb 2015 03:00:03 -0800 (PST)
In-Reply-To: <54D06811.3000803@topic.nl>
References: <1422713174-18522-1-git-send-email-mike.looijmans@topic.nl>
	<1422713174-18522-2-git-send-email-mike.looijmans@topic.nl>
	<CAP9ODKrsWm4CiaYmP5UJOa_9jm9F+rRNnPTWWe_WXfLXRKrOiA@mail.gmail.com>
	<54D06811.3000803@topic.nl>
Date: Tue, 3 Feb 2015 09:00:03 -0200
X-Google-Sender-Auth: qkdMyUB-BlOwHK2eVne7nc6Sr4o
Message-ID: <CAP9ODKrbbC+aaLymTiDvHeCojt=m3OqkgP-LdqjbkYGzSyWZ7w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: Mike Looijmans <milo-software@users.sourceforge.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] fetch2/__init__.py: Make get_srcrev output configurable
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
X-List-Received-Date: Tue, 03 Feb 2015 11:00:13 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 3, 2015 at 4:17 AM, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> On 02-02-15 21:50, Otavio Salvador wrote:
>>
>> On Sat, Jan 31, 2015 at 12:06 PM, Mike Looijmans
>> <mike.looijmans@topic.nl> wrote:
>>>
>>> From: Mike Looijmans <milo-software@users.sourceforge.net>
>>>
>>> The idea here is to support package version numbering similar to gitpkgv
>>> in
>>> meta-openembedded. This commit is the first step towards such
>>> functionality.
>>>
>>> The original plan was to add a "get_pretty_srcrev" method to the fetcher,
>>> as
>>> per Richard's suggestion [1]. While writing this, I noticed that it would
>>> become a copy of get_srcrev with only two lines changed. So to create
>>> something
>>> more Pythonic than a boolean argument and conditionals around the calls
>>> to the
>>> fetcher's sortable_revision, I just made the method to be called on the
>>> fetcher
>>> an argument to the method. Defaulting to 'sortable_revision' prevents
>>> affecting
>>> existing code.
>>>
>>> Now if the git fetcher were to implement, say 'gitpkgv_revision' one
>>> could
>>> set the following in a recipe:
>>>    PKGV="1.2+${@bb.fetch2.get_srcrev(d, 'gitpkgv_revision')}"
>>> and this would yield the same result as gitpkgv's GITPKGV variable.
>>>
>>> See for the discussion leading to this change:
>>> [1]
>>> http://lists.openembedded.org/pipermail/openembedded-core/2015-January/100345.html
>>>
>>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>>
>>
>> I do enjoyed all the design but the way to set the PKGV.
>>
>> Maybe we could have a way to do it more transparently? Any idea how?
>
>
> Just setting GITPKGV="${@bb.fetch2.get_srcrev(d, 'gitpkgv_revision')}"
> globally (bitbake.conf for example) would basically mimic the gitpkgv
> syntax, then a recipe would just say:
>
> PKGV="1.2+${GITPKGV}"
>
> Without the need to inherit gitpkgv.

Awesome! Maybe you could add it on a v2?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

