Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f177.google.com (mail-yk0-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6ADCF60E68
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Mar 2014 15:17:22 +0000 (UTC)
Received: by mail-yk0-f177.google.com with SMTP id q200so4740805ykb.36
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Mar 2014 08:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=dnYt/TEMgh90BUp8+UbCow6P4Q/cyy4OTbdTj2nll9g=;
	b=tANEKB0jAfTde+GB1A/Dr+IACLrZ86tGa6DI4WOJ/V+AH5suYTZHWdxglbIJDgfCf0
	ruD6PKE06OGL0JPNsBP/CjYrh+C9HG3gYm87UCW8j94zI+n2bnh3pvCkeEt6tS4saXmJ
	akxN/K/M6pjt2zRYxjQP1SJXkGc0hcMZSU9GkU/Qbz9eliyXgzDRpy0CaWJY4IugsK4t
	wfGVjLit2uf4CrPikUO3kj4w7ZmP+z6XYrcH7Q+ItSTSYL1IsPVzpV+kfGrYYLAvQWEf
	3ihTH+G8q/czi3CbQOJkQlD1EBNDtqI7Gbx1ffJd249+1yzJpYzj7uAdpuxIhAUVmAz4
	4qXg==
MIME-Version: 1.0
X-Received: by 10.236.96.201 with SMTP id r49mr21035309yhf.33.1396106243747;
	Sat, 29 Mar 2014 08:17:23 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Sat, 29 Mar 2014 08:17:23 -0700 (PDT)
In-Reply-To: <1396042184-7372-1-git-send-email-denis@denix.org>
References: <1396042184-7372-1-git-send-email-denis@denix.org>
Date: Sat, 29 Mar 2014 12:17:23 -0300
X-Google-Sender-Auth: LI6HzmWkX9bLMixYyLXp1HrwbIY
Message-ID: <CAP9ODKrGXUwy8WkM-UyHHoqKAs2J4eabPOh00COsATSu5_A-Vw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Sat, 29 Mar 2014 15:17:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Denys,

On Fri, Mar 28, 2014 at 6:29 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> This is done to work around the issue of auto-mounting block devices
> (i.e. SD cards) when root filesystem is still in read-only mode and
> creating /media/<device> mount-points by udev is not possible. That
> is due to udev (/etc/rcS.d/S03udev) getting started earlier than
> checkroot (/etc/rcS.d/S10checkroot.sh) gets a chance to re-mount the
> rootfs as read-write.
>
> Although, canonical FHS specifies /media/<device> as a mount point
> for removable media devices, the latest 2.3 version was released in
> 2004 and since then FreeDesktop/udisks and other tools adopted the
> new /run/media/<user>/<device> location. That was done to overcome
> read-only rootfs limitation, since /run is usually a tmpfs mounted
> partition, plus avoid name-clash between users.

Agreed.

> For our embedded systems environment we assume single-user operation
> and hence simplify mount point to just /run/media/<device>.

Please don't. I have customers using multiple users in an embedded
device and so I think it is better to adopt udisks standard here
instead of diverging from it without a reasoning.

...
> diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
> index cb57e47..3e4f21f 100644
> --- a/meta/recipes-core/udev/udev-extraconf/mount.sh
> +++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
> @@ -20,7 +20,7 @@ done
>  automount() {
>         name="`basename "$DEVNAME"`"
>
> -       ! test -d "/media/$name" && mkdir -p "/media/$name"
> +       ! test -d "/run/media/$name" && mkdir -p "/run/media/$name"

Please see above...

...

> --- a/meta/recipes-core/udev/udev-extraconf_1.0.bb
> +++ b/meta/recipes-core/udev/udev-extraconf_1.0.bb
> @@ -4,7 +4,7 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
>                      file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
>
> -PR = "r16"
> +PR = "r17"

Don't change PR; in fact with this change I'd say to move it to 1.1 and drop PR.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

