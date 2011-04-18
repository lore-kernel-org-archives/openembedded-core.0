Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QBiKA-00072C-LM
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Apr 2011 08:52:42 +0200
Received: by fxm19 with SMTP id 19so3278480fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Apr 2011 23:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=Pcx8qSa0rqPvBrvFXtSOCpNilAtEbGsQOaDYSse04OE=;
	b=VRFstFW3jaJhZ5cjTWERPofzJRPSF6YmWokSOJIXPHwSjIhPeEmeur97l5N3t2i4xP
	vAHwliyDmATDrAG8LTkVdQ3tgwGKcP2faPXm0grGGmfEfC0RHLqiSNHqA8B1Dioglws+
	gcJTdbbswt626CcehIO+VlZSsgoM59/4j17JU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=X8etBf/wwBsLR64Ah8/hTScc8f8PiXmC5tOWi6QhHbSet4otKq9cGvpuCvXt0Bndmm
	QERiBQZlTVjESoKd8zISSTi6zco2VQYtLG5An8ZbQFPcxhRxynl4FzGaJrkczlthaDgC
	+8OgcJqh5kiOXv/hE4ZiX+4OZsVkwzCG0AAyk=
Received: by 10.223.66.70 with SMTP id m6mr4650761fai.34.1303109420378;
	Sun, 17 Apr 2011 23:50:20 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id b18sm1556805fak.8.2011.04.17.23.50.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 17 Apr 2011 23:50:19 -0700 (PDT)
Date: Mon, 18 Apr 2011 08:50:13 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110418065013.GI25122@jama.jama.net>
References: <1303107421.5518.45.camel@rex>
MIME-Version: 1.0
In-Reply-To: <1303107421.5518.45.camel@rex>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: RFC: Layer tooling brainstorming
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Apr 2011 06:52:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 18, 2011 at 07:17:01AM +0100, Richard Purdie wrote:
> Layer Tooling for OpenEmbedded
> ==============================
> 
> As we move forward with encouraging the use of metadata layers, a number
> of issues are appearing which imply the need for either infrastructure
> improvements to the layer construction, or better tools to handle the
> layers. The OS TSC discussed layers and layer tooling at the face to
> face TSC meeting in San Francisco. Some example problems that were
> identified that currently need addressing in some form are:
> 
> * There is no dependency information between layers (layer X depends on 
>   layer Y and Z)
> * There is no version information present (layer X needs version A of 
>   layer Y)
> * There is no layer "ABI" version number present in layers
> * Layer specific sanity checks? (other types of sanity checks on Yocto 
>   1.1 roadmap)
> * Ability to fetch layers from other repositories
>   - Multi SCM?
>   - Use bitbake fetcher?
> * Ability to generate repositories representing composited layers (Poky,
>   RP has hacky scripts)
> * Tool to seperate patch into one for different composited parts
> * Ability to include partial components of repositories (e.g. only 
>   beagleboard from meta-ti)
> * Tool to merge (flatten) several layers into one
> * Able to visualise dependencies between layers
> * When bitbake prints banner of branch/commit, need to cover all layer 
>   components present
> * bitbake -e on steroids to highlight differences due to layer changes? 
>   (long term goal)

maybe I've missed something, but
* Parsing error when ie foo_1.0.bbappend is found, but foo_1.0.bb in
  upper layer was upgraded to foo_1.1.bb

This can cause big problems when distribution explicitly enables
something in .bbappend with EXTRA_OECONF, and someone updates all
layers, builds foo_1.1.bb and installs it on targets before noticing
that foo_1.0.bbappend wasn't used. Then he has to bump PR after adding
foo_1.1.bbappend to distro layer (to fix foo on targets), so I would
prefer parsing error in this case (won't help if upper layer keeps both
versions foo_1.0.bb and foo_1.1.bb ;/).

This should be combined with your 2nd point and person who changes
versioned dependency on upper layer should check that all needed
.bbappends still apply.

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


