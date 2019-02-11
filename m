Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f66.google.com (mail-yw1-f66.google.com
	[209.85.161.66])
	by mail.openembedded.org (Postfix) with ESMTP id A2C0178F72
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 11:23:26 +0000 (UTC)
Received: by mail-yw1-f66.google.com with SMTP id x21so4023113ywx.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 03:23:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=yIcULhToLQQz7ReTFY9xkBRez4+poagKVNOwxrFFWhM=;
	b=Pvr5duhUz4roH2RlGpVIFQJRQABszaet0V3s7lwPf7EXMViI8fF1RnioSgRUTa8dlG
	QKbzGkRqKjQMb6UKj9a+KtF5pT52FzU1/qQ91ZrFb6WB5easNUCfMFfhpK+FbDS9553p
	IEy/PnlfHHUJ+6cD4ng9Bk6A9PRN8reJZahOmHmh14LwmJsAHmanJ3zj8mEpQVbmVYCk
	TH3t+59XepZwUXfhlVQkeLaMLEgmoz7QJGPD20nd5IslAVhUvLm3LuegwUkP/iHxhsWj
	9oq+bQyYJqlAfl5Yj6P7br/rjedqSvuEk50IsfuJexxHJjctLyNDpo3XbF/kH8xjBXCv
	SoPg==
X-Gm-Message-State: AHQUAuaB9g2AJHdlWrkZuaatQdPqiX2listou2XhybCYujC6x9wzCN5s
	8VGHyqdMfTqScPGuXcqdyHiUJaU7
X-Google-Smtp-Source: AHgI3Iaxj/xZpT8Z6qQ6Gh3x4VXaQEoSUUIwj4WdUe6TYgWlxAdEl9fTtfQIyyy3LwqWXPDoUAbG9Q==
X-Received: by 2002:a0d:e896:: with SMTP id
	r144mr20836312ywe.348.1549884207572; 
	Mon, 11 Feb 2019 03:23:27 -0800 (PST)
Received: from bluvision ([77.107.218.170]) by smtp.gmail.com with ESMTPSA id
	c68sm3914239ywd.52.2019.02.11.03.23.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Feb 2019 03:23:26 -0800 (PST)
Message-ID: <e49d3c6be56bc78c08c031847f8be88fa3b0fc5c.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Andreas Oberritter <obi@opendreambox.org>
Date: Mon, 11 Feb 2019 11:23:25 +0000
In-Reply-To: <20190208184653.33267c90@opendreambox.org>
References: <20190208164832.6047-1-git@andred.net>
	<20190208184653.33267c90@opendreambox.org>
User-Agent: Evolution 3.30.5-1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] sysvinit-inittab: support non-busybox-getty on serial consoles
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
X-List-Received-Date: Mon, 11 Feb 2019 11:23:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2019-02-08 at 18:46 +0100, Andreas Oberritter wrote:
> Hi André,
> 
> On Fri,  8 Feb 2019 16:48:32 +0000
> André Draszik <git@andred.net> wrote:
> 
> > From: André Draszik <andre.draszik@jci.com>
> > 
> > Busybox' getty has code to try to make itself a session leader,
> > whereas util-linux' agetty doesn't. It expects this to happen
> > from outside.
> > When getty is not a session leader, many things don't work on
> > the serial console, e.g. setting the terminal process group,
> > job control doesn't work, etc.
> > 
> > Executing image tests also fails with AssertionErrors, because
> >     Feb  5 16:12:55 qemuarm getty[590]: /dev/ttyAMA1: cannot get
> > controlling tty: Operation not permitted
> >     Feb  5 16:12:55 qemuarm getty[590]: /dev/ttyAMA1: cannot set process
> > group: Inappropriate ioctl for device
> > 
> > Update the start_getty script to invoke getty via the setsid
> > utility if needed, i.e. if /sbin/getty is not busybox getty.
> > 
> > [YOCTO #13058]
> > 
> > Signed-off-by: André Draszik <andre.draszik@jci.com>
> > 
> > ---
> > v2: fork fewer processes
> > ---
> >  .../sysvinit/sysvinit-inittab/start_getty          | 14 +++++++++++++-
> >  .../sysvinit/sysvinit-inittab_2.88dsf.bb           |  1 +
> >  2 files changed, 14 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
> > b/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
> > index e15ae35f90..d3ebb84e18 100644
> > --- a/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
> > +++ b/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
> > @@ -13,6 +13,18 @@ active_serial=$(grep "serial" /proc/tty/drivers | cut
> > -d/ -f1 | sed "s/ *$//")
> >  # Rephrase input parameter from ttyS target index (ttyS1, ttyS2,
> > ttyAMA0, etc).
> >  runtime_tty=$(echo $2 | grep -oh '[0-9]')
> >  
> > +# busybox' getty does this itself, util-linux' agetty needs extra help
> > +getty="/sbin/getty"
> > +case $(readlink -f "${getty}") in
> > +    */busybox*)
> > +        ;;
> > +    *)
> > +        if [ -x "/usr/bin/setsid" ] ; then
> > +            getty="/usr/bin/setsid ${getty}"
> > +        fi
> > +        ;;
> > +esac
> > +
> >  # Backup $IFS.
> >  DEFAULT_IFS=$IFS
> >  # Customize Internal Field Separator.
> > @@ -31,7 +43,7 @@ for line in $active_serial; do
> >  			then
> >  				if [ -c /dev/$2 ]
> >  				then
> > -				    /sbin/getty -L $1 $2 $3
> > +				    eval ${getty} -L $1 $2 $3
> 
> I think using eval isn't necessary.

I didn't investigate why, but it was necessary in this version for whatever
reason - v3 got rid of it now by adding another variable.

Cheers,
Andre'

> 
> Best regards,
> Andreas


