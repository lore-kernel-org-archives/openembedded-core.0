Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id 6A49576A7D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 13:40:33 +0000 (UTC)
Received: by oiev193 with SMTP id v193so2986719oie.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 06:40:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=tg68dAdKnrgyvb6Avst2+dr4QNd25wnRE/w1+sRKpw8=;
	b=h7wz3JwKWWTz+Rhht45GOse9K44t1aL78fzBUYEvKOwMj75qwpjBw9Z+QO8L6Y2Igj
	YtT25MuhcSsNaaAZg4N9HZb+i+quIuSMXJ+DJzElU8AJ5h9b0Pxq5Apev04dL++/Ahgb
	M6eYgvNGSAh+CR7gCCxE2uqYaNxL4rdYXFiAWzC595KWcad0IhMThlNl+aaiTteeYt+5
	AdaNfebLZo20AKV0YjSH1cth9yijmtuiBqcynhht87q+9vI8OnUhBGqQ4nltUUJQHnqx
	LF1QWz50tMdLKl3XgTFMxRXnWm2sanMVMP9idDmBZ+amR7Kzdit6G116W24nDI2jNG9X
	0a8Q==
X-Gm-Message-State: ALoCoQmO9F4PIpxXMUw0L9mIaOU/Li1afe4nQZoDF9QO/mcq1VUrK11sJZGLtYmSyJ5RbreTWRjD
X-Received: by 10.202.227.12 with SMTP id a12mr6347841oih.125.1439991634153;
	Wed, 19 Aug 2015 06:40:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.221.70 with HTTP; Wed, 19 Aug 2015 06:40:04 -0700 (PDT)
In-Reply-To: <CAJTo0La_QNGCLsHDFT=Wx3KbfJqwiMuR0DQ06T_LnN6zWxJ+Xg@mail.gmail.com>
References: <1439974264-7891-1-git-send-email-jussi.kukkonen@intel.com>
	<CAJTo0La_QNGCLsHDFT=Wx3KbfJqwiMuR0DQ06T_LnN6zWxJ+Xg@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 19 Aug 2015 16:40:04 +0300
Message-ID: <CAHiDW_E1Pyx4caVY-o2JH8v1xn+-5fuzGPTe1b1KoaMFf3V0Xw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssh: build regression test binaries
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
X-List-Received-Date: Wed, 19 Aug 2015 13:40:35 -0000
Content-Type: text/plain; charset=UTF-8

On 19 August 2015 at 14:25, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 19 August 2015 at 09:51, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
>>
>> +make -k .OBJDIR=`pwd` .CURDIR=`pwd` SUDO="sudo" tests \
>
>
> Presumably this means that openssh-ptest should rdepend on sudo?  Is sudo
> only used if the tests are executed as non-root?

I guess yes, it should then rdepend... obviously it also expects sudo
to work without user interaction. In the examples I checked $SUDO is
used regardless of uid, and in several cases the test checks that SUDO
is set to something (skips if not set) and then runs "$SUDO
<command>". I'd rather set SUDO to something that works than modify
lots of test cases. Unfortunately even when root, tricks like setting
SUDO=" " won't work as in some cases actual sudo options are used.

Now that I look more closely, the tests practically require being root
as well as having sudo on a oe system anyway as they create files in
the ptest directory at runtime. As non-root even the test setup will
fail.

I'll add the RDEPENDS and re-send, let me know if I should try fixing
something else as well.

Jussi


> Ross
>
> ---------------------------------------------------------------------
> Intel Corporation (UK) Limited
> Registered No. 1134945 (England)
> Registered Office: Pipers Way, Swindon SN3 1RJ
> VAT No: 860 2173 47
>
> This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). Any review or distribution
> by others is strictly prohibited. If you are not the intended
> recipient, please contact the sender and delete all copies.

