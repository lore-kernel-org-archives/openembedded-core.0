Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1SNJc3-0007JG-3k
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Apr 2012 09:59:39 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 Apr 2012 00:50:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="133973580"
Received: from edwin-gen.sh.intel.com (HELO edwin-gen) ([10.239.36.17])
	by orsmga001.jf.intel.com with SMTP; 26 Apr 2012 00:49:59 -0700
Received: by edwin-gen (sSMTP sendmail emulation);
	Thu, 26 Apr 2012 15:53:22 +0800
Date: Thu, 26 Apr 2012 15:53:22 +0800
From: "Zhai, Edwin" <edwin.zhai@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20120426075321.GG1450@edwin-gen>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Pango multilib issue
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
X-List-Received-Date: Thu, 26 Apr 2012 07:59:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

RP,

I have found one common issues for multilib when system config file differ 
between multilibs.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=2356
This bug caused by modules mechanism in pango:

pango utils, pango-querymodules produce a system config file to indicate where
to find the modules when 1st boot, like /usr/{lib64|lib}/pango/1.6.0/modules/
for {x86-64|lib32}-pango respectively. 

When installing lib32-pango on sato-image-qemux86-64, lib32 version of
pango-querymodules override x86-64 version and produce a system config file
with path for lib32 version of modules. Then x86-64 matchbox-desktop failed to
open these modules and loaded corrupted fonts.

To resolve this conflict, one possible solution is put the config file and 
binary under different dir: $LIBDIR for config file, and 
/usr/{libexec|lib64exec} for config binary(or create different dir under 
/usr/bin/ for different multilib)

Any comments for this?

Thanks,


-- 
best rgds,
edwin


