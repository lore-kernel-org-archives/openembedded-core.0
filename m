Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1B95F7665F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 16:44:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v0NGitdx007367
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 08:44:55 -0800 (PST)
Received: from yow-pgortmak-d1.corp.ad.wrs.com (128.224.56.57) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 23 Jan 2017 08:44:54 -0800
Received: by yow-pgortmak-d1.corp.ad.wrs.com (Postfix, from userid 1000)	id
	A74D928052F; Mon, 23 Jan 2017 11:44:54 -0500 (EST)
Date: Mon, 23 Jan 2017 11:44:54 -0500
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20170123164454.GT29778@windriver.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: do_populate_sysroot: Function failed: relocatable_binaries_preprocess
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
X-List-Received-Date: Mon, 23 Jan 2017 16:44:56 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

After updating this morning (everything on master, re-using the existing
build dir that was built OK within the last 48h) I saw this:

ERROR: pseudo-native-1.8.1-r0 do_populate_sysroot: pseudo-native: chrpath command failed with exit code 7:
b'/home/paul/poky/build/tmp/work/x86_64-linux/pseudo-native/1.8.1-r0/sysroot-destdir/home/paul/poky/build/tmp/work/x86_64-linux/pseudo-native/1.8.1-r0/recipe-sysroot-native/usr/bin/pseudodb:
RPATH=/home/paul/poky/build/tmp/sysroots/x86_64-linux/usr/lib:/home/paul/poky/build/tmp/sysroots/x86_64-linux/lib\n'b"new
rpath
'$ORIGIN/../../../../../../../sysroots/x86_64-linux/usr/lib:$ORIGIN/../../../../../../../sysroots/x86_64-linux/lib' too large; maximum length 107\n"
ERROR: pseudo-native-1.8.1-r0 do_populate_sysroot: Function failed: relocatable_binaries_preprocess
ERROR: Logfile of failure stored in: /home/paul/poky/build/tmp/work/x86_64-linux/pseudo-native/1.8.1-r0/temp/log.do_populate_sysroot.11

I did a cleansstate on that and then it was fine but then openssl died
in the same way:

ERROR: openssl-native-1.0.2j-r0 do_populate_sysroot: openssl-native: chrpath command failed with exit code 7:
b'/home/paul/poky/build/tmp/work/x86_64-linux/openssl-native/1.0.2j-r0/sysroot-destdir/home/paul/poky/build/tmp/work/x86_64-linux/openssl-native/1.0.2j-r0/recipe-sysroot-native/usr/lib/libssl.so.1.0.0: RPATH=/home/paul/poky/build/tmp/sysroots/x86_64-linux/usr/lib:/home/paul/poky/build/tmp/sysroots/x86_64-linux/lib\n'b"new rpath '$ORIGIN/../../../../../../../sysroots/x86_64-linux/usr/lib:$ORIGIN/../../../../../../../sysroots/x86_64-linux/lib' too large; maximum length 107\n"
ERROR: openssl-native-1.0.2j-r0 do_populate_sysroot: Function failed: relocatable_binaries_preprocess
ERROR: Logfile of failure stored in: /home/paul/poky/build/tmp/work/x86_64-linux/openssl-native/1.0.2j-r0/temp/log.do_populate_sysroot.7182
ERROR: Task (virtual:native:/home/paul/poky/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb:do_populate_sysroot) failed with exit code '1'

I mentioned it to Mark and he suggested I should mention it here.

P.



