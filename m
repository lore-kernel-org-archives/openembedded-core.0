Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id C8AA56D151
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 14:59:36 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1VXBWb-0003JT-99; Fri, 18 Oct 2013 16:59:37 +0200
Message-ID: <1382108376.529.6.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Ming Liu <ming.liu@windriver.com>
Date: Fri, 18 Oct 2013 15:59:36 +0100
In-Reply-To: <1382094700-17805-3-git-send-email-ming.liu@windriver.com>
References: <1382094700-17805-1-git-send-email-ming.liu@windriver.com>
	<1382094700-17805-3-git-send-email-ming.liu@windriver.com>
X-Mailer: Evolution 3.4.4-4+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 3/3] bash: add pkg_postrm to remove the entry in /etc/shells
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
X-List-Received-Date: Fri, 18 Oct 2013 14:59:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-10-18 at 19:11 +0800, Ming Liu wrote:
>  pkg_postinst_${PN} () {
> -	touch $D${sysconfdir}/shells
> -	grep -q "bin/bash" $D${sysconfdir}/shells || echo /bin/bash >> $D${sysconfdir}/shells
> -	grep -q "bin/sh" $D${sysconfdir}/shells || echo /bin/sh >> $D${sysconfdir}/shells
> +	if [ ! -f $D${sysconfdir}/shells ]; then
> +		touch $D${sysconfdir}/shells
> +	fi
> +
> +	grep -q "^${base_bindir}/bash$" $D${sysconfdir}/shells || echo ${base_bindir}/bash >> $D${sysconfdir}/shells
> +}

This patch contains significant changes to the postinst script which
aren't described in the commit message.

p.

> +
> +pkg_postrm_${PN} () {
> +	if [ -f $D${sysconfdir}/shells ]; then
> +		printf "$(grep -v "^${base_bindir}/bash$" $D${sysconfdir}/shells)\n" > $D${sysconfdir}/shells
> +
> +		if [ ! -s $D${sysconfdir}/shells ]; then
> +			rm $D${sysconfdir}/shells
> +		fi
> +	fi
>  }



