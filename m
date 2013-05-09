Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UaU80-0006Oj-8i for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 18:55:42 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UaTqY-0008Ej-1m; Thu, 09 May 2013 18:37:34 +0200
Message-ID: <1368117453.14512.423.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Thu, 09 May 2013 17:37:33 +0100
In-Reply-To: <1368116777-23778-1-git-send-email-paul.eggleton@linux.intel.com>
References: <1368116777-23778-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] classes/insane: add check for PN in OVERRIDES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 May 2013 16:55:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-05-09 at 17:26 +0100, Paul Eggleton wrote:
> If a recipe is named such that its PN value matches something already in
> OVERRIDES (such as when PN happens to be the same as MACHINE or DISTRO),
> it can have unexpected consequences. Assignments such as
> FILES_${PN} = "xyz" effectively turn into FILES = "xyz".

I think this patch is a fine one, but it makes me wonder whether we
should try to come up with a roadmap for changing the existing,
non-namespaced OVERRIDES into something less prone to namespace
collisions.  As a first step, we could just add namespaced equivalents
to the OVERRIDES in oe-core, i.e.:

MACHINEOVERRIDES ?= "${MACHINE}:machine-${MACHINE}"

etc, and then convert any usages of those within oe-core to use the new
style.  Then at some later date we can come up with a plan to remove the
old ones.

p.




