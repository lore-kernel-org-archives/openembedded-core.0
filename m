Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 576C6C433F5
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 13:47:12 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.11770.1642686430555765677
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 05:47:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=oJl7C1dv;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1642686431;
  x=1674222431;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sw32zQJfFLkz/TBHGQ9oUGwTUKritnzB7e/rmvrpcZA=;
  b=oJl7C1dvl5cs+5RC07mF3cJAlTF9aaqMXvXj6GEMacSQvY4lBgA91MsT
   S5HUswcHqmbwQ0C+jR/p3sk9OOLgCtdxyLXhKOqwgDqOMRgRgKht8xref
   zaeBX77IfF+A20lBhymg9QXGsVOsa2FP9gQaiX4AN5CpN9NHyihczUZMw
   syjYCJIfKk5NhojIO2H84vi8I24lw0BT3qI/q4Hl+jIYXuGq+BOlNrs4R
   KY+U13f0cTm790hH0+0M4H/WDYJ6RxAItxNWcXlJe8jdAkXD9LxDTgj4a
   gVmn4+WDs4IzUTyvkmCmo5CjuOQQDf8BSwkuOKgERtyv+PtBOedGNgcmh
   Q==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Robert Yang <liezhi.yang@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "jupiter.hce@gmail.com" <jupiter.hce@gmail.com>
Subject: RE: [OE-core] [PATCH 1/1] bitbake.conf: Add BB_TASK_NETWORK to enable
 task network globally
Thread-Topic: [OE-core] [PATCH 1/1] bitbake.conf: Add BB_TASK_NETWORK to
 enable task network globally
Thread-Index: AQHYDcywYeFBxm1aeU6oGxWlB9qaaaxr6a5A
Date: Thu, 20 Jan 2022 13:47:07 +0000
Message-ID: <b42e9f3bde0a4126bde3e4969412ee1b@axis.com>
References: <cover.1642662353.git.liezhi.yang@windriver.com>
 <bb3ae8dbd929eac83394be5fe3284dd79c895e44.1642662353.git.liezhi.yang@windriver.com>
In-Reply-To: 
 <bb3ae8dbd929eac83394be5fe3284dd79c895e44.1642662353.git.liezhi.yang@windriver.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 13:47:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160760

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Robert Yang
> Sent: den 20 januari 2022 08:09
> To: openembedded-core@lists.openembedded.org
> Cc: jupiter.hce@gmail.com
> Subject: [OE-core] [PATCH 1/1] bitbake.conf: Add BB_TASK_NETWORK to enabl=
e
> task network globally
>=20
> The NIS or icecc can't work when task network is dissable, add
> BB_TASK_NETWORK to enable network globally for such exceptions.
>=20
> Note, enable nscd on the build machine might be a solution, but that isn'=
t
> reliable since it depends on whether the network function has been cached
> or not.
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/icecc.bbclass |  2 ++
>  meta/conf/bitbake.conf     |  3 +++
>  meta/lib/oe/utils.py       | 15 +++++++++++++++
>  3 files changed, 20 insertions(+)
>=20
> diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
> index 794e9930ad9..c39c86458a4 100644
> --- a/meta/classes/icecc.bbclass
> +++ b/meta/classes/icecc.bbclass
> @@ -41,6 +41,8 @@ ICECC_ENV_EXEC ?=3D "${STAGING_BINDIR_NATIVE}/icecc-cre=
ate-env"
>=20
>  HOSTTOOLS_NONFATAL +=3D "icecc patchelf"
>=20
> +BB_TASK_NETWORK ? =3D "1"
> +
>  # This version can be incremented when changes are made to the environme=
nt that
>  # invalidate the version on the compile nodes. Changing it will cause a =
new
>  # environment to be created.
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index fba99e8f0cd..bf5bcd55519 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -946,3 +946,6 @@ MULTILIB_VARIANTS ??=3D ""
>  # what it would be anyway if the signature generator (e.g. OEEquivHash)
> doesn't
>  # support unihashes.
>  BB_UNIHASH ?=3D "${BB_TASKHASH}"
> +
> +# Enable task network for remote user such as NIS.
> +BB_TASK_NETWORK ??=3D "${@['1', '0'][oe.utils.is_local_uid()]}"

I think this is more readable:

BB_TASK_NETWORK ??=3D "${@0 if oe.utils.is_local_uid() else 1}"

An even more readable solution would be to rename the function to=20
is_nonlocal_uid() and make it return the inverse of what it returns=20
now.

You probably also want to change it to use :=3D instead of ??=3D so that=20
/etc/passwd is only parsed once. This might require to introduce=20
another variable:=20

UID_IS_NONLOCAL :=3D "${@0 if oe.utils.is_local_uid() else 1}"
BB_TASK_NETWORK ??=3D "${UID_IS_NONLOCAL}"

> diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
> index 136650e6f74..c21f034aafc 100644
> --- a/meta/lib/oe/utils.py
> +++ b/meta/lib/oe/utils.py
> @@ -595,3 +595,18 @@ def directory_size(root, blocksize=3D4096):
>          total +=3D sum(roundup(getsize(os.path.join(root, name))) for na=
me in files)
>          total +=3D roundup(getsize(root))
>      return total
> +
> +def is_local_uid(uid=3D''):
> +    """
> +    Check whether uid is a local one or not.
> +    Can't use pwd module since it gets all UIDs, not local ones only.
> +    """
> +    if not uid:
> +        uid =3D os.getuid()
> +    local_uids =3D set()
> +    with open('/etc/passwd', 'r') as f:
> +        for line in f.readlines():
> +            if not ':' in line:
> +                continue
> +            local_uids.add(line.split(':')[2])
> +    return uid in local_uids
> --
> 2.31.1

//Peter


