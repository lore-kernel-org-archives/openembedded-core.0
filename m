Return-Path: <tanu.kaskinen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 151737639E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 14:40:58 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 30 Jul 2015 07:40:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,577,1432623600"; d="scan'208";a="738848628"
Received: from tkkaskin-mobl3.ger.corp.intel.com (HELO [10.252.9.176])
	([10.252.9.176])
	by orsmga001.jf.intel.com with ESMTP; 30 Jul 2015 07:40:57 -0700
Message-ID: <1438267256.10150.43.camel@tkkaskin-mobl3.ger.corp.intel.com>
From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
To: Yuqing Zhu <b54851@freescale.com>
Date: Thu, 30 Jul 2015 17:40:56 +0300
In-Reply-To: <1438283162-12897-2-git-send-email-b54851@freescale.com>
References: <1438283162-12897-1-git-send-email-b54851@freescale.com>
	<1438283162-12897-2-git-send-email-b54851@freescale.com>
Organization: Intel Finland Oy - BIC 0357606-4 - PL 281, 00181 Helsinki
X-Mailer: Evolution 3.10.4 (3.10.4-4.fc20) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [poky][PATCH v5] pulseaudio: Revert "launch: Avoid specifically starting PA and rely on autospawn/socket activation"
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
X-List-Received-Date: Thu, 30 Jul 2015 14:40:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-07-31 at 03:06 +0800, Yuqing Zhu wrote:
> Pulseaudio is always started by autospawn, which is there is default process in system,
> it will start the pulseaudio daemon and the session is always exist, so pulseaudio daemon will be closed.
> 
> But in yocto, pulseaudio only can be started by boot up script, there is no process to start the pulseaudio daemon.
> But this patch remove the starting PA in script, then pulseaudio will be started in yocto.

Sorry, I don't understand what you're trying to say in the commit
message.

The patch indicates that you're having trouble with starting PulseAudio.
It looks like autospawning isn't working in your setup. The likely
explanations for that are that either you have disabled autospawning, or
you're trying to access PulseAudio as root.

If you have disabled autospawning, then to be able to offer advice, I'd
need to know why you have disabled it.

If you're trying to access PulseAudio as root, then I suppose you're
running a graphical session as root (start-pulseaudio-x11 is relevant
for graphical sessions only). That doesn't work out of the box, because
in multi-user environments running PulseAudio as root can easily cause
trouble for other users, so autospawning is not allowed for root. If
there are no regular users in the system, however, you can enable
autospawning for root by adding "allow-autospawn-for-root = yes" to
client.conf. The sato images use that option, see
pulseaudio-client-conf-sato.bb.

-- 
Tanu


