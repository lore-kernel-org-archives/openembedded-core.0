Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <walters@verbum.org>) id 1Sjd5O-0003QM-JM
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jun 2012 23:14:10 +0200
Received: from compute3.internal (compute3.nyi.mail.srv.osa [10.202.2.43])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id DC65C212A2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2012 17:03:19 -0400 (EDT)
Received: from frontend2.nyi.mail.srv.osa ([10.202.2.161])
	by compute3.internal (MEProxy); Tue, 26 Jun 2012 17:03:19 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:subject:from:to:date
	:in-reply-to:references:content-type:mime-version
	:content-transfer-encoding; s=smtpout; bh=8lnN+SEv5o5t/7nwIxN680
	gU8bk=; b=Ngd1O0N6XDLxg33Mw88zGGkP8vrS2luC/XPngG2VdEu1tV7v5XN9gy
	irkxlea76kQ/j8/e1HVkGDZ4bgdW2EH7vEO5gJP/xyf2JKqXg7ZeoXcipCj/MC3h
	u4G0ju1evPfFRm9bWhtQ19OU5m0lM2CF/FJx+VDA55Scj8G5mklFs=
X-Sasl-enc: TW666A6VCib/qB3h3WLLgazFUuGd4UVGTm7WXNDJ+heX 1340744599
Received: from [10.16.189.124] (unknown [66.187.233.206])
	by mail.messagingengine.com (Postfix) with ESMTPA id 904B24836DC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2012 17:03:19 -0400 (EDT)
Message-ID: <1340744566.3500.2.camel@lenny>
From: Colin Walters <walters@verbum.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 26 Jun 2012 17:02:46 -0400
In-Reply-To: <1340705423-18430-1-git-send-email-ross.burton@intel.com>
References: <1340705423-18430-1-git-send-email-ross.burton@intel.com>
X-Mailer: Evolution 3.4.3 (3.4.3-1.fc17) 
Mime-Version: 1.0
Subject: Re: [PATCH] gconf.bbclass: don't register schemas in the install stage
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
X-List-Received-Date: Tue, 26 Jun 2012 21:14:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-06-26 at 11:10 +0100, Ross Burton wrote:

> +# Disable install-time schema registration as we're a packaging system so this
> +# happens in the postinst script, not at install time.  Set both the configure
> +# script option and the traditional envionment variable just to make sure.
> +EXTRA_OECONF += "--disable-schemas-install"
> +export GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL = "1"

Even better is to have the source code check for DESTDIR, and skip gconf
bits itself; e.g.:

http://git.gnome.org/browse/evolution/tree/shell/Makefile.am?h=gnome-2-28#n201

This patch is still useful though for components which don't check
DESTDIR, but again it's better to patch the relevant source code to do
so (or port to GSettings...).





