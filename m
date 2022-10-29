Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB6F0C38A02
	for <webhook@archiver.kernel.org>; Sat, 29 Oct 2022 14:43:48 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.3898.1667054623969451612
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Oct 2022 07:43:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=chHVJQ6T;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1667054624;
  x=1698590624;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Qm9fu9g09nOa2x1zJdzXysO5/OS3Li9g+nFhthy7Zu4=;
  b=chHVJQ6TAf+UPabQhT3Uyzsb5nNd3qcxF949Udab2OgWMw1FEL/YpI7u
   rK8vR9LD64qGUawRA/Nbn7rq2B3gh6mnEe97HSR4qB/zM7In1kOE+/k1A
   uxGAKScby3Ijh3MTX0tECU0mycStLP4oGpO0Pnq/uk1iwxIoQY54WMQI7
   PErytcNnlrD7QHADhTyvcS7qKyb25kVnFCJql5xArXsCoLBpnAoDgDvVc
   w3POmxZffK1W1uxcMVcbDIFVKyXwT0VGSfQkY4XSOP6TRypjQq+GyF43R
   B/bi8zHxngiNXxc6ZOeY9aCPA19vM83M2+Ur2qKZYP54z+l4GjACKCik2
   g==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Ross Burton <ross.burton@arm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "nd@arm.com" <nd@arm.com>
Subject: RE: [OE-core] [PATCH] sanity: check for GNU tar specifically
Thread-Topic: [OE-core] [PATCH] sanity: check for GNU tar specifically
Thread-Index: AQHY6uFSnWFkY4czwUe+u4xNtsbpaq4lchEQ
Date: Sat, 29 Oct 2022 14:43:41 +0000
Message-ID: <3051f0b0d1e344d1a89845d021159854@axis.com>
References: <20221028152354.652211-1-ross.burton@arm.com>
In-Reply-To: <20221028152354.652211-1-ross.burton@arm.com>
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
 <openembedded-core@lists.openembedded.org>; Sat, 29 Oct 2022 14:43:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172277

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Ross Burton
> Sent: den 28 oktober 2022 17:24
> To: openembedded-core@lists.openembedded.org
> Cc: nd@arm.com
> Subject: [OE-core] [PATCH] sanity: check for GNU tar specifically
>=20
> We need the system tar to be GNU tar, as we reply on --xattrs.  Some

Change "reply" to "rely".

> distributions may be using libarchive's tar binary, which is definitely
> not as featureful, so check for this and abort early with a clear
> message instead of later with mysterious errors.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/classes-global/sanity.bbclass | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/san=
ity.bbclass
> index 15067e78d3c..606444cae18 100644
> --- a/meta/classes-global/sanity.bbclass
> +++ b/meta/classes-global/sanity.bbclass
> @@ -504,6 +504,14 @@ def check_tar_version(sanity_data):
>      version =3D result.split()[3]
>      if bb.utils.vercmp_string_op(version, "1.28", "<"):
>          return "Your version of tar is older than 1.28 and does not have=
 the support needed to enable reproducible builds. Please install a newer v=
ersion of tar (you could use the project's buildtools-tarball from our last=
 release or use scripts/install-buildtools).\n"
> +
> +    try:
> +        result =3D subprocess.check_output(["tar", "--help"], stderr=3Ds=
ubprocess.STDOUT).decode('utf-8')
> +        if "--xattrs" not in result:
> +            return "Your tar doesn't support --xattrs, please use GNU ta=
r.\n"
> +    except subprocess.CalledProcessError as e:
> +        return "Unable to execute tar --help, exit code %d\n%s\n" % (e.r=
eturncode, e.output)
> +

Would it make sense to actually check that it is GNU tar that is being=20
used, and do that before the version check above? Because the version=20
check does not make much sense if it is not GNU tar...

>      return None
>=20
>  # We use git parameters and functionality only found in 1.7.8 or later
> --
> 2.34.1

//Peter


