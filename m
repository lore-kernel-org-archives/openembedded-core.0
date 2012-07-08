Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1Snw35-0003oD-Rk
	for openembedded-core@lists.openembedded.org;
	Sun, 08 Jul 2012 20:17:36 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63]:49424 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SnvsL-0002Hk-6J for openembedded-core@lists.openembedded.org;
	Sun, 08 Jul 2012 14:06:29 -0400
Date: Sun, 8 Jul 2012 14:06:18 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <alpine.DEB.2.02.1207071435090.25344@oneiric>
Message-ID: <alpine.DEB.2.02.1207081405290.28471@oneiric>
References: <alpine.DEB.2.02.1207071435090.25344@oneiric>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: setting EXTRA_IMAGE_FEATURES explicitly in .bb file can screw things up
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
X-List-Received-Date: Sun, 08 Jul 2012 18:17:36 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sat, 7 Jul 2012, Robert P. J. Day wrote:

>   a while back, i whined about the inconsistent usage of
> EXTRA_IMAGE_FEATURES, like this as a snippet:
>
> meta/recipes-sato/images/core-image-sato-sdk.bb:EXTRA_IMAGE_FEATURES += "tools-debug tools-profile tools-testapps debug-tweaks"
> meta/recipes-rt/images/core-image-rt-sdk.bb:EXTRA_IMAGE_FEATURES += "tools-debug tools-profile tools-testapps debug-tweaks"
> meta/recipes-extended/images/core-image-lsb-sdk.bb:EXTRA_IMAGE_FEATURES = "tools-debug tools-profile tools-testapps debug-tweaks"
>
> notice the mixing of "+=" and "=", which seems messy.  then i ran
> across this in core-image-lsb-sdk.bb:
>
> IMAGE_FEATURES += "apps-console-core tools-sdk dev-pkgs ssh-server-openssh"
> EXTRA_IMAGE_FEATURES = "tools-debug tools-profile tools-testapps debug-tweaks"
>
>   that *can't* be right, can it?  the explicit setting of
> EXTRA_IMAGE_FEATURES in that recipe file will override any such
> setting in one's local.conf file, won't it?  and that's how the
> current manual *advises* how to add more features through your
> local.conf.
>
>   i tested this target with a standard local.conf, and checked the
> environment to see:
>
> ... snip ...
> IMAGE_FEATURES="apps-console-core debug-tweaks tools-sdk
> tools-testapps dev-pkgs tools-profile tools-debug ssh-server-openssh"
>
> which looks fine according to the .bb file.
>
>   but if i add the following to my local.conf file (as the manual
> suggests i do to add another feature):
>
> EXTRA_IMAGE_FEATURES = "nfs-server"
>
> i see *no* difference in the environment.  hasn't the setting in the
> .bb file overridden the one in my local.conf?
>
>   i *can* get nfs-server added to my list of features with
> (predictably):
>
> IMAGE_FEATURES += "nfs-server"
>
> but that doesn't strike me as a proper solution and will certainly
> come as an unpleasant surprise to someone eventually.

  i'm still curious if this is a potential issue, or whether i'm just
misreading/misunderstanding.  thoughts?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


