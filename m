Return-Path: <mac@mcrowe.com>
X-Greylist: delayed 386 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 30 Apr 2015 14:35:09 UTC
Received: from smtpout.karoo.kcom.com (smtpout.karoo.kcom.com [212.50.160.34])
	by mail.openembedded.org (Postfix) with ESMTP id 9320D65CD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Apr 2015 14:35:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.11,677,1422921600"; d="scan'208";a="119724298"
Received: from deneb.mcrowe.com ([82.152.148.4])
	by smtpout.karoo.kcom.com with ESMTP; 30 Apr 2015 15:28:42 +0100
Received: from mac by deneb.mcrowe.com with local (Exim 4.80)
	(envelope-from <mac@mcrowe.com>)
	id 1YnpSE-0005Hc-9w; Thu, 30 Apr 2015 15:28:42 +0100
Date: Thu, 30 Apr 2015 15:28:42 +0100
From: Mike Crowe <mac@mcrowe.com>
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
Message-ID: <20150430142842.GA19899@mcrowe.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: libcap: make -e causing trouble
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
X-List-Received-Date: Thu, 30 Apr 2015 14:35:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

oe-core 51540b64f62234c145fc32cfa3fbbaaebbeece08 altered libcap.inc (at the
time) to append to EXTRA_OEMAKE rather than assign to it. The default value
for EXTRA_OEMAKE contains "-e". This means that the change caused "-e" to
be passed to make for the first time.

Unfortunately passing "-e" subtly changes the behaviour of libcap's
Make.Rules under recursive make when prefix="" (which it is for us since
we're using meta-micro.) Here's a snippet of Make.rules:

ifdef prefix
exec_prefix=$(prefix)
lib_prefix=$(exec_prefix)
inc_prefix=$(lib_prefix)
man_prefix=$(prefix)/share
else
prefix=/usr
exec_prefix=
lib_prefix=$(exec_prefix)
inc_prefix=$(prefix)
man_prefix=$(prefix)/share
endif

Without "-e" the prefix comes from the command line in both the parent and
submakes. This takes precedence over any attempt to reassign it with a
simple "=" operation so the headers are correctly installed in (empty
string)/include.

With "-e" the prefix still comes from the command line in the parent make
but from the environment in the submake. The attempt to assign it fails in
the parent make as before, but not in the submake so the headers are
installed incorrectly in /usr/include.

In all four cases the "ifdef prefix" else clause is executed.

The quick-and-easy fix for this is simply to pass prefix="${prefix}/" but
it's really just working around the problem.

Alternatively we could go back to assigning EXTRA_OEMAKE rather than
appending to it.

What would be the preferred course of action?

Thanks.

Mike.

