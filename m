Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8C1A26FF76
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jun 2014 07:46:10 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s5H7jsFg009445; Tue, 17 Jun 2014 08:45:55 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id mhYJFE1gScyX; Tue, 17 Jun 2014 08:45:54 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s5H7jn3E009421
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 17 Jun 2014 08:45:51 +0100
Message-ID: <1402991144.562.83.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hongxu Jia <hongxu.jia@windriver.com>
Date: Tue, 17 Jun 2014 08:45:44 +0100
In-Reply-To: <5eefad6f95c56a863ec21422837f03899ea8931d.1402901435.git.hongxu.jia@windriver.com>
References: <cover.1402901435.git.hongxu.jia@windriver.com>
	<5eefad6f95c56a863ec21422837f03899ea8931d.1402901435.git.hongxu.jia@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: saul.wold@intel.com, kang.kai@windriver.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] ghostscript: upgrade to 9.14
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
X-List-Received-Date: Tue, 17 Jun 2014 07:46:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-06-16 at 16:16 +0800, Hongxu Jia wrote:
> - The LICENSE added AGPL for the font files (in Resource/Font);
> 
> - Rebase ghostscript-9.02-parallel-make.patch to 9.14
> 
> - Rebase ghostscript-native-fix-disable-system-libtiff.patch
>   since base/configure.ac has been moved to configure.ac.
>   http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=f1488c5aff54f37ee67759827d4298592af5dbc8
> 
> - Obsolete ghostscript-9.05-NOT-check-endian.patch, and add option
>   '--enable-little-endian'/'--enable-big-endian' conditionally to
>   intead.
>   http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=e76dc46756e89a14a3348bce12a633d32e4fa831
> 
> - Add base-genht.c-add-a-preprocessor-define-to-allow-fope.patch
>   for native, since the upstream replace all fopen calls with
>   gp_fopen and add a preprocessor define so that any unintential
>   calls directly to fopen will cause an error. This patch add a
>   preprocessor define to allow fopen calling in base/genht.c as
>   exceptions.
>   http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=773c69e46e70bdd5482676437dafd2ca83397643
> 
> - Remove package ghostscript-cups, since CUPS filters
>   gstoraster and gstopxl has been moved to cups-filters
>   which is a free software package hosted by OpenPrinting.
>   http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=9304a21699a6c17579fae32f44f5c92a37c13e2d
>   http://www.linuxfoundation.org/collaborate/workgroups/openprinting/cups-filters
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  ...c-add-a-preprocessor-define-to-allow-fope.patch |  36 ++++++
>  .../ghostscript-9.02-parallel-make.patch           | 144 ++++++++++-----------
>  .../ghostscript-9.05-NOT-check-endian.patch        |  44 -------
>  ...tscript-native-fix-disable-system-libtiff.patch |  45 +++----
>  .../{ghostscript_9.07.bb => ghostscript_9.14.bb}   |  42 ++----
>  5 files changed, 132 insertions(+), 179 deletions(-)
>  create mode 100644 meta/recipes-extended/ghostscript/ghostscript/base-genht.c-add-a-preprocessor-define-to-allow-fope.patch
>  delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.05-NOT-check-endian.patch
>  rename meta/recipes-extended/ghostscript/{ghostscript_9.07.bb => ghostscript_9.14.bb} (70%)

This triggered a build failure:

https://autobuilder.yoctoproject.org/main/builders/nightly-mips-lsb/builds/134/steps/BuildImages/logs/stdio

Cheers,

Richard


