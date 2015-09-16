Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id C5A9173D27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 23:01:30 +0000 (UTC)
Received: by iofh134 with SMTP id h134so4040285iof.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 16:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=90X9e5o1Zzi3vTbLMnqZLLHoYESsdmkLaH7sHTJ72aI=;
	b=viKl2ZCyKqLs/uVaUCkONWNaXAal+VFFdqSgnKs8RmElmGDyVqD/Asvv2ZMmxFcSPZ
	UYXnHr7EX4o4P1DPa+fdCaUt1VAVnx/g+lLjH4p62AdxQZ58aw9JcGUaXmDWRpbdZh2J
	KO/ABdEhS1vXENgJLvhoGmz18S0wJVBwq/I+KSPTi09S1dNtCIJCknrTqY2mZXF2/qjs
	V5b8ESPZbmVK2J0L1BYo5JOaorJDQdCj0AveZeCAZA64z4rGMEks5GSS0NVWQiezyVje
	5sU3p3KeyxV2mISHDqjwZr/8DkeIBIabnXSoO1LbU04xt0bJoZXlaqOVSN7aSRi5JHHW
	Cxeg==
X-Received: by 10.107.162.139 with SMTP id l133mr943834ioe.49.1442444490306;
	Wed, 16 Sep 2015 16:01:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.130 with HTTP; Wed, 16 Sep 2015 16:01:00 -0700 (PDT)
In-Reply-To: <1442385109-28179-1-git-send-email-erkka.kaaria@intel.com>
References: <1442385109-28179-1-git-send-email-erkka.kaaria@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Sep 2015 16:01:00 -0700
Message-ID: <CAMKF1sp7XzX2Z8B1gO3pV3A6YhjCYVrx9c2dKDrgVvMk6RxQbw@mail.gmail.com>
To: =?UTF-8?B?RXJra2EgS8Okw6RyacOk?= <erkka.kaaria@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] python_2.7.9.bb: Add python-misc as runtime dependency to python-modules
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
X-List-Received-Date: Wed, 16 Sep 2015 23:01:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2015 at 11:31 PM, Erkka K=C3=A4=C3=A4ri=C3=A4 <erkka.kaaria=
@intel.com> wrote:
> Currently python-misc is not included even if python-modules is. This mea=
ns some python scripts fail even if python-modules is included in the image=
 (for example, get-pip.py at bootstrap.pypa.io/get-pip.py).
>

this patch is OK. Although a proper division of modules would be a
nice improvement. misc is really not misc here as it is now.

> Signed-off-by: Erkka K=C3=A4=C3=A4ri=C3=A4 <erkka.kaaria@intel.com>
> ---
>  meta/recipes-devtools/python/python_2.7.9.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/python/python_2.7.9.bb b/meta/recipes-=
devtools/python/python_2.7.9.bb
> index ae45577..f7e2f27 100644
> --- a/meta/recipes-devtools/python/python_2.7.9.bb
> +++ b/meta/recipes-devtools/python/python_2.7.9.bb
> @@ -161,7 +161,8 @@ FILES_${PN}-dbg +=3D "${libdir}/python${PYTHON_MAJMIN=
}/lib-dynload/.debug"
>  # catch all the rest (unsorted)
>  PACKAGES +=3D "${PN}-misc"
>  FILES_${PN}-misc =3D "${libdir}/python${PYTHON_MAJMIN}"
> -RDEPENDS_${PN}-ptest =3D "${PN}-modules ${PN}-misc"
> +RDEPENDS_${PN}-modules +=3D "${PN}-misc"
> +RDEPENDS_${PN}-ptest =3D "${PN}-modules"
>  #inherit ptest after "require python-${PYTHON_MAJMIN}-manifest.inc" so P=
ACKAGES doesn't get overwritten
>  inherit ptest
>
> --
> 2.1.4
>
> ---------------------------------------------------------------------
> Intel Finland Oy
> Registered Address: PL 281, 00181 Helsinki
> Business Identity Code: 0357606 - 4
> Domiciled in Helsinki
>
> This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). Any review or distribution
> by others is strictly prohibited. If you are not the intended
> recipient, please contact the sender and delete all copies.
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

