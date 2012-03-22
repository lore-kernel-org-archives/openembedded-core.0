Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SAoPy-0006uC-NE
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 21:15:30 +0100
Received: by wibhj13 with SMTP id hj13so1111718wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 13:06:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=M5WnnOTECkKde4EwNm5YB1HcZSIdGdIrv7AcFnFbgzk=;
	b=QmheuCXS6TfHPNnlXAX0ex7uM72FWq8QGfK5MjyufFupdhfS5BWRsRoi/vyyrrEo56
	6et8kVsLwtqe1iu6omkraYdTjXlUUlvCK5bLGuEi6joOGrFRgaj/uYhPFV0gx2xRjspJ
	SHoDO/5o08yY94yhCbiTCzHwuwLNW7XrYTK5eQsyzKVdXj8+z5xrF+6+wrLuTXm5HtdT
	dzcvdhlv38FVSoV7qRKbyEkqzh707JBmgoyEsLU92SN8lI4DZe0Bej/WWBmdZmJn+SUc
	lYBdNGzDrfLMbQM/26gbV0KQnpxiVRP2Ad1b/sghosL9e+Ij3g/2dH68A+gSJuFo69G7
	izpw==
Received: by 10.180.105.194 with SMTP id go2mr354296wib.22.1332446795592;
	Thu, 22 Mar 2012 13:06:35 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ex2sm12809874wib.8.2012.03.22.13.06.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 13:06:34 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CALbNGRTN4JV3OoEgqQrQJp0LY3KLcGJC12ZiZMqmNjF7KU5fng@mail.gmail.com>
Date: Thu, 22 Mar 2012 21:06:39 +0100
Message-Id: <B915C740-BEED-45EA-92F6-96F600E33DBC@dominion.thruhere.net>
References: <1332443701-24282-1-git-send-email-schnitzeltony@googlemail.com>
	<E67D3882-EE14-4CEB-9FDC-E8E99EA0ADB0@dominion.thruhere.net>
	<CALbNGRTN4JV3OoEgqQrQJp0LY3KLcGJC12ZiZMqmNjF7KU5fng@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnWwiYmDlXFNGFd13UupHk9TnMnnw2MeUYXkW9EE0MuUtp/WuKql0IW8oF2HpePRRv5IhrT
Subject: Re: [PATCH] gtk-icon-cache.bbclass: Fix multiple rebuilds of the icon cache on first boot
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Mar 2012 20:15:30 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 22 mrt. 2012, om 20:51 heeft Andreas M=FCller het volgende =
geschreven:

> On Thu, Mar 22, 2012 at 8:34 PM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>=20
>> Op 22 mrt. 2012, om 20:15 heeft Andreas M=FCller het volgende =
geschreven:
>>=20
>>> * Before this patch every inheritance of this class rebuilt the full =
icon cache at the first boot.
>>> * With this patch the icon cache will only be build once at the =
first boot and on pkg installations that require it.
>>> * This patch reduces the time needed for the first boot from 96 =
minutes to 5 minutes on the test machine.
>>> * Build-tested incremental (BB_SIGNATURE_HANDLER =3D "OEBasicHash") =
& from scratch
>>> * Run-tested with systemd and opkg
>>=20
>> Wouldn't adding it to the opkg intercept code (and likely rpm as =
well) be a better idea?
>>=20
> We wanted to be independent of package manager selected and decided to
> follow the systemd-compat-units approach. Ehm opkg intercept code -
> teach me :)

Have a look at =
http://code.google.com/p/opkg/source/browse/#svn%2Ftrunk%2Fintercept

It is a bit iffy to encode knowledge of postinsts into the package =
manager, but you show that something like that is needed. Another =
thought: can the icon updates be done at do_rootfs time and mark the =
postinsts as done?

regards,

Koen=


