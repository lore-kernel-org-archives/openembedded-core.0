Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1TfrXz-0005Rw-77
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 13:24:23 +0100
Received: by mail-ie0-f175.google.com with SMTP id qd14so5877618ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Dec 2012 04:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Fv8qbUDBPgUJq9+6a2NmfoAtvs7mowKXUY+PA9djR/g=;
	b=Mc9uFZcieI+klf3KKi8cSigWzidVpgZPa7EaogjZziUx+GluJSXUyv/YYg/gQkAbT0
	xcrwj85qhZWw8LPfGXeXhjS75RYA53FOZ6xWrzS8q/jCYhD9YavNleJeSI9fHqLBteZ6
	Pqg3uQ/Wfo295iQah5BDLz37iSSOFLozUC4F0t5bIxgrdZ98zURz990bp8Meg8WMBgu8
	huraVucjR3iLzZK9DcGiwOmZiis+zEG8hvZhGQYUNB4Mz5ZbqUMeMyMEmfJH02IKUUCX
	RuSJKZEBpeg9Ah9C1SiJGvnLYqAwDv6l4tnF/L7jYK2Wd4Dr1eaKfIE5Z9EFo7WmZ6/s
	xuwQ==
MIME-Version: 1.0
Received: by 10.50.216.201 with SMTP id os9mr2413429igc.5.1354623000257; Tue,
	04 Dec 2012 04:10:00 -0800 (PST)
Received: by 10.64.24.179 with HTTP; Tue, 4 Dec 2012 04:10:00 -0800 (PST)
In-Reply-To: <CAJTo0LahtxpX1G5BKkYxCaN7hyJkkS9riXF0btP8XMWFJzzxfQ@mail.gmail.com>
References: <CAGiJk9c_5nDZbTwTo1DvHXMEtOXgO=4-YvbsDoD-ZXqY=cTi8g@mail.gmail.com>
	<CAJTo0LahtxpX1G5BKkYxCaN7hyJkkS9riXF0btP8XMWFJzzxfQ@mail.gmail.com>
Date: Tue, 4 Dec 2012 13:10:00 +0100
Message-ID: <CAGiJk9dStPRuWzJVMQhVziNt+EW4ShNm3CkqCJBaTuYgrbSaog@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: EGL / GLES issues (mesa)
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
X-List-Received-Date: Tue, 04 Dec 2012 12:24:23 -0000
Content-Type: text/plain; charset=UTF-8

2012/12/4 Burton, Ross <ross.burton@intel.com>
>
> On 4 December 2012 09:09, Samuel Stirtzel <s.stirtzel@googlemail.com> wrote:
> > So with my last update the behaviour changed and applications using EGL now
> > link against mesa instead of libgles-omap3, but deployed in my rootfs is
> > libgles-omap3.
> >
> > This results in all Qt applications being broken (as I test EGL enabled Qt),
> > the resulting error message:  "application-name: error while loading shared
> > libraries: /usr/lib/libEGL.so: file too short"
>
> Why is mesa being built at all?

To be honest I don't get it either.

"bitbake -g -u depexp ..." shows only mesa-dri as reverse depends.

"opkg whatdepends" shows nothing on the target and it is not installed.

>
> "file too short" is a very interesting error message that implies the
> files in your rootfs are corrupted. Can you verify where
> /usr/lib/libEGL.so* come from and provide ls -l of them?
>
> Ross

root@overo:~# ls -l /usr/lib/libEGL.so*
lrwxrwxrwx    1 root     root            21 Dec  4  2012
/usr/lib/libEGL.so -> libEGL.so.1.6.16.4117
lrwxrwxrwx    1 root     root            21 Dec  4  2012
/usr/lib/libEGL.so.1 -> libEGL.so.1.6.16.4117
lrwxrwxrwx    1 root     root            21 Dec  4  2012
/usr/lib/libEGL.so.1.6 -> libEGL.so.1.6.16.4117
-rwxr-xr-x    1 root     avahi-au         0 Dec  3  2012
/usr/lib/libEGL.so.1.6.16.4117

In the work/image dir this looks like the following:
-rwxr-xr-x 1 samuel samuel 16079 Okt 11  2011 libEGL.so.1.6.16.4117

On the build sysroot there is libEGL.so.1.0 and libEGL.so.1.6.16.4117,
both with size > 0
In the .tar.bz2 packed rootfs the file has also a size > 0


root@overo:~# opkg search /usr/lib/libEGL.so.1.6.16.4117
libgles-omap3 - 4.05.00.03-r35



Seems pretty corrupted, but how could this happen related to the latest changes?



--
Regards
Samuel


