Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0DC0B6013D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2015 10:26:31 +0000 (UTC)
Received: by igbhl2 with SMTP id hl2so23401183igb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2015 02:26:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=57EYHBZSSHplT5GLj3nCu7scToGPfnBSnCz7cwdmVbw=;
	b=m+IfiP6zvbWM69oprwhEIS52SyPXx+0Dgy9AH7m0Zddk1SdkNxs294cNRtqUn9/xl8
	2o9ycV8N9L9rT6AFsh68kgvttTpRYXY7Pq6nY70zkw9w2Z18l3h2VsdZbC/Agtz2G+xG
	2d0Z8LimN87hKqqcaIurmnEK+EJL5bH2A4labLLuEfHDmeSsDpmjQv8lLbooZEpWFJDF
	znVoSjtHGOA3U04cmIazc1DjYy6Nm2yie4P5t3mQ7CxzHDZxl4vBwlTqeEaqST7Wl6tP
	0/0gdEKgNuq7xM/zo3jgpmoTUrk8n04lYS7Bll5wKnwWZ6Zqc7tntTU0V/ROnRDiNreR
	YeuA==
X-Gm-Message-State: ALoCoQnWw8Oh8aZXD5w1jWQEYcVVNUhUxkkt+ZS9Bq1IAotA2I1c/h39VpOesdPFBwbWx356OqmZ
X-Received: by 10.50.4.40 with SMTP id h8mr27431297igh.34.1425378392739;
	Tue, 03 Mar 2015 02:26:32 -0800 (PST)
Received: from pohly-mobl1 (p57A56235.dip0.t-ipconnect.de. [87.165.98.53])
	by mx.google.com with ESMTPSA id k20sm754234ioi.13.2015.03.03.02.26.30
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Mar 2015 02:26:31 -0800 (PST)
Message-ID: <1425378388.21313.32.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: randy.e.witt@linux.intel.com
Date: Tue, 03 Mar 2015 11:26:28 +0100
In-Reply-To: <53119.10.254.176.172.1424999129.squirrel@linux.intel.com>
References: <bruno.bottazzini@intel.com>
	<1424978954-25411-1-git-send-email-bruno.bottazzini@intel.com>
	<54EF93B1.2020902@linux.intel.com>
	<1424989287.2764.14.camel@bottazzini-ThinkPad-T430>
	<53119.10.254.176.172.1424999129.squirrel@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Darren Hart <dvhart@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mkefidisk: change filesystem to be writeable on grub
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
X-List-Received-Date: Tue, 03 Mar 2015 10:26:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-02-26 at 17:05 -0800, randy.e.witt@linux.intel.com wrote:
> >
> > On Qui, 2015-02-26 at 13:44 -0800, Randy Witt wrote:
> >> On 02/26/2015 11:29 AM, Bruno Bottazzini wrote:
> >> > This patch changes grub configuration so the filesystem will be
> >> writeable
> >> > instead, just read only when running the script.
> >> > ---
> >> >   scripts/contrib/mkefidisk.sh | 2 +-
> >> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >> >
> >> > diff --git a/scripts/contrib/mkefidisk.sh
> >> b/scripts/contrib/mkefidisk.sh
> >> > index b96b7d4..9b84831 100755
> >> > --- a/scripts/contrib/mkefidisk.sh
> >> > +++ b/scripts/contrib/mkefidisk.sh
> >> > @@ -342,7 +342,7 @@ if [ -e "$GRUB_CFG" ]; then
> >> >   	sed -i "s/ LABEL=[^ ]*/ /" $GRUB_CFG
> >> >
> >> >   	sed -i "s@ root=[^ ]*@ @" $GRUB_CFG
> >> > -	sed -i "s@vmlinuz @vmlinuz root=$TARGET_ROOTFS ro rootwait quiet @"
> >> $GRUB_CFG
> >> > +	sed -i "s@vmlinuz @vmlinuz root=$TARGET_ROOTFS rw rootwait quiet @"
> >> $GRUB_CFG
> >> >   fi
> >> >
> >> >   # Look for a gummiboot installation
> >> >
> >>
> >> This change basically reverts
> >> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=24cd3ddeb70a3d3f2985ec71c87ae0108f3d2777
> >> by Darren. It also doesn't change the ro option when using gummiboot
> >> instead.
> >>
> >> What is this change trying to fix?
> >
> > Hello Randy,
> >
> > I got the following message:
> >  "file system is read-only"
> >
> > if I try to touch a file that is not on /tmp, or when I start a systemd
> > service that tries to write on the file system.
> >
> > After some research, I go it fixed by changing to read/write on the
> > script that was with read only.
> >
> > I thought this would be useful for someone else.
> 
> Thank you for taking the time to do this. If things still don't work after
> checking /etc/fstab, let us know.

I ran into the same issue, albeit not with a genuine Poky image, so I
didn't report it here. In my experience, even with a proper fstab
("defaults" for the rootfs or even "rw"), systemd-remount-fs never
remounted / as rw. When googling, I found references to the kernel boot
parameter, but as far as I remember, they said that this parameter had
been already obsoleted. It indeed did not seem to help to change it into
"rw" (but I'm no longer absolutely sure whether I tried that).

Sorry for being so vague :-/ Just wanted to confirm that there is indeed
something fishy and that running further experiments is needed.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




