Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3CB4465E38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Dec 2014 10:54:26 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id n3so8583661wiv.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Dec 2014 02:54:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:content-type:content-transfer-encoding;
	bh=MPOlG6cYDuCGAv3XdNpbkWUb+A48yOay2X3NQoo3ltA=;
	b=MbKiKEMBtJ8EuFTV6TyWpEvJZ5jSOy33lzS+sThDbejANWQgBGokzlXeEZjF7mFw4Q
	udAhfOQw0wXr458JwK3lFKkReXKdCPbpeZq7eYbNVi/44Ja3eWjF5F0h/DmL9cAiFPqr
	YRUluyPLkcfO16514HzrxyMwu9VoGRn/QRpnGugYScihlGbvOZoSL1itW1PZWEqOJoNz
	w48FngRFmndKyV5IBOT8H43wtody33Ar9caA0CpcTlFmv5nZyDT4JDdEguoEZxX7/U7t
	bxRNxN6FmTFcWlya30NU1sfS9HQqWL0ZBivM8mAHnEStKuABCy1EQJ7xLMluUb8akdlm
	vTlg==
X-Gm-Message-State: ALoCoQmmmX0RGVbo+PGc+8WbypJjyDl1/vojCxDQuu0yY5cvgUUMl12vzVO+ofx6GJUcsOpkE3lf
X-Received: by 10.180.221.201 with SMTP id qg9mr30467776wic.29.1418640866029; 
	Mon, 15 Dec 2014 02:54:26 -0800 (PST)
Received: from [172.29.23.6] (zk223.dresearch-fe.de. [217.92.177.116])
	by mx.google.com with ESMTPSA id
	cz3sm12563394wjb.23.2014.12.15.02.54.25 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Dec 2014 02:54:25 -0800 (PST)
Message-ID: <548EBDE0.3080704@dresearch-fe.de>
Date: Mon, 15 Dec 2014 11:54:24 +0100
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: "qemu-arm udevadm hwdb --update" eats swap space after build host update to openSUSE 13.2
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
X-List-Received-Date: Mon, 15 Dec 2014 10:54:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

After updating our build host from openSUSE 13.1 to 13.2 we're no longer able to build our images with OE (with 13.1 on the same host everything worked well). :(

The first thing we observed was that the do_rootfs stage made a very big load (more than 500) on the machine but the cpu's aren't working for 100%. I could track down the problem to the call

qemu-arm -r 2.6.32 -L /pm/sledz/hipos-dfe.dizzy/build-closed/tmp-glibc/work/hikirk-angstrom-linux-gnueabi/hydraip-prodimage/1.0-r0+r16+r17.5/rootfs -E LD_LIBRARY_PATH=/pm/sledz/hipos-dfe.dizzy/build-closed/tmp-glibc/work/hikirk-angstrom-linux-gnueabi/hydraip-prodimage/1.0-r0+r16+r17.5/rootfs/usr/lib:/pm/sledz/hipos-dfe.dizzy/build-closed/tmp-glibc/work/hikirk-angstrom-linux-gnueabi/hydraip-prodimage/1.0-r0+r16+r17.5/rootfs/lib /pm/sledz/hipos-dfe.dizzy/build-closed/tmp-glibc/work/hikirk-angstrom-linux-gnueabi/hydraip-prodimage/1.0-r0+r16+r17.5/rootfs/bin/udevadm hwdb --update --root /pm/sledz/hipos-dfe.dizzy/build-closed/tmp-glibc/work/hikirk-angstrom-linux-gnueabi/hydraip-prodimage/1.0-r0+r16+r17.5/rootfs

which eats swap space without end till the system crashes (more than 100GB swap space ist available).

I've no idea how to inspect this problem further. Any ideas?

Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

