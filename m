Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 6863E745B4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2018 22:58:00 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id EE3995C1877;
	Wed, 12 Sep 2018 00:58:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1536706681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=n4YxPJl0Fftpgc+Qjq7UpmkuErluG2T7FxPdasly4Ls=;
	b=AgzTmXmoT8GSHUx7JoljCgLliBIK1fq90tETCV/fNPhdMnZcKk6n41/LS4pWjloxn82OHG
	nmgqBrS9Cbn7sRzqwo+vj2qkhqY8KMCEb+7mc5NWCQUoDvxieUS36pjg75tl6gTeUFT4GB
	sylIqNbE4lWZDaxKXcmV4iSzOuScOdg=
MIME-Version: 1.0
Date: Tue, 11 Sep 2018 15:58:00 -0700
From: Stefan Agner <stefan@agner.ch>
To: Mohamed Dawod <mhm.dawod@gmail.com>
In-Reply-To: <CAGCTLNQAv_ktGjwbqKLL_81yHb_uVN2b+CkwXR1eOZc_fBbU6A@mail.gmail.com>
References: <CAGCTLNSbsH7Hto3CwpC+p0YFWQqnYRHYm2TwcbH6w5TzbtBP5A@mail.gmail.com>
	<bdc7edec-3e0b-0d97-05d7-8e7847326b96@konsulko.com>
	<CAGCTLNQF14iHMTvog5iTenWQiCvRkyGfJkN=fskfCDo=AE=7eg@mail.gmail.com>
	<CAGCTLNQAv_ktGjwbqKLL_81yHb_uVN2b+CkwXR1eOZc_fBbU6A@mail.gmail.com>
Message-ID: <c486c6389cda0587116ed752f1c6575e@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.4
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe] Fwd: [openembedded][wayland][weston]: How to configure screen resolution
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
X-List-Received-Date: Tue, 11 Sep 2018 22:58:00 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

I think weston is using KMS connector names.

Try HDMI-A-1.

Otherwise, running weston with --log=weston.log will produce a helpful
logfile.

--
Stefan

On 11.09.2018 02:02, Mohamed Dawod wrote:
> ---------- Forwarded message ---------
> From: Mohamed Dawod <mhm.dawod@gmail.com>
> Date: Mon, Sep 10, 2018 at 1:15 PM
> Subject: Re: [oe] [openembedded][wayland][weston]: How to configure screen
> resolution
> To: <leon.anavi@konsulko.com>
> 
> 
> 
> I typed the following weston.ini and weston-init.bbappend file but no thing
> change !!!!
> 
> --------------------------------------------------------------------------------------------------------------------------------
> This is my weston.ini file :
> ===================
> [core]
> idle-time=0
> 
> [shell]
> locking=false
> 
> [screensaver]
> path=""
> 
> [output]
> name=HDMI1
> transform=0
> mode=1920x1080
> --------------------------------------------------------------------------------------------------------------------------------
> and this is my weston-init.bbappend file :
> ===============================
> DESCRIPTION = "Installation of weston.ini config file"
> LICENSE = "CLOSED"
> 
> FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
> SRC_URI_append = " file://weston.ini"
> 
> do_install_append() {
>     WESTON_INI_CONFIG=${sysconfdir}/xdg/weston
> #    WESTON_INI_CONFIG=/root/.conf
> #    WESTON_INI_CONFIG=/.config
> #    WESTON_INI_CONFIG=/run/user/root/weston
>     install -d ${D}${WESTON_INI_CONFIG}
>     install -m 0644 ${WORKDIR}/weston.ini ${D}${WESTON_INI_CONFIG}
> }
> 
> PACKAGES += "${PN}-ini"
> FILES_${PN}-ini = "${sysconfdir}/xdg"
> -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
> 
> Thank you for your help,
> 
> 
> 
> 
> 
> 
> 
> 
> On Mon, Sep 10, 2018 at 10:30 AM Leon Anavi <leon.anavi@konsulko.com> wrote:
> 
>> Hi Mohamed,
>>
>>
>> On 9.09.2018 14:10, Mohamed Dawod wrote:
>> > Hello,
>> >
>> > I want to know how to change the screen resolution using weston.ini file
>> ?
>>
>> You can set the resolution size width and height in pixels with property
>> mode in the output section of weston.ini. For example:
>>
>> [output]
>> mode=1680x1050
>>
>> Please have a look at weston documentation for details.
>>
>>
>> > How to generate this file and use it for my image?
>>
>> You can update or provide your version of weston.ini through a bbappend
>> file.
>>
>> Best regards,
>> Leon
>>
>> >
>> > Thanks,
>> >
>>
>> --
>> Leon Anavi
>> Software Engineer
>> konsulko.com
>>
>>
>>
> 
> -- 
> 
> Mohamed Dawod
> Computer Engineering Department
> Faculty of Engineering
> Cairo University
> 
> 
> -- 
> 
> Mohamed Dawod
> Computer Engineering Department
> Faculty of Engineering
> Cairo University

