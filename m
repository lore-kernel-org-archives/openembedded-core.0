Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id A386A6011A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 19:33:48 +0000 (UTC)
Received: by igbxm8 with SMTP id xm8so21550593igb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 11:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=uBUTjsYx953VnfD+U7nMj90uzG7YUtUzWC5BvunoFvY=;
	b=QOC0Dt2VvVkvQUyb1OmxCMxEzwToNgfuDWJm9X+xFwxhUFCX8dbWbT8yTfh5uxY30y
	6cbV/dHrGEV6tl2SmOkzGwjI0f13TPFN6At/XlS0c4Fv4B00QdPlPIAhYiA7GaIgRrUd
	oRmPRPjfu+KFoodcnLOoFoIef5EGK+wkp0ZhvScCCUIQW9XR8sTXUeUEGfQUC0acUbgU
	gV4PsTgS3xNmcitCcgb3teazz2K3lRtlg30NYztsRth4RTn1UvpwyDbu/wtUFxwxgVov
	nWemAmOeoCd8SIqCf+Sce/3fFAI9J9U/wDzkRPutqaC3LMvlYdmuMVRyGwzLROEXS43J
	QMMA==
X-Received: by 10.50.142.8 with SMTP id rs8mr3925923igb.77.1447788828793; Tue,
	17 Nov 2015 11:33:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.12.205 with HTTP; Tue, 17 Nov 2015 11:33:19 -0800 (PST)
In-Reply-To: <1447773377.1472.28.camel@pbcl.net>
References: <1447739760-14395-1-git-send-email-armccurdy@gmail.com>
	<1447773377.1472.28.camel@pbcl.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Nov 2015 11:33:19 -0800
Message-ID: <CAMKF1sppDtyLvRATLpQHqh8N3ztnyj=r+QPjtwF-jmR+f73QTw@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] directfb.inc: force bfd linker for armv7a
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
X-List-Received-Date: Tue, 17 Nov 2015 19:33:49 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 17, 2015 at 7:16 AM, Phil Blundell <pb@pbcl.net> wrote:
> On Mon, 2015-11-16 at 21:56 -0800, Andre McCurdy wrote:
>>
> +# Workaround for linking issues seen with armv7a + gold
>> +LDFLAGS_append_armv7a = "${@base_contains('DISTRO_FEATURES', 'ld-is
>> -gold', ' -fuse-ld=bfd ', '', d)}"
>>
>
> Does the resulting directfb-csource binary actually work with that
> change?  My recollection is that ld.bfd will just silently permit
> relocs that gold (correctly) refuses to allow.

thats right. real problem here is that there is a static library
generating with out pic options and being linked into
shared object. gold is flagging it since it will fail at runtime.
Please pass --enable-shared to configure that should help
if that does not then pass -fPIC in CFLAGS

