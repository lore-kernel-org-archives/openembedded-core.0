Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 99271723B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 14:11:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t2PEBLcm013002
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 07:11:22 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.224.2; Wed, 25 Mar 2015 07:11:21 -0700
Message-ID: <5512C214.4090309@windriver.com>
Date: Wed, 25 Mar 2015 09:11:32 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <20150325134027.GA19408@saldanha.aker.com.br>
In-Reply-To: <20150325134027.GA19408@saldanha.aker.com.br>
Subject: Re: initscripts + fsck.busybox problem
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
X-List-Received-Date: Wed, 25 Mar 2015 14:11:21 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 3/25/15 8:40 AM, Hugo Vasconcelos Saldanha wrote:
> Hi all,
> 
> Everytime my image boots, the following error message is printed:
> 
> fsck (busybox 1.23.1, 2015-03-14 10:13:03 BRT)
> 
> Invalid non-numeric argument to -C ("-y")
> 
> It seems that checkroot.sh script from initscripts package is
> calling the command "fsck -C -y". checkfs.sh script, apparently not
> installed by default, does the same. The problem is that busybox's fsck
> needs an argument to -C option, which is not needed by util-linux and
> e2fsprogs' versions of the tool.
> 
> Possible approaches that I can think of:
> 
> 1) Fixing the scripts, maybe removing references to -C option
> altogether.
> 
> 2) Placing a RDEPENDS in initscripts' recipe.
> 
> What do you think about it?
> 

From the util-linux man page on the -C option:

GUI front-ends may specify  a
              file  descriptor  fd, in which case the progress bar information
              will be sent to that file descriptor.

So the fd option is supposed to be optional.  I'd recommend in this case the bug
is with busybox, and someone submit a patch to make the fd optional in busybox.
 (default going to stdout)

--Mark

