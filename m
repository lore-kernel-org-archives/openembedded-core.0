Return-Path: <Peter.Seebach@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1ECA871144
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 22:05:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0MM54RL004915
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 22 Jan 2015 14:05:04 -0800 (PST)
Received: from e6410-2 (172.25.40.227) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 22 Jan 2015 14:05:03 -0800
Date: Thu, 22 Jan 2015 16:05:00 -0600
From: Peter Seebach <peter.seebach@windriver.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20150122160500.68efde12@e6410-2>
In-Reply-To: <CAJTo0LYPQenCD2eMaSzPbaaUrky_Ta4cpnjFpN55D+BS5YzRJw@mail.gmail.com>
References: <cover.1421788745.git.peter.seebach@windriver.com>
	<b8134b991239e494b77a232bd723245d753c2734.1421788745.git.peter.seebach@windriver.com>
	<CAJTo0LYPQenCD2eMaSzPbaaUrky_Ta4cpnjFpN55D+BS5YzRJw@mail.gmail.com>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] pseudo_1.6.2.bb/pseudo_git.bb: Pseudo 1.6.3
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
X-List-Received-Date: Thu, 22 Jan 2015 22:05:06 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Thu, 22 Jan 2015 11:26:55 +0000
"Burton, Ross" <ross.burton@intel.com> wrote:

> This fails to build on *some* machines in the AB pool.
> 
> http://errors.yoctoproject.org/Errors/Search/Details/7899/1/10/a6ea28e3460217496856d2d79667c4bfbd867df9
> :
> 
> DEBUG: Executing shell function do_compile
> NOTE: Building/installing only 64-bit libpseudo.so for nativesdk-pseudo.
> NOTE: If you need to run 32-bit executables, ensure that NO32LIBS is set to
> 0.
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-pseudo/1.6.3-r0/pseudo-1.6.3/configure:
> line 72: cd: /opt/poky/1.7/sysroots/i686-pokysdk-linux/usr: No such file or
> directory
> ERROR: Prefix is current directory. That doesn't work.

D'oh.

Okay, so what's happening here is, I added a configure test to try to detect
cases where --prefix=foo was the current directory. Which, of course, does
$(cd $prefix; pwd).

And that won't work if the prefix directory doesn't exist at the time of
compilation.

I'll get a fix for that in shortly. Sorry!

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.

