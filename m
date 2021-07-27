Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
 by mx.groups.io with SMTP id smtpd.web08.9233.1627380700444112509
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jul 2021 03:11:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=dwrobel@ertelnet.rybnik.pl header.s=ertelnet header.b=WhOTqIMo;
 spf=pass (domain: ertelnet.rybnik.pl, ip: 136.143.188.14, mailfrom: dwrobel@ertelnet.rybnik.pl)
ARC-Seal: i=1; a=rsa-sha256; t=1627380698; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gZjdu9xbhZa4vuSQHprjNsIh0Ke0OLGjDZ4dC1508kVVvDhQVGIfCmJSG2uNu+AeOBMA6LD8h/g5XyRzPGYmk+xKbeQhhwFwqf3zZ7eW+qPElSlObTA2A63vcrxsdphkeNN3U1aU+u7yIjEYBNO/6EiptYRdm3uH6Bjn9/tXqCU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1627380698; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=/9Hpl2wHfAdTm9v251wgBwS0w1RNqndwR5AHZqLsk00=; 
	b=mIho3DhwYhyJE66zrntDah39DOfRGXDzT19qDYYwK28hxJFkByqquTbgukmxlouVI/qTWQhREDV/wG34TlffW+XvmM/z51AC2meIlFraJwhYfJp9quoy80wC+N232H/W0iWHl1ePbFTh0v8ZBcT9p+tE2JJjS4E/pnSUvHyU7uI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ertelnet.rybnik.pl;
	spf=pass  smtp.mailfrom=dwrobel@ertelnet.rybnik.pl;
	dmarc=pass header.from=<dwrobel@ertelnet.rybnik.pl>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1627380698;
	s=ertelnet; d=ertelnet.rybnik.pl; i=dwrobel@ertelnet.rybnik.pl;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=/9Hpl2wHfAdTm9v251wgBwS0w1RNqndwR5AHZqLsk00=;
	b=WhOTqIMoL2QZiBVVE5dpVgAVGb3KTzE5hcJ3CorqTJGJQMjI6n8EzeiQ3b+Hnenj
	wB0KCGv01tL9vp15pAbxwpVC/rvl1nR6J26kDcrA8nF+nPjt7B/9SBTZK6xPOJLMX/1
	1dm1MxyByXV2MAyEq6M7u6hrtKUnJQxbr95oYL28=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 162738069596163.78204786313984; Tue, 27 Jul 2021 03:11:35 -0700 (PDT)
Date: Tue, 27 Jul 2021 12:11:35 +0200
From: "Damian Wrobel" <dwrobel@ertelnet.rybnik.pl>
To: "Andre McCurdy" <armccurdy@gmail.com>
Cc: "OE Core mailing list" <openembedded-core@lists.openembedded.org>
Message-ID: <17ae772c385.d3d4df3e46331.7009033370306957477@ertelnet.rybnik.pl>
In-Reply-To: <CAJ86T=WoGumcNmbX_7xN1rma5AFcUwVhn6W_H+WKBRYXMXb-wg@mail.gmail.com>
References: <YPnzFOuJhmDW/kb4@piout.net> <20210723092141.366318-1-dwrobel@ertelnet.rybnik.pl> <CAJ86T=WoGumcNmbX_7xN1rma5AFcUwVhn6W_H+WKBRYXMXb-wg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] rootfs: remove ldconfig auxiliary cache where appropriate
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit




 ---- On Fri, 23 Jul 2021 20:21:28 +0200 Andre McCurdy <armccurdy@gmail.com> wrote ----
 > On Fri, Jul 23, 2021 at 2:22 AM Damian Wrobel
 > <dwrobel@ertelnet.rybnik.pl> wrote:
 > >
 > > Removes the /var/cache/ldconfig auxiliary cache directory from
 > > the rootfs when:
 > >  - read-only-rootfs is in DISTRO_FEATURES,
 > >  - ldconfig is not in DISTRO_FEATURES.
 > 
 > Comments say DISTRO_FEATURES but code is checking IMAGE_FEATURES in both cases.
 > 
 > ldconfig is a distro feature and read-only-rootfs is an image feature,
 > so both the comments and code seem to be wrong...
Copy-paste side effect. Thanks for pointing this out. Fixed in v3.

--
Regards,
Damian
 > 
 > > In both cases the /var/cache/ldconfig/aux-cache is useless.
 > >
 > > Signed-off-by: Damian Wrobel <dwrobel@ertelnet.rybnik.pl>
 > > ---
 > >  meta/lib/oe/rootfs.py | 10 ++++++++++
 > >  1 file changed, 10 insertions(+)
 > >
 > > diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
 > > index ad9fd77c8b..8e63ebac9b 100644
 > > --- a/meta/lib/oe/rootfs.py
 > > +++ b/meta/lib/oe/rootfs.py
 > > @@ -302,6 +302,16 @@ class Rootfs(object, metaclass=ABCMeta):
 > >              self._exec_shell_cmd(['ldconfig', '-r', self.image_rootfs, '-c',
 > >                                    'new', '-v', '-X'])
 > >
 > > +        image_rorfs = bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs",
 > > +                                        True, False, self.d)
 > > +        ldconfig_in_features = bb.utils.contains("IMAGE_FEATURES", "ldconfig",
 > > +                                                 True, False, self.d)
 > > +        if image_rorfs or not ldconfig_in_features:
 > > +            ldconfig_cache_dir = os.path.join(self.image_rootfs, "var/cache/ldconfig")
 > > +            if os.path.exists(ldconfig_cache_dir):
 > > +                bb.note("Removing ldconfig auxiliary cache...")
 > > +                shutil.rmtree(ldconfig_cache_dir)
 > > +
 > >      def _check_for_kernel_modules(self, modules_dir):
 > >          for root, dirs, files in os.walk(modules_dir, topdown=True):
 > >              for name in files:
 > > --
 > > 2.31.1
 > >
 > >
 > > 
 > >
 > 
 > 
 > 
 > 
