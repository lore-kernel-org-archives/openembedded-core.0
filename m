Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SsaAZ-0000En-1T
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Jul 2012 15:56:31 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:51715 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SsZzW-0008Lp-VN for openembedded-core@lists.openembedded.org;
	Sat, 21 Jul 2012 09:45:07 -0400
Date: Sat, 21 Jul 2012 09:44:56 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1207210937520.12672@oneiric>
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
Subject: what's the point of the "defconfig" arg to check_branch?
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
X-List-Received-Date: Sat, 21 Jul 2012 13:56:31 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  in the createme() kern-tools utility:

# checks and creates the branch that was indicated when creatme was
# called. This branch is what is expected to contain the kernel content
# being built
check_branch() {
	branch=$1
	defconfig=$2   <-- ??????

	ktgt=$branch

	old_pwd=`pwd`
	git show-ref --quiet --verify -- "refs/heads/$ktgt"
	if [ $? -eq 1 ]; then
		if [ "$repo" == "external" ]; then
			git checkout -b $ktgt
		fi
		mkdir -p $meta_dir/cfg/scratch/obj
	else
		# branch exists. Are we an 'external repo' ?
		if [ "$repo" == "external" ]; then
			git checkout $ktgt
		fi
	fi

	cd $old_pwd
}

  it doesn't seem like that second argument is being used, and i don't
see anything in the log that explains it, but perhaps i just missed
it.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


