Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QuQEG-0004iC-W5 for openembedded-core@lists.openembedded.org;
	Fri, 19 Aug 2011 16:39:25 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7JEYjvB028370
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 15:34:45 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26909-06 for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 15:34:41 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7JEYcXE028364
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 15:34:40 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <51ef8335df895603e75345a18aaefe2359b2387f.1313700595.git.sgw@linux.intel.com>
References: <cover.1313700595.git.sgw@linux.intel.com>
	<51ef8335df895603e75345a18aaefe2359b2387f.1313700595.git.sgw@linux.intel.com>
Date: Fri, 19 Aug 2011 09:34:35 -0500
Message-ID: <1313764475.13995.106.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 03/32] qt4: allow a reduction in build time
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
X-List-Received-Date: Fri, 19 Aug 2011 14:39:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-08-18 at 13:55 -0700, Saul Wold wrote:
> From: Anders Darander <anders@chargestorm.se>
> 
> When reducing build time by adding QT_DISTRO_FLAGS from the set '-no-gui -nomake tools
> -nomake examples -nomake demos -nomake docs', build failure can occur, due to not building
> all tools.
> 
> * Make rm not error out when removing one of the, possibly, non-existing tools.
> * Only try to rename qtdemo, if qtdemo exists.
> * Check if the phrasebook path exists, and only then call do_split_packages()
> 
> Signed-off-by: Anders Darander <anders@chargestorm.se>
> ---
>  meta/recipes-qt/qt4/qt4.inc |   13 +++++++------
>  1 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
> index 0410a92..5545be7 100644
> --- a/meta/recipes-qt/qt4/qt4.inc
> +++ b/meta/recipes-qt/qt4/qt4.inc
> @@ -227,10 +227,11 @@ python populate_packages_prepend() {
>   
>          phrasebook_dir = bb.data.expand('${datadir}/${QT_DIR_NAME}/phrasebooks/', d)
>          phrasebook_name = bb.data.expand('${QT_BASE_NAME}-phrasebook-%s', d)
> -        do_split_packages(d, phrasebook_dir, '^(.*)\.qph$', phrasebook_name, '${PN} phrasebook for %s', extra_depends='' )
> +        import os;
> +        if os.path.exists(phrasebook_dir):
> +                do_split_packages(d, phrasebook_dir, '^(.*)\.qph$', phrasebook_name, '${PN} phrasebook for %s', extra_depends='' )
>   
>          # Package all the plugins and their -dbg version and create a meta package
> -        import os

For reference, BitBake assumes that both os and bb are always imported
so we can likely drop all "import os" references. I'll take this patch
since its harmless but I did just grep the classes directory and it
looks like we can clean up those imports a little.

Cheers,

Richard



