Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by mail.openembedded.org (Postfix) with ESMTP id 0C5F274860
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2018 19:19:12 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id 14-v6so17072650oie.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2018 12:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gb6u3bWv31+W1TYrjLqvZT0+PLKPjMtDnEnPdKLiues=;
	b=CryP4hqMoI1Ui5sucaJk/ZLZ41wPFazd2dVKNkvTldg0V3cRbNmQGNr7SD9PzpqgSb
	0DB+F6eZ1ufOi6HI8T0wC6oni8SXvhAqSyiHSm544vAmcSA+6oCjQ7Kn5nUXN8pXujCr
	d0rGYGfbY3c9b3Sez7vNzoa1IoPZIeZYCko4RK7yvrd81VW16rmAXlH90TYRPEP7WoPJ
	ZnUdFZbhebAfVsVLc9SdZpvVMKgpzApxzlgUhXdrYTiqF9AnmrwXvFPi0PBIWqZiNRzJ
	RZ99AdnYNuC2QvBILHI4lvvyQsNktUSq8/qyMUUKdVk41X+i7e+9qs9UmPxFfnb7M155
	bDcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gb6u3bWv31+W1TYrjLqvZT0+PLKPjMtDnEnPdKLiues=;
	b=GviV9chmhO+1w5H+zSIOeqeNhHaflhpkK5dkZAkVncgUG/DQGEcT6J8szAamlV/CgU
	Hyntmiqzv5MgRhUFgdyu2hXv5bt58wVMIuP9OMKMUxyveHrW6lp+/ydDh5ivc+XQ43Un
	pRCAJPShrIOt8EOqZdsnodLSgTrPXs+rMYyWqoWujZErMxrahR8u2ROlfF6gvAAdszgp
	ZGVFz67jhpaw23kiXauqzKYcfsAKQWnnIMpxNOfi6GnNtoEtbchwflpwgMyhDDSoBI8n
	UGYNNPXKvh9o/xUFiFciZAyhbED6eVWzi/HJIcNe12IIZUFJ2LPNp+D+5624EGJTHEZg
	QTqg==
X-Gm-Message-State: APt69E2aGH21MzK+pB5NXC6/WLyuoQ9sqaKbrlKpsbogy/+nf1/FzD3y
	u20R5NO5diywbfSAC/Oy59Qke2qnr4KaIpyqISI=
X-Google-Smtp-Source: AAOMgpdF+LY+PJVHLoirJbIBvjQStYdZwmG2VjHM91mHcyYvDXDLLbk2xgCgB3JWd/X/92RZrCPitVhAEpwUtOnHR7A=
X-Received: by 2002:aca:5094:: with SMTP id
	e142-v6mr1511457oib.190.1530040753977; 
	Tue, 26 Jun 2018 12:19:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90c5:0:0:0:0:0 with HTTP; Tue, 26 Jun 2018 12:19:12
	-0700 (PDT)
In-Reply-To: <20180626185120.86068-1-joe.slater@windriver.com>
References: <20180626185120.86068-1-joe.slater@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 26 Jun 2018 21:19:12 +0200
Message-ID: <CANNYZj8-5gfrJMGc+6Fd4Jeff=B+mHodi0v7j2b25jw7D-8Oqg@mail.gmail.com>
To: Joe Slater <joe.slater@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] gtk-immodules-cache: add conditional delay_to_first_boot
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
X-List-Received-Date: Tue, 26 Jun 2018 19:19:13 -0000
Content-Type: text/plain; charset="UTF-8"

2018-06-26 20:51 GMT+02:00 Joe Slater <joe.slater@windriver.com>:
> -            bindir=${bindir}
> +            bindir=${bindir} || \
> +    $INTERCEPT_DIR/postinst_intercept delay_to_first_boot ${PKG} \
> +            mlprefix=${MLPREFIX}

Please read the postinst_intercept script. It does not actually
execute qemu at all, and so never fails due to non-working qemu. It
only requests such execution at the end of package installation
transaction. Also, if such later qemu execution does fail, then the
postinst does get deferred to first boot automatically. How did you
come up with this patch?

Alex

