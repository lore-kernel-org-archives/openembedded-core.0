Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6E4F277121
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 16:57:57 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id t15so39766788igr.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Feb 2016 08:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=RC4riLsHo3dbZN+FpGlKwHTEieWDe6UnhDSL83M7u2U=;
	b=h6LwwPanI3X4C72dhl3ziOZHTvW4rqQjZBU60ilpoa/TJPUk9frHlWYHNGbuW71dYG
	/26tct/boLpBGk/00Zwc0fXSnQV6qzOy167Tkc/m38JPuHLy5Z6tjObF/EqMtSGpjcTb
	B/1U2MsszOcZyI6d7PdAmPeBSdi/dNrzEoxcRaSTFbLv8+EaVKpX1uKfQ4LKcBUt/v0e
	44RuO6vGg5+wp8Bj/YtRjPh2GVpMFSSZlshZaO9BRVgZ+X4Oh64JlCR6p3Q3JoOg16rL
	94SdkOjAaGGA5Q5gdbxd3JJvessetgOFsk7jumaBmGPeR/BlrqanY6YCTUYtDi7TnGaS
	ZqNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=RC4riLsHo3dbZN+FpGlKwHTEieWDe6UnhDSL83M7u2U=;
	b=YhO6G3jvy1rRTpgKtTBK5JDS9KBSk7HwD9exOuvm3sKwFKfxEDdcFgY5GJobG+VOhI
	XirEypSW5gxBElnl/CJvIDJb+ETsBY4flhb/aeBCpyVNfBiwbcFUmdgGTtu6n60/sVFJ
	T+L89rltrM/TDCA8jGEVF71FLHc2CCbGgkQEHfp9mgglWrlxrLktA4mneJNwQrBWFGPb
	R+ieASMbuKY74VRgWU/e+xYostkeELTEEA0cviawSxzPH78vA40dfwfV3XwwxXujDrtM
	6b8lUhv+QgJoX5CXmp3h+8rb+ulzPqCnB0nywO2ENV8HiKxu25V7aw3kVGo7Yk7S9qsb
	Uq1w==
X-Gm-Message-State: AG10YOQvBwq+jsKuqiV7ldap1I74RdcjBiToFgMaWKd1bqHpjJl6aVaAhvShjNe4MSHD4XIJsmXiQteck4UsPA==
X-Received: by 10.50.13.102 with SMTP id g6mr12636589igc.77.1454345878656;
	Mon, 01 Feb 2016 08:57:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.46.219 with HTTP; Mon, 1 Feb 2016 08:57:29 -0800 (PST)
In-Reply-To: <1454314457.20696.16.camel@intel.com>
References: <1453495750-104494-1-git-send-email-raj.khem@gmail.com>
	<CAJ86T=U6jUg7+nLPVz_=cEodqRNcK=zHvu3yJBOvg+b9V0XXWA@mail.gmail.com>
	<1454314457.20696.16.camel@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Feb 2016 08:57:29 -0800
Message-ID: <CAMKF1srg=gT+SNznGFoLG2p_gHdwf4FW0UQk_5DqxKTB_A_k4Q@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] busybox: Add support for busybox-init
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
X-List-Received-Date: Mon, 01 Feb 2016 16:58:00 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 1, 2016 at 12:14 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> On Mon, 2016-01-25 at 11:39 -0800, Andre McCurdy wrote:
>> > +        if grep "CONFIG_INIT=y" ${B}/.config; then
>> > +                install -D -m 0777 ${WORKDIR}/rcS
>> ${D}${sysconfdir}/init.d/rcS
>> > +                install -D -m 0777 ${WORKDIR}/rcK
>> ${D}${sysconfdir}/init.d/rcK
>> > +                install -D -m 0755 ${WORKDIR}/runlevel
>> ${D}${base_sbindir}/runlevel
>> > +                if grep "CONFIG_FEATURE_USE_INITTAB=y"
>> ${B}/.config; then
>> > +                        install -D -m 0777 ${WORKDIR}/inittab
>> ${D}${sysconfdir}/inittab
>> > +                        tmp="${SERIAL_CONSOLES}"
>> > +                        for i in $tmp
>> > +                        do
>> > +                                j=`echo ${i} | sed s/\;/\ /g`
>> > +                                label=`echo ${i} | sed -e 's/tty//'
>> -e 's/^.*;//' -e 's/;.*//'`
>> > +                                echo "tty$label::respawn:
>> ${base_sbindir}/getty ${j}" >> ${D}${sysconfdir}/inittab
>> > +                        done
>> > +                fi
>> > +        fi
>
> SERIAL_CONSOLES is typically set differently for different machines. But
> busybox is not machine-specific, therefore using SERIAL_CONSOLE like
> this prevents sstate/package reuse or worse, causes package versioning
> problems.

when busybox is used as init system then it becomes machine specific and we have
a choice to do so which is disabled by default.

>
> This probably was not noticed by the auto-testers because it only causes
> tests to fail when SERIAL_CONSOLES is really set differently. I'm
> wondering whether there should be variable flag for machine-specific
> variables: then using such variables in machine-independent recipes
> could trigger a QA warning.
>


> --
> Best Regards, Patrick Ohly
>
> The content of this message is my personal opinion only and although
> I am an employee of Intel, the statements I make here in no way
> represent Intel's position on the issue, nor am I authorized to speak
> on behalf of Intel on this matter.
>
>
>

