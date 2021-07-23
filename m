Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
 by mx.groups.io with SMTP id smtpd.web10.5955.1627031785158729314
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jul 2021 02:16:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=dwrobel@ertelnet.rybnik.pl header.s=ertelnet header.b=cF+gVAwe;
 spf=pass (domain: ertelnet.rybnik.pl, ip: 136.143.188.14, mailfrom: dwrobel@ertelnet.rybnik.pl)
ARC-Seal: i=1; a=rsa-sha256; t=1627031782; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GifPQxtL6AtO97p7TUWwP+U57X3TboLtumJX2bVgvZRIilQe85U1s1/Z7iRopLpFal6bQy/HZhWNlfLBiEq01RlDBkOg8FzypqBIDape0+FF+AqlbJzx2Z1hHF6BVf6l+WhItdMLPOckI3Xoh5m0R6IKFn1X7E3dZl2/D9AzQ+k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1627031782; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=SiK1d13Vtk2l2xlCELMauUH414Kd/ndmZTzbe9beyz8=; 
	b=QVQANoveQiv1xZy8MqEvVSMdUQlqK2Jq7O94RHHpk0Th3VYEiL877OVSfa8Amz+20Y9Qry6moON0IyxMrbZzkb8OahoMdPxjHPiNustbKn/+zjzgd9E9gMKVlg2n0Mas3h6Yad8dC1LfgAslyW+ISPWTYU/xBwI+lyRQafpNSuc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ertelnet.rybnik.pl;
	spf=pass  smtp.mailfrom=dwrobel@ertelnet.rybnik.pl;
	dmarc=pass header.from=<dwrobel@ertelnet.rybnik.pl>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1627031782;
	s=ertelnet; d=ertelnet.rybnik.pl; i=dwrobel@ertelnet.rybnik.pl;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=SiK1d13Vtk2l2xlCELMauUH414Kd/ndmZTzbe9beyz8=;
	b=cF+gVAweS2zXGcEWwpqzofxq5LpOqi87jvYGVPRMW8OddNyl3i76+1OBovfMzgXK
	DxdjVCauR2ODA1FoQQaMgccmwJVXSzp0fGiJzODvYW0r8UAA+k2PrtCpC8NvirVQEme
	g64GMPLnARg9GtsGsO6go4CihaL1/I5e+JqgB9fA=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1627031781225752.245449218613; Fri, 23 Jul 2021 02:16:21 -0700 (PDT)
Date: Fri, 23 Jul 2021 11:16:21 +0200
From: "Damian Wrobel" <dwrobel@ertelnet.rybnik.pl>
To: "Andre McCurdy" <armccurdy@gmail.com>
Cc: "OE Core mailing list" <openembedded-core@lists.openembedded.org>
Message-ID: <17ad2a6bf52.1190799f1319848.3273288296398942369@ertelnet.rybnik.pl>
In-Reply-To: <CAJ86T=WmKA=aSWBF0iNv8=MiWQNu6Rj0n+3ONDKB481OZC2nng@mail.gmail.com>
References: <20210722094822.1102062-1-dwrobel@ertelnet.rybnik.pl> <CAJ86T=WmKA=aSWBF0iNv8=MiWQNu6Rj0n+3ONDKB481OZC2nng@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rootfs: remove ldconfig auxiliary cache where appropriate
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit




 ---- On Thu, 22 Jul 2021 21:00:15 +0200 Andre McCurdy <armccurdy@gmail.com> wrote ----
 > On Thu, Jul 22, 2021 at 2:48 AM Damian Wrobel
 > <dwrobel@ertelnet.rybnik.pl> wrote:
 > >
 > > Removes the /var/cache/ldconfig auxiliary cache directory from
 > > the rootfs when:
 > >  - read-only-rootfs is in DISTRO_FEATURES,
 > >  - ldconfig is not in DISTRO_FEATURES.
 > >
 > > In both cases the /var/cache/ldconfig/aux-cache is useless.
 > 
 > Should there be a test for package management being supported in the
 > image too? A read-only rootfs is one case where it's not possible to
 > install ldconfig support at run time but a writeable rootfs without
 > package management support would seem to be another?

It seems to be perfectly fine to use the ldconfig without having any package management system.

--
Regards,
Damian

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
 > >
 > > 
 > >
 > 
