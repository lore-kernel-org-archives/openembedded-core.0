Return-Path: <paul.betafive@gmail.com>
Received: from mail-oa0-f50.google.com (mail-oa0-f50.google.com
	[209.85.219.50])
	by mail.openembedded.org (Postfix) with ESMTP id 402EB605F3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 08:31:56 +0000 (UTC)
Received: by mail-oa0-f50.google.com with SMTP id k7so280361oag.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 01:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=mdyY8/LbPw+fpApRMCfrhenN5UbQwKnPxJn0JDkLdEs=;
	b=DUaMN0SE/rW4jFPjtEplTz809ozPsKRSW9Vls9WNlmJWT/w6UZX/kv0FeEvNLq2l3F
	k7EIinSWPx9/GK4DYWVI+4k9sSWgDsBtLiNtmuh8+OZ11PBZva1UxjfN4hjVQpUU0ZVQ
	Cf74OOLlLrnR3wbVfD5zIHFF9W/+sC48riaXbT6qe3F8JDnnOswxZ3pp1Nat28GfPJ+Y
	3LM3AMDSb3OaygYeuDQgXbfKCSLZTFhx3Rkut+WindZ/lJ9/xRzUGBzXRedLjjhTyTK8
	Sy/yGf/RPV/+7UbcRJXU016OqprZIl4c5HvAJ0HGZ0hb5BlwykYUT8WDmE+CcWQvbx6y
	su/w==
X-Received: by 10.182.153.200 with SMTP id vi8mr26724777obb.27.1374654716497; 
	Wed, 24 Jul 2013 01:31:56 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.76.102.11 with HTTP; Wed, 24 Jul 2013 01:31:16 -0700 (PDT)
In-Reply-To: <CAJTo0LYcYUVxJ0pyMDKTSA_=ezGnn++nSh-MuFsFC40LBwydWw@mail.gmail.com>
References: <cover.1374479372.git.kai.kang@windriver.com>
	<3185bfa72aaa8acd02d32f67ee51de79a24c7c19.1374479372.git.kai.kang@windriver.com>
	<1374481350.6719.83.camel@bril0118.bri.st.com>
	<51EF39C7.2060703@windriver.com>
	<CAJTo0LYcYUVxJ0pyMDKTSA_=ezGnn++nSh-MuFsFC40LBwydWw@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Wed, 24 Jul 2013 09:31:16 +0100
X-Google-Sender-Auth: 60NkW76sVOqJAmVonCIT1Nei6UQ
Message-ID: <CANyK_8difMKU96M-DeL2XHrdR+RV9TFEXvgJDeVey6zktjXprQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] webkit-gtk: fix 'Memory exhausted' error
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
X-List-Received-Date: Wed, 24 Jul 2013 08:31:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 24 July 2013 08:49, Burton, Ross <ross.burton@intel.com> wrote:
> On 24 July 2013 03:19, Kang Kai <Kai.Kang@windriver.com> wrote:
>>> Instead of penalising everybody, would it be possible to make this
>>> change dependent on the build machine (ram + swap)? Or to only add
>>> -Wl,--no-keep-memory if the build failed without it?
>>
>> Yes, it doesn't fail on every build machine. But it seems that build fails
>> randomly on different build machines.
>
> I'm in agreement with the others - this is how individual build
> machine admins make a webkit-gtk build work on their machine if it
> doesn't have enough memory available.  We should probably document how
> to do this in local.conf in the recipe for reference, but not make it
> a default.
>

Perhaps create a bbclass for this that can be globally inherited in
local.conf? I ran into a similar thing with gnuradio and had to drop
PARALLEL_MAKE to get the build to complete with my amount of RAM+swap.
Something like "lean-build.bbclass" that handles known issues for
systems with limited memory.

Would variables like LDFLAGS_webkit-gtk and PARALLEL_MAKE_gnuradio be
applied to the appropriate recipes if they were set in local.conf or a
globally inherited bbclass, or am I misunderstanding how bitbake
parses variables?

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

