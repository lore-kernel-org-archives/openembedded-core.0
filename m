Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D14D660778
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 06:04:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7U6431H016412
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 29 Aug 2018 23:04:03 -0700 (PDT)
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 29 Aug 2018 23:04:02 -0700
To: <openembedded-core@lists.openembedded.org>, Alexander Kanavin
	<alex.kanavin@gmail.com>
References: <20180830033358.117202-1-Randy.MacLeod@windriver.com>
	<7afee083-1906-1b6d-43ff-fc2819b4df0a@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <97653826-b4a4-f5db-8ccf-51b635082e09@windriver.com>
Date: Thu, 30 Aug 2018 02:04:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <7afee083-1906-1b6d-43ff-fc2819b4df0a@windriver.com>
X-Originating-IP: [172.25.44.4]
Subject: Re: [PATCH] openssh: update from 7.7p1 to 7.8p1
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
X-List-Received-Date: Thu, 30 Aug 2018 06:04:03 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 08/29/2018 11:47 PM, Randy MacLeod wrote:
> 
> Builds and works both with and without Alex's patch series:
>     [OE-core] [RFC PATCH 0/6] openssl 1.1.1 update
> 
> but I had not noticed:
>     DEPENDS = "zlib openssl10"

Alex's patch series already fixed that:
     -DEPENDS = "zlib openssl10"
     +DEPENDS = "zlib libressl"
so I don't need to do any additional tests.

libressl+openssh queries below for the curious.

../Randy

root@qemux86-64:~# rpm -qa | grep libressl
libressl-2.8.0-r0.core2_64

root@qemux86-64:~# rpm -qa | grep openssh
openssh-sshd-7.8p1-r0.core2_64
openssh-keygen-7.8p1-r0.core2_64
openssh-ssh-7.8p1-r0.core2_64
openssh-scp-7.8p1-r0.core2_64
openssh-7.8p1-r0.core2_64
packagegroup-core-ssh-openssh-1.0-r1.noarch

root@qemux86-64:~# rpm -qa | grep openssl
openssl-conf-1.1.1+pre9-r0.core2_64
openssl-1.1.1+pre9-r0.core2_64

root@qemux86-64:~# rpm -ql libressl | grep so
/usr/lib/libcrypto.so.43
/usr/lib/libcrypto.so.43.1.0
/usr/lib/libssl.so.45
/usr/lib/libssl.so.45.1.0
/usr/lib/libtls.so.17
/usr/lib/libtls.so.17.1.0

root@qemux86-64:~# ldd /usr/sbin/sshd
         linux-vdso.so.1 (0x00007ffd797f7000)
         libcrypto.so.43 => /usr/lib/libcrypto.so.43 (0x00007fcd91630000)
         libutil.so.1 => /lib/libutil.so.1 (0x00007fcd9162b000)
         libz.so.1 => /lib/libz.so.1 (0x00007fcd91611000)
         libcrypt.so.1 => /usr/lib/libcrypt.so.1 (0x00007fcd915e6000)
         libc.so.6 => /lib/libc.so.6 (0x00007fcd9142c000)
         libpthread.so.0 => /lib/libpthread.so.0 (0x00007fcd9140b000)
         /lib/ld-linux-x86-64.so.2 (0x00007fcd918c8000)

root@qemux86-64:~# ldd /usr/bin/ssh.openssh  | grep crypto
         libcrypto.so.43 => /usr/lib/libcrypto.so.43 (0x00007f7ea43bc000)

> 
> so I'll fix that and re-test if openssl 1.1.1 is accepted.


-- 
# Randy MacLeod
# Wind River Linux

