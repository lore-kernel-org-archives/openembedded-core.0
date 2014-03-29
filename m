Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f174.google.com (mail-yk0-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id 51BB960B9B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Mar 2014 21:05:36 +0000 (UTC)
Received: by mail-yk0-f174.google.com with SMTP id 20so4887244yks.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Mar 2014 14:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=Rcflkr9PtaHG7Thh8AMEOfwUt3jbhoCUradzRdFI2so=;
	b=zP12ukCuNGj1S7rtW+QofUJEi7d7fP/oqTAWiuFY3juPMacCZgloDdpiFfBNLOEqOI
	5XAeBzpjQqBzIfbIy992LH5rt52/adV68ZQ+urHzaTFciiPgw35FBvM12u2EWh11jRAz
	aLFjebU8eo55wJZGmap3hi9Sjx830p0ysfm9D2LZ3vcfUOxtYdD5NxoduEKkoLfkRM/q
	6eVCRPLnRMrxixwkiZNZIFgguaGzi/Oa41aXOibCer6nWlhfUHZXGkLYadkDgGALYx+3
	MWL4OFOeLamPRFuDYik18d+UjofS/WIVrvBK/KQitSqZRXJ5NRikDl5qMxPfSuqU8Ud0
	llRg==
MIME-Version: 1.0
X-Received: by 10.236.75.74 with SMTP id y50mr24023486yhd.27.1396127137448;
	Sat, 29 Mar 2014 14:05:37 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Sat, 29 Mar 2014 14:05:37 -0700 (PDT)
In-Reply-To: <20140329205944.GQ3370@denix.org>
References: <1396042184-7372-1-git-send-email-denis@denix.org>
	<CAP9ODKrGXUwy8WkM-UyHHoqKAs2J4eabPOh00COsATSu5_A-Vw@mail.gmail.com>
	<20140329205944.GQ3370@denix.org>
Date: Sat, 29 Mar 2014 18:05:37 -0300
X-Google-Sender-Auth: 94HHsS79Cn_0ck1A13vmxbU642o
Message-ID: <CAP9ODKp0J8on3k_Odtw6w-DJXYTO_Was+JQkB2XzXnBdE5O73Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [RFC] udev-extraconf: update mount.sh to use /run/media instead of /media
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
X-List-Received-Date: Sat, 29 Mar 2014 21:05:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Mar 29, 2014 at 5:59 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Sat, Mar 29, 2014 at 12:17:23PM -0300, Otavio Salvador wrote:
>> Hello Denys,
>>
>> On Fri, Mar 28, 2014 at 6:29 PM, Denys Dmytriyenko <denis@denix.org> wrote:
>> > From: Denys Dmytriyenko <denys@ti.com>
>> >
>> > This is done to work around the issue of auto-mounting block devices
>> > (i.e. SD cards) when root filesystem is still in read-only mode and
>> > creating /media/<device> mount-points by udev is not possible. That
>> > is due to udev (/etc/rcS.d/S03udev) getting started earlier than
>> > checkroot (/etc/rcS.d/S10checkroot.sh) gets a chance to re-mount the
>> > rootfs as read-write.
>> >
>> > Although, canonical FHS specifies /media/<device> as a mount point
>> > for removable media devices, the latest 2.3 version was released in
>> > 2004 and since then FreeDesktop/udisks and other tools adopted the
>> > new /run/media/<user>/<device> location. That was done to overcome
>> > read-only rootfs limitation, since /run is usually a tmpfs mounted
>> > partition, plus avoid name-clash between users.
>>
>> Agreed.
>>
>> > For our embedded systems environment we assume single-user operation
>> > and hence simplify mount point to just /run/media/<device>.
>>
>> Please don't. I have customers using multiple users in an embedded
>> device and so I think it is better to adopt udisks standard here
>> instead of diverging from it without a reasoning.
>
> I guess I should have phrased it a bit better...
>
> This part is a system-wide automount. It gets to run even when no user is
> logged in. In order to do per-user mounting, some sort of session management
> is required. For example, udisks, we both mentioned, starts along with the
> session, when a user logs in, hence allowing per-user mounts.
>
> Since this approach uses udev and gets triggered on addition or removal of
> block devices, described in the corresponding rules, it happens on system
> level and is not dependant on a session or logged in user. When a session
> based approach is used with udisks, these rules should be disabled though.
>
> The two approaches are rather mutually exclusive, but both are valid. There
> are cases when this system-level automount is desired (e.g. in industrial use
> cases) since there are no users are ever expected to log in or interact with
> the system.
>
> So, this is not meant to replace or provide session-based mounting...

Agreed; I missed this but I fully agree now :)

>> ...
>> > diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
>> > index cb57e47..3e4f21f 100644
>> > --- a/meta/recipes-core/udev/udev-extraconf/mount.sh
>> > +++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
>> > @@ -20,7 +20,7 @@ done
>> >  automount() {
>> >         name="`basename "$DEVNAME"`"
>> >
>> > -       ! test -d "/media/$name" && mkdir -p "/media/$name"
>> > +       ! test -d "/run/media/$name" && mkdir -p "/run/media/$name"
>>
>> Please see above...
>>
>> ...
>>
>> > --- a/meta/recipes-core/udev/udev-extraconf_1.0.bb
>> > +++ b/meta/recipes-core/udev/udev-extraconf_1.0.bb
>> > @@ -4,7 +4,7 @@ LICENSE = "MIT"
>> >  LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
>> >                      file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
>> >
>> > -PR = "r16"
>> > +PR = "r17"
>>
>> Don't change PR; in fact with this change I'd say to move it to 1.1 and drop PR.
>
> I thought about it - either PV or PR needs to change. But I wasn't sure about
> bumping PV...

I am all for the PV bumping...

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

