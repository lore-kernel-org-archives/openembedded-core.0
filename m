Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 31BD4731E5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 22:20:42 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1aGZy2-0001dN-SF; Tue, 05 Jan 2016 23:20:39 +0100
Message-ID: <1452032430.2002.110.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Tue, 05 Jan 2016 22:20:30 +0000
In-Reply-To: <568BF822.8020303@windriver.com>
References: <cover.1451912446.git.ian.ray@ge.com>
	<4e736dcbaf5c32f9d7728990ad4ac0ca975dfd6d.1451912446.git.ian.ray@ge.com>
	<568A99CD.9000800@universe-factory.net>
	<568A9E97.2050909@windriver.com>
	<568AF189.5010801@universe-factory.net>
	<568AF894.1010405@windriver.com>
	<568B06D3.7030205@universe-factory.net>
	<568B0E13.6090108@windriver.com>
	<568B1BB5.7060303@universe-factory.net>
	<30E719D66AEA914CBB7DAB303B1C722DB4A8F9@BUDURBPA09.e2k.ad.ge.com>
	<568BD429.9040003@windriver.com>
	<30E719D66AEA914CBB7DAB303B1C722DB4A9E3@BUDURBPA09.e2k.ad.ge.com>
	<568BF822.8020303@windriver.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] linux-firmware: remove hard-coded paths
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
X-List-Received-Date: Tue, 05 Jan 2016 22:20:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-01-05 at 11:06 -0600, Mark Hatle wrote:
> This is a situation where we've got hard coded '/lib' entries in FILES, but
> we're trying to move the directory elsewhere.... 'adjusting' FILES automatically
> is probably more error prone and complicated then desired.. but I'm not sure
> switching to nonarch_baselib_dir is right either.. argh.  (But it may certainly
> be the less evil in this case.)

Isn't this more or less exactly what ${nonarch_baselib_dir} is for?  If
there's some disconnect between firmware and other users of that
variable (mostly mdev/udev/systemd I guess) then maybe we should
introduce a separate ${firmware_loader_dir} or something.  But either
way, it seems fairly clear that the right thing is to simply have a
variable that the distro can set to the right place, and then have both
do_install() and FILES defined in terms of that same variable, rather
than doing some sort of subsequent post-processing step that tries to
move the contents around and then patch FILES up to match.

p.



