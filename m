Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1SX9Dc-0000g8-6X
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 12:55:04 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 790EEF811FD; Wed, 23 May 2012 04:44:55 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=4.0 tests=ALL_TRUSTED,BAYES_00,
	FUZZY_AMBIEN autolearn=no version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id D5E64F811F7;
	Wed, 23 May 2012 04:44:54 -0600 (MDT)
Message-ID: <4FBCBFA6.8020307@mlbassoc.com>
Date: Wed, 23 May 2012 04:44:54 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1337731469.git.nitin.a.kamble@intel.com>
	<9fcc40151424883e9f660dfdd3a3eb52213701c1.1337731469.git.nitin.a.kamble@intel.com>
In-Reply-To: <9fcc40151424883e9f660dfdd3a3eb52213701c1.1337731469.git.nitin.a.kamble@intel.com>
Subject: Re: [PATCH 1/9] tar: fix build
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
X-List-Received-Date: Wed, 23 May 2012 10:55:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-05-22 18:05, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>
> Avoid this error:
> | rmdir: failed to remove `/srv/home/nitin/builds/build-gcc47/tmp/work/i586-poky-linux/tar-1.26-r1/image/usr/sbin/': No such file or directory
> NOTE: package tar-1.26-r1: task do_install: Failed
>
> no PR bump as no change in the output.
>
> Signed-off-by: Nitin A Kamble<nitin.a.kamble@intel.com>
> ---
>   meta/recipes-extended/tar/tar.inc |    8 ++++++--
>   1 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-extended/tar/tar.inc b/meta/recipes-extended/tar/tar.inc
> index 0533b82..5c2325a 100644
> --- a/meta/recipes-extended/tar/tar.inc
> +++ b/meta/recipes-extended/tar/tar.inc
> @@ -18,8 +18,12 @@ do_install () {
>   do_install_extra () {
>       install -d ${D}${base_bindir}
>       mv ${D}${bindir}/tar ${D}${base_bindir}/tar.${PN}
> -    rmdir ${D}${bindir}/
> -    rmdir ${D}${sbindir}/
> +    if [ -d ${D}${bindir}/ ] ; then
> +        rmdir ${D}${bindir}/
> +    fi
> +    if [ -d ${D}${sbindir}/ ] ; then
> +        rmdir ${D}${sbindir}/
> +    fi
>       mv ${D}${libexecdir}/rmt ${D}${libexecdir}/rmt.${PN}
>   }
>

Why not just use
   rm -fr ${D}${bindir}
etc?  No need for all the extra testing...

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


