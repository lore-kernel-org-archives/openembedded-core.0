Return-Path: <erik.boto@pelagicore.com>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3A77C6D899
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2013 17:02:01 +0000 (UTC)
Received: by mail-ob0-f170.google.com with SMTP id wp18so2642840obc.29
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2013 09:02:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=D0I0/sR3ewklo8A4LVfpeq+jASdd8ZsTNiegM8JmsA8=;
	b=KzrG79GCOzTWb1WJsGUdXhMhIBOSVI4AElfpWahWJd5PfI44MK2ZBnjKMQDQQLDP50
	saxdCrLI+tdCFaYChc935mNiiJaXIfeXewZp6Eedno8V2mjc1ZKlxzzCya7NoUOKjy4N
	6r0h/x9ELitoFaYRl6XrB57TKaY2gN+DaDqh9mtLFnX+XxRcAQ7ooNLWCQJUwgoxpH/j
	uG+lD2ETKnl+dcHzTC31NSyMJZoUYfRYdxYY2sJKSmbvzTL5WvS/PbPPyyFUIOGMnzmA
	ExeK+afufUBM1g9rbdTukvRLmi6uYQ9J+k2atajs74aZBHC1rB7B2gN5O3JNTBTVkmm4
	PkaQ==
X-Gm-Message-State: ALoCoQmwJMfpBUMpiJWd80oAu3ddt6lWt1f81C3J0B9hiiOV6DJHjy1dLHS8oLpy/29TS+suGneD
MIME-Version: 1.0
X-Received: by 10.182.149.168 with SMTP id ub8mr132965obb.74.1385226119946;
	Sat, 23 Nov 2013 09:01:59 -0800 (PST)
Received: by 10.76.28.70 with HTTP; Sat, 23 Nov 2013 09:01:59 -0800 (PST)
In-Reply-To: <CAJTo0LYgrwWu=PkBDnUNdzBQ6Zke4p+0CJfqr9fe4qEE4kCcOw@mail.gmail.com>
References: <CA+AhUGyTC97_E=Yg1JOorHuBDG7SWQS8jfEX1Wg6Ue5pxZfcLw@mail.gmail.com>
	<CAJTo0LYgrwWu=PkBDnUNdzBQ6Zke4p+0CJfqr9fe4qEE4kCcOw@mail.gmail.com>
Date: Sat, 23 Nov 2013 18:01:59 +0100
Message-ID: <CA+AhUGzTUtJs8RshjZvsM+9hA4xJQcDPAP9mAdX=GB_xtOrvmw@mail.gmail.com>
From: =?ISO-8859-1?Q?Erik_Bot=F6?= <erik.boto@pelagicore.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: dbus depends on dbus-ptest-ptest if ptest in DISTRO_FEATURES - bug?
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
X-List-Received-Date: Sat, 23 Nov 2013 17:02:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 22, 2013 at 5:35 PM, Burton, Ross <ross.burton@intel.com> wrote=
:
> On 22 November 2013 09:42, Erik Bot=F6 <erik.boto@pelagicore.com> wrote:
>> I noticed that dbus will pull in the ptest package as soon as ptest is
>> in DISTRO_FEATURES, the recipe contains: RDEPENDS_dbus =3D
>> "${@base_contains('DISTRO_FEATURES', 'ptest', 'dbus-ptest-ptest', '',
>> d)}"
>>
>> Shouldn't this be handled in image.bbclass via
>> COMPLEMENTARY_GLOB[ptest-pkgs] =3D '*-ptest' ? Then it will only be
>> installed if IMAGE_FEATURES contains ptest, which is how other
>> packages handle ptest packages.
>
> Correct, that's a clear bug.
>
> Ross

When trying to fix this I understand why it's done the way it's done.
It's because the glob installing *-ptest won't match dbus-ptest-ptest,
which is the name it get since it's built using it's own recipe
(dbus-ptest_1.6.10.bb).

Should using it's own recipe be accepted as a valid pattern, if that
is the case an extra *-ptest-ptest glob would be needed. Otherwise I
can't think a good solution except for integrating the dbus-ptest
recipe into the dbus recipe. Or am I missing some third option?

Does anyone know why dbus ptest is built as it's own recipe?

Cheers,
Erik Bot=F6

