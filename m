Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 3E0606CC8C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 15:09:16 +0000 (UTC)
Received: by mail-ie0-f172.google.com with SMTP id tp5so910157ieb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 08:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=n3Ppk2x1mDvCXejPk7evl5Q4LNwrtzKhifDHfko10jA=;
	b=a93mR/h6Kwz8xHC9l7ayLca6qNoCb9PHPu2VYTkqGRADVK9GJ+m7UMwPa89t47yQP7
	Jws8sVsHTdECqtahcnmkM5lzgPoAykvSCeNxPk601TpqYbPJId/A93VOcX299sABXZLy
	KaW9RdCjye8A3+MjT0o3YQO8vxJWoylham3EXP9vquKxbiYeywQdqdCT62gwTziBKLeb
	XJnwfZsjUt2pqBLYGLvWCKUZSLoRMBkXbMBjvOHXEbaSqQV6st+r6QTAsm5tcJln+Iya
	EAYhgHLy2MqMGtsa8XxjLfRR4JohOGhGdxJ0qedWCjFNFHABRD67LTzRTTMUVNqek5o0
	boQg==
X-Received: by 10.42.202.145 with SMTP id fe17mr11545icb.92.1381849757232;
	Tue, 15 Oct 2013 08:09:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.5.225 with HTTP; Tue, 15 Oct 2013 08:08:47 -0700 (PDT)
In-Reply-To: <1381848709.29912.424.camel@ted>
References: <1381844435.29912.422.camel@ted>
	<CAMKF1sr=L9W+T1izdxJGRznd3BnZLYW58qPs0y5EnRkETZp68A@mail.gmail.com>
	<1381848709.29912.424.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 15 Oct 2013 08:08:47 -0700
Message-ID: <CAMKF1sptASdEk8sTd9OhrRXBmCWCpzhtPCbe9Kk-cjdVDUzkCA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cross-canadian: Fix SHLIBSDIR when using multilib
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
X-List-Received-Date: Tue, 15 Oct 2013 15:09:17 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 15, 2013 at 7:51 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2013-10-15 at 07:45 -0700, Khem Raj wrote:
>> On Tue, Oct 15, 2013 at 6:40 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > Both nativesdk and multilib use MLPREFIX for their partciular purposes. When
>> > we have both set, cross-canadian can confuse SHLIBSDIR. This forces the
>> > variable to the correct value for cross-canadian, fixing toolchains in
>> > multilib builds.
>> >
>> > [YOCTO #5333]
>> >
>> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> > ---
>> > diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
>> > index 4387d05..7181c60 100644
>> > --- a/meta/classes/cross-canadian.bbclass
>> > +++ b/meta/classes/cross-canadian.bbclass
>> > @@ -95,3 +95,8 @@ USE_NLS = "${SDKUSE_NLS}"
>> >  # We have to us TARGET_ARCH but we care about the absolute value
>> >  # and not any particular tune that is enabled.
>> >  TARGET_ARCH[vardepsexclude] = "TUNE_ARCH"
>> > +
>> > +# If MLPREFIX is set by multilib code, shlibs
>> > +# points to the wrong place so force it
>> > +SHLIBSDIRS = "${PKGDATA_DIR}/nativesdk-shlibs"
>> > +SHLIBSWORKDIR = "${PKGDATA_DIR}/nativesdk-shlibs"
>>
>> in the patch that did not work for me
>> I was using ${SDKPKGSUFFIX} instead of hardcoding 'nativesdk'
>> and += instead of =
>
> Well, one of the fields only takes a single value and there is only one
> correct value here so = is more correct. I also needed my preceding
> patch but I tested this and it did work afterwards...

I see. how about using SDKPKGSUFFIX

>
> You could try this (and the other patch) and see if it helps?

I was trying them meanwhile now the build finished so they are working.

>
> Cheers,
>
> Richard
>

