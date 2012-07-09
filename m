Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1So9zq-00042s-Vd
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 11:11:11 +0200
Received: by yenl13 with SMTP id l13so9167259yen.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jul 2012 02:00:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=A8mqDm0ROdSMaAlDO7wpHCM/bvq06lBCrNeYVKz0WIw=;
	b=VI2bWfHw+2n018aEgTkSU3asfqs5WXmyNgeaeCxshHQx7wr7mpfgJ+c0m/nnXBypI4
	Qc+TxVkf7k1KpsNaSnYi5Zz9xy6OAOl+DzrmZHlKYpfxDmRY4y5KMyULyKmYLqIfad4r
	/CF3A8COU0nJ+eevWxzu4eALOJv28OS2ogG4vH5PEl9R0GNzF189ngntnjjc9aeqS8si
	ACTXtMdkvDcchUhRxR4EAzLKhbjXUXxzQ46QmM4D1Zqp4WyeC6OToEONqWcZi92NdxxH
	aboBqjfz8Uqcf3uiio4tgjx59svM/gTbk/IPlqmR/OzVkuE3Cix3qXOECbRDeljz3Cp4
	kDzQ==
Received: by 10.43.70.71 with SMTP id yf7mr19780876icb.14.1341824399151; Mon,
	09 Jul 2012 01:59:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.98.162 with HTTP; Mon, 9 Jul 2012 01:59:38 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <alpine.DEB.2.02.1207071435090.25344@oneiric>
References: <alpine.DEB.2.02.1207071435090.25344@oneiric>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Mon, 9 Jul 2012 11:59:38 +0300
Message-ID: <CAK18fxFo2YtoGNQEtLNh8cVPvxKebGYYKQSEVCPxXmWsTfU3Gg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQk1NrTKMw6fMkF0IHh8f2eH7jLaDwezvRVqM82i/C9QV+9rG40qvnvj+NZ4R5ZlHzX0ftfV
Subject: Re: setting EXTRA_IMAGE_FEATURES explicitly in .bb file can screw things up
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
X-List-Received-Date: Mon, 09 Jul 2012 09:11:11 -0000
Content-Type: multipart/alternative; boundary=bcaec51d2212a991a204c461d671

--bcaec51d2212a991a204c461d671
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Jul 7, 2012 at 9:52 PM, Robert P. J. Day <rpjday@crashcourse.ca>wrote:

>
>   a while back, i whined about the inconsistent usage of
> EXTRA_IMAGE_FEATURES, like this as a snippet:
>
> meta/recipes-sato/images/core-image-sato-sdk.bb:EXTRA_IMAGE_FEATURES +=
> "tools-debug tools-profile tools-testapps debug-tweaks"
> meta/recipes-rt/images/core-image-rt-sdk.bb:EXTRA_IMAGE_FEATURES +=
> "tools-debug tools-profile tools-testapps debug-tweaks"
> meta/recipes-extended/images/core-image-lsb-sdk.bb:EXTRA_IMAGE_FEATURES =
> "tools-debug tools-profile tools-testapps debug-tweaks"
>
> notice the mixing of "+=" and "=", which seems messy.  then i ran
> across this in core-image-lsb-sdk.bb:
>
> IMAGE_FEATURES += "apps-console-core tools-sdk dev-pkgs ssh-server-openssh"
> EXTRA_IMAGE_FEATURES = "tools-debug tools-profile tools-testapps
> debug-tweaks"
>
>   that *can't* be right, can it?  the explicit setting of
> EXTRA_IMAGE_FEATURES in that recipe file will override any such
> setting in one's local.conf file, won't it?  and that's how the
> current manual *advises* how to add more features through your
> local.conf.
>
>   i tested this target with a standard local.conf, and checked the
> environment to see:
>
> ... snip ...
> IMAGE_FEATURES="apps-console-core debug-tweaks tools-sdk
> tools-testapps dev-pkgs tools-profile tools-debug ssh-server-openssh"
>
> which looks fine according to the .bb file.
>
>   but if i add the following to my local.conf file (as the manual
> suggests i do to add another feature):
>
> EXTRA_IMAGE_FEATURES = "nfs-server"
>
> i see *no* difference in the environment.  hasn't the setting in the
> .bb file overridden the one in my local.conf?
>
>   i *can* get nfs-server added to my list of features with
> (predictably):
>
> IMAGE_FEATURES += "nfs-server"
>
> but that doesn't strike me as a proper solution and will certainly
> come as an unpleasant surprise to someone eventually.  thoughts?
>
>
I agree that there is a problem with this image. Anyway the best way to
debug a scenario like this is to use bitbake -e and grep on the thing you
are interested in. I tried to add a feature to local conf and, as i
expected, EXTRA_IMAGE_FEATURES ended up overwritten by recipe.

