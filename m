Return-Path: <J.Remmet@phytec.de>
Received: from root.phytec.de (mail.phycard.de [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id DA2426FFAB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 14:17:49 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 397DBA0030E;
	Thu, 16 Jun 2016 16:18:39 +0200 (CEST)
Received: from localhost ([172.16.12.25])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP5 HF413)
	with ESMTP id 2016061616173419-322688 ;
	Thu, 16 Jun 2016 16:17:34 +0200 
Date: Thu, 16 Jun 2016 16:17:29 +0200
From: Jan Remmet <J.Remmet@phytec.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20160616141729.GA3044@lws-weitzel2@phytec.de>
Reply-To: Jan Remmet <J.Remmet@phytec.de>
References: <1465997797-6613-1-git-send-email-j.remmet@phytec.de>
	<7E603C53-3E9F-488E-8AC2-AA8D4AB8DBC0@gmail.com>
MIME-Version: 1.0
In-Reply-To: <7E603C53-3E9F-488E-8AC2-AA8D4AB8DBC0@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP5
	HF413|March 21, 2016) at 16.06.2016 16:17:34,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP5 HF413|March 21,
	2016) at 16.06.2016 16:17:34,
	Serialize complete at 16.06.2016 16:17:34
X-TNEFEvaluated: 1
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] rootfs-postcommands: generate /var/lib/systemd/clock
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
X-List-Received-Date: Thu, 16 Jun 2016 14:17:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 15, 2016 at 12:14:17PM -0700, Khem Raj wrote:
> 
> > On Jun 15, 2016, at 6:36 AM, Jan Remmet <J.Remmet@phytec.de> wrote:
> > 
> > systemd timesyncd check /var/lib/systemd/clock instead of
> > /etc/timestamp.
> > If this file is missing it defaults to TIME_EPOCH. It's set while
> > configuring systemd.
> > 
> > Signed-off-by: Jan Remmet <j.remmet@phytec.de>
> > ---
> > meta/classes/rootfs-postcommands.bbclass | 6 ++++++
> > 1 file changed, 6 insertions(+)
> > 
> > diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
> > index db8b551..0c7b764 100644
> > --- a/meta/classes/rootfs-postcommands.bbclass
> > +++ b/meta/classes/rootfs-postcommands.bbclass
> > @@ -234,6 +234,12 @@ python write_image_manifest () {
> > # sane default time setting
> > rootfs_update_timestamp () {
> > 	date -u +%4Y%2m%2d%2H%2M%2S >${IMAGE_ROOTFS}/etc/timestamp
> > +
> > +	if ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "true", "false", d)}; then
> > +		# touch needs timestamp as [[CC]YY]MMDDhhmm[.ss]
> > +		TS=$(sed 's/[.]*/&./13' ${IMAGE_ROOTFS}/etc/timestamp)
> > +		touch -t $TS ${IMAGE_ROOTFS}/var/lib/systemd/clock
> > +	fi
> > }
> 
> i wonder if this will work with read only rootfs.
I found no special handling for systemd and /var/lib if IMAGE_FEATURES
read-only-rootfs is used.
If timesyncd didn't find /var/lib/systemd/clock it defaults to the configure
time value und try to write /var/lib/systemd/clock. On read-only it will
silently fail.
So I don't see a problem here.

Jan
> 
> > 
> > # Prevent X from being started
> > --
> > 1.9.1
> > 
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 



