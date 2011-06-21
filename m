Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QZ6C6-00038d-40 for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 21:01:02 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QZ68g-0002nl-Du
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 20:57:30 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E00CA30.7020302@windriver.com>
References: <4E00CA30.7020302@windriver.com>
Date: Tue, 21 Jun 2011 19:57:23 +0100
Message-ID: <1308682643.3083.18.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: Directory permissions and ownership -- RFC
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
X-List-Received-Date: Tue, 21 Jun 2011 19:01:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-21 at 11:43 -0500, Mark Hatle wrote:
> Adjust the umask to 022.  This resolves the problem of dynamically generated
> directories (mkdir -p) and specific files (touch foo) having odd permissions.
> 
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=mhatle/perms&id=d8470b6a8efdbba04cef5d4dc1ce12720fe83621

Are you confident that this isn't going to break anything like
group-shared DL_DIRs?  I'm not entirely thrilled about forcing the umask
to 022 for everything that bitbake does, although I can see that making
it be so for particular tasks like do_install() might have some merit.
Even in the latter case, though, I wonder whether we should just be
paying more attention to recipe hygiene and using "install -m ..." with
the permissions that we actually want.

I'm also not quite sure I understand why this is necessary if
fixup_perms is going to fix up the permissions anyway. 

> The user can add their own settings, or override the defaults by providing a
> meta/files/fs-perms.txt file. 

Using a magically-named file rather than metadata vars is a bit
unconventional and seems like it will make life unnecessarily harder for
distros/other overlays.  Is there any reason it needs to be done that
way?

p.




