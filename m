Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8F3826DC27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 10:15:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2QAFukl004603
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 03:15:56 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.169.1; Wed, 26 Mar 2014 03:15:55 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Mar 2014 18:15:56 +0800
Message-ID: <cover.1395825881.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [PATCH 0/3] Replace ocf-linux with cryptodev-linux
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
X-List-Received-Date: Wed, 26 Mar 2014 10:15:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Replace ocf-linux with cryptodev-linux because linux-yocto use cryptodev-linux to implement /dev/crypto.

Build for qemux86 and qemuarm. Test on qemux86.

Test steps:
1 set CONFIG_CRYPTODEV for linux-yocto by menuconfig
  Cryptographic API  ---> cryptodev module support

2 bitbake core-image-sato
3 test openssl on target:
3.1 load kernel module cryptodev first
root@qemux86:~# modprobe cryptodev

3.2 test openssl
root@qemux86:~# echo "test" > test.txt

root@qemux86:~# openssl aes-128-cbc -salt -engine cryptodev -in test.txt -out test.txt.aes
engine "cryptodev" set.
enter aes-128-cbc encryption password:
Verifying - enter aes-128-cbc encryption password:

root@qemux86:~# openssl aes-128-cbc -d -salt -engine cryptodev -in test.txt.aes -out test.txt.out
engine "cryptodev" set.
enter aes-128-cbc decryption password:		<-- input wrong password here
bad decrypt
3078080188:error:06065064:digital envelope routines:EVP_DecryptFinal_ex:bad decrypt:evp_enc.c:539:

root@qemux86:~# openssl aes-128-cbc -d -salt -engine cryptodev -in test.txt.aes -out test.txt.out
engine "cryptodev" set.
enter aes-128-cbc decryption password:

root@qemux86:~# ls -l
-rw-r--r--    1 root     root             5 Mar 26 10:07 test.txt
-rw-r--r--    1 root     root            32 Mar 26 10:08 test.txt.aes
-rw-r--r--    1 root     root             5 Mar 26 10:09 test.txt.out
root@qemux86:~# cat test.txt.aes
Salted__�0�c5'A�vU���`root@qemux86:~# 
root@qemux86:~# cat test.txt.out
test
root@qemux86:~# 


The following changes since commit 39846ddbce87d26eb68870914bf86a8ce5e86e5c:

  bitbake: data_smart: Fix caching issue for double remove references (2014-03-25 22:28:42 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib kangkai/ocf-linux
  http://git.yoctoproject.org/cgit.cgi//log/?h=kangkai/ocf-linux

Kai Kang (3):
  cryptodev-linux: add recipe
  openssl: replace dependency ocf-linux with cryptodev-linux
  ocf-linux: remove recipe

 .../openssl/cryptodev-linux_1.6.bb                 | 22 ++++++++++++++++++++
 meta/recipes-connectivity/openssl/ocf-linux.inc    | 24 ----------------------
 .../openssl/ocf-linux_20120127.bb                  |  6 ------
 .../recipes-connectivity/openssl/openssl_1.0.1e.bb |  2 +-
 4 files changed, 23 insertions(+), 31 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/cryptodev-linux_1.6.bb
 delete mode 100644 meta/recipes-connectivity/openssl/ocf-linux.inc
 delete mode 100644 meta/recipes-connectivity/openssl/ocf-linux_20120127.bb

-- 
1.8.1.2


