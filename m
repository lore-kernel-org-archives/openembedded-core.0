Received: from mail-vc0-f173.google.com ([209.85.220.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TyniT-0002VD-TO
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 19:09:30 +0100
Received: by mail-vc0-f173.google.com with SMTP id fy7so479004vcb.32
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 09:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=VBNgDITAXby5Kwwctv24s/dqwCah4CENuHyAoYw+tWI=;
	b=Jw5e4WhDybxlfFXu8rwdii6JPZRIUx9GtiJv2O5D6Rbhn6X5h38PqAHbwJlJtt6Eum
	T4hkA92mr4I1x8ETpfq1bhB7YUrvPURGmmtkwDUYCBQdgYgpFmX71shNJG5YQC0Ezu6A
	agzI19/JVYAL9qJwVT1qFoAlewBDoSMYSWMFyn2PeWxe6snnxKMLCimFU+JMgieOwOh8
	81IRtyrxqfWGs4wvsaDT0/UfULIyb3SPgqI09ViSv7m/79jHaKqp3sKtNzaAF3JvzcrC
	IW9RpOmaNF3fxuRANwJ8IGUqXvXdX6NyyZi/634heeTbBTkBHivs4KnOgftyOTC6fhkV
	ZMng==
MIME-Version: 1.0
X-Received: by 10.52.21.107 with SMTP id u11mr5965245vde.101.1359136434772;
	Fri, 25 Jan 2013 09:53:54 -0800 (PST)
Received: by 10.52.95.243 with HTTP; Fri, 25 Jan 2013 09:53:54 -0800 (PST)
In-Reply-To: <CAJTo0LYW7BJ1WT=+GcHXDDRb+ONuKiUxw0ehEkNJgt=b6HY42Q@mail.gmail.com>
References: <1359125976-26763-1-git-send-email-radu.moisan@intel.com>
	<CAJTo0LanTczb=N=dgA+3DHc=WABsivhsmPzO6riEy9_Neb6DbQ@mail.gmail.com>
	<20130125151241.GJ3200@jama>
	<CAJTo0LYW7BJ1WT=+GcHXDDRb+ONuKiUxw0ehEkNJgt=b6HY42Q@mail.gmail.com>
Date: Fri, 25 Jan 2013 18:53:54 +0100
Message-ID: <CALbNGRRM2u80Pdbt7XOhbWTDBBceEpmdN-1drCTVTp_Ez7UQFg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] systemd: set default.target to multi-user.target
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Jan 2013 18:09:30 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 25, 2013 at 6:50 PM, Burton, Ross <ross.burton@intel.com> wrote:
> Hi,
>
> Been chatting to Richard.  How about systemd ships a symlink to
> multi-user, and the X11 init script packages change the symlink to
> graphical in their postinst.
>
> (we must remember to put this in the release notes for anyone who has
> a custom X init script)
>
> Ross
>
Have not yet tested but how about:

pkg_postinst_systemd () {
if [ -n "$D" ]; then
	# no display-manager.service around?
	if [ ! -e ${D}${systemd_unitdir}/systemd/system/display-manager.service -a \
	     ! grep 'Alias=display-manager.service'
${D}${systemd_unitdir}/systemd/system ]; then
		ln -s ${systemd_unitdir}/system/multi-user.target
${D}${systemd_unitdir}/systemd/system/default.target
	fi
fi

...

Andreas


