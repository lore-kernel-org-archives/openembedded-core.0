Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
 by mx.groups.io with SMTP id smtpd.web09.6069.1627031918850597527
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jul 2021 02:18:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=dwrobel@ertelnet.rybnik.pl header.s=ertelnet header.b=KXzgwxI2;
 spf=pass (domain: ertelnet.rybnik.pl, ip: 136.143.188.14, mailfrom: dwrobel@ertelnet.rybnik.pl)
ARC-Seal: i=1; a=rsa-sha256; t=1627031918; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LFAbe7u+HqgzfLj6uWJZ98kQ9D1xIwx6QeetL6hqbgvM++dcbaGMECCPJ+kwjkeB/v0TRp49Iezeax1Ls/e1achwDPSA9E3mw5P2UfiQ9oX0sD+XLRfWmuMsblEGkLwviEyG7o/hqG7zFfat10TzdUCFcDQgyHMBWAfUFQeIacQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1627031918; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=XUa19iBUUfbwQSljS2LVyykP50zarRC8bRUAB+KhzxM=; 
	b=Ww6cfHccvIEomlWZsT+H64YE0aUfgObWJPH2pfTIgHYFBRXsCYDrjLzeuOfzEoRaKqEqX2zlElMYMYKpZz5zRctbRsFNFArNfC5FBFo+27W7w9UaYXY63IMLH744qOOJdcdDyAR0fsn23SyBdlOtoAYK+nJNzpuFeiuWUMJJChw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ertelnet.rybnik.pl;
	spf=pass  smtp.mailfrom=dwrobel@ertelnet.rybnik.pl;
	dmarc=pass header.from=<dwrobel@ertelnet.rybnik.pl>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1627031918;
	s=ertelnet; d=ertelnet.rybnik.pl; i=dwrobel@ertelnet.rybnik.pl;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=XUa19iBUUfbwQSljS2LVyykP50zarRC8bRUAB+KhzxM=;
	b=KXzgwxI2NEqO8t7zI8NYbib4EH6+mZ2vzgJiKJOFZKBDspSbejr/S0x629Yq32Xx
	klOIzIS3owUlmqPn8HZN2kGOxOsq99N+s2YtuW50qWZ9AJAGDU0inUXX/CMyDI3Drl6
	i5Qg54JrauM1RB+R2XEl6vPD+iYScQ1pbM7vi1nQ=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1627031917205869.8667766792186; Fri, 23 Jul 2021 02:18:37 -0700 (PDT)
Date: Fri, 23 Jul 2021 11:18:37 +0200
From: "Damian Wrobel" <dwrobel@ertelnet.rybnik.pl>
To: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
Cc: "openembedded-core" <openembedded-core@lists.openembedded.org>
Message-ID: <17ad2a8d274.baa47275320123.2410909644446242382@ertelnet.rybnik.pl>
In-Reply-To: <YPnzFOuJhmDW/kb4@piout.net>
References: <20210722094822.1102062-1-dwrobel@ertelnet.rybnik.pl> <YPnzFOuJhmDW/kb4@piout.net>
Subject: Re: [OE-core] [PATCH] rootfs: remove ldconfig auxiliary cache where appropriate
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit




 ---- On Fri, 23 Jul 2021 00:37:08 +0200 Alexandre Belloni <alexandre.belloni@bootlin.com> wrote ----
 > On 22/07/2021 11:48:22+0200, Damian Wrobel wrote:
 > > Removes the /var/cache/ldconfig auxiliary cache directory from
 > > the rootfs when:
 > >  - read-only-rootfs is in DISTRO_FEATURES,
 > >  - ldconfig is not in DISTRO_FEATURES.
 > > 
 > > In both cases the /var/cache/ldconfig/aux-cache is useless.
 > > 
 > 
 > This breaks the do_rootfs task of most of the builds with:

Thank you for the feedback.
I will send v2 with an additional check and remove the directory only if it exists.

--
Regards,
Damian
 > 
 > Exception: FileNotFoundError: [Errno 2] No such file or directory: '/home/pokybuild/yocto-worker/qemuarm64-ltp/build/build/tmp/work/qemuarm64-poky-linux/core-image-sato/1.0-r0/rootfs/var/cache/ldconfig'
 > ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/qemuarm64-ltp/build/build/tmp/work/qemuarm64-poky-linux/core-image-sato/1.0-r0/temp/log.do_rootfs.51846
 > NOTE: recipe core-image-sato-1.0-r0: task do_rootfs: Failed
 > ERROR: Task (/home/pokybuild/yocto-worker/qemuarm64-ltp/build/meta/recipes-sato/images/core-image-sato.bb:do_rootfs) failed with exit code '1'
 > 
 > Example here:
 > https://autobuilder.yoctoproject.org/typhoon/#/builders/96/builds/1983/steps/11/logs/stdio
 > 
 > > Signed-off-by: Damian Wrobel <dwrobel@ertelnet.rybnik.pl>
 > > ---
 > >  meta/lib/oe/rootfs.py | 9 +++++++++
 > >  1 file changed, 9 insertions(+)
 > > 
 > > diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
 > > index ad9fd77c8b..80673fab3f 100644
 > > --- a/meta/lib/oe/rootfs.py
 > > +++ b/meta/lib/oe/rootfs.py
 > > @@ -302,6 +302,15 @@ class Rootfs(object, metaclass=ABCMeta):
 > >              self._exec_shell_cmd(['ldconfig', '-r', self.image_rootfs, '-c',
 > >                                    'new', '-v', '-X'])
 > >  
 > > +        image_rorfs = bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs",
 > > +                                        True, False, self.d)
 > > +        ldconfig_in_features = bb.utils.contains("IMAGE_FEATURES", "ldconfig",
 > > +                                                 True, False, self.d)
 > > +        if image_rorfs or not ldconfig_in_features:
 > > +            ldconfig_cache_dir = os.path.join(self.image_rootfs, "var/cache/ldconfig")
 > > +            bb.note("Removing ldconfig auxiliary cache...")
 > > +            shutil.rmtree(ldconfig_cache_dir)
 > > +
 > >      def _check_for_kernel_modules(self, modules_dir):
 > >          for root, dirs, files in os.walk(modules_dir, topdown=True):
 > >              for name in files:
 > > -- 
 > > 2.31.1
 > > 
 > 
 > > 
 > > 
 > > 
 > 
 > 
 > -- 
 > Alexandre Belloni, co-owner and COO, Bootlin
 > Embedded Linux and Kernel engineering
 > https://bootlin.com
 > 
 > 
 > 
 > 
