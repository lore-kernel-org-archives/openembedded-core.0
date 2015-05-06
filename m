Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 18D4973F54
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 14:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t46ERsbw001393; Wed, 6 May 2015 15:27:54 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id DJQd82qime0A; Wed,  6 May 2015 15:27:54 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t46ERfQj001378
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 6 May 2015 15:27:53 +0100
Message-ID: <1430922461.8074.45.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Date: Wed, 06 May 2015 15:27:41 +0100
In-Reply-To: <1430921004-21983-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1430856401.8074.13.camel@linuxfoundation.org>
	<1430921004-21983-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v.4] kernel.bbclass: Fix race condition
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
X-List-Received-Date: Wed, 06 May 2015 14:27:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-05-06 at 17:03 +0300, Ed Bartosh wrote:
> Race condition between do_compile_kernelmodules and do_shared_workdir
> tasks occurs when do_compile_kernelmodules changes files in
> include/generated/* while do_shared_workdir tries to copy them to
> shared working directory.
> 
> Fixed race by moving do_shared_workdir after do_compile_kernelmodules.
> 
> [YOCTO #7321]
> 
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  meta/classes/kernel.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 125ed88..9207ae4 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -234,7 +234,7 @@ kernel_do_install() {
>  }
>  do_install[prefuncs] += "package_get_auto_pr"
>  
> -addtask shared_workdir after do_compile before do_install
> +addtask shared_workdir after do_compile_kernelmodules before do_install

Sorry to further discuss this, however I was thinking about something
Mike was saying about external kernel module builds causing kernel
builds in a different thread. 

The above will mean that external module builds depend on
do_compile_kernelmodules.

I therefore think we should do:

addtask shared_workdir after do_compile before do_compile_kernelmodules

since that will inflict less overhead on module builds.

Cheers,

Richard


