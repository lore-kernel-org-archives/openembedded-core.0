Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Qh5Nn-0003Iu-1n
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 21:46:07 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6DJg7Db004590
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2011 12:42:07 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 13 Jul 2011 12:42:06 -0700
Message-ID: <4E1DF50E.7080305@windriver.com>
Date: Wed, 13 Jul 2011 14:42:06 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1310583666.git.tom_rini@mentor.com>
In-Reply-To: <cover.1310583666.git.tom_rini@mentor.com>
Subject: Re: [PATCH 0/3] siteinfo.bbclass re-merge
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
X-List-Received-Date: Wed, 13 Jul 2011 19:46:07 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 7/13/11 2:05 PM, Tom Rini wrote:
> Hey all,
> 
> This is the second of two pull requests.  This doesn't depend on the first
> request, it's just splitting changes up.  There's three changes here.  First,
> site/ix86-common was setting the wrong value for unsigned int.  Second,
> change perl to use SITEINFO variables rather than functions.  Third, bring
> in the various changes in siteinfo.bbclass that have been in oe.dev.  This
> last part will, I hope, also make dealing with multilib-specific siteinfo
> stuff easier (also alternative ABIs like x32).

Note, this is NOT an objection to the changes.  However, one thing to keep in mind.

(In fact I like the changes being suggested)

We have a dynamic site-configuation mechanism already in place.  So it's
important that we don't duplicate things within the site/* files.

Currently the recipes: glibc, zlib, eglibc, and uclibc contain dynamic
site_config files.  (See ./recipes-core/glibc/site_config/* for an example)

The output of these files get placed into a target arch specific site config
directory: ${STAGING_DATADIR}/${TARGET_SYS}_config_site.d

These are automatically loaded as well as the predefined "common" items.  By
using the dynamically generated versions we can change the configuration options
for glibc, uclibc, etc and the site config will automatically get updated based
on the existing checks.

So instead of updating the various site/* files, if the value can be discovered
-- or is defined by a given package.. we should be using the dynamic method as
it'll be safer over the long-haul.  Someone might need to go over the existing
ones and see if there is anything that falls under this.

BTW, I did notice that ncurses is supposed to have a dynamic site_config, but it
somehow got checked into the wrong location.  I'll submit a pull request for
that shortly.

--Mark

> My next step is to work on merging and verifying as much as possible
> the site files in oe-core and oe.dev.
> 
> The following changes since commit e66c2999afa2b3efbce8bb46c89f9db5e15f35c7:
>   Saul Wold (1):
>         libx11: ensure nativesdk uses correct DEPENDS and XCB flags
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib trini/update-siteinfo
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=trini/update-siteinfo
> 
> Tom Rini (3):
>   site/ix86-common: Fix ac_cv_sizeof_unsigned_char definition
>   perl: Use SITEINFO variables not functions
>   siteinfo.bbclass: Port over oe.dev logic for site files
> 
>  meta/classes/autotools.bbclass             |    2 +-
>  meta/classes/siteinfo.bbclass              |  202 +++++++++++++---------------
>  meta/classes/toolchain-scripts.bbclass     |    2 +-
>  meta/recipes-core/meta/meta-environment.bb |    2 +-
>  meta/recipes-core/meta/meta-toolchain.bb   |    2 +-
>  meta/recipes-devtools/perl/perl_5.12.3.bb  |    4 +-
>  meta/site/ix86-common                      |    2 +-
>  7 files changed, 103 insertions(+), 113 deletions(-)
>  create mode 100644 meta/site/common-linux
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



