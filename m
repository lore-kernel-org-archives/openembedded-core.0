Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 3C90B6A597
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 15:31:38 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UhLsA-0006i6-W1; Tue, 28 May 2013 17:31:39 +0200
Message-ID: <1369755098.8846.16.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Tue, 28 May 2013 16:31:38 +0100
In-Reply-To: <CAP9ODKqkoXrrYSyQJzRxmDfBKnQWYMUoCV8dhRvHGm2Y-sXp7g@mail.gmail.com>
References: <1369753475-22573-1-git-send-email-otavio@ossystems.com.br>
	<1369753938.8846.8.camel@phil-desktop.brightsign>
	<CAP9ODKqkoXrrYSyQJzRxmDfBKnQWYMUoCV8dhRvHGm2Y-sXp7g@mail.gmail.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: Add COMPATIBLE_DISTRO_FEATURES support
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
X-List-Received-Date: Tue, 28 May 2013 15:31:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-05-28 at 12:18 -0300, Otavio Salvador wrote:

> +        need_distro_features = d.getVar('REQUIRED_DISTRO_FEATURES',
> True)
> +        if need_distro_features:
> +            need_distro_features = need_distro_features.split()
> +            distro_features = (d.getVar('DISTRO_FEATURES', True) or
> "").split()
> +            for f in need_distro_features:
> +                if f in distro_features:
> +                    break
> +            else:
> +                raise bb.parse.SkipPackage("missing required distro
> feature %s (not in DISTRO_FEATURES)" % need_distro_features)

This is still not quite right.  The error message says that the features
it mentions are "not in DISTRO_FEATURES", but it appears to still be
listing everything that's named in REQUIRED_DISTRO_FEATURES whether or
not it is actually in DISTRO_FEATURES.

Also you seem to be printing a Python list with %s, which will work but
the results aren't especially pretty.

Also also, on a stylistic point, the "for/if/break" construct is a bit
ugly.  You could perhaps consider something like:

need_distro_features = need_distro_features.split()
distro_features = (d.getVar('DISTRO_FEATURES', True) or "").split()
missing_distro_features = filter(lambda x: x not in distro_features, need_distro_features)
if missing_distro_features:
  raise bb.parse.SkipPackage("missing required distro features: %s" % " ".join(missing_distro_features))

p.




