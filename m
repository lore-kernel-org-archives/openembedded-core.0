Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id CE85D60017
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Sep 2015 21:48:17 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1ZZ4Gu-0003OW-4q; Mon, 07 Sep 2015 23:48:16 +0200
Message-ID: <1441662490.1680.82.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 07 Sep 2015 22:48:10 +0100
In-Reply-To: <EC219B31-F312-41D6-81C9-D13213CB2759@gmail.com>
References: <d16024c043abcd21b162f7f93a5bdf29d91c8317.1441552859.git.raj.khem@gmail.com>
	<a234814e2ad213dc69b90a3450d79b778c0e4c7c.1441552859.git.raj.khem@gmail.com>
	<1441654609.1680.79.camel@pbcl.net>
	<EC219B31-F312-41D6-81C9-D13213CB2759@gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4] rootfs: Do not uninstall update-rc.d
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
X-List-Received-Date: Mon, 07 Sep 2015 21:48:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-09-07 at 14:15 -0700, Khem Raj wrote:
> > On Sep 7, 2015, at 12:36 PM, Phil Blundell <pb@pbcl.net> wrote:
> > 
> > On Sun, 2015-09-06 at 15:25 +0000, Khem Raj wrote:
> >> update-rc.d is now needed by systemd to interact with sysv
> >> scripts, so if we have a mixed system, then we can not uninstall
> >> update-rc.d as it is going to break systemd functionality
> > 
> > The description above implies that you will only uninstall update-rc.d
> > if systemd is present, but that doesn't seem to be what the patch does.
> 
> I meant to not say its only for systemd. but that systemd now needs it.
> so update-rc.d is no longer forcefully removed from image depchain.

Well, right.  But wouldn't it be better only to leave it in there if
it's actually necessary, i.e. if you have systemd and you also have sysv
scripts and the rootfs isn't read-only?  As it stands, your patch will
cause update-rc.d to be left around for people who aren't using systemd,
which seems like a retrograde step.

p.



