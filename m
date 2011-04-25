Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QEEK1-0002b7-Gi
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Apr 2011 07:26:57 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 24 Apr 2011 22:24:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,264,1301900400"; d="scan'208";a="737953436"
Received: from unknown (HELO [10.255.12.237]) ([10.255.12.237])
	by orsmga001.jf.intel.com with ESMTP; 24 Apr 2011 22:24:27 -0700
Message-ID: <4DB5058B.3090904@linux.intel.com>
Date: Sun, 24 Apr 2011 22:24:27 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: "Cui, Dexuan" <dexuan.cui@intel.com>
References: <4DB48532.3030605@linux.intel.com>
	<1865303E0DED764181A9D882DEF65FB69317AB0ED9@shsmsx502.ccr.corp.intel.com>
	<1865303E0DED764181A9D882DEF65FB69317AB0EDB@shsmsx502.ccr.corp.intel.com>
In-Reply-To: <1865303E0DED764181A9D882DEF65FB69317AB0EDB@shsmsx502.ccr.corp.intel.com>
Cc: "'poky@yoctoproject.org'" <poky@yoctoproject.org>,
	'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Re: gdb and lttng-ust 0.12
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
X-List-Received-Date: Mon, 25 Apr 2011 05:26:57 -0000
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 8bit

On 04/24/2011 10:14 PM, Cui, Dexuan wrote:
> Hi Saul,
> I prefer "continue with UST disabled in gdb" for now.
> 
Ok, I have a patch queue'ed up already with this fix, I will push it as
part of a consolidated request later tonight.

> I'm investigating more to get an in-depth understanding about the issue. e.g., ust-0.11 doesn't break building gdb while ust-0.12 does -- however both 0.11 and 0.12 install /usr/include/ust/.
>
I agree, I am not sure why this is happening also, I thought that I did
installs of 0.11 and did not see the ust directory, maybe I did not
force or something.  Maybe diff the marker.h files and see if there are
differences?

Sau!


> Thanks,
> -- Dexuan
> 
> -----Original Message-----
> From: Cui, Dexuan
> Sent: 2011年4月25日 9:57
> To: 'Saul Wold'; 'Patches and discussions about the oe-core layer'
> Cc: poky@yoctoproject.org
> Subject: RE: gdb and lttng-ust 0.12
> 
> Hi Saul,
> Thanks very much for the investigation!
> I can reproduce the issue now when I build gdb after building lttng-ust (previously looks I built them in the reverse order, so didn't catch it.)
> 
> I haven't understood why this issue occurred after I upgraded ust from 0.11 to 0.12 as 0.11 actually installs /usr/include/ust, too. And gdb was not upgraded recently.
> 
> I'm looking into this now and will update asap.
> 
> Thanks,
> -- Dexuan
> 
> -----Original Message-----
> From: Saul Wold [mailto:sgw@linux.intel.com]
> Sent: 2011年4月25日 4:17
> To: Cui, Dexuan; 'Patches and discussions about the oe-core layer'
> Cc: poky@yoctoproject.org
> Subject: gdb and lttng-ust 0.12
> 
> 
> Dexuan,
> 
> It seems that when you updated lttng-ust to 0.12, it installed an
> /usr/include/ust directory that GDB now finds.  This caused the
> gdbserver code to not build.
> 
> I investigated this and it seems to be due to gdb having a dependency on
> UST that causes GDB not to compile.  I think at this point we may want
> to continue with UST disabled in gdb.
> 
> To reproduce this, ensure that lttng-ust-0.12 is built before building
> gdb and you should see a compilation failure.
> 
> My concern here is that if fix the GDB compilation failures, what else
> is going to fail as far as debugging with UST enabled on the remote, I
> know this feature is something we want, and should probably report to
> the GDB upstream.
> 
> The fix seems to be as simple as adding "--without-ust" to the gdb
> EXTRA_OECONF line.
> 
> Comments?
> 


