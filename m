Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8A7407063F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 15:02:21 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	s6HF2L5x001312; Thu, 17 Jul 2014 10:02:21 -0500
Received: from localhost ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014071710022179-491761 ;
	Thu, 17 Jul 2014 10:02:21 -0500 
Date: Thu, 17 Jul 2014 10:02:19 -0500
From: Ben Shelton <ben.shelton@ni.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20140717150219.GB2352@bshelton-desktop>
References: <cover.1405542432.git.ben.shelton@ni.com>
	<47a6fa0baf855ec8ffa563f01ea97a46e116648c.1405542432.git.ben.shelton@ni.com>
	<53C6F846.6080801@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <53C6F846.6080801@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/17/2014 10:02:21 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/17/2014 10:02:21 AM,
	Serialize complete at 07/17/2014 10:02:21 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.14,
	0.0.0000
	definitions=2014-07-17_04:2014-07-17, 2014-07-17,
	1970-01-01 signatures=0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/5] initscripts: bootmisc.sh: Make sysctl -p honor VERBOSE
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
X-List-Received-Date: Thu, 17 Jul 2014 15:02:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 07/16, Saul Wold wrote:
> On 07/16/2014 01:59 PM, Ben Shelton wrote:
> >From: Richard Tollerton <rich.tollerton@ni.com>
> >
> >busybox sysctl may lack the "-q" setting, so simulate it with redirects.
> >
> >Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
> >Signed-off-by: Ben Shelton <ben.shelton@ni.com>
> >---
> >  meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> >diff --git a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
> >index 3b5a47f..5211824 100755
> >--- a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
> >+++ b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
> >@@ -36,7 +36,12 @@ if [ -f "${SYSCTL_CONF}" ]
> >  then
> >  	if [ -x "/sbin/sysctl" ]
> >  	then
> >-		/sbin/sysctl -p "${SYSCTL_CONF}"
> >+		# busybox sysctl does not support -q
> 
> Will this work if procps's sysctl is used instead, I think it will
> but wanted to verify it.
> 
> Sau!
> 

Yes, it will work.  I just installed the procps package on an ARM target
and verified that the output is as expected for both settings of
VERBOSE.

Best,
Ben

> >+		VERBOSE_REDIR="1>/dev/null"
> >+		if [ "${VERBOSE}" != "no" ]; then
> >+			VERBOSE_REDIR="1>&1"
> >+		fi
> >+		eval /sbin/sysctl -p "${SYSCTL_CONF}" $VERBOSE_REDIR
> >  	else
> >  		echo "To have ${SYSCTL_CONF} applied during boot, install package <procps>."
> >  	fi
> >

