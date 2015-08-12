Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by mail.openembedded.org (Postfix) with ESMTP id 99CD9768B1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 03:26:31 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NSY00ELX9K6PGJ0@vms173017.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Tue, 11 Aug 2015 22:26:31 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=XYJHFtupD_QA:10 a=-9mUelKeXuEA:10
	a=kj9zAlcOel0A:10 a=uRRa74qj2VoA:10	a=I7MXRwyAmKgHag7R6_IA:9
	a=CjuIK1q_8ugA:10
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C5090161B74; Tue,
	11 Aug 2015 23:26:30 -0400 (EDT)
Date: Tue, 11 Aug 2015 23:26:30 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Message-id: <20150812032630.GF26375@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: oprofile rebuilds for different MACHINES (sstate)
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
X-List-Received-Date: Wed, 12 Aug 2015 03:26:31 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

So, I've been debugging the issue of oprofile rebuilding from one MACHINE to 
another (causing PR issues, etc). I was able to trace it down to this line:

EXTRA_OECONF = "--with-kernel=${STAGING_KERNEL_DIR}  --without-x ac_cv_prog_XSLTPROC="

And STAGING_KERNEL_DIR resolves to this:

STAGING_KERNEL_DIR = "${TMPDIR}/work-shared/${MACHINE}/kernel-source"

Now, obviously, when MACHINE changes, sstate invalidates do_configure and 
rebuilds oprofile.

The question is, what is the proper fix in this case - mark oprofile as 
machine-specific with PACKAGE_ARCH = "${MACHINE_ARCH}", since it will be 
configuring and building against (potentially) completely different kernel 
tree. So, just mark it explicitly and be safe...

Or another option is to tell sstate to ignore changes to the above variables 
with this simple line:

EXTRA_OECONF[vardepsexclude] = "STAGING_KERNEL_DIR"

This also does the trick, but I'm a bit worried there could be side-effects of 
using oprofile against the wrong kernel... Any recommendations?

-- 
Denys

