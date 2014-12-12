Return-Path: <danismostlikely@gmail.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 3C31165C9F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Dec 2014 03:15:40 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id f51so4786032qge.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Dec 2014 19:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=/gTPBHlNZN/OzFjuldWRdiZA6wz66kI1qZK3+r9y7TY=;
	b=uKjWS0mGn6Sivihny1H/VkfyA3TygCL3gMz5EW8FagAxYwFKTx0WnQ9+EhLQSwMIB4
	J7sb9++Y2jGXcK3zLCMrGQ8PlBgexKOlbw9ArYfnkVn5CIUCEAsTmP/HeNb+cdY5gD8f
	fxFI9vJplEOjM+ILVW6v7/+iKk0q7S6FYXKbXc6AoceyEhshI5ptH0EnEJk9GB9M2P/H
	x1YRInDceJFzqp4AX5zLDUpuTNa0/8dn7gjGe/wncik/Hys4S16qvSFLCfNAqGVVtvjO
	NhWU+wHh6WbbEKnLzy0HH/LI5LPz18acuEDTKHxJYmvC6vQn/9BFk2CVzjr6mU+3qalD
	mZww==
MIME-Version: 1.0
X-Received: by 10.140.22.201 with SMTP id 67mr25586265qgn.16.1418354141156;
	Thu, 11 Dec 2014 19:15:41 -0800 (PST)
Received: by 10.96.183.131 with HTTP; Thu, 11 Dec 2014 19:15:41 -0800 (PST)
In-Reply-To: <CAJTo0LbLnu3xvDWUHM95h=U549NPxbJ7ToA14zcH34QzSjZ=+w@mail.gmail.com>
References: <CACS+7ZTGK6duNi6GQ6tqhmrk3_bNnEbSj=LeEzr60vRP3Dw=OQ@mail.gmail.com>
	<CAJTo0LZewZ17aYpXao81LrmuPdgWho8WEYmYhzQ5=pP-AO-QQQ@mail.gmail.com>
	<CACS+7ZQUcknvEU6M1ioMQKRFHa4k7PO_rRGqEH7KWLU4Jn5f_w@mail.gmail.com>
	<CAJTo0LZtwOuer0QnH5=gLFzjZknBtauSbjhGt2-F5QT4f=tF7A@mail.gmail.com>
	<CACS+7ZSx-yYuC2HXA=OJ=NM+-NmePBtM4VbYKaFnjodHgJ8sig@mail.gmail.com>
	<CAJTo0LZsx0Yswsap_YrKLZNY3E45ZCKdS0asXkQ2iMK7OGbkYw@mail.gmail.com>
	<CACS+7ZTpz5tkDd13in=A1+_Wdcu868Q1_G9MDJt=Tf_EJ-qMGQ@mail.gmail.com>
	<CAJTo0LbLnu3xvDWUHM95h=U549NPxbJ7ToA14zcH34QzSjZ=+w@mail.gmail.com>
Date: Thu, 11 Dec 2014 21:15:41 -0600
Message-ID: <CACS+7ZTq_5ywxqv1gpa_5Yf_34=s_09F_rQkg8nPf6KhxjGnCg@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] libsanitizer: Enable GCC sanitizers
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
X-List-Received-Date: Fri, 12 Dec 2014 03:15:43 -0000
Content-Type: text/plain; charset=UTF-8

On 10 December 2014 at 05:58, Burton, Ross <ross.burton@intel.com> wrote:
> Hi Dan,
>
> On 13 November 2014 at 23:35, Dan McGregor <danismostlikely@gmail.com>
> wrote:
>>
>> Looks like I needed to use the same security CFLAGS as gcc-runtime and
>> libgcc. There's a new version up on my bitbucket page.
>
>
> I see you're still using anonymous python instead of COMPATIBLE_HOST to mark
> what architectures the sanitizers work on, can you change that?
>
> For packagegroups, if my recollection is correct and the problem is that a
> packagegroup wants to depend on packages which are architecture-specific, a
> common trick is to do something like this:

Yeah, that was the problem. For this round I bit the bullet and made
the package group arch specific, and I got rid of the anonymous
python. I originally put that there so that it would parse the recipe
and not barf on arches where the sanitizer libraries are not
supported.

I think this looks better though, I was struggling with getting them
into a all arch package group.

>
> SANITIZERS="gcc-sanitizer"
> SANITIZSERS_mips = ""
>
> RDEPENDS_packagegroup_foo = "${SANITIZERS}"
>
> (see the tools-profile packagegroup which does this heavily)
>
> Ross

