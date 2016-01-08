Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id B822D6FEFA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 17:57:53 +0000 (UTC)
Received: by mail-ig0-f178.google.com with SMTP id ik10so84177657igb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 09:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=z0y6vzN+oDS7XAkltfYzWc7E4nmhGJ98wOxnATbE/yI=;
	b=IrkTy68wYJ296OxSyP5yS+l8rF5JJeJEtimHAuIhBL4j8jj04ovsKXphiW1ct6bY0C
	3nqKFZfqxHqWeU6RAYbBgj+I8CLrg53Hf1ozqIwv07senLCCt42LWHUai8VT+GAkPrEq
	NZxzj795cDDnR4TKmYCcizzyNNC9HDmh94+98MV2qkR8jy0r5rM/qisCG0zosh+lxaeV
	SGUMZzitsKIog7IumSm1sqVCJx2stl8iV4UY2BMbpdkcWmZ7iJwiV+ZA7f6D339F/lOa
	G3OcSlJRCCKLkaklHFeK0Z95WAh99X84o/2mAphvct6BeQw3/4CbT2zx5dEA/93Kd6ej
	XK3A==
X-Received: by 10.50.79.196 with SMTP id l4mr214570igx.11.1452275874137; Fri,
	08 Jan 2016 09:57:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Fri, 8 Jan 2016 09:57:24 -0800 (PST)
In-Reply-To: <CAJTo0LZeEtWA9qNQjNvqDPyW8d6hUjziJr_VuQsdEn4Y5dGcvw@mail.gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
	<CAJTo0La=m_u33L7z06GssdbQoQ0bAFpTweaUchU_kVDfOgnNwQ@mail.gmail.com>
	<CAJTo0LZeEtWA9qNQjNvqDPyW8d6hUjziJr_VuQsdEn4Y5dGcvw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 8 Jan 2016 09:57:24 -0800
Message-ID: <CAMKF1spCJf7sGw7k7-WrzTGOzHxz4uQasdQEdHsxerCSPjkFRQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/53] musl fixes 3
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
X-List-Received-Date: Fri, 08 Jan 2016 17:57:53 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 8, 2016 at 6:53 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 8 January 2016 at 14:00, Burton, Ross <ross.burton@intel.com> wrote:
>>
>> Hm, for some reason, this doesn't work for me.
>>
>> Lots and lots of "files installed but not packaged", all locales.  eg
>> /usr/lib/locale/hu/LC_MESSAGES/glib20.mo in glib-2.0.
>
>
> So under musl the translations are being installed to /usr/lib/locale,
> whereas under glibc its /usr/share/locale. This is showing some problems in
> bitbake.conf: that sets localedir to ${libdir}/locale but then sets
> FILES_PN-locale to ${datadir}/locale.

I have seen those too but have not gotten to them since they were
warnings and thus prioritized for later. but you seem to have found
the reason
I think it should be in
/usr/share/locale, I think bitbake.conf should also do the same.

we need to enhance glib's gettext macros to include musl triplets in
same lines as uclibc see

https://github.com/kraj/openembedded-core/blob/kraj/musl-fixes/meta/recipes-core/glib-2.0/glib-2.0/uclibc.patch


>
> Ross

