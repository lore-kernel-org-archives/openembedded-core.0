Return-Path: <elizabeth.flanagan@intel.com>
Received: from mail-vn0-f54.google.com (mail-vn0-f54.google.com
	[209.85.216.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0D20E605B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 18:59:39 +0000 (UTC)
Received: by vnbg1 with SMTP id g1so7699363vnb.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 11:59:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=uZb5F9SF46BUPwtPgI+bJ/wt6n/c+rN88qmmoao7w/g=;
	b=AxbFANIlPP1z6cnmu4JSOc/nN5mCdcaZFagXp2U7PhjOQNA4s2xA6NSjElFY1le/4i
	AGjr8FETYb10+/77Ryvzw9vusH7L91HplHJhgmN/OAwSDq7QFWp0Cix5SeALDWLRjver
	utcQrmSRD+arlXZkQvYuXFje3gXUl9HCLa27f/24eDrid8r47UtNfLPHMnVVXboFYIn4
	AEKq2xaUqDIxKI+JKzv6ZY+UqW5+xzzI1PASaVNwPWcA1mYtpX9f+RLdf4qTTq67pfvd
	1kE1zaJFDQqxcqnMl9M13M3/OkysqAHFflY9PLoxb8KNNAEld1Et3fMwED3Ro2CadbK+
	qwTg==
X-Gm-Message-State: ALoCoQlq6Gamn9ZHmeYPqlctoPZQfI4gkjlri4TzlWc468+dnJz05rx9NrG1oftdAsql9ap/KAEC
MIME-Version: 1.0
X-Received: by 10.52.135.4 with SMTP id po4mr38755274vdb.78.1435172380349;
	Wed, 24 Jun 2015 11:59:40 -0700 (PDT)
Received: by 10.52.233.105 with HTTP; Wed, 24 Jun 2015 11:59:40 -0700 (PDT)
In-Reply-To: <1435164582-31218-1-git-send-email-anibal.limon@linux.intel.com>
References: <1435164582-31218-1-git-send-email-anibal.limon@linux.intel.com>
Date: Wed, 24 Jun 2015 19:59:40 +0100
Message-ID: <CAPhnLPBfdLeT-3UtWrwqYew48jTCUqqZ4jCSUd_ODMwgUomt9g@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][fido] classes/license.bbclass: Improve generic license copy validation.
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
X-List-Received-Date: Wed, 24 Jun 2015 18:59:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 24 June 2015 at 17:49, An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.=
com> wrote:
> Remove + char in any position for cover cases when license has
> the form like GPL-2.0+-with-OpenSSL-exception.
>
> [YOCTO #7584]
>
> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.com>
> ---
>  meta/classes/license.bbclass | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index 73a0e97..e00a695 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -71,8 +71,12 @@ license_create_manifest() {
>
>                 lics=3D"$(echo ${pkged_lic} | sed "s/[|&()*]/ /g" | sed "=
s/  */ /g" )"
>                 for lic in ${lics}; do
> +                       # remove + chars in any position this cover cases=
 like
> +                       # GPL-2.0+-with-OpenSSL-exception -> GPL-2.0-with=
-OpenSSL-exception
> +                       lic=3D"$(echo ${lic} | sed "s/\+//g")"
> +
>                         # to reference a license file trim trailing + sym=
bol
> -                       if ! [ -e "${LICENSE_DIRECTORY}/${pkged_pn}/gener=
ic_${lic%+}" ]; then
> +                       if ! [ -e "${LICENSE_DIRECTORY}/${pkged_pn}/gener=
ic_${lic}" ]; then
>                                 bbwarn "The license listed ${lic} was not=
 in the licenses collected for ${pkged_pn}"
>                         fi
>                 done
> --
> 1.9.1
>
> --

This looks like the right fix for this for right now.

Acked-by: Beth Flanagan <elizabeth.flanagan@intel.com>

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



--=20
Elizabeth Flanagan
Yocto Project
Build and Release

