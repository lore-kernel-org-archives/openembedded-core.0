Return-Path: <paul.betafive@gmail.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 1D0B4713AB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Oct 2014 10:08:49 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id i50so6439363qgf.20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Oct 2014 03:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=wOPuz0dxNDO+UoFrE7rwkCF30WfbB1fJI6qyD8cjJMc=;
	b=mbMalUU4nXN2rqZXwqgQlWTXzGKghOa4xnHwfhzkRgj7wcFHf1NCwmIvP8Gd0jxDhG
	xAXRLUxSXILMvgqzlqKvy04VcRXJWdPZ4B8EEfTd6tbM0+k7QvjbTCVk1Jux0NZ5ARva
	NgbiqD4KqgNq30pMbllxC9FEVEGKQYrAZny5aXIxSHjIDj/ZTN1lbqlY9yMyfePRgihV
	dbXDyNaQnhUbSie/5zn73D5MjYiukpydQPU+vEiDk7Kg3rF2Xw5TDXeuCFSOSL18CmfX
	AJMylfsjoW+tvtQ3dJOFFebMf+Lsc+TbugCWWDm9Dlw8HwAGCk5hD6+c4eAsy9SP9sOc
	wPLA==
X-Received: by 10.229.47.193 with SMTP id o1mr38441938qcf.18.1413194930156;
	Mon, 13 Oct 2014 03:08:50 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.140.142.78 with HTTP; Mon, 13 Oct 2014 03:08:09 -0700 (PDT)
In-Reply-To: <543B61C0.6050500@urbanec.net>
References: <54380D3A.8060904@urbanec.net>
	<CANyK_8cZMz-JBdWku-yTgA1+RXbt0wGxww+eCf2CBMeb4cFXdA@mail.gmail.com>
	<CANyK_8cZGNxd0=FKA1NK1Y69RaHT4bVry_FjixuQCMW1zPpsLA@mail.gmail.com>
	<543B61C0.6050500@urbanec.net>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Mon, 13 Oct 2014 11:08:09 +0100
X-Google-Sender-Auth: tWGlvy5gdto6Cfvwyld0YkQU1TE
Message-ID: <CANyK_8dH4xX3PSZEbzU+h3DEHR=5z9obAREeb3-T7Xm6Q_Y+Cw@mail.gmail.com>
To: Peter Urbanec <openembedded-devel@urbanec.net>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Better support for upgrading packages in opkg and update-rc.d.bbclass
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
X-List-Received-Date: Mon, 13 Oct 2014 10:08:56 -0000
Content-Type: text/plain; charset=UTF-8

On 13 October 2014 06:23, Peter Urbanec <openembedded-devel@urbanec.net> wrote:
> On 12/10/14 06:17, Paul Barker wrote:
>>
>> opkg_remove_pkg is never called with from_upgrade set to a non-zero
>> value. The removal of an old package during an upgrade is handled by
>> directly calling remove_data_files_and_list and
>> remove_maintainer_scripts from opkg_install_pkg. The desired behaviour
>> is given in the comments in prerm_upgrade_old_pkg in opkg_install.c,
>> the behaviour given by the comment in that function just needs
>> implementing.
>
>
> Indeed, I got fooled by looking at the call to opkg_install_pkg(pkg, 1)

No worries, there's still a lot of confusing code in opkg I need to
clean up. I've got a patch ready which will remove the second argument
to opkg_remove_pkg to prevent similar confusion in the future.

>
>> This is already entered as issue 104 in the opkg issue tracker:
>> https://code.google.com/p/opkg/issues/detail?id=104
>
>
> So it is. Slightly more work than my trivial opkg patch, but then again, my
> trivial opkg patch is not much use ;-) Please disregard it.
>
>> Have you tested this patch before submitting it?
>
>
> To be honest, I have not tested the opkg "upgrade" patch in isolation. I
> have tested the opkg patch for multiple package upgrade case together with
> my changes to update-rc.d.bbclass changes (i.e. the entire patch I posted to
> the oe-core list) and this has solved the problems that I encountered
> initially. The "fix" for my use case is due to the changes in the way the
> prerm, postrm and postinst scripts work, but reviewing those changes, that's
> not good enough either.
>
> Thanks for the review.
>
> I'll try again later...

I decided to go ahead and implement the required function yesterday as
it's on my todo list for the v0.3.0 release. I'll forward you the
patch once it's been briefly tested, it should apply fairly cleanly to
v0.2.2 or v0.2.3 and so it should be possible to apply it within
OpenEmbedded if you don't want to wait for the v0.3.0 release.

>
> Peter

Thanks,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

