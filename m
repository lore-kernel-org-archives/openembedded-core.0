Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3FB0173243
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 22:38:01 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t8MMc1hM013913; Tue, 22 Sep 2015 17:38:01 -0500
Received: from weregild.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015092217380127-191430 ;
	Tue, 22 Sep 2015 17:38:01 -0500 
From: Richard Tollerton <rich.tollerton@ni.com>
To: Alex Franco <alejandro.franco@linux.intel.com>,
	openembedded-core@lists.openembedded.org
In-Reply-To: <1441828569-518-1-git-send-email-alejandro.franco@linux.intel.com>
References: <1441828569-518-1-git-send-email-alejandro.franco@linux.intel.com>
User-Agent: Notmuch/0.20.2 (http://notmuchmail.org) Emacs/24.5.2
	(x86_64-unknown-linux-gnu)
Date: Tue, 22 Sep 2015 17:38:01 -0500
Message-ID: <87mvwersfq.fsf@weregild.amer.corp.natinst.com>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 09/22/2015 05:38:01 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 09/22/2015 05:38:01 PM,
	Serialize complete at 09/22/2015 05:38:01 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-09-22_06:, , signatures=0
Subject: Re: [PATCH] lsb: add lsbinitscripts and util-linux rdepends
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
X-List-Received-Date: Tue, 22 Sep 2015 22:38:08 -0000
Content-Type: text/plain

Alex Franco <alejandro.franco@linux.intel.com> writes:

> Building a base image such as core-image-minimal with lsb and then
> attempting to source /lib/lsb/init-functions, then using the start
> _daemon function (to start a daemon, such as syslogd) fails, since
> /lib/lsb/init-functions use functions (incl. "daemon()") from file
> /etc/init.d/functions.lsbinitscripts, which is provided by package
> lsbinitscripts. Running daemon() then calls /usr/bin/mountpoint, a
> binary provided by util-linux. So, both of these dependencies have
> been added to: recipes-extended/lsb/lsb_4.1.bb

This line wrapping is... weird. :F

> [YOCTO #7732]

I can no longer reproduce the segfault I alluded to in that bug report;
I guess I'll reopen it later if I see it again.

> --- a/meta/recipes-extended/lsb/lsb_4.1.bb
> +++ b/meta/recipes-extended/lsb/lsb_4.1.bb
> @@ -6,6 +6,9 @@ PR = "r2"
>  
>  # lsb_release needs getopt
>  RDEPENDS_${PN} += "${VIRTUAL-RUNTIME_getopt}"

> +# lsb needs lsbinitscripts and util-linux

Nitpick: does this comment accomplish anything?

> +RDEPENDS_${PN} += "lsbinitscripts \
> +                   util-linux"

Shouldn't the util-linux dependency exist in lsbinitscripts instead of
lsb?

There's also a bash dependency in /etc/init.d/functions.lsbinitscripts
that probably needs to get added, or a patch created to eliminate it.
Should I file a new bug about it?

