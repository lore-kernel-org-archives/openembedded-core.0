Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QMHzB-0000HF-Nq
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 12:58:46 +0200
Received: by wwb17 with SMTP id 17so349106wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 03:55:52 -0700 (PDT)
Received: by 10.227.131.31 with SMTP id v31mr504034wbs.19.1305629751999;
	Tue, 17 May 2011 03:55:51 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id bi13sm252779wbb.25.2011.05.17.03.55.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 May 2011 03:55:51 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1305626898.3424.223.camel@rex>
Date: Tue, 17 May 2011 12:55:48 +0200
Message-Id: <C5F8CD4D-94B2-4A39-94AA-BA094957A6CA@dominion.thruhere.net>
References: <1305626898.3424.223.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [RFC PATCH] distro/defaultsetup.conf: Append TCLIBC to TMPDIR by default
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
X-List-Received-Date: Tue, 17 May 2011 10:58:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 17 mei 2011, om 12:08 heeft Richard Purdie het volgende geschreven:

> The current solutions to share uclibc, eglibc and glibc builds in the
> same tree all have various issues associated with them. Appending the
> suffix to TMPDIR seems like the best solution since sstate (which
> defaults to outside TMPDIR) will allow reuse of any components.
>=20
> This avoids messy changes to the core with other approaches to this
> problem inevitably entail, usually in code where this abstraction =
isn;'t
> logically best placed.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> diff --git a/meta/conf/distro/defaultsetup.conf =
b/meta/conf/distro/defaultsetup.conf
> index 8da6c0a..e7636b4 100644
> --- a/meta/conf/distro/defaultsetup.conf
> +++ b/meta/conf/distro/defaultsetup.conf
> @@ -14,6 +14,10 @@ require conf/distro/include/tcmode-${TCMODE}.inc
> TCLIBC ?=3D "eglibc"
> require conf/distro/include/tclibc-${TCLIBC}.inc
>=20
> +# Allow single libc distros to disable this code
> +TCLIBCAPPEND ?=3D "-${TCLIBC}"
> +TMPDIR_append =3D "${TCLIBCAPPEND}"
> +
> CACHE =3D "${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@['', '/' + =
str(bb.data.getVar('MACHINE', d, 1))][bool(bb.data.getVar('MACHINE', d, =
1))

The line above has whitespace damage, I rediffed it and sent it to this =
list so people don't have to manually fix the patch=


