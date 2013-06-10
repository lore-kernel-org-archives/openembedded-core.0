Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 60AD061FD2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 14:04:04 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Jun 2013 07:03:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,837,1363158000"; d="scan'208";a="351094899"
Received: from unknown (HELO helios.localnet) ([10.252.122.12])
	by orsmga002.jf.intel.com with ESMTP; 10 Jun 2013 07:03:45 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: John Stirling <ap.john.stirling@gmail.com>
Date: Mon, 10 Jun 2013 15:03:44 +0100
Message-ID: <1742399.JSmCq3b5r2@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.3 (Linux/3.8.0-23-generic; KDE/4.10.3; i686; ; )
In-Reply-To: <CABuzA3OXwzQBeYJ4D5kGYANTNykOPnOR4BDrj3=y9TauD1Z5hg@mail.gmail.com>
References: <CABuzA3PAguwK=KW7xnoe6PJqASWZXktBLB5LTs7LHcw5mopXJQ@mail.gmail.com>
	<1442698.2y5IVPznBc@helios>
	<CABuzA3OXwzQBeYJ4D5kGYANTNykOPnOR4BDrj3=y9TauD1Z5hg@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: qt4-embedded - image size
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
X-List-Received-Date: Mon, 10 Jun 2013 14:04:05 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 10 June 2013 14:46:57 John Stirling wrote:
> Looking fairly promising so far. Image size down from 280Mb to 90Mb and
> only Qt related stuff now seems to be in /usr/lib/
> 
> The font's seem to be missing though -
> QFontDatabase: Cannot find font directory /usr/lib/fonts - is Qt installed
> correctly?
> We won't need all the fonts in any case but would you expect them to have
> been pulled in automatically ?

Right, for Qt/E if you are displaying any text you'll need to explicitly 
install the package for this since nothing depends upon it. You can install 
the qt4-embedded-fonts package which brings in all fonts that are distributed 
with Qt, or alternatively you can install only the fonts you want (qt4-
embedded-fonts-ttf-vera, etc.)
 
> Pretty sure I need the first 3, but not sure about the rest. Does that look
> about right to you size wise ? We're just trying to tie down flash sizes at
> the moment and want to get a fairly accurate estimate for Qt.

This looks reasonable to me. Note however if you start changing some of the 
build-time configuration options for Qt you may be able to disable a few things 
you don't need. Have a look at Qt's configuration options [1]. You can see 
exactly which options are being used to build Qt with:

bitbake -e | grep "^QT_CONFIG_FLAGS="

If you search for QT_CONFIG_FLAGS under meta/recipes-qt/qt4/ you'll see how 
this variable gets set.

> I guess also at some point we might want to switch to Qt5. Is that
> comparable in size ?

Not sure I'm afraid, although I believe it is more modular so in theory you 
should be able to cut out more pieces you don't need.

Cheers,
Paul

[1] http://qt-project.org/doc/qt-4.8/configure-options.html

-- 

Paul Eggleton
Intel Open Source Technology Centre

