Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EE86271F2D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Dec 2014 10:11:57 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 01 Dec 2014 02:11:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,493,1413270000"; d="scan'208";a="646120145"
Received: from fodonogx-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.21.108])
	by orsmga002.jf.intel.com with ESMTP; 01 Dec 2014 02:11:57 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Trevor Woerner <trevor.woerner@linaro.org>
Date: Mon, 01 Dec 2014 10:11:56 +0000
Message-ID: <11435118.DSGP9nSeOe@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.3-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <5478B0A0.80609@linaro.org>
References: <cover.1416934753.git.paul.eggleton@linux.intel.com>
	<5478B0A0.80609@linaro.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 0/7] Developer workflow improvements
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
X-List-Received-Date: Mon, 01 Dec 2014 10:12:01 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 28 November 2014 12:28:00 Trevor Woerner wrote:
> These tools are really nice! Some thoughts/comments:
> 
> Maybe the "devtool.conf" that gets created could be placed in the
> "conf/" subdirectory (along with the other configuration files such as
> local.conf and bblayers.conf)?

Yes, that's a good idea, I'll change that.
 
> Perhaps any recipe you're working on could be automatically included via
> an IMAGE_INSTALL_append in conf/local.conf (or maybe that's too intrusive?)?

This is something I'd wanted to do - it's certainly something that should be 
made easy, but I was concerned about causing a full reparse just because of 
adding that to local.conf. (There might be a workaround through some sort of 
packagegroup for containing the packages produced by the recipes in the 
workspace that is added once when we create the workspace - maybe that's the 
answer?)
 
> Do you envision users creating multiple workspaces? I'm wondering why
> "devtool create-workspace" is required. Is there any advantage to
> requiring users to create the workspace explicitly instead of just
> having it be created implicitly?

I wouldn't expect users to want to create multiple workspaces, but I did want 
users to be able to (a) choose where their workspace would go and (b) know 
that it has been created, so that the workspace layer showing up in the 
configuration isn't a surprise.
 
> Some of the commands to "devtool" include things like
>     - extract
>     - build
>     - deploy
>     - undeploy
> but when a workspace is created, devtool (very intelligently) adds the
> workspace to the set of BBLAYERS. So one could then just use bitbake to
> build the recipe. Are there any advantages to using "devtool build
> <recipe>" instead of "bitbake <recipe>"?

Not at the moment, although it is a convenient shortcut for "bitbake -c 
install <recipename>" (which is all you need to do for "devtool deploy" - note 
that "deploy" is distinct from our do_deploy, it could perhaps benefit from a 
better name). The other reason it's there is more for use as part of the SDK 
where the intention is to do everything through the devtool command, although 
that is a usage model that isn't enabled yet.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

