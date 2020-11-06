Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by mx.groups.io with SMTP id smtpd.web09.9389.1604653693457939248
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2020 01:08:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denx.de, ip: 212.18.0.9, mailfrom: ch@denx.de)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4CSF0Y0L9Lz1qt3g;
	Fri,  6 Nov 2020 10:07:57 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 4CSF0X6rc7z1qsXP;
	Fri,  6 Nov 2020 10:07:56 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id w0xh3HaQ-zjf; Fri,  6 Nov 2020 10:07:55 +0100 (CET)
X-Auth-Info: YICA7RGu42HnGmNUzkU/EeiEbb4H3/qcMh/2T4Wviqo=
Received: from [10.88.0.186] (dslb-088-074-220-167.088.074.pools.vodafone-ip.de [88.74.220.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Fri,  6 Nov 2020 10:07:55 +0100 (CET)
From: "Claudius Heine" <ch@denx.de>
Subject: [RESEND for ML] wic: imager/direct: passno is set to 0 for all entries in the fstab
To: openembedded-core@lists.openembedded.org,
 Henning Schild <henning.schild@siemens.com>,
 Tom Zanussi <tom.zanussi@linux.intel.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Organization: Denx Software Engineering
Message-ID: <d99177cb-0258-dc14-6f39-8b00e2b64415@denx.de>
Date: Fri, 6 Nov 2020 10:07:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

I looked into periodic file system checks for ext* partitions, in order 
to increase robustness for systems that use those file systems and was 
surprised that the fstab that wic generates that `0` hard coded as the 
passno parameter [1]. This prevents for instance systemd-fsck@(8) [2] 
from running checks on those file systems.

It seems that wic/mic generated a fstab with passno=0 from the beginning 
[3]. What is the reason for that? Was it a conscious decision to do 
that, or just copy&paste for a different project?

How would a way forward look like? Should a patch that changes passno 
from 0 to 2 be enough, or do we rather have this parameter configurable 
somehow?

regards,
Claudius Heine

[1] 
https://git.openembedded.org/openembedded-core/tree/scripts/lib/wic/plugins/imager/direct.py?id=a59c246be05ca284fa27df87b5db09a70f527cc2#n141
[2] 
https://manpages.debian.org/stretch/systemd/systemd-fsck@.service.8.en.html
[3] 
https://git.openembedded.org/openembedded-core/tree/scripts/lib/mic/imager/direct.py?id=f87acc5e59d3c2c39ff171b5557977dab4c8f4a6#n110

-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-54 Fax: (+49)-8142-66989-80 Email: ch@denx.de

            PGP key: 6FF2 E59F 00C6 BC28 31D8 64C1 1173 CB19 9808 B153
                              Keyserver: hkp://pool.sks-keyservers.net
