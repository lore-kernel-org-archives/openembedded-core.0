Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 610886E48C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2013 04:28:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rBG4SFBg007904
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2013 20:28:15 -0800 (PST)
Received: from [128.224.162.213] (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Sun, 15 Dec 2013 20:28:14 -0800
Message-ID: <52AE819A.8020203@windriver.com>
Date: Mon, 16 Dec 2013 12:29:14 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
X-Originating-IP: [128.224.162.213]
Subject: Problems with INC_RPM_IMAGE_GEN
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
X-List-Received-Date: Mon, 16 Dec 2013 04:28:16 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi All,

Recently I've enabled INC_RPM_IMAGE_GEN on my old and slow build 
machine. Here are two problems I can see with this feature.

1. INC_RPM_IMAGE_GEN and 'rm_work'
If we enable INC_RPM_IMAGE_GEN and 'rm_work' at the same time, we would 
get build failures.
This is because the original rootfs has been removed because of rm_work.

2. INC_RPM_IMAGE_GEN and XXX_POSTPROCESS_COMMAND
Let's first look at a case.
1. build core-image-minimal with 'extrausers' inherited and root 
password set in local.conf
2. build core-image-minimal without 'extrausers' inherited
The image generated in the second step still has the root password set. 
This is not what we want.

The problem in incremental rpm image generation is that it chooses the 
final image as a starting point.
However, the final image has been tweaked by all those 
XXX_POSTPROCESS_COMMAND.
For example, the 'debug-tweaks' IMAGE_FEATURE will lead to several 
additonal ROOTFS_POSTPROCESS_COMMAND.
meta/classes/image.bbclass:# Allow dropbear/openssh to accept logins 
from accounts with an empty password string if debug-tweaks is enabled
meta/classes/image.bbclass:ROOTFS_POSTPROCESS_COMMAND += 
'${@base_contains("IMAGE_FEATURES", "debug-tweaks", 
"ssh_allow_empty_password; ", "",d)}'
meta/classes/image.bbclass:# Enable postinst logging if debug-tweaks is 
enabled
meta/classes/image.bbclass:ROOTFS_POSTPROCESS_COMMAND += 
'${@base_contains("IMAGE_FEATURES", "debug-tweaks", 
"postinst_enable_logging; ", "",d)}'

IMHO, the rootfs after all packages installed and before all postprocess 
commands running should serve as the reference rootfs for the 
incremental rpm image generation.
But I cannot figure out a reasonable solution which doesn't have much 
performance impact.

Any idea or suggestion?

Best Regards,
Chen Qi

