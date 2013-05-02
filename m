Received: from mail-vc0-f176.google.com ([209.85.220.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UXoXh-00065F-5W
	for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 10:07:07 +0200
Received: by mail-vc0-f176.google.com with SMTP id ib11so236614vcb.35
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 May 2013 00:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:date:message-id:subject:from:to
	:content-type; bh=LZgYEpS4E+WVYuDSZ0Kg4BB0Z99OGfhy8v6kb1Gh/7o=;
	b=pyBN/Ft6UybFODlwhB5rwer7tlnB5bIaD626pRkFdbMmG8mE3QJLhjwNgx4NkqgzV8
	IKkWdAIC5seNDzldRyxg/89wusRq3awn1+9q8+ZjgKQxWXrUEcvCsCof+PtkstBFsGVm
	+JFyhMoiRTvRNxhPLxXoXJPuTzOl9MO8vzpC6ZQY4kz0ixh614NRw2kZyNsk3w3G1XWZ
	zXV24U5s6QGKPCgYBJOylGzbSl24CL7c1x8O+fuB7YXJH4VpJr96pUsfT6KtfgIbEW4Z
	4iJVCvUD8G4kyu7k6al7otoeTH0fIeGpz/JqHARUl9L0UKZlLFEQv33uublXXYPeC8i0
	2f8g==
MIME-Version: 1.0
X-Received: by 10.52.68.49 with SMTP id s17mr1526357vdt.92.1367480951586; Thu,
	02 May 2013 00:49:11 -0700 (PDT)
Received: by 10.52.139.33 with HTTP; Thu, 2 May 2013 00:49:11 -0700 (PDT)
Date: Thu, 2 May 2013 09:49:11 +0200
Message-ID: <CALbNGRTYCh8aB_JNpL7T-80PzybUN9KMJmZ=_GP6AfkrJmAccw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: useradd.bbclass question
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
X-List-Received-Date: Thu, 02 May 2013 08:07:13 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

on one of my build machines useradd.bbclass seem to use the UID/GID of
build host. On other machines useradd works correct.

I have the follwing in gdm:

<snip>
do_install_append() {
    ...
    chown -R gdm:gdm ${D}${localstatedir}/lib/gdm
    chmod 0750 ${D}${localstatedir}/lib/gdm
}

...

USERADD_PACKAGES = "${PN}"
USERADD_PARAM_${PN} = "--system --no-create-home --home
${localstatedir}/lib/gdm --user-group gdm"
<snip/>

In sysroot /etc/group I see
gdm:x:990:

In sysroot /etc/group I see
gdm:!:993:990::/var/lib/gdm:

The folder in packet/image has IDs 42:42 which is taken from build host.

Any ideas what causes this - or is there something wrong with chown at
do_install?

Andreas


