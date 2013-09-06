Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id EB8336BDAC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 16:59:45 +0000 (UTC)
Received: by mail-pd0-f179.google.com with SMTP id v10so3494217pde.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2013 09:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=5xsiqbOXN8D+8bsjRa2EBw6p+mDXldKHgJ2I2TsnmBs=;
	b=Fybv5w9T02H+4BXg7z/UHJ3pkPTf82jTZ0YNzAkAT4xPGI2AgOigZc7s5IrjmJPMd+
	nGFZcxzSSYPV3eyXYVidkY0lumxBRUuWyQtd/iXo1b/ANacVkUdfzzpyE2iR2wdWDxM3
	W8QorJLNNGAR2+aBPH8cJne91Z3NFpD7CocRn58IVxPSRSi2fKHGN635ygZfoVl1KJcb
	SeCQ1PidBuXdda5V12IfjlkjsyxBaWQKDeNQ9IPeji+Nyu5EhLb1DdioisgImY+hDul4
	bUu/ZBnQpUkUV/9ksy9c5oMDv9pl763BxabWhS1Be2W7Fp/EqptHhyDjaltOE2KBiq9M
	WupA==
X-Received: by 10.68.98.101 with SMTP id eh5mr4064644pbb.65.1378486787738;
	Fri, 06 Sep 2013 09:59:47 -0700 (PDT)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPSA id
	oj6sm5982005pab.9.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 06 Sep 2013 09:59:47 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CABcZANnwvbvCxahybCFQBO=QsR5P6cV+DT36N0qwe1Dvy4H0QQ@mail.gmail.com>
Date: Fri, 6 Sep 2013 09:59:50 -0700
Message-Id: <650EE99E-3982-4C41-98C1-3D67C4E08FDB@gmail.com>
References: <1378456523-16123-1-git-send-email-raj.khem@gmail.com>
	<CABcZANnwvbvCxahybCFQBO=QsR5P6cV+DT36N0qwe1Dvy4H0QQ@mail.gmail.com>
To: Chris Larson <clarson@kergoth.com>
X-Mailer: Apple Mail (2.1508)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package.bbclass: skip already-stripped QA test if asked for
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
X-List-Received-Date: Fri, 06 Sep 2013 16:59:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Sep 6, 2013, at 7:14 AM, Chris Larson <clarson@kergoth.com> wrote:

>=20
> On Fri, Sep 6, 2013 at 1:35 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Some packages like grub have already stripped binaries e.g.
>=20
> ERROR: QA Issue: File '/boot/grub/kernel.img' from grub was already
> stripped, this will prevent future debugging!
> ERROR: QA run found fatal errors. Please consider fixing them.
>=20
> We would like to have a possibility to skip it using something like
>=20
> INSANE_SKIP_${PN} =3D "already-stripped"
>=20
> This adds the logic to do so
>=20
> it acts at PN level and not at package level. so something like
>=20
> INSANE_SKIP_${PN}-misc =3D "already-stripped" wont work.
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes/package.bbclass | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes/package.bbclass =
b/meta/classes/package.bbclass
> index 50490bc..96e649a 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -811,8 +811,11 @@ python split_and_strip_files () {
>                      elf_file =3D isELF(file)
>                      if elf_file & 1:
>                          if elf_file & 2:
> -                            msg =3D "File '%s' from %s was already =
stripped, this will prevent future debugging!" % (file[len(dvar):], pn)
> -                            =
package_qa_handle_error("already-stripped", msg, d)
> +                            if 'already-stripped' in =
(d.getVar('INSANE_SKIP_' + pn, True) or "").split():
> +                                bb.note("Package %s skipping =
already-stripped QA test" % (pn))
>=20
> This seems like it must be inside a loop over each file, yet the =
message here is about the package, not the file, so I expect the task =
log may show a ton of duplicate messages, eh? :)

Thanks yes. I will send a V2

> --=20
> Christopher Larson


