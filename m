Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9F4FF65C87
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 12:32:02 +0000 (UTC)
Received: by mail-qc0-f177.google.com with SMTP id c9so3441655qcz.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 05:32:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=DFQSdzx/IOcc/YBs/MjOaPwOqPTFZs0WDr0BNKpoQis=;
	b=huyaRlapT1+ARXaR+EdIebdl674W9RubwEKUUb5PyZrrDZPoHvQaCAAPMn7PnfdWIr
	hwZG+mZa1c2bwn1a3moXTNwRVgAxXGch97u30Cs+BGvgcNzT8o+7oC6/6Ivf0ZbpQf/w
	+70hRlpZhe1vI4XANNlur+Q7g/ofzq4eHFO2p9hYUi4ieYA33fMvqKdLjNuoOk2fb2mV
	iBHBPc/4Tl+VQMZHA76rQqm32dmOgo9lbFG4XUGBtHYuZo0OVNVmTSbO6zxoQA+AjtzL
	u/vCXuxBq3UTfi9xlDg89NL12yv2qdqndCO4txTJwzXefA4XPaepI32xhkFTKoQxc3iR
	+BwQ==
X-Gm-Message-State: ALoCoQnxgRgs2iEW7MxH5UmRSFbTzJ/nO8YNhVXk3vtHBEjKweIMHBwpH60Rxm+XiGnWIccYlcoM
X-Received: by 10.140.109.181 with SMTP id l50mr9837216qgf.80.1413808320163;
	Mon, 20 Oct 2014 05:32:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.93.65 with HTTP; Mon, 20 Oct 2014 05:31:39 -0700 (PDT)
In-Reply-To: <5444D3A5.7060208@windriver.com>
References: <cover.1413341569.git.Chong.Lu@windriver.com>
	<b2f5f79f9e08f008043508392775c2bb52f819b3.1413341569.git.Chong.Lu@windriver.com>
	<CAJTo0LboKNAOi7_tx31+m2KOxF_HEKEGePU2wnHXSzGpoeGTgA@mail.gmail.com>
	<5444D3A5.7060208@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 20 Oct 2014 13:31:39 +0100
Message-ID: <CAJTo0La=Q6Wx8dTBP6mc6A3=b-oXejiAX94dMtgon5aohA1GQg@mail.gmail.com>
To: Chong Lu <Chong.Lu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 1/1] gconf: fix multilib conflict - org.gnome.GConf.service
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
X-List-Received-Date: Mon, 20 Oct 2014 12:32:03 -0000
Content-Type: text/plain; charset=UTF-8

On 20 October 2014 10:19, Chong Lu <Chong.Lu@windriver.com> wrote:
> The data file is different between bit-32 and bit-64 environment.

And the data file is specific to the daemon, and you only want that
installed once.  Two gconf daemons will attempt to write the same data
file, resulting in corruption.

What I meant is this:
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=ross/gconf&id=fac86eb3f86618f109e3797422aae53d9c8d3b30.
Package the client-side libraries into a separate package, so you can
have gconfd, libgconf, and lib32-libgconf installed at once.  Both
client libraries will talk over DBus to the single gconfd binary.

(untested, and needs upgrade path dependencies added)

Ross

