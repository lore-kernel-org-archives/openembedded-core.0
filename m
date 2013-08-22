Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 6284C6B112
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 08:25:37 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id ld10so1884369pab.36
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 01:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=ebJYF3mePS9ngCjfsisKoNNRXIG2HZ+ECoMaV8zM1ZM=;
	b=ZV+urwyEY5frImvk/R0TM3KMhJyHVproG2qKg7L3bQQ0TBFkDFBSrN/GduLohv0DP5
	znqVdUmv6wm9pmlZ6vom/0yxKTz9eudLzwtVnFZO20+sow8lqnSVwEtFeqNV0dZTHjwG
	pPOLtcR9NmKTvb7ZznCT0n9LYcY5K9qMqB8Mu1fq7TJknza7XybI+F9aO3OrII3/OK14
	AUMnLWQ3IbSzNgIwREQokHzEGmmlL7RCoy3VmdjMfARm4GAEN2nRjIi+TtO9MTWq1Z+r
	yGD9kuDMUEKF46iKT36+nbzkax4Ksw14H0wX/GhE+JCtHqtKyrq0okhKpcC8J4VHK4hq
	vUYA==
X-Received: by 10.66.161.229 with SMTP id xv5mr4236643pab.87.1377159937939;
	Thu, 22 Aug 2013 01:25:37 -0700 (PDT)
Received: from sa-nc-finance-109.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id yo2sm15222204pab.8.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 22 Aug 2013 01:25:37 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1377157335-21262-1-git-send-email-zhangle.yang@windriver.com>
Date: Thu, 22 Aug 2013 01:25:36 -0700
Message-Id: <ED88267A-CD5C-4277-8B68-FA63318F21B6@gmail.com>
References: <1377157335-21262-1-git-send-email-zhangle.yang@windriver.com>
To: Zhangle Yang <zhangle.yang@windriver.com>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] stat: fix the wrong return code
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
X-List-Received-Date: Thu, 22 Aug 2013 08:25:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 22, 2013, at 12:42 AM, Zhangle Yang <zhangle.yang@windriver.com> =
wrote:

> After stat -h is executed, the return code is 1.
> This patch changes it to 0.


aside from the patch. why don't we use stat from coreutils or busybox =
and drop maintaining
this old version of stat. Are there some use cases where we don't have =
busy box or coreutils on box ?


> Signed-off-by: Zhangle Yang <zhangle.yang@windriver.com>
> ---
> .../stat/stat-3.3/fix-error-return.patch           |   16 =
++++++++++++++++
> meta/recipes-extended/stat/stat_3.3.bb             |    3 ++-
> 2 files changed, 18 insertions(+), 1 deletions(-)
> create mode 100644 =
meta/recipes-extended/stat/stat-3.3/fix-error-return.patch
>=20
> diff --git =
a/meta/recipes-extended/stat/stat-3.3/fix-error-return.patch =
b/meta/recipes-extended/stat/stat-3.3/fix-error-return.patch
> new file mode 100644
> index 0000000..032995d
> --- /dev/null
> +++ b/meta/recipes-extended/stat/stat-3.3/fix-error-return.patch
> @@ -0,0 +1,16 @@
> +This patch fixies the wrong return code of stat -h.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Zhangle Yang <zhangle.yang@windriver.com>
> +
> +--- stat-3.3/stat.c.orig	2013-08-22 10:49:45.000000000 +0800
> ++++ stat-3.3/stat.c	2013-08-22 10:50:31.000000000 +0800
> +@@ -845,7 +845,7 @@
> +     fprintf(stderr, "\t\t%%S - Security ID in SE-Linux\n");
> +     fprintf(stderr, "\t\t%%C - Security context in SE-Linux\n");
> +     fprintf(stderr, "\t\t%%d - Free file nodes in file system\n");
> +-    exit(1);
> ++    exit(0);
> + }
> +  =20
> +=20
> diff --git a/meta/recipes-extended/stat/stat_3.3.bb =
b/meta/recipes-extended/stat/stat_3.3.bb
> index 73e0873..1131bdf 100644
> --- a/meta/recipes-extended/stat/stat_3.3.bb
> +++ b/meta/recipes-extended/stat/stat_3.3.bb
> @@ -8,7 +8,8 @@ BBCLASSEXTEND =3D "native"
>=20
> PR =3D "r0"
>=20
> -SRC_URI =3D =
"ftp://metalab.unc.edu/pub/Linux/utils/file/stat-3.3.tar.gz"
> +SRC_URI =3D =
"ftp://metalab.unc.edu/pub/Linux/utils/file/stat-3.3.tar.gz \
> +           file://fix-error-return.patch"
> SRC_URI[md5sum] =3D "37e247e8e400ad9205f1b0500b728fd3"
> SRC_URI[sha256sum] =3D =
"7071f0384a423a938dd542c1f08547a02824f6359acd3ef3f944b2c4c2d1ee09"
>=20
> --=20
> 1.7.4.1
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


