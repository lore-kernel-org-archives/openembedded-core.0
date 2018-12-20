Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 704426C0F4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 20:37:12 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id x124so14031932itd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 12:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=864FNd8yk8WVrN2zaqtrEAZTsX4tY5BC8KFN8PrfIlE=;
	b=0c87DbytuCRusxRNq6vTVa3IVfbPzsVn27b6hFCMMdK5DVrcoyClpDRoEYd2PytN3+
	sm+k5cgLDue5dauhOwZMfgYByhXUMGXLP3iLk4gEKGg1gYaIDibIDltyoLYupk8cv0hi
	GqQhACTystD6E0WPBg7s6b6SUH5uoqXl84v6Gw/Saa8f++sY0U+c/7owVQrgefspw5rc
	sVxhjoyHKmMLbKkk1PlGxlX7BFaNovQBMqFW5vMranM3uNXtwpjm1xWr+4DgeR49bCUZ
	Jz/9PVXhHoZAhLgOV1DWPqseR6z343HD2b4QyyQIeBs5EQJQbFguED8lOZV3HH6CGT9w
	p4ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=864FNd8yk8WVrN2zaqtrEAZTsX4tY5BC8KFN8PrfIlE=;
	b=YqGhMpYPLkGVFwcmtDuuVDfw6j8mXj+gmmjeMMtd3IHDvw47GuU+vHayiD1mwNqVw6
	7g/0sDb0IXWgOXssKh1Z3L6JFLrjaKpAuIPQmKj9djpT9DWTVI8pJbiJaABX/AMNbGRD
	QikBmWAUfRjjBef6KFKUzXLvG8oPGwxB4kX9uvJkH7y/XZ1kla9ibuWHGwlVe/Ko/YYg
	HR638Azm+pf5I9M+IHrf+30Bio4Rtx34w6mppDuKxfVNkA52vPZiI7eGQipZLisDmBps
	C6lzv2qSnSfQzDjY5PoUdiXkmUo5JTiMx/u6YdGNRMue5ufp3zchhs6GwRUbVuVsm8kC
	Zn/w==
X-Gm-Message-State: AA+aEWYVdKh7oVjGXAUq5B2Iy2Jf1HUYFyKlCasK1c5rJ6Dde+BvxHaJ
	lfnf7cM1s4YFjtWS5YCPvlichpH9V7oaru9tfIh4fg==
X-Google-Smtp-Source: AFSGD/UtJQLbsBdbl3JHku5XmusZpwEqVkoYG+xPrMt65UqOar+WUljclsdkcSxvWOwMY9XDH+9vg0qjoDIA0ec4V2A=
X-Received: by 2002:a24:1d4a:: with SMTP id 71mr148710itj.62.1545338233299;
	Thu, 20 Dec 2018 12:37:13 -0800 (PST)
MIME-Version: 1.0
References: <20181220054044.29476-1-douglas.royds@taitradio.com>
	<CAJTo0LZ+9K+AbMeWb5PV_0bmivHcv+2JAXtuA2ZxKJMsaL=Tbg@mail.gmail.com>
	<150da13c-a7d6-c6c1-c623-5acba13904df@taitradio.com>
In-Reply-To: <150da13c-a7d6-c6c1-c623-5acba13904df@taitradio.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Dec 2018 20:37:00 +0000
Message-ID: <CAJTo0Lb6rpmOjJt_kmFr9c3CEnxV_b5nRFjgq52ZvqgfPFUn7A@mail.gmail.com>
To: Douglas Royds <douglas.royds@taitradio.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libpam: reproducibility: Fix host umask leakage at patch-time
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
X-List-Received-Date: Thu, 20 Dec 2018 20:37:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Dec 2018 at 20:26, Douglas Royds <douglas.royds@taitradio.com> wrote:
> libpam is unusual in having a patch that creates an entirely new file
> (tty_secure.c). If that patch eventually goes, then this umask setting
> can go as well.
>
> I haven't come across any other cases of a patch creating a file, but if
> there are, then we could certainly move this setting. Perhaps we should
> wait until others emerge.

I definitely wouldn't want to make the assumption that libpam is the
only recipe of all time that will create a file.

Ross

