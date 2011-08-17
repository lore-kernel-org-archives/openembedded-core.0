Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qtgrl-00050P-Dw for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 16:13:12 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7HE8Wen007654
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2011 15:08:32 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06235-08 for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2011 15:08:28 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7HE8N73007648
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2011 15:08:26 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <0723e2f710db1680c71a1f6f848563cfcc6b3cdc.1313503017.git.anders@chargestorm.se>
References: <cover.1313503017.git.anders@chargestorm.se>
	<0723e2f710db1680c71a1f6f848563cfcc6b3cdc.1313503017.git.anders@chargestorm.se>
Date: Wed, 17 Aug 2011 15:08:15 +0100
Message-ID: <1313590095.13995.38.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/5] qt4: allow a reduction in build time
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
X-List-Received-Date: Wed, 17 Aug 2011 14:13:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-08-16 at 15:57 +0200, Anders Darander wrote:
> When reducing build time by adding QT_DISTRO_FLAGS from the set '-no-gui -nomake tools
> -nomake examples -nomake demos -nomake docs', build failure can occur, due to not building
> all tools.
> 
> * Make rm not error out when removing one of the, possibly, non-existing tools.
> * Only try to rename qtdemo, if qtdemo exists.
> * Guard do_split_packages() with an try-except-clause, otherwise we get an error stating
>   that .../phrasebooks/... do not exist.
> 
> Signed-off-by: Anders Darander <anders@chargestorm.se>
> ---
>  meta/recipes-qt/qt4/qt4.inc |   13 ++++++++-----
>  1 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
> index 0410a92..994ec12 100644
> --- a/meta/recipes-qt/qt4/qt4.inc
> +++ b/meta/recipes-qt/qt4/qt4.inc
> @@ -227,7 +227,10 @@ python populate_packages_prepend() {
>   
>          phrasebook_dir = bb.data.expand('${datadir}/${QT_DIR_NAME}/phrasebooks/', d)
>          phrasebook_name = bb.data.expand('${QT_BASE_NAME}-phrasebook-%s', d)
> -        do_split_packages(d, phrasebook_dir, '^(.*)\.qph$', phrasebook_name, '${PN} phrasebook for %s', extra_depends='' )
> +        try:
> +                do_split_packages(d, phrasebook_dir, '^(.*)\.qph$', phrasebook_name, '${PN} phrasebook for %s', extra_depends='' )
> +        except:
> +                pass

Please use some actual test here, not a general try/except/pass. This
reason is that is some failure we want to know about happens, this will
hide it as the code stands.

The rest of the patch is ok, this just needs tweaking.

Cheers,

Richard




