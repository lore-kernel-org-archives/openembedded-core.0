Received: from mail-ve0-f174.google.com ([209.85.128.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U8G4C-0004wn-8x
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Feb 2013 21:15:00 +0100
Received: by mail-ve0-f174.google.com with SMTP id pb11so7229503veb.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2013 11:58:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=hdSjU5BURTAJozN5tkjQ2z4ENMZ8HwxLcmJWoZ5FOJY=;
	b=iW9KxYiTOjYcAgpS999ROA8Mkfud2i2rvMKN3VgPnNl7166Lg0vE70kXntGglA043Q
	dK9m6P9o6ixuuUKkt03uYZUEUY4p3JDK1NGUMEt24OlZahnbw/Nw9vVLIXxsuw0UfaFl
	n2tIcGLAbpfPitDKZkbIetAlMxpFaxv2Spm9qr9rcLAWa8+4PpGs72SqqJap0BjMkeU6
	LZo3JTHeiqqU8IdHLX1wMC0tqLLDPRn59inX9dSTkvDnohAQwsUcJqz1qDoyNQvdlXAp
	IvyY4eBdHharPib3gpPhA2cJ9lOhOkSS0M0p1gLCcLqv+OZmz+wFwuBfq69G7w72VJaA
	THYA==
X-Received: by 10.220.241.19 with SMTP id lc19mr23140429vcb.43.1361390328862; 
	Wed, 20 Feb 2013 11:58:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.85.36 with HTTP; Wed, 20 Feb 2013 11:58:28 -0800 (PST)
In-Reply-To: <lyd2vydizm.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <lyk3q9sam4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1361006114.31795.19.camel@ted>
	<CAP9ODKq_XBobE5vCOCCSgusT9RQyY3VSbUZmR9yAcQ4eFkKLBg@mail.gmail.com>
	<1361019187.31795.49.camel@ted> <20130217231955.GF3300@jama>
	<lyd2vydizm.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 20 Feb 2013 19:58:28 +0000
Message-ID: <CAJTo0LbAmTuj0dZKq7=wX5uqF9OV7dW7FXd4d2incdKSshXEmQ@mail.gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Gm-Message-State: ALoCoQnHApqo+jO3h/AMDNg4BvLh4u9fQEG20jAsyeTepdTBgvPv9veETGLBONah6fa731oqQEem
Cc: openembedded-core@lists.openembedded.org
Subject: Re: RFE: make the init manager an image feature (again)
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
X-List-Received-Date: Wed, 20 Feb 2013 20:15:00 -0000
Content-Type: text/plain; charset=UTF-8

On 18 February 2013 10:17, Enrico Scholz
<enrico.scholz@sigma-chemnitz.de> wrote:
>> But it doesn't need to be as dangerous as binconfig.bbclass, because
>> we already list .service or .socket files in SYSTEMD_SERVICE so we can
>> improve that "find" call
>
> Why is 'find' required at all?  afaik, only files from $SRC_URI are
> affected.  So we can
>
> 1. create an (overridable) SYSTEMD_EXTRA_SERVICES variable
>
> 2. fill this variable in systemd.bbclass with .service, .target, .socket
>    + .mount files from $SRC_URI
>
> 3. modify systemd's do_install so that files above are copied after
>    doing some some sanity checks (e.g. checks that no previous version
>    from 'make install' exists or that it are really systemd files).

As I've said before you'll need to be pre-processing these files
anyway, so either the class gets *even more* logic or you just deal
with it.  Over time more and more upstreams will get systemd support
so we'll be carrying overcomplicated logic for no reason.  We're
really just talking about one conditional and a sed call here.

Ross