So IMHO the EXTRA_IMAGE_FEATURES variable in the image should be merged in
the IMAGE_FEATURES above. I don't see the meaning of it.

@g

--bcaec51d2212a991a204c461d671
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Sat, Jul 7, 2012 at 9:52 PM, Robert P. J. Day=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:rpjday@crashcourse.ca" target=3D"_=
blank">rpjday@crashcourse.ca</a>&gt;</span> wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">

<br>
=A0 a while back, i whined about the inconsistent usage of<br>
EXTRA_IMAGE_FEATURES, like this as a snippet:<br>
<br>
meta/recipes-sato/images/core-image-sato-sdk.bb:EXTRA_IMAGE_FEATURES +=3D &=
quot;tools-debug tools-profile tools-testapps debug-tweaks&quot;<br>
meta/recipes-rt/images/core-image-rt-sdk.bb:EXTRA_IMAGE_FEATURES +=3D &quot=
;tools-debug tools-profile tools-testapps debug-tweaks&quot;<br>
meta/recipes-extended/images/core-image-lsb-sdk.bb:EXTRA_IMAGE_FEATURES =3D=
 &quot;tools-debug tools-profile tools-testapps debug-tweaks&quot;<br>
<br>
notice the mixing of &quot;+=3D&quot; and &quot;=3D&quot;, which seems mess=
y. =A0then i ran<br>
across this in <a href=3D"http://core-image-lsb-sdk.bb" target=3D"_blank">c=
ore-image-lsb-sdk.bb</a>:<br>
<br>
IMAGE_FEATURES +=3D &quot;apps-console-core tools-sdk dev-pkgs ssh-server-o=
penssh&quot;<br>
EXTRA_IMAGE_FEATURES =3D &quot;tools-debug tools-profile tools-testapps deb=
ug-tweaks&quot;<br>
<br>
=A0 that *can&#39;t* be right, can it? =A0the explicit setting of<br>
EXTRA_IMAGE_FEATURES in that recipe file will override any such<br>
setting in one&#39;s local.conf file, won&#39;t it? =A0and that&#39;s how t=
he<br>
current manual *advises* how to add more features through your<br>
local.conf.<br>
<br>
=A0 i tested this target with a standard local.conf, and checked the<br>
environment to see:<br>
<br>
... snip ...<br>
IMAGE_FEATURES=3D&quot;apps-console-core debug-tweaks tools-sdk<br>
tools-testapps dev-pkgs tools-profile tools-debug ssh-server-openssh&quot;<=
br>
<br>
which looks fine according to the .bb file.<br>
<br>
=A0 but if i add the following to my local.conf file (as the manual<br>
suggests i do to add another feature):<br>
<br>
EXTRA_IMAGE_FEATURES =3D &quot;nfs-server&quot;<br>
<br>
i see *no* difference in the environment. =A0hasn&#39;t the setting in the<=
br>
.bb file overridden the one in my local.conf?<br>
<br>
=A0 i *can* get nfs-server added to my list of features with<br>
(predictably):<br>
<br>
IMAGE_FEATURES +=3D &quot;nfs-server&quot;<br>
<br>
but that doesn&#39;t strike me as a proper solution and will certainly<br>
come as an unpleasant surprise to someone eventually. =A0thoughts?<br><br><=
/blockquote><div><br></div><div>I agree that there is a problem with this i=
mage. Anyway the best way to debug a scenario like this is to use bitbake -=
e and grep on the thing you are interested in. I=A0tried=A0to add a feature=
 to local conf and, as i expected,=A0EXTRA_IMAGE_FEATURES ended up overwrit=
ten by recipe.=A0</div>

<div><br></div><div>So IMHO the=A0EXTRA_IMAGE_FEATURES variable in the imag=
e should be merged in the IMAGE_FEATURES above. I don&#39;t see the meaning=
 of it.=A0</div><div><br></div><div>@g</div><div>=A0</div></div>

--bcaec51d2212a991a204c461d671--
