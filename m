Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 73D7965CB6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 19:26:24 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Jun 2016 12:26:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,472,1459839600"; d="scan'208";a="997605665"
Received: from besquive-mobl2.zpn.intel.com ([10.219.128.114])
	by orsmga002.jf.intel.com with ESMTP; 14 Jun 2016 12:26:25 -0700
Message-ID: <1465932421.19191.17.camel@linux.intel.com>
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
Reply-To: benjamin.esquivel@linux.intel.com
To: leonardo.sandoval.gonzalez@linux.intel.com, 
	openembedded-core@lists.openembedded.org
In-Reply-To: <1465855362-25759-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
References: <1465855362-25759-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
Organization: Intel Corporation
Date: Tue, 14 Jun 2016 14:27:01 -0500
Mime-Version: 1.0
X-Mailer: Evolution 3.18.5.2 (3.18.5.2-1.fc23) 
Subject: Re: [PATCH] flex: Fix top_builddir path for flex's test-driver script
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
X-List-Received-Date: Tue, 14 Jun 2016 19:26:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

ACK'ed.

I verified that your patch works.

On Mon, 2016-06-13 at 17:02 -0500,
leonardo.sandoval.gonzalez@linux.intel.com wrote:
> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> 
> Since 5f82d17ac63f6d5b55f7b8d019c239620ab54596, test-driver scripts
> look into top_buildir path, so fix this path on flex's
> tests/Makefile.
> 
> [YOCTO #9721]
> 
> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.in
> tel.com>
> ---
>  meta/recipes-devtools/flex/flex_2.6.0.bb | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/flex/flex_2.6.0.bb b/meta/recipes-
> devtools/flex/flex_2.6.0.bb
> index 8285426..f6d136c 100644
> --- a/meta/recipes-devtools/flex/flex_2.6.0.bb
> +++ b/meta/recipes-devtools/flex/flex_2.6.0.bb
> @@ -51,5 +51,8 @@ do_install_ptest() {
>  	cp ${S}/build-aux/test-driver ${D}${PTEST_PATH}/build-aux/
>  	cp -r ${S}/tests/* ${D}${PTEST_PATH}
>  	cp -r ${B}/tests/* ${D}${PTEST_PATH}
> -	sed -e 's/^Makefile:/_Makefile:/' -e 's/^srcdir =
> \(.*\)/srcdir = ./' -e 's/^top_srcdir = \(.*\)/top_srcdir = ./'  -i
> ${D}${PTEST_PATH}/Makefile
> +	sed -e 's/^Makefile:/_Makefile:/' \
> +	    -e 's/^srcdir = \(.*\)/srcdir = ./' -e 's/^top_srcdir =
> \(.*\)/top_srcdir = ./' \
> +	    -e 's/^builddir = \(.*\)/builddir = ./' -e
> 's/^top_builddir = \(.*\)/top_builddir = ./' \
> +	    -i ${D}${PTEST_PATH}/Makefile
>  }
> -- 
> 2.1.4
> 

