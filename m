Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (unknown [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AFCA06FC0A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 23:12:35 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s4SNCOiP030681; Thu, 29 May 2014 00:12:24 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id LmkNkKzoEeaB; Thu, 29 May 2014 00:12:24 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s4SNCLeH030677
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 29 May 2014 00:12:23 +0100
Message-ID: <1401318733.2607.71.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Christopher Larson <clarson@kergoth.com>
Date: Thu, 29 May 2014 00:12:13 +0100
In-Reply-To: <CABcZANm0dkCh1zFysD6VjDLS-ijHGqNat=FRVTYf03SeUF4XDQ@mail.gmail.com>
References: <53843793.3030309@topic.nl>
	<CAMKF1sr1vGQf8WSvbeXE5SufAaDivpn7czr5EL-VWKhw9_drBg@mail.gmail.com>
	<CABcZANm0dkCh1zFysD6VjDLS-ijHGqNat=FRVTYf03SeUF4XDQ@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	"OE Core \(openembedded-core@lists.openembedded.org\)"
	<openembedded-core@lists.openembedded.org>
Subject: Re: How to find out why shared sstate is not being used for a recipe
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
X-List-Received-Date: Wed, 28 May 2014 23:12:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-05-28 at 13:46 -0700, Christopher Larson wrote:
> 
> On Wed, May 28, 2014 at 1:42 PM, Khem Raj <raj.khem@gmail.com> wrote:
>         On Mon, May 26, 2014 at 11:58 PM, Mike Looijmans
>         <mike.looijmans@topic.nl> wrote:
>         > I have a deja-vu feeling about this question.
>         >
>         > I have this recipe:
>         >
>         >
>         https://github.com/topic-embedded-products/meta-topic/blob/master/recipes-bsp/fpga/fpga-image-miami.bb
>         >
>         > Which includes this one:
>         >
>         https://github.com/topic-embedded-products/meta-topic/blob/master/recipes-bsp/fpga/fpga-image.inc
>         >
>         > I have a build server that exports its sstate-cache
>         directory through HTTP,
>         > and a local host that attempts to use that sstate-cache.
>         This works fine,
>         > except for the recipe above. Building this recipe takes
>         about 1 hour, so i
>         > really really really want to share that state at any cost.
>         As you can see,
>         > I've done a big shotgun blast of "vardepdsexclude" to get
>         the recipe to be
>         > as common as possible. Still any host wants to build its own
>         version.
>         >
>         > How can I diagnose the REASON that my machine thinks it
>         isn't building the
>         > exact same thing as the build server?
>         
>         
>         see https://wiki.yoctoproject.org/wiki/Enable_sstate_cache
>         towards the end it talks about verifying sstate sigs
> 
> 
> If the sstate is local at least, you can use bitbake -S printdiff
> <target>. There's also bitbake-whatchanged, but the bitbake one is
> superior.

Worst case, you can pull the siginfo files from one build and the
siginfo files from the sstate mirror and then see which ones are
different, then run bitbake-diffsigs X Y to compare the two files.

bitbake -S just tries to automate that process if it can.

Cheers,

Richard




