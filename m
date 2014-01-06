Return-Path: <ross.burton@intel.com>
Received: from mail-qe0-f48.google.com (mail-qe0-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id A44B36077F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2014 15:47:55 +0000 (UTC)
Received: by mail-qe0-f48.google.com with SMTP id gc15so18636744qeb.35
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jan 2014 07:47:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=p5A0fgNxPYzzDrxYki5CMu2UpqcsUfv5lYRojQpvEUM=;
	b=cNUmFIh6fLIbhIksH9SGC40aZq6Jjpelmb9uoBTi47gmrwsbcox/TeoaayqGiXgQdk
	8WCrOK+7gPm4tZ/JMAxKcMZpcItBMHZ9H4Bfrb7bmkRTY9XtJp92uKvYR89GP05LG4BC
	ct1SIAiDo4sqgMlW4sPjNT9JBYvJCUtMH+GCtNWB7rYfNvLa5jGNCfN8Y8mkkZBSI4D5
	b2BCVb6YqeLl06GeG5ZBtZhoB3akrSB4VKweEAJVuoXshmUv0RzEmiIAsYlKxGf/cB5G
	jfFFZkarrQk59CjcqOTqwPk8ZChYb1EjNDnowMytCTEHmJeBHPEIZD/8y3qkDCQLG977
	lWWg==
X-Gm-Message-State: ALoCoQmCthzQs/LFUCy057KKvjJV3PUG3DS12wRvbywyxBmWnkvo/v2FJ6UoRFm9jwK7n1patTzQ
X-Received: by 10.229.65.130 with SMTP id j2mr178273812qci.6.1389023276140;
	Mon, 06 Jan 2014 07:47:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.96.179.105 with HTTP; Mon, 6 Jan 2014 07:47:36 -0800 (PST)
In-Reply-To: <5b836adb7023cf075f9eb2246c7b2bbe420fd1cf.1388769973.git.liezhi.yang@windriver.com>
References: <cover.1388769973.git.liezhi.yang@windriver.com>
	<5b836adb7023cf075f9eb2246c7b2bbe420fd1cf.1388769973.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 6 Jan 2014 15:47:36 +0000
Message-ID: <CAJTo0LY2hTEcqZyqrDsoBGEbWYwovCSu7+gZdo4av+9=0w_J5g@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] gconf.bbclass: remove --disable-schemas-install
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
X-List-Received-Date: Mon, 06 Jan 2014 15:47:55 -0000
Content-Type: text/plain; charset=UTF-8

On 3 January 2014 17:27, Robert Yang <liezhi.yang@windriver.com> wrote:
> Gnome has moved the schemas to the gsettings-desktop-schemas pkg, so
> there is no --disable-schemas-install option any more, and we already
> have the gsettings-desktop-schemas recipe, so remove it, it wil fix
> the warning:
>
> configure was passed unrecognised options: --disable-schemas-install

I'd NAK this but it's too late as I see it's been merged.

*Some* packages have migrated away from gconf to gsettings.  Not all
packages have done this, so anything still using gconf is now broken.
Note that almost nothing in oe-core uses gsettings as we're still
using the GTK+ 2 stack generally.

The problem is that people are using gnome.bbclass which is a kitchen
sink class, inheriting many other classes that may or may not be used.
 To resolve this warning gnome.bbclass should extend the sanity check
whitelist with --disable-schemas-install as it is the class causing
gconf.bbclass to be inherited on recipes that don't use gconf.

Ross

