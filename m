Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id EE47D77038
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2016 13:02:36 +0000 (UTC)
Received: from elite.brightsigndigital.co.uk ([213.210.30.29]
	helo=phil-desktop) by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <pb@pbcl.net>)
	id 1abSto-0007dK-DF; Thu, 03 Mar 2016 14:02:36 +0100
Message-ID: <1457010155.3476.31.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Andre McCurdy <armccurdy@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 03 Mar 2016 13:02:35 +0000
In-Reply-To: <1453937316-1311-4-git-send-email-armccurdy@gmail.com>
References: <1453937316-1311-1-git-send-email-armccurdy@gmail.com>
	<1453937316-1311-4-git-send-email-armccurdy@gmail.com>
X-Mailer: Evolution 3.18.3-1 
Mime-Version: 1.0
Subject: Re: [PATCH 3/3] glib.inc: limit ARM_INSTRUCTION_SET over-rides to armv4/armv5
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
X-List-Received-Date: Thu, 03 Mar 2016 13:02:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2016-01-27 at 15:28 -0800, Andre McCurdy wrote:
> -ARM_INSTRUCTION_SET = "arm"
> +ARM_INSTRUCTION_SET_armv4 = "arm"
> +ARM_INSTRUCTION_SET_armv5 = "arm"

Although I agree that this is a net improvement over the old code in
almost all cases, this patch is not quite right.  The reason for the
original override is that there is assembler code in glib which won't
compile as Thumb-1 (but is ok in Thumb-2).  Thumb-2 is only available
in ARMv6T2 and newer architectures so with your patch it looks like
compilation on arm1136jf-s (which is ARMv6 not ARMv6T2) would now fail.

I recommend that we either:

1. Introduce a new, explicit "thumb1" override which can be enabled by
the appropriate arch-arm*.inc files, and make all the appropriate
recipes set ARM_INSTRUCTION_SET based on that; or

2. Introduce a new thumb1-compatible.inc file which contains lines like

ARM_INSTRUCTION_SET_glib-2.0 = "arm"

and let distros which want to support older ARMs and enable Thumb
include that file; or

3. Take the view that it's now nearly fifteen years since Thumb-2 was
introduced, OE-core no longer needs to pander explicitly to Thumb-1,
and we should just remove all this scar tissue entirely.  Distros that
do want to target Thumb-1 can still maintain the appropriate
compatibility stuff (which is probably only a dozen lines or so) for
themselves.

Personally I would favour #3. :-)

p.


