Return-Path: <dbaryshkov@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 354F973772
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jun 2015 09:23:53 +0000 (UTC)
Received: by iefd2 with SMTP id d2so14757044ief.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jun 2015 02:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=/lLJKHoMksL7cIDkqnCJISxUWa6a33S0tAQNLKTlSVI=;
	b=ohF3MeyZuVzG8Oe+Bvna+GH9UP0N4XHBKy7QaWJb05Gn0hlP9HPDdZWGbRCId1LlAW
	egwqvA4Rqz7/honoB+wLlp7r28mFw4dJS+YQliU5pFEmnsZMVJGV0b7G/QNs1Ev0pZ2R
	yA4GL20pyy8nk2yBadPizazS4dOh48SFSnMKHpkEkXGvoeWOm5O1TOiHKN9jV3o7S4+b
	RDCV/kt84xZ3/jhMbaS1R/gdduwsiCG5hgys+tap21tdu+/L2bAyszH0diG/rA/D+IK+
	iSH/YOVmOsSh5jQCuqp9Rpqd3VYTOtgtjiuhUNgvlTuEAzLt+tjpPDRWHSgORSfrbd4Z
	QutA==
MIME-Version: 1.0
X-Received: by 10.50.79.169 with SMTP id k9mr3028306igx.44.1434705834414; Fri,
	19 Jun 2015 02:23:54 -0700 (PDT)
Received: by 10.64.130.201 with HTTP; Fri, 19 Jun 2015 02:23:54 -0700 (PDT)
In-Reply-To: <1434633188-3434-1-git-send-email-dbaryshkov@gmail.com>
References: <1434633188-3434-1-git-send-email-dbaryshkov@gmail.com>
Date: Fri, 19 Jun 2015 12:23:54 +0300
Message-ID: <CALT56yOBxbjc=F96unuigiBAR9En9kYKce9ZqWmtkneOGYVQqQ@mail.gmail.com>
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, mark.hatle@windriver.com
Subject: Re: [PATCH 1/3] arch-mips.inc: don't override TRANSLATED_TARGET_ARCH
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
X-List-Received-Date: Fri, 19 Jun 2015 09:23:58 -0000
Content-Type: text/plain; charset=UTF-8

> On 6/18/15 8:13 AM, Dmitry Eremin-Solenikov wrote:
>> Currently MIPS64 N32 is broken. There is internal disagreement
>> between TARGET_ARCH (which doesn't contain ABIEXTENSION) and
>> TRANSLATED_TARGET_ARCH (which contains ABIEXTENSION). ABI is already
>> encoded into the TARGET_OS. ARM tunes in the same situation override
>> neither the TARGET_ARCH nor the TRANSLATED_TARGET_ARCH. So let's drop
>> this override.
>
> This series won't work properly, unless I'm reading something incorrectly.
>
> You won't be able to build/install a tri-lib system after this change, as
> something needs to be there to differential between MIPS32 (o32), MIPS64 (n32)
> and MIPS64 (n64).
>
> Currently this is done via the ABIEXTENSION value.

Why do you need this differentiation in the TARGET_ARCH? We have TARGET_SYS
(triplets) for that, don't we? And the compilers for the N64/N32 (the
only thing IIRC
that is really dependent on the TARGET_ARCH) should be interchangeable, AFAIU.

Can you point me, please, how to create a tri-ABI SDK and/or image?

>
> What is currently broken w/ MIPS64 N32?  We put in a number of fixes for this
> problem and SDK generation in the YP 1.8 time frame.  Perhaps something has
> changed since then or maybe the fixes were not as complete as we thought?

Quite simple configuration (MIPS64 N32 image) fails to build.


lumag@nexs:~/OE$ MACHINE=qemumips64n32 bitbake core-image-base
NOTE: Started PRServer with DBfile:
/home/lumag/OE/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 46391, PID:
15895
Loading cache: 100%
|########################################################################################################################|
ETA:  00:00:00
Loaded 1302 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies
ERROR: Nothing RPROVIDES 'binutils-cross-canadian-mips64' (but
/home/lumag/OE/sources/openembedded-core/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'binutils-cross-canadian-mips64' is unbuildable,
removing...
Missing or unbuildable dependency chain was: ['binutils-cross-canadian-mips64']
NOTE: Runtime target 'packagegroup-cross-canadian-qemumips64n32' is
unbuildable, removing...
Missing or unbuildable dependency chain was:
['packagegroup-cross-canadian-qemumips64n32',
'binutils-cross-canadian-mips64']
ERROR: Required build target 'core-image-base' has no buildable providers.
Missing or unbuildable dependency chain was: ['core-image-base',
'packagegroup-cross-canadian-qemumips64n32',
'binutils-cross-canadian-mips64']




-- 
With best wishes
Dmitry

