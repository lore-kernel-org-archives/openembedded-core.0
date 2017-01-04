Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id BF25A719B4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2017 23:34:10 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=tp13)
	by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.87)
	(envelope-from <pb@pbcl.net>)
	id 1cOv4K-0002Jv-CK; Thu, 05 Jan 2017 00:34:10 +0100
Message-ID: <1483572844.4360.177.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Christopher Larson <kergoth@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 04 Jan 2017 23:34:04 +0000
In-Reply-To: <0f858d235ef2116b29251f6e471abdb62490532d.1483570577.git.chris_larson@mentor.com>
References: <cover.1483570577.git.chris_larson@mentor.com>
	<0f858d235ef2116b29251f6e471abdb62490532d.1483570577.git.chris_larson@mentor.com>
X-Mailer: Evolution 3.20.5-1 
Mime-Version: 1.0
Subject: Re: [PATCH 3/6] libglu: add opengl to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Wed, 04 Jan 2017 23:34:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-01-04 at 15:57 -0700, Christopher Larson wrote:
> 
>  # Requires libGL.so which is provided by mesa when x11 in
> DISTRO_FEATURES
> -REQUIRED_DISTRO_FEATURES = "x11"
> +REQUIRED_DISTRO_FEATURES = "x11 opengl"

I sort of have the sense that something has gone a bit wrong with the
way {REQUIRED_}DISTRO_FEATURES is now being used.

The original concept with DISTRO_FEATURES was that it would just be a
global way of controlling the PACKAGECONFIG options for each recipe.
 That is, if you have x11 in DISTRO_FEATURES then PACKAGECONFIG[x11]
would be turned on automatically for every recipe that supports it, and
so on.  It was never really intended to be, and I still feel it
probably ought not to be, a filtering mechanism.

Or, to put it another way, just because you don't have x11 in
DISTRO_FEATURES doesn't necessarily mean that your distro refuses to
support x11 at all.  It ought simply to mean that you don't
want packages compiled with X11 support where this is avoidable.

But in the particular case above, if the comment is correct then the
presence of x11 in REQUIRED_DISTRO_FEATURES seems bogus by any
interpretation.  If it's really true that libGLU simply "Requires
libGL.so" then either:

a) it ought to have nothing at all in REQUIRED_DISTRO_FEATURES and
simply express a dependency on virtual/libgl (which would be my
preference); or

b) it ought to mention only opengl in REQUIRED_DISTRO_FEATURES

p.


