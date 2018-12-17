Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
	[209.85.166.51])
	by mail.openembedded.org (Postfix) with ESMTP id 48F8F6C572
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 17:11:42 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id l3so10523967ioc.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 09:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=v03SIsI14guSkBq1JWhzmlwhGlLwc7cTDV1yxoMMeSg=;
	b=coRuDSHXGl3ZbEHHIRgMnzkkkd7hlMenQJjmPKNxtOF+4G5ZPNb1nlBRdBgRghgYrK
	MxIdFBR7td9AdCkGUw8NAm8XSkMPss4V+A00ocP09uBVmGtKRvOJFcqxRDwX9oyq6ueX
	/by28I5VIn0h10obTssIdMfXAOT+lZSWCASrvByXuVapsY58ziLs6iKRYysfNwRNApet
	dFRt49JzBHNUY300Gr4PycWQbomd6ISJ8Hi6hyttDIXZ8/fa2awBEbfhAxqiAgZ/hMIc
	d6xLZV+a9r1cdd2KDMJrKTJXHNCjwPPEgB/k0nIuU7oz2PE8c4HdBUFz3t/2KF6VlSmD
	d+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=v03SIsI14guSkBq1JWhzmlwhGlLwc7cTDV1yxoMMeSg=;
	b=ASgTbq0tXnOzEtTXlfQJxPvewahHYH8JCtfcxaVTIeP9ojOn+cls/97N5J/hd21mCX
	V8gO1LIgaFxFa7Eo6Kz9njtKW1G4JjEYYUVjIlOshQa4jGLyWOZLS060jW0L5coCn85C
	dOLYeutka6hP8fRveZPTDCEGjxAt9qi24aRrKRp6KRUIfSzHEskNQ0nZTFzXKg0Re4H3
	1WCoDHbO/njKsg3veJQ7h7Z11o0YWKbgWv1bUBBEKbcXeSE+EVNG1DjWJB9j8+MdE+b1
	MDHxDY4Q14Jzenoul6DVy0/t28Pn0cVmSc/Ja8RIuCWVqf5LQdJJzIgMZ4YDy5HoxOUz
	1hNw==
X-Gm-Message-State: AA+aEWa0/cfKUFBhsRg3Wfi5gFrMSZNsLHO3VBDkjq49cvwfRNHBk2Cm
	SWIlf3zA4IyNQQJzRzbxHi/3TSnvjY5bP8ao6Ppryg==
X-Google-Smtp-Source: AFSGD/UIom6i+GMF9dgKa6/FU6C2/+O66VrgHkEZKjE5Wct2WI2BykKcWv2bY5R4EgN/zkUXEnxWUhEcM0LTL0Ye6t4=
X-Received: by 2002:a6b:acc5:: with SMTP id v188mr11375931ioe.20.1545066703336;
	Mon, 17 Dec 2018 09:11:43 -0800 (PST)
MIME-Version: 1.0
References: <20181215125926.12227-1-sno@netbsd.org>
In-Reply-To: <20181215125926.12227-1-sno@netbsd.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 17 Dec 2018 17:11:31 +0000
Message-ID: <CAJTo0LYR+x05NHQMN_bfLgSnceiOCRznodAFza-UBkyT_NZh=w@mail.gmail.com>
To: Jens Rehsack <sno@netbsd.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package_deb.bbclass: report error during creation
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
X-List-Received-Date: Mon, 17 Dec 2018 17:11:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, 15 Dec 2018 at 12:59, Jens Rehsack <sno@netbsd.org> wrote:
> +        try:
> +            subprocess.check_output("PATH=\"%s\" dpkg-deb -b %s %s" % (localdata.getVar("PATH"), root, pkgoutdir),
> +                                    stderr=subprocess.STDOUT,

So stderr is redirected to stdout.

> +        except subprocess.CalledProcessError as cpe:
> +            bb.note("%s" % cpe)
> +            bb.note("%s" % cpe.stdout)
> +            bb.note("%s" % cpe.stderr)

So why display both?

Do this as one bb.error and you won't need to re-raise as it will fail.

Ross

