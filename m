Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id F2D8E78263
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 09:03:00 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v5G9301f025850
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 16 Jun 2017 10:03:01 +0100
Message-ID: <1497603780.24449.11.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Gary Thomas <gary@mlbassoc.com>, openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2017 10:03:00 +0100
In-Reply-To: <7b5ced3d-4b53-4404-ab7f-f1179e94d122@mlbassoc.com>
References: <1497447757-30951-1-git-send-email-richard.purdie@linuxfoundation.org>
	<7b5ced3d-4b53-4404-ab7f-f1179e94d122@mlbassoc.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 16 Jun 2017 10:03:01 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/3] pseudo: Handle too many files deadlock
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
X-List-Received-Date: Fri, 16 Jun 2017 09:03:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-06-14 at 15:51 +0200, Gary Thomas wrote:
> On 2017-06-14 15:42, Richard Purdie wrote:
> > 
> > If we have large amounts of parallelism, pseudo can end up with too
> > many open connections and will no longer accept further
> > connections,
> > hanging. This patch works around that by closing some clients,
> > allowing
> > turnover of connections and unblocking the system. The downside is
> > a small
> > but theoretical window of data loss. This is likely better than
> > locking
> > up entirely though. Discussions with Peter are onging about how we
> > could
> > better fix this.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >   .../pseudo/files/toomanyfiles.patch                | 62
> > ++++++++++++++++++++++
> >   meta/recipes-devtools/pseudo/pseudo_1.8.2.bb       |  1 +
> >   2 files changed, 63 insertions(+)
> >   create mode 100644 meta/recipes-
> > devtools/pseudo/files/toomanyfiles.patch
> > 
> > diff --git a/meta/recipes-devtools/pseudo/files/toomanyfiles.patch
> > b/meta/recipes-devtools/pseudo/files/toomanyfiles.patch
> > new file mode 100644
> > index 0000000..14a8975
> > --- /dev/null
> > +++ b/meta/recipes-devtools/pseudo/files/toomanyfiles.patch
> > @@ -0,0 +1,62 @@
> > +Currently if we max out the maximum number of files, pseudo can
> > deadlock, unable to
> > +accept new connections yet unable to move forward and unblock the
> > other processes
> > +waiting either.
> > +
> > +Rather than hang, when this happens, close out inactive
> > connections, allowing us
> > +to accept the new ones. The disconnected clients will simply
> > reconnect. There is
> > +a small risk of data loss here sadly but its better than hanging.
> > +
> > +RP
> > +2017/4/25
> > +
> > +Upstream-Status: Pending [Peter is aware of the issue]
> > +
> > +Index: pseudo-1.8.2/pseudo_server.c
> > +==================================================================
> > =
> > +--- pseudo-1.8.2.orig/pseudo_server.c
> > ++++ pseudo-1.8.2/pseudo_server.c
> > +@@ -581,6 +581,7 @@ pseudo_server_loop(void) {
> > + 	int rc;
> > + 	int fd;
> > + 	int loop_timeout = pseudo_server_timeout;
> > ++	int hitmaxfiles;
> > +
> > + 	clients = malloc(16 * sizeof(*clients));
> > +
> > +@@ -597,6 +598,7 @@ pseudo_server_loop(void) {
> > + 	active_clients = 1;
> > + 	max_clients = 16;
> > + 	highest_client = 0;
> > ++	hitmaxfiles = 0;
> > +
> > + 	pseudo_debug(PDBGF_SERVER, "server loop started.\n");
> > + 	if (listen_fd < 0) {
> > +@@ -663,10 +665,18 @@ pseudo_server_loop(void) {
> > + 						message_time.tv_u
> > sec -= 1000000;
> > + 						++message_time.tv
> > _sec;
> > + 					}
> > ++				} else if (hitmaxfiles) {
> > ++					/* In theory there is a
> > potential race here where if we close a client,
> > ++					   it may have sent us a
> > fastop message which we don't act upon.
> > ++					   If we don't close a
> > filehandle we'll loop indefinitely thought.
> > ++					   Only close one per
> > loop iteration in the interests of caution */
> > ++					close_client(i);
> > ++					histmaxfiles = 0;
> Typo?  s/histmaxfiles/hitmaxfiles/

I wondered if anyone would spot that! :)

Its fixed in the version on master-next.

Cheers,

Richard

