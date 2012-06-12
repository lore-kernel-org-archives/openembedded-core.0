Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SeRha-0008N9-PE for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 16:04:10 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5CDrbJS010973
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 14:53:37 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10642-02 for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 14:53:33 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5CDrUTB010967
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 14:53:30 +0100
Message-ID: <1339509208.8065.8.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 12 Jun 2012 14:53:28 +0100
In-Reply-To: <cover.1339495723.git.lianhao.lu@intel.com>
References: <cover.1339495723.git.lianhao.lu@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH V2 0/3] Use openssh to provide sftp-server service
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
X-List-Received-Date: Tue, 12 Jun 2012 14:04:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-06-12 at 18:10 +0800, Lianhao Lu wrote:
> This patch set changes dropbear to openssh in the referenced core sato-sdk
> image to provide the sftp-server service which is required by some other 
> tools, e.g. the Eclipse Remote System Explorer.
> 
> The following changes since commit 0eddc176e73e74d4b1a7d3163d65f619fcd4baf0:
>   Saul Wold (1):
>         gnomebase: add GNOME_COMPRESS_TYPE variable
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib llu/ssh
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/ssh
> 
> Lianhao Lu (3):
>   task-core-ssh-openssh: Added openssh-sftp-server.
>   core-image-sato-sdk: Replace dropbear by openssh.
>   classes/image: Allow openssh empty passwords login.

There are some pieces in here I like but I'm not sure overall this is
the right way to make this work. For example, lets say I want to use the
eclipse tools with a plain sato image. Its hard for me to do this with
the patches as they stand. We need to take a step back and think how a
user is going to expect this to work.

I think what we need to do at the basic level is have something like an
IMAGE_FEATURE that we can turn on that pulls in the various IDE
integration pieces. In this case, it would explicitly add openssh/sftp
and we should use the package manager functionality to replace dropbear
with openssh when an image requests both.

This IMAGE_FEATURE would then be on by default for the -sdk image but
could easily be enabled for others.

Cheers,

Richard














