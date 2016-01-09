Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 59999731F0
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Jan 2016 07:44:09 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id ik10so93729224igb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 23:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=egHe3jSmOo3ve1bZRmtoFfPHfyIS5kVW02AyaN9QI2Q=;
	b=U1xvm2gYCs+Gb5aVd+gE4xAAW3fH2dcanaa9imgR4IIYfjGRYI5Hq9WcE+/gQwUFRG
	uc61G3Ff13U1GK8t39U0oaVbJuZ70T1YYvLAbc4vB1Za477KfYyhWtpfbTIqAW4cVi17
	jfpd0WSc8S+cEvOTmDaGD6CByRA0Nu/iEfpKT32ykc7avI3c6qUywx6laZTZNAWfahi3
	zeKRPibFufr44AcQ/BfkiA2p4MQaybgSqRwnnGCKr9x6hBroMMsE1JARPe4QtQ99HgLT
	EU0XGKpO4nrA9lE/rczI4p+CBP39Yt0o28NiUSSf5oksYDXNIUEe41Hpls4hbT6b3RCP
	VBQQ==
X-Received: by 10.50.7.97 with SMTP id i1mr2445199iga.75.1452325450643; Fri,
	08 Jan 2016 23:44:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Fri, 8 Jan 2016 23:43:41 -0800 (PST)
In-Reply-To: <CAJ86T=X=s81M+2ywKV4T63A31sfmcRnHHar5oUMd4JsS+UFezw@mail.gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
	<604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
	<555844c65d44169bb4478d4470a802ebc2fe2f94.1452248145.git.raj.khem@gmail.com>
	<CAJ86T=X=s81M+2ywKV4T63A31sfmcRnHHar5oUMd4JsS+UFezw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 8 Jan 2016 23:43:41 -0800
Message-ID: <CAMKF1soHO0h6a6YACrHpGXBJe6mufruYwJu+d0nFj_85Jci00g@mail.gmail.com>
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
X-List-Received-Date: Sat, 09 Jan 2016 07:44:11 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 8, 2016 at 7:27 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> +diff -Naur DirectFB-1.7.6.orig/lib/direct/os/linux/glibc/mutex.h DirectFB-1.7.6/lib/direct/os/linux/glibc/mutex.h
>> +--- DirectFB-1.7.6.orig/lib/direct/os/linux/glibc/mutex.h      2013-12-18 19:16:24.000000000 -0500
>> ++++ DirectFB-1.7.6/lib/direct/os/linux/glibc/mutex.h   2015-07-18 16:57:47.178982835 -0400
>> +@@ -46,7 +46,7 @@
>> + /**********************************************************************************************************************/
>> +
>> + #define DIRECT_MUTEX_INITIALIZER(name)            { PTHREAD_MUTEX_INITIALIZER }
>> +-#define DIRECT_RECURSIVE_MUTEX_INITIALIZER(name)  { PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP }
>> ++#define DIRECT_RECURSIVE_MUTEX_INITIALIZER(name)  { PTHREAD_MUTEX_RECURSIVE }
>
> This looks completely bogus.
>
> PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP initialises a pthread_mutex_t
> structure and PTHREAD_MUTEX_RECURSIVE is an enum. You can't just
> replace one with the other.

It indeed is bogus. I took it as a stepstone to get it compiling but
in reality what we need is a portable way to initialize recursive
mutex instead of _NP
something like using pthread_once during lock initialization. Let me
see what can be done.

