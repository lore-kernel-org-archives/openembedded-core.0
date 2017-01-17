Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id E0D6E71AFC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2017 12:59:41 +0000 (UTC)
Received: from [2a00:14f0:e04c:51ac:1106:b070:14df:254d] (helo=phil-desktop)
	by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.87)
	(envelope-from <pb@pbcl.net>)
	id 1cTTMQ-0005rU-QW; Tue, 17 Jan 2017 13:59:40 +0100
Message-ID: <1484657977.10018.78.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: "Maxin B. John" <maxin.john@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2017 12:59:37 +0000
In-Reply-To: <1461230647-19298-1-git-send-email-maxin.john@intel.com>
References: <1461230647-19298-1-git-send-email-maxin.john@intel.com>
X-Mailer: Evolution 3.22.1-2 
Mime-Version: 1.0
Subject: Re: [PATCH] busybox: update flock behavior to match upstream
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
X-List-Received-Date: Tue, 17 Jan 2017 12:59:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2016-04-21 at 12:24 +0300, Maxin B. John wrote:
> 
+-
> +-	if (argv[0])
> +-		return spawn_and_wait(argv);
> +-
> ++    if (argv[0]) {
> ++        cmd_args[0] = getenv("SHELL");
> ++        if (!cmd_args[0])
> ++            cmd_args[0] = (char*)DEFAULT_SHELL;
> ++        cmd_args[1] = (char*)"-c";
> ++        cmd_args[2] = argv[0];
> ++        cmd_args[3] = NULL;
> ++        return spawn_and_wait(cmd_args);
> ++    }
> + 	return EXIT_SUCCESS;
> + }
> 

This patch seems to completely break the behaviour of flock when
invoked without "-c".  For example, compare the behaviour of:

flock /tmp/lock echo it works

before and after.  Please revert this patch until and unless it can be
fixed.

p.


