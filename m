Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id F217865C97
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Feb 2015 14:45:15 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id hz1so5560976pad.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Feb 2015 06:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=2xwns+5h6VVnkoO1/YiaMLHvZtTlwo3P3zpshqScgLM=;
	b=z1SZs6IQPSpKFOITNthv9PU6Sys1mKsuT2f4FXfyKmDV9MQsFXodhRD/JMW7ZjMYbn
	CaG/ZV6dS0aklfVoaEqryVmklO92rQc8yrJ/TjbpnbOSPiKfIenYJqPXHnCeWfq7Pp6C
	PBZ+6eYKksNyQfn0X1OnzWJ8cUWTF87sOWdjMHAMuCITzw6QuYxYMGHxA9Aoqe6UxOvB
	R3gqUis6R/iZCW58vhndj6NwfUPISLkFWf02Iim3XaOUjhP+15ztdgeKrxZ4KQqrwalu
	yolC56v5jPOr8uzLbq+M1lmX3eKxnW5PQ0s878jqBNyBUcdsuUsAbFrPMTl1hAzrc1fu
	HlCA==
X-Received: by 10.68.218.196 with SMTP id pi4mr29786381pbc.124.1423493116885; 
	Mon, 09 Feb 2015 06:45:16 -0800 (PST)
Received: from [172.16.26.45] ([210.177.145.245])
	by mx.google.com with ESMTPSA id
	se7sm16534291pbc.84.2015.02.09.06.45.15
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 09 Feb 2015 06:45:16 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1423066153-24933-2-git-send-email-danismostlikely@gmail.com>
Date: Mon, 9 Feb 2015 22:45:12 +0800
Message-Id: <261885A7-4D9E-4E55-97A8-38D029C5AEA5@gmail.com>
References: <1423066153-24933-1-git-send-email-danismostlikely@gmail.com>
	<1423066153-24933-2-git-send-email-danismostlikely@gmail.com>
To: Dan McGregor <danismostlikely@gmail.com>
X-Mailer: Apple Mail (2.2070.6)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] openssh: Fix non-deterministic build behaviour
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
X-List-Received-Date: Mon, 09 Feb 2015 14:45:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Feb 5, 2015, at 12:09 AM, Dan McGregor <danismostlikely@gmail.com> =
wrote:
>=20
> From: Dan McGregor <dan.mcgregor@usask.ca>
>=20
> If maillock.h is found, a dependency on liblockfile will be created.
> liblockfile is in meta-oe, so we don't want that in an oe-core recipe.
>=20
> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> ---
> meta/recipes-connectivity/openssh/openssh_6.7p1.bb | 3 +++
> 1 file changed, 3 insertions(+)
>=20
> diff --git a/meta/recipes-connectivity/openssh/openssh_6.7p1.bb =
b/meta/recipes-connectivity/openssh/openssh_6.7p1.bb
> index dcbc181..a272629 100644
> --- a/meta/recipes-connectivity/openssh/openssh_6.7p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_6.7p1.bb
> @@ -62,6 +62,9 @@ CACHED_CONFIGUREVARS +=3D =
"ac_cv_header_bsd_libutil_h=3Dno ac_cv_header_libutil_h=3Dno
> # passwd path is hardcoded in sshd
> CACHED_CONFIGUREVARS +=3D =
"ac_cv_path_PATH_PASSWD_PROG=3D${bindir}/passwd"
>=20
> +# We don't want to depend on libblockfile
> +CACHED_CONFIGUREVARS +=3D "ac_cv_header_maillock_h=3Dno=E2=80=9D

while this is improvement. It would be nice if it was turning into a =
PACKAGECONFIG.

> +

> # This is a workaround for uclibc because including stdio.h
> # pulls in pthreads.h and causes conflicts in function prototypes.
> # This results in compilation failure, so unless this is fixed,
> --=20
> 2.1.0
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


