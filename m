Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 85B1960053
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 12:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8GCcNIc017800; Wed, 16 Sep 2015 13:38:23 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id RLwRmnnfmMN1; Wed, 16 Sep 2015 13:38:23 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8GCcAX5017784
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 16 Sep 2015 13:38:22 +0100
Message-ID: <1442407090.26666.64.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Wed, 16 Sep 2015 13:38:10 +0100
In-Reply-To: <6f49ee1c3fac0a39d8976d7c74000ad507031516.1442370259.git.liezhi.yang@windriver.com>
References: <cover.1442370259.git.liezhi.yang@windriver.com>
	<6f49ee1c3fac0a39d8976d7c74000ad507031516.1442370259.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] insane.bbclass: fix package_qa_check_buildpaths
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
X-List-Received-Date: Wed, 16 Sep 2015 12:38:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-09-15 at 19:28 -0700, Robert Yang wrote:
> * Ignore elf files because they usually contain build path:
>   - The path of the source file such as .c, these are usually happen
>     when separate B and S since we use absolute path to run configure
>     script, and then VPATH in Makefile will be an absolute path and
>     contains build path, we can use relative path in autotools.bbclass
>     to fix the problem, but we don't have to since they are harmless.
>   - The configure options such as "configure --with-libtool-sysroot"
>   - The compile options such as "gcc --sysroot"
>   These are harmless usually, so ignore elf files.

I'm not sure about this. Yes, elf files have large issues in the debug
symbols but the main elf files really shouldn't have build paths in
them. I understand they can creep in through a variety of sources
including B!=S but we should really be identifying them and fixing them,
not pretending they don't exist. The whole point of this check
originally was to get to the bottom of this!

> * Ignore "-dbg" and "-staticdev" package since symbols and .a files
>   usually contain buildpath.

Ideally, we should be fixing the debug code so its using target paths
rather than build ones too...

Cheers,

Richard

> * Ignore .a files too since they contain buildpath, this mainly for
>   ignoring:
>   glibc-2.21: glibc-dev/usr/lib/libc_nonshared.a
>   libgcc-4.9.3: libgcc-dev/usr/lib/x86_64-poky-linux/4.9.3/libgcc_eh.a
>   gcc-runtime-4.9.3: libssp-dev/usr/lib/libssp_nonshared.a
> 
> * Use full path rather than package_qa_clean_path() when report issue,
>   this makes it easier to find the file and fix the problem.
> 
> Then we will verify other warings and fix one be one.



