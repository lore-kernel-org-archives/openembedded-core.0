Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B3EE26FF9F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 15:06:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9BF59De031899
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 11 Oct 2018 08:06:08 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Thu, 11 Oct 2018 08:05:14 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 11 Oct 2018 22:24:16 +0800
Message-ID: <cover.1539267480.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] nss: fix non-determinism when create blank certificate
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
X-List-Received-Date: Thu, 11 Oct 2018 15:06:33 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Test on qemux86-64 qemuarm qemumips64 and qemuppc
1 bitbake core-image-sato
2 boot image
3 run some certutil commands to list create delete certificate and works well

root@qemuppc:~# certutil -L -d /etc/pki/nssdb/

Certificate Nickname                                         Trust Attributes
                                                             SSL,S/MIME,JAR/XPI

root@qemuppc:~# certutil -U -d sql:/etc/pki/nssdb/

    slot: NSS User Private Key and Certificate Services
   token: NSS Certificate DB
     uri: pkcs11:token=NSS%20Certificate%20DB;manufacturer=Mozilla%20Foundation;serial=0000000000000000;model=NSS%203

    slot: NSS Internal Cryptographic Services
   token: NSS Generic Crypto Services
     uri: pkcs11:token=NSS%20Generic%20Crypto%20Services;manufacturer=Mozilla%20Foundation;serial=0000000000000000;model=NSS%203
root@qemuppc:~# certutil -K -d sql:/etc/pki/nssdb/
certutil: Checking token "NSS Certificate DB" in slot "NSS User Private Key and Certificate Services"
certutil: no keys found

root@qemuppc:~# certutil -S -d sql:/etc/pki/nssdb/ -s "CN=Example CA" -n my-ca-cert -x -t "C,C,C" -1 -2 -5 -m 3650
...

root@qemuppc:~# certutil -L -d /etc/pki/nssdb/

Certificate Nickname                                         Trust Attributes
                                                             SSL,S/MIME,JAR/XPI

my-ca-cert                                                   Cu,Cu,Cu
root@qemuppc:~# certutil -K -d /etc/pki/nssdb/
certutil: Checking token "NSS Certificate DB" in slot "NSS User Private Key and Certificate Services"
< 0> rsa      df1dfdd0f643f7821daea44ea4f3a2125db4e2b3   NSS Certificate DB:my-ca-cert
root@qemuppc:~# certutil -D -d sql:/etc/pki/nssdb/ -n "my-ca-cert"
root@qemuppc:~# certutil -L -d /etc/pki/nssdb/

Certificate Nickname                                         Trust Attributes
                                                             SSL,S/MIME,JAR/XPI

root@qemuppc:~# certutil -K -d /etc/pki/nssdb/
certutil: Checking token "NSS Certificate DB" in slot "NSS User Private Key and Certificate Services"
< 0> rsa      df1dfdd0f643f7821daea44ea4f3a2125db4e2b3   (orphan)
root@qemuppc:~#


The following changes since commit 8a2e53b525ebc4f50c7384af056cbe67a3913282:

  libxml2: Make it compatible with externalsrc (2018-10-10 17:59:09 +0100)

are available in the Git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/nss
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/nss

Kai Kang (1):
  nss: fix non-determinism when create blank certificate

 meta/recipes-support/nss/nss/blank-cert9.db    | Bin 0 -> 28672 bytes
 meta/recipes-support/nss/nss/blank-key4.db     | Bin 0 -> 36864 bytes
 meta/recipes-support/nss/nss/system-pkcs11.txt |   5 +++++
 meta/recipes-support/nss/nss_3.38.bb           |  16 ++++++++--------
 4 files changed, 13 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-support/nss/nss/blank-cert9.db
 create mode 100644 meta/recipes-support/nss/nss/blank-key4.db
 create mode 100644 meta/recipes-support/nss/nss/system-pkcs11.txt

--
2.18.0


