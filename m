Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A13CF719E4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 12:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uASC4Rcl014886; Mon, 28 Nov 2016 12:04:27 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Zd7aZQv_UGew; Mon, 28 Nov 2016 12:04:27 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uASC4O1f014883
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 28 Nov 2016 12:04:26 GMT
Message-ID: <1480334664.28508.167.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
Date: Mon, 28 Nov 2016 12:04:24 +0000
In-Reply-To: <alpine.LFD.2.20.1611280544090.16875@localhost.localdomain>
References: <alpine.LFD.2.20.1611280544090.16875@localhost.localdomain>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: Re: ASSUME_PROVIDED versus SANITY_REQUIRED_UTILITIES versus "The Build Host Packages"
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
X-List-Received-Date: Mon, 28 Nov 2016 12:05:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2016-11-28 at 06:20 -0500, Robert P. J. Day wrote:
>   a bit confused by what i'm seeing in a recent
> qemuppc/core-image-minimal build on my fedora system regarding which
> native packages are built, despite what's in bitbake.conf (using
> current poky layer checkout).
> 
>   first, here's a snippet from bitbake.conf:
> 
>   ASSUME_PROVIDED = "\
>     bzip2-native \          <---
>     chrpath-native \
>     file-native \           <---
>     findutils-native \
>     git-native \
>     grep-native \
>     diffstat-native \
>     ... snip ...
> 
> suggesting that (among other things) bzip2-native and file-native
> shouldn't be built -- it's the developer's responsibility to install
> them, yes? but if i peek under tmp/work/x86_64-linux, i can see:

There are two ways "file-native" can be used in a build. It can be used
as the host provided "file" command and it is also needed by the file
recipe to build file for the target. We need to build file-native in
order for the build for the target file command to build/work. This is
why it gets built.

With bzip2, we need libbz2 (native) during the build process and we
don't ASSUME_PROVIDED libbz2-devel, hence it builds bzip2-native only
for that piece. Confusing perhaps but necessary unfortunately.

Cheers,

Richard


