Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f175.google.com (mail-yk0-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id E3E1B609B1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 21:42:33 +0000 (UTC)
Received: by mail-yk0-f175.google.com with SMTP id q200so31733ykb.34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Aug 2014 14:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=zdaFjzTkDZoQ8cscg+RW/S7X+S5lDdh1kAKY0VWsC3Y=;
	b=QEVyWSVq48FO8s6fSQFcYT6ltUKvqheFD/o34BwZ96QwZYdMc0hdQvNiOJb26MAtFW
	cqcp4OM0z9OBe2CLew09jp2GmFE1c11Gbbg59cPvqce/ZqOdxRgv2367ax3/uYsfu1vh
	bsp9114tN8SmW1sSovz67xNGUboYL/dUCWEJlNyJlvSETU1r0vbhy+hBeLCnh9ei3L6o
	3keICEvLBnnBdl1a9qXzuF1bNPuzNiNJolHVbxO1cHGPTGIYoMx6DqCh9YPtqumTkoQK
	n+oN2qeLZCFlRa1Oflp/HIQd9dQvXZ/MlUMf0yYIe7UNtFrfAgrojaNXh3a35D2kZbeD
	Cd3w==
MIME-Version: 1.0
X-Received: by 10.236.103.135 with SMTP id f7mr42282411yhg.102.1407188555053; 
	Mon, 04 Aug 2014 14:42:35 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Mon, 4 Aug 2014 14:42:34 -0700 (PDT)
In-Reply-To: <20140804213821.GA10174@bshelton-desktop>
References: <cover.1407177403.git.ben.shelton@ni.com>
	<17ffe840a21d09f0dcb1cdfeb13d9d21331055f9.1407177403.git.ben.shelton@ni.com>
	<CAP9ODKqkaSZde6TuXw=VdverfKWP-o03=5VmLgfRNUias50gxg@mail.gmail.com>
	<20140804213821.GA10174@bshelton-desktop>
Date: Mon, 4 Aug 2014 18:42:34 -0300
X-Google-Sender-Auth: n1W3XszTQL4uk66mOGb26wb3hyA
Message-ID: <CAP9ODKqykzm_0qQ2YY3pTs=Bofuwq5PQC7_4xb_C+S6ak43cEA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Ben Shelton <ben.shelton@ni.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/20] udev-cache: parametrize sysconf file paths
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
X-List-Received-Date: Mon, 04 Aug 2014 21:42:41 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 4, 2014 at 6:38 PM, Ben Shelton <ben.shelton@ni.com> wrote:
> On 08/04, Otavio Salvador wrote:
>> On Mon, Aug 4, 2014 at 3:41 PM, Ben Shelton <ben.shelton@ni.com> wrote:
>> > From: Richard Tollerton <rich.tollerton@ni.com>
>> >
>> > The udev-cache facility uses files that represent system states, to
>> > ensure that the cache tarball is valid to apply. These paths were
>> > hardcoded in several places; collect them into DEVCACHE_SYSCONF and
>> > DEVCACHE_CURRENT_SYSCONF in the defaults file.
>> >
>> > Natinst-Rally-ID: TA44427
>> > Acked-by: Gratian Crisan <gratian.crisan@ni.com>
>> > Natinst-ReviewBoard-ID: 58620
>> > Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
>> > ---
>> ...
>> > --- a/meta/recipes-core/udev/udev/udev-cache
>> > +++ b/meta/recipes-core/udev/udev/udev-cache
>> > @@ -23,12 +23,12 @@ if [ "$ROOTFS_READ_ONLY" = "yes" ]; then
>> >      exit 0
>> >  fi
>> >
>> > -if [ "$DEVCACHE" != "" -a -e /dev/shm/udev.cache ]; then
>> > +if [ "$DEVCACHE" != "" -a -e "$DEVCACHE_CURRENT_SYSCONF" ]; then
>> >         [ "${VERBOSE}" != "no" ] && echo "Populating dev cache"
>> >         (
>> >                 tar czf "${DEVCACHE}.tmp" dev -C / --exclude=log
>> >                 mv -f "${DEVCACHE}.tmp" "$DEVCACHE"
>> > -               mv /dev/shm/udev.cache /etc/udev/cache.data
>> > +               mv "$DEVCACHE_CURRENT_SYSCONF" "$DEVCACHE_SYSCONF"
>> >         ) &
>> >  fi
>> >
>> > diff --git a/meta/recipes-core/udev/udev/udev-cache.default b/meta/recipes-core/udev/udev/udev-cache.default
>> > index 656c2a4..7f39a68 100644
>> > --- a/meta/recipes-core/udev/udev/udev-cache.default
>> > +++ b/meta/recipes-core/udev/udev/udev-cache.default
>> > @@ -2,4 +2,8 @@
>> >
>> >  # Comment this out to disable device cache
>> >  DEVCACHE="/etc/udev-cache.tar.gz"
>> > +
>> > +DEVCACHE_SYSCONF="/etc/udev/cache.data"
>> > +DEVCACHE_CURRENT_SYSCONF="/dev/shm/udev.cache"
>> > +
>> >  PROBE_PLATFORM_BUS="yes"
>> > --
>>
>> Most users won't need to change this so I think this should have a
>> default value in the script and don't be added in the default.
>>
>
> My concern is that the uses of both DEVCACHE_SYSCONF and
> DEVCACHE_CURRENT_SYSCONF are split across two script files: udev/init
> and udev/udev-cache.  I don't like replicating the same default setting
> in both, but if that's preferable to adding it in the default, that's
> OK.

I think this also provides a backward compatibility for users
providing their own default file. Otherwise you'll break those.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

