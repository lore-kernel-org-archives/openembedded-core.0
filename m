Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1R8Xyf-000658-2X
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Sep 2011 15:45:41 +0200
Received: by wyh5 with SMTP id 5so7633196wyh.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2011 06:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=E4gRk4EAnueXEkOuSDOprMu0QLa6HkYTCwSdZI7djdU=;
	b=ktKmvaR7hyMY7AlXXlW48c6nUumtlXKizjFb80PK9wXbVPslzGFUpfvm82gyaa7Pgw
	PrmLk6sMIltUZKm9WKaLto0XC/k5zUqHXcd49HEDNdNlrdtAArdtipvDl2t0GliCN8aw
	ndV8IhG1Q6mUC1bfyAykBLLCr9Mcyux8/Hvpk=
MIME-Version: 1.0
Received: by 10.227.197.210 with SMTP id el18mr3241145wbb.111.1317130815822;
	Tue, 27 Sep 2011 06:40:15 -0700 (PDT)
Received: by 10.180.87.197 with HTTP; Tue, 27 Sep 2011 06:40:15 -0700 (PDT)
In-Reply-To: <1316297897-698-4-git-send-email-dbaryshkov@gmail.com>
References: <1316297897-698-1-git-send-email-dbaryshkov@gmail.com>
	<1316297897-698-4-git-send-email-dbaryshkov@gmail.com>
Date: Tue, 27 Sep 2011 09:40:15 -0400
Message-ID: <CADkTA4NkDt+Go=4Qa4+cRgg=9xQo_LnC46aR5qnMzLcvSd2psQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: [PATCH 4/5] kernel.bbclass: handle .cis firmware
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
X-List-Received-Date: Tue, 27 Sep 2011 13:45:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 17, 2011 at 6:18 PM, Dmitry Eremin-Solenikov
<dbaryshkov@gmail.com> wrote:
> .cis firmware files are used by kernel to patch incorrect CIS fir PCMCIA
> cards. Create respective packages.

Looks fine to me.

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

>
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> ---
> =A0meta/classes/kernel.bbclass | =A0 =A01 +
> =A01 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 6ff4018..59d3b89 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -450,6 +450,7 @@ python populate_packages_prepend () {
> =A0 =A0 =A0 =A0postrm =3D bb.data.getVar('pkg_postrm_modules', d, 1)
> =A0 =A0 =A0 =A0do_split_packages(d, root=3D'/lib/firmware', file_regex=3D=
'^(.*)\.bin$', output_pattern=3D'kernel-firmware-%s', description=3D'Firmwa=
re for %s', recursive=3DTrue, extra_depends=3D'')
> =A0 =A0 =A0 =A0do_split_packages(d, root=3D'/lib/firmware', file_regex=3D=
'^(.*)\.fw$', output_pattern=3D'kernel-firmware-%s', description=3D'Firmwar=
e for %s', recursive=3DTrue, extra_depends=3D'')
> + =A0 =A0 =A0 do_split_packages(d, root=3D'/lib/firmware', file_regex=3D'=
^(.*)\.cis$', output_pattern=3D'kernel-firmware-%s', description=3D'Firmwar=
e for %s', recursive=3DTrue, extra_depends=3D'')
> =A0 =A0 =A0 =A0do_split_packages(d, root=3D'/lib/modules', file_regex=3Dm=
odule_regex, output_pattern=3Dmodule_pattern, description=3D'%s kernel modu=
le', postinst=3Dpostinst, postrm=3Dpostrm, recursive=3DTrue, hook=3Dfrob_me=
tadata, extra_depends=3D'update-modules kernel-%s' % bb.data.getVar("KERNEL=
_VERSION", d, 1))
>
> =A0 =A0 =A0 =A0import re
> --
> 1.7.2.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


