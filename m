Return-Path: <alexey.brodkin@synopsys.com>
X-Greylist: delayed 501 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 20 Mar 2019 07:50:40 UTC
Received: from smtprelay.synopsys.com (smtprelay4.synopsys.com [198.182.47.9])
	by mail.openembedded.org (Postfix) with ESMTP id 0A3BD7CD91
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 07:50:40 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
	[10.192.0.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtprelay.synopsys.com (Postfix) with ESMTPS id 7E0F224E06C5;
	Wed, 20 Mar 2019 00:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1553067740; bh=LR1ZNU9hNmqWrCTSVLqPpYb24RdMy9USr3MvWplaRm0=;
	h=From:To:CC:Subject:Date:From;
	b=OV9s1Npi+t8gM7VLLpVx9kzvZV0Pc/cnUMvjfE1LZ7C2dqv796tMjEU3mhDiIGu7S
	AIMtCFTesDKPhIW9R7lBuLMm6qoHIkyuy3FEFfQ2umSgdLRbd45lGMFAd7Hrnxk8gA
	tComKNnVYneU3n7U9wDRQvknNCt2X8/Bh70lmLzGX0DNDwdPWMF9oQ2kAC0/QDJqdc
	ft6I3f5H7QZ/BaLGcR2e3hChi5Qnyptl5QId2Ob8ur8RWt0f4Cnv81xg73WQX43xju
	GFg6jJ4OBz/z0zdcChoPiJnhdH87iktkYX6gM75zndoWIzWKzny8XQQV/PtjY/JLxP
	Ncp6+o6n2M15w==
Received: from US01WEHTC3.internal.synopsys.com
	(us01wehtc3.internal.synopsys.com [10.15.84.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mailhost.synopsys.com (Postfix) with ESMTPS id 19EB7A0079;
	Wed, 20 Mar 2019 07:42:19 +0000 (UTC)
Received: from DE02WEHTCA.internal.synopsys.com (10.225.19.92) by
	US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Wed, 20 Mar 2019 00:42:19 -0700
Received: from DE02WEMBXA.internal.synopsys.com ([fe80::a014:7216:77d:d55c])
	by DE02WEHTCA.internal.synopsys.com ([::1]) with mapi id 14.03.0415.000;
	Wed, 20 Mar 2019 08:42:17 +0100
From: Alexey Brodkin <alexey.brodkin@synopsys.com>
To: Kai Kang <kai.kang@windriver.com>
Thread-Topic: qemu: backport patches to fix cves breaks qemu-system-native
Thread-Index: AdTe7+qwmvsUURxbRQOHAa7d7YdYyQ==
Date: Wed, 20 Mar 2019 07:42:16 +0000
Message-ID: <4881796E12491D4BB15146FE0209CE6468224B73@de02wembxa.internal.synopsys.com>
Accept-Language: en-US, ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.225.15.89]
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: qemu: backport patches to fix cves breaks qemu-system-native
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
X-List-Received-Date: Wed, 20 Mar 2019 07:50:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Kai Kang,

You recent changes in QEMU [1] lead to build failure:
-------------------------------------->8-----------------------------------=
--
# bitbake qemu-system-native
...
| .../build/tmp-glibc/work/x86_64-linux/qemu-system-native/3.1.0-r0/qemu-3.=
1.0/hw/rdma/rdma_backend.c:316:42: error: 'VENDOR_ERR_INV_NUM_SGE' undeclar=
ed (first use in this function)
|          comp_handler(IBV_WC_GENERAL_ERR, VENDOR_ERR_INV_NUM_SGE, ctx);
|                                           ^
-------------------------------------->8-----------------------------------=
--

That's obviously because of meta/recipes-devtools/qemu/qemu/0015-fix-CVE-20=
18-20124.patch.

I'm wondering if you tried to build QEMU yourself?

[1] https://github.com/openembedded/openembedded-core/commit/489ece1aa90d8f=
76b4c1f009d837f82e38e11ba9

-Alexey

