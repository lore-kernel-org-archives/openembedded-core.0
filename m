Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id E7B5073E3B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Jan 2016 08:44:17 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id q21so308060167iod.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jan 2016 00:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ejL5/R29ApMLMZ5ixTHFKbFAOVQqxetnaEkvIdYMDv8=;
	b=X/5Mm8MLN8PIApwmu87YSbR4OaERjjw7ovIjaLvtxJBMn5KVqCXNid3sM+7H0iiuc6
	PqeID0+rr6sEdhthQK3VpmzOeiMHoZoy0Siz1TfSJpd7bO/kxG4kRVBQvuQwFgrhGlcA
	zbi68euFtKj5EF/9sEc4kfJ/CqoJx2T6Iddc4n8GmuLsRog1z8ngeA4mADRmzt0+9hr3
	JpMjNwSyQcYvQbCUFp6mUb30CE8fxOSqUKjMCNHIMIyq+ik5LvvCwD6HhpTI2efGvHGi
	RMUANDxvrIMxfTrj/xg8Gj2A8Z1K3BTR0YGoO7RpGHVabrETpHvFVwcXYBxTs1CU2LuC
	CrWQ==
X-Received: by 10.107.9.224 with SMTP id 93mr100760858ioj.112.1452329058463;
	Sat, 09 Jan 2016 00:44:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Sat, 9 Jan 2016 00:43:49 -0800 (PST)
In-Reply-To: <CAMKF1soHO0h6a6YACrHpGXBJe6mufruYwJu+d0nFj_85Jci00g@mail.gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
	<604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
	<555844c65d44169bb4478d4470a802ebc2fe2f94.1452248145.git.raj.khem@gmail.com>
	<CAJ86T=X=s81M+2ywKV4T63A31sfmcRnHHar5oUMd4JsS+UFezw@mail.gmail.com>
	<CAMKF1soHO0h6a6YACrHpGXBJe6mufruYwJu+d0nFj_85Jci00g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 9 Jan 2016 00:43:49 -0800
Message-ID: <CAMKF1spMNr4wJPijrtu5+DZ9tM4vmaGL-Mk0J0YJvbi=348Fpg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 24/53] directfb: Fix build with musl
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
X-List-Received-Date: Sat, 09 Jan 2016 08:44:18 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 8, 2016 at 11:43 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Jan 8, 2016 at 7:27 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>> +diff -Naur DirectFB-1.7.6.orig/lib/direct/os/linux/glibc/mutex.h DirectFB-1.7.6/lib/direct/os/linux/glibc/mutex.h
>>> +--- DirectFB-1.7.6.orig/lib/direct/os/linux/glibc/mutex.h      2013-12-18 19:16:24.000000000 -0500
>>> ++++ DirectFB-1.7.6/lib/direct/os/linux/glibc/mutex.h   2015-07-18 16:57:47.178982835 -0400
>>> +@@ -46,7 +46,7 @@
>>> + /**********************************************************************************************************************/
>>> +
>>> + #define DIRECT_MUTEX_INITIALIZER(name)            { PTHREAD_MUTEX_INITIALIZER }
>>> +-#define DIRECT_RECURSIVE_MUTEX_INITIALIZER(name)  { PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP }
>>> ++#define DIRECT_RECURSIVE_MUTEX_INITIALIZER(name)  { PTHREAD_MUTEX_RECURSIVE }
>>
>> This looks completely bogus.
>>
>> PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP initialises a pthread_mutex_t
>> structure and PTHREAD_MUTEX_RECURSIVE is an enum. You can't just
>> replace one with the other.
>
> It indeed is bogus. I took it as a stepstone to get it compiling but
> in reality what we need is a portable way to initialize recursive
> mutex instead of _NP
> something like using pthread_once during lock initialization. Let me
> see what can be done.

Please try out https://github.com/kraj/openembedded-core/commit/4104b7cdd0b58e24a926cdcf6415f3da3f48624e
which should be the right fix and portable one.

