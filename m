Return-Path: <v.vogelhuber@digitalendoscopy.de>
Received: from mx-relay11-hz1.antispameurope.com
	(mx-relay11-hz1.antispameurope.com [94.100.132.211])
	by mail.openembedded.org (Postfix) with ESMTP id D3BC078855
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 21:08:54 +0000 (UTC)
Received: from ptr-128.65.149.218.static.lewtelnet-access.de
	([128.65.149.218]) by mx-relay11-hz1.antispameurope.com; 
	Thu, 01 Feb 2018 22:08:54 +0100
Received: from [192.168.20.187] (192.168.20.187) by srv-msx01.digitendos.de
	(192.168.20.14) with Microsoft SMTP Server (TLS) id 15.0.516.32;
	Thu, 1 Feb 2018 22:08:04 +0100
To: <openembedded-core@lists.openembedded.org>
From: Volker Vogelhuber <v.vogelhuber@digitalendoscopy.de>
Message-ID: <5dbcb135-094c-d17e-a297-238bc3656435@digitalendoscopy.de>
Date: Thu, 1 Feb 2018 22:08:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
X-Originating-IP: [192.168.20.187]
X-ClientProxiedBy: srv-msx01.digitendos.de (192.168.20.14) To
	srv-msx01.digitendos.de (192.168.20.14)
X-cloud-security-sender: v.vogelhuber@digitalendoscopy.de
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on
	mx-relay11-hz1.antispameurope.com with 25695AE02A4
X-cloud-security-connect: ptr-128.65.149.218.static.lewtelnet-access.de[128.65.149.218],
	TLS=1, IP=128.65.149.218
X-cloud-security: scantime:.1808
Subject: build-sysroots deletes wic imagedata environment variables
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
X-List-Received-Date: Thu, 01 Feb 2018 21:08:55 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

It seems like build-sysroots does clean the sysroot directories. This 
has the effect that the imagedata folder within the sysroots dir is 
removed as well. That imagedata folder is created by the 
do_rootfs_wicenv task. Unfortunately the state of the task seems not to 
be reset when calling bitbake build-sysroots. So the imagedata folder is 
not recreated anymore when one calls bitbake again with an image recipe. 
The only way to recreate it seems to call bitbake with -f parameter to 
force a taint of the hash for the do_rootfs_wicenv task.
Is there a better solution?

