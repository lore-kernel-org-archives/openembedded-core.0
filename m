Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f50.google.com (mail-oa0-f50.google.com
	[209.85.219.50])
	by mail.openembedded.org (Postfix) with ESMTP id 22FC06B451
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 12:00:28 +0000 (UTC)
Received: by mail-oa0-f50.google.com with SMTP id i4so3062471oah.23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 05:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=tYtKzsbn3Qdp1c4rzy8dxZnYIlyp4OURBd36i0Qk4xg=;
	b=JNWFAxQ39hjJ41u6JbmOz8Tmhnds1vSShSd3Dep1UOjXb1kqODUPd99HED6NXnjMw6
	xxQB4/QaKy8bMSo7RVreY5yeid0ECY9OttyZKxZ2r+a344q24SrP+YEOdHfqP+4TFvr/
	jrZG71Y9O6xRsaLWECmzPW1dIg4U+YrT3tsQqR0VVYVgAb+RTMQuNZ9SJbv6uLVe5IN6
	lDURH7XQ3zaUbrwqRXoR5QiE8s8wdh0GpRgS/qUG23puPLbh/4RfJ2wSj76Xge77S3re
	N4e2zrpyZVHlwEj/bnM5dF4Vw+ujqreI84k2rdwjXe1GY0jiJSi/YcgkDvIHD7z/mKJ1
	h/bw==
MIME-Version: 1.0
X-Received: by 10.60.115.199 with SMTP id jq7mr61793815oeb.19.1375185628475;
	Tue, 30 Jul 2013 05:00:28 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.125.199 with HTTP; Tue, 30 Jul 2013 05:00:28 -0700 (PDT)
In-Reply-To: <14478313.i1FmA8Di2T@helios>
References: <1375136787-18139-1-git-send-email-otavio@ossystems.com.br>
	<14478313.i1FmA8Di2T@helios>
Date: Tue, 30 Jul 2013 09:00:28 -0300
X-Google-Sender-Auth: _OZTBBsDxOQw4gET-gU71J5a00I
Message-ID: <CAP9ODKogS69N51YxJ54-saCXbS0orquD8cbFCWWKLosE_TjSeg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: Add support to EXTRA_DISTRO_FEATURES
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
X-List-Received-Date: Tue, 30 Jul 2013 12:00:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jul 30, 2013 at 7:59 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Monday 29 July 2013 19:26:27 Otavio Salvador wrote:
>> This allow the addition and removal of distro features easily. To add
>> a feature, use:
>>
>>  EXTRA_DISTRO_FEATURES += "wayland"
>>
>> and to remove, use '~' prefix, as:
>>
>>  EXTRA_DISTRO_FEATURES += "~x11"
>>
>> This code has been mostly copied from Mentor Graphics public layer but
>> changed the variable name for a more descriptive name.
>
> 1) Isn't this just adding list subtraction via the back door, which Richard
> has already argued against (mostly because the interaction between it and
> _append/_prepend will be hard to predict)?

We call it and /finalize/ the database so it has _append/_prepend
resolved before mangling the list.

> 2) Why not just set DISTRO_FEATURES to contain just the items you want in your
> distro configuration instead of trying to add and subtract from some previous
> value? What if the previous value changes in a way that no longer fits your
> desired configuration? Surely it is better to just be explicit.

To make this, we cannot reuse Poky distro for example as it
/unconditionally/ appends to DISTRO_FEATURES. Besides it is easier for
test to be able to override it using local.conf. For products I agree
we'll end adding a distro to make it reprodicable but for development
stage this trick makes life much easier.

> 3) Even if we were to add this here wouldn't users expect this to work in all
> such variables and not just DISTRO_FEATURES?

I did this for DISTRO_FEATURES and I don't think it is good to have
this for all vars.

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

