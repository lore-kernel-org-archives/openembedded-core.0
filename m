Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SfxGz-0007m2-GR
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Jun 2012 19:58:57 +0200
Received: by eaal1 with SMTP id l1so1212564eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jun 2012 10:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=t04jGw1usELU74fgnyHOvJUb48OEqWw238UBHio/ZmI=;
	b=Fva4DP+u5LL2DNNUvrXvmqj5ycfQ9vCczrTS/ayIAtAltJx3o0C9/zqpMhtXodbgZR
	aVS0qf+VrKeQNRFNdr9a/KFDPoElpf1p5rXd8R0naX2lpRcKD9xMcUhP6ejTQ10KL1Da
	X/j2rD+IuOwF/iYUyd9yoWxXI72CIOl7pHqQJU5fdZEI5k8NM3f+D8yv1hzpp/QKc6Ub
	Fpeg3crhRaoxOFNHi9C0NB2Wt46v0ZGyZ55cL414+shS9xXOxrWRsP6U+xNtpUcAVurY
	AlP29CSDuf5ZCuKvBkjic5Yn15897E1/qaFElmZauyIKq7BeHfitgLxb0Hqmf5H9oCBH
	sCcg==
Received: by 10.14.97.70 with SMTP id s46mr2389797eef.118.1339868897654; Sat,
	16 Jun 2012 10:48:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.188.11 with HTTP; Sat, 16 Jun 2012 10:47:46 -0700 (PDT)
In-Reply-To: <4FDCB690.8090004@linux.intel.com>
References: <cover.1339799869.git.dvhart@linux.intel.com>
	<5f472764f7cea2d386b7ee572870fc03769868fc.1339799869.git.dvhart@linux.intel.com>
	<4FDBBD8D.1050201@linux.intel.com>
	<1339863500.3339.150.camel@x121e.pbcl.net>
	<4FDCB690.8090004@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 16 Jun 2012 10:47:46 -0700
Message-ID: <CAMKF1soXK8fTW_LJZy2a0Mr1K1Aiwv-OA1rj_d_DGF8vHga5cg@mail.gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Phil Blundell <philb@gnu.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] busybox: Include setsid and cttyhack in defconfig
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 16 Jun 2012 17:58:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 16, 2012 at 9:38 AM, Darren Hart <dvhart@linux.intel.com> wrote=
:
>
>
> On 06/16/2012 09:18 AM, Phil Blundell wrote:
>> On Fri, 2012-06-15 at 15:56 -0700, Darren Hart wrote:
>>> So the delta for including SETSID and CTTYHACK is 2560 bytes.
>>
>> Personally I am still not in favour of adding this to the default
>> configuration. =C2=A0I appreciate that it's "only" 2.5k in this case, bu=
t
>> every time we make a change like this the binary gets a little bit
>> bigger and, over time, it does add up. =C2=A0This sort of gradual bloat =
is
>> quite insidious and difficult to combat after the fact.
>>
>> So, I continue to think that poky-tiny should just provide its own
>> busybox configuration and turn on the options that it wants just like
>> other DISTROs do. =C2=A0No doubt there are some things currently include=
d in
>> the oe-core defaults that poky-tiny doesn't need, so you would probably
>> get a smaller binary that way as well.

in retrospect I agree with Phil on gradual bloat. busybox and other
kconfig based
packages will always have fine tunings that we can never say one size
fits all unless
you enable everything and I think the purpose of using kconfig in
those packages is to provide this fine level of configuration

>
> You are correct that poky-tiny would benefit from a smaller config. My
> original intent was to update the busybox recipe to use the new
> merge-config.sh that we pushed to the upstream Linux kernel (which
> should work with busybox as it uses the same config mechanism). This
> would allow us to maintain a base busybox config with a several config
> fragments that can be easily added via DISTRO_FEATURES rather than the
> complicated hack that is in busybox now for handling DISTRO_FEATURES. I
> prefer this approach as it reduces (if not eliminates) the need for the
> proliferation of busybox.bbappend files.
>

. using merge-config.sh will probably make things better but until
then I don't think its a bad thing to have bbappends in current
scenario

> However, this is a larger project and my immediate goal is to get
> poky-tiny into better shape in terms of the initial experience. This is
> why I originally implemented it as a "tiny" DISTRO_FEATURE as that would
> migrate naturally to the config fragment approach. You and others
> objected to that approach, and I do understand not wanting to complicate
> the DISTRO_FEATURE logic further.
>
> With the above goal in mind, can you accept either of my proposed
> patches as an interim solution? Either as an added tiny DISTRO_FEATURE
> or as a simple addition to the defconfig? I do believe these two
> features are useful beyond poky-tiny.

I think best approach here is to have the defconfig of own in
poky-tiny layer. It will
be a contained change.


