Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0D35665DA3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Oct 2014 08:53:13 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id l18so5518696wgh.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Oct 2014 01:53:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=JmccKRnis5+SkJmAGTdC4W7ehs4Wo2I4ELTGMJAdnRY=;
	b=kfVhIJCtYuZTVSQ79uzSYpeNFfnQYqBhh0r1bTMR0DZVe7vwFPUWv5f9zwLTucC6Dt
	x2bFqWpIbxB3eAkaovuUozbMAQQkZGGAaJgE/guNVcY0BPPaDl44oDybv+xp6yp65vcy
	x8f9yBGteBsU4oq3VthY311xGqlk/RBbEzxRC3oyiyz5uMD6M2MZgjMafe9jkehNXeFW
	FFSqkB9eJdq2FkLrx8D9hOsSGdSStE8fDSN33cT/CevJN/CsEXrtIUfPFjqACG6znl9G
	kbo2UoC8MS2Xicrs9qrrHXrMv8yPxa1uru6jWX/HjJ5CjvqGznVa9CL3jcDARYpp7OUF
	dPRA==
X-Gm-Message-State: ALoCoQmcXQ1ItbBPm8xV4e8o/3GzXegsHd/NYIGhu6KEUp9QoOfkBV0Fy7raa5pLlqFwS+WWD8OP
X-Received: by 10.180.20.10 with SMTP id j10mr8553755wie.50.1413017594174;
	Sat, 11 Oct 2014 01:53:14 -0700 (PDT)
Received: from ?IPv6:2001:610:612::f482:85ad:d99c:b0b2?
	([2001:610:612:0:f482:85ad:d99c:b0b2])
	by mx.google.com with ESMTPSA id l10sm5048715wif.20.2014.10.11.01.53.12
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 11 Oct 2014 01:53:13 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1412965751-9778-1-git-send-email-alejandro.hernandez@linux.intel.com>
Date: Sat, 11 Oct 2014 10:53:47 +0200
Message-Id: <C750F69E-0F69-46A9-B81F-6C14AC8639E4@dominion.thruhere.net>
References: <1412965751-9778-1-git-send-email-alejandro.hernandez@linux.intel.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
X-Mailer: Apple Mail (2.1878.6)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] buildinfo: Added buildinfo recipe
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
X-List-Received-Date: Sat, 11 Oct 2014 08:53:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 10 okt. 2014, om 20:29 heeft Alejandro Hernandez =
<alejandro.hernandez@linux.intel.com> het volgende geschreven:

> Writes build information to target filesystem to help developers
>=20
> [YOCTO #6770]
>=20
> Signed-off-by: Alejandro Hernandez =
<alejandro.hernandez@linux.intel.com>
> ---
> meta/recipes-extended/buildinfo/buildinfo_0.1.bb | 34 =
++++++++++++++++++++++++
> 1 file changed, 34 insertions(+)
> create mode 100644 meta/recipes-extended/buildinfo/buildinfo_0.1.bb
>=20
> diff --git a/meta/recipes-extended/buildinfo/buildinfo_0.1.bb =
b/meta/recipes-extended/buildinfo/buildinfo_0.1.bb
> new file mode 100644
> index 0000000..b299efb
> --- /dev/null
> +++ b/meta/recipes-extended/buildinfo/buildinfo_0.1.bb
> @@ -0,0 +1,34 @@
> +DESCRIPTION =3D "Writing build information on target filesystem"
> +SECTION =3D "MISC"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D =
"file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0bcf8506ecda2f7b4f302"
> +PR =3D "r0"

PR isn't used anymore


> +
> +inherit buildhistory
> +
> +def buildinfo_target(d):
> +        # Get context
> +        if d.getVar('BB_WORKERCONTEXT', True) !=3D '1':
> +                return ""
> +        # Single and list variables to be read
> +        vars =3D "DISTRO DISTRO_VERSION BB_VERSION BUILD_SYS =
TARGET_SYS MACHINE USER_CLASSES IMAGE_CLASSES IMAGE_FEATURES =
IMAGE_LINGUAS IMAGE_INSTALL PACKAGE_EXCLUDE"
> +        listvars =3D "USER_CLASSES IMAGE_CLASSES IMAGE_FEATURES =
IMAGE_LINGUAS IMAGE_INSTALL PACKAGE_EXCLUDE"

Don't use IMAGE* vars in package recipes, that breaks the orthogonality =
of the OE system.=

