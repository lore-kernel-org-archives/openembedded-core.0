Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id D5EB977F76
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 03:30:42 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Nov 2017 19:30:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,339,1508828400"; d="scan'208";a="182227346"
Received: from tchin5-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.72.79])
	by fmsmga006.fm.intel.com with ESMTP; 29 Nov 2017 19:30:40 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Thu, 30 Nov 2017 16:27:59 +1300
Message-ID: <2245890.VsGoLmxMeA@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <7f75c29b-312b-2047-c002-a6c45b4b132b@windriver.com>
References: <7f75c29b-312b-2047-c002-a6c45b4b132b@windriver.com>
MIME-Version: 1.0
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: About auto-upgrade-helper's enhancement
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
X-List-Received-Date: Thu, 30 Nov 2017 03:30:43 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Robert,

FYI Anibal has left Intel; the AUH is now being worked on by Alex Kanavin (on 
CC).

On Thursday, 30 November 2017 3:23:25 PM NZDT Robert Yang wrote:
> I tried auto-upgrade-helper, it is very helpful when upgrade recipes.
> I'd like to make some enhancements to make it can be easily used by the
> maintainer (recipe upgrader) himself:
> 1) Don't send email when maintainer uses it, for example, when I want to
>     upgrade "strace", I don't need it send email to anyone.
> 2) Use git's user.name and user.email in git commit when not send email,
>     we need let the maintainer take responsible for it.

It's probably not just about not sending email - manually running the script 
without sending email is also useful when testing the AUH script during 
development so we'd need to switch usage of the git user/email a different 
way, but otherwise yes this seems reasonable. Probably we would just have some 
kind of local-only mode, possibly that's made the default (or can be 
configured to be).

> 3) Do the commit on the recipes when the upgrade is succeed, currently,
>     it keeps the commit when failed, but removed it when succeed.

No problem as long as it doesn't interfere with automated operation on the 
server.

> 4) Make upgradehelper.py can accept multiple recipes as args.

Seems reasonable yes.

> 5) It's a small tool and helpful when upgrade recipes, can we move it into
>     oe-core/scripts, please ?

So for manual (or should I say semi-automatic) recipe upgrades, our primary 
tool is "devtool upgrade" - at the moment it is true that there are things 
that the AUH can do that devtool upgrade can't (e.g. auto-detecting the latest 
upstream version, handling LIC_FILES_CHKSUM, etc.), but I believe Alex will be 
working on some of those and then will be moving the AUH to use devtool 
upgrade itself so that we don't have two codebases for the same task. We don't 
plan to deprecate manual usage of the AUH, but if there are use cases that 
devtool upgrade cannot currently handle, then assuming they fit I would like 
to handle them there first and point most users at devtool upgrade rather than 
manually running the AUH, since devtool upgrade is much more suited to 
enabling the work that follows on when an upgrade cannot be completed 
automatically.

Have you looked at devtool upgrade at all?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

