Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 7612C6CE9E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 14:57:30 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9IEvQ2i032421; Fri, 18 Oct 2013 15:57:26 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ajRRUn--J6gw; Fri, 18 Oct 2013 15:57:26 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9IEvJBM032408
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 18 Oct 2013 15:57:20 +0100
Message-ID: <1382108236.29912.552.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Qi.Chen@windriver.com
Date: Fri, 18 Oct 2013 15:57:16 +0100
In-Reply-To: <83310635c381d335c132da1665c5568515dff386.1382082297.git.Qi.Chen@windriver.com>
References: <cover.1382082297.git.Qi.Chen@windriver.com>
	<83310635c381d335c132da1665c5568515dff386.1382082297.git.Qi.Chen@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] image_types.bbclass: add --numeric-owner option to tar command
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
X-List-Received-Date: Fri, 18 Oct 2013 14:57:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-10-18 at 15:47 +0800, Qi.Chen@windriver.com wrote:
> From: Chen Qi <qi.chen@windriver.com>
> 
> If the same username exists on both target and the build host, but
> the uids differ, and we start target via NFS, then the uid for the
> user will be incorrect on target.
> 
> For example, if postfix's uid on host is 119 and on target is 1024,
> then if we start target via NFS, the uid for postfix will be 119.
> 
> The root cause is that when we use runqemu-extract-sdk to generate
> the NFS rootfs for later use, the tar command will respect the username
> instead of uid. So if PSEUDO_PASSWD environment is not set correctly,
> the host /etc/passwd will be used, resulting in wrong uids.
> 
> The situation for gid is completely analogous to that of uid.
> 
> It's almost impossible for the runqemu-extract-sdk to guess the correct
> location of the needed password file merely based on the target tarball
> name.
> 
> This patch solves this problem by adding the '--numeric-owner' option
> to the tar command so that the username/groupname is not recorded in
> the tarball. In this situation, we'll always get the correct uid/gid
> after extracting the tarball.
> 
> [YOCTO #5364]
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/classes/image_types.bbclass |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Er, isn't the right fix to fix runqemu-extract-sdk to use numeric IDs
then rather than butcher all the tarballs we create?

Cheers,

Richard


