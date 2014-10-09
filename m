Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DAD6E6FC68
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Oct 2014 16:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s99G6v1N030622; Thu, 9 Oct 2014 17:06:57 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id TaWCSaa57oMF; Thu,  9 Oct 2014 17:06:57 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s99G6qFG030619
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 9 Oct 2014 17:06:53 +0100
Message-ID: <1412870846.871.12.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Lauren Post <Lauren.Post@freescale.com>
Date: Thu, 09 Oct 2014 17:07:26 +0100
In-Reply-To: <dd407026864c45e6b6fa6f6071469a83@CY1PR0301MB0700.namprd03.prod.outlook.com>
References: <e777247650f44526919fb4737b79b0a6@CY1PR0301MB0700.namprd03.prod.outlook.com>
	<dd407026864c45e6b6fa6f6071469a83@CY1PR0301MB0700.namprd03.prod.outlook.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Multiple issues building from dizzy or master
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
X-List-Received-Date: Thu, 09 Oct 2014 16:07:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-10-09 at 15:50 +0000, Lauren Post wrote:
> I've narrowed down that 1 or 2 updates on poky from 9/16 are causing my problems.     If I revert only these 2 commits my build problems are resolved.
> 
> In our build script on Jenkins we always build kernel, then uboot with a force deploy then our image then we build the image.  I see the errors when we build the  image.  I believe the force deploy might be part of the problem.  We do that so in case of dirty builds we always guarantee the kernel and uboot in the images directory (although I hit this with clean builds every time).  On local machine if I only build image I never see the problem, only when I build locally with our build script.
> 
> This gcc revision I believe is causing the db and gcc runtime issues.
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?h=dizzy&id=14ace86d508a5bdbb8139ce6af09de4d89b44595 
> 
> I also think this poky revision might be causing the fetch/unpack
> issues.  In this issue we fetch works based on log output, unpack
> fails and when I look at downloads I see the <package>.lock in the
> downloads directory.  Happens randomly on many components.  I'm doing
> a build with only gcc patch above to confirm if the unpack failures
> come back without this commit below reverted.
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?h=dizzy&id=7d80f8e9468253496a7097685aac8f468940a9c5

Do you have a link to the full error logs of the issue you're seeing? I
doubt this second commit would cause issues. It only affects the output
of bitbake -e when variable history tracking is enabled.

The first patch fixed several different problems but is is possible you
have a different race issue in your toolchain bootstrap process. Its
hard for me to comment without seeing the errors or knowning which
layers are involved.

Cheers,

Richard


