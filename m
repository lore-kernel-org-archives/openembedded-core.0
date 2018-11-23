Return-Path: <matthias.schiffer@ew.tq-group.com>
Received: from mx1.tq-group.com (mx1.tq-group.com [62.157.118.193])
	by mail.openembedded.org (Postfix) with ESMTP id CDBCA6C8F3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 10:35:34 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.56,269,1539640800"; 
   d="scan'208";a="5241713"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
	by mx1-pgp.tq-group.com with ESMTP; 23 Nov 2018 11:35:34 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
	by tq-pgp-pr1.tq-net.de (PGP Universal service);
	Fri, 23 Nov 2018 11:35:34 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Fri, 23 Nov 2018 11:35:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
	t=1542969334; x=1574505334;
	h=message-id:subject:from:to:date:in-reply-to:references:
	mime-version:content-transfer-encoding;
	bh=t7frcwa2+8loo3lcLop++t3z3P764WIOYdLNZgiI0BA=;
	b=FTAUx1TiIjAtAh+fg9Ly3JD8Yp+fHU/ydtd+s5l1LgyWdrh+v2X1yJlB
	DS7PgGjSwMlYyuY/lKYOFpuhkOxZnWFMNeWlJLSp7VcqgDXkNXAL24vdx
	VSBVbCI6xLuRj9sJwQhL7ooHJvI+2n5H1OriFg0jLKCPOMXbgvS6Qt4Tx
	tGFQm9x0ami/GUXQfCkLRaEaIwyqFaqIRzm1DyT3uaxFeLARMFWic5Okp
	r2dl1wnDEhYXzjOVFV08H3TBoRtT1C1zGeTJsCv2Gh3XocSI7u7I69RLE
	KMGDYHSey3vYaM26ZADdHQB0rL+pro3dEgJuN7lEiOU5sNaTj4nRWfWmJ Q==;
X-IronPort-AV: E=Sophos;i="5.56,269,1539640800"; 
   d="scan'208";a="5241712"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
	by mx1.tq-group.com with ESMTP; 23 Nov 2018 11:35:34 +0100
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de
	[10.117.49.26])
	by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 56704280073
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 11:35:34 +0100 (CET)
Message-ID: <ccdab7b0a102c6142348f3e37aa913132f02c044.camel@ew.tq-group.com>
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Nov 2018 11:35:32 +0100
In-Reply-To: <20181106085623.19811-1-matthias.schiffer@ew.tq-group.com>
References: <20181106085623.19811-1-matthias.schiffer@ew.tq-group.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Subject: Re: [PATCH v2] base.bbclass: avoid 'find -ignore_readdir_race -delete'
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
X-List-Received-Date: Fri, 23 Nov 2018 10:35:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-11-06 at 09:56 +0100, matthias.schiffer@ew.tq-group.com
wrote:
> From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> 
> Due to a bug in find [1], -ignore_readdir_race does not work
> correctly with
> -delete. This can lead to spurious build failures when files
> disappear
> while such a command is running; specifically this was seen in the
> case of
> do_configure and do_populate_lic running concurrently for packages
> with ${B} == ${WORKDIR}:
> 
>    find: '.../sstate-build-populate_lic': No such file or directory
> 
> While the issue is fixed in the findutils git master, the find
> command of
> the host system is called here, so we can't ensure that the used
> version
> contains the fix. Many common distros have not updated to a recent
> enough
> findutils version yet (Ubuntu 18.10 contains the fix, while 18.04 is
> still
> affected).
> 
> Work around the issue by passing the output of find to 'rm -f'
> instead of
> using -delete.
> 
> [1] https://savannah.gnu.org/bugs/?52981
> 
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> ---
> 
> It would be great if this patch could be backported to all versions
> back to
> Rocko, as our current setup is still based on Rocko.

Is there any chance we can get this backported?

Thanks,
Matthias


> 
> v2: add comment, extend commit message
> 
> 
>  meta/classes/base.bbclass | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index df11c8b270..9efb06de5f 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -303,7 +303,9 @@ base_do_configure() {
>  			if [ "${CLEANBROKEN}" != "1" -a \( -e Makefile
> -o -e makefile -o -e GNUmakefile \) ]; then
>  				oe_runmake clean
>  			fi
> -			find ${B} -ignore_readdir_race -name \*.la
> -delete
> +			# -ignore_readdir_race does not work correctly
> with -delete;
> +			# use xargs to avoid spurious build failures
> +			find ${B} -ignore_readdir_race -name \*.la
> -type f -print0 | xargs -0 rm -f
>  		fi
>  	fi
>  	if [ -n "${CONFIGURESTAMPFILE}" ]; then


