Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 757ED772FC;
	Wed,  3 Feb 2016 11:49:47 +0000 (UTC)
Received: by mail-ig0-f179.google.com with SMTP id 5so34208575igt.0;
	Wed, 03 Feb 2016 03:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=C5YOj552Nbmswz0KIZx4cTPrYaxzhax+xmvEOevdVdc=;
	b=etgRZdW2cYTJTbU9yusYS5HYeDaLb9VTYD1LjADNm0KrCCh1QkjsBwLr/ajYVjJbB6
	E5lSyPeKE7Fqc4hqH7Z4PB7DMm2vpR5KFo6NDbreZP4ksMPXkQZ1hAS1/msE/gihwmxg
	Xgv5akujjfJWrZJ3Hk54KZ5OVkTg/I973EatA0aJ1k26AQACumZWN9IkMYfHBcJlEqOq
	qJtS393hOZcjfAwpm/seCyVzhOBbd9ZKVoXq39uS/hJ1pWh4kPexuLeFAwd2/BBPmfLf
	71Wp3WAoe5DaGmd4FGtM9aASumNSQERoVdwyMo9N/5U4Y9jBhHjkrwzEwqZB8e+g19Df
	lEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=C5YOj552Nbmswz0KIZx4cTPrYaxzhax+xmvEOevdVdc=;
	b=VFbqZuxj1d7jnsZU80F5KYJtij0C3BSaTxbFumSu2Vpz2QtxHSTxFsOuNIFAgBDGOe
	OxI2zrLwfKBkaYcNN7R0VdX+HPKf3S1CUhDg3neX8qqDjARTeMUevel6PtjkwsLoKThW
	rjLgJSdnoOZ0yChH4/DdyHUpfAwYvvX5AZl9+ut3Kl24RZvXDnRHkDBv3CvYGk4a4yhV
	o2laFTfd4hdmhaUK3lD1Z6PC6u9uKE00cDSDIIr9c2N4cI7zt1WvNHRO/vZURP8cA4Ma
	7PEW5jfSNml7RCkAg3pfWyFvca9LIBw3ch3cYDweFzzccv0ZBEgw5q8YqO0sg6KB3/Ck
	NIrQ==
X-Gm-Message-State: AG10YOTX5PM883oI/his3ZKcJuBXMar3T9RtxT1leiXIjNxYMVxwOr5FfIUfrM7jmgwxrOGfxexAjO95koRAdg==
MIME-Version: 1.0
X-Received: by 10.50.111.111 with SMTP id ih15mr23869475igb.78.1454500188055; 
	Wed, 03 Feb 2016 03:49:48 -0800 (PST)
Received: by 10.36.25.81 with HTTP; Wed, 3 Feb 2016 03:49:48 -0800 (PST)
Date: Wed, 3 Feb 2016 12:49:48 +0100
Message-ID: <CALbNGRRmD=4QUi=+_fx48M4GDB9VwTX5m5wH12j4ed1OK6SW6Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Language settings GTK (glibc?) problem
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
X-List-Received-Date: Wed, 03 Feb 2016 11:49:49 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

while testing libreoffice language packets I found that language
settings for GTK based apps are broken. Interestingly QT based
applications (tested with qtcreator and lxqt) and libreoffice are
working fine.

I did some research and hope for some expert with helping hints. Details are:

* I am testing with jethro environment

* X session is started for an unprivileged user by display manager
lxdm. That sets the following environment vars for language:
| LANG="de_DE"
| LANGUAGE="de_DE"
| LC_MESSAGES="de_DE"

* starting e.g gedit from console complains:
| (process:4205): Gtk-WARNING **: Locale not supported by C library.
|    Using the fallback 'C' locale.

* 'locale -a' says
| locale: Kann LC_COLLATE nicht auf die Standard-Lokale einstellen:
Datei oder Verzeichnis nicht | | gefunden
| C
| POSIX
| de_DE
| en_GB
| en_US
| fr_FR
Translation of error is (when setting en_GB on lxdm):
| locale: Cannot set LC_COLLATE to default locale: No such file or directory

Debugging the last two cases show that the error is caused for same reason:

* setlocale(LC_ALL, "") returns NULL for GTK apps
* setlocale (LC_CTYPE, "") returns NULL for 'locale -a'


Anybody with ideas what is missing/wrong on my images?

Andreas

