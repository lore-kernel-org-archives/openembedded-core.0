Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web09.9992.1607056504864430358
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 20:35:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: redrectangle.org, ip: 217.70.178.232, mailfrom: robert.joslyn@redrectangle.org)
Received: from bucephalus.localdomain (rrcs-173-197-191-182.west.biz.rr.com [173.197.191.182])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 5826D200003
	for <openembedded-core@lists.openembedded.org>; Fri,  4 Dec 2020 04:35:01 +0000 (UTC)
Message-ID: <aebe57d858d895a9266a9a25e90b60c8a34dd9e3.camel@redrectangle.org>
Subject: Conditional inherit with PACKAGECONFIG
From: "Robert Joslyn" <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 03 Dec 2020 20:34:58 -0800
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I'm trying to remove unnecessary packages from one of my images, and I
noticed that some conditional inherit lines don't work as I'd expect. In
my case, I'm trying to remove python, and the only recipe pulling in
python is btrfs-tools. The relevant parts of the btrfs-tools recipe (I'm
building on master):

PACKAGECONFIG ??= "python"

PACKAGECONFIG[python] = "--enable-python,--disable-python,python3-
setuptools-native"

inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'distutils3-base', 
'', d)}

I have a bbappend removing the default PACKAGECONFIG containing "python",
but I still get a btrfs-tools package that RDEPENDS on python because the
distutils3-base class is still inherited. If I modify the btrfs-tools
recipe directly to be:

PACKAGECONFIG ??= ""

then I don't get python as an RDEPENDS. If I have the recipe modified like
this and then try to add python to PACKAGECONFIG from my bbappend, the
recipe fails to build because distutils3-base isn't inherited.

My guess is that the inherit lines are parsed and expanded before the
bbappend modification to PACKAGECONFIG are applied. The bitbake
documentation says you can have conditional inherits similar to this, but
it seems there is more nuance with how the parsing is done. How should
this be done if I want to be able to remove python from this recipe using
a bbappend? I'd prefer to avoid copying the recipe into my layer to make
the changes.

Thanks,
Robert

