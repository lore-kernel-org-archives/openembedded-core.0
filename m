Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QNMhO-0001OW-Gx
	for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 12:12:51 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 20 May 2011 03:09:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,241,1304319600"; d="scan'208";a="439664785"
Received: from unknown (HELO helios.localnet) ([10.255.16.165])
	by azsmga001.ch.intel.com with ESMTP; 20 May 2011 03:09:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>, 
	Joshua Lock <josh@linux.intel.com>
Date: Fri, 20 May 2011 11:09:49 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <cover.1305737923.git.chris_larson@mentor.com>
	<1305849778.9983.29.camel@vorpal.jf.intel.com>
In-Reply-To: <1305849778.9983.29.camel@vorpal.jf.intel.com>
MIME-Version: 1.0
Message-Id: <201105201109.50052.paul.eggleton@linux.intel.com>
Subject: Re: [PATCH (v2,resend) 0/3] Rework the devshell
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
X-List-Received-Date: Fri, 20 May 2011 10:12:51 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday 20 May 2011 01:02:58 Joshua Lock wrote:
> Speaking of devshell, last I tried (and Paul E can correct me here)
> Konsole doesn't wait when it's spawned so is currently pretty useless
> for devshell (bitbake continues as if the devshell had finished and if a
> patch hasn't applied....).

I can confirm this - right now our Konsole support just does not work and I 
imagine it has not since KDE 4.0. Adding the --nofork command line option 
which is supposed to make it wait does not work either, because if the 
controlling terminal is not interactive it assumes there is no other instance 
of Konsole running, tries to register a DBUS service and fails (and it's hard 
to imagine someone using KDE and running bitbake without having an instance of 
Konsole running already).
 
> Perhaps we should remove support for it from the class? Or is there some
> better way we can work around this?

A while ago I had a look adding a command line option to Konsole itself to 
make this work but didn't get very far, although I don't think it should be 
too difficult. There is a workaround script [1] but when I tried it just now I 
found it again has problems if the controlling terminal is not interactive 
(never returns). Frankly the script is hideous and maybe it was broken in a 
version of KDE since the script was written, I don't know.

It might be prudent to remove the Konsole support until it has been fixed 
appropriately; at the very least it should be documented to only work with 
Konsole from KDE 3.x.

FYI the "workaround" I use here for the moment (if I don't just disable the 
feature with PATCHRESOLVE = "noop") is to use xterm instead of Konsole for 
TERMCMD and TERMCMDRUN.

Cheers,
Paul

[1] http://lists.kde.org/?l=kde-core-devel&m=123188146810950&w=2


