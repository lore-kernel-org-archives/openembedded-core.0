Return-Path: <victor.kamensky@linaro.org>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 26A31608BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 16:14:55 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id hz10so3684034pad.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2013 09:14:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=p3cOtvNGehBEi27Wdy8S+bz2H0aFcwr3kWZ7y03XuqM=;
	b=AxucOaibTrQojnkJFH9hweXt4xdaCl1JoNAq7E5O1UQhY/a/fLiog+yncj1KBzG4aR
	a6KKqBwACiuyJ/nkfuDSvIwHxtAzjFFxUisFTBSwfS8dDblRNHnWqV4HT/BSiIqZMjs1
	0wGEvjMI+ZmZjNER72ldoqVhHKxmxkVR2O7yWtOdg5fMVKC9F2gtDhuXAUW3apAvZYFf
	boo+ALBSocjoP5s0Ns+Gu0Bws08Vh7JtyenXEOJ6HsUTy077ks0aArecivliHGFr7rJM
	fSC/fiontYaEkcBhSEg1+8KD54XXTlOcpvz/8/MU3ZekzCY/Ggg88jDYDgjZ3GgnwUvj
	iXAQ==
X-Gm-Message-State: ALoCoQkuXg1xryFBlcMtMJSRquZdLQsAXxqEFIsDjDkINAAt3cIz0LK6bWaC+RDE4qy70gYvWTdB
X-Received: by 10.67.23.36 with SMTP id hx4mr7057031pad.54.1375978495992;
	Thu, 08 Aug 2013 09:14:55 -0700 (PDT)
Received: from kamensky-w530.cisco.com.com (128-107-239-234.cisco.com.
	[128.107.239.234])
	by mx.google.com with ESMTPSA id 7sm17339991paf.22.2013.08.08.09.14.54
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 08 Aug 2013 09:14:55 -0700 (PDT)
From: Victor Kamensky <victor.kamensky@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Aug 2013 09:14:28 -0700
Message-Id: <1375978469-15252-1-git-send-email-victor.kamensky@linaro.org>
X-Mailer: git-send-email 1.8.1.4
Cc: patches@linaro.org
Subject: [PATCH 0/1] systemtap: fix build failure on host system with dyninst installed
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
X-List-Received-Date: Thu, 08 Aug 2013 16:14:55 -0000

Building systemap on Fedora 18 got the following failure

DEBUG: Shell function do_configure finished
DEBUG: Executing python function do_qa_configure
NOTE: Checking autotools environment for common misconfiguration
ERROR: This autoconf log indicates errors, it looked at host include and/or library paths while determining system capabilities.
Rerun configure task after fixing this. The path was '/run/media/kamensky/wd/lng/080713/buildle/tmp-eglibc/work/armv7ahf-vfp-neon-oe-linux-gnueabi/systemtap/2.1+gitAUTOINC+addec813fe-r1/git'
DEBUG: Python function do_qa_configure finished
ERROR: Function failed: do_qa_configure

Inside of config log have the following cross compilation
issue:

configure:10017: arm-oe-linux-gnueabi-g++  -march=armv7-a -marm -mthumb-interwork -mfloat-abi=hard -mfpu=neon --sysroot=/run/media/kamensky/wd/lng/080713/buildle/tmp-eglibc/sysroots/genericarmv7a -c -O2 -pipe -g -feliminate-unused-debug-types -fpermissive -fvisibility-inlines-hidden -fstack-protector-all -D_FORTIFY_SOURCE=2  -I/usr/include/dyninst conftest.cpp >&5
cc1plus: warning: include location "/usr/include/dyninst" is unsafe for cross-compilation [-Wpoison-system-directories]
In file included from /usr/include/dyninst/dyntypes.h:158:0,
                 from /usr/include/dyninst/BPatch_object.h:36,
                 from conftest.cpp:74:
/usr/include/dyninst/dyn_regs.h:36:32: fatal error: boost/shared_ptr.hpp: No such file or directory
 #include "boost/shared_ptr.hpp"
                                ^
compilation terminated.

For now simple fix is to disable dyninst with --without-dyninst.
Proposed patch follows this cover letter

Thanks,
Victor

Victor Kamensky (1):
  systemtap: fix build failure on host system with dyninst installed

 meta/recipes-kernel/systemtap/systemtap_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.8.1.4


