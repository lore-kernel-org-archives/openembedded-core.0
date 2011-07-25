Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QlMKI-0002zg-5m
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 16:40:10 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QlMGG-0000sK-2c
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 16:36:00 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 25 Jul 2011 15:35:58 +0100
In-Reply-To: <bd2e16888f6520e2d02d3ff6c43b360d217572e4.1311601422.git.richard.purdie@linuxfoundation.org>
References: <cover.1311601422.git.richard.purdie@linuxfoundation.org>
	<bd2e16888f6520e2d02d3ff6c43b360d217572e4.1311601422.git.richard.purdie@linuxfoundation.org>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311604560.30326.234.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 1/5] multilib_header.bbclass: Add oe_multilib_header wrapper
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
X-List-Received-Date: Mon, 25 Jul 2011 14:40:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-07-25 at 14:47 +0100, Richard Purdie wrote:
> +oe_multilib_header() {
> +	for each_header in "$@" ; do
> +	   if [ ! -f "${D}/${includedir}/$each_header" ]; then
> +	      bberror "oe_multilib_header: Unable to find header $each_header."
> +	      continue
> +	   fi
> +	   stem=$(echo $each_header | sed 's#\.h$##')
> +	   mv ${D}/${includedir}/$each_header ${D}/${includedir}/${stem}-${SITEINFO_BITS}.h
> +
> +	   sed -e "s#ENTER_HEADER_FILENAME_HERE#${stem}#g" ${COREBASE}/scripts/multilib_header_wrapper.h > ${D}/${includedir}/$each_header
> +	done
> +}

I guess it would also be nice if this was conditionalized in some way so
that it only triggered if one was trying to do a multilib build (or, at
least, had a TARGET_ARCH which supported multiple different wordsizes).
I don't especially want to have all the headers on, say, arm wrapped in
wordsize conditionals since the word size is basically invariant there.

po.




