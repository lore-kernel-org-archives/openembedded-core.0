Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 274F36FCDD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jun 2014 13:26:35 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id r20so2846879wiv.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jun 2014 06:26:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=gQQisN0iKcIuSrECxs3BPO4TNYih9q86f3ZN5bXTcDI=;
	b=YqKPePHbRS7qQIY8fefQjryDDxrvTHIcEYCqP1JmwLgbuDZYlEcP+atILaMz68Oj7I
	Hp59PJ3HYphx8gUiXmvoyipJoNCE76Ct6Hojkhu7APNMbY2g7r0G4U8/PcsuZTmxB6aK
	9eSaJdEsgYquYeaTtx7hiskZ/9k0IDeoKk+A2VKJ2uYeNGGBWUsAB+0oAT1M4wSSYq/r
	24sj+DvwoxQKw4lMnChjV6VFF/cheKATjz8HWn4IW5IJO6Vjq2+KActyfJMgAgTPVCOK
	xrF3be1wD8CR4uh85dWK6l6Dmw9GvlDuh6+0tgzJaUqjJSZsb7TjUqc2pphKuVnRDpeH
	kiAg==
X-Gm-Message-State: ALoCoQkZeOZ/x9YJUPhhL/4QYOrVc1H4Shlf641Hbv2+zpuHiiYaKRWKLX/BLyvcVzN+pjtBLpho
X-Received: by 10.194.142.205 with SMTP id ry13mr4787061wjb.69.1403184395297; 
	Thu, 19 Jun 2014 06:26:35 -0700 (PDT)
Received: from ?IPv6:2001:610:612::4147:f49d:8cb6:6e25?
	([2001:610:612:0:4147:f49d:8cb6:6e25])
	by mx.google.com with ESMTPSA id fb7sm4170026wib.15.2014.06.19.06.26.33
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 19 Jun 2014 06:26:34 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1403131683-28758-1-git-send-email-paul.gortmaker@windriver.com>
Date: Thu, 19 Jun 2014 15:26:30 +0200
Message-Id: <7909347D-FFDD-4F4D-B08A-79E0AD69F4F8@dominion.thruhere.net>
References: <1403131683-28758-1-git-send-email-paul.gortmaker@windriver.com>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
X-Mailer: Apple Mail (2.1874)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] perl: strip RPATH from libxml-parser-perl Expat.so
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
X-List-Received-Date: Thu, 19 Jun 2014 13:26:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 19 jun. 2014, om 00:48 heeft Paul Gortmaker =
<paul.gortmaker@windriver.com> het volgende geschreven:

> To fix:
>=20
> ERROR: QA Issue: package libxml-parser-perl contains bad RPATH =
/home/paul/poky/build/tmp/sysroots/intel-corei7-64/usr/lib64 in file =
/home/paul/poky/build/tmp/work/corei7-64-poky-linux/libxml-parser-perl/2.4=
1-r3/packages-split/libxml-parser-perl/usr/lib64/perl/vendor_perl/5.14.3/a=
uto/XML/Parser/Expat/Expat.so
> ERROR: QA run found fatal errors. Please consider fixing them.
> ERROR: Function failed: do_package_qa
> ERROR: Logfile of failure stored in: =
/home/paul/poky/build/tmp/work/corei7-64-poky-linux/libxml-parser-perl/2.4=
1-r3/temp/log.do_package.28544
> ERROR: Task 4102 =
(/home/paul/poky/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb, =
do_package) failed with exit code '1'
>=20
> ...which showed up when enabling a multilib build.
>=20
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
>=20
> diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb =
b/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb
> index 43a8a84518d3..2488aacb682c 100644
> --- a/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb
> +++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb
> @@ -27,6 +27,7 @@ do_configure_append() {
> do_compile() {
> 	export LIBC=3D"$(find ${STAGING_DIR_TARGET}/${base_libdir}/ =
-name 'libc-*.so')"
> 	cpan_do_compile
> +	chrpath -d ${S}/blib/arch/auto/XML/Parser/Expat/Expat.so

That only works for x86 builds.=

