Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 174896AC37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 15:12:33 +0000 (UTC)
Received: from cpc5-cmbg17-2-0-cust97.5-4.cable.virginm.net ([86.30.112.98]
	helo=phil-desktop)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1Z7PsH-0002YL-Gb; Tue, 23 Jun 2015 17:12:33 +0200
Message-ID: <1435072346.2483.417.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Mike Crowe <mac@mcrowe.com>
Date: Tue, 23 Jun 2015 16:12:26 +0100
In-Reply-To: <1434221081-4286-1-git-send-email-mac@mcrowe.com>
References: <1434221081-4286-1-git-send-email-mac@mcrowe.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pixbufcache: Ensure that jpeg-native is available for postinst if necessary
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
X-List-Received-Date: Tue, 23 Jun 2015 15:12:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2015-06-13 at 19:44 +0100, Mike Crowe wrote:
> diff --git a/meta/classes/pixbufcache.bbclass b/meta/classes/pixbufcache.bbclass
> index 9e6ecc8..755a654 100644
> --- a/meta/classes/pixbufcache.bbclass
> +++ b/meta/classes/pixbufcache.bbclass
> @@ -72,6 +72,7 @@ PIXBUFCACHE_SYSROOT_DEPS_class-native = "\
>      glib-2.0-native:do_populate_sysroot_setscene libffi-native:do_populate_sysroot_setscene \
>      libpng-native:do_populate_sysroot_setscene zlib-native:do_populate_sysroot_setscene \
>      harfbuzz-native:do_populate_sysroot_setscene \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'jpeg', 'jpeg-native:do_populate_sysroot_setscene', '', d)} \

I'm not sure this is quite right.  PACKAGECONFIG at the point this is
expanded will be the PACKAGECONFIG for whatever recipe is currently
inheriting pixbufcache.bbclass, whereas I think what you really need
here is the PACKAGECONFIG that gdk-pixbuf itself was built with.  Or,
er, something.

p.



