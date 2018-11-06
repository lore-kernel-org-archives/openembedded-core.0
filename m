Return-Path: <mac@mcrowe.com>
Received: from avasout02.plus.net (avasout02.plus.net [212.159.14.17])
	by mail.openembedded.org (Postfix) with ESMTP id 595BC79DA7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Nov 2018 19:06:47 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by smtp with ESMTP
	id K6gYgnG3fx6b6K6gZgvftV; Tue, 06 Nov 2018 19:06:47 +0000
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=T4GiscCQ c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=kj9zAlcOel0A:10 a=JHtHm7312UAA:10 a=vERi7cJm6jB79rXuiSAA:9
	a=CjuIK1q_8ugA:10
Received: from mac by deneb with local (Exim 4.89)
	(envelope-from <mac@mcrowe.com>)
	id 1gK6gX-0004DZ-SZ; Tue, 06 Nov 2018 19:06:45 +0000
Date: Tue, 6 Nov 2018 19:06:45 +0000
From: Mike Crowe <mac@mcrowe.com>
To: Steffen Sledz <sledz@dresearch-fe.de>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20181106190645.4xgvktwoyfuzgmby@mcrowe.com>
References: <99949e3e-c252-9504-ea89-f379bab6f021@dresearch-fe.de>
	<CAMKF1soU6M4zv6Xu4ugwheBHGO49cZSnnOD-PWSWJsCaAJC28g@mail.gmail.com>
	<a212aa5f-27a7-3181-cab8-c07fa5eca72a@dresearch-fe.de>
	<d45d83de-c360-6306-d35a-1388fdbd518a@dresearch-fe.de>
	<04a430ad-567a-d9d3-8a17-77e2dd55d025@dresearch-fe.de>
MIME-Version: 1.0
In-Reply-To: <04a430ad-567a-d9d3-8a17-77e2dd55d025@dresearch-fe.de>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CMAE-Envelope: MS4wfKSFQXyBZfmplQJch6u8Sy7k8xMBNAx8zOlGq6b5VFWinJhmT+0V0aGdwMsvzKCWUgvPawlSdyoWPuoqwMiFHEwoqFWTPVLf5K2BIb0bhjz/BazamEO+
	M6DM9Eh0LcmA+HZwgjdG1GTp1qkOLgH3HvzZcLy23DrYoNBPugyFEk99
Subject: Re: devshell problems after distro upgrade openSUSE Leap 42.3 -> 15.0 (tmux only)
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
X-List-Received-Date: Tue, 06 Nov 2018 19:06:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Monday 16 July 2018 at 08:19:11 +0200, Steffen Sledz wrote:
> On 04.07.2018 13:37, Steffen Sledz wrote:
> > On 03.07.2018 08:04, Steffen Sledz wrote:
> >> On 02.07.2018 20:25, Khem Raj wrote:
> >>> On Sun, Jul 1, 2018 at 11:39 PM Steffen Sledz <sledz@dresearch-fe.de> wrote:
> >>>>
> >>>> After upgrading my build system from openSUSE Leap 42.3 to openSUSE Leap 15.0 a
> >>>>
> >>>>   bitbake foo -c devshell
> >>>>
> >>>> no longer switches to the related work directory. The devshell is opened in the original directory without any error or warning instead.
> >>>>
> >>>> Any hints what's wrong here or how I can debug this behaviour?
> >>>>
> >>>
> >>> which terminal are you using, probably some default behavior changes there ?
> >>
> >> Main terminal is xterm. No special settings for the devshell terminal, so tmux is started like before.
> > 
> > 
> > After some more tests I can limit the problem to OE_TERMINAL="tmux". Other terminals like screen or xterm work well.
> > ...
> 
> 
> Ping!

The same problem happens with Debian Buster (currently "testing".) I was
unable to reproduce the problem when running

 (cd subdirectory && tmux split-window)

from a shell prompt.

However, I managed to fix it with the following patch. I'm not sure whether
this means there's a bug in tmux though. Since I can't reproduce the
problem outside OE, it's rather difficult to report it.

Mike.

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 94afe394ed..291238b6cb 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -117,10 +117,11 @@ class Screen(Terminal):
 class TmuxRunning(Terminal):
     """Open a new pane in the current running tmux window"""
     name = 'tmux-running'
-    command = 'tmux split-window "{command}"'
+    command = 'not-ready-yet'
     priority = 2.75

     def __init__(self, sh_cmd, title=None, env=None, d=None):
+        self.command = 'tmux split-window -c "%s" "{command}"' % os.getcwd()
         if not bb.utils.which(os.getenv('PATH'), 'tmux'):
             raise UnsupportedTerminal('tmux is not installed')

