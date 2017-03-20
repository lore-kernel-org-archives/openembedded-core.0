Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id CF3AA719F7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 12:12:40 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id C169C68A019; Mon, 20 Mar 2017 12:12:40 +0000 (GMT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_20,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 28E9568A01B;
	Mon, 20 Mar 2017 12:12:40 +0000 (GMT)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id DB1846740276;
	Mon, 20 Mar 2017 13:12:39 +0100 (CET)
To: OE-core <openembedded-core@lists.openembedded.org>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <597a60bd-e1a7-c832-3f95-13464ca8ebd2@mlbassoc.com>
Date: Mon, 20 Mar 2017 13:12:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
Subject: Error after updating Poky
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
X-List-Received-Date: Mon, 20 Mar 2017 12:12:41 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I just updated to the latest Poky master (7e0985bab68547) which
replaced rpm-5.4 with rpm-4.13.90 (git).  My builds in an existing
tree now fail:

| 
/build/p7619_2016-02-23/tmp/work/cortexa7hf-neon-amltd-linux-gnueabi/libsolv/0.6.26-r0/recipe-sysroot-native/usr/lib/librpmdb.so: 
file not recognized: File format not recognized
| collect2: error: ld returned 1 exit status
| ext/CMakeFiles/libsolvext.dir/build.make:285: recipe for target 'ext/libsolvext.so.0' failed
| make[2]: *** [ext/libsolvext.so.0] Error 1
| make[2]: Leaving directory '/build/p7619_2016-02-23/tmp/work/cortexa7hf-neon-amltd-linux-gnueabi/libsolv/0.6.26-r0/build'
| CMakeFiles/Makefile2:207: recipe for target 'ext/CMakeFiles/libsolvext.dir/all' failed
| make[1]: *** [ext/CMakeFiles/libsolvext.dir/all] Error 2
| make[1]: Leaving directory '/build/p7619_2016-02-23/tmp/work/cortexa7hf-neon-amltd-linux-gnueabi/libsolv/0.6.26-r0/build'
| Makefile:163: recipe for target 'all' failed
| make: *** [all] Error 2
| ERROR: Function failed: do_compile (log file is located at 
/build/p7619_2016-02-23/tmp/work/cortexa7hf-neon-amltd-linux-gnueabi/libsolv/0.6.26-r0/temp/log.do_compile.8183)
ERROR: Task (/local/poky-cutting-edge/meta/recipes-extended/libsolv/libsolv_0.6.26.bb:do_compile) failed with exit code '1'

Looking at this file shows it's a stale symlink:
$ file 
/build/p7619_2016-02-23/tmp/work/cortexa7hf-neon-amltd-linux-gnueabi/libsolv/0.6.26-r0/recipe-sysroot-native/usr/lib/librpmdb.so
/build/p7619_2016-02-23/tmp/work/cortexa7hf-neon-amltd-linux-gnueabi/libsolv/0.6.26-r0/recipe-sysroot-native/usr/lib/librpmdb.so: 
symbolic link to librpmdb-5.4.so
$ file `readlink 
/build/p7619_2016-02-23/tmp/work/cortexa7hf-neon-amltd-linux-gnueabi/libsolv/0.6.26-r0/recipe-sysroot-native/usr/lib/librpmdb.so`
librpmdb-5.4.so: cannot open `librpmdb-5.4.so' (No such file or directory)

Any ideas how to fix this?

Thanks

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

