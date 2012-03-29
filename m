Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SDOoV-00036S-Ch
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 01:31:31 +0200
Received: by qcso7 with SMTP id o7so38126qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 16:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=mSsUrMe55bdHbQdb3HJ7jO655Zhiarc2B5aulMBFmhU=;
	b=hEY5835vTZlIbWPiNs30WSuOwqXDLcCTpBSMcLcieY21TIYkADd1d4GHjyttppz8J8
	bqEfJH0Npe+/xNrbggjD67gkUgYI2RqHxG+ri3wUGjX8FHv2TPJ5zf/Z8K9OUSBwggX9
	hl6ajz7h5JXCFNwQwyc8sEBWZNB+uOhHSVaLbarLbunAtKJ19llZXDBXRW+o60BlOcJG
	b1uBMrc/A5lyWEUBUeMeZMqxh1v1FUViRhMwHHTXK+7y6ZUP5BEA8RzOCwxOKJT7Ct4Y
	LpnO4MeDfY6G/PymnShW2Pb86R9WPgeO0gWwm9J4l5WlO6MpOoJappAVVUnFbQ+AMjJF
	bl5g==
Received: by 10.229.137.133 with SMTP id w5mr934217qct.105.1333063346975; Thu,
	29 Mar 2012 16:22:26 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.158.11 with HTTP; Thu, 29 Mar 2012 16:22:06 -0700 (PDT)
In-Reply-To: <1333023749-31830-1-git-send-email-eric@eukrea.com>
References: <1333023749-31830-1-git-send-email-eric@eukrea.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 29 Mar 2012 16:22:06 -0700
X-Google-Sender-Auth: EdatiSm7c7mTLe-EczdyKn-8vkY
Message-ID: <CABcZANkEiOkTzf4qvKkp_WOe-zE1oxwVoX46c0JJyLoH1kiO=A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] license.bbclass: remove existing license.manifest before appending new data
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
X-List-Received-Date: Thu, 29 Mar 2012 23:31:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 29, 2012 at 5:22 AM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> without this fix, we append license each time we build again the same ima=
ge,
> ending with a large not up to date file.
>
> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
> ---
> =C2=A0meta/classes/license.bbclass | =C2=A0 =C2=A04 ++++
> =C2=A01 files changed, 4 insertions(+), 0 deletions(-)
>
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index 394a6d4..c85233c 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -79,6 +79,10 @@ license_create_manifest() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0# Get list of installed packages
> =C2=A0 =C2=A0 =C2=A0 =C2=A0list_installed_packages | grep -v "locale" |so=
rt > ${LICENSE_DIRECTORY}/${IMAGE_NAME}/package.manifest
> =C2=A0 =C2=A0 =C2=A0 =C2=A0INSTALLED_PKGS=3D`cat ${LICENSE_DIRECTORY}/${I=
MAGE_NAME}/package.manifest`
> + =C2=A0 =C2=A0 =C2=A0 # remove existing license.manifest file
> + =C2=A0 =C2=A0 =C2=A0 if [ -f ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license=
.manifest ]; then
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm ${LICENSE_DIRECTORY=
}/${IMAGE_NAME}/license.manifest
> + =C2=A0 =C2=A0 =C2=A0 fi
> =C2=A0 =C2=A0 =C2=A0 =C2=A0# list of installed packages is broken for deb

Probably not a concern in this particular case, but in general you
should avoid this sort of construct, as it's racy.
--=20
Christopher Larson


