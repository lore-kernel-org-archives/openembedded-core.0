Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id DB50C61788
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 11:37:25 +0000 (UTC)
Received: by mail-ob0-f174.google.com with SMTP id wd6so1798647obb.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2013 04:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=LI6Px0ZTiCklyNPAujL0K08LDSct7Vr5ydhmuSPq7dA=;
	b=Ld1Xp+hJouedHIxQwDnReQ4BT6D7wmFKXjO6ItzQ15OnNR9zP3JJz6IJ5PJUP1dZsl
	5Z6tt1XUi0QoS0e7h2ZDv2ClKLiAuWR6GkcK/2QNjahRJZrekikTyStokDPSJuQm4kD3
	t1EDL4aPVLpZc1w/BeBJalIGpyQaMCITgPAadU4nzILMEZCtfjMC08aWoMWojTrzOyk5
	0NT70E2l3E2sm88NO7S1B8bABFntqXMFCo10KafCvR+eeMff7PtBXhUO5TXurggGLiJZ
	0CeS83aaHZ7HopX+3AS64E/ua+g7y4+T3BnbMpLgkDuRgx3ozai/3F91Cnv/rOYKIzAj
	7ylw==
MIME-Version: 1.0
X-Received: by 10.60.132.178 with SMTP id ov18mr6012399oeb.39.1378381047169;
	Thu, 05 Sep 2013 04:37:27 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Thu, 5 Sep 2013 04:37:26 -0700 (PDT)
In-Reply-To: <CAJTo0La0W7PXkuBsvqD2XqPMMbbLtmJef5T97sikSJogZ1XCiQ@mail.gmail.com>
References: <cover.1378339881.git.dvhart@linux.intel.com>
	<7e9270b1c56aeeb6ed22210cab98d2675b092d5d.1378339881.git.dvhart@linux.intel.com>
	<CAJTo0La0W7PXkuBsvqD2XqPMMbbLtmJef5T97sikSJogZ1XCiQ@mail.gmail.com>
Date: Thu, 5 Sep 2013 08:37:26 -0300
X-Google-Sender-Auth: z1ZV9OVK5zwYng5Bgz1ahMrmMRY
Message-ID: <CAP9ODKqVU+ka+VzjPj6p0iVsirrOSqLtDFWNzfBcKutwj1Fo3Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>, Poky <poky@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] xorg-driver-common: Add configure and install appends from meta-intel
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
X-List-Received-Date: Thu, 05 Sep 2013 11:37:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Sep 5, 2013 at 6:53 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 5 September 2013 01:18, Darren Hart <dvhart@linux.intel.com> wrote:
>> +# AC_CHECK_FILE doesn't work when cross compiling, so we create a replacement
>> +# macro that simply assumes the test succeeds. This is required for at least
>> +# the -intel and -mga drivers.
>> +do_configure_prepend () {
>> +       echo 'AC_DEFUN(CC_AC_CHECK_FILE, $2)' > ${S}/configure.ac.new
>> +       sed 's/AC_CHECK_FILE/CC_AC_CHECK_FILE/g' ${S}/configure.ac >> ${S}/configure.ac.new
>> +       mv ${S}/configure.ac.new ${S}/configure.ac
>> +}
>
> I've been systematically fixing the drivers that use AC_CHECK_FILE so
> now as far as I know we're left with just one (-mga), for which my
> patch has been submitted upstream.
>
> I'd prefer to see the patch retained and upstream fixed instead of
> working around the breakage, because the test that configure.ac is
> attempting to do is valid, it's just done wrong.

So I think this should be dropped from here.

>>+# FIXME: We don't want to include the libtool archives (*.la) from modules
>>+# directory, as they serve no useful purpose. Upstream should fix Makefile.am
>>+do_install_append() {
>>+       find ${D}${libdir}/xorg/modules -regex ".*\.la$" | xargs rm -f --
>>+}
>
> Sadly when using libtool you can't "opt-out" of installing .la files
> unless you delete the files that just got installed.  In my opinion
> this is something that needs to be done globally instead of
> per-recipe.

So autotools.bbclass?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

