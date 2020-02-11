Return-Path: <bunk@stusta.de>
X-Greylist: delayed 376 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 11 Feb 2020 13:59:43 UTC
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 87EB560C70
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2020 13:59:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48H4462Wmyz3s;
	Tue, 11 Feb 2020 14:53:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1581429206;
	bh=OJ9tu9mn9yTMsOij1D14UPs1kyWrhwoSsq7SG+HEHX4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GIAVZVLJhwOkFecrT80UFDh9UkzZH7O8o0XPD9cBdLpgTXRhgQR22OwfLU36bFwLA
	A+VCF7oU5WNRm4Rm0wrEqdz+GFoDZ+CP4gwrsHEsaP8FO7y+XltaRVZDZhx1TZx1+r
	pPclmvyGCqvwJnYLjPPCTVSYkn7IDMu72QgqfNAVVeCHlbHKKwKoPM6oaVWFd0QKz6
	wDw1WBl9hIoWkvcQbw55c1RrPkQO+e5G3aHCEwaHvlTJHvWHzv+au6jM+c4zwW2OZI
	rA5xPS0Sx4dQGixA6Sk0sBdMWsZ0n38k8cCRff/5wChlKMDBW8fPOLLZz7E/YdYQK+
	qs5ltMJwRrKGykQZ6YK3upWNi1buGVk+PmnZL0TkWez/04U/YqcdygfJpXno/O3H7G
	9RyFoRbTIf/Kipxhl828a4QIRNIAg/9wBiocnzKGRDfb3Iq73SskDTBIT74l1nnWkM
	k3LYXSzTZuGB9VUjKPF+VgqwlLVjIKxCVINvCtUrYh7gKXnnf+tXvufV7AfECcyX6Y
	qB37M7Zc/7VSiUQKD1xxBTVfWi7w0+qkF/a9ss1FtwE1zkwIx++mdS8ePnGAc9glfe
	MxY+QzcIbMX+C+8qPkLQjJf1meWA3qIsgtzqSnTiwm7baRqxrnbZ7bwThOwZY2XjwW
	/aBAifXrYduh4X3IcaDxWhgc=
Date: Tue, 11 Feb 2020 15:53:23 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20200211135323.GA3234@localhost>
References: <CANNYZj-KS+mHQ20sQUv-SzpeaXjvAzQDPND00iuep6ek7utd5g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj-KS+mHQ20sQUv-SzpeaXjvAzQDPND00iuep6ek7utd5g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Future of sato and X in oe-core
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
X-List-Received-Date: Tue, 11 Feb 2020 13:59:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Feb 11, 2020 at 01:49:27PM +0100, Alexander Kanavin wrote:
>...
> - matchbox is reliant on gtk3 (to be obsoleted by gtk4 this year), and does
> not have a Wayland compositor. Yocto project does not have the resources to
> do the gtk4 port, or add a compositor.
> 
> - no 'lightweight Wayland compositor with a desktop/launcher experience"
> has emerged in the open source space; I think the only realistic choice at
> the moment is the reference compositor Weston which provides a blank
> desktop with ability to open terminal windows.
> 
> So the way I think things should be going (seeking opinions/inputs of
> course):
>...
> - oe-core continues to support and runtime-test X for as long as possible;
> for this a new image (say, 'core-image-sato-xorg') is created which will
> provide matchbox under X. However, once upstream bitrot sets in, and pain
> threshold is exceeded, this will be removed and/or relegated to a legacy
> layer.
> 
> Thoughts?

matchbox made sense at a time when you could go into a shop and buy an
internet tablet with Linux running on 256 MB flash with 256 MB RAM.

Part of the problem is that the only remaining usage of this branch
of matchbox development seems to be as example UI for Yocto.

For matchbox/sato I am wondering whether replacing it with parts of
meta-xfce from meta-openembedded would be a good way forward.

Upstream Xfce still seems to be 2-3 years away from gtk4 and Wayland 
support, but at the point where supporting X might become a problem
this should be available.

Xfce was my first thought as replacement since it appears to be 
well-maintained in meta-openembedded, no strong opinion whether
it is actually the best option.

> Regards,
> Alex

cu
Adrian

