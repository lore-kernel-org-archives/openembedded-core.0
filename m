Return-Path: <zboszor@pr.hu>
Received: from mail7.pr.hu (mail7.pr.hu [87.242.0.7])
	by mail.openembedded.org (Postfix) with ESMTP id 0F78D6C176
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 09:54:06 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>) id 1gMrs7-0005eA-DM
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2018 10:54:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
	Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=T7YTm4zbVoPkmDmGsb2j1Dh6iq0VKzF4dycF+W23DQA=;
	b=emOE8QlDrrhZLoiTxlbD8vz+DW
	CBBh4QpYCwz/69zngjE1sNyOROLfFphpQpSmnnF3WYJolPEw0GvnB3F8MDjJzBwQ0hl2ZZfdUv4ER
	k77z2aiZI08WhqMPxOTERnyt7bjWtAOXTLQ0ennlkflHS7zNhm49+xczc5itx8DmTp7Nvp1FC8dNo
	6Ww9YzdcQtG72jkXU6Bhl2fjxE5u+5Q41HHxnnxAs9zLnLp6xK3/1piGncU43+JFy6Co2PJGfBm7Z
	cDa0hVEDJW+4kko31HtPl8YQrRfeOyPagzSCtwIUiIzlfRPLpn6Zg+IWXexYG2ns+8Tpe8KGsMfJb
	ReyhIj8g==;
Received: from host-87-242-20-26.prtelecom.hu ([87.242.20.26]
	helo=localhost.localdomain)
	by mail.pr.hu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <zboszor@pr.hu>) id 1gMrs1-0003YC-Cb
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2018 10:54:05 +0100
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Message-ID: <ff1a7a90-4a1e-f3d8-8c9f-8563f7847a71@pr.hu>
Date: Wed, 14 Nov 2018 10:53:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
X-Spam-Score: -1.1 (-)
X-Scan-Signature: 7572fbe1482f51d378d5cb517c4344f1
X-Spam-Tracer: backend.mail.pr.hu -1.1 20181114095405Z
Subject: dracut is impossible to run in do_rootfs
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
X-List-Received-Date: Wed, 14 Nov 2018 09:54:07 -0000
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi,

I need to create the initramfs for the target build during
do_rootfs using dracut to include systemd and plymouth into it and
using the modules from the kernel version the image was built with.
Currently I am on Yocto 2.5.

There are several problem I am facing.

First, the dracut recipe needs some fixes in the
RDEPENDS/RRECOMMENDS clauses to only use subpackages of the
recipes it depends on in class-target only. I could fix this
with a bbappend file.

Then, all the packages in the system that use the
update-alternatives.bbclass have unusable symlinks during the
do_rootfs stage.

E.g. coreutils's binaries use this:

zboszormenyi@buildbox-0001 rootfs]$ ls -l usr/bin/[
lrwxrwxrwx 1 zboszormenyi zboszormenyi 27 nov   14 03.51 usr/bin/[ -> 
/usr/bin/lbracket.coreutils

Of course, the target of the symlink does not exist on
the build host. As a consequence, dracut will not find anything
that it needs to copy to the initramfs.

Is there a way to tell update-alternatives.bbclass (e.g. globally
from my layer.conf) to just use the relative symlink it is given?

Thanks in advance,
Zoltán Böszörményi

