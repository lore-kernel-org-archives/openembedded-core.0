Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 05EC760290
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 11:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0PBO6W0021641; Wed, 25 Jan 2017 11:24:06 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id igavd7ZtldRA; Wed, 25 Jan 2017 11:24:06 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0PBO1ok021636
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 25 Jan 2017 11:24:02 GMT
Message-ID: <1485343441.30673.84.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Kristian Amlie <kristian.amlie@mender.io>, OE-core
	<Openembedded-core@lists.openembedded.org>
Date: Wed, 25 Jan 2017 11:24:01 +0000
In-Reply-To: <18981a79-4241-83a1-a1a8-3eddf941c346@mender.io>
References: <18981a79-4241-83a1-a1a8-3eddf941c346@mender.io>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: Overriding fixmepath
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
X-List-Received-Date: Wed, 25 Jan 2017 11:24:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-01-25 at 11:43 +0100, Kristian Amlie wrote:
> After the new recipe sysroots were introduced we've been having
> trouble
> compiling Go. I've narrowed it down to the path replacement mechanism
> that goes on using fixmepath.
> 
> For example, this does not work:
> 
>   bitbake -c cleansstate go-cross
>   bitbake go-cross
> 
> But this does:
> 
>   bitbake -c cleansstate go-cross
>   bitbake -c prepare_recipe_sysroot go-cross
>   rm -rf
> /home/jenkins/workspace/yoctobuild/build-qemu/tmp/work/x86_64-
> linux/go-cross/1.7.4-r0/recipe-sysroot-native/usr/lib/go-bootstrap-
> native-1.4.3
>   cp -r
> /home/jenkins/workspace/yoctobuild/build-qemu/tmp/sysroots-
> components/x86_64/go-bootstrap-native/usr/lib/go-bootstrap-native-
> 1.4.3
> /home/jenkins/workspace/yoctobuild/build-qemu/tmp/work/x86_64-
> linux/go-cross/1.7.4-r0/recipe-sysroot-native/usr/lib/go-bootstrap-
> native-1.4.3
>   bitbake go-cross
> 
> IOW, if I replace the recipe sysroot with the originals, it works,
> but
> if I keep the modified files put there by the prepare_recipe_sysroot
> task, it doesn't.
> 
> And this is where I admittedly get a bit lost: I haven't fully
> understood how the fixmepath mechanism operates, but from what I can
> tell, this path replacement is not appropriate for Go. It doesn't
> care
> where it's installed, and always operates relative to the GOROOT
> environment variable, which is set by all Go recipes.

Does this still work if you remove the
/home/jenkins/workspace/yoctobuild/build-qemu/tmp/sysroots-
components/x86_64/go-bootstrap-native directory before building go-
cross? I worry that its actually referencing the other location and
using files from there (a different recipe's workdir) and that
therefore there are a different set of other problems this recipe also
has.

> Why the path replacement triggers an error I cannot say, but I
> suspect it has to do with the fact that Go object files are a bit
> special compared to C object files, and this operation in fact
> corrupts them. More mysterious still is why this happens only on some
> build machines, and not others, but once triggered it appears to be
> consistently triggered.

The fixmepath replacements only happen on text files. It could be some
relocation is needed on the binaries too, perhaps through configuration
on the commandline or perhaps through the environment. We have had to
patch some tools to allow relocation in the past too.

> Any advice for what to do next? I could try to skip the fixmepath
> operation completely, but I'm not sure how, and it feels a bit like
> using a sledgehammer where I should be using a scalpel.

Try removing the path I suggested after copying and see if it still
works. If it does, I'd probably try and find which subset of the files
breaks it, narrow down the issue. If removing it breaks things, there
is a whole world of bigger issues :(

Its possible to add specific inclusions/exclusions from fixmepath FWIW
but we need to understand more about what is happening first.

Cheers,

Richard





