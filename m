Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1UVRHh-0007io-L9 for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 20:52:54 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1UVR0Z-0004pU-9S for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 20:35:03 +0200
Received: from 188-25-127-222.rdsnet.ro ([188-25-127-222.rdsnet.ro])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2013 20:35:03 +0200
Received: from sstncr by 188-25-127-222.rdsnet.ro with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2013 20:35:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Stefan Stanacar <sstncr@gmail.com>
Date: Thu, 25 Apr 2013 18:32:00 +0000 (UTC)
Message-ID: <loom.20130425T194616-214@post.gmane.org>
References: <1366851904-1306-1-git-send-email-stefanx.stanacar@intel.com>
	<5179327A.9010803@windriver.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 188.25.127.222 (Mozilla/5.0 (X11;
	Linux x86_64) AppleWebKit/537.22 (KHTML, like Gecko)
	Chrome/25.0.1364.172 Safari/537.22)
Subject: Re: [PATCH] connman: replace hardcoded path in init script
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
X-List-Received-Date: Thu, 25 Apr 2013 18:52:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Mark Hatle <mark.hatle@...> writes:

> 
> On 4/24/13 8:05 PM, Stefan Stanacar wrote:
> > Because the connman init script sources a config file from /usr/lib
> > we end up with no network in multilib enabled sato images, so replace
> > with the real libdir.
> >
> > Signed-off-by: Stefan Stanacar <stefanx.stanacar@...>
> > ---
> >   meta/recipes-connectivity/connman/connman.inc     | 3 ++-
> >   meta/recipes-connectivity/connman/connman/connman | 4 ++--
> >   2 files changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/recipes-connectivity/connman/connman.inc 
b/meta/recipes-connectivity/connman/connman.inc
> > index 589ece8..93c9da0 100644
> > --- a/meta/recipes-connectivity/connman/connman.inc
> > +++ b/meta/recipes-connectivity/connman/connman.inc
> >  <at>  <at>  -47,7 +47,7  <at>  <at>  INITSCRIPT_NAME = "connman"
> >   INITSCRIPT_PARAMS = "start 05 5 2 3 . stop 22 0 1 6 ."
> >
> >   SYSTEMD_SERVICE_${PN} = "connman.service"
> > -SYSTEMD_WIRED_SETUP = "ExecStartPre=-/usr/lib/connman/wired-setup"
> > +SYSTEMD_WIRED_SETUP = "ExecStartPre=-${libdir}/connman/wired-setup"
> 
> I don't think this is right.  The initscript and setup command should be 
in the 
> 'libexec' location, which is /usr/lib/connman.  This way the initscript 
from any 
> duplicate multilibs installed won't cause a conflict.  And the binaries 
end up 
> in a known location.  (The libraries on the other hand should definitely 
be in 
> the libdir.)
> 


Okay, that makes sense. The only problem is that wired-setup is installed by 
connman-conf so libexec won't work.  (connman rrecomends connman-conf which 
installs wired.config and wired-setup for qemu machines only). And I'm not 
sure how to get around that.

Poky commit  e93b6376a0cff5321dd7fc13a88c8b06ae8b83c7 moved wired-setup from 
/etc/connman to /usr/lib/connman. 
I do think that /etc/connman/wired-setup was the better location (or perhaps 
connman-conf), given that's only a script sourced in /etc/init.d/connman if 
it exists. But I don't know the reasons why it was moved to 
/usr/lib/connman.

Any thoughts?



