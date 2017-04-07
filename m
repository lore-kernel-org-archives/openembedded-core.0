Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 51E6F71C86
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 14:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491576057; x=1523112057;
	h=message-id:subject:from:to:cc:date:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=9xT0iP6TdfcLWzvIdL4RabIEEiZxOGJKipmHmKryvQM=;
	b=MuKZwL5lMASgf57xuadgrJ6PaRsZ+NPIc4+MWbv0kD4446maia7A1JLv
	8IkaGEd6NIef3SMqwtJsopn05tLHrQ==;
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Apr 2017 07:40:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,165,1488873600"; d="scan'208";a="843308305"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.141])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Apr 2017 07:40:55 -0700
Message-ID: <1491576559.31049.54.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 07 Apr 2017 09:49:19 -0500
In-Reply-To: <CAHiDW_EF2H0urVd7uV4vX9Wfma6LSOvP+nXVOtu2icJA=-M9vQ@mail.gmail.com>
References: <20170406164151.40269-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<CAHiDW_EF2H0urVd7uV4vX9Wfma6LSOvP+nXVOtu2icJA=-M9vQ@mail.gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] selftest/recipetool: skip create_git in case x11 feature is not present
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
X-List-Received-Date: Fri, 07 Apr 2017 14:40:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-04-07 at 08:57 +0300, Jussi Kukkonen wrote:
> 
> 
> On 6 April 2017 at 19:41, <leonardo.sandoval.gonzalez@linux.intel.com>
> wrote:
>         From: Leonardo Sandoval
>         <leonardo.sandoval.gonzalez@linux.intel.com>
>         
>         The unit test requires x11 as distro feature, otherwise it
>         will fail
>         while building the test requirements.
> 
> 
> How about changing the test recipe to something non-x11 instead?
>  

Yes, but at this point of the release, I do not think it is a good idea.
There was another case on the devtool's selftest where the target was
quite complex for a poky-tiny distro, but again, it requires time to
redo the test and this is not the perfect time frame.

>         
>         [YOCTO #10903]
>         
>         Signed-off-by: Leonardo Sandoval
>         <leonardo.sandoval.gonzalez@linux.intel.com>
>         ---
>          meta/lib/oeqa/selftest/recipetool.py | 2 ++
>          1 file changed, 2 insertions(+)
>         
>         diff --git a/meta/lib/oeqa/selftest/recipetool.py
>         b/meta/lib/oeqa/selftest/recipetool.py
>         index d47b9dd..7bfb02f 100644
>         --- a/meta/lib/oeqa/selftest/recipetool.py
>         +++ b/meta/lib/oeqa/selftest/recipetool.py
>         @@ -382,6 +382,8 @@ class RecipetoolTests(RecipetoolBase):
>         
>              @testcase(1194)
>              def test_recipetool_create_git(self):
>         +        if 'x11' not in get_bb_var('DISTRO_FEATURES'):
>         +            self.skipTest('Test requires x11 as distro
>         feature')
>                  # Ensure we have the right data in shlibs/pkgdata
>                  bitbake('libpng pango libx11 libxext jpeg libcheck')
>                  # Try adding a recipe
>         --
>         2.10.2
>         
>         --
>         _______________________________________________
>         Openembedded-core mailing list
>         Openembedded-core@lists.openembedded.org
>         http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> 



