Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oa0-f52.google.com (mail-oa0-f52.google.com
	[209.85.219.52])
	by mail.openembedded.org (Postfix) with ESMTP id ECA326CF0A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2013 08:54:10 +0000 (UTC)
Received: by mail-oa0-f52.google.com with SMTP id n10so492684oag.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2013 01:54:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=flQu8CD/w3o6DqnWF+mlkYukGvL1x4VIhUS8fKwJxAQ=;
	b=I2/43F0plymwN3lDjzEo8dkt4haDvHQu60iB7eEXU9RnYtEHo4YznDPyfYlHXSfdGc
	tevJruRJW8eQRXquiPp+93wXlCAhRn1wpPD9J4ijdcRqSBfDdmcnq+yH72a5X0J32ZdL
	OHpyW72yf7pbwmKLPrspAiXcrj4bMIobKQ/m2FTMpap1pXtIzgYiZyUFEd270B+Jwyt7
	eu0ON0lJSzNJsRUQPgLRDA1aaxHFV2el3fcRruyGmFI9KBgy3841lLnHsNQXGWGIgsgv
	TLyakpUUWbmOX4EuApxZBTIicMN85W841/+lV8YhRxFa12E9k/IbuP+cgKkb2f/1+MED
	cVPw==
X-Gm-Message-State: ALoCoQlPtTB3d/BmOYdQtOCj+oXKT0G+fIqHhrgBawhmIacO5S8Md+tWMW6zQ5+EWKp0hM9Z6S6n
X-Received: by 10.182.28.134 with SMTP id b6mr404198obh.27.1382518452546; Wed,
	23 Oct 2013 01:54:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.156.40 with HTTP; Wed, 23 Oct 2013 01:53:52 -0700 (PDT)
In-Reply-To: <CAP71WjxEp-LEe7UW+F9vUig4SAAd8vN4hkm3DUgjYvZQ6TSZ=A@mail.gmail.com>
References: <1378721952-10827-1-git-send-email-ross.burton@intel.com>
	<20130909120824.GQ11500@jama>
	<CAJTo0LaLKDACnUd6BZdUjLR6p87unCaF4pH_g+c3b-5c4w2NLw@mail.gmail.com>
	<CAP71WjxEp-LEe7UW+F9vUig4SAAd8vN4hkm3DUgjYvZQ6TSZ=A@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 23 Oct 2013 10:53:52 +0200
Message-ID: <CAP71Wjx-yoVSyqONwZsTWe5WNNac2nauCuxTNy81n3Ln5qJTzQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Haifeng Yan <haifeng.yan@linaro.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] mesa: use distro_features_check to abort build without opengl feature
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
X-List-Received-Date: Wed, 23 Oct 2013 08:54:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

hi,

On Mon, Sep 9, 2013 at 2:40 PM, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
> On Mon, Sep 9, 2013 at 2:12 PM, Burton, Ross <ross.burton@intel.com> wrote:
>>
>> On 9 September 2013 13:08, Martin Jansa <martin.jansa@gmail.com> wrote:
>> >> +REQUIRED_DISTRO_FEATURES = "opengl"
>> >
>> > Is this really needed? I was building mesa in distro without opengl for
>> > long time and was considering (probably incorrectly) opengl
>> > DISTRO_FEATURE more
>> > like sign of proper hw GL libraries.
>>
>> I'd always understood the "opengl" DISTRO_FEATURE to mean "give me GL
>> support".  *What* that means depends on the target hardware, could be
>> entirely software rendering through Mesa or binary HW drivers.
>
>
> how about gl vs gles?
>
> i have been trying to understand over the last couple of days whether or not
> 'opengl' in DISTRO_FEATURES means OpenGL and OpenGLES. I don't think it's
> clearly indicated anywhere.
>
> in libsdl recipe, we have this:
>
> DEPENDS = "${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '',
> d)} \
>            ${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl',
> '', d)} \
>
> and in EXTRA_OECONF we add this:
> ${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-video-opengl',
> '--disable-video-opengl', d)} \

back on this topic... something is weird. as i said above, we built
our OE based distro for ARM platform with *no* GL support, but with
GLES support. As soon as we pull libav in our images it DEPENS on
virtual/libsdl, and as mentioned above libdsl with 'opengl' in
DISTRO_FEATURES will end up with adding dependency on virtual/libgl
which we don't want (and don't have on our platform).

how do we get around this problem?

i am still not convinced that we should treat GL and GLES with a
single 'DISTRO_FEATURE' since they aren't 'equivalent' features. I
understand we need a mechanism to say if the platforms has 'graphics'
support, and for some recipes 'graphics' is enough, but especially for
libsdl this isn't enough since on GLES platforms we don't want
--enable-video-opengl to be enabled since that is a GL feature, not
GLES.

thanks

