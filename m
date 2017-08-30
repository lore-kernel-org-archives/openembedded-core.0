Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 27ACE77ECB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 21:36:41 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7ULab2Z018330
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 30 Aug 2017 22:36:40 +0100
Message-ID: <1504128997.2175.38.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Armin Kuster
	<akuster808@gmail.com>, openembedded-core@lists.openembedded.org
Date: Wed, 30 Aug 2017 22:36:37 +0100
In-Reply-To: <34d28d52f32fd1866e3570fcd07f6d1a73be1774.1504041417.git.pkj@axis.com>
References: <cover.1504041416.git.pkj@axis.com>
	<34d28d52f32fd1866e3570fcd07f6d1a73be1774.1504041417.git.pkj@axis.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Wed, 30 Aug 2017 22:36:40 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [pyro][PATCH 19/25] texinfo: Avoid a problem with a dependency on perl(Locale::gettext_xs)
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
X-List-Received-Date: Wed, 30 Aug 2017 21:36:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-08-29 at 23:21 +0200, Peter Kjellerstedt wrote:
> We do not build the Locale::gettext_xs Perl module and the code will
> test for it and happily use Locale::gettext_pp instead if it is not
> found. However, this still causes a file dependency on
> perl(Locale::gettext_xs) to be generated, which must be satisfied by
> adding an explicit provide for it.
> 
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-extended/texinfo/texinfo_6.3.bb | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/meta/recipes-extended/texinfo/texinfo_6.3.bb
> b/meta/recipes-extended/texinfo/texinfo_6.3.bb
> index d82731e11e..f58df928aa 100644
> --- a/meta/recipes-extended/texinfo/texinfo_6.3.bb
> +++ b/meta/recipes-extended/texinfo/texinfo_6.3.bb
> @@ -79,4 +79,10 @@ FILES_${PN}-doc = "${infodir}/texinfo* \
>                     ${datadir}/${tex_texinfo} \
>                     ${mandir}/man1 ${mandir}/man5"
>  
> +# Lie about providing the Locale::gettext_xs module. It is not
> actually built,
> +# but the code will test for it and if not found use
> Locale::gettext_pp instead.
> +# However, this causes a file dependency on perl(Locale::gettext_xs)
> to be
> +# generated, which must be satisfied.
> +RPROVIDES_${PN} += "perl(Locale::gettext_xs)"
> +
>  BBCLASSEXTEND = "native nativesdk"

Breaks in do_package_write_deb:

e.g.
https://autobuilder.yoctoproject.org/main/builders/nightly-arm64/builds/827

but also many other builds. Possibly missing some other backport?

Cheers,

Richard

