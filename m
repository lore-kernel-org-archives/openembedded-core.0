Received: from mail-ea0-f182.google.com ([209.85.215.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1UR0et-0006ig-Js
	for openembedded-core@lists.openembedded.org;
	Sat, 13 Apr 2013 15:38:31 +0200
Received: by mail-ea0-f182.google.com with SMTP id q15so1561117ead.27
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Apr 2013 06:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:date:message-id:in-reply-to:references
	:user-agent:subject:mime-version:content-type
	:content-transfer-encoding;
	bh=zw0ho6K6cKy98zJGHp/aVLP42Ix2SlElpgIoqgUTfHs=;
	b=y6nZEmVo6GidKKHTQcUxQqeK0Ptsv2CG3fXNVkic6vqPOO4w99xQgFxsUO4XRT6lOy
	szXuRJLIkD/49ILXyGgSZ7WH3RUT4gUcRm1BIXhd15+H81yc0C8fGJ1PwJBfYvIbFUM5
	MwnqGoQi+EkOuk0ARO2X/ivE/0UtzXRHQgs16nv+MfaZ7UOUIJzTole67o3w4eepMcNg
	f0eXqph4ssZ+Bfja5UBb+DfZ97UKf93gV7jtxHKTtlPQKkK9Jy7aY1Fdr8titriHzngb
	re8rarswBZdp5Jjme4ZhZZHg3rzwKYOcZHwV0YKNt5JpepaqzdTegm9mZjbKPlrlGcpB
	KDyQ==
X-Received: by 10.15.35.193 with SMTP id g41mr39529706eev.45.1365859257577;
	Sat, 13 Apr 2013 06:20:57 -0700 (PDT)
Received: from [92.248.55.223] (092248055223.atmpu0038.highway.a1.net.
	[92.248.55.223])
	by mx.google.com with ESMTPS id t4sm16488821eel.0.2013.04.13.06.20.55
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Apr 2013 06:20:56 -0700 (PDT)
From: "Bernhard Reutner-Fischer" <rep.dot.nop@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Saul Wold <sgw@linux.intel.com>
Date: Sat, 13 Apr 2013 15:23:48 +0200
Message-ID: <13e0390dbb6.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
In-Reply-To: <1365848798.16702.75.camel@ted>
References: <1365838096-11843-1-git-send-email-sgw@linux.intel.com>
	<1365848798.16702.75.camel@ted>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1 AquaMail/1.2.3.4 (build:
	2100270)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] udev-extraconf: Add -o silent to auto mount for mount.util-linux
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
X-List-Received-Date: Sat, 13 Apr 2013 13:38:32 -0000
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Transfer-Encoding: 8bit

On 13 April 2013 12:26:38 Richard Purdie 
<richard.purdie@linuxfoundation.org> wrote:
> On Sat, 2013-04-13 at 00:28 -0700, Saul Wold wrote:
> > This will silence some of the noisy output from mount.util-linux and the 
> kernel
> > when trying to automount filesystems or devices. Busybox does not accept 
> the silent
> > option, it uses a "loud" option instead.
> > [YOCTO #3935]
> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> > ---
> >  meta/recipes-core/udev/udev-extraconf/mount.sh | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> As far as I can see this will break with busybox mount. Is there a 2/2
> missing?

IIRC Busybox defaults to be silent (right?), I will thus add (and ignore) 
silent. I will have a look in the evening.

Thanks for the heads up!
Cheers,
>
> > diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh 
> b/meta/recipes-core/udev/udev-extraconf/mount.sh
> > index 99c76b2..7b58361 100644
> > --- a/meta/recipes-core/udev/udev-extraconf/mount.sh
> > +++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
> > @@ -22,7 +22,7 @@ automount() {
> >  	! test -d "/media/$name" && mkdir -p "/media/$name"
> >  	
> > -	if ! $MOUNT -t auto $DEVNAME "/media/$name"
> > +	if ! $MOUNT -o silent -t auto $DEVNAME "/media/$name"
> >  	then
> >  		#logger "mount.sh/automount" "$MOUNT -t auto $DEVNAME \"/media/$name\" 
> failed!"
> >  		rm_dir "/media/$name"
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


Sent with AquaMail for Android
http://www.aqua-mail.com




