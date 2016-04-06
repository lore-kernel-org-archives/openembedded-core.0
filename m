Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E783E769F8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 05:33:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u365Xrri009964
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 5 Apr 2016 22:33:54 -0700
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 5 Apr 2016 22:33:53 -0700
To: Charles Chan <charles.wh.chan@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <CAEDY82g1SD-4C1BVH6X2OJFkG9-KiqKSkRZzTKMUwu38dphvuw@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <57049FBF.1010504@windriver.com>
Date: Wed, 6 Apr 2016 13:33:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAEDY82g1SD-4C1BVH6X2OJFkG9-KiqKSkRZzTKMUwu38dphvuw@mail.gmail.com>
Subject: Re: Security question: base-files_3.0.14.bb and ${ROOT_HOME} directory permission
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
X-List-Received-Date: Wed, 06 Apr 2016 05:33:56 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


I think that it should be a bug, would you please try this patch?

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb 
b/meta/recipes-core/base-files/base-files_3.0.14.bb
index d391707..2082ed4 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -95,6 +95,7 @@ do_install () {
         for d in ${dirs755}; do
                 install -m 0755 -d ${D}$d
         done
+       chmod 0700 ${D}${ROOT_HOME}
         for d in ${dirs1777}; do
                 install -m 1777 -d ${D}$d
         done

// Robert

On 04/06/2016 01:03 PM, Charles Chan wrote:
> (This is my first post to OE list, hopefully I am posting to the right mailing
> list.)
>
> Background: During the process of trying to configure SSH keys for root user
> login via dropbear, we realized the permission for /home/root directory is set
> too loose for group and other members [1]. As a result, dropbears fails when we
> try to put the key under /home/root/.ssh
>
> ---------
>
> In the image, /home/root directory is set to 0755:
>
>     $ stat /home/root
>        File: /home/root
>        Size: 4096            Blocks: 8          IO Block: 4096   directory
>     Device: b302h/45826d    Inode: 13268       Links: 4
>     Access: (0755/drwxr-xr-x)  Uid: (    0/    root)   Gid: (    0/    root)
>     Access: 2016-04-05 22:21:13.000000000
>     Modify: 2016-04-05 22:08:57.000000000
>     Change: 2016-04-05 22:08:57.000000000
>
>
> After some debugging, we believe the permission (0755) is initialized in
> base-files_3.0.14.bb <http://base-files_3.0.14.bb> (in line 35) [2].
>
> A few questions:
> 1. I tried looking at the git log for the history, but wasn't able to find any
> background on why the permission was set this way. eg. on a desktop Linux
> (Ubuntu), /root is set to 0700:
>
>     $ sudo stat /root
>        File: `/root'
>        Size: 4096 Blocks: 8          IO Block: 4096   directory
>     Device: 801h/2049dInode: 1441793     Links: 3
>     Access: (0700/drwx------)  Uid: (    0/    root)   Gid: (    0/    root)
>     Access: 2016-04-05 21:29:17.389725228 -0700
>     Modify: 2016-03-22 17:11:54.912479000 -0700
>     Change: 2016-03-22 17:11:54.912479000 -0700
>       Birth: -
>
>
> 2. If we would like to override the directory permission for /home/root in our
> image, what is the best way to do it? I am not an expert with bitbake, should I
> be patching the base-files_3.0.14.bb <http://base-files_3.0.14.bb>? using
> *_append? or I should be looking at some other recipe altogether?
>
> Sorry for the long email. Thanks in advance.
> Charles
>
> [1] https://wiki.openwrt.org/doc/howto/dropbear.public-key.auth#troubleshooting
>
> [2]
> http://cgit.openembedded.org/cgit.cgi/openembedded-core/tree/meta/recipes-core/base-files/base-files_3.0.14.bb?h=master#n35
>
>

