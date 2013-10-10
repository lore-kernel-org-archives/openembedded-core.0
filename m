Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id A8EE46CCB0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2013 11:00:03 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1VUDyP-0001YS-0Z; Thu, 10 Oct 2013 13:00:05 +0200
Message-ID: <1381402804.11000.61.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Thu, 10 Oct 2013 12:00:04 +0100
In-Reply-To: <1381356715.29912.48.camel@ted>
References: <1381356715.29912.48.camel@ted>
X-Mailer: Evolution 3.4.4-4+b1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: gcc: Fix strange C++ repo issues
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
X-List-Received-Date: Thu, 10 Oct 2013 11:00:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-10-09 at 23:11 +0100, Richard Purdie wrote:
> +++ b/meta/recipes-devtools/gcc/gcc-4.8/0047-repomembug.patch
> @@ -0,0 +1,46 @@
> +When compiling a project using -frepo, .rpo files are written alongside
> +the .o file, the symbols either have O or C against them. During final linking,
> +the objects can be recompiled with some of the entries tweaked/chosen by the 
> +tlink.c code (visible with TLINK_VERBOSE=3).
> +
> +My tests showed that init_repo (cp/repo.c) was correcting calling 
> +IDENTIFIER_REPO_CHOSEN against the right identifers.
> +
> +By the time finish_repo() or emit_repo_p() were called, the pointer returned
> +by get_identifier() for the symbol marked during init_repo had changed and
> +the chosen bit was no longer set. This lead to linking bugs like:
> +
> +collect: relinking
> +collect2: error: '_ZNK6sudoku5ClearINS_8SequenceEEclERS1_' was assigned to 'board.rpo', but was not defined during recompilation, or vice versa
> +
> +The problem is that the garbage collection is getting called before
> +finish_repo() is called and ggc_protect_identifiers is set to false 
> +so the identifiers are not preserved. They are recreated but the 
> +chosen bits get wiped out.
> +
> +The fix is to change ggc_protect_identifiers *after* the finish_repo 
> +calls are made.
> +
> +Reproduction is tricky since you need to trigger the garbage collector at
> +just the right moment.
> +
> +RP 2013/10/9
> +
> +Index: gcc-4.8.1/gcc/toplev.c

This patch header seems to lack an Upstream-Status.

p.



