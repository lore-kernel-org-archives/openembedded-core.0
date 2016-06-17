Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C912B62136
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 16:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u5HGVI2a003629; Fri, 17 Jun 2016 17:31:18 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id CYTj-aAMMb6d; Fri, 17 Jun 2016 17:31:18 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u5HGVGto003625
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 17 Jun 2016 17:31:17 +0100
Message-ID: <1466181076.25557.20.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Maxin B. John" <maxin.john@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 17 Jun 2016 17:31:16 +0100
In-Reply-To: <1466180018.25557.18.camel@linuxfoundation.org>
References: <1466173179-19456-1-git-send-email-maxin.john@intel.com>
	<1466180018.25557.18.camel@linuxfoundation.org>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: "Lock, Joshua" <joshua.g.lock@intel.com>, "Bartosh,
	Eduard" <eduard.bartosh@intel.com>
Subject: Re: [PATCH] depexp.py: port to gtk+3
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
X-List-Received-Date: Fri, 17 Jun 2016 16:31:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-06-17 at 17:13 +0100, Richard Purdie wrote:
> On Fri, 2016-06-17 at 17:19 +0300, Maxin B. John wrote:
> > Update depexp.py to support gtk+3
> > 
> > Signed-off-by: Maxin B. John <maxin.john@intel.com>
> > ---
> >  bitbake/lib/bb/ui/depexp.py | 127 ++++++++++++++++++++------------
> > --
> > ----------
> >  1 file changed, 58 insertions(+), 69 deletions(-)
> > 
> > diff --git a/bitbake/lib/bb/ui/depexp.py
> > b/bitbake/lib/bb/ui/depexp.py
> > index 240aafc..8f603dd 100644
> > --- a/bitbake/lib/bb/ui/depexp.py
> > +++ b/bitbake/lib/bb/ui/depexp.py
> > @@ -18,14 +18,15 @@
> >  # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> 
> Thanks for this, it certainly improves something which is currently
> much more broken. I've queued in master-next. Note that this really
> should go to the bitbake list in future.
> 
> I also am a bit worried about the time.sleep(), am seeing if we can
> figure out how to avoid that before it merges...

Looks like its the gtk.init_check() in the bitbake thread before we
setup a separate gtk thread. The check needs to move to the other
thread with appropriate error handling, then we don't need the sleep.

The bitbake main thread needs to likely wait on the gtk init having
finished too.

Cheers,

Richard


