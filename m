Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4476F72002
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 17:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0NHrcMs009192; Mon, 23 Jan 2017 17:53:38 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id DGXWOP7-qFgV; Mon, 23 Jan 2017 17:53:37 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0NHrar1009188
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 23 Jan 2017 17:53:37 GMT
Message-ID: <1485194016.30673.45.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2017 17:53:36 +0000
In-Reply-To: <20170123164454.GT29778@windriver.com>
References: <20170123164454.GT29778@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: do_populate_sysroot: Function failed: relocatable_binaries_preprocess
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
X-List-Received-Date: Mon, 23 Jan 2017 17:53:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-01-23 at 11:44 -0500, Paul Gortmaker wrote:
> After updating this morning (everything on master, re-using the
> existing
> build dir that was built OK within the last 48h) I saw this:
> 
> ERROR: pseudo-native-1.8.1-r0 do_populate_sysroot: pseudo-native:
> chrpath command failed with exit code 7:
> b'/home/paul/poky/build/tmp/work/x86_64-linux/pseudo-native/1.8.1-
> r0/sysroot-destdir/home/paul/poky/build/tmp/work/x86_64-linux/pseudo-
> native/1.8.1-r0/recipe-sysroot-native/usr/bin/pseudodb:
> RPATH=/home/paul/poky/build/tmp/sysroots/x86_64-
> linux/usr/lib:/home/paul/poky/build/tmp/sysroots/x86_64-
> linux/lib\n'b"new
> rpath
> '$ORIGIN/../../../../../../../sysroots/x86_64-
> linux/usr/lib:$ORIGIN/../../../../../../../sysroots/x86_64-linux/lib' 
> too large; maximum length 107\n"
> ERROR: pseudo-native-1.8.1-r0 do_populate_sysroot: Function failed:
> relocatable_binaries_preprocess
> ERROR: Logfile of failure stored in:
> /home/paul/poky/build/tmp/work/x86_64-linux/pseudo-native/1.8.1-
> r0/temp/log.do_populate_sysroot.11

To follow up we've figured out this is the error you see if you take an
existing build directory, pre recipe specific sysroot and then update
to post recipe specific sysroot.

It seems that pseudo-native, openssl-native and subversion-native have
issues where you can pass in new configuration but they don't recompile
the binaries, despite those binaries depending on the paths you pass
in.

We're seeing how widespread the problem is before deciding exactly how
to handle this. It might be a case of some PR bumps, obvioulsy wiping
TMPDIR is the comprehensive solution.

Cheers,

Richard


