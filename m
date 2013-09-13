Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id A38DF60FD5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 21:09:47 +0000 (UTC)
Received: by mail-ie0-f170.google.com with SMTP id x13so3821401ief.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 14:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=AAwwPdsl1Mo37gdewhrvqmEtTk8Gxb/vjxGda5A65sU=;
	b=UTpWsmjKwL9GbolQnq91LeDJFVvWf6F0u9R1Rg2fpuPyMTGhFLRZIEUipb5Niigwyi
	mkDcHDE0KzX/rXQdVzTNjaExYINfH/xoEdKT2D/KcT7vg8CjR95LQ1dTLlTkoNkTOdjh
	2UNIjNYZnyKEAesTqHIvlJr4L3304ItkazY8Hryizs88rjD68T87mC5MiO0Nys9eZtaf
	IOkqhvaYyBljbz6PUO8KYom2WgnzmXQAgDb3iY5UaLxMnzJ6oN4FKR3LcoQcyAIJWgvw
	l+AJHJVJeoL1/k4V/nl7fGsGULTdXmuqV/PFe89xGYiQBLKrNT/E9fLGtS7Vo+KORz1V
	ng3g==
MIME-Version: 1.0
X-Received: by 10.50.73.194 with SMTP id n2mr2090458igv.6.1379106588892; Fri,
	13 Sep 2013 14:09:48 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.64.20.229 with HTTP; Fri, 13 Sep 2013 14:09:48 -0700 (PDT)
In-Reply-To: <1378917967.3484.199.camel@ted>
References: <cover.1378361078.git.nitin.a.kamble@intel.com>
	<2b4e12bfea634eaecac61b471a9d607fe127d1cd.1378361078.git.nitin.a.kamble@intel.com>
	<1378369981.32427.23.camel@ted>
	<CAJTo0LbLaH4-YTJVo_yr-gsaaSbXXe9Ucfbq_i+4gO+qKa354Q@mail.gmail.com>
	<CAP9ODKo0KQ3gJd+eCfzDF0QX9EYb_NhRRX6NWJOKsxWth7_wxg@mail.gmail.com>
	<CAJTo0LYUL1kvZB=Lk8ine+zVpAipRNMevnnpLi5C2_+ZobLdyw@mail.gmail.com>
	<1378917967.3484.199.camel@ted>
Date: Fri, 13 Sep 2013 18:09:48 -0300
X-Google-Sender-Auth: NB0b6KpvQ18Ce8hBKNdA5JF1DtU
Message-ID: <CAP9ODKp7TW6TU44XRkaJPy-WAOJ=9YW745KovZtz-bP+7-NdVw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "meta-intel@yoctoproject.org" <meta-intel@yoctoproject.org>,
	Darren Hart <darren.hart@intel.com>, Saul Wold <saul.wold@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Patch-v2 1/1] mesa: avoid unnecessary rerunning of tasks
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
X-List-Received-Date: Fri, 13 Sep 2013 21:09:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Sep 11, 2013 at 1:46 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2013-09-09 at 12:36 +0100, Burton, Ross wrote:
>> On 7 September 2013 00:56, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> >> Maybe it is time to have a mesa-gl recipe alongside mesa that *just*
>> >> builds the GL libraries.  EMGD can depend on it for the driver modules
>> >> it installs, and presumably other vendors with binary drivers can
>> >> install it for the software rendering/GLX support (Otavio etc, please
>> >> step in here!).
>> >
>> > Yes; we have both situations at Freescale ARM BSP.
>> >
>> > For the AMD GPU binaries, which are used in MX5 SoCs we *just* use
>> > mesa GL and do software rendering.
>>
>> So mesa-gl will work fine there.
>>
>> > For Vivante GPU binaries, used for
>> > MX6, we use mesa GL *headers* but Vivante provides a libGL binary.
>>
>> My, that's horrific.  I'd forgotten about this, for good reason clearly.
>
> So I now have actual code which is better than any thought experiment :)
>
> First, I have this applied:
>
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t1&id=3e2c058ffab5b4e92523dac3078c1bc02d0eb8b8
>
> This creates a machine specific pkgdata/shlibs directory instead of the
> current multiple directories and iterations we use. Its not complete yet
> (buildhistory is broken for example), its another proof of concept. What
> this does is ensure that the main TUNE_PKGARCH directory doesn't get
> corrupted with emgd shlibs below, accidentally or otherwise.
>
> We then have two PoC patches one for OE-Core, one for meta-intel. These
> put the gl bits into "i586-emgd" instead of "i586" so they're isolated.
>
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t1&id=258e068bbb309877b6e36eeec1107806fc710cde
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/metaintel&id=917286eebc5e4eeb13fcc1b0db6adb50ccd847a0
>
> I hacked emenlow so it shared qemux86's TUNE_PKGARCH for testing
> purposes. You can then build both qemux86 and emenlow in the same build
> directory without them trampling clutter.
>
> cogl would also need to inherit the gl class so its rough around the
> edges but basically works.
>
> Thoughts?

Sorry by delayed reply.

I did look at the changes and I did enjoy it a lot. I had something
like this in O.S. Systems fork of OpenEmbedded-Classic to share
multiple builds against compatible geode machines... so let's stop
with nostalgy and focus in 2013 ;-)

It does looks great. I like the idea however I'd prefer if you could
name it like "subarch" or something like that. For example we have
some uses for this in FSL layer:

 * xserver-xorg
 * gpu-viv
 * amd-gpu
 * gst-fsl-plugin

All these are subarch compatible but currently are marked as machine
specific (which slow down builds).

Regards,

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

