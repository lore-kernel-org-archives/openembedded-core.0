Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RvB0c-0003kL-99
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 18:08:42 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RvAsq-0002aI-TU
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 18:00:41 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 08 Feb 2012 17:00:40 +0000
In-Reply-To: <CAP9ODKqUo7qazvdbWxQB_bQh3jpf+Uf=kf1YVp=Y-oB6QQYGGQ@mail.gmail.com>
References: <1328717200-13689-1-git-send-email-andrei@gherzan.ro>
	<1328717410.14363.46.camel@phil-desktop>
	<CAP9ODKqUo7qazvdbWxQB_bQh3jpf+Uf=kf1YVp=Y-oB6QQYGGQ@mail.gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1328720440.14363.56.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH] dhcp: Update to 4.2.3-P2
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
X-List-Received-Date: Wed, 08 Feb 2012 17:08:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-02-08 at 14:30 -0200, Otavio Salvador wrote:
> On Wed, Feb 8, 2012 at 14:10, Phil Blundell <philb@gnu.org> wrote:
>         This isn't just a straightforward update, you seem to be
>         moving dhclient
>         from ${base_sbindir} to ${sbindir}.  If that's a good thing
>         (which
>         doesn't seem totally obvious to me) then it ought at least to
>         be
>         mentioned in the commit message.
>         
> 
> He is doing that because it links against libcrypt that is at
> ${libdir}. But it clearly needs to be in another commit or, at least,
> explicit in the changlog.

Yeah, I guessed it was probably something like that.  But this seems
like a bad solution since anybody who has /usr separate probably does
want dhclient during bootup.  In particular, if you have /usr on NFS
then you might be hosed if dhclient is in /usr/bin.

It seems like the right way to fix this is one of:

a) move libcrypto to ${base_libdir}, or
b) stop dhclient from linking against libcrypto, or
c) make it link against the static rather than shared library

Do we know why dhclient has grown this dependency on libcrypto in the
first place?  Or, as an alternative data point, is there a particular
reason why this upgrade is required (i.e. could we just stick with the
old version)?

But, the main point I was trying to make was that the checkin message
did not adequately describe what the patch was doing.  I think the
quality of patches that are being applied to oe-core is, for the most
part, pretty good nowadays but there still do seem to be quite a few
with poor/inaccurate checkin messages and this is an area where it seems
like it should be possible to do better with relatively little effort.  

For example, looking at the git log for the last week, there are at
least 3 commits which don't have the recipe name at the start of the
subject line.  Although this sounds like a trivial thing it is actually
quite annoying if you're trying to scan the git logs to see what changes
have been applied to a recipe or set of recipes.  Similarly, if the
commit message can't be relied upon to accurately describe what has been
changed, you end up having to read all the diffs for every change which
is quite a tedious business.

p.





