Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 985CC6BAB2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 17:32:25 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id kl13so3670863pab.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 10:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=gBcZp/89H8E+Mf1HqzZn3dXzudg55b2H0uTCIZot4ig=;
	b=KNeok937AHgUPVSTkGGhqG+R8atHMZ/B5xOOOD93cy24JEaKjioNqJlaF+oiOViCZp
	0qmG/pUbMhHGpLMsPQ3mO3fKkgO8/Tq+1XQSdMBuHsTBB34DGTJi3aKH+j9vIANVU5Lb
	85t7LUdJvaSSRIsNTxf5rK//EjHvETxPrjm3WcVqgzO8NbBofX7sac/9G+ENBtvu22Z+
	KqCDVR9fRSZ0eshUDHaKMYOgDsF4AfysK7ArAIPfSefttSuLZnnzuH3mlCGgidLqvHAq
	eLbsMWppJpAMajjeSe5ypBsAJFsfIHLdPRzSB8V7zuXr3otrZLcz9grVw9omL/t13nxa
	QEhw==
X-Received: by 10.66.225.239 with SMTP id rn15mr3822228pac.179.1377538346667; 
	Mon, 26 Aug 2013 10:32:26 -0700 (PDT)
Received: from edchang-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	ib9sm19211151pbc.43.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 26 Aug 2013 10:32:25 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1377510661-14290-1-git-send-email-riku.voipio@linaro.org>
Date: Mon, 26 Aug 2013 10:32:39 -0700
Message-Id: <8A6F622D-40C7-4598-91BE-B4E62F2EA6D3@gmail.com>
References: <1377510661-14290-1-git-send-email-riku.voipio@linaro.org>
To: Riku Voipio <riku.voipio@linaro.org>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] eglibc: fix directory cleanup for 2.17
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
X-List-Received-Date: Mon, 26 Aug 2013 17:32:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 26, 2013, at 2:51 AM, Riku Voipio <riku.voipio@linaro.org> wrote:

> Commit e0c2dd275827a4b37b8116d0f0119333638461af broke building
> eglibc 2.17, which still ships pt_chown under eglibc/ directory.
>=20
> Fix by only deleting directory when pt_chown is not there.
>=20
> Cc: Khem Raj <raj.khem@gmail.com>
> ---
> meta/recipes-core/eglibc/eglibc-package.inc | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/eglibc/eglibc-package.inc =
b/meta/recipes-core/eglibc/eglibc-package.inc
> index c36d16c..3adf1a9 100644
> --- a/meta/recipes-core/eglibc/eglibc-package.inc
> +++ b/meta/recipes-core/eglibc/eglibc-package.inc
> @@ -75,7 +75,7 @@ do_install_append () {
> 	rm -rf ${D}${localstatedir}
>=20
> 	# remove empty eglibc dir
> -	if [ -d ${D}${libdir}/eglibc ]; then
> +	if [ -d ${D}${libdir}/eglibc -a ! -e =
${D}${libdir}/eglibc/pt_chown ]; then


I think its better to use  --ignore-fail-on-non-empty option to rmdir

> 		rmdir ${D}${libdir}/eglibc
> 	fi
> 	oe_multilib_header bits/syscall.h
> --=20
> 1.8.3.1
>=20


