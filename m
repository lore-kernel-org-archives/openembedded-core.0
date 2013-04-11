Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1UQHnn-0005ZE-30
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Apr 2013 15:44:40 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r3BDRA2q013657
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2013 06:27:10 -0700 (PDT)
Received: from yow-bashfiel-d3.corp.ad.wrs.com (128.224.145.220) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 11 Apr 2013 06:27:10 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Apr 2013 06:27:00 -0700
Message-ID: <15fb7e2183e4a99e3031b16accb98722cb8959c3.1365686481.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1365686481.git.bruce.ashfield@windriver.com>
References: <cover.1365686481.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/8] linux/yocto: update AUTOFS configuration
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Apr 2013 13:44:57 -0000
Content-Type: text/plain

When systemd is enabled, qemumips failed to boot with the following trace:

    Reserved instruction in kernel code[#1]:
    Cpu 0
    $ 0   : 00000000 80232500 c0011000 80000000
    $ 4   : c0017440 00000000 87032400 8704b000
    $ 8   : 00000000 00000000 00000010 003fffff
    $12   : 00000000 7fafbab4 00000000 87d6fbb0
    $16   : 87f98780 c0017440 c0017440 00000000
    $20   : 8704a000 00000000 8704a000 00000000
    $24   : 00000010 80480630
    $28   : 87c22000 87c23e28 7fafbc00 80232408
    Hi    : 00000000
    Lo    : 00000000
    epc   : c0011000 autofs_mount+0x0/0x30 [autofs4]
	Not tainted
    ra    : 80232408 mount_fs+0x68/0x200
    Status: 1000a403    KERNEL EXL IE
    Cause : d0808028
    PrId  : 00019300 (MIPS 24Kc)
    Modules linked in: autofs4
    Process systemd (pid: 1, threadinfo=87c22000, task=87c28000, tls=77787490)
    Stack : 809b3e28 802512bc 00000000 808b0da4 87f3d310 87936c38 87032400 8704b000
	    87f98780 c0017440 00000020 8704b000 87032400 87032480 00000000 80251a2c
	    00000006 8022f7fc 87032480 802507f0 00000000 87032400 8704b000 7fafba94
	    00000000 c0017440 8088275c 80253f40 7fafb9d0 00000016 38513fac 0051b2a8
	    8704b000 801df604 00000000 0000000a 87f5c000 801f5968 87f3d310 87936c38
	    ...
    Call Trace:
    [<c0011000>] autofs_mount+0x0/0x30 [autofs4]
    [<80232408>] mount_fs+0x68/0x200
    [<80251a2c>] vfs_kern_mount+0x68/0x114
    [<80253f40>] do_mount+0x218/0x9d0
    [<8025479c>] sys_mount+0xa4/0xec
    [<8010c07c>] stack_done+0x20/0x44

The policy of building AUTOFS as a module is something that can be
changed, since boot processes that use automounting can take advantage
of the built in support to reduce complexity.

The size increase of the base policy is small with this change, and
users of the linux-yocto kernel can still override this value, which
is exactly what the poky-tiny kernel does.

Keeping the configuration consistent for all boards, and not adding
and exception for qemumips makes sense in this case.

[YOCTO #4129]

(From OE-Core rev: 3570cf11b7dfa6991c43bb041abb9d47cc6f0d70)

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.8.bb    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
index 903fcb5..3632a28 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
@@ -10,7 +10,7 @@ KMETA = "meta"
 
 SRCREV_machine ?= "abd0728b164f651292374e96251ee197b50e3c02"
 SRCREV_machine_qemuppc ?= "1619988b773840ec546292a9cd65dda99d55b96c"
-SRCREV_meta ?= "1b534b2f8bbe9b8a773268cfa30a4850346f6f5f"
+SRCREV_meta ?= "70dac5a56c245ca01d2d4e18fc2c9fb112749bf3"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.8.bb b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
index 10fc693..c589fa0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
@@ -9,7 +9,7 @@ SRCREV_machine_qemuppc ?= "f8848d222d1fcd1ebc517d28f289735621708449"
 SRCREV_machine_qemux86 ?= "42ddf06111efe45f3c36012d5a04a1eeb9781f42"
 SRCREV_machine_qemux86-64 ?= "42ddf06111efe45f3c36012d5a04a1eeb9781f42"
 SRCREV_machine ?= "42ddf06111efe45f3c36012d5a04a1eeb9781f42"
-SRCREV_meta ?= "1b534b2f8bbe9b8a773268cfa30a4850346f6f5f"
+SRCREV_meta ?= "70dac5a56c245ca01d2d4e18fc2c9fb112749bf3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.8.git;protocol=git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
1.7.10.4



