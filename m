Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A7F65607A5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jan 2016 17:58:15 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 01 Jan 2016 09:58:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,508,1444719600"; d="scan'208";a="22237163"
Received: from xlionelx-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.168.116])
	by fmsmga004.fm.intel.com with ESMTP; 01 Jan 2016 09:58:13 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Date: Sat, 02 Jan 2016 06:58:11 +1300
Message-ID: <3915097.5a95lnvstk@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.2.8-300.fc23.x86_64; KDE/4.14.14; x86_64; ;
	)
In-Reply-To: <5686447F.60200@topic.nl>
References: <568533E5.4000105@topic.nl> <56856023.5060407@linux.intel.com>
	<5686447F.60200@topic.nl>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Getting "menuconfig" to work again?
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
X-List-Received-Date: Fri, 01 Jan 2016 17:58:17 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Mike,

On Fri, 01 Jan 2016 10:18:55 Mike Looijmans wrote:
> On 31-12-15 18:04, Leonardo Sandoval wrote:
> > On 12/31/2015 07:58 AM, Mike Looijmans wrote:
> >> On 31-12-15 14:55, Mike Looijmans wrote:
> >>> When running a "menuconfig" (or any other task that needs a terminal),
> >>> bitbake just "stops" and doesn't show any terminal.
> >>> 
> >>> I'm using the current master branch of everything, on Ubuntu 15.
> >>> 
> >>> When running with "-D" I can see the following log:
> >>> 
> >>> DEBUG: Executing task do_menuconfig
> >>> DEBUG: Attempting to spawn terminal "custom"
> >>> DEBUG: No custom terminal (OE_TERMINAL_CUSTOMCMD) set
> >>> DEBUG: Attempting to spawn terminal "tmux-running"
> >>> DEBUG: Attempting to spawn terminal "tmux-new-window"
> >>> DEBUG: Attempting to spawn terminal "gnome"
> >>> 
> >>> But nothing happens from that point.
> >> 
> >> Extra info: apparently it spawns a process:
> >> 
> >> /usr/bin/python3 /usr/bin/gnome-terminal --version
> > 
> > gnome-terminal is a pain... there are some checks base on the version
> > and based on that certain parameters are set. which g-t version are you
> > using?
> 
> $ gnome-terminal --version
> GNOME Terminal 3.14.2
> 
> >> If I kill that process, the menuconfig magically appears.
> 
> Digging into the source code, I saw that "gnome-terminal --version" is
> only being called to determine if the "--disable-factory" option should
> be passed to it. For some reason, in OE that call "hangs", I suspect
> because of the way the environment and pipes are laid out at that point.
> 
> If I just run 'gnome-terminal -t hello --disable-factory -x sh' I don't
> get any errors and it works just fine. To me it looks like the whole
> version check could be removed and always pass "--disable-factory".

Unfortunately that's what we did earlier and it was fine until gnome-terminal 
stopped accepting that option. Perhaps it's now a no-op in the version you're 
using, I'm not sure; but in 3.10 they made it trigger an error.

It ought not to be too hard to fix the hanging - hopefully someone with a GNOME 
desktop installed (not me) can figure out what's happening there.

> Happy New Year!

Same to you! :)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

