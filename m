Return-Path: <dmitry.rozhkov@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3F6BA77BC1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 13:30:42 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Apr 2017 06:30:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,230,1488873600"; d="scan'208";a="1122122792"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 21 Apr 2017 06:30:44 -0700
Received: from drozhkov-desk.fi.intel.com (drozhkov-desk.fi.intel.com
	[10.237.72.60])
	by linux.intel.com (Postfix) with ESMTP id 7242A6A4006;
	Fri, 21 Apr 2017 06:30:32 -0700 (PDT)
Message-ID: <1492781442.7102.13.camel@linux.intel.com>
From: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
To: Andreas Oberritter <obi@opendreambox.org>
Date: Fri, 21 Apr 2017 16:30:42 +0300
In-Reply-To: <20170421133747.4ba6e331@t510.zcs.saftware.de>
References: <20170421082534.30675-1-dmitry.rozhkov@linux.intel.com>
	<20170421133747.4ba6e331@t510.zcs.saftware.de>
X-Mailer: Evolution 3.22.6 (3.22.6-1.fc25) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman: fix race condition with systemd-udev
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
X-List-Received-Date: Fri, 21 Apr 2017 13:30:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-04-21 at 13:37 +0200, Andreas Oberritter wrote:
> On Fri, 21 Apr 2017 11:25:34 +0300
> Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com> wrote:
> 
> > When a new USB network interface is plugged in systemd
> > fails to rename the new interface (ethX) to a predictable
> > name [1] because connman locks it first.
> > 
> > The proposed solution is to blacklist unpredictable names
> > in connman in case systemd is used as an init system.
> > Also add a fix to connman that makes it to re-evaluate
> > a known but blacklisted ethernet interface for enabling
> > after it has got renamed.
> 
> Doesn't this break networking for everybody not using these
> "predictable" names?

Right, it does if systemd is configured not to use them. Though the
systemd recipe doesn't have such configuration option.
Also it might break if net.ifnames=0 is put in the kernel cmdline.

BR,
Dmitry

